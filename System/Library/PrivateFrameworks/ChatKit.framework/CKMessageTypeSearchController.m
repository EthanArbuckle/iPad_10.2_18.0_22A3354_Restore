@implementation CKMessageTypeSearchController

- (unint64_t)searchTokenContentType
{
  return 9;
}

- (id)zkwFilterQueries
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[CKSearchController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchTokenFiltersForSearchController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return MEMORY[0x1E0C9AA60];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = *MEMORY[0x1E0CA63E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ == \"%@\"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)rankingQueriesWithText:(id)a3
{
  void *v4;

  if (-[CKSearchController mode](self, "mode", a3) == 1 || -[CKSearchController mode](self, "mode") == 3)
  {
    objc_msgSend((id)objc_opt_class(), "timeRankedQueries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)timeRankedQueries
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  v3 = 0;
  v4 = *MEMORY[0x1E0CA60D0];
  do
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InRange(%@, $time.now(-%ld), $time.now)"), v4, 60 * qword_18E7C9138[v3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

    ++v3;
  }
  while (v3 != 9);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ >= $time.now"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  return v2;
}

+ (BOOL)useRecencyRankedSearchForMode:(unint64_t)a3
{
  return !a3 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  unint64_t v4;
  unint64_t result;
  void *v6;
  unint64_t v7;

  v4 = -[CKSearchController layoutWidth](self, "layoutWidth");
  result = 0x7FFFFFFFLL;
  switch(a3)
  {
    case 0uLL:
      if (v4)
        result = 6;
      else
        result = 2;
      break;
    case 1uLL:
    case 3uLL:
      if (v4)
      {
        if (v4 == 2 && !CKIsRunningInMacCatalyst())
        {
          result = 6;
        }
        else
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "searchDefaultMaxResults");

          result = v7;
        }
      }
      else
      {
        result = 1;
      }
      break;
    case 2uLL:
    case 4uLL:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (unint64_t)recencyRankedTargetResultCount
{
  return 10;
}

- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5
{
  unint64_t v5;
  double v6;

  if (a5)
  {
    if (a5 == 2)
    {
      v5 = 3;
      v6 = 0.33;
      if (!a3)
        goto LABEL_9;
    }
    else
    {
      v6 = 0.5;
      v5 = 2;
      if (!a3)
        goto LABEL_9;
    }
LABEL_8:
    *a3 = v6;
    goto LABEL_9;
  }
  v6 = 1.0;
  v5 = 1;
  if (a3)
    goto LABEL_8;
LABEL_9:
  if (a4)
    *a4 = v5;
}

- (id)tokenQueryStringForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKSearchController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchTokenFiltersForSearchController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[CKSearchTokenFilter conversationTokensFromTokenFilters:](CKSearchTokenFilter, "conversationTokensFromTokenFilters:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    +[CKSearchTokenFilter queryStringForMessageTypeSearch:](CKSearchTokenFilter, "queryStringForMessageTypeSearch:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v31 = objc_msgSend(v9, "count");
        v32 = 2048;
        v33 = objc_msgSend(v6, "count");
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Found {%ld} conversation tokens from {%ld} total tokens.", buf, 0x16u);
      }

    }
  }
  else
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_11;
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "No conversation search tokens found. Skipping query generation for conversations/people for this search evaluation.", buf, 2u);
    }
  }

LABEL_11:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v16, "contentType", (_QWORD)v25) == 8)
        {
          objc_msgSend(v16, "queryStringForDateTypeSearch");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "filterOptions") & 0x10) != 0)
            v18 = v8;
          else
            v18 = v7;
          objc_msgSend(v18, "addObject:", v17);

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v8, "count"))
  {
    +[CKSpotlightQueryUtilities queryStringFromSubqueries:combineOperator:](CKSpotlightQueryUtilities, "queryStringFromSubqueries:combineOperator:", v8, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v19);

  }
  +[CKSpotlightQueryUtilities queryStringFromSubqueries:combineOperator:](CKSpotlightQueryUtilities, "queryStringFromSubqueries:combineOperator:", v7, 1, (_QWORD)v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "__ck_stringByRedactingQuotedSubstrings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = (uint64_t)v22;
        _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Generated final query: {%@}", buf, 0xCu);
      }

    }
  }

  return v21;
}

