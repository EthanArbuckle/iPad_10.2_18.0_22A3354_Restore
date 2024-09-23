@implementation AVTSelectableStickerSheetControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTSelectableStickerSheetController");
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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTSelectableStickerSheetController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTSelectableStickerSheetController"), CFSTR("avatarRecord"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTSelectableStickerSheetController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTSelectableStickerSheetController"), CFSTR("isCameraItem:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTSelectableStickerSheetController"), CFSTR("stickerItems"), "@", 0);
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
  v18.super_class = (Class)AVTSelectableStickerSheetControllerAccessibility;
  -[AVTSelectableStickerSheetControllerAccessibility _accessibilityLoadAccessibilityInformation](&v18, sel__accessibilityLoadAccessibilityInformation);
  v17 = 0;
  objc_opt_class();
  -[AVTSelectableStickerSheetControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
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
        -[AVTSelectableStickerSheetControllerAccessibility _axMarkupCell:indexPath:](self, "_axMarkupCell:indexPath:", v11, v12);

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
  v9.super_class = (Class)AVTSelectableStickerSheetControllerAccessibility;
  v6 = a4;
  -[AVTSelectableStickerSheetControllerAccessibility collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSelectableStickerSheetControllerAccessibility _axMarkupCell:indexPath:](self, "_axMarkupCell:indexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (void)_axMarkupCell:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[AVTSelectableStickerSheetControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("stickerItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v10 = MEMORY[0x24BDAC760];
  v16[1] = (id)MEMORY[0x24BDAC760];
  v16[2] = (id)3221225472;
  v16[3] = __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke;
  v16[4] = &unk_2501820A0;
  v16[7] = &v17;
  v16[5] = self;
  v11 = v9;
  v16[6] = v11;
  AXPerformSafeBlock();
  LODWORD(v9) = *((unsigned __int8 *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  if ((_DWORD)v9)
  {
    objc_msgSend(v6, "_setAccessibilityLabelBlock:", &__block_literal_global_0);
  }
  else
  {
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_3;
    v14[3] = &unk_250182050;
    objc_copyWeak(v16, &location);
    v15 = v7;
    objc_msgSend(v6, "_setAccessibilityLabelBlock:", v14);
    objc_msgSend(v6, "_setAccessibilityHintBlock:", &__block_literal_global_209);
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_5;
    v12[3] = &unk_250182168;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v6, "_setAccessibilityCustomContentBlock:", v12);
    objc_destroyWeak(&v13);

    objc_destroyWeak(v16);
  }
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);

  objc_destroyWeak(&location);
}

uint64_t __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCameraItem:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

id __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_2()
{
  return accessibilityLocalizedString(CFSTR("custom.pose"));
}

id __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "safeArrayForKey:", CFSTR("stickerItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4 <= objc_msgSend(*(id *)(a1 + 32), "item"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "item"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("localizedName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("avatarRecord"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_axGetCurrentAvatarDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_axGetCurrentAvatarRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v9) & 1) == 0)
  {

LABEL_8:
    objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForAvatarWithRecord:includeVideoPrefix:", v7, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_axSetCurrentAvatarRecord:", v7);
    objc_msgSend(WeakRetained, "_axSetCurrentAvatarDescription:", v11);
    v8 = (void *)v11;
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "_axGetCurrentAvatarDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_8;
LABEL_9:
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_4()
{
  return accessibilityLocalizedString(CFSTR("grayscale.pose"));
}

id __76__AVTSelectableStickerSheetControllerAccessibility__axMarkupCell_indexPath___block_invoke_5(uint64_t a1)
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
