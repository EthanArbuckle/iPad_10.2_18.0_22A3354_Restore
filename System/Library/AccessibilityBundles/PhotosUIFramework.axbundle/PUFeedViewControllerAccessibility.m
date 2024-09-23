@implementation PUFeedViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUFeedViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PUFeedImageCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedViewController"), CFSTR("_currentCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedViewController"), CFSTR("_configureImageCell: forAssetAtIndexPath: inCollectionView:"), "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedViewController"), CFSTR("collectionView: viewForSupplementaryElementOfKind: atIndexPath:"), "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedViewController"), CFSTR("_sectionInfoForSection: collectionView:"), "@", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXFeedSectionInfo"), CFSTR("assetForItemAtIndex:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXFeedSectionInfo"), CFSTR("hasMultipleAssetsForItemAtIndex:"), "B", "q", 0);

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
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)PUFeedViewControllerAccessibility;
  -[PUFeedViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v16, sel__accessibilityLoadAccessibilityInformation);
  v15 = 0;
  objc_opt_class();
  -[PUFeedViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentCollectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "indexPathsForVisibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = v4;
        AXPerformSafeBlock();

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v7);
  }

}

void __79__PUFeedViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1[4], "_sectionInfoForSection:collectionView:", objc_msgSend(a1[5], "section"), a1[6]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetForItemAtIndex:", objc_msgSend(a1[5], "item"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "cellForItemAtIndexPath:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PUFeedImageCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXAsset"));

}

- (void)_configureImageCell:(id)a3 forAssetAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PUFeedViewControllerAccessibility;
  -[PUFeedViewControllerAccessibility _configureImageCell:forAssetAtIndexPath:inCollectionView:](&v16, sel__configureImageCell_forAssetAtIndexPath_inCollectionView_, v8, v9, v10);
  v14 = v9;
  v15 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  AXPerformSafeBlock();

}

void __94__PUFeedViewControllerAccessibility__configureImageCell_forAssetAtIndexPath_inCollectionView___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoForSection:collectionView:", objc_msgSend(*(id *)(a1 + 40), "section"), *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetForItemAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXAsset"));

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  int v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PUFeedViewControllerAccessibility;
  -[PUFeedViewControllerAccessibility collectionView:viewForSupplementaryElementOfKind:atIndexPath:](&v28, sel_collectionView_viewForSupplementaryElementOfKind_atIndexPath_, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PUFeedImageCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    v27 = 0;
    v20 = v10;
    v21 = v8;
    AXPerformSafeBlock();
    v12 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    LOBYTE(v25) = 0;
    v13 = v12;
    v14 = v20;
    AXPerformSafeBlock();
    v15 = *((unsigned __int8 *)v23 + 24);

    _Block_object_dispose(&v22, 8);
    if (!v15)
    {
      v17 = v13;
      v18 = v14;
      v19 = v11;
      AXPerformSafeBlock();

    }
  }

  return v11;
}

void __98__PUFeedViewControllerAccessibility_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoForSection:collectionView:", objc_msgSend(*(id *)(a1 + 40), "section"), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __98__PUFeedViewControllerAccessibility_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasMultipleAssetsForItemAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __98__PUFeedViewControllerAccessibility_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke_3(id *a1)
{
  id v2;

  objc_msgSend(a1[4], "assetForItemAtIndex:", objc_msgSend(a1[5], "item"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXAsset"));

}

@end
