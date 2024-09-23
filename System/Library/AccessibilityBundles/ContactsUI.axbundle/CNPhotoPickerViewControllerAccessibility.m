@implementation CNPhotoPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPhotoPickerViewController");
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
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNPhotoPickerViewController"), CFSTR("CNVisualIdentityPickerViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNVisualIdentityPickerViewController"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerDataSource"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerDataSource"), CFSTR("isItemAtIndexPathAddItem:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerDataSource"), CFSTR("providerItemAtIndexPath:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerDataSource"), CFSTR("providerGroupAtIndexPath:"), "@", "@", 0);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  uint64_t *v33;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)CNPhotoPickerViewControllerAccessibility;
  -[CNPhotoPickerViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v34, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CNPhotoPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    LOBYTE(v24) = 0;
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __82__CNPhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
    v30 = &unk_2501D80C8;
    v33 = &v21;
    v11 = v10;
    v31 = v11;
    v12 = v7;
    v32 = v12;
    AXPerformSafeBlock();
    v16 = *((unsigned __int8 *)v22 + 24);

    _Block_object_dispose(&v21, 8);
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__2;
    v25 = __Block_byref_object_dispose__2;
    v26 = 0;
    v19 = v11;
    v20 = v12;
    AXPerformSafeBlock();
    v13 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__2;
    v25 = __Block_byref_object_dispose__2;
    v26 = 0;
    v17 = v19;
    v18 = v20;
    AXPerformSafeBlock();
    v14 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
    objc_msgSend(v9, "_axSetIsAddItem:", v16 != 0);
    objc_msgSend(v9, "_axSetProviderItem:", v13);
    objc_msgSend(v9, "_axSetProviderGroup:", v14);

  }
  return v8;
}

uint64_t __82__CNPhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isItemAtIndexPathAddItem:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __82__CNPhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_197(uint64_t a1)
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

void __82__CNPhotoPickerViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "providerGroupAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
