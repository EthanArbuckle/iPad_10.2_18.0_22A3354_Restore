@implementation SUUIRedeemCameraViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIRedeemCameraViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIRedeemCameraViewController"), CFSTR("_enabled"), "B", 0);
}

- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4
{
  UIAccessibilityNotifications v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIRedeemCameraViewControllerAccessibility;
  -[SUUIRedeemCameraViewControllerAccessibility codeRedeemerController:didEndWithInfo:](&v7, sel_codeRedeemerController_didEndWithInfo_, a3, a4);
  if ((-[SUUIRedeemCameraViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_enabled")) & 1) == 0)
  {
    v5 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("redeem.code.validation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v5, v6);

  }
}

@end
