@implementation ActivationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return &stru_2503440B0;
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ActivationControllerAccessibility;
  -[ActivationControllerAccessibility viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
