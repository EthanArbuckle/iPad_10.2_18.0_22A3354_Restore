@implementation CCUIMainViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIMainViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CCUIMainViewController"), CFSTR("UIViewController"));
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIMainViewControllerAccessibility;
  -[CCUIMainViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  accessibilityLocalizedString(CFSTR("control.center.showing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIMainViewControllerAccessibility;
  -[CCUIMainViewControllerAccessibility viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
