@implementation AVTSimpleAvatarPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTSimpleAvatarPicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTSimpleAvatarPicker"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarPickerDataSource"), CFSTR("itemAtIndex:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarPickerDataSource"), CFSTR("isItemAtIndexAddItem:"), "B", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarListRecordItem"), CFSTR("avatar"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVTAvatarRecord"), CFSTR("isEditable"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVTAvatarRecord"), CFSTR("identifier"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVTAvatarListItem"), CFSTR("downcastWithRecordHandler:viewHandler:"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("AVTSimpleAvatarPicker"), CFSTR("collectionView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTSimpleAvatarPicker"), CFSTR("loadView"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)AVTSimpleAvatarPickerAccessibility;
  -[AVTSimpleAvatarPickerAccessibility _accessibilityLoadAccessibilityInformation](&v18, sel__accessibilityLoadAccessibilityInformation);
  v17 = 0;
  objc_opt_class();
  -[AVTSimpleAvatarPickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "visibleCells", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "_accessibilityIndexPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTSimpleAvatarPickerAccessibility _axMarkupCellWithAXInfo:indexPath:](self, "_axMarkupCellWithAXInfo:indexPath:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

  accessibilityLocalizedString(CFSTR("collection.avatars.label"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v12);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTSimpleAvatarPickerAccessibility;
  -[AVTSimpleAvatarPickerAccessibility loadView](&v3, sel_loadView);
  -[AVTSimpleAvatarPickerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_axMarkupCellWithAXInfo:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  -[AVTSimpleAvatarPickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataSource"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  AXPerformSafeBlock();
  LODWORD(v7) = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  if ((_DWORD)v7)
  {
    accessibilityLocalizedString(CFSTR("starfish.add"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v10);
  }
  else
  {
    v11 = v8;
    v12 = v9;
    v13 = v6;
    AXPerformSafeBlock();

    v10 = v11;
  }

}

uint64_t __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isItemAtIndexAddItem:", objc_msgSend(*(id *)(a1 + 40), "item"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_2(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(a1[4], "itemAtIndex:", objc_msgSend(a1[5], "item"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_3;
  v3[3] = &unk_250182118;
  v4 = a1[6];
  objc_msgSend(v2, "downcastWithRecordHandler:viewHandler:", v3, 0);

}

void __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_4;
  v15[3] = &unk_2501820C8;
  v6 = v3;
  v16 = v6;
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v15);
  objc_msgSend(v6, "safeValueForKey:", CFSTR("avatar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("isEditable"));

  if (v8)
  {
    accessibilityLocalizedString(CFSTR("starfish.avatar"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAccessibilityUserInputLabels:", v10);

  }
  v11 = *(void **)(a1 + 32);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_5;
  v13[3] = &unk_2501820F0;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "_setAccessibilityCustomContentBlock:", v13);

}

id __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  if (!CachedAvatarLabels)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)CachedAvatarLabels;
    CachedAvatarLabels = v2;

  }
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("avatar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)CachedAvatarLabels, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)CachedAvatarLabels;
    objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForAvatarWithRecord:includeVideoPrefix:", v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v5);

    objc_msgSend((id)CachedAvatarLabels, "objectForKey:", *(_QWORD *)(a1 + 32));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;

  return v11;
}

id __72__AVTSimpleAvatarPickerAccessibility__axMarkupCellWithAXInfo_indexPath___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("avatarRecord"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDFFA88], "customContentForAvatarWithRecord:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTSimpleAvatarPickerAccessibility;
  v6 = a4;
  -[AVTSimpleAvatarPickerAccessibility collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPickerAccessibility _axMarkupCellWithAXInfo:indexPath:](self, "_axMarkupCellWithAXInfo:indexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end
