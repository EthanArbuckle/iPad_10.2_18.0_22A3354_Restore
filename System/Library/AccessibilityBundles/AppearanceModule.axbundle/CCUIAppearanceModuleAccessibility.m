@implementation CCUIAppearanceModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIAppearanceModule");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(CFSTR("appearance.button.label"));
}

@end
