@implementation HUQuickControlRingSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlRingSliderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUQuickControlRingSliderView"), CFSTR("_profile"), "HUQuickControlRingSliderViewProfile");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUQuickControlRingSliderView"), CFSTR("_primaryHandleView"), "HUQuickControlRingSliderHandleView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUQuickControlRingSliderView"), CFSTR("_secondaryHandleView"), "HUQuickControlRingSliderHandleView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlRingSliderView"), CFSTR("supplementaryValueMarkingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlRingSliderView"), CFSTR("primaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlRingSliderView"), CFSTR("supplementaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlRingSliderView"), CFSTR("showOffState"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlRingSliderView"), CFSTR("setUserInteractionActive:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlRingSliderViewProfile"), CFSTR("shouldShowSupplementaryValue"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlRingSliderViewProfile"), CFSTR("gradationMarkingValues"), "@", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("HUQuickControlRingSliderView"), CFSTR("HUQuickControlInteractiveView"));
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("HUQuickControlInteractiveView"), CFSTR("interactionDelegate"), 1, 1);
  objc_msgSend(v3, "validateProtocol:conformsToProtocol:", CFSTR("HUQuickControlInteractiveView"), CFSTR("HUQuickControlControllableView"));
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("HUQuickControlControllableView"), CFSTR("value"), 1, 1);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("HUQuickControlControllableView"), CFSTR("setValue:"), 1, 1);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUQuickControlRingSliderHandleView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("HUQuickControlRingSliderInteractionCoordinator"), CFSTR("HUQuickControlViewInteractionDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlRingSliderInteractionCoordinator"), CFSTR("value"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlRingSliderInteractionCoordinator"), CFSTR("setUserInteractionActive:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlRingSliderInteractionCoordinator"), CFSTR("setFirstTouchDown:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUQuickControlRingSliderInteractionCoordinator"), CFSTR("_delegate"), "<HUQuickControlInteractionCoordinatorDelegate>");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUQuickControlRingSliderInteractionCoordinator"), CFSTR("HUQuickControlInteractionCoordinator"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("HUQuickControlRingSliderRangeViewController"), CFSTR("HUQuickControlRingSliderInteractionCoordinatorDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlRingSliderRangeViewController"), CFSTR("modelValueDidChange"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUQuickControlRingSliderRangeViewController"), CFSTR("HUQuickControlSingleControlViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSingleControlViewController"), CFSTR("modelValue"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSingleControlViewController"), CFSTR("controlItem"), "@", 0);
  objc_msgSend(v3, "validateProtocol:conformsToProtocol:", CFSTR("HUQuickControlRingSliderInteractionCoordinatorDelegate"), CFSTR("HUQuickControlInteractionCoordinatorDelegate"));
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("HUQuickControlInteractionCoordinatorDelegate"), CFSTR("interactionCoordinator:viewValueDidChange:"), 1, 1);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFNumberRange"), CFSTR("setMaxValue:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFNumberRange"), CFSTR("setMinValue:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFNumberRange"), CFSTR("setMidValue:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
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
  id location;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)HUQuickControlRingSliderViewAccessibility;
  -[HUQuickControlRingSliderViewAccessibility _accessibilityLoadAccessibilityInformation](&v34, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BEBB110];
  -[HUQuickControlRingSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_primaryHandleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v31[3] = &unk_250234958;
  objc_copyWeak(&v32, &location);
  objc_msgSend(v4, "_setIsAccessibilityElementBlock:", v31);
  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v29[3] = &unk_250234568;
  objc_copyWeak(&v30, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v29);
  v6 = *MEMORY[0x24BDF7430] | *MEMORY[0x24BDF73A0] | v3;
  objc_msgSend(v4, "setAccessibilityTraits:", v6);
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v27[3] = &unk_250234568;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", v27);
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v25[3] = &unk_250234980;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v4, "_setAccessibilityIncrementBlock:", v25);
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v23[3] = &unk_250234980;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v4, "_setAccessibilityDecrementBlock:", v23);
  -[HUQuickControlRingSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondaryHandleView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v21[3] = &unk_250234958;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v7, "_setIsAccessibilityElementBlock:", v21);
  accessibilityHomeUILocalizedString(CFSTR("ring.slider.lower.limit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  objc_msgSend(v7, "setAccessibilityTraits:", v6);
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v19[3] = &unk_250234568;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v7, "_setAccessibilityValueBlock:", v19);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
  v17[3] = &unk_250234980;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v7, "_setAccessibilityIncrementBlock:", v17);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9;
  v15[3] = &unk_250234980;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "_setAccessibilityDecrementBlock:", v15);
  -[HUQuickControlRingSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("supplementaryValueMarkingView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_10;
  v13[3] = &unk_250234958;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "_setIsAccessibilityElementBlock:", v13);
  accessibilityHomeUILocalizedString(CFSTR("ring.slider.current.value.indicator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_11;
  v11[3] = &unk_250234568;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v9, "_setAccessibilityValueBlock:", v11);
  objc_destroyWeak(&v12);
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
  objc_destroyWeak(&location);

}

uint64_t __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_primaryHandleView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

id __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axInteractionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "type") == 1)
    v6 = CFSTR("ring.slider.upper.limit");
  else
    v6 = CFSTR("ring.slider.target.value");
  accessibilityHomeUILocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_opt_class();
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "_axInteractionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "type");
  v7 = objc_loadWeakRetained(a1);
  v8 = v7;
  if (v6 == 1)
    v9 = 1;
  else
    v9 = 3;
  objc_msgSend(v7, "_axLocalizedStringForAXControlValueType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axAdjustValueOfUpperBound:increment:", 1, 1);

}

