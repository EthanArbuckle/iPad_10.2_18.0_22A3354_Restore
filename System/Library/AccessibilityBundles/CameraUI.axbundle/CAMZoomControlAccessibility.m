@implementation CAMZoomControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMZoomControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("zoomFactor"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_displayMaximumZoomFactor"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_displayMinimumZoomFactor"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("displayZoomValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_setZoomFactor:interactionType:shouldNotifyDelegate:"), "v", "d", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("continueTrackingWithTouch: withEvent:"), "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_zoomFactorForDisplayZoomValue:"), "d", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_handleButtonTapped:forAccessoryTap:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_zoomButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_displayZoomFactors"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_isButtonPlatterSupportedForConfiguration"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_buttonPlatter"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomButtonPlatter"), CFSTR("_allButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomButtonPlatter"), CFSTR("zoomFactorButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomButtonPlatter"), CFSTR("isCollapsed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("zoomButtonContentType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("zoomButtonSymbol"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_zoomControlMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("orientation"), "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CAMZoomPoint"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CAMZoomPoint"), CFSTR("significantIndexesInZoomPoints:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_zoomPoints"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_zoomFactors"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("zoomFactor"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomPoint"), CFSTR("displayZoomFactor"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomButton"), CFSTR("_focalLengthLabel"), "@", 0);

}

- (double)_axDisplayZoomValue
{
  double result;

  -[CAMZoomControlAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("displayZoomValue"));
  return result;
}

- (double)_axMaximumZoomFactor
{
  double result;

  -[CAMZoomControlAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("_displayMaximumZoomFactor"));
  return result;
}

- (double)_axMinimumZoomFactor
{
  double result;

  -[CAMZoomControlAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("_displayMinimumZoomFactor"));
  return result;
}

- (void)_axSetZoomFactorForDisplayValue:(double)a3
{
  AXPerformSafeBlock();
}

uint64_t __63__CAMZoomControlAccessibility__axSetZoomFactorForDisplayValue___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_axRoundedZoomFactor:", *(double *)(a1 + 40));
  objc_msgSend(v2, "_zoomFactorForDisplayZoomValue:");
  return objc_msgSend(*(id *)(a1 + 32), "_setZoomFactor:interactionType:shouldNotifyDelegate:", 1, 1);
}

