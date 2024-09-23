@implementation UIStatusBarBluetoothBatteryItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarBluetoothBatteryItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v3 = (id)-[UIStatusBarBluetoothBatteryItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_capacity"));
  objc_msgSend(v3, "intValue");

  v4 = (void *)MEMORY[0x24BDD17C8];
  v6 = accessibilityLocalizedString(CFSTR("status.bluetooth.battery.format"));
  v5 = (id)AXFormatFloatWithPercentage();
  v7 = (id)objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarBluetoothBatteryItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarBluetoothBatteryItemViewAccessibility;
  return -[UIStatusBarBluetoothBatteryItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

@end
