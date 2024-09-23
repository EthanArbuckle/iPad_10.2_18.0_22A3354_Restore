@implementation _PUIStylePickerHomeScreenVariationSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_PUIStylePickerHomeScreenVariationSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_PUIStylePickerHomeScreenVariationSlider"), CFSTR("PUIStyleVariationSlider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUIStyleVariationSlider"), CFSTR("styleCoordinator"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUIStyleVariationSlider"), CFSTR("contextIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUIStyleVariationSlider"), CFSTR("value"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUIStyleUICoordinator"), CFSTR("_coordinatorImpl"), "<PUIStyleUICoordinatorImpl>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_PUIStylePickerHomeScreenGradientSliderUICoordinatorImpl"), CFSTR("effectiveColor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUIStyleVariationSlider"), CFSTR("_setSliderValue:layout:fireActions:"), "v", "d", "B", "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  __CFString *v3;
  void *v4;
  objc_super v6;

  if (-[_PUIStylePickerHomeScreenVariationSliderAccessibility _axIsGradientSlider](self, "_axIsGradientSlider"))
  {
    v3 = CFSTR("home.screen.gradient.slider");
  }
  else
  {
    if (!-[_PUIStylePickerHomeScreenVariationSliderAccessibility _axIsLumaSlider](self, "_axIsLumaSlider"))
    {
      v6.receiver = self;
      v6.super_class = (Class)_PUIStylePickerHomeScreenVariationSliderAccessibility;
      -[_PUIStylePickerHomeScreenVariationSliderAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    v3 = CFSTR("home.screen.luma.slider");
  }
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (void)accessibilityIncrement
{
  -[_PUIStylePickerHomeScreenVariationSliderAccessibility _axSliderValue](self, "_axSliderValue");
  AXPerformSafeBlock();
}

- (void)accessibilityDecrement
{
  -[_PUIStylePickerHomeScreenVariationSliderAccessibility _axSliderValue](self, "_axSliderValue");
  AXPerformSafeBlock();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PUIStylePickerHomeScreenVariationSliderAccessibility;
  return *MEMORY[0x24BDF73A0] | -[_PUIStylePickerHomeScreenVariationSliderAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (-[_PUIStylePickerHomeScreenVariationSliderAccessibility _axIsLumaSlider](self, "_axIsLumaSlider"))
  {
    -[_PUIStylePickerHomeScreenVariationSliderAccessibility _axSliderValue](self, "_axSliderValue");
    AXFormatFloatWithPercentage();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[_PUIStylePickerHomeScreenVariationSliderAccessibility _axIsGradientSlider](self, "_axIsGradientSlider"))
    {
      -[_PUIStylePickerHomeScreenVariationSliderAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("styleCoordinator._coordinatorImpl.effectiveColor"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      AXColorStringForColor();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    }
    v7.receiver = self;
    v7.super_class = (Class)_PUIStylePickerHomeScreenVariationSliderAccessibility;
    -[_PUIStylePickerHomeScreenVariationSliderAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_axIsGradientSlider
{
  void *v2;
  char v3;

  -[_PUIStylePickerHomeScreenVariationSliderAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("contextIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_gradientColorSlider"));

  return v3;
}

- (BOOL)_axIsLumaSlider
{
  void *v2;
  char v3;

  -[_PUIStylePickerHomeScreenVariationSliderAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("contextIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_lumaSlider"));

  return v3;
}

- (double)_axSliderValue
{
  double result;

  -[_PUIStylePickerHomeScreenVariationSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  return result;
}

@end
