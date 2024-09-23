@implementation PUCarouselSharingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUCarouselSharingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCarouselSharingViewController"), CFSTR("mainCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCarouselSharingViewController"), CFSTR("_photoCollectionAtIndex:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCarouselSharingViewController"), CFSTR("_updateCell:forItemAtIndexPath:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCarouselSharingViewController"), CFSTR("_updateMainViewAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCarouselSharingViewController"), CFSTR("assetsInAssetCollection:"), "@", "@", 0);

}

- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PUCarouselSharingViewControllerAccessibility;
  -[PUCarouselSharingViewControllerAccessibility _updateCell:forItemAtIndexPath:](&v21, sel__updateCell_forItemAtIndexPath_, v6, v7);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v14 = v7;
  AXPerformSafeBlock();
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v13 = v8;
  AXPerformSafeBlock();
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v11 = v9;
  v12 = v14;
  AXPerformSafeBlock();
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v10, CFSTR("AXAsset"));

}

void __79__PUCarouselSharingViewControllerAccessibility__updateCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_photoCollectionAtIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __79__PUCarouselSharingViewControllerAccessibility__updateCell_forItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "assetsInAssetCollection:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __79__PUCarouselSharingViewControllerAccessibility__updateCell_forItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_updateMainViewAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUCarouselSharingViewControllerAccessibility;
  -[PUCarouselSharingViewControllerAccessibility _updateMainViewAnimated:](&v7, sel__updateMainViewAnimated_, a3);
  objc_opt_class();
  -[PUCarouselSharingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mainCollectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityPULocalizedString(CFSTR("sharing.collection.list"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("photoSharingCollectionView"));
}

@end
