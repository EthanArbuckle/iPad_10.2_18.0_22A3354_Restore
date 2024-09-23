@implementation CKTokenizationSearchController

+ (BOOL)isVisibleInCollectionView
{
  return CKIsRunningInMacCatalyst() == 0;
}

+ (id)reuseIdentifier
{
  return CFSTR("TokenizationSearchCell");
}

+ (id)sectionIdentifier
{
  return CFSTR("TokenizationSearchSection");
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  return (Class)objc_opt_class();
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  return +[CKTokenizationSearchController reuseIdentifier](CKTokenizationSearchController, "reuseIdentifier", a3);
}

+ (id)supportedCellClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsMenuInteraction
{
  return 0;
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  return 4 * (a3 == 0);
}

+ (unint64_t)recencyRankedTargetResultCount
{
  return 10;
}

- (unint64_t)searchTokenContentType
{
  return 9;
}

- (void)searchWithText:(id)a3 mode:(unint64_t)a4
{
  if (a4)
    -[CKConversationSearchController searchEnded](self, "searchEnded", a3);
  else
    -[CKConversationSearchController searchSpotlightWithText:mode:](self, "searchSpotlightWithText:mode:", a3);
}

- (void)discardSuggestionResults
{
  -[CKSearchController setResults:](self, "setResults:", 0);
}

- (id)tokenizedQueryResultsForItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CKSearchTokenQueryResult *v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  CKSearchTokenQueryResult *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  CKSearchTokenQueryResult *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  CKSearchTokenQueryResult *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  CKSearchTokenQueryResult *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  unint64_t v57;
  uint64_t v58;
  void *v59;
  unint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v60 = -[CKTokenizationSearchController maxResultsForMode:](self, "maxResultsForMode:", -[CKSearchController mode](self, "mode"));
  -[CKTokenizationSearchController _prependTokenClarificationOptionsToResults:](self, "_prependTokenClarificationOptionsToResults:", v5);
  -[CKSearchController currentSearchText](self, "currentSearchText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTokenizationSearchController appropriateCategoryTokensForSearchText:](self, "appropriateCategoryTokensForSearchText:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSearchController currentSearchText](self, "currentSearchText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTokenizationDateParser appropriateDateTokensForSearchText:](CKTokenizationDateParser, "appropriateDateTokensForSearchText:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "count");
  v54 = v9;
  v11 = objc_msgSend(v9, "count");
  -[CKSearchController currentSearchText](self, "currentSearchText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  v55 = v4;
  if (v13)
  {
    v53 = v7;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    if (v15)
    {
      v16 = v15;
      v57 = v60 - v10 - v11;
      v58 = *(_QWORD *)v70;
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v70 != v58)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v17);
        -[CKTokenizationSearchController chatGUIDForSearchableItem:](self, "chatGUIDForSearchableItem:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKSearchController delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "searchController:conversationForChatGUID:", self, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 && (objc_msgSend(v21, "isBlockedByCommunicationLimits") & 1) == 0)
        {
          objc_msgSend(v21, "chat");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "guid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v56, "containsObject:", v23) & 1) == 0
            && -[CKTokenizationSearchController shouldShowConversationTokenSuggestionForConversationGUID:](self, "shouldShowConversationTokenSuggestionForConversationGUID:", v23))
          {
            -[CKTokenizationSearchController _tokenAddressesForSearchableItem:inConversation:](self, "_tokenAddressesForSearchableItem:inConversation:", v18, v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[CKSearchTokenQueryResult initWithContentType:filterOptions:conversation:itemIdentifier:tokenAddresses:]([CKSearchTokenQueryResult alloc], "initWithContentType:filterOptions:conversation:itemIdentifier:tokenAddresses:", 0, 0, v21, v23, v24);
            objc_msgSend(v5, "addObject:", v25);
            objc_msgSend(v56, "addObject:", v23);

          }
        }
        v26 = objc_msgSend(v5, "count");

        if (v26 >= v57)
          break;
        if (v16 == ++v17)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
          if (v16)
            goto LABEL_4;
          break;
        }
      }
    }

    v7 = v53;
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v27 = v7;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v66;
LABEL_19:
    v31 = 0;
    while (1)
    {
      if (*(_QWORD *)v66 != v30)
        objc_enumerationMutation(v27);
      v32 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v31);
      if (objc_msgSend(v5, "count") >= v60)
        break;
      v33 = [CKSearchTokenQueryResult alloc];
      v34 = objc_msgSend(v32, "contentType");
      v35 = objc_msgSend(v32, "filterOptions");
      objc_msgSend(v32, "itemIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "tokenAddresses");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[CKSearchTokenQueryResult initWithContentType:filterOptions:conversation:itemIdentifier:tokenAddresses:](v33, "initWithContentType:filterOptions:conversation:itemIdentifier:tokenAddresses:", v34, v35, 0, v36, v37);

      objc_msgSend(v5, "addObject:", v38);
      if (v29 == ++v31)
      {
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        if (v29)
          goto LABEL_19;
        break;
      }
    }
  }
  v59 = v27;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v39 = v54;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v62;
