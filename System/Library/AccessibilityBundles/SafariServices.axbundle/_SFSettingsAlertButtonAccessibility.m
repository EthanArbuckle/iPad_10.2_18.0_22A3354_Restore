@implementation _SFSettingsAlertButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFSettingsAlertButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFSettingsAlertButton"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFSettingsAlertButton"), CFSTR("image"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFSettingsAlertButton"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_SFSettingsAlertButton"), CFSTR("UIControl"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;

  v3 = *MEMORY[0x24BDF73B0];
  v4 = -[_SFSettingsAlertButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled"));
  v5 = *MEMORY[0x24BDF73E8];
  if (v4)
    v5 = 0;
  v6 = v5 | v3;
  -[_SFSettingsAlertButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("image"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("checkmark")) & 1) != 0)
  {
    -[_SFSettingsAlertButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("imageView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_accessibilityViewIsVisible");

    v11 = *MEMORY[0x24BDF7400];
    if (!v10)
      v11 = 0;
    v6 |= v11;
  }
  else
  {

  }
  return v6;
}

- (id)accessibilityLabel
{
  void *v3;

  -[_SFSettingsAlertButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_SFSettingsAlertButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  else
    -[_SFSettingsAlertButtonAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
