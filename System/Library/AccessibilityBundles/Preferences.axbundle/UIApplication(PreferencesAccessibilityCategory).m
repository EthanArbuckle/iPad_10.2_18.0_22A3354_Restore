@implementation UIApplication(PreferencesAccessibilityCategory)

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("app.name"));
}

@end
