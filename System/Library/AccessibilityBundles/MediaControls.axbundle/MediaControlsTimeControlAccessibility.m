@implementation MediaControlsTimeControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsTimeControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MediaControlsTimeControl"), CFSTR("_currentTimeInTrack"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MediaControlsTimeControl"), CFSTR("_sliderValue"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTimeControl"), CFSTR("setSliderValue:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTimeControl"), CFSTR("knobView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTimeControl"), CFSTR("liveBackground"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTimeControl"), CFSTR("isCurrentlyTracking"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTimeControl"), CFSTR("_updateLabels:withRemainingDuration:"), "v", "d", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsTimeControl"), CFSTR("continueTrackingWithTouch:withEvent:"), "B", "@", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("track.position.label"));
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
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[MediaControlsTimeControlAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("knobView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v2, "frame");
  v8 = v4 - v7 * 0.5;
  objc_msgSend(v2, "frame");
  v10 = v6 - v9 * 0.5;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)_updateLabels:(double)a3 withRemainingDuration:(double)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MediaControlsTimeControlAccessibility;
  -[MediaControlsTimeControlAccessibility _updateLabels:withRemainingDuration:](&v7, sel__updateLabels_withRemainingDuration_, a3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsTimeControlAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("AXRemaining"));

}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;

  -[MediaControlsTimeControlAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("liveBackground"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("slider.live"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MediaControlsTimeControlAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("_currentTimeInTrack"));
    -[MediaControlsTimeControlAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXRemaining"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");

    UIAXTimeStringForDuration();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAXTimeStringForDuration();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MediaControlsTimeControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isCurrentlyTracking"));
    v10 = objc_allocWithZone(MEMORY[0x24BDD16A8]);
    v11 = v10;
    if (v9)
    {
      v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@"), CFSTR("__1__"));
    }
    else
    {
      accessibilityLocalizedString(CFSTR("slider.time.position"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "initWithFormat:", v13, CFSTR("__1__"), CFSTR("__2__"));

    }
    v15 = objc_msgSend(v12, "rangeOfString:", CFSTR("__1__"));
    v16 = v14;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "replaceCharactersInRange:withString:", v15, v14, v7);
      v16 = objc_msgSend(v7, "length");
    }
    v18 = objc_msgSend(v12, "rangeOfString:", CFSTR("__2__"));
    v19 = v17;
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "replaceCharactersInRange:withString:", v18, v17, v8);
      v19 = objc_msgSend(v8, "length");
    }
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v20;
    v21 = (_QWORD *)MEMORY[0x24BDBD270];
    v22 = (_QWORD *)MEMORY[0x24BDFEB38];
    if (v16)
      objc_msgSend(v20, "setAttribute:forKey:withRange:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB38], v15, v16);
    if (v19)
      objc_msgSend(v5, "setAttribute:forKey:withRange:", *v21, *v22, v18, v19);

  }
  return v5;
}

- (id)accessibilityIdentifier
{
  return CFSTR("TrackPosition");
}

- (void)_axPostUpdate
{
  UIAccessibilityNotifications v2;
  id v3;

  v2 = *MEMORY[0x24BDF71E8];
  -[MediaControlsTimeControlAccessibility accessibilityValue](self, "accessibilityValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  BOOL v5;
  double v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MediaControlsTimeControlAccessibility;
  v5 = -[MediaControlsTimeControlAccessibility continueTrackingWithTouch:withEvent:](&v9, sel_continueTrackingWithTouch_withEvent_, a3, a4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[MediaControlsTimeControlAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("_sliderValue"));
    v7 = *(_QWORD *)&v6;
    if (vabdd_f64(v6, *(double *)&continueTrackingWithTouch_withEvent__LastValue) > 0.02
      || CFAbsoluteTimeGetCurrent() - *(double *)&continueTrackingWithTouch_withEvent__LastTime > 5.0)
    {
      -[MediaControlsTimeControlAccessibility _axPostUpdate](self, "_axPostUpdate");
      continueTrackingWithTouch_withEvent__LastValue = v7;
      continueTrackingWithTouch_withEvent__LastTime = CFAbsoluteTimeGetCurrent();
    }
  }
  return v5;
}

- (void)accessibilityDecrement
{
  -[MediaControlsTimeControlAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("_sliderValue"));
  AXPerformSafeBlock();
}

uint64_t __63__MediaControlsTimeControlAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSliderValue:", *(double *)(a1 + 40) + -0.1);
  return objc_msgSend(*(id *)(a1 + 32), "endTrackingWithTouch:withEvent:", 0, 0);
}

- (void)accessibilityIncrement
{
  -[MediaControlsTimeControlAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("_sliderValue"));
  AXPerformSafeBlock();
}

uint64_t __63__MediaControlsTimeControlAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSliderValue:", *(double *)(a1 + 40) + 0.1);
  return objc_msgSend(*(id *)(a1 + 32), "endTrackingWithTouch:withEvent:", 0, 0);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaControlsTimeControlAccessibility;
  v3 = -[MediaControlsTimeControlAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if ((-[MediaControlsTimeControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isUserInteractionEnabled")) & 1) != 0)return *MEMORY[0x24BDF73A0] | v3;
  else
    return _AXTraitsRemoveTrait();
}

@end