LABEL_27:
    v43 = 0;
    while (1)
    {
      if (*(_QWORD *)v62 != v42)
        objc_enumerationMutation(v39);
      v44 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v43);
      if (objc_msgSend(v5, "count") >= v60)
        break;
      v45 = [CKSearchTokenQueryResult alloc];
      v46 = objc_msgSend(v44, "contentType");
      v47 = objc_msgSend(v44, "filterOptions");
      objc_msgSend(v44, "itemIdentifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "tokenAddresses");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[CKSearchTokenQueryResult initWithContentType:filterOptions:conversation:itemIdentifier:tokenAddresses:](v45, "initWithContentType:filterOptions:conversation:itemIdentifier:tokenAddresses:", v46, v47, 0, v48, v49);

      objc_msgSend(v5, "addObject:", v50);
      if (v41 == ++v43)
      {
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
        if (v41)
          goto LABEL_27;
        break;
      }
    }
  }

  v51 = (void *)objc_msgSend(v5, "copy");
  return v51;
}

- (void)_prependTokenClarificationOptionsToResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  CKSearchTokenQueryResult *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  CKSearchTokenQueryResult *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKSearchController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchTokenFiltersForSearchController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v8)
  {
    v10 = 0;
    v20 = v7;
    goto LABEL_15;
  }
  v9 = v8;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      if (!objc_msgSend(v14, "contentType", (_QWORD)v27))
      {
        v15 = v14;

        ++v11;
        v10 = v15;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v9);

  if (v11 == 1)
  {
    objc_msgSend(v10, "conversation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isGroupConversation");

    if ((v17 & 1) == 0 && (objc_msgSend(v10, "hasFilterOption:", 2) & 1) == 0)
    {
      objc_msgSend(v10, "conversation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "chat");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "guid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = [CKSearchTokenQueryResult alloc];
      v22 = objc_msgSend(v10, "contentType");
      v23 = objc_msgSend(v10, "filterOptions");
      objc_msgSend(v10, "conversation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tokenAddresses");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[CKSearchTokenQueryResult initWithContentType:filterOptions:conversation:itemIdentifier:tokenAddresses:](v21, "initWithContentType:filterOptions:conversation:itemIdentifier:tokenAddresses:", v22, v23, v24, v20, v25);

      -[CKSearchTokenQueryResult addFilterOption:](v26, "addFilterOption:", 2);
      -[CKSearchTokenQueryResult setAssociatedStagedFilter:](v26, "setAssociatedStagedFilter:", v10);
      objc_msgSend(v4, "insertObject:atIndex:", v26, 0);

LABEL_15:
    }
  }

}

- (id)_tokenAddressesForSearchableItem:(id)a3 inConversation:(id)a4
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isGroupConversation") & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else if (objc_msgSend(v6, "isBusinessConversation"))
  {
    objc_msgSend(v6, "businessHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "attributeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recipientAddresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchCNContactForHandleWithID:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKSpotlightQueryUtilities tokenAddressesForFilteringWithContact:](CKSpotlightQueryUtilities, "tokenAddressesForFilteringWithContact:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
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

- (id)customLayoutSectionForEnvironment:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CKSearchController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v5, "shouldInsetResultsForSearchController:", self);

  if ((_DWORD)self)
    v6 = 0;
  else
    v6 = 4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA400]), "initWithAppearance:", v6);
  objc_msgSend(v7, "setShowsSeparators:", 1);
  objc_msgSend(v7, "setItemSeparatorHandler:", &__block_literal_global_157);
  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithListConfiguration:layoutEnvironment:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __68__CKTokenizationSearchController_customLayoutSectionForEnvironment___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  double v5;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchSuggestionsSeparatorLeadingInset");
  objc_msgSend(v3, "setTopSeparatorInsets:", 0.0, v5, 0.0, 0.0);

  objc_msgSend(v3, "setTopSeparatorVisibility:", 1);
  objc_msgSend(v3, "setBottomSeparatorVisibility:", 2);
  return v3;
}

