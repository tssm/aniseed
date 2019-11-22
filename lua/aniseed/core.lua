local view = require("aniseed.view")
local function filter(f, xs)
  local result = {}
  for _, x in ipairs(xs) do
    if f(x) then
      table.insert(result, x)
    end
  end
  return result
end
local function map(f, xs)
  local result = {}
  for _, x in ipairs(xs) do
    table.insert(result, f(x))
  end
  return result
end
local function reduce(f, init, xs)
  local result = init
  for _, x in ipairs(xs) do
    result = f(result, x)
  end
  return result
end
local function run_21(f, xs)
  for _, x in ipairs(xs) do
    f(x)
  end
  return nil
end
local function concat(...)
  local result = {}
  local function _0_(xs)
    for _, x in ipairs(xs) do
      table.insert(result, x)
    end
    return nil
  end
  run_21(_0_, {...})
  return result
end
local function inc(n)
  return (n + 1)
end
local function dec(n)
  return (n - 1)
end
local function slurp(path)
  local _0_0, _1_0 = io.open(path, "r")
  if ((_0_0 == nil) and (nil ~= _1_0)) then
    local msg = _1_0
    return print(("Could not open file: " .. msg))
  elseif (nil ~= _0_0) then
    local f = _0_0
    do
      local content = f:read("*all")
      f:close()
      return content
    end
  end
end
local function spit(path, content)
  local _0_0, _1_0 = io.open(path, "w")
  if ((_0_0 == nil) and (nil ~= _1_0)) then
    local msg = _1_0
    return print(("Could not open file: " .. msg))
  elseif (nil ~= _0_0) then
    local f = _0_0
    do
      f:write(content)
      f:close()
      return nil
    end
  end
end
local function first(xs)
  if xs then
    return xs[1]
  end
end
local function second(xs)
  if xs then
    return xs[2]
  end
end
local function string_3f(x)
  return ("string" == type(x))
end
local function nil_3f(x)
  return ("nil" == type(x))
end
local function table_3f(x)
  return ("table" == type(x))
end
local function pr_str(...)
  local function _0_(x)
    return view(x, {["one-line"] = true})
  end
  return unpack(map(_0_, {...}))
end
local function pr(...)
  return print(pr_str(...))
end
return {["aniseed/module"] = "aniseed.core", ["nil?"] = nil_3f, ["pr-str"] = pr_str, ["run!"] = run_21, ["string?"] = string_3f, ["table?"] = table_3f, dec = dec, filter = filter, first = first, inc = inc, map = map, pr = pr, second = second, slurp = slurp, spit = spit}
