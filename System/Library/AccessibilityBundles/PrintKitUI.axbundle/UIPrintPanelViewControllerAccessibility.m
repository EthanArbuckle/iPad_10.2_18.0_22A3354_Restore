@implementation UIPrintPanelViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPrintPanelViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPrintPanelViewController"), CFSTR("dismissPrintPanelWithAction:animated:completionHandler:"), "v", "q", "B", "@?", 0);
}

- (void)dismissPrintPanelWithAction:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPrintPanelViewControllerAccessibility;
  -[UIPrintPanelViewControllerAccessibility dismissPrintPanelWithAction:animated:completionHandler:](&v5, sel_dismissPrintPanelWithAction_animated_completionHandler_, a3, a4, a5);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
