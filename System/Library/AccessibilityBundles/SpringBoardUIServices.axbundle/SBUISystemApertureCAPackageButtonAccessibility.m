@implementation SBUISystemApertureCAPackageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUISystemApertureCAPackageButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilitySBLocalizedString(CFSTR("turn.off.flashlight"));
}

@end