- (NSDirectionalEdgeInsets)additionalGroupInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = *MEMORY[0x1E0CEA080];
  v3 = *(double *)(MEMORY[0x1E0CEA080] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEA080] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEA080] + 24);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)interGroupSpacing
{
  return 0.0;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 0;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKTokenizationSearchController;
  -[CKConversationSearchController cellForItemInCollectionView:atIndexPath:withIdentifier:](&v6, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)wantsHeaderSection
{
  return 0;
}

- (id)appropriateCategoryTokensForSearchText:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "searchSafeText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (-[CKTokenizationSearchController _hasCategoryTokenStaged](self, "_hasCategoryTokenStaged"))
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[CKTokenizationSearchController searchTokens](self, "searchTokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v12, "itemIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "searchSafeText");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v5 || objc_msgSend(v14, "hasPrefix:", v4))
          {
            if (-[CKTokenizationSearchController shouldShowFilterTokenSuggestion:](self, "shouldShowFilterTokenSuggestion:", v12))
            {
              objc_msgSend(v16, "addObject:", v12);
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    v6 = (void *)objc_msgSend(v16, "copy");
  }

  return v6;
}

- (BOOL)shouldShowFilterTokenSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKSearchController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchTokenFiltersForSearchController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "itemIdentifier", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "itemIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)_hasCategoryTokenStaged
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CKSearchController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchTokenFiltersForSearchController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "contentType", (_QWORD)v11) && objc_msgSend(v9, "contentType") != 8)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)shouldShowConversationTokenSuggestionForConversationGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKSearchController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchTokenFiltersForSearchController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "itemIdentifier", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v14 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

- (NSArray)searchTokens
{
  NSArray *searchTokens;
  CKSearchTokenFilter *v4;
  CKSearchTokenFilter *v5;
  CKSearchTokenFilter *v6;
  void *v7;
  void *v8;
  CKSearchTokenFilter *v9;
  CKSearchTokenFilter *v10;
  void *v11;
  void *v12;
  CKSearchTokenFilter *v13;
  void *v14;
  void *v15;
  CKSearchTokenFilter *v16;
  void *v17;
  void *v18;
  CKSearchTokenFilter *v19;
  NSArray *v20;
  NSArray *v21;
  CKSearchTokenFilter *v23;
  void *v24;
  void *v25;
  id v26;
  CKSearchTokenFilter *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  searchTokens = self->_searchTokens;
  if (!searchTokens)
  {
    v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v4 = [CKSearchTokenFilter alloc];
    CKFrameworkBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("SEARCH_LINK_TOKEN"), &stru_1E276D870, CFSTR("ChatKit"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[CKSearchTokenFilter initWithContentType:itemIdentifier:](v4, "initWithContentType:itemIdentifier:", 2, v28);
    v30[0] = v27;
    v5 = [CKSearchTokenFilter alloc];
    CKFrameworkBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SEARCH_PHOTO_TOKEN"), &stru_1E276D870, CFSTR("ChatKit"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[CKSearchTokenFilter initWithContentType:itemIdentifier:](v5, "initWithContentType:itemIdentifier:", 3, v24);
    v30[1] = v23;
    v6 = [CKSearchTokenFilter alloc];
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SEARCH_LOCATION_TOKEN"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CKSearchTokenFilter initWithContentType:itemIdentifier:](v6, "initWithContentType:itemIdentifier:", 4, v8);
    v30[2] = v9;
    v10 = [CKSearchTokenFilter alloc];
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SEARCH_DOCUMENT_TOKEN"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CKSearchTokenFilter initWithContentType:itemIdentifier:](v10, "initWithContentType:itemIdentifier:", 6, v12);
    v30[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v26, "initWithArray:", v14);

    if (+[CKSpotlightQueryUtilities shouldDisplayWalletSearchController](CKSpotlightQueryUtilities, "shouldDisplayWalletSearchController"))
    {
      v16 = [CKSearchTokenFilter alloc];
      CKFrameworkBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SEARCH_WALLET_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[CKSearchTokenFilter initWithContentType:itemIdentifier:](v16, "initWithContentType:itemIdentifier:", 5, v18);
      objc_msgSend(v15, "addObject:", v19);

    }
    v20 = (NSArray *)objc_msgSend(v15, "copy", v23);
    v21 = self->_searchTokens;
    self->_searchTokens = v20;

    searchTokens = self->_searchTokens;
  }
  return searchTokens;
}

- (BOOL)isTokenizationSearchController
{
  return 1;
}

- (void)setSearchTokens:(id)a3
{
  objc_storeStrong((id *)&self->_searchTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTokens, 0);
}

@end
