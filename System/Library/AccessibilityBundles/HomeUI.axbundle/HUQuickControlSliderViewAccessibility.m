@implementation HUQuickControlSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlSliderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSliderView"), CFSTR("sliderValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSliderView"), CFSTR("setSliderValue:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSliderView"), CFSTR("secondarySliderValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSliderView"), CFSTR("setSecondarySliderValue:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlViewControllerAccessibility"), CFSTR("accessibilityControlServiceName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSliderView"), CFSTR("backgroundView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_continuousCornerRadius"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSliderView"), CFSTR("profile"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSliderViewProfile"), CFSTR("hasSecondaryValue"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlElasticSliderInteractionCoordinator"), CFSTR("setActiveGestureValueType:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSliderView"), CFSTR("showOffState"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlElasticSliderInteractionCoordinator"), CFSTR("gestureTransformer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlElasticSliderInteractionCoordinator"), CFSTR("gestureTransformer:sliderValueDidChange:"), "v", "@", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSliderView"), CFSTR("_permittedValueRange"), "{?=dd}", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("_HUQuickControlSingleControlHostView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSingleControlViewController"), CFSTR("controlItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFControlItem"), CFSTR("valueSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFSimpleAggregatedCharacteristicValueSource"), CFSTR("allServices"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HMService"), CFSTR("name"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_axShouldAdjustSecondary
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetShouldAdjustSecondary:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  if (-[HUQuickControlSliderViewAccessibility _axHasSecondarySlider](self, "_axHasSecondarySlider"))
  {
    v3 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityHomeUILocalizedString(CFSTR("controls.adjust.max"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel__axSetAdjustsMax);

    v6 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityHomeUILocalizedString(CFSTR("controls.adjust.min"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithName:target:selector:", v7, self, sel__axSetAdjustsMin);

    v12[0] = v8;
    v12[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HUQuickControlSliderViewAccessibility;
    -[HUQuickControlSliderViewAccessibility accessibilityCustomActions](&v11, sel_accessibilityCustomActions);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_axSetAdjustsMax
{
  -[HUQuickControlSliderViewAccessibility _axSetShouldAdjustSecondary:](self, "_axSetShouldAdjustSecondary:", 0);
  return 1;
}

- (BOOL)_axSetAdjustsMin
{
  -[HUQuickControlSliderViewAccessibility _axSetShouldAdjustSecondary:](self, "_axSetShouldAdjustSecondary:", 1);
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlSliderViewAccessibility;
  return *MEMORY[0x24BDF73A0] | -[HUQuickControlSliderViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF7430];
}

- (id)accessibilityValue
{
  if (-[HUQuickControlSliderViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showOffState")))
  {
    accessibilityHomeUILocalizedString(CFSTR("service.cell.state.off"));
  }
  else
  {
    -[HUQuickControlSliderViewAccessibility _axCurrentPrimary](self, "_axCurrentPrimary");
    AXFormatFloatWithPercentage();
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityIdentifier
{
  return CFSTR("QuickControlSlider");
}

- (void)accessibilityIncrement
{
  double v3;
  double v4;

  -[HUQuickControlSliderViewAccessibility _axCurrentAdjustableValue](self, "_axCurrentAdjustableValue");
  v4 = v3 + 0.0500000007;
  if (v4 > 1.0)
    v4 = 1.0;
  -[HUQuickControlSliderViewAccessibility _axUpdateControlValue:incrementing:](self, "_axUpdateControlValue:incrementing:", 1, v4);
}

- (void)accessibilityDecrement
{
  double v3;
  double v4;

  -[HUQuickControlSliderViewAccessibility _axCurrentAdjustableValue](self, "_axCurrentAdjustableValue");
  v4 = v3 + -0.0500000007;
  if (v4 < 0.0)
    v4 = 0.0;
  -[HUQuickControlSliderViewAccessibility _axUpdateControlValue:incrementing:](self, "_axUpdateControlValue:incrementing:", 0, v4);
}

- (double)_axCurrentAdjustableValue
{
  double result;

  if (-[HUQuickControlSliderViewAccessibility _axHasSecondarySlider](self, "_axHasSecondarySlider")
    && -[HUQuickControlSliderViewAccessibility _axShouldAdjustSecondary](self, "_axShouldAdjustSecondary"))
  {
    -[HUQuickControlSliderViewAccessibility _axCurrentSecondary](self, "_axCurrentSecondary");
  }
  else
  {
    -[HUQuickControlSliderViewAccessibility _axCurrentPrimary](self, "_axCurrentPrimary");
  }
  return result;
}

- (double)_axCurrentPrimary
{
  double result;

  -[HUQuickControlSliderViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("sliderValue"));
  return result;
}

- (double)_axCurrentSecondary
{
  double result;

  -[HUQuickControlSliderViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("secondarySliderValue"));
  return result;
}

- (void)_axUpdateControlValue:(double)a3 incrementing:(BOOL)a4
{
  void *v4;
  _QWORD v5[2];

  -[HUQuickControlSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_permittedValueRange"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 0;
  v5[1] = 0;
  objc_msgSend(v4, "getValue:size:", v5, 16);
  AXPerformSafeBlock();

}

void __76__HUQuickControlSliderViewAccessibility__axUpdateControlValue_incrementing___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "_axHasSecondarySlider"))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_axShouldAdjustSecondary");
  else
    v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityValueForKey:", AXControlUpdateDelegateKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  if (v2)
    v4 = 1;
  else
    v4 = 2;
  objc_msgSend(v3, "setActiveGestureValueType:", v4);
  objc_msgSend(v8, "safeValueForKey:", CFSTR("gestureTransformer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gestureTransformer:sliderValueDidChange:", v5, *(double *)(a1 + 40));

  objc_msgSend(v8, "setActiveGestureValueType:", 0);
  v6 = *(void **)(a1 + 32);
  v7 = *(double *)(a1 + 40);
  if (v2)
    objc_msgSend(v6, "setSecondarySliderValue:", v7);
  else
    objc_msgSend(v6, "setSliderValue:", v7);

}

- (id)_accessibilitySingleControlHostViewController
{
  void *v2;
  void *v3;

  -[HUQuickControlSliderViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __86__HUQuickControlSliderViewAccessibility__accessibilitySingleControlHostViewController__block_invoke(uint64_t a1, void *a2)
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

  -[HUQuickControlSliderViewAccessibility _accessibilitySingleControlHostViewController](self, "_accessibilitySingleControlHostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("controlItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityControlName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUQuickControlSliderViewAccessibility _accessibilityControlItem](self, "_accessibilityControlItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKeyPath:", CFSTR("valueSource.allServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_axHasSecondarySlider
{
  void *v2;
  char v3;

  -[HUQuickControlSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("profile"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("hasSecondaryValue"));

  return v3;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[HUQuickControlSliderViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("_continuousCornerRadius"));
  v4 = v3;
  v5 = v3 * 0.5;
  -[HUQuickControlSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("backgroundView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8 - v5;
  v16 = v10 - v5;
  v17 = v4 + v12;
  v18 = v4 + v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

@end
