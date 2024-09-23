@implementation TPSetPINViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPSetPINViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSetPINViewController"), CFSTR("_updateNavBarButtons"), "v", 0);
}

- (void)_updateNavBarButtons
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TPSetPINViewControllerAccessibility;
  -[TPSetPINViewControllerAccessibility _updateNavBarButtons](&v2, sel__updateNavBarButtons);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
