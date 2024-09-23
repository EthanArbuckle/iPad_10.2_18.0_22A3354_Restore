@implementation PKPassBannerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassBannerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassBannerViewController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassBannerViewController"), CFSTR("_platter"), "PLPlatterView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassBannerViewController"), CFSTR("_primaryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassBannerViewController"), CFSTR("_secondaryLabel"), "UILabel");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPassBannerViewControllerAccessibility;
  -[PKPassBannerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[PKPassBannerViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_platter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

  objc_initWeak(&location, self);
  -[PKPassBannerViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_platter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __85__PKPassBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2502E3938;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __85__PKPassBannerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_primaryLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "safeUIViewForKey:", CFSTR("_secondaryLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassBannerViewControllerAccessibility;
  -[PKPassBannerViewControllerAccessibility loadView](&v3, sel_loadView);
  -[PKPassBannerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
