@implementation CCUIFlashlightModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIFlashlightModule");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIFlashlightModule"), CFSTR("contentViewController"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIFlashlightModuleAccessibility;
  -[CCUIFlashlightModuleAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CCUIFlashlightModuleAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

}

@end
