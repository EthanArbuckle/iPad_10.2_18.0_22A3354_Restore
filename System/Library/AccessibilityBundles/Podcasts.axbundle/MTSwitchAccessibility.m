@implementation MTSwitchAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTSwitch");
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
  int v3;
  void *v4;

  -[MTSwitchAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AudioVideoSwitch"));

  if (v3)
  {
    accessibilityLocalizedString(CFSTR("av.switch.label"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;

  -[MTSwitchAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AudioVideoSwitch"));

  if (v4)
  {
    -[MTSwitchAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isOn"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
      v7 = CFSTR("av.switch.value.video");
    else
      v7 = CFSTR("av.switch.value.audio");
    accessibilityLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
