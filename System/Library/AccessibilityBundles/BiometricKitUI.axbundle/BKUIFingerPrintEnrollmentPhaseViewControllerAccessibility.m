@implementation BKUIFingerPrintEnrollmentPhaseViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUIFingerPrintEnrollmentPhaseViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIFingerPrintEnrollmentPhaseViewController"), CFSTR("setHeaderTitle:"), "v", "@", 0);
}

- (void)setHeaderTitle:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewControllerAccessibility;
  v3 = a3;
  -[BKUIFingerPrintEnrollmentPhaseViewControllerAccessibility setHeaderTitle:](&v4, sel_setHeaderTitle_, v3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEE30]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v3);

}

@end
