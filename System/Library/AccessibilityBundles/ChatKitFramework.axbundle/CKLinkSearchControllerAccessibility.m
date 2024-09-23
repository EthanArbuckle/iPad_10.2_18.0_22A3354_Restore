@implementation CKLinkSearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKLinkSearchController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKLinkSearchController"), CFSTR("CKSearchController"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKSearchController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSearchController"), CFSTR("results"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSearchController"), CFSTR("cellForItemInCollectionView:atIndexPath:withIdentifier:"), "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKSpotlightQueryResultUtilities"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKSpotlightQueryResultUtilities"), CFSTR("contactForResult:"), "@", "@", 0);

}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CKLinkSearchControllerAccessibility;
  -[CKLinkSearchControllerAccessibility cellForItemInCollectionView:atIndexPath:withIdentifier:](&v26, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[CKLinkSearchControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("results"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "row");
    if (v14 < objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__6;
      v24 = __Block_byref_object_dispose__6;
      v25 = 0;
      v18 = MEMORY[0x24BDAC760];
      v19 = v15;
      AXPerformSafeBlock();
      v16 = (id)v21[5];

      _Block_object_dispose(&v20, 8);
      objc_msgSend(v12, "_axSetContact:", v16, v18, 3221225472, __94__CKLinkSearchControllerAccessibility_cellForItemInCollectionView_atIndexPath_withIdentifier___block_invoke, &unk_2501B1B28);

    }
  }

  return v11;
}

void __94__CKLinkSearchControllerAccessibility_cellForItemInCollectionView_atIndexPath_withIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[objc_class contactForResult:](NSClassFromString(CFSTR("CKSpotlightQueryResultUtilities")), "contactForResult:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
