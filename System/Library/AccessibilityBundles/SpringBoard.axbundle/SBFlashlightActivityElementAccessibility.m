@implementation SBFlashlightActivityElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFlashlightActivityElement");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFlashlightActivityElement"), CFSTR("setFlashlightOn:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFlashlightActivityElement"), CFSTR("_flashlightOn"), "BOOL");

}

- (void)setFlashlightOn:(BOOL)a3
{
  _BOOL8 v3;
  UIAccessibilityNotifications v5;
  __CFString *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (-[SBFlashlightActivityElementAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("flashlightOn")) != a3)
  {
    v5 = *MEMORY[0x24BDF71E8];
    if (v3)
      v6 = CFSTR("flashlight.on.full");
    else
      v6 = CFSTR("flashlight.off.full");
    accessibilityLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v5, v7);

  }
  v8.receiver = self;
  v8.super_class = (Class)SBFlashlightActivityElementAccessibility;
  -[SBFlashlightActivityElementAccessibility setFlashlightOn:](&v8, sel_setFlashlightOn_, v3);
}

@end
