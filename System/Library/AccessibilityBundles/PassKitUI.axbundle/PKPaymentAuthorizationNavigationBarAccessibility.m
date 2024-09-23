@implementation PKPaymentAuthorizationNavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentAuthorizationNavigationBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentAuthorizationNavigationBar"), CFSTR("didUpdateInterfaceStyle"), "v", 0);
}

- (void)didUpdateInterfaceStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationNavigationBarAccessibility;
  -[PKPaymentAuthorizationNavigationBarAccessibility didUpdateInterfaceStyle](&v3, sel_didUpdateInterfaceStyle);
  -[PKPaymentAuthorizationNavigationBarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentAuthorizationNavigationBarAccessibility;
  -[PKPaymentAuthorizationNavigationBarAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[PKPaymentAuthorizationNavigationBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("topItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("leftBarButtonItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilitySetIdentification:", kAXCustomButtonIdentifier);
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilitySetIdentification:", kAXCustomButtonIdentifier);

}

@end
