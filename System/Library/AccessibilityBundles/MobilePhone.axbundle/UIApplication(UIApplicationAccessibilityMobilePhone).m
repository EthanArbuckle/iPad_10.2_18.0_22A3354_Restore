@implementation UIApplication(UIApplicationAccessibilityMobilePhone)

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("application.name"));
}

@end
