@implementation NSNumber(NUSchemaAdditions)

- (BOOL)nu_isFloat
{
  return CFNumberIsFloatType(a1) == 1;
}

- (uint64_t)nu_isInteger
{
  return objc_msgSend(a1, "nu_isFloat") ^ 1;
}

- (uint64_t)nu_isBoolean
{
  uint64_t result;

  result = objc_msgSend(a1, "nu_isInteger");
  if ((_DWORD)result)
    return (unint64_t)objc_msgSend(a1, "integerValue") < 2;
  return result;
}

- (uint64_t)nu_isNaN
{
  uint64_t result;

  result = objc_msgSend(a1, "nu_isFloat");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "doubleValue");
    return 0;
  }
  return result;
}

- (uint64_t)nu_isInfinite
{
  uint64_t result;
  double v3;

  result = objc_msgSend(a1, "nu_isFloat");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "doubleValue");
    return fabs(v3) == INFINITY;
  }
  return result;
}

@end
