@implementation PUAvalancheReviewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUAvalancheReviewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAvalancheReviewController"), CFSTR("_avalancheBeingReviewed"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAvalancheReviewController"), CFSTR("_updateCell: forItemAtIndexPath:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAvalancheReviewController"), CFSTR("_updateMainViewAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAvalancheReviewController"), CFSTR("_collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLAvalanche"), CFSTR("assets"), "@", 0);

}

- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PUAvalancheReviewControllerAccessibility;
  -[PUAvalancheReviewControllerAccessibility _updateCell:forItemAtIndexPath:](&v18, sel__updateCell_forItemAtIndexPath_, v6, v7);
  -[PUAvalancheReviewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_avalancheBeingReviewed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v10 = v8;
  v11 = v7;
  AXPerformSafeBlock();
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("AXAsset"));

}

void __75__PUAvalancheReviewControllerAccessibility__updateCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("assets"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_updateMainViewAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUAvalancheReviewControllerAccessibility;
  -[PUAvalancheReviewControllerAccessibility _updateMainViewAnimated:](&v6, sel__updateMainViewAnimated_, a3);
  -[PUAvalancheReviewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("sharing.collection.list"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

@end
