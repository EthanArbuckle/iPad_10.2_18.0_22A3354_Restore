@implementation CAMSystemOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMSystemOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("selectedIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("indexCount"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("setSelectedIndex:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlayView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlayView"), CFSTR("_valueLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlayView"), CFSTR("sliderIfLoaded"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlayView"), CFSTR("_menuVisibility"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlayVisibility"), CFSTR("_activeReasons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlayVisibility"), CFSTR("_delayedHidingTimer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlayView"), CFSTR("menu"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlayView"), CFSTR("_updateValueLabelText"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("selectedIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlaySlider"), CFSTR("_currentSlider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlaySlider"), CFSTR("_discreteSlider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlaySlider"), CFSTR("_continuousSlider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKDiscreteSlider"), CFSTR("_setSelectedIndex:shouldDelegate:wantsFeedbackEmitted:shouldScroll:scrollDuration:scrollCurve:scrollCompletion:"), "v", "Q", "B", "B", "B", "d", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CAMSystemOverlaySlider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSystemOverlaySlider"), CFSTR("_handleContinuousSliderValueChanged:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMSystemOverlayViewAccessibility;
  return *MEMORY[0x24BDF73A0] | -[CAMSystemOverlayViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("camera.control"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[CAMSystemOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_valueLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  -[CAMSystemOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sliderIfLoaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CAMSystemOverlayViewAccessibility;
    -[CAMSystemOverlayViewAccessibility accessibilityFrame](&v17, sel_accessibilityFrame);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)accessibilityIncrement
{
  -[CAMSystemOverlayViewAccessibility _axAdjustValue:](self, "_axAdjustValue:", 1);
}

- (void)accessibilityDecrement
{
  -[CAMSystemOverlayViewAccessibility _axAdjustValue:](self, "_axAdjustValue:", 0);
}

- (void)_axAdjustValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  id v21;

  v3 = a3;
  -[CAMSystemOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("menuVisibility"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeSetForKey:", CFSTR("_activeReasons"));
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMSystemOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("menuVisibility"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_delayedHidingTimer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count") || v7)
  {
    -[CAMSystemOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("menu"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeSwiftValueForKey:", CFSTR("discreteSlider"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    if (v17)
    {
      v18 = objc_msgSend(v17, "safeIntForKey:", CFSTR("selectedIndex"));
      if (v3)
        v19 = v18 + 1;
      else
        v19 = v18 - 1;
      objc_msgSend(v8, "setSelectedControlIndex:animated:", v19, 1);
    }
  }
  else
  {
    -[CAMSystemOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sliderIfLoaded"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("currentSlider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2348BFB60](CFSTR("CEKDiscreteSlider"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "safeValueForKey:", CFSTR("discreteSlider"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (int)objc_msgSend(v10, "safeIntForKey:", CFSTR("selectedIndex"));
      v12 = objc_msgSend(v10, "safeIntForKey:", CFSTR("indexCount"));
      if (v11 <= 1)
        v13 = 1;
      else
        v13 = v11;
      v14 = v13 - 1;
      v15 = v12 - 1;
      if (v11 + 1 < v15)
        v15 = v11 + 1;
      if (v3)
        v16 = v15;
      else
        v16 = v14;
      objc_msgSend(v10, "_setSelectedIndex:shouldDelegate:wantsFeedbackEmitted:shouldScroll:scrollDuration:scrollCurve:scrollCompletion:", v16, 1, 1, 1, 0, 0, 0.0);
    }
    else
    {
      objc_msgSend(v8, "safeValueForKey:", CFSTR("continuousSlider"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v20;
      if (v3)
        objc_msgSend(v20, "accessibilityIncrement");
      else
        objc_msgSend(v20, "accessibilityDecrement");
    }

  }
}

- (void)_updateValueLabelText
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMSystemOverlayViewAccessibility;
  -[CAMSystemOverlayViewAccessibility _updateValueLabelText](&v6, sel__updateValueLabelText);
  objc_opt_class();
  -[CAMSystemOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_valueLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

@end
