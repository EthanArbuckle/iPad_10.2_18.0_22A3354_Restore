@implementation MiroEditorClipCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MiroEditorClipCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MiroEditorFlowLayout"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MiroEditorClipCollectionViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroEditorFlowLayout"), CFSTR("snappedIndexPath"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroEditorClipCollectionViewController"), CFSTR("snapToIndexPath: animated:"), "v", "@", "B", 0);

}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  UIAccessibilityNotifications v15;
  void *v16;
  BOOL v17;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  MiroEditorClipCollectionViewControllerAccessibility *v24;
  _QWORD v25[6];
  void *v26;
  char v27;

  v27 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C07D8](CFSTR("MiroEditorFlowLayout"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  v8 = objc_msgSend(v6, "numberOfItemsInSection:", 0);
  v27 = 0;
  objc_opt_class();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("snappedIndexPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    if (objc_msgSend(v10, "row") < v8 - 1)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v10, "row") + 1, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __75__MiroEditorClipCollectionViewControllerAccessibility_accessibilityScroll___block_invoke_2;
      v23 = &unk_24FEF7028;
      v12 = (id *)v25;
      v24 = self;
      v25[0] = v14;
      v13 = v14;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (a3 != 1 || objc_msgSend(v10, "row") < 1)
  {
LABEL_9:

LABEL_10:
    v19.receiver = self;
    v19.super_class = (Class)MiroEditorClipCollectionViewControllerAccessibility;
    v17 = -[MiroEditorClipCollectionViewControllerAccessibility accessibilityScroll:](&v19, sel_accessibilityScroll_, a3);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v10, "row") - 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = MEMORY[0x24BDAC760];
  v25[2] = 3221225472;
  v25[3] = __75__MiroEditorClipCollectionViewControllerAccessibility_accessibilityScroll___block_invoke;
  v25[4] = &unk_24FEF7028;
  v12 = &v26;
  v25[5] = self;
  v26 = v11;
  v13 = v11;
LABEL_8:
  AXPerformSafeBlock();
  v15 = *MEMORY[0x24BDF72C8];
  objc_msgSend(v6, "cellForItemAtIndexPath:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v15, v16);

  v17 = 1;
LABEL_11:

  return v17;
}

uint64_t __75__MiroEditorClipCollectionViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapToIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __75__MiroEditorClipCollectionViewControllerAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapToIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);
}

@end
