@implementation BKUIFingerprintEnrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUIFingerprintEnrollViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIFingerprintEnrollViewController"), CFSTR("_startTutorial:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIFingerprintEnrollViewController"), CFSTR("transitionToEnrollView:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIFingerprintEnrollViewController"), CFSTR("_finishEnrollmentPhaseTwo"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIFingerprintEnrollViewController"), CFSTR("_mesaFirstEnrollView"), "BKUICurvesView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIFingerprintEnrollViewController"), CFSTR("_enrollmentPhaseTwo"), "BOOL");

}

- (void)_startTutorial:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKUIFingerprintEnrollViewControllerAccessibility;
  -[BKUIFingerprintEnrollViewControllerAccessibility _startTutorial:](&v6, sel__startTutorial_, a3);
  v4 = -[BKUIFingerprintEnrollViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_enrollmentPhaseTwo")) ^ 1;
  -[BKUIFingerprintEnrollViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mesaFirstEnrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", v4);

}

- (void)_finishEnrollmentPhaseTwo
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKUIFingerprintEnrollViewControllerAccessibility;
  -[BKUIFingerprintEnrollViewControllerAccessibility _finishEnrollmentPhaseTwo](&v2, sel__finishEnrollmentPhaseTwo);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)transitionToEnrollView:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKUIFingerprintEnrollViewControllerAccessibility;
  -[BKUIFingerprintEnrollViewControllerAccessibility transitionToEnrollView:](&v3, sel_transitionToEnrollView_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
