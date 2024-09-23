@implementation CKSearchController

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (BOOL)isVisibleInCollectionView
{
  return 1;
}

- (void)setQlPreviewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_qlPreviewDataSource, a3);
}

- (id)queryAttributesForText:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)fetchAttributes
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)tokenQueryStringForSearchController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CKSearchController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTokenFiltersForSearchController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (!v8)
      goto LABEL_14;
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "contentType", (_QWORD)v17))
        {
          if (objc_msgSend(v12, "contentType") != 8)
            continue;
          objc_msgSend(v12, "queryStringForDateTypeSearch");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v12, "queryStringForConversationSearch");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        v14 = (void *)v13;
        objc_msgSend(v6, "addObject:", v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v9)
      {
LABEL_14:

        break;
      }
    }
  }
  +[CKSpotlightQueryUtilities queryStringFromSubqueries:combineOperator:](CKSpotlightQueryUtilities, "queryStringFromSubqueries:combineOperator:", v6, 1, (_QWORD)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  return 0;
}

- (BOOL)hasMoreResults
{
  void *v2;
  BOOL v3;

  -[CKSearchController results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)filterQueries
{
  return 0;
}

- (id)zkwFilterQueries
{
  return 0;
}

- (id)detailsFilterQueriesForChatGUIDs:(id)a3
{
  return 0;
}

- (id)rankingQueriesWithText:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)useRecencyRankedSearchForMode:(unint64_t)a3
{
  return 0;
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  return 0;
}

+ (BOOL)supportsMenuInteraction
{
  return 1;
}

+ (BOOL)supportsMacSelection
{
  return 0;
}

+ (BOOL)previewControllerPresentsModally
{
  return 0;
}

- (BOOL)shouldStartMenuInteractionForResult:(id)a3
{
  return 1;
}

+ (unint64_t)recencyRankedTargetResultCount
{
  return 0;
}

- (id)navigationBarTitleSummaryForSearchText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  id v12;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sectionTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEARCH_RESULTS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

    if (v10 == 1)
      v11 = CFSTR("\u200F");
    else
      v11 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v4;
  }

  return v12;
}

+ (id)sectionTitle
{
  return 0;
}

+ (id)sectionIdentifier
{
  return 0;
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  return 0;
}

+ (id)indexingString
{
  return 0;
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  return 0;
}

+ (id)supportedCellClasses
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(a1, "cellClassForMode:", 0);
  if (v2)
  {
    v4[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (double)interGroupSpacing
{
  return 0.0;
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

+ (int64_t)orthogonalScrollingBehavior
{
  return 0;
}

- (BOOL)wantsHeaderSection
{
  BOOL v3;
  void *v4;
  uint64_t v5;

  if (CKIsRunningInMacCatalyst())
    v3 = 1;
  else
    v3 = -[CKSearchController mode](self, "mode") != 2 && -[CKSearchController mode](self, "mode") != 4;
  -[CKSearchController results](self, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5 && v3;
}

- (BOOL)wantsFooterSection
{
  return 0;
}

- (Class)headerOverrideClass
{
  return 0;
}

- (Class)footerClass
{
  return 0;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)customLayoutSectionForEnvironment:(id)a3
{
  return 0;
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  return 0;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v7, "row");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CKSearchController reuseIdentifierForIndex:](self, "reuseIdentifierForIndex:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "reuseIdentifierForMode:", -[CKSearchController mode](self, "mode"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSearchController results](self, "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v9 >= v14)
  {
    v16 = 0;
  }
  else
  {
    -[CKSearchController results](self, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CKSearchController currentSearchText](self, "currentSearchText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureWithQueryResult:searchText:mode:", v16, v17, -[CKSearchController mode](self, "mode"));

  return v12;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5
{
  return 0;
}

- (unint64_t)queryTypeForSearchText:(id)a3
{
  return 0;
}

- (unint64_t)layoutWidth
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  double v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CKSearchController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerWidthForController:", self);
  v5 = v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchCellPreferredWidth");
  v8 = v7;

  if (CKIsRunningInMacCatalyst())
  {
    if (-[CKSearchController mode](self, "mode") == 3 || -[CKSearchController mode](self, "mode") == 4)
      v9 = 2;
    else
      v9 = 1;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAccessibilityPreferredContentSizeCategory");

    v9 = 0;
    if ((v11 & 1) == 0)
    {
      v12 = (uint64_t)(v5 / v8);
      if (v12 >= 2)
      {
        if (v12 == 2)
          v9 = 1;
        else
          v9 = 2;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 134218240;
      v16 = v5;
      v17 = 2048;
      v18 = v9;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "layoutWidth %f %lu", (uint8_t *)&v15, 0x16u);
    }

  }
  return v9;
}

- (void)searchWithText:(id)a3 mode:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a3;
  -[CKSearchController setMode:](self, "setMode:", a4);
  -[CKSearchController cancelCurrentSearch](self, "cancelCurrentSearch");
  v7 = objc_alloc(MEMORY[0x1E0CA6B28]);
  -[CKSearchController _queryStringWithText:](self, "_queryStringWithText:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchController _queryContextWithText:](self, "_queryContextWithText:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithQueryString:context:", v8, v9);

  -[CKSearchController queryFoundItemHandler](self, "queryFoundItemHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFoundItemsHandler:", v11);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__CKSearchController_searchWithText_mode___block_invoke;
  v12[3] = &unk_1E2751998;
  v12[4] = self;
  objc_msgSend(v10, "setCompletionHandler:", v12);
  -[CKSearchController setQuery:](self, "setQuery:", v10);
  -[CKSearchController setCurrentSearchText:](self, "setCurrentSearchText:", v6);

  -[CKSearchController setQueryRunning:](self, "setQueryRunning:", 1);
  objc_msgSend(v10, "start");

}

void __42__CKSearchController_searchWithText_mode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queryCompletionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "queryCompletionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

  }
}

- (void)setQuery:(id)a3
{
  id v5;
  NSString *v6;
  NSString *currentQueryIdentifier;
  id v8;

  v8 = a3;
  -[CKSearchController query](self, "query");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v8)
  {
    objc_storeStrong((id *)&self->_query, a3);
    if (self->_query)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      currentQueryIdentifier = self->_currentQueryIdentifier;
      self->_currentQueryIdentifier = v6;
    }
    else
    {
      currentQueryIdentifier = self->_currentQueryIdentifier;
      self->_currentQueryIdentifier = 0;
    }

  }
}

