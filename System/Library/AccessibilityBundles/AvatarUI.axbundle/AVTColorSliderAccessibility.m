@implementation AVTColorSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTColorSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVTColorSlider"), CFSTR("UISlider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISlider"), CFSTR("minimumValue"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISlider"), CFSTR("maximumValue"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISlider"), CFSTR("value"), "f", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("editor.color.slider"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AVTColorSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("minimumValue"));
  -[AVTColorSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("maximumValue"));
  -[AVTColorSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("value"));
  -[AVTColorSliderAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityMinColorNameKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTColorSliderAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityMaxColorNameKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloatWithPercentage();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AXFormatFloatWithPercentage();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
