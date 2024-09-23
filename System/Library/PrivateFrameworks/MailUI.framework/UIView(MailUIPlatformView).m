@implementation UIView(MailUIPlatformView)

- (uint64_t)mui_setFlexibleWidthAndHeightResizingMask
{
  return objc_msgSend(a1, "setAutoresizingMask:", 18);
}

@end
