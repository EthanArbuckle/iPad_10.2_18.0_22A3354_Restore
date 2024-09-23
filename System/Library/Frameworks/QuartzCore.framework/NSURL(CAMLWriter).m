@implementation NSURL(CAMLWriter)

- (const)CAMLType
{
  return CFSTR("NSURL");
}

- (uint64_t)encodeWithCAMLWriter:()CAMLWriter
{
  return objc_msgSend(a3, "setElementContent:", CFURLGetString(a1));
}

@end
