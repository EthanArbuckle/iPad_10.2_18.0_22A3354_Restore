@implementation NSArray(CAMLWriter)

- (const)CAMLType
{
  return CFSTR("NSArray");
}

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  uint64_t result;
  uint64_t v6;
  uint64_t i;

  result = objc_msgSend(a1, "count");
  if (result)
  {
    v6 = result;
    for (i = 0; i != v6; ++i)
      result = objc_msgSend(a3, "encodeObject:", objc_msgSend(a1, "objectAtIndex:", i));
  }
  return result;
}

@end