- (void)searchWithText:(id)a3 mode:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  -[CKMessageTypeSearchController setTimingCollection:](self, "setTimingCollection:", v7);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-Search"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startTimingForKey:", v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-Query"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startTimingForKey:", v9);

  location = 0;
  objc_initWeak(&location, self);
  -[CKMessageTypeSearchController createFoundItemsHandler](self, "createFoundItemsHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__CKMessageTypeSearchController_searchWithText_mode___block_invoke;
  aBlock[3] = &unk_1E274DFE8;
  objc_copyWeak(&v19, &location);
  v11 = v7;
  v18 = v11;
  v12 = _Block_copy(aBlock);
  -[CKMessageTypeSearchController itemsVerifiedOnDiskCache](self, "itemsVerifiedOnDiskCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)objc_opt_new();
    -[CKMessageTypeSearchController setItemsVerifiedOnDiskCache:](self, "setItemsVerifiedOnDiskCache:", v14);

  }
  -[CKMessageTypeSearchController setSearchTerminated:](self, "setSearchTerminated:", 0);
  -[CKSearchController setQueryFoundItemHandler:](self, "setQueryFoundItemHandler:", v10);
  -[CKSearchController setQueryCompletionHandler:](self, "setQueryCompletionHandler:", v12);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageTypeSearchController setIntermediaryResults:](self, "setIntermediaryResults:", v15);

  -[CKMessageTypeSearchController setResultsToCheck:](self, "setResultsToCheck:", 0);
  -[CKSearchController setResults:](self, "setResults:", 0);
  -[CKMessageTypeSearchController setGotResults:](self, "setGotResults:", 0);
  if (-[CKSearchController shouldIncludeResultsIfFiltered](self, "shouldIncludeResultsIfFiltered"))
  {
    v16.receiver = self;
    v16.super_class = (Class)CKMessageTypeSearchController;
    -[CKSearchController searchWithText:mode:](&v16, sel_searchWithText_mode_, v6, a4);
  }
  else
  {
    -[CKSearchController setResults:](self, "setResults:", 0);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __53__CKMessageTypeSearchController_searchWithText_mode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  char v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_msgSend(WeakRetained, "searchTerminated");

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = objc_loadWeakRetained((id *)(a1 + 40));
        v9 = (id)objc_opt_class();
        v10 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v10, "intermediaryResults");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v9;
        v28 = 2112;
        v29 = v3;
        v30 = 2048;
        v31 = objc_msgSend(v11, "count");
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "%@ Finished searching with error %@. Results count %lu", buf, 0x20u);

      }
    }
    v12 = *(void **)(a1 + 32);
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-Query"), objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopTimingForKey:", v15);

    v16 = objc_loadWeakRetained(v4);
    objc_msgSend(v16, "intermediaryResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_loadWeakRetained(v4);
      objc_msgSend(v18, "intermediaryResults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_73_0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__CKMessageTypeSearchController_searchWithText_mode___block_invoke_2;
    block[3] = &unk_1E274D5D0;
    objc_copyWeak(&v25, v4);
    v24 = v21;
    v22 = v21;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v25);
  }

}

