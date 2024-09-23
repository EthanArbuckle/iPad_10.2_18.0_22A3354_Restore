@implementation _TVAlertTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVAlertTemplateController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("_TVAlertTemplateController"), CFSTR("UIViewController"));
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVAlertTemplateControllerAccessibility;
  -[_TVAlertTemplateControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAEA0], 0);
}

@end
