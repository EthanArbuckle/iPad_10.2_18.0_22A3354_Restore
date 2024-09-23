@implementation TabCollectionViewManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TabCollectionViewManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabCollectionViewManager"), CFSTR("tabCollectionView:didSelectItem:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabCollectionViewManager"), CFSTR("tabCollectionView:closeItem:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabCollectionViewManager"), CFSTR("_indexToInsertPlaceholderAtTabItem:"), "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabCollectionViewManager"), CFSTR("movePlaceholder:overTabItem:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabCollectionViewManager"), CFSTR("_dataSource"), "<TabCollectionViewManagerDataSource>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabCollectionViewManager"), CFSTR("_placeholderItemIndex"), "Q");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabCollectionViewManager"), CFSTR("_tabOverview"), "TabOverview");

}

- (void)tabCollectionView:(id)a3 didSelectItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[TabCollectionViewManagerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_dataSource.activeTabDocument"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)TabCollectionViewManagerAccessibility;
  -[TabCollectionViewManagerAccessibility tabCollectionView:didSelectItem:](&v9, sel_tabCollectionView_didSelectItem_, v7, v6);

  if (v8 != v6)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);

}

- (void)tabCollectionView:(id)a3 closeItem:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TabCollectionViewManagerAccessibility;
  -[TabCollectionViewManagerAccessibility tabCollectionView:closeItem:](&v4, sel_tabCollectionView_closeItem_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
}

- (void)movePlaceholder:(id)a3 overTabItem:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  objc_super v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  TabCollectionViewManagerAccessibility *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  v7 = a4;
  v8 = -[TabCollectionViewManagerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_placeholderItemIndex"));
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __69__TabCollectionViewManagerAccessibility_movePlaceholder_overTabItem___block_invoke;
  v24 = &unk_25029F278;
  v27 = &v28;
  v25 = self;
  v9 = v7;
  v26 = v9;
  AXPerformSafeBlock();
  v10 = v29[3];

  _Block_object_dispose(&v28, 8);
  v20.receiver = self;
  v20.super_class = (Class)TabCollectionViewManagerAccessibility;
  -[TabCollectionViewManagerAccessibility movePlaceholder:overTabItem:](&v20, sel_movePlaceholder_overTabItem_, v6, v9);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "safeStringForKey:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "length"))
    {
      v12 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10 + 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringFromNumber:numberStyle:", v13, 6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      accessibilityLocalizedString(CFSTR("tab.position"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AXCFormattedString();
      v16 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v16;
    }
    if (v8 <= v10)
      v17 = CFSTR("moved.after.tab");
    else
      v17 = CFSTR("moved.before.tab");
    accessibilityLocalizedString(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AXCFormattedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v18) = *MEMORY[0x24BDF71E8];
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v19);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v18, (id)*MEMORY[0x24BDFEE28]);

  }
}

uint64_t __69__TabCollectionViewManagerAccessibility_movePlaceholder_overTabItem___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_indexToInsertPlaceholderAtTabItem:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

@end