void __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axAdjustValueOfUpperBound:increment:", 1, 0);

}

uint64_t __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_secondaryHandleView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

id __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axLocalizedStringForAXControlValueType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axAdjustValueOfUpperBound:increment:", 0, 1);

}

void __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axAdjustValueOfUpperBound:increment:", 0, 0);

}

uint64_t __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_10(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_profile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("shouldShowSupplementaryValue")))
  {
    v4 = objc_loadWeakRetained(v1);
    v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("showOffState")) ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axLocalizedStringForAXControlValueType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HUQuickControlRingSliderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v3 = (void *)MEMORY[0x24BDBCE30];
  -[HUQuickControlRingSliderViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("supplementaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("primaryLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_primaryHandleView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondaryHandleView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("supplementaryValueMarkingView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 5, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_axLocalizedStringForAXControlValueType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[HUQuickControlRingSliderViewAccessibility _axViewController](self, "_axViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_opt_class();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("modelValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    switch(a3)
    {
      case 3uLL:
        objc_msgSend(v6, "targetValue");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      case 2uLL:
        objc_msgSend(v6, "minimumValue");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      case 1uLL:
        objc_msgSend(v6, "maximumValue");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        v11 = 0;
        goto LABEL_12;
    }
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("controlItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BE4CE50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD5880]);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v7;
  if (!v7)
  {
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BE4D0A0], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "temperatureFormatter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringForObjectValue:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v14;
}

- (void)_axAdjustValueOfUpperBound:(BOOL)a3 increment:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void (*v20)(uint64_t);
  double *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  double v26;
  id v27;
  _QWORD *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  id v36;
  _QWORD v37[7];
  _QWORD v38[7];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  void *v46;
  HUQuickControlRingSliderViewAccessibility *v47;
  id v48;

  v4 = a4;
  v5 = a3;
  -[HUQuickControlRingSliderViewAccessibility _axAdjustmentDelta](self, "_axAdjustmentDelta");
  if (v4)
    v8 = v7;
  else
    v8 = -v7;
  -[HUQuickControlRingSliderViewAccessibility _axInteractionDelegate](self, "_axInteractionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v43 = MEMORY[0x24BDAC760];
  v44 = 3221225472;
  v45 = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke;
  v46 = &unk_2502349A8;
  v47 = self;
  v11 = v9;
  v48 = v11;
  AXPerformSafeBlock();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("value"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v42 = 0;
    objc_opt_class();
    objc_msgSend(v11, "safeValueForKey:", CFSTR("value"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "type") == 1)
    {
      if (v5)
      {
        objc_msgSend(v15, "maxValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v8 + v17;

        v19 = fmax(fmin(v18, 1.0), 0.0);
        v41 = v10;
        v20 = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_2;
        v21 = (double *)&v41;
      }
      else
      {
        objc_msgSend(v15, "minValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "doubleValue");
        v34 = v8 + v33;

        v19 = fmax(fmin(v34, 1.0), 0.0);
        v40 = v10;
        v20 = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_3;
        v21 = (double *)&v40;
      }
    }
    else
    {
      objc_msgSend(v15, "midValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      v31 = v8 + v30;

      v19 = fmax(fmin(v31, 1.0), 0.0);
      v39 = v10;
      v20 = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_4;
      v21 = (double *)&v39;
    }
    *((_QWORD *)v21 + 1) = 3221225472;
    *((_QWORD *)v21 + 2) = v20;
    *((_QWORD *)v21 + 3) = &unk_2502349D0;
    v27 = v15;
    *((_QWORD *)v21 + 4) = v27;
    v21[5] = v19;
    AXPerformSafeBlock();

    v38[0] = v10;
    v38[1] = 3221225472;
    v38[2] = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_5;
    v38[3] = &unk_2502349F8;
    v38[4] = v11;
    v38[5] = v27;
    v28 = v38;
    goto LABEL_13;
  }
  objc_msgSend(v11, "safeValueForKey:", CFSTR("value"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v23 = objc_opt_isKindOfClass();

  if ((v23 & 1) != 0)
  {
    v42 = 0;
    objc_opt_class();
    objc_msgSend(v11, "safeValueForKey:", CFSTR("value"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "doubleValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", fmax(fmin(v8 + v26, 1.0), 0.0));
    v27 = (id)objc_claimAutoreleasedReturnValue();

    v37[0] = v10;
    v37[1] = 3221225472;
    v37[2] = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_6;
    v37[3] = &unk_2502349F8;
    v37[4] = v11;
    v37[5] = v27;
    v28 = v37;
LABEL_13:
    v28[6] = self;
    v35 = v27;
    AXPerformSafeBlock();

  }
  v36 = v11;
  AXPerformSafeBlock();

}

uint64_t __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionActive:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setUserInteractionActive:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "setFirstTouchDown:", 1);
}

void __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setMaxValue:", v2);

}

void __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setMinValue:", v2);

}

void __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setMidValue:", v2);

}

void __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_5(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setValue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_axViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("modelValueDidChange"));
  objc_msgSend(v3, "interactionCoordinator:viewValueDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_6(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setValue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_axViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("modelValueDidChange"));
  objc_msgSend(v3, "interactionCoordinator:viewValueDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionActive:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setUserInteractionActive:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setFirstTouchDown:", 0);
}

- (double)_axAdjustmentDelta
{
  void *v2;
  void *v3;
  double v4;

  -[HUQuickControlRingSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_profile"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("gradationMarkingValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
    v4 = 1.0 / (double)(unint64_t)objc_msgSend(v3, "count");
  else
    v4 = 0.0189999994;

  return v4;
}

- (id)_axInteractionDelegate
{
  void *v2;
  id v3;

  -[HUQuickControlRingSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("interactionDelegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234911848](CFSTR("HUQuickControlRingSliderInteractionCoordinator"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)_axViewController
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[HUQuickControlRingSliderViewAccessibility _axInteractionDelegate](self, "_axInteractionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  NSProtocolFromString(CFSTR("HUQuickControlRingSliderInteractionCoordinatorDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "conformsToProtocol:", v4);

  if (v5)
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

@end
