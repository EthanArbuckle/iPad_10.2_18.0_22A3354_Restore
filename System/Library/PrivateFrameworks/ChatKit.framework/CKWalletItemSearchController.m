@implementation CKWalletItemSearchController

- (unint64_t)searchTokenContentType
{
  return 5;
}

- (id)filterQueries
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6198], CFSTR("attachmentDomain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6488], CFSTR("pa"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sectionTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_WALLET_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sectionIdentifier
{
  return CFSTR("WalletItemSearchSection");
}

+ (id)reuseIdentifier
{
  return +[CKWalletItemLinkSearchResultCell reuseIdentifier](CKWalletItemLinkSearchResultCell, "reuseIdentifier");
}

+ (id)indexingString
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WALLET_ITEMS_INDEXING_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)cellClass
{
  return (Class)objc_opt_class();
}

+ (id)supportedCellClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_msgSend(a1, "cellClass");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  return +[CKWalletItemLinkSearchResultCell reuseIdentifier](CKWalletItemLinkSearchResultCell, "reuseIdentifier", a3);
}

- (id)fetchAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[11];

  v8[10] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA67C0];
  v8[0] = *MEMORY[0x1E0CA67D8];
  v8[1] = v2;
  v3 = *MEMORY[0x1E0CA6018];
  v8[2] = *MEMORY[0x1E0CA6048];
  v8[3] = v3;
  v4 = *MEMORY[0x1E0CA6108];
  v8[4] = *MEMORY[0x1E0CA60D0];
  v8[5] = v4;
  v5 = *MEMORY[0x1E0CA6510];
  v8[6] = *MEMORY[0x1E0CA68B8];
  v8[7] = v5;
  v6 = *MEMORY[0x1E0CA63E0];
  v8[8] = *MEMORY[0x1E0CA5F30];
  v8[9] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)queryAttributesForText:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length"))
  {
    v3 = *MEMORY[0x1E0CA6048];
    v9[0] = *MEMORY[0x1E0CA67D8];
    v9[1] = v3;
    v9[2] = *MEMORY[0x1E0CA6910];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v9;
    v6 = 3;
  }
  else
  {
    v8 = *MEMORY[0x1E0CA6910];
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v8;
    v6 = 1;
  }
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)detailsFilterQueriesForChatGUIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    v8 = *MEMORY[0x1E0CA5F30];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), v8, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__77;
  v18 = __Block_byref_object_dispose__77;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__CKWalletItemSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  v13[3] = &unk_1E274B9A0;
  v13[4] = &v14;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
  v24 = v15[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __65__CKWalletItemSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" || %@"), a2);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v12);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = (void *)v12;
  }
  else
  {
    objc_msgSend(*(id *)(v4 + 40), "stringByAppendingString:", a2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }

}

+ (unint64_t)recencyRankedTargetResultCount
{
  return 10;
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  return 0;
}

+ (BOOL)previewControllerPresentsModally
{
  return 1;
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)interGroupSpacing
{
  return 5.0;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)previewViewControllerForResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v15;

  objc_msgSend(a3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "isEqualToString:", CFSTR("pkpass"));

  if ((_DWORD)v5)
  {
    -[CKWalletItemSearchController _addPassViewControllerForURL:](self, "_addPassViewControllerForURL:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("order"));

    if (!v10)
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _IMWarn();

      v11 = 0;
      goto LABEL_7;
    }
    -[CKWalletItemSearchController _addOrderViewControllerForURL:](self, "_addOrderViewControllerForURL:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v8;
LABEL_7:

  return v11;
}

- (id)_addPassViewControllerForURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x193FF3C18](CFSTR("PKPass"), CFSTR("PassKit"))), "initWithData:error:", v3, 0);
    +[CKPassKitHelper addPassesViewControllerForPass:](CKPassKitHelper, "addPassesViewControllerForPass:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_addOrderViewControllerForURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)getFKOrderImportPreviewControllerProviderClass_softClass_0;
  v18 = getFKOrderImportPreviewControllerProviderClass_softClass_0;
  v5 = MEMORY[0x1E0C809B0];
  if (!getFKOrderImportPreviewControllerProviderClass_softClass_0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getFKOrderImportPreviewControllerProviderClass_block_invoke_0;
    v14[3] = &unk_1E274A178;
    v14[4] = &v15;
    __getFKOrderImportPreviewControllerProviderClass_block_invoke_0((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  v11 = 0;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __62__CKWalletItemSearchController__addOrderViewControllerForURL___block_invoke;
  v12[3] = &unk_1E2755470;
  v13 = 0;
  objc_msgSend(v6, "makeViewControllerWithOrderURL:completion:error:", v3, v12, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v8)
  {
    objc_msgSend(v3, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _IMWarn();

  }
  return v7;
}

void __62__CKWalletItemSearchController__addOrderViewControllerForURL___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "localizedDescription");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    _IMWarn();

  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }
}

- (id)_activityItemProviderForResult:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  CKSearchActivityItemProvider *v19;

  v4 = a3;
  -[CKSearchController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKSearchController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchController:cellForResult:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v8, "previewSnapshot");
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "item");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attributeSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "contentURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "__ck_spotlightItemSnippet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc_init(MEMORY[0x1E0CC1160]);
      objc_msgSend(v15, "setName:", v14);
      IMUTITypeForFilename();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setType:", v16);

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v9);
      objc_msgSend(v15, "setThumbnail:", v17);
      v18 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
      objc_msgSend(v18, "setSpecialization:", v15);
      v19 = -[CKSearchActivityItemProvider initWithPlaceholderItem:metadata:]([CKSearchActivityItemProvider alloc], "initWithPlaceholderItem:metadata:", v13, v18);

      v8 = (void *)v9;
