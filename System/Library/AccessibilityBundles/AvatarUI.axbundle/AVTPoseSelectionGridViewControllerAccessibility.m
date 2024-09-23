@implementation AVTPoseSelectionGridViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTPoseSelectionGridViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPoseSelectionGridViewController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPoseSelectionGridViewController"), CFSTR("configurationForIndex:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPoseSelectionGridViewController"), CFSTR("poseCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPoseSelectionGridViewController"), CFSTR("cameraCellView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTPoseSelectionGridViewController"), CFSTR("avatarRecord"), "@", 0);

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
  v17.super_class = (Class)AVTPoseSelectionGridViewControllerAccessibility;
  -[AVTPoseSelectionGridViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  v16 = 0;
  objc_opt_class();
  -[AVTPoseSelectionGridViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("poseCollectionView"));
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
        -[AVTPoseSelectionGridViewControllerAccessibility _axMarkupCell:atIndexPath:](self, "_axMarkupCell:atIndexPath:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTPoseSelectionGridViewControllerAccessibility;
  v6 = a4;
  -[AVTPoseSelectionGridViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionGridViewControllerAccessibility _axMarkupCell:atIndexPath:](self, "_axMarkupCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

- (id)_axGetCachedAvatarRecord
{
  JUMPOUT(0x234907670);
}

- (void)_axSetCachedAvatarRecord:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axGetCachedAvatarDescription
{
  JUMPOUT(0x234907670);
}

- (void)_axSetCachedAvatarDescription:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_axMarkupCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20[2];
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25[6];
  id v26;
  id *v27;
  id location;
  id *p_location;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  v8 = objc_msgSend(v6, "accessibilityTraits");
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v8);
  -[AVTPoseSelectionGridViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cameraCellView"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9 && (v10 = (void *)v9, v11 = objc_msgSend(v7, "item"), v10, v11))
  {
    location = 0;
    p_location = &location;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v33 = 0;
    v12 = MEMORY[0x24BDAC760];
    v25[1] = (id)MEMORY[0x24BDAC760];
    v25[2] = (id)3221225472;
    v25[3] = __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke;
    v25[4] = &unk_2501820A0;
    v27 = &location;
    v25[5] = self;
    v26 = v7;
    AXPerformSafeBlock();
    v13 = p_location[5];

    _Block_object_dispose(&location, 8);
    objc_initWeak(&location, self);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_2;
    v23[3] = &unk_250182050;
    objc_copyWeak(v25, &location);
    v14 = v13;
    v24 = v14;
    objc_msgSend(v6, "_setAccessibilityLabelBlock:", v23);
    v15 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(v14, "localizedName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "axArrayByIgnoringNilElementsWithCount:", 1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityUserInputLabels:", v17);

    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_3;
    v21[3] = &unk_250182168;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v6, "_setAccessibilityCustomContentBlock:", v21);
    objc_destroyWeak(&v22);

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(v6, "_setAccessibilityLabelBlock:", &__block_literal_global_1);
    v18 = (void *)objc_msgSend(v6, "accessibilityTraits");
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_5;
    v19[3] = &unk_2501822D8;
    objc_copyWeak(v20, &location);
    v20[1] = v18;
    objc_msgSend(v6, "_setAccessibilityTraitsBlock:", v19);
    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }

}

void __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "configurationForIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("avatarRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_axGetCachedAvatarDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_axGetCachedAvatarRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v3);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForAvatarWithRecord:includeVideoPrefix:", v3, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_axSetCachedAvatarRecord:", v3);
    objc_msgSend(WeakRetained, "_axSetCachedAvatarDescription:", v7);
    v4 = (void *)v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_3(uint64_t a1)
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

id __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_4()
{
  return accessibilityLocalizedString(CFSTR("custom.pose"));
}

uint64_t __77__AVTPoseSelectionGridViewControllerAccessibility__axMarkupCell_atIndexPath___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("selectedStickerConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 40);
  if (v3)
    v5 = v4 & ~*MEMORY[0x24BDF7400];
  else
    v5 = *MEMORY[0x24BDF7400] | v4;

  return v5;
}

@end
