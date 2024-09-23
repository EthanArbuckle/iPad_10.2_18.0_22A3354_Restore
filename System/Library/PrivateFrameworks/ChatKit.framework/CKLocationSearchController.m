@implementation CKLocationSearchController

- (unint64_t)searchTokenContentType
{
  return 4;
}

- (id)fetchAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[15];

  v9[14] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA67C0];
  v9[0] = *MEMORY[0x1E0CA67D8];
  v9[1] = v2;
  v3 = *MEMORY[0x1E0CA6018];
  v9[2] = *MEMORY[0x1E0CA6048];
  v9[3] = v3;
  v4 = *MEMORY[0x1E0CA6458];
  v9[4] = *MEMORY[0x1E0CA60D0];
  v9[5] = v4;
  v5 = *MEMORY[0x1E0CA68B8];
  v9[6] = *MEMORY[0x1E0CA6470];
  v9[7] = v5;
  v6 = *MEMORY[0x1E0CA6970];
  v9[8] = *MEMORY[0x1E0CA6108];
  v9[9] = v6;
  v7 = *MEMORY[0x1E0CA5F30];
  v9[10] = *MEMORY[0x1E0CA6510];
  v9[11] = v7;
  v9[12] = *MEMORY[0x1E0CA63E0];
  v9[13] = CFSTR("com_apple_mobilesms_lpPluginPaths");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 14);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)queryAttributesForText:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length"))
  {
    v3 = *MEMORY[0x1E0CA6930];
    v11[0] = *MEMORY[0x1E0CA6910];
    v11[1] = v3;
    v4 = *MEMORY[0x1E0CA6118];
    v11[2] = *MEMORY[0x1E0CA6088];
    v11[3] = v4;
    v5 = *MEMORY[0x1E0CA6048];
    v11[4] = *MEMORY[0x1E0CA66E8];
    v11[5] = v5;
    v11[6] = *MEMORY[0x1E0CA67D8];
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = v11;
    v8 = 7;
  }
  else
  {
    v10 = *MEMORY[0x1E0CA6910];
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = &v10;
    v8 = 1;
  }
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sectionTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_LOCATIONS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sectionIdentifier
{
  return CFSTR("LocationSearchSection");
}

