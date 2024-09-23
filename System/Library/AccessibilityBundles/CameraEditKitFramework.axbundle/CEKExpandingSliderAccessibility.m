@implementation CEKExpandingSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CEKExpandingSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKExpandingSlider"), CFSTR("_titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKExpandingSlider"), CFSTR("_valueLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKExpandingSlider"), CFSTR("_levelIndicatorView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKExpandingSlider"), CFSTR("_handleExpansionAnimationTimerFired:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKExpandingSlider"), CFSTR("_setExpanded:animated:shouldNotify:"), "v", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKExpandingSlider"), CFSTR("setValue:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKExpandingSlider"), CFSTR("expanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKExpandingSlider"), CFSTR("_slider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("value"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("maximumValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("minimumValue"), "d", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CEKExpandingSliderAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedLowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  return (id)-[CEKExpandingSliderAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_valueLabel"));
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  v24.receiver = self;
  v24.super_class = (Class)CEKExpandingSliderAccessibility;
  -[CEKExpandingSliderAccessibility accessibilityFrame](&v24, sel_accessibilityFrame);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!-[CEKExpandingSliderAccessibility _axIsSliderExpanded](self, "_axIsSliderExpanded"))
  {
    v11 = (void *)MEMORY[0x24BDBCE30];
    -[CEKExpandingSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKExpandingSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_valueLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKExpandingSliderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_levelIndicatorView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "axArrayByIgnoringNilElementsWithCount:", 3, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    UIAXFrameForElements();
    v4 = v16;
    v6 = v17;
    v8 = v18;
    v10 = v19;

  }
  v20 = v4;
  v21 = v6;
  v22 = v8;
  v23 = v10;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)accessibilityActivate
{
  objc_super v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  CEKExpandingSliderAccessibility *v9;

  if (-[CEKExpandingSliderAccessibility _axIsSliderExpanded](self, "_axIsSliderExpanded"))
  {
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __56__CEKExpandingSliderAccessibility_accessibilityActivate__block_invoke;
    v8 = &unk_24FEDD2D0;
    v9 = self;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CEKExpandingSliderAccessibility;
    return -[CEKExpandingSliderAccessibility accessibilityActivate](&v4, sel_accessibilityActivate);
  }
}

void __56__CEKExpandingSliderAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setExpanded:animated:shouldNotify:", 0, 1, 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 32));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CEKExpandingSliderAccessibility;
  v3 = -[CEKExpandingSliderAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[CEKExpandingSliderAccessibility _axIsSliderExpanded](self, "_axIsSliderExpanded");
  v5 = *MEMORY[0x24BDF73A0];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (void)accessibilityIncrement
{
  -[CEKExpandingSliderAccessibility _axChangeValueInDirection:withLargeStep:](self, "_axChangeValueInDirection:withLargeStep:", 2, 0);
}

- (void)accessibilityDecrement
{
  -[CEKExpandingSliderAccessibility _axChangeValueInDirection:withLargeStep:](self, "_axChangeValueInDirection:withLargeStep:", 1, 0);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  unint64_t v3;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 1)
    -[CEKExpandingSliderAccessibility _axChangeValueInDirection:withLargeStep:](self, "_axChangeValueInDirection:withLargeStep:");
  return v3 < 2;
}

- (int64_t)_accessibilityExpandedStatus
{
  if (-[CEKExpandingSliderAccessibility _axIsSliderExpanded](self, "_axIsSliderExpanded"))
    return 1;
  else
    return 2;
}

- (void)_handleExpansionAnimationTimerFired:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!-[CEKExpandingSliderAccessibility _axIsSliderExpanded](self, "_axIsSliderExpanded")
    || !UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)CEKExpandingSliderAccessibility;
    -[CEKExpandingSliderAccessibility _handleExpansionAnimationTimerFired:](&v5, sel__handleExpansionAnimationTimerFired_, v4);
  }

}

- (void)_axChangeValueInDirection:(int64_t)a3 withLargeStep:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  double v9;
  uint64_t (*v10)(uint64_t);
  double *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a4;
  -[CEKExpandingSliderAccessibility _axSemanticStyle](self, "_axSemanticStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeStringForKey:", CFSTR("displayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 1.0;
  if (v4)
    v9 = 10.0;
  if (a3 == 1)
  {
    v14 = MEMORY[0x24BDAC760];
    v10 = __75__CEKExpandingSliderAccessibility__axChangeValueInDirection_withLargeStep___block_invoke_2;
    v11 = (double *)&v14;
  }
  else
  {
    if (a3 != 2)
      goto LABEL_8;
    v15 = MEMORY[0x24BDAC760];
    v10 = __75__CEKExpandingSliderAccessibility__axChangeValueInDirection_withLargeStep___block_invoke;
    v11 = (double *)&v15;
  }
  *((_QWORD *)v11 + 1) = 3221225472;
  *((_QWORD *)v11 + 2) = v10;
  *((_QWORD *)v11 + 3) = &unk_24FEDD2F8;
  *((_QWORD *)v11 + 4) = self;
  v11[5] = v9;
  AXPerformSafeBlock();
LABEL_8:
  -[CEKExpandingSliderAccessibility _axSemanticStyle](self, "_axSemanticStyle", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeStringForKey:", CFSTR("displayName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", v13) & 1) == 0)
    UIAccessibilitySpeakOrQueueIfNeeded();

}

uint64_t __75__CEKExpandingSliderAccessibility__axChangeValueInDirection_withLargeStep___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "_axCurrentSliderValue");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_axMaximumValue");
  if (v3 < v4)
    v3 = v3 + *(double *)(a1 + 40) * 0.01;
  objc_msgSend(*(id *)(a1 + 32), "setValue:", v3);
  return objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 4096);
}

uint64_t __75__CEKExpandingSliderAccessibility__axChangeValueInDirection_withLargeStep___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "_axCurrentSliderValue");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_axMinimumValue");
  if (v3 > v4)
    v3 = v3 + *(double *)(a1 + 40) * -0.01;
  objc_msgSend(*(id *)(a1 + 32), "setValue:", v3);
  return objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 4096);
}

- (BOOL)_axIsSliderExpanded
{
  return -[CEKExpandingSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("expanded"));
}

- (double)_axCurrentSliderValue
{
  void *v2;
  double v3;
  double v4;

  -[CEKExpandingSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_slider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGFloatForKey:", CFSTR("value"));
  v4 = v3;

  return v4;
}

- (double)_axMinimumValue
{
  void *v2;
  double v3;
  double v4;

  -[CEKExpandingSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_slider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGFloatForKey:", CFSTR("minimumValue"));
  v4 = v3;

  return v4;
}

- (double)_axMaximumValue
{
  void *v2;
  double v3;
  double v4;

  -[CEKExpandingSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_slider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGFloatForKey:", CFSTR("maximumValue"));
  v4 = v3;

  return v4;
}

- (id)_axSemanticStyle
{
  void *v2;
  void *v3;
  void *v4;

  -[CEKExpandingSliderAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2348BF7E0](CFSTR("CAMSemanticStyleControl"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("semanticStyle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
