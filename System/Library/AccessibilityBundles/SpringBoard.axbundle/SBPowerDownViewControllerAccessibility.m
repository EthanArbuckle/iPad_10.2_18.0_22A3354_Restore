@implementation SBPowerDownViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBPowerDownViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SBPowerDownViewController"), CFSTR("UIViewController"));
}

@end