- (id)reuseIdentifierForIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  __objc2_class **v8;
  void *v9;

  -[CKSearchController results](self, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSpotlightQueryResultUtilities indexDomainForResult:](CKSpotlightQueryResultUtilities, "indexDomainForResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("attachmentDomain"));
  v8 = off_1E27333D8;
  if (!v7)
    v8 = off_1E27333A0;
  -[__objc2_class reuseIdentifier](*v8, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)indexingString
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("LOCATIONS_INDEXING_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)supportedCellClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)interGroupSpacing
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchLocationsInterItemSpacing");
  v4 = v3 * 0.5;

  return v4;
}

- (id)filterQueries
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6488], CFSTR("loc"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  v17 = __Block_byref_object_copy__21;
  v18 = __Block_byref_object_dispose__21;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__CKLocationSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  v13[3] = &unk_1E274B9A0;
  v13[4] = &v14;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
  v24 = v15[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __63__CKLocationSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

- (id)chatGUIDForSearchableItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domainIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CKLocationSearchController **v15;
  void *v16;
  CKLocationSearchController *v18;
  CKLocationSearchController *v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CKSearchController results](self, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKSpotlightQueryResultUtilities indexDomainForItem:](CKSpotlightQueryResultUtilities, "indexDomainForItem:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("attachmentDomain")))
  {
    v19 = self;
    v15 = &v19;
  }
  else
  {
    v18 = self;
    v15 = &v18;
  }
  v15[1] = (CKLocationSearchController *)CKLocationSearchController;
  objc_msgSendSuper2((objc_super *)v15, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, v10, v9, v8, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
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
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SEE_ALL_LOCATIONS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
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
    objc_msgSend(v15, "setParentContentType:", 1);

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

- (id)layoutGroupWithEnvironment:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
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
  uint64_t v33;
  double v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = 0.0;
  -[CKLocationSearchController fractionalWidth:count:forLayoutWidth:](self, "fractionalWidth:count:forLayoutWidth:", &v34, &v33, -[CKSearchController layoutWidth](self, "layoutWidth", a3));
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", v34);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CEA1C0];
  v6 = v34;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchLinksFractionalHeightScale");
  objc_msgSend(v5, "fractionalWidthDimension:", v6 * v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSearchController suppressAvatars](self, "suppressAvatars"))
  {
    objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CEA1C0];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchResultAvatarSize");
    objc_msgSend(v12, "absoluteDimension:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v14, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    if (v16 == 1)
      v17 = 3;
    else
      v17 = 9;
    v18 = -8.0;
    if (v16 == 1)
      v18 = 8.0;
    objc_msgSend(MEMORY[0x1E0CEA1A8], "layoutAnchorWithEdges:absoluteOffset:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CEA200];
    +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v15, v21, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0CEA1E0];
    v35[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "itemWithLayoutSize:supplementaryItems:", v10, v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v25 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sizeWithWidthDimension:heightDimension:", v26, v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1D0], "horizontalGroupWithLayoutSize:subitem:count:", v27, v11, v33);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0CEA1F8];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "searchLocationsInterItemSpacing");
  objc_msgSend(v29, "fixedSpacing:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setInterItemSpacing:", v31);

  return v28;
}

- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5
{
  objc_super v9;

  if (CKIsRunningInMacCatalyst())
  {
    if (a3)
      *a3 = 0.5;
    if (a4)
      *a4 = 2;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKLocationSearchController;
    -[CKMessageTypeSearchController fractionalWidth:count:forLayoutWidth:](&v9, sel_fractionalWidth_count_forLayoutWidth_, a3, a4, a5);
  }
}

- (BOOL)shouldStartMenuInteractionForResult:(id)a3
{
  void *v3;
  BOOL v4;

  -[CKLocationSearchController _mapItemForResult:](self, "_mapItemForResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)previewViewControllerForResult:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MUPlaceViewController"), CFSTR("MapsUI"));
  -[CKLocationSearchController _mapItemForResult:](self, "_mapItemForResult:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
    v7 = (void *)objc_msgSend([v5 alloc], "initWithMapItem:", v6);

  return v7;
}

- (id)_activityItemProviderForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CKSearchActivityItemProvider *v18;
  void *v20;

  v4 = a3;
  -[CKSearchController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerTraitCollectionForController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedMapPreviewForQueryResult:traitCollection:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "contentURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__ck_spotlightItemSnippet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0CC1160]);
    objc_msgSend(v13, "setName:", v12);
    IMUTITypeForFilename();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setType:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v8);
    objc_msgSend(v13, "setThumbnail:", v15);
    v16 = v6;
    v17 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
    objc_msgSend(v17, "setSpecialization:", v13);
    v18 = -[CKSearchActivityItemProvider initWithPlaceholderItem:metadata:]([CKSearchActivityItemProvider alloc], "initWithPlaceholderItem:metadata:", v11, v17);

    v6 = v16;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)additionalMenuElementsForResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[CKLocationSearchController _mapItemForResult:](self, "_mapItemForResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("mappin.and.ellipse"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEARCH_OPEN_IN_MAPS"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__CKLocationSearchController_additionalMenuElementsForResult___block_invoke;
    v11[3] = &unk_1E274B178;
    v12 = v3;
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, v4, 0, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __62__CKLocationSearchController_additionalMenuElementsForResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openInMapsWithLaunchOptions:", 0);
}

- (id)_mapItemForResult:(id)a3
{
  id v3;
  objc_class *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t v35;
  void *v37;
  void *v38;
  void *v39;

  v3 = a3;
  v4 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKPlacemark"), CFSTR("MapKit"));
  v5 = MEMORY[0x193FF3C18](CFSTR("MKMapItem"), CFSTR("MapKit"));
  v6 = (objc_class *)v5;
  if (v4 && v5)
  {
    if (_mapItemForResult___pred_CLLocationCoordinate2DMakeCoreLocation != -1)
      dispatch_once(&_mapItemForResult___pred_CLLocationCoordinate2DMakeCoreLocation, &__block_literal_global_51);
    objc_msgSend(v3, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "latitude");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "longitude");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      objc_msgSend(v8, "latitude");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      v14 = v13;

      objc_msgSend(v8, "longitude");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      v17 = v16;

      v18 = _mapItemForResult___CLLocationCoordinate2DMake(v14, v17);
      v20 = (void *)objc_msgSend([v4 alloc], "initWithCoordinate:", v18, v19);
      v21 = (void *)objc_msgSend([v6 alloc], "initWithPlacemark:", v20);
      objc_msgSend(v8, "__ck_spotlightItemSnippet");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Current Location"), &stru_1E276D870, CFSTR("ChatKit"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v22, "isEqualToString:", v24);

      if (v25)
      {
        objc_msgSend(v8, "__ck_itemContentCreationDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "locationRelativeDateFormatter");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "stringFromDate:", v38);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("LOCATION_FOOTER_DETAILS_VIEW"), &stru_1E276D870, CFSTR("ChatKit"));
        v39 = v20;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", v30, v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "userInterfaceLayoutDirection");

        if (v33 == 1)
          v34 = CFSTR("\u200F");
        else
          v34 = CFSTR("\u200E");
        -[__CFString stringByAppendingString:](v34, "stringByAppendingString:", v31);
        v35 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v35;
        v20 = v39;
      }
      objc_msgSend(v21, "setName:", v22);

    }
    else
    {
      _IMWarn();
      v21 = 0;
    }

  }
  else
  {
    _IMWarn();
    v21 = 0;
  }

  return v21;
}

void *__48__CKLocationSearchController__mapItemForResult___block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DMake", CFSTR("CoreLocation"));
  _mapItemForResult___CLLocationCoordinate2DMake = result;
  return result;
}

- (id)urlForQueryResult:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  +[CKSpotlightQueryResultUtilities coordinateForResult:](CKSpotlightQueryResultUtilities, "coordinateForResult:", v3);
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "attributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__ck_spotlightItemSnippet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "__ck_appleMapsURLForCoordinate:coordinateName:", v10, v5, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)handleSelectionForResult:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    -[CKLocationSearchController urlForQueryResult:](self, "urlForQueryResult:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "openURL:withCompletionHandler:", v5, 0);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)itemProviderForSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CKLocationSearchController urlForQueryResult:](self, "urlForQueryResult:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36C8], "__ck_itemProviderForAppleMapsCoordinateURL:vCardURL:", v9, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        v12 = v10;
      else
        _IMWarn();

    }
    else
    {
      _IMWarn();
      v11 = 0;
    }

  }
  else
  {
    _IMWarn();
    v11 = 0;
  }

  return v11;
}

@end
