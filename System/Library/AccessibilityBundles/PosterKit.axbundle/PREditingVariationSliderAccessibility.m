@implementation PREditingVariationSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingVariationSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PREditingVariationSlider"), CFSTR("value"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingVariationSlider"), CFSTR("_setSliderValue:"), "v", "d", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("editing.variation.slider.label"));
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
  -[PREditingVariationSliderAccessibility _axAdjustSliderValue:](self, "_axAdjustSliderValue:", 1);
}

- (void)accessibilityDecrement
{
  -[PREditingVariationSliderAccessibility _axAdjustSliderValue:](self, "_axAdjustSliderValue:", 0);
}

- (id)accessibilityValue
{
  -[PREditingVariationSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  return (id)AXFormatFloatWithPercentage();
}

- (void)_axAdjustSliderValue:(BOOL)a3
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  void *v8;

  v3 = a3;
  -[PREditingVariationSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
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

uint64_t __62__PREditingVariationSliderAccessibility__axAdjustSliderValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSliderValue:", *(double *)(a1 + 40));
}

@end
