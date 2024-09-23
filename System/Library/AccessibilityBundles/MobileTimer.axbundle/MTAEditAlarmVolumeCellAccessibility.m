@implementation MTAEditAlarmVolumeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAEditAlarmVolumeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAEditAlarmVolumeCell"), CFSTR("volumeSlider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISlider"), CFSTR("_accessibilityBumpValue:"), "v", "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("alarm.volume"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[MTAEditAlarmVolumeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("volumeSlider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[MTAEditAlarmVolumeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("volumeSlider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (void)accessibilityIncrement
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[MTAEditAlarmVolumeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("volumeSlider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_accessibilityBumpValue:", 1);

}

- (void)accessibilityDecrement
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[MTAEditAlarmVolumeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("volumeSlider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_accessibilityBumpValue:", 0);

}

@end
