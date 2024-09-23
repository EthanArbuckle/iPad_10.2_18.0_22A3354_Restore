@implementation HUCCCompactModuleContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUCCCompactModuleContentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("HUCCCompactModuleContentViewController"), CFSTR("CCUIButtonModuleViewController"));
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(CFSTR("compact.home.module"));
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return CFSTR("compact-home");
}

@end
