@implementation PUPhotosSharingGridCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotosSharingGridCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PUPhotosSharingSelectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotosSharingSelectionView"), CFSTR("_selectedCheckmarkView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotosSharingSelectionView"), CFSTR("_unselectedCheckmarkView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("_visibleSupplementaryViewOfKind:atIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PUCarouselSharingViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("PUAvalancheReviewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCarouselSharingViewController"), CFSTR("mainCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAvalancheReviewController"), CFSTR("_collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUPhotosSharingGridCell"), CFSTR("UICollectionViewCell"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityCustomContent
{
  void *v2;
  void *v3;

  -[PUPhotosSharingGridCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PUPhotosSharingGridCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PUPhotosSharingGridCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUPhotosSharingGridCellAccessibility;
  v3 = -[PUPhotosSharingGridCellAccessibility accessibilityTraits](&v11, sel_accessibilityTraits);
  -[PUPhotosSharingGridCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits") | v3;

  -[PUPhotosSharingGridCellAccessibility _axSharingSelectionView](self, "_axSharingSelectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "safeUIViewForKey:", CFSTR("_selectedCheckmarkView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeUIViewForKey:", CFSTR("_unselectedCheckmarkView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "_accessibilityViewIsVisible")
      && (objc_msgSend(v9, "_accessibilityViewIsVisible") & 1) == 0)
    {
      v5 |= *MEMORY[0x24BDF7400];
    }
    else if (objc_msgSend(v8, "_accessibilityViewIsVisible")
           && (objc_msgSend(v9, "_accessibilityViewIsVisible") & 1) == 0)
    {
      v5 &= ~*MEMORY[0x24BDF7400];
    }

  }
  return v5;
}

- (id)_axSharingSelectionView
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[PUPhotosSharingGridCellAccessibility _axCollectionView](self, "_axCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (NSClassFromString(CFSTR("UICollectionView")), (objc_opt_isKindOfClass() & 1) != 0)
    && (NSClassFromString(CFSTR("UICollectionViewCell")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__7;
    v15 = __Block_byref_object_dispose__7;
    v16 = 0;
    v10 = v2;
    v4 = v3;
    AXPerformSafeBlock();
    v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__7;
    v15 = __Block_byref_object_dispose__7;
    v16 = 0;
    v9 = v10;
    v6 = v5;
    AXPerformSafeBlock();
    v7 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    NSClassFromString(CFSTR("PUPhotosSharingSelectionView"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __63__PUPhotosSharingGridCellAccessibility__axSharingSelectionView__block_invoke(uint64_t a1)
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

void __63__PUPhotosSharingGridCellAccessibility__axSharingSelectionView__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUPhotosSharingSelectionBadgeKind"), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axCollectionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PUPhotosSharingGridCellAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("mainCollectionView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUPhotosSharingGridCellAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_228, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilityViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "safeValueForKey:", CFSTR("_collectionView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

uint64_t __57__PUPhotosSharingGridCellAccessibility__axCollectionView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PUCarouselSharingViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__PUPhotosSharingGridCellAccessibility__axCollectionView__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PUAvalancheReviewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
