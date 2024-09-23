@implementation ABActionSelectorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ABActionSelectorViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ABActionSelectorViewController"), CFSTR("_carouselView"), "ABCarouselView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ABActionSelectorViewController"), CFSTR("_detailsView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ABActionSelectorViewController"), CFSTR("_welcomeView"), "UIView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ActionButtonConfigurationUI.ActionDetailsView"), CFSTR("titleLabel"), "Optional<UILabel>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ActionButtonConfigurationUI.ActionDetailsView"), CFSTR("pageControl"), "Optional<UIPageControl>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ABActionSelectorViewController"), CFSTR("selectActionItemWithIndex:animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ABActionSelectorViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ABActionSelectorViewController"), CFSTR("_updateSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ABActionSelectorViewController"), CFSTR("carouselView:didSelectItemAtIndex:"), "v", "@", "q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABActionSelectorViewControllerAccessibility;
  -[ABActionSelectorViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  if (AXProcessIsSetup())
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  -[ABActionSelectorViewControllerAccessibility _axSetupPageControl](self, "_axSetupPageControl");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABActionSelectorViewControllerAccessibility;
  -[ABActionSelectorViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[ABActionSelectorViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_updateSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  objc_super v9;

  -[ABActionSelectorViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_welcomeView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "alpha");
    v6 = v5;
    v8.receiver = self;
    v8.super_class = (Class)ABActionSelectorViewControllerAccessibility;
    -[ABActionSelectorViewControllerAccessibility _updateSubviews](&v8, sel__updateSubviews);
    objc_msgSend(v4, "alpha");
    if (vabdd_f64(v7, v6) >= 0.001)
      UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ABActionSelectorViewControllerAccessibility;
    -[ABActionSelectorViewControllerAccessibility _updateSubviews](&v9, sel__updateSubviews);
  }

}

- (id)_axCarouselView
{
  return (id)-[ABActionSelectorViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_carouselView"));
}

- (id)_axActionString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ABActionSelectorViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_detailsView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axPageControl
{
  void *v2;
  void *v3;
  void *v4;

  -[ABActionSelectorViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_detailsView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("pageControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_axSetupPageControl
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[ABActionSelectorViewControllerAccessibility _axPageControl](self, "_axPageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__ABActionSelectorViewControllerAccessibility__axSetupPageControl__block_invoke;
  v9[3] = &unk_250148D10;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setAccessibilityDecrementBlock:", v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __66__ABActionSelectorViewControllerAccessibility__axSetupPageControl__block_invoke_2;
  v7[3] = &unk_250148D10;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setAccessibilityIncrementBlock:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __66__ABActionSelectorViewControllerAccessibility__axSetupPageControl__block_invoke_3;
  v5[3] = &unk_250148D38;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "setAccessibilityValueBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __66__ABActionSelectorViewControllerAccessibility__axSetupPageControl__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axChangePageControl:", 0);

}

void __66__ABActionSelectorViewControllerAccessibility__axSetupPageControl__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axChangePageControl:", 1);

}

id __66__ABActionSelectorViewControllerAccessibility__axSetupPageControl__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axActionString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_axChangePageControl:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11[2];
  id location;

  v3 = a3;
  -[ABActionSelectorViewControllerAccessibility _axPageControl](self, "_axPageControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfPages");
  v7 = objc_msgSend(v5, "currentPage");
  v8 = v7 - 1;
  if (v3)
    v8 = v7 + 1;
  if (v8 >= v6)
    v9 = (void *)(v6 - 1);
  else
    v9 = (void *)v8;
  if (v8 >= 0)
    v10 = v9;
  else
    v10 = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(v11, &location);
  v11[1] = v10;
  AXPerformSafeBlock();
  objc_msgSend(v5, "setCurrentPage:", v10);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

void __68__ABActionSelectorViewControllerAccessibility__axChangePageControl___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "selectActionItemWithIndex:animated:", *(_QWORD *)(a1 + 40), 1);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "safeUIViewForKey:", CFSTR("_detailsView"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setNeedsLayout");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
