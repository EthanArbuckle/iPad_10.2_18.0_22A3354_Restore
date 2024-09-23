@implementation SBUIRemoteAlertServiceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIRemoteAlertServiceViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIRemoteAlertServiceViewController"), CFSTR("prepareForActivationWithContext:completion:"), "v", "@", "@?", 0);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIRemoteAlertServiceViewControllerAccessibility;
  -[SBUIRemoteAlertServiceViewControllerAccessibility prepareForActivationWithContext:completion:](&v4, sel_prepareForActivationWithContext_completion_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAEA0], 0);
}

@end
