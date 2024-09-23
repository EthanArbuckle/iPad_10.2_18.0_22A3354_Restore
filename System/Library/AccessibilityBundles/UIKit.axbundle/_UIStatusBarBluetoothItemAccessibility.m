@implementation _UIStatusBarBluetoothItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarBluetoothItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const __CFString *v5;
  const char *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIStatusBarIndicatorItem");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIStatusBarBluetoothItem"));
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIStatusBarIndicatorItem"), CFSTR("imageView"));
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIStatusBarItemUpdate"), CFSTR("data"), "@");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIStatusBarData"), CFSTR("bluetoothEntry"), "@");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarDataEntry"), CFSTR("isEnabled"), "B", 0);
  v4 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarDataBatteryEntry"), CFSTR("capacity"), 0);
  v5 = CFSTR("_UIStatusBarDataBluetoothEntry");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("batteryEntry"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  const __CFString *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id obj;
  id v24;
  uint64_t v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  char v33;
  id v34;
  id v35;
  objc_super v36;
  SEL v37;
  _UIStatusBarBluetoothItemAccessibility *v38;

  v38 = self;
  v37 = a2;
  v36.receiver = self;
  v36.super_class = (Class)_UIStatusBarBluetoothItemAccessibility;
  -[_UIStatusBarBluetoothItemAccessibility _accessibilityLoadAccessibilityInformation](&v36, sel__accessibilityLoadAccessibilityInformation);
  v35 = (id)-[_UIStatusBarBluetoothItemAccessibility _accessibilityValueForKey:](v38, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarUpdateData"));
  v33 = 0;
  objc_opt_class();
  v21 = (id)-[_UIStatusBarBluetoothItemAccessibility safeValueForKey:](v38, "safeValueForKey:", CFSTR("imageView"));
  v32 = (id)__UIAccessibilityCastAsClass();

  v31 = v32;
  objc_storeStrong(&v32, 0);
  v34 = v31;
  v20 = (id)objc_msgSend(v31, "image");
  v30 = (id)objc_msgSend(v20, "accessibilityIdentifier");

  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("bluetooth")) & 1) != 0
    || (objc_msgSend(v30, "isEqualToString:", CFSTR("headphones")) & 1) != 0)
  {
    v29 = accessibilityLocalizedString(CFSTR("bluetooth"));
    v28 = 0;
    if (v35)
    {
      v27 = (id)objc_msgSend(v35, "safeValueForKeyPath:", CFSTR("data.bluetoothEntry"));
      if (v27)
      {
        if (objc_msgSend(v27, "safeBoolForKey:", CFSTR("isEnabled")) & 1)
        {
          v25 = objc_msgSend(v27, "safeIntegerForKey:", CFSTR("state"));
          if (v25)
          {
            if (v25 == 1)
            {
              v4 = accessibilityLocalizedString(CFSTR("status.bluetooth.connected"));
              v5 = v29;
              v29 = v4;

            }
            else if (v25 == 2)
            {
              v6 = accessibilityLocalizedString(CFSTR("status.bluetooth.headphones.connected"));
              v7 = v29;
              v29 = v6;

            }
          }
          else
          {
            v8 = accessibilityLocalizedString(CFSTR("status.bluetooth.disconnected"));
            v9 = v29;
            v29 = v8;

          }
        }
        else
        {
          v2 = accessibilityLocalizedString(CFSTR("bluetooth.off"));
          v3 = v29;
          v29 = v2;

        }
        v24 = (id)objc_msgSend(v35, "safeValueForKeyPath:", CFSTR("data.bluetoothEntry.batteryEntry"));
        if (v24)
        {
          obj = (id)objc_msgSend(v24, "safeStringForKey:", CFSTR("detailString"));
          v22 = 0;
          if (obj)
          {
            objc_storeStrong(&v22, obj);
          }
          else if (objc_msgSend(v24, "safeIntegerForKey:", CFSTR("capacity")) >= 0)
          {
            v10 = (id)AXFormatFloatWithPercentage();
            v11 = v28;
            v28 = v10;

            if ((objc_msgSend(v30, "isEqualToString:", CFSTR("headphones")) & 1) != 0)
              v12 = accessibilityLocalizedString(CFSTR("status.bluetooth.headphones.battery.charge"));
            else
              v12 = accessibilityLocalizedString(CFSTR("status.bluetooth.generic.battery.charge"));
            v13 = v22;
            v22 = v12;

          }
          v17 = v22;
          v18 = CFSTR("__AXStringForVariablesSentinel");
          v14 = (id)__UIAXStringForVariables();
          v15 = v29;
          v29 = v14;

          objc_storeStrong(&v22, 0);
          objc_storeStrong(&obj, 0);
        }
        objc_storeStrong(&v24, 0);
      }
      objc_storeStrong(&v27, 0);
    }
    objc_msgSend(v34, "setAccessibilityValue:", v28, v17, v18);
    objc_msgSend(v34, "setIsAccessibilityElement:", 1);
    objc_msgSend(v34, "setAccessibilityLabel:", v29);
    v19 = v34;
    v16 = objc_msgSend(v34, "accessibilityTraits");
    objc_msgSend(v19, "setAccessibilityTraits:", v16 & ~*MEMORY[0x24BDF73C8]);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  objc_super v7;
  id v8;
  id v9;
  id location[2];
  _UIStatusBarBluetoothItemAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7.receiver = v11;
  v7.super_class = (Class)_UIStatusBarBluetoothItemAccessibility;
  v8 = -[_UIStatusBarBluetoothItemAccessibility applyUpdate:toDisplayItem:](&v7, sel_applyUpdate_toDisplayItem_, location[0], v9);
  -[_UIStatusBarBluetoothItemAccessibility _accessibilitySetRetainedValue:forKey:](v11, "_accessibilitySetRetainedValue:forKey:", location[0], CFSTR("AccessibilityStatusBarUpdateData"));
  -[_UIStatusBarBluetoothItemAccessibility _accessibilityLoadAccessibilityInformation](v11, "_accessibilityLoadAccessibilityInformation");
  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v6;
}

@end
