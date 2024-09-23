@implementation PUAlbumListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUAlbumListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PUAlbumListCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListViewController"), CFSTR("_mainCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListCell"), CFSTR("albumListCellContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListViewController"), CFSTR("collectionView: cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListViewController"), CFSTR("indexPathForPlacesAlbum"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListViewController"), CFSTR("indexPathForPeopleAlbum"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListViewController"), CFSTR("isPlaceholderAtIndexPath:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAlbumListViewController"), CFSTR("collectionAtIndexPath:"), "@", "@", 0);

}

- (void)_axAddCustomContentTypeToCell:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  const __CFString *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  NSClassFromString(CFSTR("PUAlbumListCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("albumListCellContentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsSafeCategory();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAlbumListViewControllerAccessibility indexPathForPeopleAlbum](self, "indexPathForPeopleAlbum");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "isEqual:", v13);

    if ((v14 & 1) != 0)
    {
      v15 = CFSTR("AXAlbumContentTypePeople");
LABEL_17:
      objc_msgSend(v12, "_axSetCellCustomContentType:", v15);

      goto LABEL_18;
    }
    -[PUAlbumListViewControllerAccessibility indexPathForPlacesAlbum](self, "indexPathForPlacesAlbum");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "isEqual:", v16);

    if ((v17 & 1) != 0)
    {
      v15 = CFSTR("AXAlbumContentTypePlaces");
      goto LABEL_17;
    }
    if ((-[PUAlbumListViewControllerAccessibility isPlaceholderAtIndexPath:](self, "isPlaceholderAtIndexPath:", v10) & 1) != 0)
    {
      v15 = 0;
      goto LABEL_17;
    }
    -[PUAlbumListViewControllerAccessibility collectionAtIndexPath:](self, "collectionAtIndexPath:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = objc_msgSend(v18, "assetCollectionSubtype");
      if ((unint64_t)(v19 - 202) < 0xA)
      {
        v15 = off_24FF151E8[v19 - 202];
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v18, "collectionListType") == 2)
          v15 = CFSTR("AXAlbumContentTypeFolder");
        else
          v15 = 0;
        goto LABEL_16;
      }
    }
    v15 = 0;
    goto LABEL_16;
  }
LABEL_18:

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
  v17.super_class = (Class)PUAlbumListViewControllerAccessibility;
  -[PUAlbumListViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  v16 = 0;
  objc_opt_class();
  -[PUAlbumListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mainCollectionView"));
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
        -[PUAlbumListViewControllerAccessibility _axAddCustomContentTypeToCell:inCollectionView:atIndexPath:](self, "_axAddCustomContentTypeToCell:inCollectionView:atIndexPath:", v11, v4, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUAlbumListViewControllerAccessibility;
  v6 = a4;
  v7 = a3;
  -[PUAlbumListViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v10, sel_collectionView_cellForItemAtIndexPath_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewControllerAccessibility _axAddCustomContentTypeToCell:inCollectionView:atIndexPath:](self, "_axAddCustomContentTypeToCell:inCollectionView:atIndexPath:", v8, v7, v6, v10.receiver, v10.super_class);

  return v8;
}

@end
