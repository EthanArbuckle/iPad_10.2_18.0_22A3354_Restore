@implementation FCCCControlCenterModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FCCCControlCenterModule");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("FCCCControlCenterModule"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("FCUIActivityPickerViewController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("FCUIActivityPickerViewController"), CFSTR("isOnboardingEncountered"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCCCControlCenterModule"), CFSTR("_moduleViewController"), "FCCCModuleViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCCCModuleViewController"), CFSTR("_activeActivity"), "<FCActivityDescribing>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCCCModuleViewController"), CFSTR("_suggestedActivity"), "<FCActivityDescribing>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCCCModuleViewController"), CFSTR("_activeTitleLabel"), "UILabel");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FCCCControlCenterModuleAccessibility;
  -[FCCCControlCenterModuleAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  -[FCCCControlCenterModuleAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v11[3] = &unk_250211B48;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "_setIsAccessibilityElementBlock:", v11);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v9[3] = &unk_250211B70;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v7[3] = &unk_250211B98;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v5[3] = &unk_250211B70;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityHintBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

uint64_t __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityIsOnboardingControlVisible");

  return v2;
}

id __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_accessibilityIsOnboardingControlVisible");

  if (v3)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "_accessibilityModuleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_activeTitleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  int v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityIsOnboardingControlVisible");

  v3 = MEMORY[0x24BDF73B0];
  if (!v2)
    v3 = MEMORY[0x24BDF73E0];
  return *(_QWORD *)v3;
}

id __82__FCCCControlCenterModuleAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  int v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityIsOnboardingControlVisible");

  if (v2)
  {
    accessibilityLocalizedString(CFSTR("double.tap.to.explore.controls"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)_accessibilityIsOnboardingControlVisible
{
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend((id)MEMORY[0x23490F0FC](CFSTR("FCUIActivityPickerViewController"), a2), "safeBoolForKey:", CFSTR("isOnboardingEncountered"));
  -[FCCCControlCenterModuleAccessibility _accessibilityModuleViewController](self, "_accessibilityModuleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_activeActivity"));
  v5 = objc_claimAutoreleasedReturnValue();

  -[FCCCControlCenterModuleAccessibility _accessibilityModuleViewController](self, "_accessibilityModuleViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_suggestedActivity"));
  v7 = objc_claimAutoreleasedReturnValue();

  if (v5 | v7)
    v8 = v3 ^ 1;
  else
    v8 = 1;

  return v8;
}

- (id)_accessibilityModuleViewController
{
  return (id)-[FCCCControlCenterModuleAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_moduleViewController"));
}

@end
