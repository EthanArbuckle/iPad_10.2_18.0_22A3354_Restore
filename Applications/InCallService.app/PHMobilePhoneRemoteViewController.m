@implementation PHMobilePhoneRemoteViewController

+ (BOOL)isSupported
{
  return +[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling");
}

+ (id)viewControllerClassName
{
  return CFSTR("PhoneTabBarController");
}

+ (id)serviceBundleIdentifier
{
  return TUBundleIdentifierMobilePhoneApplication;
}

- (int64_t)backgroundStyle
{
  return 3;
}

@end
