@implementation VerificationSummaryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExposureNotificationUI.VerificationSummaryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HealthExposureNotificationUI.VerificationSummaryViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VerificationSummaryViewControllerAccessibility;
  -[VerificationSummaryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VerificationSummaryViewControllerAccessibility;
  -[VerificationSummaryViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[VerificationSummaryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
