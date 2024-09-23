@implementation DismissibleTileHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExperienceUI.DismissibleTileHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExperienceUI.DismissibleTileHeaderView"), CFSTR("accessibilityAccessoryLabel"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DismissibleTileHeaderViewAccessibility;
  -[DismissibleTileHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[DismissibleTileHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAccessoryLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("close"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
}

@end
