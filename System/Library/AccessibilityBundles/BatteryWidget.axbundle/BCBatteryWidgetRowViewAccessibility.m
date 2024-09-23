@implementation BCBatteryWidgetRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BCBatteryWidgetRowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BCBatteryWidgetRowView"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BCBatteryWidgetRowView"), CFSTR("glyphImage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BCBatteryWidgetRowView"), CFSTR("_percentCharge"), "NSUInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BCBatteryWidgetRowView"), CFSTR("_charging"), "B");

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
  void *v7;

  -[BCBatteryWidgetRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCBatteryWidgetRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("glyphImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityValue
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[BCBatteryWidgetRowViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_percentCharge"));
  if (-[BCBatteryWidgetRowViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_charging")))
    v3 = CFSTR("device.charge.value.charging");
  else
    v3 = CFSTR("device.charge.value");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  AXFormatFloatWithPercentage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
