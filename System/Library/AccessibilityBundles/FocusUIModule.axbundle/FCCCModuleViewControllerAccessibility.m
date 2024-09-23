@implementation FCCCModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FCCCModuleViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("FCCCModuleViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("FCUIActivityPickerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCCCModuleViewController"), CFSTR("_activeTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCCCModuleViewController"), CFSTR("_onStateLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCCCModuleViewController"), CFSTR("_roundButtonVC"), "CCUILabeledRoundButtonViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("FCCCModuleViewController"), CFSTR("_activeActivity"), "<FCActivityDescribing>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUILabeledRoundButtonViewController"), CFSTR("button"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("FCActivityDescribing"), CFSTR("activityDisplayName"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)FCCCModuleViewControllerAccessibility;
  -[FCCCModuleViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v16, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[FCCCModuleViewControllerAccessibility _accessibilityButtonView](self, "_accessibilityButtonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[FCCCModuleViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("focus.module.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v13[3] = &unk_250211B70;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", v13);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v11[3] = &unk_250211B98;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v9[3] = &unk_250211C60;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "_setAccessibilityCustomActionsBlock:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v7[3] = &unk_250211C88;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "_setAccessibilityActivationPointBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

id __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  accessibilityLocalizedString(CFSTR("focus.module.label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_activeTitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v2))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

uint64_t __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;

  v1 = *MEMORY[0x24BDF73B0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_activeActivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v1;
}

id __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

double __83__FCCCModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;

  return v4;
}

- (id)_accessibilityButtonView
{
  return (id)-[FCCCModuleViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_roundButtonVC.button"));
}

@end
