@implementation SBUISystemApertureSecureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUISystemApertureSecureWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsInJindo
{
  return 1;
}

@end
