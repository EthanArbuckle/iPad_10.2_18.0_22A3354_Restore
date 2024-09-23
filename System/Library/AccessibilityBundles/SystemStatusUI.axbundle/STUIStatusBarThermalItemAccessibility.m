@implementation STUIStatusBarThermalItemAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarThermalItemAccessibility;
  -[STUIStatusBarThermalItemAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[STUIStatusBarThermalItemAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarUpdateData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349217D4](CFSTR("STUIStatusBarItemUpdate"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[STUIStatusBarThermalItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("data.thermalEntry"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("color"));

    if (v6 > 5)
    {
      v7 = 0;
    }
    else
    {
      accessibilityLocalizedString(off_25039DA08[v6]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setIsAccessibilityElement:", 1);
    objc_msgSend(v4, "setAccessibilityLabel:", v7);

  }
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarThermalItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarItemUpdate"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarThermalItem"), CFSTR("STUIStatusBarIndicatorItem"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("STUIStatusBarIndicatorItem"), CFSTR("imageView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("STStatusBarData"), CFSTR("thermalEntry"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("STUIStatusBarItemUpdate"), CFSTR("data"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("STStatusBarDataThermalEntry"), CFSTR("color"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarThermalItem"), CFSTR("imageForUpdate:"), "@", "@", 0);

}

- (id)imageForUpdate:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarThermalItemAccessibility;
  v4 = a3;
  -[STUIStatusBarThermalItemAccessibility imageForUpdate:](&v7, sel_imageForUpdate_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarThermalItemAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("AccessibilityStatusBarUpdateData"), v7.receiver, v7.super_class);

  -[STUIStatusBarThermalItemAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v5;
}

@end
