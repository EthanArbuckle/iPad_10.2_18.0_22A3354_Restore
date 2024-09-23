@implementation CCUIMuteModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIMuteModule");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CCUIMuteModule"), CFSTR("CCUIToggleModule"));
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(CFSTR("mute.label"));
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return CFSTR("mute");
}

@end
