@implementation CCUICarModeModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUICarModeModule");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CCUICarModeModule"), CFSTR("CCUIToggleModule"));
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(CFSTR("car.mode.label"));
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return CFSTR("car-mode");
}

@end
