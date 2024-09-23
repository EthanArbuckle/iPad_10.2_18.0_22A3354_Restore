@implementation NSNumber(AuthKit)

- (BOOL)ak_isBoolean
{
  CFTypeID TypeID;

  TypeID = CFBooleanGetTypeID();
  return CFGetTypeID(a1) == TypeID;
}

- (id)ak_BOOLeanAsInteger
{
  id v2;

  if (objc_msgSend(a1, "ak_isBoolean"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "integerValue"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (uint64_t)ak_bucketWithSize:()AuthKit
{
  uint64_t result;

  if (objc_msgSend(a1, "integerValue") < 1)
    return 0;
  result = objc_msgSend(a1, "integerValue");
  if (a3 >= 2)
    return a3 + a3 * ((result - 1) / a3);
  return result;
}

@end
