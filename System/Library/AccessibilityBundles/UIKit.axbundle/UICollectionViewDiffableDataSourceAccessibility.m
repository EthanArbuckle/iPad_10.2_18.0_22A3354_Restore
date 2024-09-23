@implementation UICollectionViewDiffableDataSourceAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionViewDiffableDataSource");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UICollectionViewDiffableDataSource"), CFSTR("_impl"), "__UIDiffableDataSource");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("__UIDiffableDataSource"), CFSTR("itemIdentifierForIndexPath:"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  UICollectionViewDiffableDataSourceAccessibility *v13;
  id v14[2];
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  id v22;
  id v23;
  objc_super v24;
  id v25;
  id v26;
  id location[2];
  UICollectionViewDiffableDataSourceAccessibility *v28;

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v24.receiver = v28;
  v24.super_class = (Class)UICollectionViewDiffableDataSourceAccessibility;
  v25 = -[UICollectionViewDiffableDataSourceAccessibility collectionView:cellForItemAtIndexPath:](&v24, sel_collectionView_cellForItemAtIndexPath_, location[0], v26);
  v23 = (id)-[UICollectionViewDiffableDataSourceAccessibility _accessibilityDiffableDataSourceAnnotator](v28, "_accessibilityDiffableDataSourceAnnotator");
  if (v23)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 838860800;
    v18 = 48;
    v19 = __Block_byref_object_copy__1;
    v20 = __Block_byref_object_dispose__1;
    v21 = 0;
    v8 = MEMORY[0x24BDAC760];
    v9 = -1073741824;
    v10 = 0;
    v11 = __89__UICollectionViewDiffableDataSourceAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
    v12 = &unk_24FF3DAB0;
    v14[1] = &v15;
    v13 = v28;
    v14[0] = v26;
    AXPerformSafeBlock();
    v7 = (id)v16[5];
    objc_storeStrong(v14, 0);
    objc_storeStrong((id *)&v13, 0);
    _Block_object_dispose(&v15, 8);
    objc_storeStrong(&v21, 0);
    v22 = v7;
    (*((void (**)(id, id, id))v23 + 2))(v23, v25, v7);
    objc_storeStrong(&v22, 0);
  }
  v5 = v25;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v5;
}

void __89__UICollectionViewDiffableDataSourceAccessibility_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v5;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_impl"));
  v1 = (id)objc_msgSend(v5, "itemIdentifierForIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

@end
