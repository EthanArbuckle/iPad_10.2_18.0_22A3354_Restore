@implementation PKPassGroupsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassGroupsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupsViewController"), CFSTR("groupStackViewDidBeginReordering:"), "v", "@", 0);
}

- (void)groupStackViewDidBeginReordering:(id)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassGroupsViewControllerAccessibility;
  -[PKPassGroupsViewControllerAccessibility groupStackViewDidBeginReordering:](&v5, sel_groupStackViewDidBeginReordering_, a3);
  v3 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("started.reordering.passes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

@end
