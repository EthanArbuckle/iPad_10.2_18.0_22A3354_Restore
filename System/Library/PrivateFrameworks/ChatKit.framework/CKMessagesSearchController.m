@implementation CKMessagesSearchController

- (unint64_t)searchTokenContentType
{
  return 9;
}

- (id)fetchAttributes
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSearchImprovementsEnabled");

  v4 = *MEMORY[0x1E0CA68D8];
  if (v3)
  {
    v16 = *MEMORY[0x1E0CA6910];
    v17 = v4;
    v5 = *MEMORY[0x1E0CA6048];
    v18 = *MEMORY[0x1E0CA60D0];
    v19 = v5;
    v20 = *MEMORY[0x1E0CA6018];
    v21 = CFSTR("com_apple_mobilesms_mentionedAddresses");
    v6 = *MEMORY[0x1E0CA6488];
    v22 = *MEMORY[0x1E0CA63E0];
    v23 = v6;
    v24 = *MEMORY[0x1E0CA68B8];
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v16;
    v9 = 9;
  }
  else
  {
    v12 = *MEMORY[0x1E0CA6910];
    v13 = v4;
    v10 = *MEMORY[0x1E0CA68B8];
    v14 = *MEMORY[0x1E0CA60D0];
    v15 = v10;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v12;
    v9 = 4;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)queryAttributesForText:(id)a3
{
  uint64_t v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CA68D8];
  v5[0] = *MEMORY[0x1E0CA6910];
  v5[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filterQueries
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ != \"%@\"), *MEMORY[0x1E0CA6488], CFSTR("tpbck"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)searchWithText:(id)a3 mode:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a4 == 1)
  {
    -[CKMessageTypeSearchController searchEnded](self, "searchEnded", a3);
  }
  else
  {
    v7 = v4;
    v8 = v5;
    v6.receiver = self;
    v6.super_class = (Class)CKMessagesSearchController;
    -[CKMessageTypeSearchController searchWithText:mode:](&v6, sel_searchWithText_mode_, a3);
  }
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  objc_super v6;

  if (-[CKSearchController mode](self, "mode") < 2)
    return 3;
  v6.receiver = self;
  v6.super_class = (Class)CKMessagesSearchController;
  return -[CKMessageTypeSearchController maxResultsForMode:](&v6, sel_maxResultsForMode_, a3);
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  return 0;
}

+ (BOOL)supportsMenuInteraction
{
  return 0;
}

+ (id)sectionTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_MESSAGES_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sectionIdentifier
{
  return CFSTR("MessageSearchSection");
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  void *v3;
  int v4;
  __objc2_class **v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSearchImprovementsEnabled");

  v5 = off_1E2733590;
  if (!v4)
    v5 = off_1E2732F98;
  -[__objc2_class reuseIdentifier](*v5, "reuseIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isSearchImprovementsEnabled");

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 0;
}

- (id)customLayoutSectionForEnvironment:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  _BOOL8 v21;
  void *v22;
  int v23;
  uint64_t v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSearchImprovementsEnabled");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 100.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CEA1D0];
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "verticalGroupWithLayoutSize:subitems:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentInsets:", *MEMORY[0x1E0CEA080], *(double *)(MEMORY[0x1E0CEA080] + 8), *(double *)(MEMORY[0x1E0CEA080] + 16), *(double *)(MEMORY[0x1E0CEA080] + 24));

  }
  else
  {
    if (CKIsRunningInMacCatalyst())
    {
      objc_msgSend(v4, "container");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contentSize");
      v18 = v17;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "snapToMinConversationListWidth");
      v21 = v18 >= v20;

    }
    else
    {
      v21 = 1;
    }
    -[CKSearchController delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "shouldInsetResultsForSearchController:", self);

    if (v23)
      v24 = 0;
    else
      v24 = 4;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEACD0]), "initWithAppearanceStyle:layoutEnvironment:", v24, v4);
    objc_msgSend(v7, "setSeparatorStyle:", v21);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEACC8]), "initWithConfiguration:layoutEnvironment:", v7, v4);
  }

  return v15;
}

- (double)interGroupSpacing
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchMessagesInterGroupSpacing");
  v4 = v3;

  return v4;
}

- (NSDirectionalEdgeInsets)additionalGroupInsets
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSDirectionalEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSearchImprovementsEnabled");

  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchMessagesSectionInsets");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    -[CKSearchController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentMarginInsetsForSearchController:", self);
    v7 = v15;
    v11 = v16;

    v13 = 0.0;
    v9 = 0.0;
  }
  if (-[CKSearchController mode](self, "mode") != 1)
  {
    -[CKSearchController results](self, "results");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (!v18)
    {
      v7 = *MEMORY[0x1E0CEA080];
      v9 = *(double *)(MEMORY[0x1E0CEA080] + 8);
      v11 = *(double *)(MEMORY[0x1E0CEA080] + 16);
      v13 = *(double *)(MEMORY[0x1E0CEA080] + 24);
    }
  }
  v19 = v7;
  v20 = v9;
  v21 = v11;
  v22 = v13;
  result.trailing = v22;
  result.bottom = v21;
  result.leading = v20;
  result.top = v19;
  return result;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v8 = (void *)MEMORY[0x1E0D39840];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v12, "isSearchImprovementsEnabled");

  if ((_DWORD)v8)
  {
    -[CKMessagesSearchController _cellForItemInCollectionView:atIndexPath:withIdentifier:](self, "_cellForItemInCollectionView:atIndexPath:withIdentifier:", v11, v10, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CKMessagesSearchController;
    -[CKSearchController cellForItemInCollectionView:atIndexPath:withIdentifier:](&v19, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, v11, v10, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKSearchController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShouldInsetResults:", objc_msgSend(v16, "shouldInsetResultsForSearchController:", self));

    objc_msgSend(v15, "topHairline");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", 0);

    objc_msgSend(v15, "bottomHairline");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 1);

    objc_msgSend(v15, "setDelegate:", self);
    return v15;
  }
}

