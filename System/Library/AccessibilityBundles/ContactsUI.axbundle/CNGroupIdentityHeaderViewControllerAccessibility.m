@implementation CNGroupIdentityHeaderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNGroupIdentityHeaderViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNGroupIdentityHeaderViewController"), CFSTR("actionButtonTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNGroupIdentityHeaderViewController"), CFSTR("actionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNGroupIdentityHeaderViewController"), CFSTR("updateActionButton"), "v", 0);

}

- (void)updateActionButton
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNGroupIdentityHeaderViewControllerAccessibility;
  -[CNGroupIdentityHeaderViewControllerAccessibility updateActionButton](&v7, sel_updateActionButton);
  -[CNGroupIdentityHeaderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__CNGroupIdentityHeaderViewControllerAccessibility_updateActionButton__block_invoke;
  v4[3] = &unk_2501D84A0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setIsAccessibilityElementBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

BOOL __70__CNGroupIdentityHeaderViewControllerAccessibility_updateActionButton__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeStringForKey:", CFSTR("actionButtonTitle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

@end
