@implementation PRQuickActionEditingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRQuickActionEditingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRQuickActionEditingViewController"), CFSTR("prominentButtonsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRQuickActionEditingViewController"), CFSTR("leadingControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRQuickActionEditingViewController"), CFSTR("trailingControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRQuickActionEditingViewController"), CFSTR("_updateButtonsVisibility"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRQuickActionEditingViewController"), CFSTR("_leadingActionDidFire"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRQuickActionEditingViewController"), CFSTR("_trailingActionDidFire"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRQuickActionEditingViewController"), CFSTR("_presentWidgetIntentConfigurationForControlWithPosition:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRQuickActionEditingViewController"), CFSTR("_handleRemoveButtonActionForQuickActionPosition:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PRQuickActionsEditingReticleView"), CFSTR("_reticleView"), "PREditingReticleView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PRQuickActionControlView"), CFSTR("_controlInstance"), "CHUISControlInstance");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRQuickActionEditingViewControllerAccessibility;
  -[PRQuickActionEditingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PRQuickActionEditingViewControllerAccessibility _accessibilityMarkupButtons](self, "_accessibilityMarkupButtons");
}

- (void)_updateButtonsVisibility
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRQuickActionEditingViewControllerAccessibility;
  -[PRQuickActionEditingViewControllerAccessibility _updateButtonsVisibility](&v3, sel__updateButtonsVisibility);
  -[PRQuickActionEditingViewControllerAccessibility _accessibilityMarkupButtons](self, "_accessibilityMarkupButtons");
}

- (void)_accessibilityMarkupButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location[2];

  -[PRQuickActionEditingViewControllerAccessibility _accessibilityProminentButtonsView](self, "_accessibilityProminentButtonsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingRemoveButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingRemoveButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityElementsHidden:", 1);
  objc_msgSend(v3, "trailingButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityElementsHidden:", 1);
  objc_initWeak(location, self);
  v7 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke;
  v31[3] = &unk_25030B980;
  objc_copyWeak(&v32, location);
  objc_msgSend(v4, "setAccessibilityLabelBlock:", v31);
  objc_msgSend(v3, "leadingReticle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  v9 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_2;
  v29[3] = &unk_25030B980;
  objc_copyWeak(&v30, location);
  objc_msgSend(v8, "setAccessibilityHintBlock:", v29);
  v11 = v5;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_3;
  v27[3] = &unk_25030B980;
  objc_copyWeak(&v28, location);
  objc_msgSend(v8, "setAccessibilityLabelBlock:", v27);
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_4;
  v25[3] = &unk_25030B9D0;
  objc_copyWeak(&v26, location);
  objc_msgSend(v8, "setAccessibilityActivateBlock:", v25);
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_6;
  v23[3] = &unk_25030BA20;
  objc_copyWeak(&v24, location);
  objc_msgSend(v8, "setAccessibilityCustomActionsBlock:", v23);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_9;
  v21[3] = &unk_25030B980;
  objc_copyWeak(&v22, location);
  objc_msgSend(v12, "setAccessibilityLabelBlock:", v21);
  objc_msgSend(v3, "trailingReticle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsAccessibilityElement:", 1);
  objc_msgSend(v10, "setAccessibilityTraits:", v9);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_10;
  v19[3] = &unk_25030B980;
  objc_copyWeak(&v20, location);
  objc_msgSend(v10, "setAccessibilityHintBlock:", v19);
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_11;
  v17[3] = &unk_25030B980;
  objc_copyWeak(&v18, location);
  objc_msgSend(v10, "setAccessibilityLabelBlock:", v17);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_12;
  v15[3] = &unk_25030B9D0;
  objc_copyWeak(&v16, location);
  objc_msgSend(v10, "setAccessibilityActivateBlock:", v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_14;
  v13[3] = &unk_25030BA20;
  objc_copyWeak(&v14, location);
  objc_msgSend(v10, "setAccessibilityCustomActionsBlock:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v32);
  objc_destroyWeak(location);

}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_accessibilityHasLeadingAction");

  if (v3)
  {
    objc_opt_class();
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "_accessibilityProminentButtonsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "glyphView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("_controlInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityLocalizedString(CFSTR("editing.minus.close.box.button.label"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AXCFormattedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("quick.action.remove"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityProminentButtonsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingReticle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_reticleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_accessibilityHasLeadingAction");

  if (v3)
  {
    objc_opt_class();
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "_accessibilityProminentButtonsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "glyphView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("_controlInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("quick.action.add"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

uint64_t __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_5(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_accessibilityHasLeadingAction");

  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "_presentWidgetIntentConfigurationForControlWithPosition:", 1);
  else
    objc_msgSend(v4, "_leadingActionDidFire");

}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_6(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_accessibilityHasLeadingAction");

  if (!v3)
    return 0;
  v4 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("quick.action.remove"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_7;
  v9[3] = &unk_25030B9F8;
  objc_copyWeak(&v10, v1);
  v6 = (void *)objc_msgSend(v4, "initWithName:actionHandler:", v5, v9);

  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  return v7;
}

uint64_t __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRemoveButtonActionForQuickActionPosition:", 1);

}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_9(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_accessibilityHasLeadingAction");

  if (v3)
  {
    objc_opt_class();
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "_accessibilityProminentButtonsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "glyphView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("_controlInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityLocalizedString(CFSTR("editing.minus.close.box.button.label"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AXCFormattedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("quick.action.remove"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityProminentButtonsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trailingReticle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_reticleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_11(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_accessibilityHasTrailingAction");

  if (v3)
  {
    objc_opt_class();
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "_accessibilityProminentButtonsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "glyphView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("_controlInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("quick.action.add"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

uint64_t __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_12(uint64_t a1)
{
  id v2;

  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_13(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_accessibilityHasTrailingAction");

  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "_presentWidgetIntentConfigurationForControlWithPosition:", 2);
  else
    objc_msgSend(v4, "_trailingActionDidFire");

}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_14(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_accessibilityHasTrailingAction");

  if (!v3)
    return 0;
  v4 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("quick.action.remove"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_15;
  v9[3] = &unk_25030B9F8;
  objc_copyWeak(&v10, v1);
  v6 = (void *)objc_msgSend(v4, "initWithName:actionHandler:", v5, v9);

  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  return v7;
}

uint64_t __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_16(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRemoveButtonActionForQuickActionPosition:", 2);

}

- (id)_accessibilityProminentButtonsView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[PRQuickActionEditingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("prominentButtonsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_accessibilityHasLeadingAction
{
  void *v2;
  BOOL v3;

  -[PRQuickActionEditingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leadingControl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_accessibilityHasTrailingAction
{
  void *v2;
  BOOL v3;

  -[PRQuickActionEditingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingControl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
