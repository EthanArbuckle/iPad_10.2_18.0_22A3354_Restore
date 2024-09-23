@implementation PRWidgetIconViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRWidgetIconViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRWidgetIconViewController"), CFSTR("widgetHostViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRWidgetIconViewController"), CFSTR("complicationDescriptor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationDescriptor"), CFSTR("widgetDescriptor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRWidgetGridViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRWidgetGridViewController"), CFSTR("model"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRWidgetGridModel"), CFSTR("removeComplicationDescriptor:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationContainerViewController"), CFSTR("widgetGridViewController:didRequestConfigurationForComplicationDescriptor:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRWidgetIconViewController"), CFSTR("viewDidLayoutSubviews"), "v", 0);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRWidgetIconViewControllerAccessibility;
  -[PRWidgetIconViewControllerAccessibility viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PRWidgetIconViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRWidgetIconViewControllerAccessibility;
  -[PRWidgetIconViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PRWidgetIconViewControllerAccessibility _axSetWidgetView](self, "_axSetWidgetView");
}

- (void)_axSetWidgetView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location[2];

  LOBYTE(location[0]) = 0;
  objc_opt_class();
  -[PRWidgetIconViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("widgetHostViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRWidgetIconViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("complicationDescriptor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("widget"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, v7);
  v9 = objc_alloc(MEMORY[0x24BDF6788]);
  -[PRWidgetIconViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("complicationDescriptor.widgetDescriptor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AXRemoveWidgetLabel(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke;
  v28[3] = &unk_25030BA98;
  v13 = v6;
  v29 = v13;
  v14 = v8;
  v30 = v14;
  v15 = (void *)objc_msgSend(v9, "initWithName:actionHandler:", v11, v28);

  if (AXIsWidgetConfigurable(v23))
  {
    v16 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("edit.widget.label"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke_3;
    v24[3] = &unk_25030BAE8;
    objc_copyWeak(&v27, location);
    v25 = v13;
    v26 = v14;
    v18 = (void *)objc_msgSend(v16, "initWithName:actionHandler:", v17, v24);

    objc_destroyWeak(&v27);
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityCustomActions:", v19);

  objc_msgSend(v5, "setIsAccessibilityElement:", AXProcessIsSpringBoard() ^ 1);
  v20 = objc_msgSend(v5, "accessibilityTraits");
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v20);
  objc_msgSend(v14, "safeValueForKey:", CFSTR("widgetDescriptor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  AXWidgetAndAppName(v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v22);

  objc_destroyWeak(location);
}

uint64_t __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke(uint64_t a1)
{
  id v3;
  id v4;

  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

void __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("model"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeComplicationDescriptor:", *(_QWORD *)(a1 + 40));

}

uint64_t __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  objc_copyWeak(&v7, a1 + 6);
  v5 = a1[4];
  v6 = a1[5];
  AXPerformSafeBlock();

  objc_destroyWeak(&v7);
  return 1;
}

void __59__PRWidgetIconViewControllerAccessibility__axSetWidgetView__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "widgetGridViewController:didRequestConfigurationForComplicationDescriptor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
