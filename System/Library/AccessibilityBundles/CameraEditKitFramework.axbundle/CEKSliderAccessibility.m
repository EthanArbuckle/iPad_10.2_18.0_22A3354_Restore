@implementation CEKSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CEKSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("value"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("maximumValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("minimumValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("tickMarkSize"), "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("CameraEditKit.TickMarksModel"), CFSTR("tickMarkSpacing"), "CGFloat");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("CameraEditKit.TickMarksModel"), CFSTR("mainTickMarkInterval"), "Int");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("setValue:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("scrollViewDidScroll:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("_tickMarksView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSliderTickMarksView"), CFSTR("tickMarksModel"), "@", 0);

}

- (double)_axNumberOfTickSegments
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[CEKSliderAccessibility safeCGSizeForKey:](self, "safeCGSizeForKey:", CFSTR("tickMarkSize"));
  v4 = v3;
  -[CEKSliderAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_tickMarksView.tickMarksModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeSwiftCGFloatForKey:", CFSTR("tickMarkSpacing"));
  v7 = v4 / ((v4 + v6) * (double)objc_msgSend(v5, "safeSwiftIntForKey:", CFSTR("mainTickMarkInterval")));

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CEKSliderAccessibility;
  v3 = -[CEKSliderAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[CEKSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled"));
  v5 = *MEMORY[0x24BDF73A0];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  -[CEKSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BF7E0](CFSTR("PUFilterToolController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LOBYTE(v22) = 0;
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_scrubberView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsSafeCategory();
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityCameraEditKitD2xLocalizedString(CFSTR("intensity.slider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_axPhotoFilterName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MEMORY[0x2348BF7E0](CFSTR("PUAdjustmentsViewController"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14.receiver = self;
      v14.super_class = (Class)CEKSliderAccessibility;
      -[CEKSliderAccessibility accessibilityLabel](&v14, sel_accessibilityLabel);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v3, "safeValueForKey:", CFSTR("selectedIndexPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v27 = 0;
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __44__CEKSliderAccessibility_accessibilityLabel__block_invoke;
    v18 = &unk_24FEDD320;
    v19 = v3;
    v5 = v10;
    v20 = v5;
    v21 = &v22;
    AXPerformSafeBlock();
    v11 = (void *)MEMORY[0x24BDD17C8];
    accessibilityCameraEditKitD2xLocalizedString(CFSTR("intensity.slider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v23[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v22, 8);
  }

LABEL_7:
  return v9;
}

void __44__CEKSliderAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("dataSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeStringForKey:", CFSTR("localizedName"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)accessibilityValue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v12;

  if (-[CEKSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled")))
  {
    -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("maximumValue"));
    v4 = v3;
    -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("minimumValue"));
    v6 = v5;
    -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
    v8 = v7;
    -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("defaultValue"));
    AXScaledSliderValues(v8, v6, v4, v9);
    AXFormatFloatWithPercentage();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CEKSliderAccessibility;
    -[CEKSliderAccessibility accessibilityValue](&v12, sel_accessibilityValue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (double)_axGetDeltaForCurrentValue:(double)a3 toIncrement:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double result;
  double v13;
  BOOL v14;

  v4 = a4;
  -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("maximumValue"));
  v8 = v7;
  -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("minimumValue"));
  v10 = v9;
  -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("defaultValue"));
  if (v10 == 0.0)
    return (v8 - v10) / 100.0;
  v13 = v11;
  v14 = vabdd_f64(v10, v11) == vabdd_f64(v11, v8);
  result = (v11 - v10) / 100.0;
  if (!v14)
  {
    if (v13 == a3)
    {
      if (v4)
        return (v8 - v13) / 100.0;
    }
    else if (v10 >= a3 || v13 <= a3)
    {
      result = 0.01;
      if (v8 > a3)
        return (v8 - v13) / 100.0;
    }
  }
  return result;
}

- (void)_axAdjustValue:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  char isKindOfClass;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[12];

  v3 = a3;
  -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("maximumValue"));
  v6 = v5;
  -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("minimumValue"));
  v8 = v7;
  -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  v10 = v9;
  -[CEKSliderAccessibility _axGetDeltaForCurrentValue:toIncrement:](self, "_axGetDeltaForCurrentValue:toIncrement:", v3);
  v12 = v11;
  -[CEKSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BF7E0](CFSTR("CAMSystemOverlaySlider"));
  isKindOfClass = objc_opt_isKindOfClass();
  v15 = v12 * 10.0;
  if ((isKindOfClass & 1) == 0)
    v15 = v12;
  v16 = v10 - v15;
  if (v10 - v15 < v8)
    v16 = v8;
  v17 = v10 + v15;
  if (v17 > v6)
    v17 = v6;
  v18 = !v3;
  v19 = MEMORY[0x24BDAC760];
  v24[6] = MEMORY[0x24BDAC760];
  v24[7] = 3221225472;
  v24[8] = __41__CEKSliderAccessibility__axAdjustValue___block_invoke;
  v24[9] = &unk_24FEDD2F8;
  if (v18)
    v17 = v16;
  v24[10] = self;
  *(double *)&v24[11] = v17;
  AXPerformSafeBlock();
  MEMORY[0x2348BF7E0](CFSTR("PUFilterToolController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24[0] = v19;
    v20 = __41__CEKSliderAccessibility__axAdjustValue___block_invoke_2;
    v21 = v24;
LABEL_15:
    v21[1] = 3221225472;
    v21[2] = (uint64_t)v20;
    v21[3] = (uint64_t)&unk_24FEDD238;
    v21[4] = (uint64_t)v13;
    v21[5] = (uint64_t)self;
    AXPerformSafeBlock();

    goto LABEL_16;
  }
  MEMORY[0x2348BF7E0](CFSTR("PUAdjustmentsViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v19;
    v20 = __41__CEKSliderAccessibility__axAdjustValue___block_invoke_3;
    v21 = &v23;
    goto LABEL_15;
  }
  MEMORY[0x2348BF7E0](CFSTR("CAMSystemOverlaySlider"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v19;
    v20 = __41__CEKSliderAccessibility__axAdjustValue___block_invoke_4;
    v21 = &v22;
    goto LABEL_15;
  }
LABEL_16:

}

uint64_t __41__CEKSliderAccessibility__axAdjustValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:", *(double *)(a1 + 40));
}

uint64_t __41__CEKSliderAccessibility__axAdjustValue___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sliderWillBeginScrolling:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "sliderDidScroll:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "sliderDidEndScrolling:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__CEKSliderAccessibility__axAdjustValue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sliderValueChanged:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__CEKSliderAccessibility__axAdjustValue___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleContinuousSliderValueChanged:", *(_QWORD *)(a1 + 40));
}

- (void)accessibilityIncrement
{
  -[CEKSliderAccessibility _axAdjustValue:](self, "_axAdjustValue:", 1);
}

- (void)accessibilityDecrement
{
  -[CEKSliderAccessibility _axAdjustValue:](self, "_axAdjustValue:", 0);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  objc_super v24;

  v4 = a3;
  -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  v6 = v5;
  v24.receiver = self;
  v24.super_class = (Class)CEKSliderAccessibility;
  -[CEKSliderAccessibility scrollViewDidScroll:](&v24, sel_scrollViewDidScroll_, v4);
  -[CEKSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BF7E0](CFSTR("PUFilterToolController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v7;
    AXPerformSafeBlock();

  }
  MEMORY[0x2348BF7E0](CFSTR("PUAdjustmentsViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v7;
    AXPerformSafeBlock();

  }
  -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  v9 = v8;
  v10 = vabdd_f64(v6, v8);
  -[CEKSliderAccessibility _axNumberOfTickSegments](self, "_axNumberOfTickSegments");
  if (v10 > v11)
  {
    -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("maximumValue"));
    v13 = v12;
    -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("minimumValue"));
    v15 = v14;
    -[CEKSliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("defaultValue"));
    v17 = v16;
    MEMORY[0x2348BF7E0](CFSTR("CAMSystemOverlaySlider"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "safeValueForKey:", CFSTR("delegate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_msgSend(v18, "safeValueForKey:", CFSTR("_valueLabel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        objc_msgSend(v20, "text");
      else
        AXFormatFloat();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeak();

    }
    else
    {
      AXScaledSliderValues(v9, v15, v13, v17);
      AXFormatFloatWithPercentage();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeak();
    }

  }
}

uint64_t __46__CEKSliderAccessibility_scrollViewDidScroll___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sliderDidScroll:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__CEKSliderAccessibility_scrollViewDidScroll___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sliderWillBeginScrolling:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "sliderDidEndScrolling:", *(_QWORD *)(a1 + 40));
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CEKSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tickMarksView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
