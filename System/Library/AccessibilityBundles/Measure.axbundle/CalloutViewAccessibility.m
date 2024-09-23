@implementation CalloutViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.CalloutView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Measure.CalloutView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("setAlpha:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.CalloutViewSpatial"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.CalloutViewRegular"), CFSTR("label"), "@", 0);

}

- (NSString)axCalloutText
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[CalloutViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)axDidUpdateFromPreviousCalloutText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CalloutViewAccessibility axCalloutText](self, "axCalloutText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CalloutViewAccessibility _axIsActuallyVisible](self, "_axIsActuallyVisible")
    && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0
    && objc_msgSend(v4, "length"))
  {
    AXMeasureSpeakMeasurementAnnouncement(v4);
  }

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalloutViewAccessibility;
  -[CalloutViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CalloutViewAccessibility _axUpdateIsVisible](self, "_axUpdateIsVisible");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("CALLOUT_VIEW"));
}

- (BOOL)_axInternalIsActuallyVisible
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetInternalIsActuallyVisible:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_axSetIsNotActuallyVisible
{
  -[CalloutViewAccessibility _axSetIsActuallyVisible:](self, "_axSetIsActuallyVisible:", 0);
}

- (void)_axSetIsActuallyVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (-[CalloutViewAccessibility _axInternalIsActuallyVisible](self, "_axInternalIsActuallyVisible") != a3)
  {
    -[CalloutViewAccessibility _axSetInternalIsActuallyVisible:](self, "_axSetInternalIsActuallyVisible:", v3);
    if (v3)
    {
      -[CalloutViewAccessibility axCalloutText](self, "axCalloutText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6)
      {
        -[CalloutViewAccessibility axCalloutText](self, "axCalloutText");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        AXMeasureSpeakMeasurementAnnouncement(v7);

      }
    }
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

- (void)_axUpdateIsVisible
{
  void *v3;
  double v4;
  double v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = fabs(v4 + -1.0);

  if (v5 >= 2.22044605e-16)
  {
    -[CalloutViewAccessibility performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__axSetIsNotActuallyVisible, 0, 0.5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__axSetIsNotActuallyVisible, 0);
    -[CalloutViewAccessibility _axSetIsActuallyVisible:](self, "_axSetIsActuallyVisible:", 1);
  }
}

- (void)setAlpha:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  char v10;

  v10 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;
  v9.receiver = self;
  v9.super_class = (Class)CalloutViewAccessibility;
  -[CalloutViewAccessibility setAlpha:](&v9, sel_setAlpha_, a3);
  objc_msgSend(v5, "alpha");
  if (vabdd_f64(v7, v8) >= 2.22044605e-16)
    -[CalloutViewAccessibility _axUpdateIsVisible](self, "_axUpdateIsVisible");

}

@end
