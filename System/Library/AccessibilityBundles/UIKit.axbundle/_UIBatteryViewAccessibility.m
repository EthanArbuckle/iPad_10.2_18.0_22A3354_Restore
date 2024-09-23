@implementation _UIBatteryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIBatteryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBar"));
  v3 = CFSTR("_UIBatteryView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("saverModeActive"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("chargingState"), "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("showsInlineChargingIndicator"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[_UIBatteryViewAccessibility storedIsAccessibilityElement](self, "storedIsAccessibilityElement");
  v5 = v2 == 0;

  if (v5)
    return 1;
  v4 = (id)-[_UIBatteryViewAccessibility storedIsAccessibilityElement](self, "storedIsAccessibilityElement");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (id)accessibilityLabel
{
  void *v2;
  id v3;
  id v4;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10[2];
  int v11;
  id v12[2];
  _UIBatteryViewAccessibility *v13;
  id v14;

  v13 = self;
  v12[1] = (id)a2;
  v12[0] = (id)-[_UIBatteryViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (v12[0])
  {
    v14 = v12[0];
    v11 = 1;
  }
  else
  {
    -[_UIBatteryViewAccessibility safeCGFloatForKey:](v13, "safeCGFloatForKey:", CFSTR("chargePercent"));
    v10[1] = v2;
    v6 = (void *)MEMORY[0x24BDD17C8];
    v8 = accessibilityLocalizedString(CFSTR("status.battery.capacity"));
    v7 = (id)AXFormatFloatWithPercentage();
    v10[0] = (id)objc_msgSend(v6, "stringWithFormat:", v8, v7);

    v9 = 0;
    if ((-[_UIBatteryViewAccessibility safeBoolForKey:](v13, "safeBoolForKey:", CFSTR("saverModeActive")) & 1) != 0)
    {
      v3 = accessibilityLocalizedString(CFSTR("status.low.power.mode"));
      v4 = v9;
      v9 = v3;

    }
    v14 = (id)__UIAXStringForVariables();
    v11 = 1;
    objc_storeStrong(&v9, 0);
    objc_storeStrong(v10, 0);
  }
  objc_storeStrong(v12, 0);
  return v14;
}

- (id)accessibilityValue
{
  char v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;
  uint64_t v11;
  _BYTE v12[9];
  int v13;
  id v14[2];
  _UIBatteryViewAccessibility *v15;
  id v16;

  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)-[_UIBatteryViewAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  if (v14[0])
  {
    v16 = v14[0];
    v13 = 1;
  }
  else
  {
    v12[8] = 0;
    v2 = -[_UIBatteryViewAccessibility safeBoolForKey:](v15, "safeBoolForKey:", CFSTR("showsInlineChargingIndicator"));
    *(_QWORD *)v12 = v2 & 1;
    if ((v2 & 1) != 0)
    {
      v11 = -[_UIBatteryViewAccessibility safeIntegerForKey:](v15, "safeIntegerForKey:", CFSTR("chargingState"));
      if (v11)
      {
        if ((unint64_t)(v11 - 1) > 1)
        {
          v10.receiver = v15;
          v10.super_class = (Class)_UIBatteryViewAccessibility;
          v7 = -[_UIBatteryViewAccessibility accessibilityValue](&v10, sel_accessibilityValue);
          v8 = *(void **)&v12[1];
          *(_QWORD *)&v12[1] = v7;

        }
        else
        {
          v3 = accessibilityLocalizedString(CFSTR("status.battery.charging"));
          v4 = *(void **)&v12[1];
          *(_QWORD *)&v12[1] = v3;

        }
      }
      else
      {
        v5 = accessibilityLocalizedString(CFSTR("status.not.charging"));
        v6 = *(void **)&v12[1];
        *(_QWORD *)&v12[1] = v5;

      }
    }
    v16 = *(id *)&v12[1];
    v13 = 1;
    objc_storeStrong((id *)&v12[1], 0);
  }
  objc_storeStrong(v14, 0);
  return v16;
}

- (BOOL)_axInStatusBar
{
  id v2;

  if (a1)
  {
    v2 = (id)objc_msgSend(a1, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIStatusBar_Base")));

    return v2 != 0;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  unint64_t v4;
  SEL v5;
  _UIBatteryViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIBatteryViewAccessibility;
  v4 = -[_UIBatteryViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF7430];
  if (-[_UIBatteryViewAccessibility _axInStatusBar](v6))
    v4 |= *MEMORY[0x24BEBB180] | *MEMORY[0x24BEBB0F8];
  return v4;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v3;
  SEL v4;
  _UIBatteryViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  if (-[_UIBatteryViewAccessibility _axInStatusBar](self))
    return 1;
  v3.receiver = v5;
  v3.super_class = (Class)_UIBatteryViewAccessibility;
  return -[_UIBatteryViewAccessibility _accessibilitySupportsActivateAction](&v3, sel__accessibilitySupportsActivateAction);
}

- (id)accessibilityHint
{
  objc_super v3;
  SEL v4;
  _UIBatteryViewAccessibility *v5;
  id v6;

  v5 = self;
  v4 = a2;
  if (-[_UIBatteryViewAccessibility _axInStatusBar](self))
  {
    v6 = AXStatusBarItemHint(v5);
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)_UIBatteryViewAccessibility;
    v6 = -[_UIBatteryViewAccessibility accessibilityHint](&v3, sel_accessibilityHint);
  }
  return v6;
}

@end
