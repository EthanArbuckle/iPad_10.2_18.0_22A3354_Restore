@implementation CSDNDBedtimeGreetingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSDNDBedtimeGreetingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSDNDBedtimeGreetingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSModalView"), CFSTR("_secondaryActionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSDNDBedtimeGreetingViewController"), CFSTR("handleSecondaryActionForView:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSDNDBedtimeGreetingViewControllerAccessibility;
  -[CSDNDBedtimeGreetingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[CSDNDBedtimeGreetingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_secondaryActionButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __93__CSDNDBedtimeGreetingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2501EDDD0;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityActivateBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

uint64_t __93__CSDNDBedtimeGreetingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v2;

  objc_copyWeak(&v2, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __93__CSDNDBedtimeGreetingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "handleSecondaryActionForView:", WeakRetained);

}

@end
