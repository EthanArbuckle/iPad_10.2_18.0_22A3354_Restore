@implementation CEKApertureSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CEKApertureSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("_titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("_valueLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CEKApertureSlider"), CFSTR("CEKDiscreteSlider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKApertureSlider"), CFSTR("apertureValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKApertureSlider"), CFSTR("markedApertureValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKApertureSlider"), CFSTR("setApertureValueClosestTo:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("scrollViewDidScroll:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("selectedIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("markedIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKApertureSlider"), CFSTR("_validApertureIndexForDiscreteIndex:"), "Q", "Q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[CEKApertureSliderAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("apertureValue"));
  v6 = v5;
  v10.receiver = self;
  v10.super_class = (Class)CEKApertureSliderAccessibility;
  -[CEKApertureSliderAccessibility scrollViewDidScroll:](&v10, sel_scrollViewDidScroll_, v4);

  -[CEKApertureSliderAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("apertureValue"));
  if (v6 != v7)
  {
    -[CEKApertureSliderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_valueLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
}

- (void)_axAdjustValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "safeArrayForKey:", CFSTR("validApertureValues"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CEKApertureSliderAccessibility _axValidApertureIndexForDiscreteIndex:](self, "_axValidApertureIndexForDiscreteIndex:", -[CEKApertureSliderAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("selectedIndex")));
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v3 ? v6 + 1 : v6 - 1;
    if (v7 < objc_msgSend(v5, "count"))
    {
      v14 = v5;
      AXPerformSafeBlock();
      -[CEKApertureSliderAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v13 = v8;
        AXPerformSafeBlock();

      }
      -[CEKApertureSliderAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_229, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
        AXPerformSafeBlock();

      }
    }
  }

}

void __49__CEKApertureSliderAccessibility__axAdjustValue___block_invoke(uint64_t a1)
{
  void *v1;
  float v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  objc_msgSend(v1, "setApertureValueClosestTo:", v2);

}

uint64_t __49__CEKApertureSliderAccessibility__axAdjustValue___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BF7E0](CFSTR("CAMViewfinderViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __49__CEKApertureSliderAccessibility__axAdjustValue___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_apertureSliderDidChangeApertureValue:", *(_QWORD *)(a1 + 40));

}

uint64_t __49__CEKApertureSliderAccessibility__axAdjustValue___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BF7E0](CFSTR("PUPhotoEditApertureToolbar"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __49__CEKApertureSliderAccessibility__axAdjustValue___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_apertureSliderDidChangeValue:", *(_QWORD *)(a1 + 40));

}

- (void)accessibilityDecrement
{
  -[CEKApertureSliderAccessibility _axAdjustValue:](self, "_axAdjustValue:", 0);
}

- (void)accessibilityIncrement
{
  -[CEKApertureSliderAccessibility _axAdjustValue:](self, "_axAdjustValue:", 1);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CEKApertureSliderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)_axValidApertureIndexForDiscreteIndex:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  AXPerformSafeBlock();
  v3 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __72__CEKApertureSliderAccessibility__axValidApertureIndexForDiscreteIndex___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_validApertureIndexForDiscreteIndex:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v8;

  -[CEKApertureSliderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_valueLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[CEKApertureSliderAccessibility _axValidApertureIndexForDiscreteIndex:](self, "_axValidApertureIndexForDiscreteIndex:", -[CEKApertureSliderAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("selectedIndex")));
  if (v5 == -[CEKApertureSliderAccessibility _axValidApertureIndexForDiscreteIndex:](self, "_axValidApertureIndexForDiscreteIndex:", -[CEKApertureSliderAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("markedIndex"))))
  {
    accessibilityCameraEditKitD2xLocalizedString(CFSTR("original.depth"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

@end
