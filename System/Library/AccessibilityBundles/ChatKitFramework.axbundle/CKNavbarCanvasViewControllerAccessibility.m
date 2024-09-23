@implementation CKNavbarCanvasViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNavbarCanvasViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavbarCanvasViewController"), CFSTR("backButtonView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavbarCanvasViewController"), CFSTR("_buttonPressed:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKNavbarCanvasViewControllerAccessibility;
  -[CKNavbarCanvasViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CKNavbarCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("details.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (id)backButtonView
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id v7;
  id from;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKNavbarCanvasViewControllerAccessibility;
  -[CKNavbarCanvasViewControllerAccessibility backButtonView](&v10, sel_backButtonView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_initWeak(&from, v3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__CKNavbarCanvasViewControllerAccessibility_backButtonView__block_invoke;
  v5[3] = &unk_2501B2420;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  objc_msgSend(v3, "_setAccessibilityActivateBlock:", v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v3;
}

uint64_t __59__CKNavbarCanvasViewControllerAccessibility_backButtonView__block_invoke(uint64_t a1)
{
  id v3;
  id v4;

  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_copyWeak(&v4, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v3);
  return 1;
}

void __59__CKNavbarCanvasViewControllerAccessibility_backButtonView__block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_buttonPressed:", v2);

}

@end
