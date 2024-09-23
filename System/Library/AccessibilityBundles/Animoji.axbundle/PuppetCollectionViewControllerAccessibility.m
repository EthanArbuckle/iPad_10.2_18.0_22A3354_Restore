@implementation PuppetCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PuppetCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PuppetCollectionViewController"), CFSTR("_puppetCollectionView"), "UICollectionView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PuppetCollectionViewController"), CFSTR("numberOfPrecedingCells"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PuppetCollectionViewController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PuppetCollectionViewController"), CFSTR("avatarDataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PuppetCollectionViewController"), CFSTR("recordIndexForIndexPath:"), "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarRecordDataSource"), CFSTR("recordAtIndex:"), "@", "Q", 0);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  PuppetCollectionViewControllerAccessibility *v26;
  id v27;
  uint64_t *v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PuppetCollectionViewControllerAccessibility;
  -[PuppetCollectionViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v29, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v9 = objc_msgSend(v7, "row");
  if (v9 >= -[PuppetCollectionViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("numberOfPrecedingCells")))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v11 = MEMORY[0x24BDAC760];
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __85__PuppetCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
    v25 = &unk_25014D158;
    v28 = &v16;
    v26 = self;
    v27 = v7;
    AXPerformSafeBlock();
    v12 = v17[3];

    _Block_object_dispose(&v16, 8);
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v21 = 0;
    v15 = v11;
    AXPerformSafeBlock();
    v13 = (id)v17[5];
    _Block_object_dispose(&v16, 8);

    objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForAvatarWithRecord:includeVideoPrefix:", v13, 0, v15, 3221225472, __85__PuppetCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_202, &unk_25014D180, self, &v16, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityJellyfishLocalizedString(CFSTR("starfish.add"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "setAccessibilityLabel:", v10);

  return v8;
}

uint64_t __85__PuppetCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "recordIndexForIndexPath:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __85__PuppetCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_202(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("avatarDataSource"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
