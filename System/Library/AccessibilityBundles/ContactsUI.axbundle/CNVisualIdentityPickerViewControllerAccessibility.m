@implementation CNVisualIdentityPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNVisualIdentityPickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CNVisualIdentityPickerViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNVisualIdentityPickerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNVisualIdentityPickerViewController"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNVisualIdentityPickerViewController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNVisualIdentityPickerViewController"), CFSTR("collectionView"), "@");
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerDataSource"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerDataSource"), CFSTR("isItemAtIndexPathAddItem:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerDataSource"), CFSTR("providerItemAtIndexPath:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerDataSource"), CFSTR("providerGroupAtIndexPath:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerProviderGroup"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNPhotoPickerProviderGroup"), CFSTR("groupType"), "q");
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerCollectionViewCell"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityPickerViewControllerAccessibility;
  -[CNVisualIdentityPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CNVisualIdentityPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("collection.photos.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNVisualIdentityPickerViewControllerAccessibility;
  -[CNVisualIdentityPickerViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CNVisualIdentityPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22[12];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  id location;
  objc_super v40;

  v6 = a3;
  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)CNVisualIdentityPickerViewControllerAccessibility;
  -[CNVisualIdentityPickerViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v40, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490B8B0](CFSTR("CNPhotoPickerCollectionViewCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, v6);
    -[CNVisualIdentityPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy_;
    v37 = __Block_byref_object_dispose_;
    v10 = (void *)MEMORY[0x24BDAC760];
    v38 = 0;
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
    v29 = &unk_2501D80C8;
    v32 = &v33;
    v30 = v9;
    v31 = v7;
    AXPerformSafeBlock();
    v11 = (id)v34[5];

    _Block_object_dispose(&v33, 8);
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    LOBYTE(v36) = 0;
    v22[8] = v10;
    v22[9] = (id)3221225472;
    v22[10] = __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2;
    v22[11] = &unk_2501D80C8;
    v25 = &v33;
    v23 = v30;
    v24 = v31;
    AXPerformSafeBlock();
    v12 = *((unsigned __int8 *)v34 + 24);

    _Block_object_dispose(&v33, 8);
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v22[1] = v10;
    v22[2] = (id)3221225472;
    v22[3] = __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_3;
    v22[4] = &unk_2501D80C8;
    v22[7] = &v33;
    v13 = v23;
    v22[5] = v13;
    v14 = v24;
    v22[6] = v14;
    AXPerformSafeBlock();
    v15 = v34[3];

    _Block_object_dispose(&v33, 8);
    LOBYTE(v33) = 0;
    objc_opt_class();
    __UIAccessibilityCastAsSafeCategory();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_BYTE)v33)
      abort();
    v17 = v16;
    if (v12 && v15 == 2)
    {
      accessibilityLocalizedString(CFSTR("new.memoji.button"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAccessibilityLabel:", v18);
    }
    else
    {
      if (!v12 || v15 != 3)
      {
        objc_msgSend(v16, "setAccessibilityLabel:", 0);
        goto LABEL_11;
      }
      accessibilityLocalizedString(CFSTR("new.emoji.button"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAccessibilityLabel:", v18);
    }

LABEL_11:
    objc_msgSend(v17, "_axSetIsAddItem:", v12 != 0);
    objc_msgSend(v17, "_axSetIsVariant:", 1);
    objc_msgSend(v17, "_axSetProviderItem:", v11);
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_4;
    v20[3] = &unk_2501D80F0;
    objc_copyWeak(v22, &location);
    v21 = v14;
    objc_msgSend(v17, "_setAccessibilityAdditionalTraitsBlock:", v20);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "providerItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isItemAtIndexPathAddItem:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "providerGroupAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("groupType"));

}

uint64_t __91__CNVisualIdentityPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_4(uint64_t a1)
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
