@implementation HomePodSetupIntroViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HDSViewService.HomePodSetupIntroViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HDSViewService.HomePodSetupIntroViewController"), CFSTR("handleTapOnInfoButton"), "v", 0);
}

- (void)handleTapOnInfoButton
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HomePodSetupIntroViewControllerAccessibility;
  -[HomePodSetupIntroViewControllerAccessibility handleTapOnInfoButton](&v2, sel_handleTapOnInfoButton);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