uint64_t __53__CKMessageTypeSearchController_searchWithText_mode___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  objc_msgSend(a3, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentCreationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentCreationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

void __53__CKMessageTypeSearchController_searchWithText_mode___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "queryResultsForItems:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setQueriedResultsCount:", objc_msgSend(*(id *)(a1 + 32), "count"));

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_loadWeakRetained(v2);
      v8 = (id)objc_opt_class();
      v10 = 138412546;
      v11 = v8;
      v12 = 2048;
      v13 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "%@ got %lu query results", (uint8_t *)&v10, 0x16u);

    }
  }
  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "postProcessAndUpdateResults:", v4);

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
  v4[2] = __56__CKMessageTypeSearchController_createFoundItemsHandler__block_invoke;
  v4[3] = &unk_1E274DBB0;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __56__CKMessageTypeSearchController_createFoundItemsHandler__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_msgSend(WeakRetained, "searchTerminated");

  if ((v5 & 1) == 0)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "setGotResults:", 1);

    v7 = objc_loadWeakRetained(v3);
    objc_msgSend(v7, "intermediaryResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_loadWeakRetained(v3);
      objc_msgSend(v9, "intermediaryResults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v10, "setByAddingObjectsFromArray:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_loadWeakRetained(v3);
    objc_msgSend(v12, "setIntermediaryResults:", v11);

  }
}

- (void)searchEnded
{
  id v3;

  -[CKMessageTypeSearchController setSearchTerminated:](self, "setSearchTerminated:", 1);
  -[CKMessageTypeSearchController setGotResults:](self, "setGotResults:", 0);
  -[CKSearchController cancelCurrentSearch](self, "cancelCurrentSearch");
  if (-[CKSearchController shouldResetSearchResultsWhenEnded](self, "shouldResetSearchResultsWhenEnded"))
  {
    -[CKSearchController setResults:](self, "setResults:", MEMORY[0x1E0C9AA60]);
    -[CKSearchController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchControllerContentsDidChange:", self);

  }
}

- (id)queryResultsForItems:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  CKSpotlightQueryResult *v28;
  uint64_t v29;
  CKSpotlightQueryResult *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  os_signpost_id_t spid;
  unint64_t v36;
  unint64_t v37;
  id obj;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CKSearchSignpostLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  CKSearchSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  spid = v6;
  v36 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "queryResultsForItems", ", buf, 2u);
  }

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        -[CKMessageTypeSearchController chatGUIDForSearchableItem:](self, "chatGUIDForSearchableItem:", v14, spid);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15 && objc_msgSend(v15, "length"))
        {
          objc_msgSend(v14, "attributeSet");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "contentURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            if ((objc_msgSend(v41, "containsObject:", v18) & 1) != 0)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v52 = v14;
                  v53 = 2112;
                  v54 = v18;
                  _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "MessageTypeSearch ignoring duplicate result! CSSearchableItem: %@, attachmentURL: %@", buf, 0x16u);
                }

              }
              goto LABEL_23;
            }
            objc_msgSend(v41, "addObject:", v18);
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v14;
              _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "MessageTypeSearch can't check for duplicate attachment because contentURL is nil. CSSearchableItem: %@", buf, 0xCu);
            }

          }
          objc_msgSend(v40, "addObject:", v16);
          objc_msgSend(v9, "addObject:", v14);
LABEL_23:

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v11);
  }

  v37 = -[CKMessageTypeSearchController maxResultsForMode:](self, "maxResultsForMode:", -[CKSearchController mode](self, "mode"));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v9;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v43;
    while (2)
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
        -[CKMessageTypeSearchController chatGUIDForSearchableItem:](self, "chatGUIDForSearchableItem:", v24, spid);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKSearchController delegate](self, "delegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "searchController:conversationForChatGUID:", self, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          if ((objc_msgSend(v27, "isBlockedByCommunicationLimits") & 1) == 0)
          {
            v28 = [CKSpotlightQueryResult alloc];
            objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = -[CKSpotlightQueryResult initWithSearchableItem:inSection:withConversation:](v28, "initWithSearchableItem:inSection:withConversation:", v24, v29, v27);

            objc_msgSend(v39, "addObject:", v30);
            LOBYTE(v29) = objc_msgSend(v39, "count") < v37;

            if ((v29 & 1) == 0)
            {

              goto LABEL_38;
            }
          }
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v21)
        continue;
      break;
    }
  }
