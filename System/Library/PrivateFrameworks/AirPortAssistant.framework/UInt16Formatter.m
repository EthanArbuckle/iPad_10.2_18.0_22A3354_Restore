@implementation UInt16Formatter

+ (id)UInt16Formatter
{
  UInt16Formatter *v2;
  const char *v3;

  v2 = [UInt16Formatter alloc];
  return (id)objc_msgSend_initWithMin_max_(v2, v3, 0, 0xFFFFLL);
}

@end
