@implementation CKPinnedConversationCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKPinnedConversationCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("UICollectionView"), CFSTR("delegate"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKPinnedConversationCollectionViewCell"), CFSTR("pinnedConversationView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("_conversationActionMenusForItemIdentifier:inSection:withCell:forSearch:"), "@", "@", "Q", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("conversationForItemIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("togglePinStateForConversation:withReason:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("pinnedConversationDisplayNamePreferringShortName:"), "@", "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKPinnedConversationCollectionViewCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UICollectionView"), CFSTR("_dragAndDropController"), "_UICollectionViewDragAndDropController");
  objc_msgSend(v3, "validateClass:", CFSTR("_UICollectionViewDragSourceController"));

}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40;
  uint64_t *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  id v47;
  id v48;
  uint64_t *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t);
  void *v57;
  id v58;
  id v59;
  id v60;
  CKPinnedConversationCollectionViewCellAccessibility *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  objc_super v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v69.receiver = self;
  v69.super_class = (Class)CKPinnedConversationCollectionViewCellAccessibility;
  -[CKPinnedConversationCollectionViewCellAccessibility accessibilityCustomActions](&v69, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "axSafelyAddObjectsFromArray:", v3);

  -[CKPinnedConversationCollectionViewCellAccessibility _accessibilityIndexPath](self, "_accessibilityIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CKPinnedConversationCollectionViewCellAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "safeValueForKey:", CFSTR("delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "itemIdentifierForIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v64 = &v63;
    v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__10;
    v67 = __Block_byref_object_dispose__10;
    v68 = 0;
    v54 = MEMORY[0x24BDAC760];
    v55 = 3221225472;
    v56 = __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v57 = &unk_2501B1D08;
    v62 = &v63;
    v9 = v5;
    v58 = v9;
    v10 = v7;
    v59 = v10;
    v60 = v4;
    v61 = self;
    AXPerformSafeBlock();
    v11 = (id)v64[5];

    _Block_object_dispose(&v63, 8);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v51 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "children");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "axSafelyAddObjectsFromArray:", v16);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
      }
      while (v13);
    }

    v63 = 0;
    v64 = &v63;
    v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__10;
    v67 = __Block_byref_object_dispose__10;
    v68 = 0;
    v43 = MEMORY[0x24BDAC760];
    v44 = 3221225472;
    v45 = __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
    v46 = &unk_2501B1DA8;
    v49 = &v63;
    v47 = v9;
    v29 = v10;
    v48 = v29;
    AXPerformSafeBlock();
    v17 = (id)v64[5];

    _Block_object_dispose(&v63, 8);
    v42 = 0;
    objc_opt_class();
    v63 = 0;
    v64 = &v63;
    v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__10;
    v67 = __Block_byref_object_dispose__10;
    v68 = 0;
    v36 = MEMORY[0x24BDAC760];
    v37 = 3221225472;
    v38 = __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3;
    v39 = &unk_2501B1B28;
    v41 = &v63;
    v40 = v17;
    AXPerformSafeBlock();
    v18 = (id)v64[5];

    _Block_object_dispose(&v63, 8);
    __UIAccessibilityCastAsClass();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc(MEMORY[0x24BDF6788]);
    v21 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("unpin.action.title"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v22, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_4;
    v33[3] = &unk_2501B1DD0;
    v34 = v47;
    v35 = v40;
    v24 = v40;
    v25 = v47;
    v26 = (void *)objc_msgSend(v20, "initWithName:actionHandler:", v23, v33);

    objc_msgSend(v32, "axSafelyAddObject:", v26);
    _AXCustomActionsForActions(v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "axSafelyAddObjectsFromArray:", v27);

  }
  return v32;
}

void __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_conversationActionMenusForItemIdentifier:inSection:withCell:forSearch:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "section"), *(_QWORD *)(a1 + 56), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "conversationForItemIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "pinnedConversationDisplayNamePreferringShortName:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v3;
  id v4;

  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __81__CKPinnedConversationCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "togglePinStateForConversation:withReason:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BE501B8]);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CKPinnedConversationCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pinnedConversationView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationCollectionViewCellAccessibility _accessibilityParentCollectionView](self, "_accessibilityParentCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("_dragAndDropController.sourceController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKPinnedConversationCollectionViewCellAccessibility _accessibilityPinnedView](self, "_accessibilityPinnedView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    UIRectGetCenter();
    objc_msgSend(v8, "convertPoint:toView:", v4);
    v10 = v9;
    v12 = v11;
    v13 = objc_alloc(MEMORY[0x24BDF67B0]);
    v14 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("drag.pinned.cell"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_axFromString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v13, "initWithName:point:inView:", v17, v4, v10, v12);
    objc_msgSend(v3, "axSafelyAddObject:", v18);

  }
  return v3;
}

- (id)accessibilityDropPointDescriptors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationCollectionViewCellAccessibility _accessibilityParentCollectionView](self, "_accessibilityParentCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasActiveDrop"))
  {
    -[CKPinnedConversationCollectionViewCellAccessibility _accessibilityPinnedView](self, "_accessibilityPinnedView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    UIRectGetCenter();
    objc_msgSend(v6, "convertPoint:toView:", v4);
    v8 = v7;
    v10 = v9 + -0.5;
    v11 = objc_alloc(MEMORY[0x24BDF67B0]);
    v12 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("drop.before.pinned.cell"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_axFromString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v11, "initWithName:point:inView:", v15, v4, v10, v8);
    objc_msgSend(v3, "axSafelyAddObject:", v16);

    objc_msgSend(v6, "bounds");
    UIRectGetCenter();
    objc_msgSend(v6, "convertPoint:toView:", v4);
    v18 = v17;
    v20 = v19 + 0.5;
    v21 = objc_alloc(MEMORY[0x24BDF67B0]);
    v22 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("drop.after.pinned.cell"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_axFromString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v21, "initWithName:point:inView:", v25, v4, v20, v18);
    objc_msgSend(v3, "axSafelyAddObject:", v26);

  }
  return v3;
}

- (id)_accessibilityParentCollectionView
{
  return (id)-[CKPinnedConversationCollectionViewCellAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
}

- (id)_accessibilityPinnedView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[CKPinnedConversationCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pinnedConversationView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
