@implementation VideosRelatedStoreItemsCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosRelatedStoreItemsCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosRelatedStoreItemsCollectionViewController"), CFSTR("collectionView: cellForItemAtIndexPath:"), "@", "@", 0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VideosRelatedStoreItemsCollectionViewControllerAccessibility;
  v6 = a4;
  -[VideosRelatedStoreItemsCollectionViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v14, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");

  objc_opt_class();
  -[VideosRelatedStoreItemsCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("relatedItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v7;
  v10 = v9;
  AXPerformSafeBlock();
  v11 = v13;

  return v11;
}

void __102__VideosRelatedStoreItemsCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  objc_msgSend(v3, "safeValueForKey:", CFSTR("artistName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("AXArtistName"));

}

- (id)_createCollectionView
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosRelatedStoreItemsCollectionViewControllerAccessibility;
  -[VideosRelatedStoreItemsCollectionViewControllerAccessibility _createCollectionView](&v4, sel__createCollectionView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("AXRelatedStoreItems"));
  return v2;
}

- (BOOL)_accessibilityDescendantElementAtIndexPathIsValid:(id)a3
{
  return a3 != 0;
}

@end
