@implementation VideosUISeasonPickerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.SeasonPickerButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.SeasonPickerButton"), CFSTR("accessibilityCurrentLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.SeasonPickerButton"), CFSTR("accessibilityAltLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.SeasonPickerButton"), CFSTR("accessibilityHeaderTitles"), "@");

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
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  objc_opt_class();
  -[VideosUISeasonPickerButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCurrentLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[VideosUISeasonPickerButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAltLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  _BOOL4 v2;
  unint64_t *v3;

  v2 = -[VideosUISeasonPickerButtonAccessibility _accessibilityMultipleSeasonsAvailable](self, "_accessibilityMultipleSeasonsAvailable");
  v3 = (unint64_t *)MEMORY[0x24BDF73B0];
  if (!v2)
    v3 = (unint64_t *)MEMORY[0x24BDF73C0];
  return *v3;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[VideosUISeasonPickerButtonAccessibility _accessibilityMultipleSeasonsAvailable](self, "_accessibilityMultipleSeasonsAvailable"))
  {
    accessibilityLocalizedString(CFSTR("season.picker.button.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VideosUISeasonPickerButtonAccessibility;
    -[VideosUISeasonPickerButtonAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_accessibilityMultipleSeasonsAvailable
{
  void *v2;
  BOOL v3;

  -[VideosUISeasonPickerButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityHeaderTitles"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

@end
