@implementation LANotificationUIBannerAppearance

- (id)darwinNotificationForBoolValue:(BOOL)a3
{
  if (a3)
    return CFSTR("com.apple.LocalAuthentication.ui.BannerWillAppear");
  else
    return CFSTR("com.apple.LocalAuthentication.ui.BannerDidDisappear");
}

@end
