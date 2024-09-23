@implementation BCUIRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BCUIRowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIBatteryView"), CFSTR("isLowBattery"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UIStaticBatteryView"), CFSTR("_UIBatteryView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BCUIRowView"), CFSTR("_batteryView"), "_UIStaticBatteryView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BCUIRowView"), CFSTR("_nameLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[BCUIRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_batteryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isLowBattery"));

  -[BCUIRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nameLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCUIRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_batteryView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCUIRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_batteryView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("battery.center.low.battery"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