- (id)_queryStringWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKSearchController queryAttributesForText:](self, "queryAttributesForText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSpotlightQueryUtilities queryStringForSearchString:attributes:matchType:](CKSpotlightQueryUtilities, "queryStringForSearchString:attributes:matchType:", v4, v5, -[CKSearchController queryTypeForSearchText:](self, "queryTypeForSearchText:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_queryContextWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[CKSearchController fetchAttributes](self, "fetchAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchAttributes:", v6);

  -[CKSearchController filterQueries](self, "filterQueries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSearchController mode](self, "mode") == 1)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CKSearchController zkwFilterQueries](self, "zkwFilterQueries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (-[CKSearchController _currentModeIsDetails](self, "_currentModeIsDetails"))
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CKSearchController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[CKSearchController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "searchControllerChatGUIDsForDetailsSearch:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKSearchController detailsFilterQueriesForChatGUIDs:](self, "detailsFilterQueriesForChatGUIDs:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v13);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
LABEL_10:

      v7 = (void *)v9;
    }
  }
  if (!-[CKSearchController isTokenizationSearchController](self, "isTokenizationSearchController"))
  {
    -[CKSearchController tokenQueryStringForSearchController:](self, "tokenQueryStringForSearchController:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");
    if (v7)
    {
      if (v15)
      {
        objc_msgSend(v7, "arrayByAddingObject:", v14);
        v16 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v16;
      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  -[CKSearchController rankingQueriesWithText:](self, "rankingQueriesWithText:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilterQueries:", v7);
  objc_msgSend(v5, "setRankingQueries:", v17);
  if (objc_msgSend((id)objc_opt_class(), "useRecencyRankedSearchForMode:", -[CKSearchController mode](self, "mode")))objc_msgSend(v5, "setMaxCount:", objc_msgSend((id)objc_opt_class(), "recencyRankedTargetResultCount"));
  objc_msgSend(v5, "setBundleIDs:", &unk_1E286F580);

  return v5;
}

- (BOOL)_currentModeIsDetails
{
  return -[CKSearchController mode](self, "mode") == 3 || -[CKSearchController mode](self, "mode") == 4;
}

- (void)cancelCurrentSearch
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[CKSearchController cancelCurrentSearch]";
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
    }

  }
  -[CKSearchController query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[CKSearchController query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFoundItemHandler:", 0);

  -[CKSearchController query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompletionHandler:", 0);

  -[CKSearchController setQuery:](self, "setQuery:", 0);
}

- (void)searchEnded
{
  NSObject *v2;
  id v3;
  int v4;
  id v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4 = 138412546;
      v5 = (id)objc_opt_class();
      v6 = 2080;
      v7 = "-[CKSearchController searchEnded]";
      v3 = v5;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "%@ %s - Implement in subclass", (uint8_t *)&v4, 0x16u);

    }
  }
}

- (BOOL)shouldResetSearchResultsWhenEnded
{
  unint64_t v4;
  unint64_t v5;

  if (CKIsRunningInMacCatalyst())
    return 1;
  v4 = -[CKSearchController mode](self, "mode");
  v5 = -[CKSearchController mode](self, "mode");
  return v4 == 1 || v5 == 0;
}

