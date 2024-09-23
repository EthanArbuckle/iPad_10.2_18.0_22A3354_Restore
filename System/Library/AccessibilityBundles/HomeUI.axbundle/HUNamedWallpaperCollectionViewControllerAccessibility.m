@implementation HUNamedWallpaperCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUNamedWallpaperCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUNamedWallpaperCollectionViewController"), CFSTR("collectionView: cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFWallpaper"), CFSTR("assetIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUNamedWallpaperCollectionViewController"), CFSTR("wallpapers"), "@", 0);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUNamedWallpaperCollectionViewControllerAccessibility;
  -[HUNamedWallpaperCollectionViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v17, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  objc_opt_class();
  -[HUNamedWallpaperCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("wallpapers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "item");
  if (v11 < objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "item"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("assetIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityLabelForNamedWallpaper(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v15);

  }
  return v8;
}

@end
