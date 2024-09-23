@implementation AVTUIAvatarPickerMemojiPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTUIAvatarPickerMemojiPickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTUIAvatarPickerMemojiPickerViewController"), CFSTR("collectionView:didSelectItemAtIndexPath:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTUIAvatarPickerMemojiPickerViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTUIAvatarPickerMemojiPickerViewController"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarRecordDataSource"), CFSTR("recordAtIndex:"), "@", "q", 0);

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
  v17.super_class = (Class)AVTUIAvatarPickerMemojiPickerViewControllerAccessibility;
  -[AVTUIAvatarPickerMemojiPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  v16 = 0;
  objc_opt_class();
  -[AVTUIAvatarPickerMemojiPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
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
        -[AVTUIAvatarPickerMemojiPickerViewControllerAccessibility _axMarkupCell:atIndexPath:](self, "_axMarkupCell:atIndexPath:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

}

- (void)_axMarkupCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  v8 = objc_msgSend(v6, "accessibilityTraits");
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v8);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__AVTUIAvatarPickerMemojiPickerViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke;
  v10[3] = &unk_2501817E0;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v6, "_setAccessibilityLabelBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

id __86__AVTUIAvatarPickerMemojiPickerViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axLabelForIndexPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axLabelForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (v5)
  {
    if (v5 < 1)
    {
      v8 = 0;
    }
    else
    {
      -[AVTUIAvatarPickerMemojiPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataSource"));
      v10 = 0;
      v11 = &v10;
      v12 = 0x3032000000;
      v13 = __Block_byref_object_copy_;
      v14 = __Block_byref_object_dispose_;
      v15 = 0;
      v6 = (id)objc_claimAutoreleasedReturnValue();
      AXPerformSafeBlock();
      v7 = v11[5];
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForAvatarWithRecord:includeVideoPrefix:", v7, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

      _Block_object_dispose(&v10, 8);
    }
  }
  else
  {
    accessibilityLocalizedString(CFSTR("newMemoji"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __81__AVTUIAvatarPickerMemojiPickerViewControllerAccessibility__axLabelForIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "recordAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTUIAvatarPickerMemojiPickerViewControllerAccessibility;
  v6 = a4;
  -[AVTUIAvatarPickerMemojiPickerViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUIAvatarPickerMemojiPickerViewControllerAccessibility _axMarkupCell:atIndexPath:](self, "_axMarkupCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end
