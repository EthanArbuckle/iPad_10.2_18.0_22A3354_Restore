@implementation NSNumber(KGPropertyTypeProtocol)

- (uint64_t)kgPropertyType
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (CFNumberIsFloatType((CFNumberRef)v1))
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "compare:", &unk_1E83F6040) == 1)
  {
    v2 = 4;
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

@end
