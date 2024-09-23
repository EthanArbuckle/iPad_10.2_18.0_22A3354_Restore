@implementation PKPaymentRemoteAlertViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentRemoteAlertViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentRemoteAlertViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentRemoteAlertViewControllerAccessibility;
  -[PKPaymentRemoteAlertViewControllerAccessibility viewWillAppear:](&v3, sel_viewWillAppear_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __66__PKPaymentRemoteAlertViewControllerAccessibility_viewWillAppear___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
