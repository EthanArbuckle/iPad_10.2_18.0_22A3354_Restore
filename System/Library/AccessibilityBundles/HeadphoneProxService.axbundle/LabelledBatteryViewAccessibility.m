@implementation LabelledBatteryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HeadphoneProxService.LabelledBatteryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axBatteryType
{
  JUMPOUT(0x2349104A0);
}

- (void)_axSetBatteryType:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("HeadphoneProxService.LabelledBatteryView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HeadphoneProxService.LabelledBatteryView"), CFSTR("batteryView"), "_UIBatteryView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[LabelledBatteryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("batteryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LabelledBatteryViewAccessibility _axBatteryType](self, "_axBatteryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[LabelledBatteryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("batteryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  -[LabelledBatteryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("batteryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
