@implementation PREditingColorSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingColorSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PREditingColorSlider"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PREditingColorSlider"), CFSTR("value"), "d");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PREditingColorSlider"), CFSTR("displayCurrentColor"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PRPosterColor"), CFSTR("color"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingColorSlider"), CFSTR("_setSliderValue:"), "v", "d", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("editing.color.slider.label"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)accessibilityIncrement
{
  -[PREditingColorSliderAccessibility _axAdjustSliderValue:](self, "_axAdjustSliderValue:", 1);
}

- (void)accessibilityDecrement
{
  -[PREditingColorSliderAccessibility _axAdjustSliderValue:](self, "_axAdjustSliderValue:", 0);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[PREditingColorSliderAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("displayCurrentColor.color"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXColorStringForColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditingColorSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_axAdjustSliderValue:(BOOL)a3
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  void *v8;

  v3 = a3;
  -[PREditingColorSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  v5 = -0.1;
  if (v3)
    v5 = 0.1;
  v6 = v5 + v4;
  if (v6 >= -1.0 && v6 <= 1.0)
  {
    AXPerformSafeBlock();
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendActionsForControlEvents:", 4096);

  }
}

uint64_t __58__PREditingColorSliderAccessibility__axAdjustSliderValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSliderValue:", *(double *)(a1 + 40));
}

@end
