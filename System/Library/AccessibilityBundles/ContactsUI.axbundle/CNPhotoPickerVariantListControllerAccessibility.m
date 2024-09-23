@implementation CNPhotoPickerVariantListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPhotoPickerVariantListController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNPhotoPickerVariantListController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerVariantListController"), CFSTR("providerItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerVariantListController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNPhotoPickerVariantListController"), CFSTR("collectionView"), "@");
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerCollectionViewCell"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerVariantListControllerAccessibility;
  -[CNPhotoPickerVariantListControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CNPhotoPickerVariantListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("collection.photos.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNPhotoPickerVariantListControllerAccessibility;
  -[CNPhotoPickerVariantListControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CNPhotoPickerVariantListControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;
  id location;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNPhotoPickerVariantListControllerAccessibility;
  -[CNPhotoPickerVariantListControllerAccessibility collectionView:cellForItemAtIndexPath:](&v18, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490B8B0](CFSTR("CNPhotoPickerCollectionViewCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, v6);
    -[CNPhotoPickerVariantListControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("providerItems"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "axSafeObjectAtIndex:", objc_msgSend(v7, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsSafeCategory();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_axSetIsVariant:", 1);
    objc_msgSend(v11, "_axSetProviderItem:", v10);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __89__CNPhotoPickerVariantListControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
    v13[3] = &unk_2501D80F0;
    objc_copyWeak(&v15, &location);
    v14 = v7;
    objc_msgSend(v11, "_setAccessibilityAdditionalTraitsBlock:", v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

uint64_t __89__CNPhotoPickerVariantListControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v4);
  v6 = (uint64_t *)MEMORY[0x24BDF7400];
  if (!v5)
    v6 = (uint64_t *)MEMORY[0x24BDF73E0];
  v7 = *v6;

  return v7;
}

@end
