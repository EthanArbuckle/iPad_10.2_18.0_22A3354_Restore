@implementation DNDUIControlCenterModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DNDUIControlCenterModule");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(CFSTR("do.not.disturb.label"));
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return CFSTR("do-not-disturb");
}

- (BOOL)_accessibilityControlCenterButtonIsToggle
{
  return 1;
}

@end
