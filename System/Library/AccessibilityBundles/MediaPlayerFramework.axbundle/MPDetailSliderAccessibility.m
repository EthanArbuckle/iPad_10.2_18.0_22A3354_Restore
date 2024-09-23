@implementation MPDetailSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPDetailSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPDetailSlider"), CFSTR("timeLabelStyle"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MPDetailSlider"), CFSTR("_downloadingTrackOverlay"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPDetailSlider"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPDetailSlider"), CFSTR("duration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISlider"), CFSTR("_maxTrackView"), "@", 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPDetailSliderAccessibility;
  -[MPDetailSliderAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[MPDetailSliderAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPDetailSliderAccessibility;
  -[MPDetailSliderAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[MPDetailSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_maxTrackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  -[MPDetailSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_downloadingTrackOverlay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setUserInteractionEnabled:", 0);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPDetailSliderAccessibility;
  v3 = -[MPDetailSliderAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if ((-[MPDetailSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isUserInteractionEnabled")) & 1) != 0)
    return *MEMORY[0x24BDF73A0] | v3;
  else
    return _AXTraitsRemoveTrait();
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[MPDetailSliderAccessibility bounds](self, "bounds");
  UIAccessibilityFrameForBounds();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  double v3;
  double v4;
  CGPoint result;
  CGRect v6;

  -[MPDetailSliderAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("thumbHitRect"));
  UIAccessibilityConvertFrameToScreenCoordinates(v6, (UIView *)self);
  AX_CGRectGetCenter();
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_accessibilityCommitPositionChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  id v10;

  -[MPDetailSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MPDetailSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  -[MPDetailSliderAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("duration"));
  v7 = v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v8 = v5;
    if (v7 > 0.0)
    {
      v9 = v7 * *(float *)&v8;
      *(float *)&v8 = v9;
    }
    objc_msgSend(v10, "detailSlider:didChangeValue:", self, v8);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "detailSliderTrackingDidEnd:", self);

}

- (void)accessibilityIncrement
{
  double v3;
  double v4;
  double v5;
  float v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[MPDetailSliderAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("duration"));
  v4 = v3;
  -[MPDetailSliderAccessibility _accessibilityIncreaseAmount:](self, "_accessibilityIncreaseAmount:", 1);
  v6 = v4 * v5;
  -[MPDetailSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("availableDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (v9 >= v6)
  {
    -[MPDetailSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "detailSliderTrackingDidBegin:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MPDetailSliderAccessibility _updateTimeDisplayForTime:](self, "_updateTimeDisplayForTime:", v6);
    *(float *)&v10 = v6;
    -[MPDetailSliderAccessibility setValue:animated:](self, "setValue:animated:", 0, v10);
    -[MPDetailSliderAccessibility _accessibilityCommitPositionChange](self, "_accessibilityCommitPositionChange");

  }
}

- (void)accessibilityDecrement
{
  double v3;
  double v4;
  double v5;
  float v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[MPDetailSliderAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("duration"));
  v4 = v3;
  -[MPDetailSliderAccessibility _accessibilityIncreaseAmount:](self, "_accessibilityIncreaseAmount:", 0);
  v6 = v4 * v5;
  -[MPDetailSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("availableDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (v9 >= v6)
  {
    -[MPDetailSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "detailSliderTrackingDidBegin:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MPDetailSliderAccessibility _updateTimeDisplayForTime:](self, "_updateTimeDisplayForTime:", v6);
    *(float *)&v10 = v6;
    -[MPDetailSliderAccessibility setValue:animated:](self, "setValue:animated:", 0, v10);
    -[MPDetailSliderAccessibility _accessibilityCommitPositionChange](self, "_accessibilityCommitPositionChange");

  }
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("track.slider"));
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
  -[MPDetailSliderAccessibility accessibilityValue](self, "accessibilityValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  BOOL v5;
  void *v6;
  float v7;
  float v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPDetailSliderAccessibility;
  v5 = -[MPDetailSliderAccessibility continueTrackingWithTouch:withEvent:](&v10, sel_continueTrackingWithTouch_withEvent_, a3, a4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[MPDetailSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    if (vabds_f32(v8, *(float *)&continueTrackingWithTouch_withEvent__LastValue) > 0.02
      || CFAbsoluteTimeGetCurrent() - *(double *)&continueTrackingWithTouch_withEvent__LastTime > 5.0)
    {
      -[MPDetailSliderAccessibility _axPostUpdate](self, "_axPostUpdate");
      continueTrackingWithTouch_withEvent__LastValue = LODWORD(v8);
      continueTrackingWithTouch_withEvent__LastTime = CFAbsoluteTimeGetCurrent();
    }
  }
  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;

  -[MPDetailSliderAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("duration"));
  -[MPDetailSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");

  UIAXTimeStringForDuration();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXTimeStringForDuration();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPDetailSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isTracking"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = objc_allocWithZone(MEMORY[0x24BDD16A8]);
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@"), CFSTR("__1__"));
  }
  else
  {
    accessibilityLocalizedString(CFSTR("slider.time.position"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "initWithFormat:", v11, CFSTR("__1__"), CFSTR("__2__"));

  }
  v13 = objc_msgSend(v10, "rangeOfString:", CFSTR("__1__"));
  v14 = v12;
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v10, "replaceCharactersInRange:withString:", v13, v12, v4);
    v14 = objc_msgSend(v4, "length");
  }
  v16 = objc_msgSend(v10, "rangeOfString:", CFSTR("__2__"));
  v17 = v15;
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v10, "replaceCharactersInRange:withString:", v16, v15, v5);
    v17 = objc_msgSend(v5, "length");
  }
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = (_QWORD *)MEMORY[0x24BDBD270];
  v21 = (_QWORD *)MEMORY[0x24BDFEB38];
  if (v14)
    objc_msgSend(v18, "setAttribute:forKey:withRange:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB38], v13, v14);
  if (v17)
    objc_msgSend(v19, "setAttribute:forKey:withRange:", *v20, *v21, v16, v17);

  return v19;
}

- (BOOL)isAccessibilityElement
{
  return (-[MPDetailSliderAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("timeLabelStyle")) & 0xFFFFFFFFFFFFFFFELL) != 2;
}

@end
