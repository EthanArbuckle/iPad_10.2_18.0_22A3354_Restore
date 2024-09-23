@implementation CCUILabeledRoundButtonViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUILabeledRoundButtonViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUILabeledRoundButtonViewController"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUILabeledRoundButtonViewController"), CFSTR("buttonContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUILabeledRoundButton"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUILabeledRoundButtonViewController"), CFSTR("_labelsVisible"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUILabeledRoundButtonViewController"), CFSTR("button"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIRoundButtonAccessibility"), CFSTR("_accesibilityRawTraits"), "Q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUILabeledRoundButtonViewController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id from;
  id location;
  objc_super v25;

  if ((-[CCUILabeledRoundButtonViewControllerAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("IsInAXLoadAX")) & 1) == 0)
  {
    -[CCUILabeledRoundButtonViewControllerAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("IsInAXLoadAX"));
    v25.receiver = self;
    v25.super_class = (Class)CCUILabeledRoundButtonViewControllerAccessibility;
    -[CCUILabeledRoundButtonViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v25, sel__accessibilityLoadAccessibilityInformation);
    objc_initWeak(&location, self);
    LOBYTE(from) = 0;
    objc_opt_class();
    -[CCUILabeledRoundButtonViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("button"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&from, v4);
    v5 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v21[3] = &unk_2501E30D8;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v4, "_setAccessibilityLabelBlock:", v21);
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v18[3] = &unk_2501E3100;
    objc_copyWeak(&v19, &location);
    objc_copyWeak(&v20, &from);
    objc_msgSend(v4, "_setAccessibilityHintBlock:", v18);
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
    v15[3] = &unk_2501E3100;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, &from);
    objc_msgSend(v4, "_setAccessibilityValueBlock:", v15);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
    v12[3] = &unk_2501E3128;
    objc_copyWeak(&v13, &from);
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v12);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
    v10[3] = &unk_2501E30D8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "_setAccessibilityIdentifierBlock:", v10);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
    v8[3] = &unk_2501E3150;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "_setAccessibilityFrameBlock:", v8);
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
    v6[3] = &unk_2501E3178;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v4, "_setAccessibilityPathBlock:", v6);
    -[CCUILabeledRoundButtonViewControllerAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("IsInAXLoadAX"));
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }
}

id __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  char v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_accessibilityControlCenterButtonIsToggle");

  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "_accessibilityControlCenterButtonLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("buttonContainer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeStringForKey:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  int ShouldIncludeOpenModuleAction;
  uint64_t v8;
  void *v10;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityControlCenterButtonHint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained(v2);
  if (objc_msgSend(v5, "_accessibilityControlCenterButtonWillExpand"))
  {

LABEL_4:
    UIAccessibilityControlCenterModuleExpandPlatterHint();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
    return v4;
  }
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  ShouldIncludeOpenModuleAction = UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction();

  if (ShouldIncludeOpenModuleAction)
    goto LABEL_4;
  return v4;
}

__CFString *__95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  int v10;
  __CFString *v11;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "_accessibilityControlCenterButtonIsToggle");

  if (v4)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = objc_msgSend(v5, "isSelected");
    v7 = CFSTR("0");
    if (v6)
      v7 = CFSTR("1");
    v8 = v7;
    goto LABEL_7;
  }
  v9 = objc_loadWeakRetained(v2);
  v10 = objc_msgSend(v9, "safeBoolForKey:", CFSTR("_labelsVisible"));

  if (v10)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "safeStringForKey:", CFSTR("subtitle"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = v8;

    return v11;
  }
  return (__CFString *)0;
}

uint64_t __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  int v11;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "storedAccessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "unsignedLongLongValue");
  }
  else
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_accesibilityRawTraits"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "longLongValue");

    v8 = (id *)(a1 + 40);
    v9 = objc_loadWeakRetained(v8);
    LODWORD(v7) = objc_msgSend(v9, "_accessibilityControlCenterButtonIsToggle");

    if ((_DWORD)v7)
    {
      v5 = v5 & ~*MEMORY[0x24BDF7400] | *MEMORY[0x24BDF7428];
    }
    else
    {
      v10 = objc_loadWeakRetained(v8);
      v11 = objc_msgSend(v10, "safeBoolForKey:", CFSTR("_labelsVisible"));

      if (v11)
        v5 &= ~*MEMORY[0x24BDF7400];
    }
  }

  return v5;
}

id __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityControlCenterButtonIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

double __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityControlCenterButtonFrame");
  v3 = v2;

  return v3;
}

id __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
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
  -[CCUILabeledRoundButtonViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("button"));
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

- (id)_accessibilityControlCenterButtonLabel
{
  void *v3;
  objc_super v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUILabeledRoundButtonViewControllerAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("title, subtitle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CCUILabeledRoundButtonViewControllerAccessibility;
    -[CCUILabeledRoundButtonViewControllerAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_accessibilityControlCenterButtonHint
{
  return 0;
}

- (BOOL)_accessibilityControlCenterButtonIsToggle
{
  return -[CCUILabeledRoundButtonViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_labelsVisible")) ^ 1;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return 0;
}

- (BOOL)_accessibilityControlCenterButtonWillExpand
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUILabeledRoundButtonViewControllerAccessibility;
  -[CCUILabeledRoundButtonViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CCUILabeledRoundButtonViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
