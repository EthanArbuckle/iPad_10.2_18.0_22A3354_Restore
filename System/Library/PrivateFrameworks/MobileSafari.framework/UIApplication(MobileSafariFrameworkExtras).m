@implementation UIApplication(MobileSafariFrameworkExtras)

- (uint64_t)sf_currentKeyboardModifierFlags
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "currentKeyboardModifierFlags");
  else
    return 0;
}

@end
