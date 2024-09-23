@implementation MKPitchControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPitchControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPitchControl"), CFSTR("sliderPercent"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPitchControl"), CFSTR("setSliderPercent:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPitchControl"), CFSTR("degreesForPercent:"), "d", "d", 0);

}

- (id)accessibilityLabel
{
  return AXMapKitLocString(CFSTR("PITCH_BUTTON"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  -[MKPitchControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("sliderPercent"));
  AXFormatFloatWithPercentage();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  AXLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  AXPerformSafeBlock();
  v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  LODWORD(v6) = llround(v5);
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__MKPitchControlAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "safeDoubleForKey:", CFSTR("sliderPercent"));
  result = objc_msgSend(v2, "degreesForPercent:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (double)_accessibilityNumberValue
{
  double result;

  -[MKPitchControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("sliderPercent"));
  return result;
}

- (double)_accessibilityMinValue
{
  return 0.0;
}

- (double)_accessibilityMaxValue
{
  return 1.0;
}

- (void)_accessibilityBumpValue:(BOOL)a3
{
  -[MKPitchControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("sliderPercent"));
  AXPerformSafeBlock();
}

uint64_t __55__MKPitchControlAccessibility__accessibilityBumpValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSliderPercent:", *(double *)(a1 + 40));
}

- (void)accessibilityIncrement
{
  -[MKPitchControlAccessibility _accessibilityBumpValue:](self, "_accessibilityBumpValue:", 1);
}

- (void)accessibilityDecrement
{
  -[MKPitchControlAccessibility _accessibilityBumpValue:](self, "_accessibilityBumpValue:", 0);
}

- (int64_t)_accessibilityOrientation
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
