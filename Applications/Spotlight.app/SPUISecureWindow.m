@implementation SPUISecureWindow

- (BOOL)_requiresKeyboardPresentationFence
{
  return 0;
}

+ (BOOL)_isSecure
{
  return 1;
}

@end
