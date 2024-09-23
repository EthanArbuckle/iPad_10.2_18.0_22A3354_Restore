@implementation CalibrationViewServiceControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CalibrationViewServiceController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CalibrationViewServiceController"), CFSTR("viewDidAppear:"), "v", "B", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalibrationViewServiceControllerAccessibility;
  -[CalibrationViewServiceControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