- (int64_t)_axZoomControlMode
{
  return -[CAMZoomControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_zoomControlMode"));
}

- (BOOL)_axIsZoomToggleOnly
{
  return -[CAMZoomControlAccessibility _axZoomControlMode](self, "_axZoomControlMode") == 3
      || -[CAMZoomControlAccessibility _axZoomControlMode](self, "_axZoomControlMode") == 4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  objc_super v7;

  v3 = -[CAMZoomControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("zoomButtonContentType"));
  if (v3)
  {
    if (v3 != 1)
    {
      v7.receiver = self;
      v7.super_class = (Class)CAMZoomControlAccessibility;
      -[CAMZoomControlAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    v4 = CFSTR("ffc.zoomcontrol");
  }
  else
  {
    v4 = CFSTR("bravo.zoomcontrol");
  }
  accessibilityCameraUILocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)accessibilityValue
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  objc_super v7;

  if (-[CAMZoomControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("zoomButtonContentType")) == 1)
  {
    v3 = -[CAMZoomControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("zoomButtonSymbol"));
    if (v3 == 1)
    {
      v4 = CFSTR("zoomed.in");
    }
    else
    {
      if (v3)
      {
        v7.receiver = self;
        v7.super_class = (Class)CAMZoomControlAccessibility;
        -[CAMZoomControlAccessibility accessibilityValue](&v7, sel_accessibilityValue);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
      v4 = CFSTR("zoomed.out");
    }
    accessibilityCameraUILocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CAMZoomControlAccessibility _axDisplayZoomValue](self, "_axDisplayZoomValue");
    AXFormatMagnificationFactor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)accessibilityIncrement
{
  double v3;
  double v4;
  double v5;

  -[CAMZoomControlAccessibility _axMaximumZoomFactor](self, "_axMaximumZoomFactor");
  v4 = v3;
  -[CAMZoomControlAccessibility _axDisplayZoomValue](self, "_axDisplayZoomValue");
  if (v5 + 0.1 <= v4)
    -[CAMZoomControlAccessibility _axSetZoomFactorForDisplayValue:](self, "_axSetZoomFactorForDisplayValue:");
}

- (void)accessibilityDecrement
{
  double v3;
  double v4;
  double v5;

  -[CAMZoomControlAccessibility _axMinimumZoomFactor](self, "_axMinimumZoomFactor");
  v4 = v3;
  -[CAMZoomControlAccessibility _axDisplayZoomValue](self, "_axDisplayZoomValue");
  if (v5 + -0.1 >= v4)
    -[CAMZoomControlAccessibility _axSetZoomFactorForDisplayValue:](self, "_axSetZoomFactorForDisplayValue:");
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMZoomControlAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[CAMZoomControlAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[CAMZoomControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_zoomDialEnabled"));
  v5 = *MEMORY[0x24BDF73A0];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

- (id)accessibilityHint
{
  __CFString *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = CFSTR("zoom.toggle.hint");
  if (-[CAMZoomControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("zoomButtonContentType")) == 1)
  {
    v4 = -[CAMZoomControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("zoomButtonSymbol"));
    v5 = CFSTR("zoomed.in.hint");
    if (v4)
      v5 = CFSTR("zoom.toggle.hint");
    if (v4 == 1)
      v3 = CFSTR("zoomed.out.hint");
    else
      v3 = (__CFString *)v5;
  }
  accessibilityCameraUILocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)accessibilityActivate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  BOOL v24;
  uint64_t v25;
  __CFString *v26;
  void *v28;
  objc_super v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id v35;
  id v36;
  CAMZoomControlAccessibility *v37;
  uint64_t v38;
  double v39;
  double v40;

  v3 = -[CAMZoomControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("zoomButtonContentType"));
  if (-[CAMZoomControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isButtonPlatterSupportedForConfiguration")))
  {
    -[CAMZoomControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_buttonPlatter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeArrayForKey:", CFSTR("_allButtons"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("zoomFactorButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_zoomPoints"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_zoomFactors"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMZoomControlAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("zoomFactor"));
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(v8, "count"), 1280, &__block_literal_global_18);

      v11 = objc_msgSend(v5, "indexOfObject:", v6);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = v11;
        objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count") <= (unint64_t)(v10 + 1))
          v14 = v10;
        else
          v14 = v10 + 1;
        objc_msgSend(v8, "objectAtIndexedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v17 = v16;
        objc_msgSend(v15, "doubleValue");
        v19 = v18;
        LODWORD(v20) = floor(v18) > floor(v17);
        if (v18 == v17)
          v20 = 1;
        else
          v20 = v20;
        v21 = v12 + v20;
        if (v21 == objc_msgSend(v5, "count"))
          v21 = 0;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = MEMORY[0x24BDAC760];
        v31 = 3221225472;
        v32 = __52__CAMZoomControlAccessibility_accessibilityActivate__block_invoke_2;
        v33 = &unk_24FEE0CC8;
        v38 = v21;
        v34 = v8;
        v39 = v19;
        v40 = v17;
        v35 = v7;
        v36 = v4;
        v37 = self;
        v23 = v22;
        AXPerformSafeBlock();

      }
    }

    return 1;
  }
  if (v3 != 1)
    return -[CAMZoomControlAccessibility _axHandleZoomControlActivate](self, "_axHandleZoomControlActivate");
  v29.receiver = self;
  v29.super_class = (Class)CAMZoomControlAccessibility;
  v24 = -[CAMZoomControlAccessibility accessibilityActivate](&v29, sel_accessibilityActivate);
  v25 = -[CAMZoomControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("zoomButtonSymbol"));
  if (v25)
  {
    if (v25 != 1)
    {
      v28 = 0;
      goto LABEL_22;
    }
    v26 = CFSTR("zoomed.out");
  }
  else
  {
    v26 = CFSTR("zoomed.in");
  }
  accessibilityCameraUILocalizedString(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  return v24;
}

uint64_t __52__CAMZoomControlAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __52__CAMZoomControlAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  BOOL v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v2 = *(_QWORD *)(a1 + 72) + 1;
  v3 = *(void **)(a1 + 32);
  if (objc_msgSend(v3, "count") <= v2)
    v2 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v3, "objectAtIndexedSubscript:", v2);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v4 = floor(*(double *)(a1 + 80));
  v6 = floor(v5);
  if (v4 > floor(*(double *)(a1 + 88)) && v4 == v6)
  {
    v9 = *(_QWORD *)(a1 + 72);
    v8 = v9 < objc_msgSend(*(id *)(a1 + 40), "count");
  }
  else
  {
    v8 = 0;
  }
  v10 = objc_msgSend(*(id *)(a1 + 48), "safeBoolForKey:", CFSTR("isCollapsed"));
  if (v8 || v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 56);
    objc_msgSend(v11, "safeCGFloatForKey:", CFSTR("displayZoomFactor"));
    objc_msgSend(v12, "_axSetZoomFactorForDisplayValue:");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "_handleButtonTapped:forAccessoryTap:", *(_QWORD *)(a1 + 64), 0);
  }
  objc_msgSend(*(id *)(a1 + 56), "_axDisplayZoomValue");
  objc_msgSend(*(id *)(a1 + 48), "safeValueForKey:", CFSTR("zoomFactorButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeValueForKey:", CFSTR("_focalLengthLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatMagnificationFactor();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

- (BOOL)_axHandleZoomControlActivate
{
  AXPerformSafeBlock();
  return 1;
}

void __59__CAMZoomControlAccessibility__axHandleZoomControlActivate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_zoomButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_handleButtonTapped:forAccessoryTap:", v3, 0);
  objc_msgSend(*(id *)(a1 + 32), "_axDisplayZoomValue");
  AXFormatMagnificationFactor();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

- (CGPoint)accessibilityActivationPoint
{
  const __CFString *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  if (-[CAMZoomControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isButtonPlatterSupportedForConfiguration")))v3 = CFSTR("_buttonPlatter");
  else
    v3 = CFSTR("_zoomButton");
  -[CAMZoomControlAccessibility safeValueForKey:](self, "safeValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityActivationPoint");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (double)_axZoomFactor
{
  double result;

  __UIAccessibilityGetAssociatedCGFloat();
  return result;
}

- (void)_setAXZoomFactor:(double)a3
{
  __UIAccessibilitySetAssociatedCGFloat();
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMZoomControlAccessibility;
  v5 = -[CAMZoomControlAccessibility continueTrackingWithTouch:withEvent:](&v7, sel_continueTrackingWithTouch_withEvent_, a3, a4);
  -[CAMZoomControlAccessibility _axDisplayZoomValue](self, "_axDisplayZoomValue");
  AXPerformSafeBlock();
  return v5;
}

void __67__CAMZoomControlAccessibility_continueTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_axRoundedZoomFactor:", *(double *)(a1 + 40));
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_axZoomFactor");
  if (v3 != v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setAXZoomFactor:", v3);
    AXFormatMagnificationFactor();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
}

- (double)_axRoundedZoomFactor:(double)a3
{
  return round(a3 * 10.0) / 10.0 + 0.000001;
}

- (BOOL)_accessibilityIsVerticalAdjustableElement
{
  return (unint64_t)(-[CAMZoomControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("orientation"))- 3) < 2;
}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[CAMZoomControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_buttonPlatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