LABEL_38:

  CKSearchSignpostLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v36 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v32, OS_SIGNPOST_INTERVAL_END, spid, "queryResultsForItems", ", buf, 2u);
  }

  v33 = (void *)objc_msgSend(v39, "copy");
  return v33;
}

- (void)checkIfResultsExistOnDiskAndNotify:(id)a3
{
  id v4;

  v4 = a3;
  -[CKMessageTypeSearchController setResultsToCheck:](self, "setResultsToCheck:", v4);
  -[CKMessageTypeSearchController _asyncCheckIfResultsExistOnDisk:firstBatch:](self, "_asyncCheckIfResultsExistOnDisk:firstBatch:", v4, 1);

}

- (void)_asyncCheckIfResultsExistOnDisk:(id)a3 firstBatch:(BOOL)a4
{
  unint64_t v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  _QWORD v16[7];
  id v17;
  _QWORD block[4];
  id v19;
  NSObject *v20;
  _QWORD *v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  id location;

  if (a4)
    v5 = 100;
  else
    v5 = 1000;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if (v5 >= v7)
    v8 = v7;
  else
    v8 = v5;
  objc_msgSend(v6, "subarrayWithRange:", 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v10, "removeObjectsInArray:", v9);
  -[CKMessageTypeSearchController setResultsToCheck:](self, "setResultsToCheck:", v10);
  location = 0;
  objc_initWeak(&location, self);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__18;
  v26[4] = __Block_byref_object_dispose__18;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__18;
  v24[4] = __Block_byref_object_dispose__18;
  v25 = 0;
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  dispatch_get_global_queue(2, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke;
  block[3] = &unk_1E274E038;
  v21 = v26;
  v19 = v9;
  v14 = v9;
  objc_copyWeak(&v23, &location);
  v22 = v24;
  v20 = v11;
  v15 = v11;
  dispatch_async(v12, block);

  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke_3;
  v16[3] = &unk_1E274E060;
  v16[4] = self;
  v16[5] = v24;
  objc_copyWeak(&v17, &location);
  v16[6] = v26;
  dispatch_group_notify(v15, MEMORY[0x1E0C80D38], v16);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v23);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
  objc_destroyWeak(&location);

}

void __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke_2;
  v9[3] = &unk_1E274E010;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  objc_msgSend(v2, "__imArrayByFilteringWithBlock:", v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "arrayByApplyingSelector:", sel_identifier);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  objc_destroyWeak(&v10);
}

uint64_t __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "itemsVerifiedOnDiskCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v3, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "fileExistsAtPath:", v13);

    }
    else
    {
      v8 = 1;
    }

  }
  return v8;
}

