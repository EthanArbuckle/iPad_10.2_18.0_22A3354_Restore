@implementation YearViewYearHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("YearViewYearHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("YearViewYearHeader"), CFSTR("_yearNumber"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("YearViewYearHeader"), CFSTR("_reloadYearNumberLabel"), "v", 0);

}

- (void)_axAnnotateYearNumber
{
  uint64_t v2;
  id v3;

  -[YearViewYearHeaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_yearNumber"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v2);
  objc_msgSend(v3, "_accessibilitySetIsSpeakThisElement:", 0);

}

- (void)_reloadYearNumberLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)YearViewYearHeaderAccessibility;
  -[YearViewYearHeaderAccessibility _reloadYearNumberLabel](&v3, sel__reloadYearNumberLabel);
  -[YearViewYearHeaderAccessibility _axAnnotateYearNumber](self, "_axAnnotateYearNumber");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)YearViewYearHeaderAccessibility;
  -[YearViewYearHeaderAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[YearViewYearHeaderAccessibility _axAnnotateYearNumber](self, "_axAnnotateYearNumber");
}

@end