- (BOOL)shouldIncludeResultsIfFiltered
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSearchTokensEnabled");

  if (v4)
  {
    -[CKSearchController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchTokenFiltersForSearchController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v11 = *(_QWORD *)v19;
        v12 = 1;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v7);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            v15 = objc_msgSend(v14, "contentType", (_QWORD)v18);
            v16 = v15 == -[CKSearchController searchTokenContentType](self, "searchTokenContentType");
            if (objc_msgSend(v14, "contentType"))
              v12 &= objc_msgSend(v14, "contentType") == 8;
            v10 |= v16;
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v9);
      }
      else
      {
        v10 = 0;
        v12 = 1;
      }

      if (-[CKSearchController searchTokenContentType](self, "searchTokenContentType"))
        v12 |= v10;
    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 1;
  }
  return v12 & 1;
}

- (unint64_t)searchTokenContentType
{
  return 9;
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  return 0;
}

- (id)queryResultsForItems:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)menuElementsForResult:(id)a3 atIndexPath:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38[5];
  _QWORD v39[5];
  id v40;
  id location;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v35 = a4;
  -[CKSearchController _overridingMenuElementsForResult:](self, "_overridingMenuElementsForResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("doc.on.doc"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("square.and.arrow.up"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SEARCH_COPY"), &stru_1E276D870, CFSTR("ChatKit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __67__CKSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke;
    v39[3] = &unk_1E274F768;
    v39[4] = self;
    v18 = v11;
    v40 = v18;
    objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v16, v34, 0, v39);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_loadWeakRetained(&location);
    objc_msgSend(v19, "_activityItemProviderForResult:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0CEA2A8];
      CKFrameworkBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SEARCH_SHARE"), &stru_1E276D870, CFSTR("ChatKit"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v17;
      v36[1] = 3221225472;
      v36[2] = __67__CKSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke_2;
      v36[3] = &unk_1E27519C0;
      v37 = v20;
      objc_copyWeak(v38, &location);
      v38[1] = *(id *)&x;
      v38[2] = *(id *)&y;
      v38[3] = *(id *)&width;
      v38[4] = *(id *)&height;
      objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v23, v32, 0, v36);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(v38);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v18, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v43 = v26;
          _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Unable to generate share content for result: %@", buf, 0xCu);

        }
      }
      v24 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v33);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v24)
      objc_msgSend(v27, "addObject:", v24);
    -[CKSearchController _additionalMenuElementsForResult:](self, "_additionalMenuElementsForResult:", v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (CKIsRunningInMacCatalyst())
    {
      objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "arrayByAddingObject:", v30);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v29, "arrayByAddingObjectsFromArray:", v28);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_destroyWeak(&location);
  }

  return v13;
}

void __67__CKSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemProviderForSearchResult:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setItemProviders:", v3);

  }
}

void __67__CKSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D96D28]);
  v8[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithActivityItems:applicationActivities:", v3, 0);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "searchController:requestsPresentationOfShareController:atRect:", v7, v4, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

- (id)previewViewControllerForResult:(id)a3
{
  return 0;
}

- (id)_additionalMenuElementsForResult:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (id)_overridingMenuElementsForResult:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)itemProviderForSearchResult:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "This should be overridden for this search controller: %@", (uint8_t *)&v8, 0xCu);

    }
  }

  return 0;
}

- (id)_activityItemProviderForResult:(id)a3
{
  return 0;
}

- (BOOL)handleSelectionForResult:(id)a3
{
  return 0;
}

- (BOOL)isTokenizationSearchController
{
  return 0;
}

- (void)removeResult:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKSearchController results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObject:", v4);
  -[CKSearchController setResults:](self, "setResults:", v6);

}

- (CKSearchControllerDelegate)delegate
{
  return (CKSearchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)currentSearchText
{
  return self->_currentSearchText;
}

- (void)setCurrentSearchText:(id)a3
{
  objc_storeStrong((id *)&self->_currentSearchText, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (CSSearchQuery)query
{
  return self->_query;
}

- (NSString)currentQueryIdentifier
{
  return self->_currentQueryIdentifier;
}

- (void)setCurrentQueryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentQueryIdentifier, a3);
}

- (id)queryFoundItemHandler
{
  return self->_queryFoundItemHandler;
}

- (void)setQueryFoundItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)queryCompletionHandler
{
  return self->_queryCompletionHandler;
}

- (void)setQueryCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (unint64_t)queriedResultsCount
{
  return self->_queriedResultsCount;
}

- (void)setQueriedResultsCount:(unint64_t)a3
{
  self->_queriedResultsCount = a3;
}

- (BOOL)suppressAvatars
{
  return self->_suppressAvatars;
}

- (void)setSuppressAvatars:(BOOL)a3
{
  self->_suppressAvatars = a3;
}

- (CKQLPreviewControllerDataSource)qlPreviewDataSource
{
  return self->_qlPreviewDataSource;
}

- (BOOL)queryRunning
{
  return self->_queryRunning;
}

- (void)setQueryRunning:(BOOL)a3
{
  self->_queryRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qlPreviewDataSource, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong(&self->_queryFoundItemHandler, 0);
  objc_storeStrong((id *)&self->_currentQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_currentSearchText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
