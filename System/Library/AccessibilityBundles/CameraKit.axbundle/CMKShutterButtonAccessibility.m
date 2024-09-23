@implementation CMKShutterButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CMKShutterButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CMKShutterButton"), CFSTR("buttonMode"), "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return -[CMKShutterButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_accessibilityViewIsVisible"));
}

- (id)accessibilityLabel
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v8;
  void *v9;

  if (-[CMKShutterButtonAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    -[CMKShutterButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    v5 = CFSTR("camera.video.stop.record.button.text");
    v6 = CFSTR("camera.video.record.button.text");
    if (v4 == 7)
      v6 = CFSTR("camera.timelapse.stop");
    if (v4 == 3)
      v6 = CFSTR("camera.timelapse.start");
    if (v4 - 5 >= 2)
      v5 = v6;
    if (v4 > 7 || ((1 << v4) & 0xEE) == 0)
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
  const __CFString *v6;

  if ((accessibilityIdentifier_CheckingAXElement & 1) != 0)
    return 0;
  accessibilityIdentifier_CheckingAXElement = 1;
  v3 = -[CMKShutterButtonAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  accessibilityIdentifier_CheckingAXElement = 0;
  if (!v3)
    return 0;
  -[CMKShutterButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = CFSTR("PhotoCapture");
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 2)
    v6 = CFSTR("SlomoCapture");
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return CFSTR("VideoCapture");
  else
    return (id)v6;
}

- (BOOL)accessibilityActivate
{
  BOOL v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMKShutterButtonAccessibility;
  v2 = -[CMKShutterButtonAccessibility accessibilityActivate](&v4, sel_accessibilityActivate);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return v2;
}

@end
