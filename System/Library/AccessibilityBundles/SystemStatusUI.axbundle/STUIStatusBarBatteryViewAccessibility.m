@implementation STUIStatusBarBatteryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarBatteryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBar"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarBatteryView"), CFSTR("_UIBatteryView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[STUIStatusBarBatteryViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chargePercent");
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("status.battery.capacity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatFloatWithPercentage();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (objc_msgSend(v5, "saverModeActive"))
    {
      accessibilityLocalizedString(CFSTR("status.low.power.mode"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    __UIAXStringForVariables();
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  objc_super v11;
  char v12;

  -[STUIStatusBarBatteryViewAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v12 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "showsInlineChargingIndicator"))
    {
      v5 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v7 = objc_msgSend(v6, "chargingState");
    if ((unint64_t)(v7 - 1) >= 2)
    {
      if (v7)
      {
        v11.receiver = self;
        v11.super_class = (Class)STUIStatusBarBatteryViewAccessibility;
        -[STUIStatusBarBatteryViewAccessibility accessibilityValue](&v11, sel_accessibilityValue);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v8 = CFSTR("status.not.charging");
    }
    else
    {
      v8 = CFSTR("status.battery.charging");
    }
    accessibilityLocalizedString(v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v5 = (id)v9;
    goto LABEL_12;
  }
  v5 = v3;
LABEL_13:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarBatteryViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[STUIStatusBarBatteryViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180] | *MEMORY[0x24BEBB0F8];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v4;

  if ((-[STUIStatusBarBatteryViewAccessibility _axInStatusBar](self) & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarBatteryViewAccessibility;
  return -[STUIStatusBarBatteryViewAccessibility _accessibilitySupportsActivateAction](&v4, sel__accessibilitySupportsActivateAction);
}

- (void)_axInStatusBar
{
  void *v1;

  if (result)
  {
    objc_msgSend(result, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349217D4](CFSTR("STUIStatusBar")));
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    return (void *)(v1 != 0);
  }
  return result;
}

@end
