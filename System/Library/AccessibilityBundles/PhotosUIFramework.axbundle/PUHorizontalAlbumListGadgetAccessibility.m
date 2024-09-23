@implementation PUHorizontalAlbumListGadgetAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUHorizontalAlbumListGadget");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUHorizontalAlbumListGadget"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUHorizontalAlbumListGadget"), CFSTR("PXHorizontalCollectionGadget"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXHorizontalCollectionGadget"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUHorizontalAlbumListGadget"), CFSTR("provider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumsGadgetProvider"), CFSTR("gadgetForIndexPath:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumGadget"), CFSTR("collection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGadgetUICollectionViewCell"), CFSTR("gadgetContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXGadgetUICollectionViewCell"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)PUHorizontalAlbumListGadgetAccessibility;
  -[PUHorizontalAlbumListGadgetAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  v16 = 0;
  objc_opt_class();
  -[PUHorizontalAlbumListGadgetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "indexPathsForVisibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "cellForItemAtIndexPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUHorizontalAlbumListGadgetAccessibility _axAddCustomContentTypeToCell:inCollectionView:atIndexPath:](self, "_axAddCustomContentTypeToCell:inCollectionView:atIndexPath:", v11, v4, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

}

- (void)_axAddCustomContentTypeToCell:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v8 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  v9 = a5;
  AXPerformSafeBlock();
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  objc_msgSend(v10, "safeValueForKey:", CFSTR("collection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("PXGadgetUICollectionViewCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LOBYTE(v16) = 0;
    objc_opt_class();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("gadgetContentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsSafeCategory();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)v16)
      abort();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v11, "assetCollectionSubtype") - 202;
      if (v14 < 0xA)
      {
        v15 = off_24FF153C0[v14];
LABEL_11:
        objc_msgSend(v13, "_axSetCellCustomContentType:", v15);

        goto LABEL_12;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v11, "collectionListType") == 2)
          v15 = CFSTR("AXAlbumContentTypeFolder");
        else
          v15 = 0;
        goto LABEL_11;
      }
    }
    v15 = 0;
    goto LABEL_11;
  }
LABEL_12:

}

void __103__PUHorizontalAlbumListGadgetAccessibility__axAddCustomContentTypeToCell_inCollectionView_atIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("provider"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gadgetForIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUHorizontalAlbumListGadgetAccessibility;
  v6 = a4;
  v7 = a3;
  -[PUHorizontalAlbumListGadgetAccessibility collectionView:cellForItemAtIndexPath:](&v10, sel_collectionView_cellForItemAtIndexPath_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHorizontalAlbumListGadgetAccessibility _axAddCustomContentTypeToCell:inCollectionView:atIndexPath:](self, "_axAddCustomContentTypeToCell:inCollectionView:atIndexPath:", v8, v7, v6, v10.receiver, v10.super_class);

  return v8;
}

@end
