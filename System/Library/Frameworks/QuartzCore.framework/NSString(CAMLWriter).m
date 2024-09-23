@implementation NSString(CAMLWriter)

- (const)CAMLType
{
  return CFSTR("string");
}

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  return objc_msgSend(a3, "setElementContent:", a1);
}

@end
