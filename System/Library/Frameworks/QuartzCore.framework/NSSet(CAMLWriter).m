@implementation NSSet(CAMLWriter)

- (const)CAMLType
{
  return CFSTR("NSSet");
}

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t i;

  v4 = (void *)objc_msgSend(a1, "allObjects");
  result = objc_msgSend(v4, "count");
  if (result)
  {
    v6 = result;
    for (i = 0; i != v6; ++i)
      result = objc_msgSend(a3, "encodeObject:", objc_msgSend(v4, "objectAtIndex:", i));
  }
  return result;
}

@end
