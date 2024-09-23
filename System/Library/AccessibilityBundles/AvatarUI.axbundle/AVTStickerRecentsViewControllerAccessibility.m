@implementation AVTStickerRecentsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTStickerRecentsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTStickerRecentsViewController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTStickerRecentsViewController"), CFSTR("displayItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTStickerRecentsViewController"), CFSTR("buttonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTStickerRecentsViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVTStickerRecentsItem"), CFSTR("localizedDescription"));

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
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)AVTStickerRecentsViewControllerAccessibility;
  -[AVTStickerRecentsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  v16 = 0;
  objc_opt_class();
  -[AVTStickerRecentsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "visibleCells", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "indexPathForCell:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTStickerRecentsViewControllerAccessibility _axMarkupCell:indexPath:](self, "_axMarkupCell:indexPath:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

}

- (void)_axMarkupCell:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __72__AVTStickerRecentsViewControllerAccessibility__axMarkupCell_indexPath___block_invoke;
  v14[3] = &unk_250182050;
  objc_copyWeak(&v16, &location);
  v9 = v7;
  v15 = v9;
  objc_msgSend(v6, "_setAccessibilityLabelBlock:", v14);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __72__AVTStickerRecentsViewControllerAccessibility__axMarkupCell_indexPath___block_invoke_2;
  v11[3] = &unk_250182140;
  objc_copyWeak(&v13, &location);
  v10 = v9;
  v12 = v10;
  objc_msgSend(v6, "_setAccessibilityTraitsBlock:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

id __72__AVTStickerRecentsViewControllerAccessibility__axMarkupCell_indexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "safeArrayForKey:", CFSTR("displayItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "row"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("buttonItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
    accessibilityLocalizedString(CFSTR("more.stickers"));
  else
    objc_msgSend(v4, "safeValueForKey:", CFSTR("localizedDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __72__AVTStickerRecentsViewControllerAccessibility__axMarkupCell_indexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "safeArrayForKey:", CFSTR("displayItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "row"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("buttonItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (uint64_t *)MEMORY[0x24BDF73B0];
  if (v4 != v5)
    v6 = (uint64_t *)MEMORY[0x24BDF73D0];
  v7 = *v6;

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTStickerRecentsViewControllerAccessibility;
  v6 = a4;
  -[AVTStickerRecentsViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecentsViewControllerAccessibility _axMarkupCell:indexPath:](self, "_axMarkupCell:indexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end
