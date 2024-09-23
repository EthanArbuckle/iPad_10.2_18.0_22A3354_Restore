@implementation RoundCloseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.RoundCloseButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("CLOSE_BUTTON"));
}

@end
