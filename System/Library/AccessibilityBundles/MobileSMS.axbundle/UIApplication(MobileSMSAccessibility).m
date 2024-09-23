@implementation UIApplication(MobileSMSAccessibility)

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("app.name"));
}

@end
