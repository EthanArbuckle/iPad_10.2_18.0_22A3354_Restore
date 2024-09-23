@implementation SBAlertItemsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAlertItemsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)activateAlertItem:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAlertItemsControllerAccessibility;
  -[SBAlertItemsControllerAccessibility activateAlertItem:](&v3, sel_activateAlertItem_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)deactivateAlertItem:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAlertItemsControllerAccessibility;
  -[SBAlertItemsControllerAccessibility deactivateAlertItem:](&v3, sel_deactivateAlertItem_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
