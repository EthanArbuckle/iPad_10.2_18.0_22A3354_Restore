@implementation WFComposeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFComposeViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFComposeViewController"), CFSTR("expandDrawerAsAuxiliaryViewPresenter"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFComposeViewController"), CFSTR("collapseDrawerAsAuxiliaryViewPresenter"), "v", 0);

}

- (void)expandDrawerAsAuxiliaryViewPresenter
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFComposeViewControllerAccessibility;
  -[WFComposeViewControllerAccessibility expandDrawerAsAuxiliaryViewPresenter](&v2, sel_expandDrawerAsAuxiliaryViewPresenter);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)collapseDrawerAsAuxiliaryViewPresenter
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFComposeViewControllerAccessibility;
  -[WFComposeViewControllerAccessibility collapseDrawerAsAuxiliaryViewPresenter](&v2, sel_collapseDrawerAsAuxiliaryViewPresenter);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
