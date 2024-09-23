@implementation ETTranscriptColorWheelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETTranscriptColorWheel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_accessibilityOriginalPickerRotation
{
  double result;

  __UIAccessibilityGetAssociatedCGFloat();
  return result;
}

- (void)_accessibilitySetOriginalPickerRotation:(double)a3
{
  __UIAccessibilitySetAssociatedCGFloat();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ETTranscriptColorWheel"), CFSTR("DTSColorWheel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETTranscriptColorWheel"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DTSColorWheel"), CFSTR("pickerRotation"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DTSColorWheel"), CFSTR("pickerCircle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DTSColorWheel"), CFSTR("colorWheelRadius"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DTSColorWheel"), CFSTR("gradientWidth"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DTSColorWheel"), CFSTR("updatePickerPositionForPoint:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DTSColorWheel"), CFSTR("touchesBegan: withEvent:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DTSColorWheel"), CFSTR("touchesEnded: withEvent:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DTSColorWheel"), CFSTR("touchesCancelled: withEvent:"), "v", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptColorWheelAccessibility;
  -[ETTranscriptColorWheelAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[ETTranscriptColorWheelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pickerCircle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("digital.touch.picker.circle.identifier"));

}

- (ETTranscriptColorWheelAccessibility)initWithFrame:(CGRect)a3
{
  ETTranscriptColorWheelAccessibility *v3;
  ETTranscriptColorWheelAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ETTranscriptColorWheelAccessibility;
  v3 = -[ETTranscriptColorWheelAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ETTranscriptColorWheelAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)updatePickerPositionForPoint:(CGPoint)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ETTranscriptColorWheelAccessibility;
  -[ETTranscriptColorWheelAccessibility updatePickerPositionForPoint:](&v11, sel_updatePickerPositionForPoint_, a3.x, a3.y);
  -[ETTranscriptColorWheelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pickerCircle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETTranscriptColorWheelAccessibility _accessibilityOriginalPickerRotation](self, "_accessibilityOriginalPickerRotation");
  if (v5 > 0.0)
  {
    -[ETTranscriptColorWheelAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("pickerRotation"));
    v7 = v6;
    -[ETTranscriptColorWheelAccessibility _accessibilityOriginalPickerRotation](self, "_accessibilityOriginalPickerRotation");
    -[ETTranscriptColorWheelAccessibility _accessibilityDifferenceBetweenAngle:andAngle:](self, "_accessibilityDifferenceBetweenAngle:andAngle:", v7, v8);
    if (fabs(v9) >= 0.104719755)
    {
      -[ETTranscriptColorWheelAccessibility _accessibilitySpeakPickerColor](self, "_accessibilitySpeakPickerColor");
      -[ETTranscriptColorWheelAccessibility _accessibilitySetOriginalPickerRotation:](self, "_accessibilitySetOriginalPickerRotation:", v7);
    }
  }
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "_accessibilityViewIsVisible"))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v4);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[ETTranscriptColorWheelAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("pickerRotation"));
  -[ETTranscriptColorWheelAccessibility _accessibilitySetOriginalPickerRotation:](self, "_accessibilitySetOriginalPickerRotation:");
  v8.receiver = self;
  v8.super_class = (Class)ETTranscriptColorWheelAccessibility;
  -[ETTranscriptColorWheelAccessibility touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptColorWheelAccessibility;
  -[ETTranscriptColorWheelAccessibility touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[ETTranscriptColorWheelAccessibility _accessibilitySetOriginalPickerRotation:](self, "_accessibilitySetOriginalPickerRotation:", -1.0);
  -[ETTranscriptColorWheelAccessibility _accessibilitySpeakPickerColor](self, "_accessibilitySpeakPickerColor");
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptColorWheelAccessibility;
  -[ETTranscriptColorWheelAccessibility touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[ETTranscriptColorWheelAccessibility _accessibilitySetOriginalPickerRotation:](self, "_accessibilitySetOriginalPickerRotation:", -1.0);
  -[ETTranscriptColorWheelAccessibility _accessibilitySpeakPickerColor](self, "_accessibilitySpeakPickerColor");
}

- (void)_accessibilityIncrementColorPicker
{
  -[ETTranscriptColorWheelAccessibility _accessibilityAdjustColorPickerBy:](self, "_accessibilityAdjustColorPickerBy:", 0.104719755);
}

- (void)_accessibilityDecrementColorPicker
{
  -[ETTranscriptColorWheelAccessibility _accessibilityAdjustColorPickerBy:](self, "_accessibilityAdjustColorPickerBy:", -0.104719755);
}

- (void)_accessibilityAdjustColorPickerBy:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  __double2 v22;
  CGRect v23;
  CGRect v24;

  -[ETTranscriptColorWheelAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("pickerRotation"));
  v6 = v5 + a3;
  -[ETTranscriptColorWheelAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("colorWheelRadius"));
  v8 = v7;
  -[ETTranscriptColorWheelAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("gradientWidth"));
  v10 = v8 - v9 * 0.5;
  -[ETTranscriptColorWheelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bounds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CGRectValue");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v23.origin.x = v13;
  v23.origin.y = v15;
  v23.size.width = v17;
  v23.size.height = v19;
  v20 = CGRectGetWidth(v23) * 0.5;
  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  v21 = CGRectGetHeight(v24) * 0.5;
  v22 = __sincos_stret(v6);
  -[ETTranscriptColorWheelAccessibility updatePickerPositionForPoint:](self, "updatePickerPositionForPoint:", v20 + v10 * v22.__cosval, v21 + v10 * v22.__sinval);
}

- (double)_accessibilityDifferenceBetweenAngle:(double)a3 andAngle:(double)a4
{
  return fmod(a3 - a4 + 3.14159265, 6.28318531) + -3.14159265;
}

- (void)_accessibilitySpeakPickerColor
{
  void *v2;
  void *v3;
  id v4;

  -[ETTranscriptColorWheelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pickerCircle"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("backgroundColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axColorStringForSpeaking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

@end
