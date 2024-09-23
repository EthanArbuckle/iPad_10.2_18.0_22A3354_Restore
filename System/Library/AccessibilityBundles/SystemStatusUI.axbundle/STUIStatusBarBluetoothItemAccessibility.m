@implementation STUIStatusBarBluetoothItemAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const __CFString *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)STUIStatusBarBluetoothItemAccessibility;
  -[STUIStatusBarBluetoothItemAccessibility _accessibilityLoadAccessibilityInformation](&v25, sel__accessibilityLoadAccessibilityInformation);
  -[STUIStatusBarBluetoothItemAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarUpdateData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[STUIStatusBarBluetoothItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("bluetooth")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("headphones")))
  {
    accessibilityLocalizedString(CFSTR("bluetooth"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v13 = 0;
LABEL_25:
      objc_msgSend(v5, "setAccessibilityValue:", v13, v23, v24);
      objc_msgSend(v5, "setIsAccessibilityElement:", 1);
      objc_msgSend(v5, "setAccessibilityLabel:", v8);
      v22 = objc_msgSend(v5, "accessibilityTraits");
      objc_msgSend(v5, "setAccessibilityTraits:", v22 & ~*MEMORY[0x24BDF73C8]);

      goto LABEL_26;
    }
    objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("data.bluetoothEntry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      v13 = 0;
LABEL_24:

      goto LABEL_25;
    }
    if (objc_msgSend(v9, "safeBoolForKey:", CFSTR("isEnabled")))
    {
      v11 = objc_msgSend(v10, "safeIntegerForKey:", CFSTR("state"));
      if (v11 > 2)
      {
LABEL_12:
        objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("data.bluetoothEntry.batteryEntry"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "safeStringForKey:", CFSTR("detailString"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            v19 = v17;
            v13 = 0;
          }
          else if (objc_msgSend(v16, "safeIntegerForKey:", CFSTR("capacity")) < 0)
          {
            v13 = 0;
            v19 = 0;
          }
          else
          {
            AXFormatFloatWithPercentage();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v7, "isEqualToString:", CFSTR("headphones")))
              v20 = CFSTR("status.bluetooth.headphones.battery.charge");
            else
              v20 = CFSTR("status.bluetooth.generic.battery.charge");
            accessibilityLocalizedString(v20);
            v19 = (id)objc_claimAutoreleasedReturnValue();
          }
          v23 = v19;
          v24 = CFSTR("__AXStringForVariablesSentinel");
          __UIAXStringForVariables();
          v21 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v21;
        }
        else
        {
          v13 = 0;
        }

        goto LABEL_24;
      }
      v12 = off_25039DA60[v11];
    }
    else
    {
      v12 = CFSTR("bluetooth.off");
    }
    accessibilityLocalizedString(v12);
    v14 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v14;
    goto LABEL_12;
  }
LABEL_26:

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarBluetoothItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarBluetoothItem"), CFSTR("STUIStatusBarIndicatorItem"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("STUIStatusBarIndicatorItem"), CFSTR("imageView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("STUIStatusBarItemUpdate"), CFSTR("data"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("STStatusBarData"), CFSTR("bluetoothEntry"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarDataEntry"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarDataBatteryEntry"), CFSTR("capacity"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarDataBluetoothEntry"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarDataBluetoothEntry"), CFSTR("batteryEntry"), "@", 0);

}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarBluetoothItemAccessibility;
  v6 = a3;
  -[STUIStatusBarBluetoothItemAccessibility applyUpdate:toDisplayItem:](&v9, sel_applyUpdate_toDisplayItem_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarBluetoothItemAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("AccessibilityStatusBarUpdateData"), v9.receiver, v9.super_class);

  -[STUIStatusBarBluetoothItemAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v7;
}

@end
