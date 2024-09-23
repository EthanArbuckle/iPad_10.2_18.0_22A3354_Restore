@implementation CKHighlightsSearchController

- (unint64_t)searchTokenContentType
{
  return 7;
}

- (id)fetchAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[14];

  v8[13] = *MEMORY[0x1E0C80C00];
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
  v8[10] = *MEMORY[0x1E0CA6488];
  v8[11] = CFSTR("com_apple_mobilesms_lpPluginPaths");
  v8[12] = *MEMORY[0x1E0CA6970];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 13);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)queryAttributesForText:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length"))
  {
    v3 = *MEMORY[0x1E0CA6970];
    v12 = CFSTR("com_apple_mobilesms_lpDescription");
    v13 = v3;
    v4 = *MEMORY[0x1E0CA6048];
    v14 = *MEMORY[0x1E0CA67D8];
    v15 = v4;
    v16 = *MEMORY[0x1E0CA6910];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v12;
    v7 = 5;
  }
  else
  {
    v8 = *MEMORY[0x1E0CA6970];
    v10 = *MEMORY[0x1E0CA6910];
    v11 = v8;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = (const __CFString **)&v10;
    v7 = 2;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v10, v11, v12, v13, v14, v15, v16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filterQueries
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%tu"), 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%tu"), 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSWYAttachmentsEnabled");

  if (v5)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\" || %@ == \"%@\"), *MEMORY[0x1E0CA6488], CFSTR("lnk"), *MEMORY[0x1E0CA6488], CFSTR("at"));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6488], CFSTR("lnk"), v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\" || %@ == \"%@\"), *MEMORY[0x1E0CA6900], v2, *MEMORY[0x1E0CA6900], v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)detailsFilterQueriesForChatGUIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAccountIdentifier == \"%@\" || _kMDItemDomainIdentifier == \"%@\"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__69;
  v17 = __Block_byref_object_dispose__69;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__CKHighlightsSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  v12[3] = &unk_1E274B9A0;
  v12[4] = &v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);
  v23 = v14[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __65__CKHighlightsSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__ck_spotlightItemSnippet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  IMUTITypeForFilename();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = IMUTTypeWantsQuicklook();

  return (char)v4;
}

