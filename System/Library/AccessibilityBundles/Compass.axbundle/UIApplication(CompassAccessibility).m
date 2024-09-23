@implementation UIApplication(CompassAccessibility)

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("app.name"));
}

@end
