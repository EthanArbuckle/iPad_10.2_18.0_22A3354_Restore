@implementation PKContinuityPaymentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKContinuityPaymentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKContinuityPaymentViewController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKContinuityPaymentViewController"), CFSTR("_priceView"), "UIView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKContinuityPaymentViewControllerAccessibility;
  -[PKContinuityPaymentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PKContinuityPaymentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_priceView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", kAXPriceViewIdentifier);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentViewControllerAccessibility;
  -[PKContinuityPaymentViewControllerAccessibility loadView](&v3, sel_loadView);
  -[PKContinuityPaymentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentViewControllerAccessibility;
  -[PKContinuityPaymentViewControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __64__PKContinuityPaymentViewControllerAccessibility_viewDidAppear___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v2;
  id v3;

  UIAccessibilityPostNotification(*MEMORY[0x24BEBAEA0], 0);
  v2 = *MEMORY[0x24BEBB030];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_priceView"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

@end
