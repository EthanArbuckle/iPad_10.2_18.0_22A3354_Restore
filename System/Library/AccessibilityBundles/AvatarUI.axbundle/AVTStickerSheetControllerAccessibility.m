@implementation AVTStickerSheetControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTStickerSheetController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axGetCurrentAvatarDescription
{
  JUMPOUT(0x234907670);
}

- (void)_axSetCurrentAvatarDescription:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axGetCurrentAvatarRecord
{
  JUMPOUT(0x234907670);
}

- (void)_axSetCurrentAvatarRecord:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTStickerSheetController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTStickerSheetController"), CFSTR("avatarRecord"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTStickerSheetController"), CFSTR("model"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTStickerSheetController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTStickerSheetModel"), CFSTR("stickerItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTUIStickerItem"), CFSTR("localizedName"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
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
  v18.super_class = (Class)AVTStickerSheetControllerAccessibility;
  -[AVTStickerSheetControllerAccessibility _accessibilityLoadAccessibilityInformation](&v18, sel__accessibilityLoadAccessibilityInformation);
  v17 = 0;
  objc_opt_class();
  -[AVTStickerSheetControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("collection.stickers.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "visibleCells", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "indexPathForCell:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTStickerSheetControllerAccessibility _axMarkupCell:indexPath:](self, "_axMarkupCell:indexPath:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v8);
  }

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTStickerSheetControllerAccessibility;
  v6 = a4;
  -[AVTStickerSheetControllerAccessibility collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerSheetControllerAccessibility _axMarkupCell:indexPath:](self, "_axMarkupCell:indexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (void)_axMarkupCell:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__AVTStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke;
  v15[3] = &unk_250182050;
  objc_copyWeak(&v17, &location);
  v9 = v7;
  v16 = v9;
  objc_msgSend(v6, "_setAccessibilityLabelBlock:", v15);
  v10 = v8;
  v11 = 3221225472;
  v12 = __66__AVTStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_2;
  v13 = &unk_250182168;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v6, "_setAccessibilityCustomContentBlock:", &v10);
  objc_msgSend(v6, "setIsAccessibilityElement:", 1, v10, v11, v12, v13);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

id __66__AVTStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "safeValueForKey:", CFSTR("model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("stickerItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  if (v5 <= objc_msgSend(*(id *)(a1 + 32), "item"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("localizedName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v2, "safeValueForKey:", CFSTR("avatarRecord"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axGetCurrentAvatarDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axGetCurrentAvatarRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v10) & 1) == 0)
  {

LABEL_8:
    objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForAvatarWithRecord:includeVideoPrefix:", v8, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "_axSetCurrentAvatarRecord:", v8);
    objc_msgSend(v2, "_axSetCurrentAvatarDescription:", v12);
    v9 = (void *)v12;
    goto LABEL_9;
  }
  objc_msgSend(v2, "_axGetCurrentAvatarDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_8;
LABEL_9:
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __66__AVTStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("avatarRecord"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDFFA88], "customContentForAvatarWithRecord:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
