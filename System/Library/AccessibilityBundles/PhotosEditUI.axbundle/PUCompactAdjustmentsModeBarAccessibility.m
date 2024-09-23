@implementation PUCompactAdjustmentsModeBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUCompactAdjustmentsModeBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUCompactAdjustmentsModeBar"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCompactAdjustmentsModeBar"), CFSTR("_updateTitleViewAnimated:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUCompactAdjustmentsModeBarAccessibility;
  -[PUCompactAdjustmentsModeBarAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[PUCompactAdjustmentsModeBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 0);
}

- (void)_updateTitleViewAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCompactAdjustmentsModeBarAccessibility;
  -[PUCompactAdjustmentsModeBarAccessibility _updateTitleViewAnimated:](&v4, sel__updateTitleViewAnimated_, a3);
  -[PUCompactAdjustmentsModeBarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
