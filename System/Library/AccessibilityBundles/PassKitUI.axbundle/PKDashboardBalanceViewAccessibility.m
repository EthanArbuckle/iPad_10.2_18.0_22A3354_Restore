@implementation PKDashboardBalanceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKDashboardBalanceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardBalanceView"), CFSTR("createSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDashboardBalanceView"), CFSTR("_actionButton"), "PKContinuousButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDashboardBalanceView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDashboardBalanceView"), CFSTR("_detailLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[PKDashboardBalanceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardBalanceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_detailLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardBalanceViewAccessibility;
  -[PKDashboardBalanceViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PKDashboardBalanceViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)createSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardBalanceViewAccessibility;
  -[PKDashboardBalanceViewAccessibility createSubviews](&v3, sel_createSubviews);
  -[PKDashboardBalanceViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardBalanceViewAccessibility;
  -[PKDashboardBalanceViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[PKDashboardBalanceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __81__PKDashboardBalanceViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_2502E3AE8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setIsAccessibilityElementBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

uint64_t __81__PKDashboardBalanceViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityViewIsVisible");

  return v2;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKDashboardBalanceViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAccessibilityElement");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCE30];
    -[PKDashboardBalanceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
