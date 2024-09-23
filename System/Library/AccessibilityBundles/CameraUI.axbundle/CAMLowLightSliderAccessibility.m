@implementation CAMLowLightSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMLowLightSlider");
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
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMLowLightSlider"), CFSTR("CEKDiscreteSlider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMLowLightSlider"), CFSTR("_isPerformingCaptureAnimation"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMLowLightSlider"), CFSTR("_selectedIndexBeforeCaptureAnimation"), "Q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CAMViewfinderViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_handleLowLightSliderDidChangeValue:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMLowLightSlider"), CFSTR("setLowLightMode:"), "v", "Q", 0);

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

  accessibilityCameraUILocalizedString(CFSTR("low.light.slider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLowLightSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleText"));
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
  return (id)-[CAMLowLightSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("valueText"));
}

- (void)_axAdjustValue:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (-[CAMLowLightSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isPerformingCaptureAnimation")))v5 = CFSTR("_selectedIndexBeforeCaptureAnimation");
  else
    v5 = CFSTR("selectedIndex");
  v13 = -[CAMLowLightSliderAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", v5);
  -[CAMLowLightSliderAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11[3];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v3)
      v8 = v7 + 1;
    else
      v8 = v7 - 1;
    v11[3] = v8;
    if (v8 < -[CAMLowLightSliderAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("indexCount")))
    {
      v9 = v6;
      AXPerformSafeBlock();

    }
  }

  _Block_object_dispose(&v10, 8);
}

uint64_t __49__CAMLowLightSliderAccessibility__axAdjustValue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BFB60](CFSTR("CAMViewfinderViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __49__CAMLowLightSliderAccessibility__axAdjustValue___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

}

void __49__CAMLowLightSliderAccessibility__axAdjustValue___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setLowLightMode:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_accessibilityViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleLowLightSliderDidChangeValue:", *(_QWORD *)(a1 + 32));

}

- (void)accessibilityDecrement
{
  -[CAMLowLightSliderAccessibility _axAdjustValue:](self, "_axAdjustValue:", 0);
}

- (void)accessibilityIncrement
{
  -[CAMLowLightSliderAccessibility _axAdjustValue:](self, "_axAdjustValue:", 1);
}

@end
