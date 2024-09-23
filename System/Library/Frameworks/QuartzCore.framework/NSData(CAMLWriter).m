@implementation NSData(CAMLWriter)

- (const)CAMLType
{
  return CFSTR("NSData");
}

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  return objc_msgSend(a3, "setElementContent:", objc_msgSend(a1, "base64EncodedStringWithOptions:", 0));
}

@end
