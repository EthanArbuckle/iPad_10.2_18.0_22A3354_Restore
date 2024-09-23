@implementation _UIStatusBarWifiItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarWifiItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id v5;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = "@";
  v3 = CFSTR("_UIStatusBarWifiItem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("signalView"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("networkIconView"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarItemUpdate"), CFSTR("data"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarData"), CFSTR("wifiEntry"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarDataWifiEntry"), CFSTR("type"), "q", 0);
  objc_storeStrong(v6, v5);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  const __CFString *v2;
  id *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9[2];
  id v10;
  objc_super v11;
  SEL v12;
  _UIStatusBarWifiItemAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarWifiItemAccessibility;
  -[_UIStatusBarWifiItemAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  v10 = (id)-[_UIStatusBarWifiItemAccessibility _accessibilityValueForKey:](v13, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarUpdateData"));
  v6 = (id)objc_msgSend(v10, "safeValueForKeyPath:", CFSTR("data.wifiEntry"));
  v7 = (void *)objc_msgSend(v6, "safeIntegerForKey:", CFSTR("type"));

  v9[1] = v7;
  if (v7 == (void *)1)
  {
    v9[0] = (id)-[_UIStatusBarWifiItemAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("networkIconView"));
    objc_msgSend(v9[0], "setIsAccessibilityElement:", 1);
    v4 = v9[0];
    v5 = accessibilityLocalizedString(CFSTR("status.hotspot.active"));
    objc_msgSend(v4, "setAccessibilityValue:");

    objc_msgSend(v9[0], "setAccessibilityTraits:", *MEMORY[0x24BEBB180]);
    objc_storeStrong(v9, 0);
  }
  else
  {
    v8 = (id)-[_UIStatusBarWifiItemAccessibility safeUIViewForKey:](v13, "safeUIViewForKey:", CFSTR("signalView"));
    if ((MGGetBoolAnswer() & 1) != 0)
      v2 = CFSTR("status.network.wlan.signal.bars");
    else
      v2 = CFSTR("status.network.wifi.signal.bars");
    objc_msgSend(v8, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AccessibilityStatusBarSignalViewLabelKey"), &v8);
    objc_storeStrong(v3, 0);
  }
  objc_storeStrong(&v10, 0);
}

- (_UIStatusBarWifiItemAccessibility)init
{
  _UIStatusBarWifiItemAccessibility *v3;
  objc_super v4;
  SEL v5;
  _UIStatusBarWifiItemAccessibility *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarWifiItemAccessibility;
  v6 = -[_UIStatusBarWifiItemAccessibility init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    -[_UIStatusBarWifiItemAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  objc_super v7;
  id v8;
  id v9;
  id location[2];
  _UIStatusBarWifiItemAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7.receiver = v11;
  v7.super_class = (Class)_UIStatusBarWifiItemAccessibility;
  v8 = -[_UIStatusBarWifiItemAccessibility applyUpdate:toDisplayItem:](&v7, sel_applyUpdate_toDisplayItem_, location[0], v9);
  -[_UIStatusBarWifiItemAccessibility _accessibilitySetRetainedValue:forKey:](v11, "_accessibilitySetRetainedValue:forKey:", location[0], CFSTR("AccessibilityStatusBarUpdateData"));
  -[_UIStatusBarWifiItemAccessibility _accessibilityLoadAccessibilityInformation](v11, "_accessibilityLoadAccessibilityInformation");
  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v6;
}

@end
