@implementation PSSetupControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSSetupController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillBecomeVisible:(void *)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSSetupControllerAccessibility;
  -[PSSetupControllerAccessibility viewWillBecomeVisible:](&v3, sel_viewWillBecomeVisible_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

@end