+ (id)sectionTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_PINS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sectionIdentifier
{
  return CFSTR("HighlightsSearchSection");
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
  +[CKSpotlightQueryResultUtilities indexItemTypeForResult:](CKSpotlightQueryResultUtilities, "indexItemTypeForResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("at"));
  v8 = off_1E2732C30;
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PINS_INDEXING_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)supportedCellClasses
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSWYAttachmentsEnabled");

  v4 = objc_opt_class();
  if (v3)
  {
    v10 = v4;
    v11 = objc_opt_class();
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v10;
    v7 = 2;
  }
  else
  {
    v9 = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v9;
    v7 = 1;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v9, v10, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)interGroupSpacing
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchHighlightsInterItemSpacing");
  v4 = v3;

  return v4;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CKDetailsAttachmentsSearchController *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v49;
  double v50;
  _QWORD v51[2];
  CGRect v52;

  v51[1] = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v50 = 0.0;
  -[CKHighlightsSearchController fractionalWidth:count:forLayoutWidth:](self, "fractionalWidth:count:forLayoutWidth:", &v50, &v49, -[CKSearchController layoutWidth](self, "layoutWidth", a3));
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", v50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSWYAttachmentsEnabled");

  if (v6)
  {
    -[CKSearchController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerWidthForController:", self);
    v9 = v8;

    -[CKSearchController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parentMarginInsetsForSearchController:", self);
    v12 = v11;
    v14 = v13;

    v15 = v9 - (v12 + v14);
    v16 = (double)(v49 - 1);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "searchCollaborationInterItemSpacing");
    v19 = v15 - v16 * v18;

    v20 = v19 / (double)v49;
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setFrame:", 0.0, 0.0, v20, 1.79769313e308);
    v22 = objc_alloc_init(CKDetailsAttachmentsSearchController);
    -[CKDetailsAttachmentsSearchController sizingCell](v22, "sizingCell");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferredLayoutAttributesFittingAttributes:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "frame");
    objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", CGRectGetHeight(v52));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v4, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = v4;
    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v25, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[CKSearchController suppressAvatars](self, "suppressAvatars"))
  {
    objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = (void *)MEMORY[0x1E0CEA1C0];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "searchResultAvatarSize");
    objc_msgSend(v28, "absoluteDimension:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v30, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    if (v32 == 1)
      v33 = 3;
    else
      v33 = 9;
    v34 = -8.0;
    if (v32 == 1)
      v34 = 8.0;
    objc_msgSend(MEMORY[0x1E0CEA1A8], "layoutAnchorWithEdges:absoluteOffset:", v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0CEA200];
    +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v31, v37, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (void *)MEMORY[0x1E0CEA1E0];
    v51[0] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "itemWithLayoutSize:supplementaryItems:", v26, v40);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v41 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sizeWithWidthDimension:heightDimension:", v42, v25);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1D0], "horizontalGroupWithLayoutSize:subitem:count:", v43, v27, v49);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)MEMORY[0x1E0CEA1F8];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "searchHighlightsInterItemSpacing");
  objc_msgSend(v45, "fixedSpacing:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setInterItemSpacing:", v47);

  return v44;
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
    v9.super_class = (Class)CKHighlightsSearchController;
    -[CKMessageTypeSearchController fractionalWidth:count:forLayoutWidth:](&v9, sel_fractionalWidth_count_forLayoutWidth_, a3, a4, a5);
  }
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
  void *v15;
  objc_super v17;
  objc_super v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CKSearchController results](self, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKSpotlightQueryResultUtilities indexItemTypeForItem:](CKSpotlightQueryResultUtilities, "indexItemTypeForItem:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("lnk")))
  {
    v19.receiver = self;
    v19.super_class = (Class)CKHighlightsSearchController;
    -[CKSearchController cellForItemInCollectionView:atIndexPath:withIdentifier:](&v19, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, v8, v9, v10, v17.receiver, v17.super_class);
LABEL_6:
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("at")))
  {
    -[CKSearchController cellForItemInCollectionView:atIndexPath:withIdentifier:](&v17, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, v8, v9, v10, self, CKHighlightsSearchController);
    goto LABEL_6;
  }
  v18.receiver = self;
  v18.super_class = (Class)CKHighlightsSearchController;
  -[CKSearchController cellForItemInCollectionView:atIndexPath:withIdentifier:](&v18, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSuppressAvatars:", -[CKSearchController suppressAvatars](self, "suppressAvatars"));
LABEL_7:

  return v15;
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
  int v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDetailsSearchResultsFooterCell reuseIdentifier](CKDetailsSearchResultsFooterCell, "reuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v13, v14, v9);
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
    goto LABEL_9;
  }
  +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v10, "isEqualToString:", v25);

  if (!v26)
  {
    v15 = 0;
    goto LABEL_11;
  }
  +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSearchAvatarSupplementryView reuseIdentifier](CKSearchAvatarSupplementryView, "reuseIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v27, v28, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v9, "row");
  -[CKSearchController results](self, "results");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v29 < v31)
  {
    -[CKSearchController results](self, "results");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndex:", objc_msgSend(v9, "row"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKSpotlightQueryResultUtilities contactForResult:](CKSpotlightQueryResultUtilities, "contactForResult:", v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContact:", v33);
    objc_msgSend(v15, "setAssociatedResult:", v24);
    objc_msgSend(v15, "setParentContentType:", 2);

LABEL_9:
  }
LABEL_11:

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

- (id)itemProviderForSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  if (v4)
  {
    +[CKSpotlightQueryResultUtilities indexItemTypeForResult:](CKSpotlightQueryResultUtilities, "indexItemTypeForResult:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("lnk")))
    {
      -[CKHighlightsSearchController linksController](self, "linksController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "itemProviderForSearchResult:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Unexpected nil search result when trying to create NSItemProvider for link", v10, 2u);
      }

    }
    v7 = 0;
  }

  return v7;
}