LABEL_7:

      goto LABEL_8;
    }
  }
  v19 = 0;
LABEL_8:

  return v19;
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  double v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v37 = 0.0;
  -[CKMessageTypeSearchController fractionalWidth:count:forLayoutWidth:](self, "fractionalWidth:count:forLayoutWidth:", &v37, &v36, -[CKSearchController layoutWidth](self, "layoutWidth", a3));
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", v37);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessibilityPreferredContentSizeCategory");

  v7 = (void *)MEMORY[0x1E0CEA1C0];
  v8 = v37;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "searchLinksFractionalWidthScale");
  else
    objc_msgSend(v9, "searchLinksFractionalHeightScale");
  objc_msgSend(v7, "fractionalWidthDimension:", v8 * v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSearchController suppressAvatars](self, "suppressAvatars"))
  {
    objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CEA1C0];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "searchResultAvatarSize");
    objc_msgSend(v15, "absoluteDimension:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v17, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    if (v19 == 1)
      v20 = 3;
    else
      v20 = 9;
    v21 = -8.0;
    if (v19 == 1)
      v21 = 8.0;
    objc_msgSend(MEMORY[0x1E0CEA1A8], "layoutAnchorWithEdges:absoluteOffset:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CEA200];
    +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v18, v24, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0CEA1E0];
    v38[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "itemWithLayoutSize:supplementaryItems:", v13, v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v28 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sizeWithWidthDimension:heightDimension:", v29, v12);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1D0], "horizontalGroupWithLayoutSize:subitem:count:", v30, v14, v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0CEA1F8];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "searchLinksInterItemSpacing");
  objc_msgSend(v32, "fixedSpacing:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setInterItemSpacing:", v34);

  return v31;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (v12)
  {
    +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDetailsSearchResultsFooterCell reuseIdentifier](CKDetailsSearchResultsFooterCell, "reuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v13, v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SEE_ALL_LINKS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

    if (v21 == 1)
      v22 = CFSTR("\u200F");
    else
      v22 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setTitle:", v23);
    objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSectionIdentifier:", v24);
    goto LABEL_8;
  }
  +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSearchAvatarSupplementryView reuseIdentifier](CKSearchAvatarSupplementryView, "reuseIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v25, v26, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v8, "row");
  -[CKSearchController results](self, "results");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v27 < v29)
  {
    -[CKSearchController results](self, "results");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v8, "row"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKSpotlightQueryResultUtilities contactForResult:](CKSpotlightQueryResultUtilities, "contactForResult:", v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContact:", v31);
    objc_msgSend(v15, "setAssociatedResult:", v24);
    objc_msgSend(v15, "setParentContentType:", 2);

LABEL_8:
  }

  return v15;
}

- (void)updateSupplementryViewIfNeeded:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v16 = v6;
  v8 = objc_msgSend(v7, "row");
  -[CKSearchController results](self, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 >= v10)
  {
    v12 = 0;
  }
  else
  {
    -[CKSearchController results](self, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "associatedResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if ((v14 & 1) == 0)
    {
      +[CKSpotlightQueryResultUtilities contactForResult:](CKSpotlightQueryResultUtilities, "contactForResult:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContact:", v15);
      objc_msgSend(v16, "setAssociatedResult:", v12);
      objc_msgSend(v16, "setNeedsLayout");

    }
  }

}

@end
