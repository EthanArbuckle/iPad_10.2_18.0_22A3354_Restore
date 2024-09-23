@implementation PromotionTileViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExperienceUI.PromotionTileView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HealthExperienceUI.PromotionTileView"), CFSTR("accessoryLabel"), "Optional<DynamicFontLabel>");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PromotionTileViewAccessibility;
  -[PromotionTileViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PromotionTileViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("accessoryLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("close"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
}

@end
