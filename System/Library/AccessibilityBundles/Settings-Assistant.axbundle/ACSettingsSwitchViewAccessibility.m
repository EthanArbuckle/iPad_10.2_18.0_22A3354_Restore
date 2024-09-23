@implementation ACSettingsSwitchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSettingsSwitchView");
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
  void *v2;
  void *v3;

  -[ACSettingsSwitchViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  -[ACSettingsSwitchViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("switchControl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("isOn"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = CFSTR("settings.status.on");
  else
    v4 = CFSTR("settings.status.off");
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[ACSettingsSwitchViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("switchControl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
