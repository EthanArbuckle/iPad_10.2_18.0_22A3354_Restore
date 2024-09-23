@implementation CPSPermissionItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CPSPermissionItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CPSPermissionItemView"), CFSTR("setOn:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSPermissionItemView"), CFSTR("_permissionSwitch"), "UISwitch");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSPermissionItemView"), CFSTR("_switchWithLabelVisualEffectView"), "UIVisualEffectView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIVisualEffectView"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CPSVibrantLabel"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CPSPermissionItemViewAccessibility;
  -[CPSPermissionItemViewAccessibility _accessibilityLoadAccessibilityInformation](&v18, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[CPSPermissionItemViewAccessibility _axLabeledSwitchStack](self, "_axLabeledSwitchStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSPermissionItemViewAccessibility _axPermissionSwitch](self, "_axPermissionSwitch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  -[CPSPermissionItemViewAccessibility _axSwitchLabel](self, "_axSwitchLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v7);

  objc_msgSend(v4, "setAccessibilityTraits:", objc_msgSend(v5, "accessibilityTraits"));
  objc_initWeak(&location, self);
  objc_msgSend(v5, "accessibilityValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityValue:", v8);

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__CPSPermissionItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v15[3] = &unk_2501CF338;
  v10 = v5;
  v16 = v10;
  objc_msgSend(v4, "_setAccessibilityValueBlock:", v15);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __80__CPSPermissionItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v12[3] = &unk_2501CF388;
  objc_copyWeak(&v14, &location);
  v11 = v10;
  v13 = v11;
  objc_msgSend(v4, "_setAccessibilityActivateBlock:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

uint64_t __80__CPSPermissionItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityValue");
}

uint64_t __80__CPSPermissionItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

void __80__CPSPermissionItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accessibilityValue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setOn:", objc_msgSend(v2, "BOOLValue") ^ 1);

}

- (id)_axLabeledSwitchStack
{
  void *v2;
  void *v3;
  void *v4;

  -[CPSPermissionItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_switchWithLabelVisualEffectView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __59__CPSPermissionItemViewAccessibility__axLabeledSwitchStack__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axPermissionSwitch
{
  return (id)-[CPSPermissionItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_permissionSwitch"));
}

- (id)_axSwitchLabel
{
  void *v2;
  void *v3;

  -[CPSPermissionItemViewAccessibility _axLabeledSwitchStack](self, "_axLabeledSwitchStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindSubviewDescendant:", &__block_literal_global_204);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __52__CPSPermissionItemViewAccessibility__axSwitchLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23490AD98](CFSTR("CPSVibrantLabel"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
