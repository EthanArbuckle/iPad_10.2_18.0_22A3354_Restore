@implementation CheckoutContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AssetViewer.CheckoutContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.CheckoutContainerView"), CFSTR("verticalTextStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.CheckoutContainerView"), CFSTR("titleLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CheckoutContainerViewAccessibility;
  -[CheckoutContainerViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CheckoutContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("verticalTextStackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldGroupAccessibilityChildren:", 1);

  -[CheckoutContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | *MEMORY[0x24BDF7410]);

}

@end
