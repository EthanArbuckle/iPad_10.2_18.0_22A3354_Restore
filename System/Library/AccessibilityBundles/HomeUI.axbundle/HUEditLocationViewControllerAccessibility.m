@implementation HUEditLocationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUEditLocationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUEditLocationViewController"), CFSTR("setupCell:forItem:indexPath:"), "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUEditLocationViewController"), CFSTR("homeItemManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUEditLocationItemManager"), CFSTR("inviteUsersItem"), "@", 0);

}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUEditLocationViewControllerAccessibility;
  v9 = a4;
  -[HUEditLocationViewControllerAccessibility setupCell:forItem:indexPath:](&v11, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUEditLocationViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("homeItemManager.inviteUsersItem"), v11.receiver, v11.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v10, "isEqual:", v9);

  if ((_DWORD)self)
    objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

}

@end
