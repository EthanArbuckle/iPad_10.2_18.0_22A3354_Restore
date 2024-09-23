@implementation PBAPasscodeEntryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PBAPasscodeEntryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("PBAPasscodeEntryViewController"), CFSTR("UIViewController"));
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBAPasscodeEntryViewControllerAccessibility;
  -[PBAPasscodeEntryViewControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