- (id)_cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  int v38;
  _BOOL4 v39;
  int v40;
  char v41;
  double v42;
  double v43;
  char v44;
  BOOL v45;
  int v46;
  double v47;
  char v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  double v53;
  double v54;
  BOOL v55;
  void *v56;
  int v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  int v62;
  void *v63;
  _BOOL4 v64;
  uint64_t v65;
  void *v66;
  void *v67;
  int v68;
  unint64_t v69;
  _BYTE v70[8];
  double v71;
  double v72;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v7, "row");
  objc_msgSend((id)objc_opt_class(), "reuseIdentifierForMode:", -[CKSearchController mode](self, "mode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSearchController results](self, "results");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v9 >= v13)
  {
    v15 = 0;
  }
  else
  {
    -[CKSearchController results](self, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v11;
    v69 = -[CKSearchController mode](self, "mode");
    v65 = objc_msgSend(v7, "row");
    v17 = objc_msgSend(v7, "row");
    -[CKSearchController results](self, "results");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    v68 = objc_msgSend(v15, "isFromMe");
    v66 = v16;
    v60 = v17;
    v20 = v19;
    if (v9 < 1)
    {
      v23 = 0;
    }
    else
    {
      -[CKSearchController results](self, "results");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndex:", v9 - 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = -[CKMessagesSearchController _shouldGroupResult:withOtherResult:](self, "_shouldGroupResult:withOtherResult:", v15, v22);
    }
    v25 = v9 + 1;
    -[CKSearchController results](self, "results");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v25 >= v27)
    {
      v30 = 1;
    }
    else
    {
      -[CKSearchController results](self, "results");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndex:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = !-[CKMessagesSearchController _shouldGroupResult:withOtherResult:](self, "_shouldGroupResult:withOtherResult:", v15, v29);
    }
    v31 = !v23;
    v67 = v10;
    v64 = v23;
    v62 = v30;
    if ((v68 & 1) != 0)
    {
      v58 = 0;
    }
    else
    {
      objc_msgSend(v15, "conversation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v32, "isGroupConversation");

    }
    v59 = v20 - 1;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "item");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "attributeSet");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "contentCreationDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v33, "isDateInToday:", v36);

    v38 = CKIsRunningInMacCatalyst();
    v39 = v69 == 2;
    if (v38)
      v39 = 0;
    if (v65)
      v40 = v31;
    else
      v40 = 0;
    v41 = v39 & v40;
    v63 = v11;
    v61 = v7;
    if (v69 == 2)
    {
      v42 = 10.0;
      v43 = 4.0;
      if (!v68)
        v43 = 10.0;
      v44 = v58;
      if (v58)
        v42 = 8.0;
      v45 = v64;
      if (!v64)
        v42 = 0.0;
      if (v65)
        v46 = v39 & v40;
      else
        v46 = 1;
      if (v46)
        v47 = 12.0;
      else
        v47 = v42;
      v48 = v62;
      if (v62)
        v49 = 18.0;
      else
        v49 = v43;
      v51 = v59;
      v50 = v60;
    }
    else
    {
      if (v65)
        v47 = 0.0;
      else
        v47 = 4.0;
      v52 = CKIsRunningInMacCatalyst();
      v51 = v59;
      v50 = v60;
      if (v60 == v59)
      {
        v53 = 16.0;
        v54 = 20.0;
      }
      else
      {
        v53 = 12.0;
        v54 = 16.0;
      }
      if (v52)
        v49 = v53;
      else
        v49 = v54;
      v45 = v64;
      v48 = v62;
      v44 = v58;
    }
    v55 = v50 == v51;
    -[CKSearchController currentSearchText](self, "currentSearchText");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v45;
    v70[1] = v65 == 0;
    v70[2] = v55;
    v70[3] = v48;
    v70[4] = v31;
    v70[5] = v44;
    v70[6] = v31 | v37;
    v70[7] = v41;
    v71 = v47;
    v72 = v49;
    objc_msgSend(v66, "configureWithQueryResult:searchText:mode:visibilityContext:", v15, v56, v69, v70);

    v10 = v67;
    v11 = v63;
    v7 = v61;
  }
  else
  {
    -[CKSearchController currentSearchText](self, "currentSearchText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configureWithQueryResult:searchText:mode:", v15, v24, -[CKSearchController mode](self, "mode"));

  }
  return v11;
}

- (BOOL)_shouldGroupResult:(id)a3 withOtherResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "conversation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "guid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", v12))
  {
    objc_msgSend(v5, "item");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attributeSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentCreationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "item");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributeSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentCreationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isDate:inSameDayAsDate:", v15, v18);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (double)widthForDeterminingAvatarVisibility
{
  void *v2;
  double v3;
  double v4;

  -[CKSearchController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widthForDeterminingAvatarVisibility");
  v4 = v3;

  return v4;
}

@end
