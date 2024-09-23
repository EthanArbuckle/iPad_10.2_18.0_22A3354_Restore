@implementation CNContactGridCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNContactGridCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactGridCell"), CFSTR("_createViewsIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactGridCell"), CFSTR("animationBlockForPreparingToShowActions"), "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactGridCell"), CFSTR("avatarView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactGridCell"), CFSTR("actionsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAvatarView"), CFSTR("contact"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNQuickAction"), CFSTR("perform"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNQuickAction"), CFSTR("category"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  id v4;
  id v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  objc_super v19;

  -[CNContactGridCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23490B8B0](CFSTR("SearchUIContactsTableViewCell"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNContactGridCellAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", MEMORY[0x23490B8B0](CFSTR("UICollectionView")));
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    v18 = 0;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    AXPerformSafeBlock();
    v5 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    v6 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isExpanded"));
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;

    v11 = 1;
    if ((v6 & 1) == 0)
    {
      v10 = v9 >= 500.0 ? 6 : 4;
      if (objc_msgSend(v5, "item") >= v10)
        v11 = 0;
    }

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CNContactGridCellAccessibility;
    v11 = -[CNContactGridCellAccessibility isAccessibilityElement](&v19, sel_isAccessibilityElement);
  }

  return v11;
}

void __56__CNContactGridCellAccessibility_isAccessibilityElement__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[CNContactGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("avatarView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("contact"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_6;
  if ((objc_msgSend(v4, "areKeysAvailable:", v6) & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  accessibilityContactStore();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unifiedContactWithIdentifier:keysToFetch:error:", v9, v6, 0);
  v10 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v10;
  if (v10)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v11 = 0;
  }
  accessibilityLocalizedString(CFSTR("contact"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (id)accessibilityCustomActions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id obj;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  id (*v33)(uint64_t);
  void *v34;
  CNContactGridCellAccessibility *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CNContactGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionsView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v31 = MEMORY[0x24BDAC760];
    v32 = 3221225472;
    v33 = __60__CNContactGridCellAccessibility_accessibilityCustomActions__block_invoke;
    v34 = &unk_2501D8238;
    v35 = self;
    AXPerformSafeBlock();
    -[CNContactGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionsView"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = v2;
  objc_msgSend(v2, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v28;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v28 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v5);
        v21 = 0;
        v22 = &v21;
        v23 = 0x3032000000;
        v24 = __Block_byref_object_copy__1;
        v25 = __Block_byref_object_dispose__1;
        v26 = 0;
        AXPerformSafeBlock();
        v7 = (id)v22[5];
        _Block_object_dispose(&v21, 8);

        v8 = AXLocalizedStringFromQuickActionCategory_onceToken;
        v9 = v7;
        if (v8 != -1)
          dispatch_once(&AXLocalizedStringFromQuickActionCategory_onceToken, &__block_literal_global_2);
        objc_msgSend((id)AXQuickActionCategoryTable, "objectForKeyedSubscript:", v9, v13, v14, v15, v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v10, self, sel__axPerformCustomAction_);
          objc_msgSend(v11, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("AXCNActionKey"));
          objc_msgSend(v20, "addObject:", v11);

        }
        else
        {
          v15 = v6;
          v16 = v9;
          v14 = CFSTR("Could not create title for action %@ with category %@");
          LOBYTE(v13) = 1;
          _AXLogWithFacility();
        }

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v3);
  }

  return v20;
}

id __60__CNContactGridCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "animationBlockForPreparingToShowActions");
}

void __60__CNContactGridCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "category");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_createViewsIfNeeded
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactGridCellAccessibility;
  -[CNContactGridCellAccessibility _createViewsIfNeeded](&v4, sel__createViewsIfNeeded);
  -[CNContactGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("avatarView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (void)_axPerformCustomAction:(id)a3
{
  id v3;
  void *v4;

  objc_msgSend(a3, "_accessibilityValueForKey:", CFSTR("AXCNActionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AXPerformSafeBlock();

}

uint64_t __57__CNContactGridCellAccessibility__axPerformCustomAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "perform");
}

- (id)automationElements
{
  void *v2;
  void *v3;

  -[CNContactGridCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_accessibilityUserTestingVisibleCells"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
