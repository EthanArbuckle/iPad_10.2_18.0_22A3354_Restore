@implementation CUShutterButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CUShutterButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUShutterButton"), CFSTR("mode"), "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return -[CUShutterButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_accessibilityViewIsVisible"));
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v8;
  void *v9;

  if (-[CUShutterButtonAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    -[CUShutterButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    v5 = CFSTR("camera.video.stop.record.button.text");
    v6 = CFSTR("camera.video.record.button.text");
    if (v4 == 8)
      v6 = CFSTR("camera.timelapse.stop");
    if (v4 == 3)
      v6 = CFSTR("camera.timelapse.start");
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 6)
      v5 = v6;
    if (v4 > 8 || ((1 << v4) & 0x1CE) == 0)
      v8 = CFSTR("camera.photo.button.text");
    else
      v8 = (__CFString *)v5;
    accessibilityCameraKitLocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)accessibilityIdentifier
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;

  if ((accessibilityIdentifier_CheckingAXElement_0 & 1) != 0)
    return 0;
  accessibilityIdentifier_CheckingAXElement_0 = 1;
  v3 = -[CUShutterButtonAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  accessibilityIdentifier_CheckingAXElement_0 = 0;
  if (!v3)
    return 0;
  -[CUShutterButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if ((unint64_t)(v5 - 1) > 6)
    return CFSTR("PhotoCapture");
  else
    return *(&off_24FEE0CE8 + v5 - 1);
}

- (BOOL)accessibilityActivate
{
  BOOL v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUShutterButtonAccessibility;
  v2 = -[CUShutterButtonAccessibility accessibilityActivate](&v4, sel_accessibilityActivate);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return v2;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUShutterButtonAccessibility;
  return *MEMORY[0x24BDF7408] | -[CUShutterButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
