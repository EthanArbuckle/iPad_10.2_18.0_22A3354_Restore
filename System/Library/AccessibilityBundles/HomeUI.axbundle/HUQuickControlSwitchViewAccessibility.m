@implementation HUQuickControlSwitchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlSwitchView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSwitchView"), CFSTR("wellView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUQuickControlSwitchView"), CFSTR("_switchValue"), "CGFloat");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSwitchView"), CFSTR("setSwitchValue:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("_HUQuickControlSingleControlHostView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSingleControlViewController"), CFSTR("controlItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFPrimaryStateControlItem"), CFSTR("primaryStateCharacteristicType"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFItem"), CFSTR("latestResults"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlElasticSliderInteractionCoordinator"), CFSTR("_updateModelValue:roundValue:notifyDelegate:"), "v", "{?=dd}", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlElasticSliderInteractionCoordinator"), CFSTR("setActiveGestureValueType:"), "v", "Q", 0);

}

- (id)accessibilityIdentifier
{
  return CFSTR("QuickControlSwitch");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[HUQuickControlSwitchViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("wellView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0] | *MEMORY[0x24BDF73B0];
}

- (void)accessibilityIncrement
{
  double v3;

  -[HUQuickControlSwitchViewAccessibility _accessibilitySwitchValue](self, "_accessibilitySwitchValue");
  if (v3 != 1.0)
    -[HUQuickControlSwitchViewAccessibility _accessibilitySetSwitchValue:](self, "_accessibilitySetSwitchValue:", 1.0);
}

- (void)accessibilityDecrement
{
  double v3;

  -[HUQuickControlSwitchViewAccessibility _accessibilitySwitchValue](self, "_accessibilitySwitchValue");
  if (v3 != 0.0)
    -[HUQuickControlSwitchViewAccessibility _accessibilitySetSwitchValue:](self, "_accessibilitySetSwitchValue:", 0.0);
}

- (double)_accessibilitySwitchValue
{
  double result;

  -[HUQuickControlSwitchViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("_switchValue"));
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  double v3;
  BOOL v4;
  double v5;

  -[HUQuickControlSwitchViewAccessibility _accessibilitySwitchValue](self, "_accessibilitySwitchValue");
  v4 = v3 == 1.0;
  v5 = 0.0;
  if (!v4)
    v5 = 1.0;
  -[HUQuickControlSwitchViewAccessibility _accessibilitySetSwitchValue:](self, "_accessibilitySetSwitchValue:", v5);
  return 1;
}

- (void)_accessibilitySetSwitchValue:(double)a3
{
  AXPerformSafeBlock();
}

void __70__HUQuickControlSwitchViewAccessibility__accessibilitySetSwitchValue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setSwitchValue:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityValueForKey:", AXControlUpdateDelegateKey);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActiveGestureValueType:", 0);
  objc_msgSend(v2, "_updateModelValue:roundValue:notifyDelegate:", 1, 1, 0.0, *(double *)(a1 + 40));

}

- (id)_accessibilitySingleControlHostViewController
{
  void *v2;
  void *v3;

  -[HUQuickControlSwitchViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_11, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __86__HUQuickControlSwitchViewAccessibility__accessibilitySingleControlHostViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234911848](CFSTR("_HUQuickControlSingleControlHostView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityControlItem
{
  void *v2;
  void *v3;

  -[HUQuickControlSwitchViewAccessibility _accessibilitySingleControlHostViewController](self, "_accessibilitySingleControlHostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("controlItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityControlName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[HUQuickControlSwitchViewAccessibility _accessibilityControlItem](self, "_accessibilityControlItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("latestResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityStateForPrimaryCharacteristic
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  const __CFString *v7;
  const __CFString *v8;
  double v9;
  double v10;
  __CFString *v11;
  void *v12;

  -[HUQuickControlSwitchViewAccessibility _accessibilityControlItem](self, "_accessibilityControlItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("primaryStateCharacteristicType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD5850]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD5A50]))
  {
    -[HUQuickControlSwitchViewAccessibility _accessibilitySwitchValue](self, "_accessibilitySwitchValue");
    v6 = vabdd_f64(1.0, v5);
    v7 = CFSTR("state.lock.locked");
    v8 = CFSTR("state.lock.unlocked");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD5818]) & 1) != 0
         || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD5A18]))
  {
    -[HUQuickControlSwitchViewAccessibility _accessibilitySwitchValue](self, "_accessibilitySwitchValue");
    v6 = vabdd_f64(1.0, v9);
    v7 = CFSTR("state.door.closed");
    v8 = CFSTR("state.door.open");
  }
  else
  {
    -[HUQuickControlSwitchViewAccessibility _accessibilitySwitchValue](self, "_accessibilitySwitchValue");
    v6 = vabdd_f64(1.0, v10);
    v7 = CFSTR("state.switch.off");
    v8 = CFSTR("state.switch.on");
  }
  if (v6 >= 0.01)
    v11 = (__CFString *)v7;
  else
    v11 = (__CFString *)v8;
  accessibilityHomeUILocalizedString(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
