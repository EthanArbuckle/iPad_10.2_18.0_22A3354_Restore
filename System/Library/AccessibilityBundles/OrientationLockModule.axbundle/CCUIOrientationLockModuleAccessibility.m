@implementation CCUIOrientationLockModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIOrientationLockModule");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CCUIOrientationLockModule"), CFSTR("CCUIToggleModule"));
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(CFSTR("orientation.lock.label"));
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return CFSTR("orientation-lock");
}

@end