void __76__CKMessageTypeSearchController__asyncCheckIfResultsExistOnDisk_firstBatch___block_invoke_3(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  _BOOL4 v42;
  id v43;
  id v44;
  void *v45;
  BOOL v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  const __CFString *v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  NSObject *v58;
  id v59;
  id v60;
  id v61;
  const __CFString *v62;
  id v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "itemsVerifiedOnDiskCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
  v3 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "priorQueryIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v5, "currentQueryIdentifier");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66 && !objc_msgSend(v66, "isEqual:", v67))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_loadWeakRetained(v3);
        *(_DWORD *)buf = 138412290;
        v69 = (id)objc_opt_class();
        v15 = v69;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "%@ finished processing results for a stale query, resetting", buf, 0xCu);

      }
    }
    v16 = objc_loadWeakRetained(v3);
    objc_msgSend(v16, "setPriorQueryIdentifier:", 0);
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v6, "setPriorQueryIdentifier:", v67);

    v7 = objc_loadWeakRetained((id *)(a1 + 56));
    v8 = objc_msgSend(v7, "maxResultsForMode:", objc_msgSend(v7, "mode"));

    v9 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v9, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v11, "results");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "count");
    v19 = objc_msgSend(v17, "count");
    if (v8 >= v19)
      v20 = v19;
    else
      v20 = v8;
    objc_msgSend(v17, "subarrayWithRange:", 0, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_loadWeakRetained(v3);
    objc_msgSend(v21, "setResults:", v16);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = objc_loadWeakRetained(v3);
        v24 = (id)objc_opt_class();
        v25 = objc_msgSend(v16, "count");
        v26 = objc_loadWeakRetained(v3);
        objc_msgSend(v26, "priorQueryIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v69 = v24;
        v70 = 2048;
        v71 = v25;
        v72 = 2112;
        v73 = (uint64_t)v27;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "%@ now has %lu results against query identifier %@", buf, 0x20u);

      }
    }
    v28 = objc_loadWeakRetained(v3);
    objc_msgSend(v28, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_loadWeakRetained(v3);
    objc_msgSend(v29, "searchControllerContentsDidChange:", v30);

    v31 = objc_loadWeakRetained(v3);
    objc_msgSend(v31, "timingCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = objc_loadWeakRetained(v3);
      objc_msgSend(v33, "timingCollection");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0CB3940];
      v36 = objc_loadWeakRetained(v3);
      objc_msgSend(v35, "stringWithFormat:", CFSTR("%@-Search"), objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stopTimingForKey:", v37);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = objc_loadWeakRetained(v3);
          objc_msgSend(v39, "timingCollection");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v69 = v40;
          _os_log_impl(&dword_18DFCD000, v38, OS_LOG_TYPE_INFO, "Timing for first batch %@", buf, 0xCu);

        }
      }
      v41 = objc_loadWeakRetained(v3);
      objc_msgSend(v41, "setTimingCollection:", 0);

    }
    v42 = v18 > v8;
    v43 = objc_loadWeakRetained(v3);
    if ((objc_msgSend(v43, "searchTerminated") | v42) == 1)
    {

      goto LABEL_37;
    }
    v44 = objc_loadWeakRetained(v3);
    objc_msgSend(v44, "resultsToCheck");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count") == 0;

    if (v46)
    {
LABEL_37:
      v57 = objc_loadWeakRetained(v3);
      objc_msgSend(v57, "setPriorQueryIdentifier:", 0);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v59 = objc_loadWeakRetained(v3);
          v60 = (id)objc_opt_class();
          v61 = objc_loadWeakRetained(v3);
          if (objc_msgSend(v61, "searchTerminated"))
            v62 = CFSTR("YES");
          else
            v62 = CFSTR("NO");
          v63 = objc_loadWeakRetained(v3);
          objc_msgSend(v63, "resultsToCheck");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "count");
          *(_DWORD *)buf = 138412802;
          v69 = v60;
          v70 = 2112;
          v71 = (uint64_t)v62;
          v72 = 2048;
          v73 = v65;
          _os_log_impl(&dword_18DFCD000, v58, OS_LOG_TYPE_INFO, "%@ Terminating next chunk check, searchTerminated %@ resultsToCheck %lu", buf, 0x20u);

        }
      }
      goto LABEL_44;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = objc_loadWeakRetained(v3);
        v49 = (id)objc_opt_class();
        v50 = objc_loadWeakRetained(v3);
        if (objc_msgSend(v50, "searchTerminated"))
          v51 = CFSTR("YES");
        else
          v51 = CFSTR("NO");
        v52 = objc_loadWeakRetained(v3);
        objc_msgSend(v52, "resultsToCheck");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "count");
        *(_DWORD *)buf = 138412802;
        v69 = v49;
        v70 = 2112;
        v71 = (uint64_t)v51;
        v72 = 2048;
        v73 = v54;
        _os_log_impl(&dword_18DFCD000, v47, OS_LOG_TYPE_INFO, "%@ Kicking next chunk check, searchTerminated %@ resultsToCheck %lu", buf, 0x20u);

      }
    }
    v55 = objc_loadWeakRetained(v3);
    objc_msgSend(v55, "resultsToCheck");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "_asyncCheckIfResultsExistOnDisk:firstBatch:", v56, 0);

  }
