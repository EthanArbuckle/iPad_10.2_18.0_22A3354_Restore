@implementation UIStatusBarThermalColorItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarThermalColorItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIStatusBarThermalColorItemView"), CFSTR("_sunlightMode"), "B");
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3;
  unsigned int v4;
  char v5;
  id v6;
  _BYTE v7[9];
  SEL v8;
  UIStatusBarThermalColorItemViewAccessibility *v9;
  id v10;

  v9 = self;
  v8 = a2;
  v7[8] = 0;
  *(_QWORD *)v7 = -[UIStatusBarThermalColorItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_sunlightMode")) & 1;
  v3 = (id)-[UIStatusBarThermalColorItemViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("_thermalColor"));
  v4 = objc_msgSend(v3, "intValue");

  if (v4 <= 6uLL)
    __asm { BR              X8 }
  *(_QWORD *)&v7[1] = accessibilityLocalizedString(CFSTR("status.thermal.normal"));

  v5 = 0;
  if ((v7[0] & 1) != 0)
  {
    v6 = accessibilityLocalizedString(CFSTR("status.thermal.sunlight.mode"));
    v5 = 1;
  }
  v10 = (id)__UIAXStringForVariables();
  if ((v5 & 1) != 0)

  objc_storeStrong((id *)&v7[1], 0);
  return v10;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarThermalColorItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarThermalColorItemViewAccessibility;
  return -[UIStatusBarThermalColorItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

@end
