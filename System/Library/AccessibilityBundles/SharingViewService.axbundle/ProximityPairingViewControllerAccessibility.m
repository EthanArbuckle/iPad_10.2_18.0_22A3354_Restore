@implementation ProximityPairingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ProximityPairingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ProximityPairingViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ProximityPairingViewController"), CFSTR("_showFailed"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ProximityPairingViewController"), CFSTR("_pairingComplete:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityPairingViewController"), CFSTR("_dismissButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityPairingViewController"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityPairingViewController"), CFSTR("_budsBatteryView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityPairingViewController"), CFSTR("_budsBatteryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityPairingViewController"), CFSTR("_mainBatteryView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityPairingViewController"), CFSTR("_mainBatteryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityPairingViewController"), CFSTR("_caseBatteryView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ProximityPairingViewController"), CFSTR("_caseBatteryLabel"), "UILabel");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)ProximityPairingViewControllerAccessibility;
  -[ProximityPairingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v29, sel__accessibilityLoadAccessibilityInformation);
  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("dismiss.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetUserTestingIsCancelButton:", 1);

  -[ProximityPairingViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_budsBatteryView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);

  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_budsBatteryView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v26[3] = &unk_250355218;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v9, "_setAccessibilityValueBlock:", v26);

  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_budsBatteryView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v7);

  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mainBatteryView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsAccessibilityElement:", 1);

  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mainBatteryView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v24[3] = &unk_250355218;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v13, "_setAccessibilityValueBlock:", v24);

  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mainBatteryView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityLabel:", v7);

  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_caseBatteryView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIsAccessibilityElement:", 1);

  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_caseBatteryView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v10;
  v20 = 3221225472;
  v21 = __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v22 = &unk_250355218;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v16, "_setAccessibilityValueBlock:", &v19);

  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_caseBatteryView"), v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityB188LocalizedString(CFSTR("battery.case"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityLabel:", v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

id __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_budsBatteryLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_mainBatteryLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __89__ProximityPairingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_caseBatteryLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  char v3;

  -[ProximityPairingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityActivate");

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ProximityPairingViewControllerAccessibility;
  -[ProximityPairingViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[ProximityPairingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_pairingComplete:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ProximityPairingViewControllerAccessibility;
  -[ProximityPairingViewControllerAccessibility _pairingComplete:](&v3, sel__pairingComplete_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_showFailed
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ProximityPairingViewControllerAccessibility;
  -[ProximityPairingViewControllerAccessibility _showFailed](&v2, sel__showFailed);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
