@implementation IdentityProofingTCViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CoreIDVUI.IdentityProofingTCViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CoreIDVUI.IdentityProofingTCViewController"), CFSTR("UIViewController"));
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IdentityProofingTCViewControllerAccessibility;
  -[IdentityProofingTCViewControllerAccessibility viewWillAppear:](&v3, sel_viewWillAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
