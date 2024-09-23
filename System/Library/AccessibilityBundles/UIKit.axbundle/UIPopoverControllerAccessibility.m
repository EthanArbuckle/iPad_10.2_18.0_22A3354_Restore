@implementation UIPopoverControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPopoverController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_dismissPopoverAnimated:(BOOL)a3 stateOnly:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  objc_super v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  SEL v9;
  UIPopoverControllerAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  v6 = a5;
  v5.receiver = self;
  v5.super_class = (Class)UIPopoverControllerAccessibility;
  -[UIPopoverControllerAccessibility _dismissPopoverAnimated:stateOnly:notifyDelegate:](&v5, sel__dismissPopoverAnimated_stateOnly_notifyDelegate_, a3, a4, a5);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
