@implementation CKConversationListCollectionViewConversationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKConversationListCollectionViewConversationCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKConversationListEmbeddedCollectionViewCell"), CFSTR("UICollectionViewListCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKConversationListCollectionViewConversationCell"), CFSTR("CKConversationListEmbeddedCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListEmbeddedCollectionViewCell"), CFSTR("embeddedTableViewCell"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListEmbeddedCollectionViewCell"), CFSTR("setEditingMode:animated:"), "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewListCell"), CFSTR("trailingEditingAccessoryConfigurations"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListEmbeddedCollectionViewCell"), CFSTR("editingMode"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UICellAccessoryConfigurationCustomView"), CFSTR("customView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewConversationCell"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("_conversationActionMenusForItemIdentifier:inSection:withCell:forSearch:"), "@", "@", "Q", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("togglePinStateForConversation:withReason:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("conversationForItemIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("pinnedConversationDisplayNamePreferringShortName:"), "@", "B", 0);

}

- (id)_privateAccessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  __CFString *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id obj;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t);
  void *v56;
  id v57;
  uint64_t *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t);
  void *v63;
  id v64;
  id v65;
  uint64_t *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t);
  void *v74;
  id v75;
  id v76;
  id v77;
  CKConversationListCollectionViewConversationCellAccessibility *v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  objc_super v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v86.receiver = self;
  v86.super_class = (Class)CKConversationListCollectionViewConversationCellAccessibility;
  -[CKConversationListCollectionViewConversationCellAccessibility accessibilityCustomActions](&v86, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "axSafelyAddObjectsFromArray:", v3);

  -[CKConversationListCollectionViewConversationCellAccessibility _accessibilityIndexPath](self, "_accessibilityIndexPath");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    -[CKConversationListCollectionViewConversationCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "itemIdentifierForIndexPath:", v42);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0;
    v81 = &v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__2;
    v84 = __Block_byref_object_dispose__2;
    v7 = MEMORY[0x24BDAC760];
    v85 = 0;
    v71 = MEMORY[0x24BDAC760];
    v72 = 3221225472;
    v73 = __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke;
    v74 = &unk_2501B1D08;
    v79 = &v80;
    v8 = v4;
    v75 = v8;
    v9 = v6;
    v76 = v9;
    v77 = v42;
    v78 = self;
    AXPerformSafeBlock();
    v10 = (id)v81[5];

    _Block_object_dispose(&v80, 8);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v88, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v68 != v12)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "children");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "axSafelyAddObjectsFromArray:", v14);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v88, 16);
      }
      while (v11);
    }

    v80 = 0;
    v81 = &v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__2;
    v84 = __Block_byref_object_dispose__2;
    v85 = 0;
    v60 = v7;
    v61 = 3221225472;
    v62 = __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_2;
    v63 = &unk_2501B1DA8;
    v66 = &v80;
    v64 = v8;
    v38 = v9;
    v65 = v38;
    AXPerformSafeBlock();
    v15 = (id)v81[5];

    _Block_object_dispose(&v80, 8);
    v59 = 0;
    objc_opt_class();
    v80 = 0;
    v81 = &v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__2;
    v84 = __Block_byref_object_dispose__2;
    v85 = 0;
    v53 = v7;
    v54 = 3221225472;
    v55 = __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_3;
    v56 = &unk_2501B1B28;
    v58 = &v80;
    v57 = v15;
    AXPerformSafeBlock();
    v16 = (id)v81[5];

    _Block_object_dispose(&v80, 8);
    __UIAccessibilityCastAsClass();
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x24BDF6788]);
    v18 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("pin.action.title"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v40);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v7;
    v50[1] = 3221225472;
    v50[2] = __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_4;
    v50[3] = &unk_2501B1DD0;
    v36 = v64;
    v51 = v36;
    v37 = v57;
    v52 = v37;
    v39 = (void *)objc_msgSend(v17, "initWithName:actionHandler:", v20, v50);

    objc_msgSend(v43, "axSafelyAddObject:", v39);
    _AXCustomActionsForActions(v45);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "axSafelyAddObjectsFromArray:", v21);

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v22 = v43;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v87, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v47 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_msgSend(v26, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          accessibilityLocalizedString(CFSTR("mute.collection.view.cell"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "isEqualToString:", v28);

          v30 = CFSTR("hide.alerts.collection.view.cell");
          if ((v29 & 1) != 0)
            goto LABEL_16;
          objc_msgSend(v26, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          accessibilityLocalizedString(CFSTR("unmute.collection.view.cell"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v31, "isEqualToString:", v32);

          v30 = CFSTR("show.alerts.collection.view.cell");
          if (v33)
          {
LABEL_16:
            accessibilityLocalizedString(v30);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setName:", v34);

          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v87, 16);
      }
      while (v23);
    }

  }
  return v43;
}

void __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke(uint64_t a1)
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

void __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_2(uint64_t a1)
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

void __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_3(uint64_t a1)
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

uint64_t __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v3;
  id v4;

  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __99__CKConversationListCollectionViewConversationCellAccessibility__privateAccessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "togglePinStateForConversation:withReason:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BE501B8]);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;

  v3 = -[CKConversationListCollectionViewConversationCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("editingMode"));
  -[CKConversationListCollectionViewConversationCellAccessibility _axEmbeddedTableViewCell](self, "_axEmbeddedTableViewCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == 2)
  {
    accessibilityLocalizedString(CFSTR("unpinned.label"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  void *v2;
  char v3;

  -[CKConversationListCollectionViewConversationCellAccessibility _axEmbeddedTableViewCell](self, "_axEmbeddedTableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityRetainsCustomRotorActionSetting");

  return v3;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  void *v2;
  void *v3;

  -[CKConversationListCollectionViewConversationCellAccessibility _axEmbeddedTableViewCell](self, "_axEmbeddedTableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityCustomActionGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListCollectionViewConversationCellAccessibility;
  -[CKConversationListCollectionViewConversationCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CKConversationListCollectionViewConversationCellAccessibility _axEmbeddedTableViewCell](self, "_axEmbeddedTableViewCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;

  -[CKConversationListCollectionViewConversationCellAccessibility _axEmbeddedTableViewCell](self, "_axEmbeddedTableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityUserInputLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKConversationListCollectionViewConversationCellAccessibility;
  -[CKConversationListCollectionViewConversationCellAccessibility setEditingMode:animated:](&v9, sel_setEditingMode_animated_, a3, a4);
  if (a3 == 2)
  {
    -[CKConversationListCollectionViewConversationCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("trailingEditingAccessoryConfigurations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safeValueForKey:", CFSTR("customView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessibilityElementsHidden:", 1);

    }
  }
}

- (id)_axEmbeddedTableViewCell
{
  return (id)-[CKConversationListCollectionViewConversationCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("embeddedTableViewCell"));
}

@end