- (id)_activityItemProviderForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[CKSpotlightQueryResultUtilities indexItemTypeForResult:](CKSpotlightQueryResultUtilities, "indexItemTypeForResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSWYAttachmentsEnabled");

  v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("lnk"));
  if (!v7)
  {
    if (!v8)
      goto LABEL_8;
LABEL_6:
    -[CKHighlightsSearchController linksController](self, "linksController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v8)
    goto LABEL_6;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("at")))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  -[CKHighlightsSearchController attachmentsController](self, "attachmentsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = v9;
  objc_msgSend(v9, "_activityItemProviderForResult:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v11;
}

- (BOOL)handleSelectionForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  +[CKSpotlightQueryResultUtilities indexItemTypeForResult:](CKSpotlightQueryResultUtilities, "indexItemTypeForResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSWYAttachmentsEnabled");

  v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("lnk"));
  if (!v7)
  {
    if (!v8)
      goto LABEL_8;
LABEL_6:
    -[CKHighlightsSearchController linksController](self, "linksController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v8)
    goto LABEL_6;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("at")))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  -[CKHighlightsSearchController attachmentsController](self, "attachmentsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = v9;
  v11 = objc_msgSend(v9, "handleSelectionForResult:", v4);

LABEL_9:
  return v11;
}

- (id)createFoundItemsHandler
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__CKHighlightsSearchController_createFoundItemsHandler__block_invoke;
  v4[3] = &unk_1E274DBB0;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __55__CKHighlightsSearchController_createFoundItemsHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  char v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id *location;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = objc_msgSend(WeakRetained, "searchTerminated");

  if ((v6 & 1) == 0)
  {
    location = v4;
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "setGotResults:", 1);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          +[CKSpotlightQueryResultUtilities indexItemTypeForItem:](CKSpotlightQueryResultUtilities, "indexItemTypeForItem:", v14, location);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isEqualToString:", CFSTR("lnk")) & 1) != 0
            || objc_msgSend(v15, "isEqualToString:", CFSTR("at")))
          {
            if (!v11)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v11, "addObject:", v14);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    v16 = objc_loadWeakRetained(location);
    objc_msgSend(v16, "intermediaryResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_loadWeakRetained(location);
      objc_msgSend(v18, "intermediaryResults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v19, "setByAddingObjectsFromArray:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_loadWeakRetained(location);
    objc_msgSend(v21, "setIntermediaryResults:", v20);

  }
}

- (id)_additionalMenuElementsForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[CKSpotlightQueryResultUtilities indexItemTypeForResult:](CKSpotlightQueryResultUtilities, "indexItemTypeForResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("lnk")))
  {
    -[CKHighlightsSearchController linksController](self, "linksController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_additionalMenuElementsForResult:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (void)deleteAttachmentForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35788], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CKHighlightsSearchController_deleteAttachmentForResult___block_invoke;
  v9[3] = &unk_1E274B9F0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "loadMessageItemWithGUID:completionBlock:", v6, v9);

}

void __58__CKHighlightsSearchController_deleteAttachmentForResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "removeResult:", v4);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchControllerContentsDidChange:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteMessageItem:", v5);

}

- (BOOL)shouldStartMenuInteractionForResult:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;

  objc_msgSend(a3, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v5, 0);
    objc_msgSend(v6, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("itunes.apple.com"));

    if (!v8)
      goto LABEL_7;
    objc_msgSend(v6, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("itunes.com"));

    if (!v10)
      goto LABEL_7;
    objc_msgSend(v6, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("itun.es"));

    if (!v12)
      goto LABEL_7;
    objc_msgSend(v6, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("appsto.re"));

    if (v14)
    {
      objc_msgSend(v5, "iCloudSharingURL_noFragment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v15 != 0;
    }
    else
    {
LABEL_7:
      v16 = 1;
    }

  }
  else
  {
    v16 = 0;
  }

  return !v16;
}

- (id)previewViewControllerForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[CKSpotlightQueryResultUtilities indexItemTypeForResult:](CKSpotlightQueryResultUtilities, "indexItemTypeForResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSWYAttachmentsEnabled");

  v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("lnk"));
  if (!v7)
  {
    if (!v8)
      goto LABEL_8;
LABEL_6:
    -[CKHighlightsSearchController linksController](self, "linksController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v8)
    goto LABEL_6;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("at")))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  -[CKHighlightsSearchController attachmentsController](self, "attachmentsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = v9;
  objc_msgSend(v9, "previewViewControllerForResult:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v11;
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[CKSpotlightQueryResultUtilities indexItemTypeForItem:](CKSpotlightQueryResultUtilities, "indexItemTypeForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("at")))
  {
    -[CKHighlightsSearchController attachmentsController](self, "attachmentsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chatGUIDForSearchableItem:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "domainIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)attachmentsController
{
  return objc_alloc_init(CKAttachmentsSearchController);
}

- (id)linksController
{
  return objc_alloc_init(CKLinkSearchController);
}

@end
