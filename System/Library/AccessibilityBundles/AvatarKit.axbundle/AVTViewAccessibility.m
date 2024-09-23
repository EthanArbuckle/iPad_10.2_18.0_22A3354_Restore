@implementation AVTViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTView"), CFSTR("faceIsTracked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTView"), CFSTR("enableFaceTracking"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVTView"), CFSTR("_faceTrackingPaused"), "B");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  void *v3;
  id v4;
  __CFString *v5;
  void *v7;

  -[AVTViewAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVTViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("enableFaceTracking"))
    && (-[AVTViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_faceTrackingPaused")) & 1) == 0)
  {
    if (-[AVTViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("faceIsTracked")))
      v5 = CFSTR("tracking.enabled");
    else
      v5 = CFSTR("tracking.disabled");
    accessibilityAvatarKitLocalizedString(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = v3;
  }

  return v4;
}

@end
