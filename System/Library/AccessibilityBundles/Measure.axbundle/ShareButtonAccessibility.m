@implementation ShareButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.ShareButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("SHARE_BUTTON"));
}

@end
