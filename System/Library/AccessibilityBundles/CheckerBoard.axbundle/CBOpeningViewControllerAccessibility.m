@implementation CBOpeningViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CBOpeningViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CBOpeningViewController"), CFSTR("didTappedStartDiagnosticsButton"), "v", 0);
}

- (void)didTappedStartDiagnosticsButton
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CBOpeningViewControllerAccessibility;
  -[CBOpeningViewControllerAccessibility didTappedStartDiagnosticsButton](&v2, sel_didTappedStartDiagnosticsButton);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
