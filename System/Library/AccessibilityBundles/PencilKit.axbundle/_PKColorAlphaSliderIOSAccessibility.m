@implementation _PKColorAlphaSliderIOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_PKColorAlphaSliderIOS");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_PKColorAlphaSliderIOS"), CFSTR("color"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_PKColorAlphaSliderIOS"), CFSTR("sliderKnobView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_PKColorAlphaSliderIOS"), CFSTR("setColor:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_PKColorAlphaSliderIOS"), CFSTR("didPanSliderKnob:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityPencilKitLocalizedString(CFSTR("tool.opacity"));
}

- (double)_accessibilityColorAlpha
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_opt_class();
  -[_PKColorAlphaSliderIOSAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("color"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "alphaComponent");
  v6 = v5;

  return v6;
}

- (void)_accessibilitySetColorAlpha:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_opt_class();
  -[_PKColorAlphaSliderIOSAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("color"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "colorWithAlphaComponent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  AXPerformSafeBlock();

}

- (id)accessibilityValue
{
  -[_PKColorAlphaSliderIOSAccessibility _accessibilityColorAlpha](self, "_accessibilityColorAlpha");
  return (id)AXFormatFloatWithPercentage();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PKColorAlphaSliderIOSAccessibility;
  return *MEMORY[0x24BDF73A0] | -[_PKColorAlphaSliderIOSAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)accessibilityIncrement
{
  double v3;

  -[_PKColorAlphaSliderIOSAccessibility _accessibilityColorAlpha](self, "_accessibilityColorAlpha");
  -[_PKColorAlphaSliderIOSAccessibility _accessibilitySetColorAlpha:](self, "_accessibilitySetColorAlpha:", fmin(v3 + 0.1, 1.0));
}

- (void)accessibilityDecrement
{
  double v3;
  double v4;

  -[_PKColorAlphaSliderIOSAccessibility _accessibilityColorAlpha](self, "_accessibilityColorAlpha");
  v4 = v3 + -0.1;
  if (v4 < 0.0)
    v4 = 0.0;
  -[_PKColorAlphaSliderIOSAccessibility _accessibilitySetColorAlpha:](self, "_accessibilitySetColorAlpha:", v4);
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

  -[_PKColorAlphaSliderIOSAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("sliderKnobView"));
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

- (void)didPanSliderKnob:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PKColorAlphaSliderIOSAccessibility;
  -[_PKColorAlphaSliderIOSAccessibility didPanSliderKnob:](&v6, sel_didPanSliderKnob_, a3);
  if (CFAbsoluteTimeGetCurrent() - *(double *)&didPanSliderKnob__LastOutput > 1.0)
  {
    v4 = *MEMORY[0x24BDF71E8];
    -[_PKColorAlphaSliderIOSAccessibility accessibilityValue](self, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v4, v5);

    didPanSliderKnob__LastOutput = CFAbsoluteTimeGetCurrent();
  }
}

@end
