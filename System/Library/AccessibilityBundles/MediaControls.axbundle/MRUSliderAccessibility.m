@implementation MRUSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MRUSlider"), CFSTR("UISlider"));
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[MRUSliderAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRUSliderAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");
  }
  v6 = v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUSliderAccessibility;
  return *MEMORY[0x24BDF73A0] | -[MRUSliderAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityValue
{
  -[MRUSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("minimumValue"));
  -[MRUSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("maximumValue"));
  -[MRUSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("value"));
  return (id)AXFormatFloatWithPercentage();
}

- (void)accessibilityIncrement
{
  -[MRUSliderAccessibility _accessibilityBumpValue:](self, "_accessibilityBumpValue:", 1);
}

- (void)accessibilityDecrement
{
  -[MRUSliderAccessibility _accessibilityBumpValue:](self, "_accessibilityBumpValue:", 0);
}

- (void)_accessibilityBumpValue:(BOOL)a3
{
  -[MRUSliderAccessibility _accessibilityIncreaseAmount:](self, "_accessibilityIncreaseAmount:", a3);
  AXPerformSafeBlock();
}

void __50__MRUSliderAccessibility__accessibilityBumpValue___block_invoke(uint64_t a1)
{
  double v1;
  void *v2;

  v1 = *(double *)(a1 + 40);
  *(float *)&v1 = v1;
  objc_msgSend(*(id *)(a1 + 32), "setValue:animated:", 1, v1);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendActionsForControlEvents:", 4096);

}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  _BOOL4 v3;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;

  v3 = a3;
  -[MRUSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("minimumValue"));
  v6 = v5;
  -[MRUSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("maximumValue"));
  v8 = v7;
  -[MRUSliderAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("value"));
  v10 = v9;
  v11 = (v8 - v6) / 10.0;
  if (!v3)
    v11 = -v11;
  v12 = v11 + v10;
  if (v12 >= v6 && vabdd_f64(v12, v6) >= 0.001)
  {
    if (v12 > v8)
      return v8;
    v6 = v12;
    if (vabdd_f64(v12, v8) < 0.001)
      return v8;
  }
  return v6;
}

@end
