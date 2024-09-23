@implementation MarketingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.MarketingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.MarketingView"), CFSTR("logoImageView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MarketingViewAccessibility;
  -[MarketingViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[MarketingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("logoImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF7410]);
  accessibilityLocalizedString(CFSTR("product.logo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
