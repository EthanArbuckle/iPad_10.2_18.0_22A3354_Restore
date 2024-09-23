@implementation ACSettingsSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSettingsSliderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ACSettingsSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("allTargets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("_setting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[ACSettingsSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)accessibilityDecrement
{
  id v2;

  -[ACSettingsSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDecrement");

}

- (void)accessibilityIncrement
{
  id v2;

  -[ACSettingsSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIncrement");

}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[ACSettingsSliderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

@end
