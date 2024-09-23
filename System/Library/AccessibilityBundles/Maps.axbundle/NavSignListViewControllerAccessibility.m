@implementation NavSignListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavSignListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignListViewController"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignListViewController"), CFSTR("activeStepIndex"), "Q", 0);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NavSignListViewControllerAccessibility;
  -[NavSignListViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v14, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__NavSignListViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
  v13[3] = &unk_250258E58;
  v13[4] = self;
  objc_msgSend(v7, "_setAccessibilityHintBlock:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __80__NavSignListViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v11[3] = &unk_250258E80;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v7, "_setAccessibilityElementsHiddenBlock:", v11);

  return v7;
}

id __80__NavSignListViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  __CFString *v1;

  if (objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("isExpanded")))
    v1 = CFSTR("ROUTE_LIST_HINT_COLLAPSE");
  else
    v1 = CFSTR("ROUTE_LIST_HINT_EXPAND");
  AXMapsLocString(v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __80__NavSignListViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("isExpanded")) & 1) != 0)
    return 0;
  v3 = objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", CFSTR("activeStepIndex"));
  return objc_msgSend(*(id *)(a1 + 40), "row") != v3;
}

- (void)_didTap:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NavSignListViewControllerAccessibility;
  -[NavSignListViewControllerAccessibility _didTap:](&v3, sel__didTap_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_didPan:(id)a3
{
  id v4;
  int v5;
  objc_super v6;

  v4 = a3;
  v5 = -[NavSignListViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"));
  v6.receiver = self;
  v6.super_class = (Class)NavSignListViewControllerAccessibility;
  -[NavSignListViewControllerAccessibility _didPan:](&v6, sel__didPan_, v4);

  if (v5 != -[NavSignListViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
