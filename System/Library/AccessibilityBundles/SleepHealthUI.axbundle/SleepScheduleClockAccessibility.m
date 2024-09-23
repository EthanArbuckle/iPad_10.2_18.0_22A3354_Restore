@implementation SleepScheduleClockAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SleepHealthUI.SleepScheduleClock");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_axLastOutputTimeInterval
{
  double result;

  __UIAccessibilityGetAssociatedTimeInterval();
  return result;
}

- (void)_axSetLastOutputTimeInterval:(double)a3
{
  __UIAccessibilitySetAssociatedTimeInterval();
}

- (id)_axLastSpokenMessage
{
  JUMPOUT(0x23491E7E0);
}

- (void)_axSetLastSpokenMessage:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClock"), CFSTR("accessibilityBedtimeHand"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsEditView"), CFSTR("accessibilityComponentsHeader"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsHeader"), CFSTR("accessibilityBedtimeTimeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsHeader"), CFSTR("accessibilityWakeUpTimeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClock"), CFSTR("gestureRecognizerDidStart:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClock"), CFSTR("gestureRecognizerDidMove:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsEditView"), CFSTR("accessibilityClockCaption"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClockCaption"), CFSTR("accessibilityClockCaptionMessage"), "@", 0);

}

- (void)gestureRecognizerDidStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  objc_super v11;
  CGPoint v12;
  CGRect v13;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SleepScheduleClockAccessibility;
  -[SleepScheduleClockAccessibility gestureRecognizerDidStart:](&v11, sel_gestureRecognizerDidStart_, v4);
  -[SleepScheduleClockAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityBedtimeHand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "convertRect:fromView:", v5);
  v12.x = v8;
  v12.y = v10;
  -[SleepScheduleClockAccessibility setAccessibilityDraggingBedtimeHand:](self, "setAccessibilityDraggingBedtimeHand:", CGRectContainsPoint(v13, v12));

}

- (void)gestureRecognizerDidMove:(id)a3
{
  double Current;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SleepScheduleClockAccessibility;
  -[SleepScheduleClockAccessibility gestureRecognizerDidMove:](&v7, sel_gestureRecognizerDidMove_, a3);
  Current = CFAbsoluteTimeGetCurrent();
  -[SleepScheduleClockAccessibility _axLastOutputTimeInterval](self, "_axLastOutputTimeInterval");
  if (Current - v5 > 1.0)
  {
    -[SleepScheduleClockAccessibility _axClockTimeLabelText](self, "_axClockTimeLabelText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SleepScheduleClockAccessibility _axSpeakMessageIfNeeded:](self, "_axSpeakMessageIfNeeded:", v6);

    -[SleepScheduleClockAccessibility _axSetLastOutputTimeInterval:](self, "_axSetLastOutputTimeInterval:", Current);
  }
}

- (void)gestureRecognizerDidEnd:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SleepScheduleClockAccessibility;
  -[SleepScheduleClockAccessibility gestureRecognizerDidEnd:](&v9, sel_gestureRecognizerDidEnd_, a3);
  -[SleepScheduleClockAccessibility accessibilityContainer](self, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityClockCaption"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("accessibilityClockCaptionMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = *MEMORY[0x24BDF71E8];
  -[SleepScheduleClockAccessibility _axClockTimeLabelText](self, "_axClockTimeLabelText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v4, v8);

}

- (void)_axSpeakMessageIfNeeded:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[SleepScheduleClockAccessibility _axLastSpokenMessage](self, "_axLastSpokenMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    UIAccessibilitySpeakOrQueueIfNeeded();
    -[SleepScheduleClockAccessibility _axSetLastSpokenMessage:](self, "_axSetLastSpokenMessage:", v6);
  }

}

- (id)_axClockComponentsHeader
{
  void *v2;
  void *v3;

  -[SleepScheduleClockAccessibility accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityComponentsHeader"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axClockTimeLabelText
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[SleepScheduleClockAccessibility _axClockComponentsHeader](self, "_axClockComponentsHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SleepScheduleClockAccessibility accessibilityDraggingBedtimeHand](self, "accessibilityDraggingBedtimeHand"))
    v4 = CFSTR("accessibilityBedtimeTimeLabel");
  else
    v4 = CFSTR("accessibilityWakeUpTimeLabel");
  objc_msgSend(v3, "safeValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)accessibilityDraggingBedtimeHand
{
  return self->_accessibilityDraggingBedtimeHand;
}

- (void)setAccessibilityDraggingBedtimeHand:(BOOL)a3
{
  self->_accessibilityDraggingBedtimeHand = a3;
}

@end