LABEL_44:

}

- (id)chatGUIDForSearchableItem:(id)a3
{
  return (id)objc_msgSend(a3, "domainIdentifier");
}

- (BOOL)wantsFooterSection
{
  return -[CKSearchController mode](self, "mode") == 3 && -[CKSearchController hasMoreResults](self, "hasMoreResults");
}

- (Class)footerClass
{
  return (Class)objc_opt_class();
}

- (NSDirectionalEdgeInsets)additionalGroupInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSDirectionalEdgeInsets result;

  -[CKSearchController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentMarginInsetsForSearchController:", self);
  v5 = v4;
  v7 = v6;

  if (-[CKSearchController mode](self, "mode") == 3
    || -[CKSearchController mode](self, "mode") == 4
    || -[CKSearchController mode](self, "mode") == 2)
  {
    v7 = v5;
  }
  else
  {
    v5 = 0.0;
  }
  v8 = 0.0;
  v9 = 0.0;
  v10 = v5;
  v11 = v7;
  result.trailing = v9;
  result.bottom = v11;
  result.leading = v8;
  result.top = v10;
  return result;
}

- (BOOL)wantsDeleteAction
{
  return -[CKSearchController mode](self, "mode") == 3 || -[CKSearchController mode](self, "mode") == 4;
}

- (id)menuElementsForResult:(id)a3 atIndexPath:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[5];
  id v22;
  id v23;
  objc_super v24;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CKMessageTypeSearchController;
  -[CKSearchController menuElementsForResult:atIndexPath:sourceRect:](&v24, sel_menuElementsForResult_atIndexPath_sourceRect_, v11, v12, x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKMessageTypeSearchController wantsDeleteAction](self, "wantsDeleteAction"))
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("trash"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SEARCH_DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __78__CKMessageTypeSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke;
    v21[3] = &unk_1E274E088;
    v21[4] = self;
    v22 = v11;
    v23 = v12;
    objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v17, v14, 0, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setAttributes:", 2);
    objc_msgSend(v13, "arrayByAddingObject:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v19;
  }

  return v13;
}

void __78__CKMessageTypeSearchController_menuElementsForResult_atIndexPath_sourceRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id location;

  v3 = a2;
  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = objc_loadWeakRetained(&location);
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained(&location);
    objc_msgSend(v7, "searchController:requestsItemDeletionAtIndexPath:", v8, *(_QWORD *)(a1 + 48));

  }
  objc_destroyWeak(&location);

}

- (void)deleteAttachmentForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  IMMessageGuidFromIMFileTransferGuid();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35788], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__CKMessageTypeSearchController_deleteAttachmentForResult___block_invoke;
  v11[3] = &unk_1E274E0B0;
  v11[4] = self;
  v12 = v6;
  v13 = v4;
  v9 = v4;
  v10 = v6;
  objc_msgSend(v8, "loadMessageItemWithGUID:completionBlock:", v7, v11);

}

void __59__CKMessageTypeSearchController_deleteAttachmentForResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteChatItemWithTransferGUID:fromMessageItem:", *(_QWORD *)(a1 + 40), v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "removeResult:", *(_QWORD *)(a1 + 48));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromCache:", v7);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchControllerContentsDidChange:", *(_QWORD *)(a1 + 32));

}

- (id)itemProviderForSearchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithContentsOfURL:", v7);
      objc_msgSend(v9, "setSuggestedName:", v8);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Spotlight query result missing expected content URL", v13, 2u);
        }

      }
      v9 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Unexpected nil search result when trying to create NSItemProvider", buf, 2u);
      }

    }
    v9 = 0;
  }

  return v9;
}

