@implementation NFCCContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NFCCContentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NFCCContentViewController"), CFSTR("_contentView"), "NFCCContentView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NFCCContentViewController"), CFSTR("_moduleState"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NFCCContentView"), CFSTR("_statusView"), "NFCCStatusView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NFCCStatusView"), CFSTR("_scanTagPromptLabelWrapper"), "NFCCWrappedLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NFCCStatusView"), CFSTR("_unavailablePromptLabelWrapper"), "NFCCWrappedLabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NFCCContentViewController"), CFSTR("_setModuleState:animated:"), "v", "q", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NFCCContentViewControllerAccessibility;
  -[NFCCContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[NFCCContentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__NFCCContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_2502D9B40;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __84__NFCCContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_2502D9B68;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

id __84__NFCCContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_statusView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("_scanTagPromptLabelWrapper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("_unavailablePromptLabelWrapper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  v6 = v4;
  if (v7 <= 0.5 && (objc_msgSend(v5, "alpha"), v6 = v5, v8 <= 0.5))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __84__NFCCContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  int v2;
  uint64_t *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded"));
  v3 = (uint64_t *)MEMORY[0x24BDF73E0];
  if (!v2)
    v3 = (uint64_t *)MEMORY[0x24BDF73B0];
  v4 = *v3;

  return v4;
}

- (void)_setModuleState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v7 = -[NFCCContentViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_moduleState"));
  v10.receiver = self;
  v10.super_class = (Class)NFCCContentViewControllerAccessibility;
  -[NFCCContentViewControllerAccessibility _setModuleState:animated:](&v10, sel__setModuleState_animated_, a3, v4);
  if (-[NFCCContentViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"))&& v7 != a3&& (unint64_t)a3 <= 5)
  {
    accessibilityLocalizedString(*(&off_2502D9B88 + a3));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      UIAccessibilitySpeakOrQueueIfNeeded();

    }
  }
}

@end
