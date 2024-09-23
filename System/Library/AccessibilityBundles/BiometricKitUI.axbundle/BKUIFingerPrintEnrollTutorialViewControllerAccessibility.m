@implementation BKUIFingerPrintEnrollTutorialViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUIFingerPrintEnrollTutorialViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIFingerPrintEnrollTutorialViewController"), CFSTR("setEnrollViewState:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIFingerPrintEnrollTutorialViewController"), CFSTR("enrollTutorialImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIFingerPrintEnrollTutorialViewController"), CFSTR("continueButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKUIFingerPrintEnrollTutorialViewControllerAccessibility;
  -[BKUIFingerPrintEnrollTutorialViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[BKUIFingerPrintEnrollTutorialViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enrollTutorialImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

  -[BKUIFingerPrintEnrollTutorialViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enrollTutorialImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXDeviceIsPad())
    v5 = CFSTR("enroll.tutor.image.label.ipad");
  else
    v5 = CFSTR("enroll.tutor.image.label.left.hand");
  accessibilityLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

}

- (void)setEnrollViewState:(unint64_t)a3
{
  void *v5;
  __CFString *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKUIFingerPrintEnrollTutorialViewControllerAccessibility;
  -[BKUIFingerPrintEnrollTutorialViewControllerAccessibility setEnrollViewState:](&v8, sel_setEnrollViewState_);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  if (a3 == 1)
  {
    -[BKUIFingerPrintEnrollTutorialViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enrollTutorialImageView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (AXDeviceIsPad())
      v6 = CFSTR("enroll.tutor.image.label.ipad");
    else
      v6 = CFSTR("enroll.tutor.image.label.right.hand");
    accessibilityLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v7);

  }
}

@end
