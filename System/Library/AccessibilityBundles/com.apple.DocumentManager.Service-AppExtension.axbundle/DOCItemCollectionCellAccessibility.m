@implementation DOCItemCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UICollectionViewCell"), CFSTR("UICollectionReusableView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionReusableView"), CFSTR("_collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"), CFSTR("accessibilityCellManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCellContent"), CFSTR("accessibilityItem"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"), CFSTR("accessibilityCellManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCell"), CFSTR("accessibilityIsRenaming"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCellContent"), CFSTR("accessibilityItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionCellContent"), CFSTR("accessibilityShouldDim"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionViewController"), CFSTR("accessibilityIsRenamingInline"), "B", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionViewController"), CFSTR("UIContextMenuInteractionDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionViewController"), CFSTR("contextMenuForItemsAt:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionViewController"), CFSTR("contextMenuForFolder"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return -[DOCItemCollectionCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsRenaming")) ^ 1;
}

- (id)accessibilityValue
{
  return &stru_2503EDD98;
}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[DOCItemCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCellManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DOCItemCollectionCellAccessibility _axAttrTitle](self, "_axAttrTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "folderType") == 1)
  {
    objc_msgSend(v5, "fp_appContainerBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_axAttrTitle
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[DOCItemCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axCustomActionsFromUIMenu:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  AXDocumentCustomAction *v17;
  void *v18;
  id v19;
  AXDocumentCustomAction *v20;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = v3;
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("children"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v38;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(obj);
        v29 = v5;
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v5), "safeArrayForKey:", CFSTR("children"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("title"), 1);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:");
        v28 = v6;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sortedArrayUsingDescriptors:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v34 != v11)
                objc_enumerationMutation(v8);
              v32 = 0;
              objc_opt_class();
              __UIAccessibilityCastAsClass();
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32)
                abort();
              v14 = v13;
              if (v13)
              {
                objc_msgSend(v13, "title");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "length");

                if (v16)
                {
                  v17 = [AXDocumentCustomAction alloc];
                  objc_msgSend(v14, "title");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v30[0] = MEMORY[0x24BDAC760];
                  v30[1] = 3221225472;
                  v30[2] = __65__DOCItemCollectionCellAccessibility__axCustomActionsFromUIMenu___block_invoke;
                  v30[3] = &unk_2503ED9C8;
                  v19 = v14;
                  v31 = v19;
                  v20 = -[AXDocumentCustomAction initWithName:actionHandler:](v17, "initWithName:actionHandler:", v18, v30);

                  -[AXDocumentCustomAction setAction:](v20, "setAction:", v19);
                  objc_msgSend(v4, "addObject:", v20);

                }
              }

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v10);
        }

        v5 = v29 + 1;
      }
      while (v29 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v25);
  }

  return v4;
}

uint64_t __65__DOCItemCollectionCellAccessibility__axCustomActionsFromUIMenu___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __65__DOCItemCollectionCellAccessibility__axCustomActionsFromUIMenu___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithSender:target:", 0, 0);
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  objc_super v6;
  objc_super v7;

  -[DOCItemCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCellManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("accessibilityShouldDim"));

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)DOCItemCollectionCellAccessibility;
    return *MEMORY[0x24BDF73E8] | -[DOCItemCollectionCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DOCItemCollectionCellAccessibility;
    return -[DOCItemCollectionCellAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  }
}

- (id)accessibilityCustomActions
{
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_accessibilityCustomActions"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)MEMORY[0x24BEBAD70];
  objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*v4, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((-[DOCItemCollectionCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsRenaming")) & 1) != 0|| (-[DOCItemCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_collectionView")), v7 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v7, "_accessibilityViewController"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "safeBoolForKey:", CFSTR("accessibilityIsRenamingInline")), v8, v7, (v9 & 1) != 0))
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    AXPerformSafeBlock();
    if (v13[5])
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCItemCollectionCellAccessibility _axCustomActionsFromUIMenu:](self, "_axCustomActionsFromUIMenu:", v13[5]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v10);

      objc_msgSend(*v4, "setObject:forKeyedSubscript:", v6, v3);
    }
    else
    {
      v6 = (void *)MEMORY[0x24BDBD1A8];
    }
    _Block_object_dispose(&v12, 8);

  }
  return v6;
}

void __64__DOCItemCollectionCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    LOBYTE(v12) = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_accessibilityItemCollectionViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "_accessibilityIndexPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      v13 = &v12;
      v14 = 0x3032000000;
      v15 = __Block_byref_object_copy_;
      v16 = __Block_byref_object_dispose_;
      v17 = 0;
      v10 = v4;
      v11 = v6;
      AXPerformSafeBlock();
      v7 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }

}

void __64__DOCItemCollectionCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "contextMenuForItemsAt:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityItemCollectionViewController
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __80__DOCItemCollectionCellAccessibility__accessibilityItemCollectionViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilityScrollToVisible
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  -[DOCItemCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "scrollViewWillBeginDragging:", v4);
  v8.receiver = self;
  v8.super_class = (Class)DOCItemCollectionCellAccessibility;
  v6 = -[DOCItemCollectionCellAccessibility accessibilityScrollToVisible](&v8, sel_accessibilityScrollToVisible);

  return v6;
}

@end
