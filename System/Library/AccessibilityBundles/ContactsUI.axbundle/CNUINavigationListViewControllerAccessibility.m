@implementation CNUINavigationListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNUINavigationListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNUINavigationListViewController"), CFSTR("itemAtIndexPath:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNUINavigationListViewController"), CFSTR("navigationListView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNUINavigationListViewController"), CFSTR("toggleItem:"), "v", "@", 0);

}

- (BOOL)_accessibilityToggleItemForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v10;
  id v11;
  id v12;

  v4 = a3;
  objc_opt_class();
  -[CNUINavigationListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationListView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("accessoryControlExpanded"));
    v10 = MEMORY[0x24BDAC760];
    v11 = v6;
    v12 = v4;
    AXPerformSafeBlock();
    v8 = v7 ^ objc_msgSend(v12, "safeBoolForKey:", CFSTR("accessoryControlExpanded"), v10, 3221225472, __81__CNUINavigationListViewControllerAccessibility__accessibilityToggleItemForCell___block_invoke, &unk_2501D82B0);

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

void __81__CNUINavigationListViewControllerAccessibility__accessibilityToggleItemForCell___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "itemAtIndexPath:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "toggleItem:", v2);

}

@end
