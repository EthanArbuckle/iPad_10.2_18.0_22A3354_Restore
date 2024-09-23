@implementation _UIStatusBarThermalItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarThermalItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
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
  v4 = CFSTR("_UIStatusBarItemUpdate");
  objc_msgSend(location[0], "validateClass:");
  v5 = CFSTR("_UIStatusBarThermalItem");
  v3 = CFSTR("_UIStatusBarIndicatorItem");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIStatusBarIndicatorItem"), CFSTR("imageView"));
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIStatusBarData"), CFSTR("thermalEntry"), "@");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIStatusBarItemUpdate"), CFSTR("data"), "@");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIStatusBarDataThermalEntry"), CFSTR("color"), "q");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarThermalItem"), CFSTR("imageForUpdate:"), "@", 0);
  objc_storeStrong(v8, v7);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  void *v3;
  id v4[2];
  id v5;
  id v6;
  objc_super v7;
  SEL v8;
  _UIStatusBarThermalItemAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarThermalItemAccessibility;
  -[_UIStatusBarThermalItemAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  v6 = (id)-[_UIStatusBarThermalItemAccessibility _accessibilityValueForKey:](v9, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarUpdateData"));
  NSClassFromString(CFSTR("_UIStatusBarItemUpdate"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id)-[_UIStatusBarThermalItemAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("imageView"));
    v2 = (id)objc_msgSend(v6, "safeValueForKeyPath:", CFSTR("data.thermalEntry"));
    v3 = (void *)objc_msgSend(v2, "safeIntegerForKey:", CFSTR("color"));

    v4[1] = v3;
    v4[0] = 0;
    if ((unint64_t)v3 <= 5)
      __asm { BR              X8 }
    objc_msgSend(v5, "setIsAccessibilityElement:", 1);
    objc_msgSend(v5, "setAccessibilityLabel:", v4[0]);
    objc_storeStrong(v4, 0);
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&v6, 0);
}

- (id)imageForUpdate:(id)a3
{
  id v4;
  objc_super v5;
  id v6;
  id location[2];
  _UIStatusBarThermalItemAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)_UIStatusBarThermalItemAccessibility;
  v6 = -[_UIStatusBarThermalItemAccessibility imageForUpdate:](&v5, sel_imageForUpdate_, location[0]);
  -[_UIStatusBarThermalItemAccessibility _accessibilitySetRetainedValue:forKey:](v8, "_accessibilitySetRetainedValue:forKey:", location[0], CFSTR("AccessibilityStatusBarUpdateData"));
  -[_UIStatusBarThermalItemAccessibility _accessibilityLoadAccessibilityInformation](v8, "_accessibilityLoadAccessibilityInformation");
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

@end
