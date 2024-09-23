@implementation STUIStatusBarWifiItemAccessibility

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarWifiItemAccessibility;
  v6 = a3;
  -[STUIStatusBarWifiItemAccessibility applyUpdate:toDisplayItem:](&v9, sel_applyUpdate_toDisplayItem_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarWifiItemAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("AccessibilityStatusBarUpdateData"), v9.receiver, v9.super_class);

  -[STUIStatusBarWifiItemAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarWifiItemAccessibility;
  -[STUIStatusBarWifiItemAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[STUIStatusBarWifiItemAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarUpdateData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("data.wifiEntry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("type"));

  if (v5 == 1)
  {
    -[STUIStatusBarWifiItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("networkIconView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsAccessibilityElement:", 1);
    accessibilityLocalizedString(CFSTR("status.hotspot.active"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityValue:", v7);

    objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BEBB180]);
  }
  else
  {
    -[STUIStatusBarWifiItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("signalView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (MGGetBoolAnswer())
      v8 = CFSTR("status.network.wlan.signal.bars");
    else
      v8 = CFSTR("status.network.wifi.signal.bars");
    objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v8, CFSTR("AccessibilityStatusBarSignalViewLabelKey"));
  }

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarWifiItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarWifiItem"), CFSTR("applyUpdate:toDisplayItem:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarWifiItem"), CFSTR("signalView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarWifiItem"), CFSTR("networkIconView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarItemUpdate"), CFSTR("data"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarData"), CFSTR("wifiEntry"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarDataWifiEntry"), CFSTR("type"), "q", 0);

}

- (STUIStatusBarWifiItemAccessibility)init
{
  STUIStatusBarWifiItemAccessibility *v2;
  STUIStatusBarWifiItemAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarWifiItemAccessibility;
  v2 = -[STUIStatusBarWifiItemAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[STUIStatusBarWifiItemAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
