@implementation CAMExposureSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMExposureSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("titleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("valueText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("selectedIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("indexCount"), "Q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMExposureSlider"), CFSTR("CEKDiscreteSlider"));
  objc_msgSend(v3, "validateClass:", CFSTR("CAMViewfinderViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_handleExposureSliderDidChangeValue:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExposureSlider"), CFSTR("exposureValue"), "d", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  accessibilityCameraUILocalizedString(CFSTR("exposure.slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExposureSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (id)accessibilityValue
{
  return (id)-[CAMExposureSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("valueText"));
}

- (void)accessibilityDecrement
{
  -[CAMExposureSliderAccessibility _axAdjustValue:](self, "_axAdjustValue:", 0);
}

- (void)accessibilityIncrement
{
  -[CAMExposureSliderAccessibility _axAdjustValue:](self, "_axAdjustValue:", 1);
}

- (void)_axAdjustValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v12 = -[CAMExposureSliderAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("selectedIndex"));
  -[CAMExposureSliderAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10[3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v3)
      v7 = v6 + 1;
    else
      v7 = v6 - 1;
    v10[3] = v7;
    if (v7 < -[CAMExposureSliderAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("indexCount")))
    {
      v8 = v5;
      AXPerformSafeBlock();

    }
  }

  _Block_object_dispose(&v9, 8);
}

uint64_t __49__CAMExposureSliderAccessibility__axAdjustValue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BFB60](CFSTR("CAMViewfinderViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __49__CAMExposureSliderAccessibility__axAdjustValue___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setSelectedIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 40), "_accessibilityViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleExposureSliderDidChangeValue:", *(_QWORD *)(a1 + 32));

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[CAMExposureSliderAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("exposureValue"));
  v6 = v5;
  v9.receiver = self;
  v9.super_class = (Class)CAMExposureSliderAccessibility;
  -[CAMExposureSliderAccessibility scrollViewDidScroll:](&v9, sel_scrollViewDidScroll_, v4);

  -[CAMExposureSliderAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("exposureValue"));
  if (v6 != v7)
  {
    -[CAMExposureSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("valueText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
}

@end
