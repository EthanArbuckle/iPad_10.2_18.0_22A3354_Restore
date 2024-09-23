@implementation CCUIButtonModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIButtonModuleViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIButtonModuleViewController"), CFSTR("_buttonModuleView"), "CCUIButtonModuleView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIButtonModuleViewController"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIButtonModuleViewAccessibility"), CFSTR("_accesibilityRawTraits"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIButtonModuleViewController"), CFSTR("buttonView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id from;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CCUIButtonModuleViewControllerAccessibility;
  -[CCUIButtonModuleViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v29, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  LOBYTE(from) = 0;
  objc_opt_class();
  -[CCUIButtonModuleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_buttonModuleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&from, v4);
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  if (!v5
    || (-[CCUIButtonModuleViewControllerAccessibility _accessibilityControlCenterButtonLabel](self, "_accessibilityControlCenterButtonLabel"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v5, v7))
  {
    v25[0] = v6;
    v25[1] = 3221225472;
    v25[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v25[3] = &unk_2501E30D8;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v4, "_setAccessibilityLabelBlock:", v25);
    objc_destroyWeak(&v26);
  }
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v22[3] = &unk_2501E3100;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, &from);
  objc_msgSend(v4, "_setAccessibilityHintBlock:", v22);
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v19[3] = &unk_2501E3100;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", v19);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v16[3] = &unk_2501E3128;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v16);
  objc_msgSend(v4, "accessibilityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (-[CCUIButtonModuleViewControllerAccessibility _accessibilityControlCenterButtonIdentifier](self, "_accessibilityControlCenterButtonIdentifier"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v8, v9))
  {
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
    v14[3] = &unk_2501E30D8;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v4, "_setAccessibilityIdentifierBlock:", v14);
    objc_destroyWeak(&v15);
  }
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v12[3] = &unk_2501E3150;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "_setAccessibilityFrameBlock:", v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v10[3] = &unk_2501E3178;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "_setAccessibilityPathBlock:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

id __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityControlCenterButtonLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityControlCenterButtonHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(WeakRetained) = UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction();

  if ((_DWORD)WeakRetained)
  {
    UIAccessibilityControlCenterModuleExpandPlatterHint();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

__CFString *__89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  id v5;
  __CFString *v6;
  id v7;
  int v8;
  __CFString *v9;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded"));

  v5 = objc_loadWeakRetained(v2);
  LODWORD(WeakRetained) = objc_msgSend(v5, "_accessibilityControlCenterButtonIsToggle");

  v6 = 0;
  if ((_DWORD)WeakRetained && (v4 & 1) == 0)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = objc_msgSend(v7, "isSelected");
    v9 = CFSTR("0");
    if (v8)
      v9 = CFSTR("1");
    v6 = v9;

  }
  return v6;
}

uint64_t __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded"));

  if (v4)
    return *MEMORY[0x24BDF73C0];
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_accesibilityRawTraits"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  v9 = objc_loadWeakRetained(v2);
  LODWORD(v7) = objc_msgSend(v9, "_accessibilityControlCenterButtonIsToggle");

  if ((_DWORD)v7)
    v8 = v8 & ~*MEMORY[0x24BDF7400] | *MEMORY[0x24BDF7428];
  v10 = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(v10, "_accessibilityControlCenterButtonAdditionalTraits") | v8;

  return v5;
}

id __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityControlCenterButtonIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

double __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityControlCenterButtonFrame");
  v3 = v2;

  return v3;
}

id __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityControlCenterButtonPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (CGRect)_accessibilityControlCenterButtonFrame
{
  void *v3;
  UIView *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;
  CGRect result;

  objc_opt_class();
  -[CCUIButtonModuleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_buttonModuleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](v4, "bounds");
  v14 = UIAccessibilityConvertFrameToScreenCoordinates(v13, v4);
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;

  v9 = x;
  v10 = y;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)_accessibilityControlCenterButtonPath
{
  return 0;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return 0;
}

- (id)_accessibilityControlCenterButtonHint
{
  return 0;
}

- (BOOL)_accessibilityControlCenterButtonIsToggle
{
  return 0;
}

- (unint64_t)_accessibilityControlCenterButtonAdditionalTraits
{
  return *MEMORY[0x24BDF73E0];
}

- (id)_accessibilityControlCenterElementToFocusAfterClose
{
  return (id)-[CCUIButtonModuleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonView"));
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIButtonModuleViewControllerAccessibility;
  -[CCUIButtonModuleViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CCUIButtonModuleViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