- (void)removeFromCache:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMessageTypeSearchController itemsVerifiedOnDiskCache](self, "itemsVerifiedOnDiskCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (BOOL)isTokenizationSearchController
{
  return 0;
}

- (void)sendSyndicationActionForResult:(id)a3 actionType:(unsigned __int8)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CKMessageTypeSearchController *v20;
  id v21;
  unsigned __int8 v22;

  v6 = a3;
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageTypeSearchController chatGUIDForSearchableItem:](self, "chatGUIDForSearchableItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "existingChatWithGUID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35788], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__CKMessageTypeSearchController_sendSyndicationActionForResult_actionType___block_invoke;
  v17[3] = &unk_1E274E0D8;
  v18 = v12;
  v19 = v10;
  v22 = a4;
  v20 = self;
  v21 = v6;
  v14 = v6;
  v15 = v10;
  v16 = v12;
  objc_msgSend(v13, "loadMessageItemWithGUID:completionBlock:", v16, v17);

}

void __75__CKMessageTypeSearchController_sendSyndicationActionForResult_actionType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 40), "chatItems");
    v8 = *(void **)(a1 + 40);
    v33 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chatItemsForItems:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = *(void **)(a1 + 40);
            v17 = *(unsigned __int8 *)(a1 + 64);
            v18 = v15;
            objc_msgSend(v18, "guid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "messagePartRange");
            objc_msgSend(v16, "sendSyndicationAction:forMessagePartGUID:syndicatedMessagePartRange:", v17, v19, v20, v21);

            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __75__CKMessageTypeSearchController_sendSyndicationActionForResult_actionType___block_invoke_109;
            v26[3] = &unk_1E274A108;
            v22 = *(void **)(a1 + 56);
            v26[4] = *(_QWORD *)(a1 + 48);
            v27 = v22;
            dispatch_async(MEMORY[0x1E0C80D38], v26);

            goto LABEL_12;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v35 = v24;
      v36 = 2112;
      v37 = v25;
      _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Could not find message for messageGUID: %@, chat: %@", buf, 0x16u);
    }

  }
}

void __75__CKMessageTypeSearchController_sendSyndicationActionForResult_actionType___block_invoke_109(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "removeResult:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchControllerContentsDidChange:", *(_QWORD *)(a1 + 32));

}

- (BOOL)searchTerminated
{
  return self->_searchTerminated;
}

- (void)setSearchTerminated:(BOOL)a3
{
  self->_searchTerminated = a3;
}

- (NSSet)intermediaryResults
{
  return self->_intermediaryResults;
}

- (void)setIntermediaryResults:(id)a3
{
  objc_storeStrong((id *)&self->_intermediaryResults, a3);
}

- (BOOL)gotResults
{
  return self->_gotResults;
}

- (void)setGotResults:(BOOL)a3
{
  self->_gotResults = a3;
}

- (NSString)priorQueryIdentifier
{
  return self->_priorQueryIdentifier;
}

- (void)setPriorQueryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_priorQueryIdentifier, a3);
}

- (NSArray)resultsToCheck
{
  return self->_resultsToCheck;
}

- (void)setResultsToCheck:(id)a3
{
  objc_storeStrong((id *)&self->_resultsToCheck, a3);
}

- (IMTimingCollection)timingCollection
{
  return self->_timingCollection;
}

- (void)setTimingCollection:(id)a3
{
  objc_storeStrong((id *)&self->_timingCollection, a3);
}

- (NSMutableSet)itemsVerifiedOnDiskCache
{
  return self->_itemsVerifiedOnDiskCache;
}

- (void)setItemsVerifiedOnDiskCache:(id)a3
{
  objc_storeStrong((id *)&self->_itemsVerifiedOnDiskCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsVerifiedOnDiskCache, 0);
  objc_storeStrong((id *)&self->_timingCollection, 0);
  objc_storeStrong((id *)&self->_resultsToCheck, 0);
  objc_storeStrong((id *)&self->_priorQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_intermediaryResults, 0);
}

@end
