@implementation PKDashboardTitleHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKDashboardTitleHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDashboardTitleHeaderView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardTitleHeaderView"), CFSTR("createSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardTitleHeaderView"), CFSTR("action"), "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDashboardTitleHeaderView"), CFSTR("_actionButton"), "UIButton");

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PKDashboardTitleHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardTitleHeaderViewAccessibility;
  -[PKDashboardTitleHeaderViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PKDashboardTitleHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)createSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardTitleHeaderViewAccessibility;
  -[PKDashboardTitleHeaderViewAccessibility createSubviews](&v3, sel_createSubviews);
  -[PKDashboardTitleHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id from;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKDashboardTitleHeaderViewAccessibility;
  -[PKDashboardTitleHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[PKDashboardTitleHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __85__PKDashboardTitleHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_2502E3B10;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  v5 = v4;
  v7 = v5;
  objc_msgSend(v5, "_setIsAccessibilityElementBlock:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

BOOL __85__PKDashboardTitleHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (objc_msgSend(WeakRetained, "_accessibilityViewIsVisible"))
  {
    v3 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_action"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(a1[4], "menu");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 != 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKDashboardTitleHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAccessibilityElement");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCE30];
    -[PKDashboardTitleHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionButton"));
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
