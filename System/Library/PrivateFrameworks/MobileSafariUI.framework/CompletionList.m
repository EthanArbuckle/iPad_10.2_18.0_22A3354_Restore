@implementation CompletionList

- (CompletionList)initWithParsecSearchSession:(id)a3 browserController:(id)a4
{
  id v6;
  id v7;
  CompletionList *v8;
  CompletionList *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *ignoredSiriSuggestedSitesQueue;
  CompletionList *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CompletionList;
  v8 = -[CompletionList init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_browserController, v7);
    -[CompletionList setParsecSearchSession:](v9, "setParsecSearchSession:", v6);
    -[CompletionList _updateOfflineSearchSuggestionAvailability](v9, "_updateOfflineSearchSuggestionAvailability");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.mobilesafari.IgnoredSiriSuggestedSites", v10);
    ignoredSiriSuggestedSitesQueue = v9->_ignoredSiriSuggestedSitesQueue;
    v9->_ignoredSiriSuggestedSitesQueue = (OS_dispatch_queue *)v11;

    v13 = v9;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_urlStringToFaviconRequestTokens, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cancelRequestsWithTokens:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)CompletionList;
  -[CompletionList dealloc](&v10, sel_dealloc);
}

- (id)_recentSearchesForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BrowserController **p_browserController;
  uint64_t v13;
  uint64_t v14;
  SearchSuggestion *v15;
  id WeakRetained;
  SearchSuggestion *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[RecentWebSearchesController sharedController](RecentWebSearchesController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentSearchesMatchingPrefix:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    p_browserController = &self->_browserController;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
        v15 = [SearchSuggestion alloc];
        WeakRetained = objc_loadWeakRetained((id *)p_browserController);
        v17 = -[SearchSuggestion initWithRecentSearchString:userQuery:forPrivateBrowsing:](v15, "initWithRecentSearchString:userQuery:forPrivateBrowsing:", v14, v4, objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"));
        objc_msgSend(v8, "addObject:", v17);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v8;
}

+ (id)_completionsByMergingRecentSearches:(id)a3 withSuggestions:(id)a4 andLiteralSearch:(id)a5 queryID:(int64_t)a6 topHits:(id)a7 forPrivateBrowsing:(BOOL)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  SearchSuggestion *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  int64_t v49;
  id v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v52 = a8;
  v49 = a6;
  v71 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v65 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v21, "string", v49);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v18);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v23 = v11;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v61 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        objc_msgSend(v28, "string", v49);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, v29);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v25);
  }

  v30 = (void *)MEMORY[0x1E0D8A860];
  objc_msgSend(v23, "safari_mapObjectsUsingBlock:", &__block_literal_global_67);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safari_mapObjectsUsingBlock:", &__block_literal_global_67);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "recentAndSuggestedCompletionStringsByMergingRecentSearches:withSuggestions:literalSearch:", v31, v32, v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count") + objc_msgSend(v33, "count") + 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "defaultSearchEngineForPrivateBrowsing:", v52);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __122__CompletionList__completionsByMergingRecentSearches_withSuggestions_andLiteralSearch_queryID_topHits_forPrivateBrowsing___block_invoke_2;
  v58[3] = &unk_1E9CFA9D0;
  v50 = v36;
  v59 = v50;
  objc_msgSend(v14, "safari_mapAndFilterObjectsUsingBlock:", v58);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled"))
    {
      objc_msgSend(v13, "safari_stringByTrimmingWhitespace");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lowercaseString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v51, "containsObject:", v38) & 1) != 0)
      {
        v39 = objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled");

        if ((v39 & 1) != 0)
          goto LABEL_24;
      }
      else
      {

      }
LABEL_23:
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A860]), "initWithQueryString:queryID:", v13, v49);
      v41 = -[SearchSuggestion initWithUserTypedQuery:forPrivateBrowsing:]([SearchSuggestion alloc], "initWithUserTypedQuery:forPrivateBrowsing:", v40, v52);
      objc_msgSend(v34, "addObject:", v41);

      goto LABEL_24;
    }
    if ((objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled") & 1) == 0)
      goto LABEL_23;
  }
LABEL_24:
  v53 = v13;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v42 = v33;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v55;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v55 != v45)
          objc_enumerationMutation(v42);
        objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k), v49);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v47);

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    }
    while (v44);
  }

  return v34;
}

uint64_t __122__CompletionList__completionsByMergingRecentSearches_withSuggestions_andLiteralSearch_queryID_topHits_forPrivateBrowsing___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "string");
}

id __122__CompletionList__completionsByMergingRecentSearches_withSuggestions_andLiteralSearch_queryID_topHits_forPrivateBrowsing___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a2, "originalURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userVisibleQueryFromSearchURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_titleForFindOnPageHeaderWithMatchCount:(unint64_t)a3
{
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = &stru_1E9CFDBB0;
  if ((_SFDeviceIsPad() & 1) == 0 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = *MEMORY[0x1E0CD5820];
    if (*MEMORY[0x1E0CD5820] >= a3)
    {
      v9 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringFromNumber:numberStyle:", v8, 1);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 < 2)
    {
      if (a3 != 1)
      {
        _WBSLocalizedString();
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v14 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v12, 1);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v12, v10);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (__CFString *)v13;

LABEL_12:
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activeTabDocument");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "isPDFDocument");

  v18 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v19, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_groupWithTitle:(id)a3 completions:(id)a4 maximumCompletions:(unint64_t)a5
{
  id v7;
  id v8;
  CompletionGroup *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[CompletionGroup initWithTitle:completions:maximumNumberOfCompletions:]([CompletionGroup alloc], "initWithTitle:completions:maximumNumberOfCompletions:", v8, v7, a5);

  return v9;
}

- (id)_groupWithTitle:(id)a3 completions:(id)a4
{
  return -[CompletionList _groupWithTitle:completions:maximumCompletions:](self, "_groupWithTitle:completions:maximumCompletions:", a3, a4, 5);
}

- (id)_groupByAddingCompletions:(id)a3 toGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CompletionList _groupWithTitle:completions:](self, "_groupWithTitle:completions:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_removeSearchURLsFromCompletions:(id)a3
{
  id WeakRetained;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "activeSearchEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userVisibleURLString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "urlIsValidSearch:", v9);

      if (v10)
        objc_msgSend(v11, "removeObjectAtIndex:", v6);
      else
        ++v6;

    }
    while (v6 < objc_msgSend(v11, "count"));
  }

}

- (BOOL)_canUseOfflineSearchSuggestions
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CompletionList _defaultSearchEngineIsGoogle](self, "_defaultSearchEngineIsGoogle");
  if (v3)
  {
    v3 = -[OfflineSearchSuggestionsCompletionProvider areOfflineSearchSuggestionsAvailable](self->_offlineSearchSuggestionsCompletionProvider, "areOfflineSearchSuggestionsAvailable");
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0D89D28]);

      LOBYTE(v3) = (v5 & 1) == 0 && !self->_haveReceivedNetworkedSuggestions;
    }
  }
  return v3;
}

- (BOOL)_defaultSearchEngineIsGoogle
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "activeSearchEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D8B558]);

  return v5;
}

- (BOOL)_shouldFetchSearchSuggestions
{
  _BOOL4 v3;

  if (self->_shouldIncludeNetworkedSearchSuggestions
    || (v3 = -[CompletionList _canUseOfflineSearchSuggestions](self, "_canUseOfflineSearchSuggestions")))
  {
    LOBYTE(v3) = self->_inputTypeOfStringToComplete - 3 < 0xFFFFFFFFFFFFFFFELL;
  }
  return v3;
}

- (BOOL)hasParsecResults
{
  return -[CompletionGroupListing hasParsecCompletions](self->_listingOnDisplay, "hasParsecCompletions");
}

- (void)_removeTopHitsGroup:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass() & 1;

  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v7, v6);

  objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v8, "count") - 1);
}

- (void)_addURLCompletions:(id)a3 toListing:(id)a4 isCFSearch:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  WBSCompletionQuery *rewrittenQuery;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  WBSCompletionQuery *query;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  WBSCompletionQuery *v30;
  WBSCompletionQuery *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v5 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  rewrittenQuery = self->_rewrittenQuery;
  if (rewrittenQuery)
  {
    -[WBSCompletionQuery queryString](rewrittenQuery, "queryString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "sfSearchResultValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setCorrectedQuery:", v11);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v14);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "activeSearchEngine");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  query = self->_rewrittenQuery;
  if (!query)
    query = self->_query;
  objc_msgSend(MEMORY[0x1E0D8ABC0], "filterOutUnlikelyMatchesFromTopHits:forQuery:searchProvider:", v8, query, v20);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  -[CompletionList _searchForURLTopHits:intoTopHits:](self, "_searchForURLTopHits:intoTopHits:", v22, v18);
  v23 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    v25 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 134217984;
    v51 = v25;
    _os_log_impl(&dword_1D7CA3000, v24, OS_LOG_TYPE_INFO, "Number of local TopHits: %lu", buf, 0xCu);

  }
  if (!objc_msgSend(v18, "count") && self->_tryParsecRewritesIfNoTopHit)
  {
    self->_tryParsecRewritesIfNoTopHit = 0;
    -[UniversalSearchCompletionProvider parsecSearchSession](self->_universalSearchProvider, "parsecSearchSession");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "rewrittenQueryStringFromParsec");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (WBSCompletionQuery *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A860]), "initWithQueryString:", v28);
    v31 = self->_rewrittenQuery;
    self->_rewrittenQuery = v30;

    objc_msgSend(WeakRetained, "effectiveProfileIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCompletionQuery setProfileIdentifierToFilterResults:](self->_rewrittenQuery, "setProfileIdentifierToFilterResults:", v32);

    -[WBSCompletionQuery setTriggerEvent:](self->_rewrittenQuery, "setTriggerEvent:", 18);
    -[URLCompletionProvider completionsForQuery:isCFSearch:](self->_URLCompletionProvider, "completionsForQuery:isCFSearch:", self->_rewrittenQuery, v5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      objc_msgSend(v9, "setNeedsParsecDatabaseQueryRewrite");
      goto LABEL_18;
    }
    v40 = v20;
    objc_msgSend(MEMORY[0x1E0D8ABC0], "filterOutUnlikelyMatchesBeforeTopHitPromotionFromMatches:forQuery:searchProvider:", v33, self->_rewrittenQuery, v20);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[CompletionList _searchForURLTopHits:intoTopHits:](self, "_searchForURLTopHits:intoTopHits:", v34, v18);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v22 = v34;
    v35 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v42 != v37)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "sfSearchResultValue");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setCorrectedQuery:", v28);

        }
        v36 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v36);
    }

    v20 = v40;
  }
  v26 = objc_msgSend(v18, "count");
  if (v26)
  {
    objc_msgSend(v22, "subarrayWithRange:", v26, objc_msgSend(v22, "count") - v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v22 = (id)v27;
  }
  objc_msgSend(v9, "setURLCompletionMatches:", v22);
  objc_msgSend(v9, "setLocalTopHits:", v18);
  objc_msgSend(v9, "setRewrittenQuery:", self->_rewrittenQuery);
  v28 = v22;
LABEL_18:

}

- (void)_addUniversalSearchCompletions:(id)a3 toCompletionListing:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSSet *siriSuggestedSitesURLStringsToIgnore;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  CompletionList *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  BOOL v63;
  void *v64;
  id obj;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t v78[128];
  uint8_t buf[4];
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSearchEvaluationLoggingEnabled"))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CompletionList _addUniversalSearchCompletions:toCompletionListing:].cold.2(v8);
  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "topHits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v7;
    objc_msgSend(v7, "topHitAddresses");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[CompletionList _isPegasusMapsCompositeResult:](self, "_isPegasusMapsCompositeResult:", v6);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v56 = v6;
    obj = v6;
    v62 = (void *)v10;
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
    if (v68)
    {
      v58 = 0;
      v12 = 0;
      v13 = 0;
      v66 = *(_QWORD *)v75;
      v14 = v59;
      v63 = v11;
      while (1)
      {
        for (i = 0; i != v68; ++i)
        {
          if (*(_QWORD *)v75 != v66)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          if (v11 || objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "placement") == 2)
            goto LABEL_25;
          objc_msgSend(v16, "resultType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((WBSIsEqual() & 1) == 0)
          {

            v11 = v63;
            goto LABEL_25;
          }
          siriSuggestedSitesURLStringsToIgnore = self->_siriSuggestedSitesURLStringsToIgnore;
          objc_msgSend(v16, "url");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "absoluteString");
          v20 = v9;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(siriSuggestedSitesURLStringsToIgnore) = -[NSSet containsObject:](siriSuggestedSitesURLStringsToIgnore, "containsObject:", v21);

          v9 = v20;
          v14 = v59;

          v10 = (uint64_t)v62;
          v11 = v63;
          if (!(_DWORD)siriSuggestedSitesURLStringsToIgnore)
            goto LABEL_25;
          objc_msgSend(MEMORY[0x1E0D8AD60], "shared");
          v22 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "inExperiment"))
          {
            -[NSArray firstObject](self->_searchParametersList, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "shouldEmitTriggerLoggingForHidingIgnoredSiriSuggestedWebsite");

            if (!v24)
              goto LABEL_18;
            v22 = objc_alloc_init(MEMORY[0x1E0D8C398]);
            objc_msgSend(v22, "setQueryId:", -[WBSCompletionQuery queryID](self->_query, "queryID"));
            objc_msgSend(MEMORY[0x1E0D8AC38], "codePathUUIDForHideIgnoredSiriSuggestedWebsites");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setCodepathId:", v25);

            -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "didHideRepeatedlyIgnoredSiriSuggestedSiteWithFeedbackEvent:", v22);

          }
LABEL_18:
          objc_msgSend(MEMORY[0x1E0D8ABC0], "searchParameters");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "thresholdForHidingIgnoredSiriSuggestedSites");

          v10 = (uint64_t)v62;
          v11 = v63;
          if (v28)
          {
            v29 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = v29;
              objc_msgSend(v16, "url");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "absoluteString");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138739971;
              v80 = v32;
              _os_log_impl(&dword_1D7CA3000, v30, OS_LOG_TYPE_INFO, "Hiding repeatedly ignored Siri suggested site: %{sensitive}@", buf, 0xCu);

            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v33 = objc_alloc_init(MEMORY[0x1E0D8C680]);
              objc_msgSend(v33, "setHideReason:", 1);
              objc_msgSend(v16, "setSafariAttributes:", v33);

            }
            v34 = v16;

            v58 = v34;
            v10 = (uint64_t)v62;
            v11 = v63;
            continue;
          }
LABEL_25:
          objc_msgSend(v16, "setQueryId:", -[WBSCompletionQuery queryID](self->_query, "queryID"));
          if (!objc_msgSend(v9, "count") && objc_msgSend(v16, "topHit") && v13 <= 1)
          {
            v37 = self;
            v38 = v16;
            v39 = v60;
LABEL_38:
            -[CompletionList _addResult:intoGroup:unlessHiddenBy:topHit:](v37, "_addResult:intoGroup:unlessHiddenBy:topHit:", v38, v39, v14, v10);
            ++v13;
            continue;
          }
          if (objc_msgSend(v16, "placement") != 2 && v13 <= 1)
          {
            v37 = self;
            v38 = v16;
            v39 = v64;
            goto LABEL_38;
          }
          if (v12 <= 1)
          {
            -[CompletionList _addResult:intoGroup:unlessHiddenBy:topHit:](self, "_addResult:intoGroup:unlessHiddenBy:topHit:", v16, v61, v14, v10);
            ++v12;
          }
        }
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
        if (!v68)
          goto LABEL_43;
      }
    }
    v58 = 0;
LABEL_43:

    v7 = v57;
    objc_msgSend(v57, "setHiddenIgnoredSiriSuggestedSite:", v58);
    if (!objc_msgSend(v9, "count") && objc_msgSend(v60, "count"))
      objc_msgSend(v57, "setParsecTopHits:", v60);
    objc_msgSend(v57, "calculationResultItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (!v40
      || (objc_msgSend(v40, "calculationResult"),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          v43 = objc_msgSend(v42, "isCurrencyConversion"),
          v42,
          (v43 & 1) == 0))
    {
      objc_msgSend(v57, "setTopParsecResults:", v64);
    }
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSearchEvaluationLoggingEnabled"))
    {
      v67 = v41;
      v69 = v9;
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v45 = v64;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v71;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v71 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
            objc_msgSend(v50, "uuidString");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "url");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "absoluteString");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "safari_urlHashesOfComponents");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "appendFormat:", CFSTR(" %@ <%@>,"), v51, v54);

          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        }
        while (v47);
      }

      v55 = WBS_LOG_CHANNEL_PREFIXParsec();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        -[CompletionList _addUniversalSearchCompletions:toCompletionListing:].cold.1((uint64_t)v44, v55);

      v7 = v57;
      v41 = v67;
      v9 = v69;
    }
    objc_msgSend(v7, "setBottomParsecResults:", v61);

    v6 = v56;
  }

}

- (void)_addSearchProviderSuggestions:(id)a3 toListing:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  -[WBSCompletionQuery queryString](self->_query, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_inputTypeOfStringToComplete != 1 && objc_msgSend(v7, "length"))
  {
    -[CompletionProvider completionsForQuery:](self->_quickWebsiteSearchProvider, "completionsForQuery:", self->_query);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQuickWebsiteSearchItem:", v10);

    -[CompletionList _recentSearchesForQuery:](self, "_recentSearchesForQuery:", self->_query);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_class();
    v13 = -[WBSCompletionQuery queryID](self->_query, "queryID");
    objc_msgSend(v6, "topHits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(v12, "_completionsByMergingRecentSearches:withSuggestions:andLiteralSearch:queryID:topHits:forPrivateBrowsing:", v11, v26, v8, v13, v14, objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v11;
    if (objc_msgSend(v26, "count"))
      v17 = 3;
    else
      v17 = objc_msgSend(v11, "count") != 0;
    v24 = v17;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      v19 = 0;
      do
      {
        objc_msgSend(v16, "objectAtIndex:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "goesToURL") & 1) != 0)
        {
          objc_msgSend(v16, "removeObjectAtIndex:", v19);
          objc_msgSend(v20, "string");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "topHitAddresses");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[CompletionList _urlString:isProbablyContainedIn:](self, "_urlString:isProbablyContainedIn:", v21, v22))
          {

          }
          else
          {
            v23 = objc_msgSend(v18, "count");

            if (v23 <= 2)
              objc_msgSend(v18, "addObject:", v20);
          }
        }
        else
        {
          ++v19;
        }

      }
      while (v19 < objc_msgSend(v16, "count"));
    }
    objc_msgSend(v6, "setSuggestedSites:", v18);
    objc_msgSend(v6, "setSearchSuggestions:fromSource:", v16, v24);

  }
}

- (id)_listingForQuery:(id)a3
{
  WBSCompletionQuery *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  CompletionGroupListing *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WBSCompletionQuery *rewrittenQuery;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  UniversalSearchCompletionProvider *universalSearchProvider;
  char v23;
  void *v24;
  NSObject *v25;
  char v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  int v34;
  _BOOL4 v35;
  CompletionGroupListing *listingOnDisplay;
  void *v37;
  SearchSuggestion *v38;
  uint64_t v39;
  uint64_t v40;
  SearchSuggestionProvider *suggestionProvider;
  _BOOL4 v42;
  CompletionGroupListing *v43;
  void *v44;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v4 = (WBSCompletionQuery *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(MEMORY[0x1E0D8ABC0], "searchParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCFSearch");

  v8 = 112;
  if ((_DWORD)v7)
    v8 = 120;
  v9 = (CompletionGroupListing *)*(id *)((char *)&self->super.isa + v8);
  -[CompletionProvider completionsForQuery:](self->_quickWebsiteSearchProvider, "completionsForQuery:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionGroupListing setQuickWebsiteSearchItem:](v9, "setQuickWebsiteSearchItem:", v11);

  -[CompletionProvider completionsForQuery:](self->_calculationResultProvider, "completionsForQuery:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionGroupListing setCalculationResultItem:](v9, "setCalculationResultItem:", v13);

  if (self->_usingPencilInput)
  {
    -[CompletionProvider completionsForQuery:](self->_pencilInputCompletionProvider, "completionsForQuery:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CompletionGroupListing setPencilCompletionItem:](v9, "setPencilCompletionItem:", v15);

  }
  else
  {
    -[CompletionGroupListing setPencilCompletionItem:](v9, "setPencilCompletionItem:", 0);
  }
  -[FindOnPageCompletionProvider completionsForQuery:](self->_findOnPageProvider, "completionsForQuery:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionGroupListing setFindOnPageCompletionItem:](v9, "setFindOnPageCompletionItem:", v17);

  if (-[CompletionGroupListing isAwaitingCompletionDatabase](v9, "isAwaitingCompletionDatabase")
    || self->_tryParsecRewritesIfNoTopHit)
  {
    if (self->_rewrittenQuery)
      rewrittenQuery = self->_rewrittenQuery;
    else
      rewrittenQuery = v4;
    -[URLCompletionProvider completionsForQuery:isCFSearch:](self->_URLCompletionProvider, "completionsForQuery:isCFSearch:", rewrittenQuery, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CompletionProvider isFailing](self->_URLCompletionProvider, "isFailing") || v19)
    {
      -[CompletionGroupListing markDatabaseResultsReceived](v9, "markDatabaseResultsReceived");
      if (v19)
        -[CompletionList _addURLCompletions:toListing:isCFSearch:](self, "_addURLCompletions:toListing:isCFSearch:", v19, v9, v7);
    }

  }
  v20 = -[CompletionGroupListing isAwaitingCompletionDatabase](v9, "isAwaitingCompletionDatabase");
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSearchEvaluationLoggingEnabled"))
  {
    v21 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[CompletionList _listingForQuery:].cold.2(!v20, v21);
  }
  if (-[CompletionGroupListing isAwaitingParsec](v9, "isAwaitingParsec") && !v20)
  {
    universalSearchProvider = self->_universalSearchProvider;
    if (universalSearchProvider)
      v23 = self->_parsecSearchSession != 0;
    else
      v23 = 0;
    -[UniversalSearchCompletionProvider completionsForQuery:](universalSearchProvider, "completionsForQuery:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSearchEvaluationLoggingEnabled"))
    {
      v25 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[CompletionList _listingForQuery:].cold.1(v23, v25, v24);
    }
    if (v24)
      v26 = 0;
    else
      v26 = v23;
    if ((v26 & 1) == 0)
    {
      -[CompletionGroupListing markParsecResultsReceived](v9, "markParsecResultsReceived");
      -[CompletionList _addUniversalSearchCompletions:toCompletionListing:](self, "_addUniversalSearchCompletions:toCompletionListing:", v24, v9);
    }

  }
  -[CompletionProvider completionsForQuery:](self->_tabCompletionProvider, "completionsForQuery:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27
    && -[CompletionGroupListing isAwaitingTabCompletion](v9, "isAwaitingTabCompletion")
    && !-[CompletionGroupListing isAwaitingParsec](v9, "isAwaitingParsec"))
  {

    if (v20)
      goto LABEL_38;
    -[CompletionGroupListing markTabCompletionReceived](v9, "markTabCompletionReceived");
    -[CompletionGroupListing topHits](v9, "topHits");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CompletionList _bestTabCompletionItemWithTopHits:](self, "_bestTabCompletionItemWithTopHits:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CompletionGroupListing setTabCompletionMatch:](v9, "setTabCompletionMatch:", v28);

  }
LABEL_38:
  if (-[CompletionGroupListing isAwaitingSearchProvider](v9, "isAwaitingSearchProvider"))
  {
    v29 = -[CompletionList _shouldFetchSearchSuggestions](self, "_shouldFetchSearchSuggestions");
    if (v29 && self->_shouldIncludeNetworkedSearchSuggestions)
    {
      -[CompletionProvider completionsForQuery:](self->_suggestionProvider, "completionsForQuery:", v4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    v31 = objc_msgSend(v30, "count");
    v32 = !v29;
    if (v31)
      v32 = 1;
    if ((v32 & 1) != 0 || !-[CompletionList _canUseOfflineSearchSuggestions](self, "_canUseOfflineSearchSuggestions"))
    {
      v34 = 0;
    }
    else
    {
      -[CompletionProvider completionsForQuery:](self->_offlineSearchSuggestionsCompletionProvider, "completionsForQuery:", v4);
      v33 = objc_claimAutoreleasedReturnValue();

      v34 = 1;
      v30 = (void *)v33;
    }
    if (v30)
      v35 = 0;
    else
      v35 = v29;
    if (v35 && !-[CompletionProvider isFailing](self->_suggestionProvider, "isFailing")
      || -[CompletionGroupListing isAwaitingParsec](v9, "isAwaitingParsec"))
    {
      listingOnDisplay = self->_listingOnDisplay;
      if (v9 != listingOnDisplay)
      {
        -[CompletionGroupListing searchSuggestions](listingOnDisplay, "searchSuggestions");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v37, "count"))
        {
          v38 = -[SearchSuggestion initWithUserTypedQuery:forPrivateBrowsing:]([SearchSuggestion alloc], "initWithUserTypedQuery:forPrivateBrowsing:", v4, objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"));
          v46[0] = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
          v39 = objc_claimAutoreleasedReturnValue();

          v37 = (void *)v39;
        }
        if (-[CompletionGroupListing searchSuggestionsSource](self->_listingOnDisplay, "searchSuggestionsSource") == 1)
        {
          v40 = 1;
        }
        else
        {
          v43 = self->_listingOnDisplay;
          if (v43
            && (!-[CompletionGroupListing isAwaitingSearchProvider](v43, "isAwaitingSearchProvider")
             || -[CompletionGroupListing searchSuggestionsSource](self->_listingOnDisplay, "searchSuggestionsSource")))
          {
            v40 = 2;
          }
          else
          {
            v40 = 0;
          }
        }
        -[CompletionGroupListing suggestedSites](self->_listingOnDisplay, "suggestedSites");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[CompletionGroupListing setSuggestedSites:](v9, "setSuggestedSites:", v44);

        -[CompletionGroupListing setSearchSuggestions:fromSource:](v9, "setSearchSuggestions:fromSource:", v37, v40);
      }
    }
    else
    {
      if (!v34
        || !self->_shouldIncludeNetworkedSearchSuggestions
        || -[CompletionProvider isFailing](self->_suggestionProvider, "isFailing"))
      {
        suggestionProvider = self->_suggestionProvider;
        if (suggestionProvider)
          v42 = !-[CompletionProvider isFailing](suggestionProvider, "isFailing");
        else
          LOBYTE(v42) = 0;
        self->_haveReceivedNetworkedSuggestions = v42;
        -[CompletionGroupListing markSearchResultsReceived](v9, "markSearchResultsReceived");
      }
      -[CompletionList _addSearchProviderSuggestions:toListing:](self, "_addSearchProviderSuggestions:toListing:", v30, v9);
    }

  }
  return v9;
}

- (id)titleForFindOnPageCompletion:(id)a3
{
  return -[CompletionList _titleForFindOnPageHeaderWithMatchCount:](self, "_titleForFindOnPageHeaderWithMatchCount:", objc_msgSend(a3, "numberOfMatches"));
}

- (NSString)titleForSearchSuggestionsCompletion
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v3, "defaultSearchEngineForPrivateBrowsing:", objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_shouldIncludeNetworkedSearchSuggestions
    || -[CompletionList _canUseOfflineSearchSuggestions](self, "_canUseOfflineSearchSuggestions"))
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(v5, "shortName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D8B560]);

    if (!v14)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
    objc_msgSend(v5, "displayName");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
LABEL_5:

  return (NSString *)v11;
}

- (BOOL)_isStreamlinedCompletionListEnabled
{
  return objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled");
}

- (id)_filteredURLCompletions:(id)a3 withTopHits:(id)a4 displayedUniversalSearchCompletions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D8ABC0];
  objc_msgSend(MEMORY[0x1E0D8ABC0], "searchParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "includeBookmarksAndHistory:", v12);

  if ((_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x1E0D8ABC0], "filterOutUnlikelyMatchesFromMatches:forQuery:rewrittenQuery:", v8, self->_query, self->_rewrittenQuery);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8ABC0], "searchParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "enableCompletionListHistoryDeduplicationValue");

    if (v15)
    {
      if (self->_switchToTabMatch)
      {
        v20[0] = self->_switchToTabMatch;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = (void *)MEMORY[0x1E0C9AA60];
      }
      objc_msgSend(MEMORY[0x1E0D8ABC0], "dedupeSameTitleHistoryResults:withMobile:withTophits:withTabs:", v8, 1, v9, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[CompletionList _isStreamlinedCompletionListEnabled](self, "_isStreamlinedCompletionListEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0D8ABC0], "dedupeSameURLResults:withUniversalSearchResults:", v17, v10);
        v18 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v18;
      }

      v13 = v17;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_addResults:(id)a3 intoGroups:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  CompletionList *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25 = self;
  v26 = a4;
  -[CompletionList _cacheResultsIfApplicable:](self, "_cacheResultsIfApplicable:", v6);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
        if (objc_msgSend(v7, "count"))
        {
          objc_msgSend(v13, "sectionHeader");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "sectionHeader");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v14, "isEqualToString:", v16);

          if ((v17 & 1) == 0)
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "sectionHeader");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CompletionList _groupWithTitle:completions:](v25, "_groupWithTitle:completions:", v19, v7);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v20);

            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v21 = objc_claimAutoreleasedReturnValue();

            v7 = (void *)v21;
          }
        }
        objc_msgSend(v7, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionHeader");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionList _groupWithTitle:completions:](v25, "_groupWithTitle:completions:", v23, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v24);

}

- (void)_addResult:(id)a3 intoGroup:(id)a4 unlessHiddenBy:(id)a5 topHit:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  NSMutableDictionary *rankingFeedbackForHiddenOrDuplicateResults;
  void *v46;
  id v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  id v54;
  _BYTE v55[128];
  void *v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v57[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionList _cacheResultsIfApplicable:](self, "_cacheResultsIfApplicable:", v14);

  objc_msgSend(v10, "sectionBundleIdentifier");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.parsec.maps")) & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v10, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v16 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v10, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D8ABC0], "searchParameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isDedupeThroughAlternativeURLsEnabled");

    if (v21)
    {
      objc_msgSend(v10, "alternativeURLs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v23;
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v15 = v19;
    v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v24)
    {
      v25 = v24;
      v47 = v11;
      v26 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v50 != v26)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "absoluteString", v47);
          v28 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v28, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 3, 0, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v28) = -[CompletionList _urlString:isProbablyContainedIn:](self, "_urlString:isProbablyContainedIn:", v29, v12);
          if ((v28 & 1) != 0)
          {
            v16 = 1;
            goto LABEL_16;
          }
        }
        v25 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        if (v25)
          continue;
        break;
      }
      v16 = 0;
LABEL_16:
      v11 = v47;
    }
    else
    {
      v16 = 0;
    }

  }
LABEL_21:
  v48 = 0;
  v30 = -[UniversalSearchCompletionProvider shouldHideParsecResult:basedOnHideRankGivenTopHit:indexOfTopHitInFrequentlyVisitedSites:](self->_universalSearchProvider, "shouldHideParsecResult:basedOnHideRankGivenTopHit:indexOfTopHitInFrequentlyVisitedSites:", v10, v13, &v48);
  objc_msgSend(v13, "sfSearchResultValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  if (v33)
  {
    if (v16)
    {
LABEL_23:
      v34 = objc_alloc(MEMORY[0x1E0D8C648]);
      v54 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v11, "count") - 1;
      v37 = v34;
      v38 = v31;
      v39 = v35;
      v40 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "UUIDString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setIdentifier:", v42);

    if (v16)
      goto LABEL_23;
  }
  if (!v30)
  {
    objc_msgSend(v11, "addObject:", v10);
    goto LABEL_29;
  }
  v43 = objc_alloc(MEMORY[0x1E0D8C648]);
  v53 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v11, "count") - 1;
  v37 = v43;
  v38 = v31;
  v39 = 0;
  v40 = v35;
LABEL_27:
  v44 = (void *)objc_msgSend(v37, "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v38, v39, v40, v36);
  rankingFeedbackForHiddenOrDuplicateResults = self->_rankingFeedbackForHiddenOrDuplicateResults;
  objc_msgSend(v31, "identifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](rankingFeedbackForHiddenOrDuplicateResults, "setObject:forKeyedSubscript:", v44, v46);

LABEL_29:
}

- (void)_cacheResultsIfApplicable:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[Application sharedApplication](Application, "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forYouRecentParsecResultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendResultsIfApplicable:", v3);
}

- (id)_addTopHitsWithSwitchToTabSectionIfNecessary:(id)a3 intoGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[CompletionList _addTopHits:intoGroups:](self, "_addTopHits:intoGroups:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[CompletionList _addSwitchToTabSectionIfNecessary:intoGroups:](self, "_addSwitchToTabSectionIfNecessary:intoGroups:", v6, v7);

  return v8;
}

- (void)_addSwitchToTabSectionIfNecessary:(id)a3 intoGroups:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!objc_msgSend(v8, "count"))
  {
    -[CompletionList _bestTabCompletionItemWithTopHits:](self, "_bestTabCompletionItemWithTopHits:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[CompletionList _addSwitchToTabSectionWithTabCompletionMatch:intoGroups:](self, "_addSwitchToTabSectionWithTabCompletionMatch:intoGroups:", v7, v6);

  }
}

- (id)_bestTabCompletionItemWithTopHits:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CompletionList tabCompletionProvider](self, "tabCompletionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFailing");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v11 = 0;
        goto LABEL_9;
      }
      v10 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v9, "userVisibleURLString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_URLWithUserTypedString:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
      v9 = 0;
    }

LABEL_9:
    -[CompletionList tabCompletionProvider](self, "tabCompletionProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CompletionList query](self, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bestTabCompletionMatchForQuery:withTopHitURL:", v13, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v7 = 0;
LABEL_10:

  return v7;
}

- (void)_addSwitchToTabSectionWithTabCompletionMatch:(id)a3 intoGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WBSBrowserTabCompletionMatch *switchToTabMatch;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "tabGroupTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabGroupTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionList _groupWithTitle:completions:maximumCompletions:](self, "_groupWithTitle:completions:maximumCompletions:", v12, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v14);

  switchToTabMatch = self->_switchToTabMatch;
  self->_switchToTabMatch = (WBSBrowserTabCompletionMatch *)v6;

}

- (id)_titleForTopHits:(unint64_t)a3
{
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_addTopHits:(id)a3 intoGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[CompletionList _titleForTopHits:](self, "_titleForTopHits:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[CompletionList _bestTabCompletionItemWithTopHits:](self, "_bestTabCompletionItemWithTopHits:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "arrayByAddingObject:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      if (-[CompletionList _isStreamlinedCompletionListEnabled](self, "_isStreamlinedCompletionListEnabled"))
        objc_storeStrong((id *)&self->_switchToTabMatch, v9);
    }
    else
    {
      v10 = (uint64_t)v6;
    }

    v6 = (id)v10;
  }
  -[CompletionList _groupWithTitle:completions:](self, "_groupWithTitle:completions:", v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

  objc_msgSend(v6, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_searchForURLTopHits:(id)a3 intoTopHits:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
      if (!objc_msgSend(v12, "isTopHit", (_QWORD)v13))
        break;
      objc_msgSend(v6, "addObject:", v12);
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BOOL)_urlString:(id)a3 isProbablyContainedIn:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v7 = (void *)MEMORY[0x1E0C99E98];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__CompletionList__urlString_isProbablyContainedIn___block_invoke;
    v10[3] = &unk_1E9CFA9F8;
    v11 = v6;
    v12 = &v13;
    objc_msgSend(v7, "safari_enumeratePossibleURLsForUserTypedString:withBlock:", v5, v10);
    v8 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __51__CompletionList__urlString_isProbablyContainedIn___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;

  objc_msgSend(a2, "safari_userVisibleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_urlStringForCompletionDeduplication");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (void)_updateIconsForSearchUIRowsInGroups:(id)a3 topHit:(id)a4
{
  id v5;
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v8, "completions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v9, "count") < 2
          || (objc_msgSend(v9, "lastObject"),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v10,
              (isKindOfClass & 1) != 0))
        {
          v22 = v9;
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          objc_msgSend(v8, "results");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v24 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                objc_msgSend(v6, "sfSearchResultValue");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17 == v18)
                  v19 = 6;
                else
                  v19 = 4;
                objc_msgSend(v17, "safari_setCompletionIconForCompactRow:", v19);

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v14);
          }

          v9 = v22;
        }

      }
      v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }

}

- (void)_updateCompletionListing
{
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *rankingFeedbackForHiddenOrDuplicateResults;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  NSString *v20;
  NSString *stringMatchedByTopHit;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSString *v27;
  NSString *matchingStringInTopHit;
  NSString **p_matchingStringInTopHit;
  void *v30;
  uint64_t v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  unint64_t v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  int v71;
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_msgSend(WeakRetained, "completionListHasScheduledDismissal:", self);
  v4 = WeakRetained;
  if ((v3 & 1) == 0)
  {
    -[WBSCompletionQuery queryString](self->_query, "queryString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (!v6)
    {
      -[CompletionList clearCompletionListings](self, "clearCompletionListings");
      objc_msgSend(WeakRetained, "completionListDidUpdate:forQuery:", self, self->_query);
LABEL_51:
      v4 = WeakRetained;
      goto LABEL_52;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    rankingFeedbackForHiddenOrDuplicateResults = self->_rankingFeedbackForHiddenOrDuplicateResults;
    self->_rankingFeedbackForHiddenOrDuplicateResults = v7;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray firstObject](self->_searchParametersList, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isCFSearch");

    if (v11)
    {
      -[NSArray firstObject](self->_searchParametersList, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8ABC0], "setSearchParameters:", v12);

      v13 = -[URLCompletionProvider cfErrorForQuery:](self->_URLCompletionProvider, "cfErrorForQuery:", self->_query);
      if (!v13)
      {
        -[CompletionList _listingForQuery:](self, "_listingForQuery:", self->_query);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        -[NSArray lastObject](self->_searchParametersList, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D8ABC0], "setSearchParameters:", v15);

        -[CompletionList _listingForQuery:](self, "_listingForQuery:", self->_query);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "topHit");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isAwaitingCompletionDatabase");
        if ((objc_msgSend(v16, "isAwaitingParsec") & 1) == 0 && (v18 & 1) == 0)
        {
          -[WBSCompletionQuery queryString](self->_query, "queryString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (NSString *)objc_msgSend(v19, "copy");
          stringMatchedByTopHit = self->_stringMatchedByTopHit;
          self->_stringMatchedByTopHit = v20;

          -[WBSCompletionQuery queryString](self->_rewrittenQuery, "queryString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          v24 = v9;
          if (v22)
          {
            v25 = v22;
          }
          else
          {
            -[WBSCompletionQuery queryString](self->_query, "queryString");
            v25 = (id)objc_claimAutoreleasedReturnValue();
          }
          v26 = v25;

          if (-[NSString length](self->_stringMatchedByTopHit, "length"))
          {
            objc_msgSend(v17, "reflectedStringForUserTypedString:", v26);
            v27 = (NSString *)objc_claimAutoreleasedReturnValue();
            p_matchingStringInTopHit = &self->_matchingStringInTopHit;
            matchingStringInTopHit = self->_matchingStringInTopHit;
            self->_matchingStringInTopHit = v27;
          }
          else
          {
            p_matchingStringInTopHit = &self->_matchingStringInTopHit;
            matchingStringInTopHit = self->_matchingStringInTopHit;
            self->_matchingStringInTopHit = 0;
          }

          if (!*p_matchingStringInTopHit
            && -[CompletionItem isEquivalentTo:](self->_topHit, "isEquivalentTo:", v17))
          {
            objc_storeStrong((id *)p_matchingStringInTopHit, v26);
          }
          if (-[NSString length](self->_matchingStringInTopHit, "length"))
            v30 = v17;
          else
            v30 = 0;
          objc_storeStrong((id *)&self->_topHit, v30);
          if (-[NSString length](self->_stringMatchedByTopHit, "length"))
            objc_msgSend(WeakRetained, "completionList:topHitDidBecomeReadyForString:", self, self->_matchingStringInTopHit);

          v9 = v24;
        }
        if ((objc_msgSend(v16, "isSufficientlyComputedForDisplay") & 1) == 0)
        {
          if (-[CompletionGroupListing updateWithQuery:](self->_listingOnDisplay, "updateWithQuery:", self->_query))
            objc_msgSend(WeakRetained, "completionListDidUpdate:forQuery:", self, self->_query);
          goto LABEL_50;
        }
        v72 = v13;
        v73 = v16;
        objc_storeStrong((id *)&self->_listingOnDisplay, v16);
        v75 = v14;
        objc_storeStrong((id *)&self->_cfListingOnDisplay, v14);
        -[CompletionGroupListing groups](self->_listingOnDisplay, "groups");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v11;
        v33 = v17;
        v34 = -[NSMutableDictionary copy](self->_rankingFeedbackForHiddenOrDuplicateResults, "copy");
        -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v9;
        objc_msgSend(v9, "timeIntervalSinceNow");
        v37 = -v36;
        v38 = -[WBSCompletionQuery queryID](self->_query, "queryID");
        -[CompletionGroupListing hiddenIgnoredSiriSuggestedSite](self->_listingOnDisplay, "hiddenIgnoredSiriSuggestedSite");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)v31;
        v40 = v31;
        v41 = (void *)v34;
        v17 = v33;
        objc_msgSend(v35, "didRankSections:blendingDuration:feedbackForHiddenAndDuplicateResults:forQueryID:hiddenIgnoredSiriSuggestedSite:", v40, v41, v38, v39, v37);

        if (!v32)
        {
LABEL_49:
          objc_msgSend(WeakRetained, "completionListDidUpdate:forQuery:", self, self->_query);
          -[CompletionList _requestFavicons](self, "_requestFavicons");

          v14 = v75;
          v9 = v76;
          v16 = v73;
LABEL_50:

          goto LABEL_51;
        }
        if (v72)
        {
          v42 = 0;
          v43 = v72;
LABEL_48:
          -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "triggeredExperimentWithTreatmentId:withQueryID:cfDiffered:cfUsed:cfError:", self->_treatmentId, -[WBSCompletionQuery queryID](self->_query, "queryID"), v42, 1, v43);

          goto LABEL_49;
        }
        -[CompletionGroupListing groups](self->_cfListingOnDisplay, "groups");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[CompletionGroupListing groups](self->_listingOnDisplay, "groups");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v44;
        v47 = v45;
        v48 = objc_msgSend(v46, "count");
        v49 = objc_msgSend(v47, "count");
        v50 = v48 == v49;
        v42 = v48 != v49;
        if (v50)
        {
          if (objc_msgSend(v46, "count"))
          {
            v51 = 0;
            v68 = v46;
            v69 = v47;
            while (1)
            {
              objc_msgSend(v46, "objectAtIndexedSubscript:", v51);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "title");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "objectAtIndexedSubscript:", v51);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "title");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = WBSIsEqual();

              v71 = v55;
              if (!v55)
              {
LABEL_43:
                v42 = v71 ^ 1u;
                goto LABEL_46;
              }
              objc_msgSend(v46, "objectAtIndexedSubscript:", v51);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "completions");
              v57 = v51;
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              v59 = v57;
              objc_msgSend(v47, "objectAtIndexedSubscript:", v57);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "completions");
              v61 = (void *)objc_claimAutoreleasedReturnValue();

              v62 = objc_msgSend(v58, "count");
              if (v62 != objc_msgSend(v61, "count"))
                goto LABEL_44;
              if (objc_msgSend(v58, "count"))
                break;
LABEL_42:

              v51 = v59 + 1;
              v46 = v68;
              v47 = v69;
              if (v51 >= objc_msgSend(v68, "count"))
                goto LABEL_43;
            }
            v63 = 0;
            while (1)
            {
              objc_msgSend(v58, "objectAtIndexedSubscript:", v63);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectAtIndexedSubscript:", v63);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v64, "isEquivalentTo:", v65);

              if ((v66 & 1) == 0)
                break;
              if (++v63 >= (unint64_t)objc_msgSend(v58, "count"))
                goto LABEL_42;
            }
LABEL_44:

            v42 = 1;
            v43 = 0;
            v46 = v68;
            v47 = v69;
            goto LABEL_47;
          }
          v42 = 0;
        }
LABEL_46:
        v43 = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {
      v13 = 0;
    }
    v14 = 0;
    goto LABEL_9;
  }
LABEL_52:

}

- (void)clearCompletionListings
{
  WBSCompletionQuery *query;
  CompletionGroupListing *currentListing;
  CompletionGroupListing *listingOnDisplay;
  CompletionGroupListing *cfListingOnDisplay;
  CompletionGroupListing *currentCFListing;
  id WeakRetained;

  query = self->_query;
  self->_query = 0;

  currentListing = self->_currentListing;
  self->_currentListing = 0;

  listingOnDisplay = self->_listingOnDisplay;
  self->_listingOnDisplay = 0;

  cfListingOnDisplay = self->_cfListingOnDisplay;
  self->_cfListingOnDisplay = 0;

  currentCFListing = self->_currentCFListing;
  self->_currentCFListing = 0;

  self->_haveReceivedNetworkedSuggestions = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "completionListDidUpdate:forQuery:", self, self->_query);

}

- (BOOL)_searchRenderTimeoutHasElapsed
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  BOOL v11;

  -[NSDate timeIntervalSinceNow](self->_searchRenderTimeoutStartTime, "timeIntervalSinceNow");
  v4 = -v3;
  -[UniversalSearchCompletionProvider searchRenderTimeout](self->_universalSearchProvider, "searchRenderTimeout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  if (v6 / 1000.0 >= v4)
  {
    v11 = 0;
  }
  else
  {
    -[NSDate timeIntervalSinceNow](self->_minRenderTimeoutStartTime, "timeIntervalSinceNow");
    v8 = -v7;
    -[UniversalSearchCompletionProvider minRenderTimeout](self->_universalSearchProvider, "minRenderTimeout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10 / 1000.0 < v8;

  }
  return v11;
}

+ (id)completionBookmarkProvider
{
  if (completionBookmarkProvider_onceToken != -1)
    dispatch_once(&completionBookmarkProvider_onceToken, &__block_literal_global_71);
  return (id)completionBookmarkProvider_bookmarkProvider;
}

void __44__CompletionList_completionBookmarkProvider__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0DCCBA8]), "initReadonlySafariBookmarkCollection");
  v1 = (void *)completionBookmarkProvider_bookmarkProvider;
  completionBookmarkProvider_bookmarkProvider = v0;

}

- (void)_updateProviders
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSArray *v7;
  NSArray *searchParametersList;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *treatmentId;
  URLCompletionProvider *URLCompletionProvider;
  void *v16;
  URLCompletionProvider *v17;
  void *v18;
  void *v19;
  URLCompletionProvider *v20;
  URLCompletionProvider *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  UniversalSearchCompletionProvider *v28;
  UniversalSearchCompletionProvider *universalSearchProvider;
  UniversalSearchCompletionProvider *v30;
  PencilInputCompletionProvider *v31;
  PencilInputCompletionProvider *pencilInputCompletionProvider;
  SearchSuggestionProvider *suggestionProvider;
  SearchSuggestionProvider *v34;
  SearchSuggestionProvider *v35;
  void *v36;
  id v37;
  URLCompletionProvider *v38;
  WBSCompletionQuery *rewrittenQuery;
  void *v40;
  void *v41;
  id v42;
  id v43;
  NSDate *searchRenderTimeoutStartTime;
  NSDate *otherRenderTimeoutStartTime;
  NSDate *v46;
  NSDate *minRenderTimeoutStartTime;
  FindOnPageCompletionProvider *findOnPageProvider;
  FindOnPageCompletionProvider *v49;
  FindOnPageCompletionProvider *v50;
  id v51;
  QuickWebsiteSearchCompletionProvider *quickWebsiteSearchProvider;
  QuickWebsiteSearchCompletionProvider *v53;
  QuickWebsiteSearchCompletionProvider *v54;
  id v55;
  TabCompletionProvider *tabCompletionProvider;
  TabCompletionProvider *v57;
  TabCompletionProvider *v58;
  id v59;
  CalculationResultCompletionProvider *calculationResultProvider;
  CalculationResultCompletionProvider *v61;
  CalculationResultCompletionProvider *v62;
  id v63;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTabDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[Application sharedApplication](Application, "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunningPPT");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D8AC38], "searchParameters");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    searchParametersList = self->_searchParametersList;
    self->_searchParametersList = v7;

    objc_msgSend(MEMORY[0x1E0D8AD60], "shared");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(MEMORY[0x1E0D8AD60], "shared");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "treatmentId");
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        treatmentId = self->_treatmentId;
        self->_treatmentId = v13;

      }
    }
  }
  URLCompletionProvider = self->_URLCompletionProvider;
  if (!URLCompletionProvider)
  {
    objc_msgSend(v3, "profileCloudTabStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [URLCompletionProvider alloc];
    objc_msgSend((id)objc_opt_class(), "completionBookmarkProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeProfileIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[URLCompletionProvider initWithBookmarkProvider:cloudTabStore:profileIdentifier:maxResults:searchableCollectionsMask:](v17, "initWithBookmarkProvider:cloudTabStore:profileIdentifier:maxResults:searchableCollectionsMask:", v18, v16, v19, 16, 7);
    v21 = self->_URLCompletionProvider;
    self->_URLCompletionProvider = v20;

    -[CompletionProvider setDelegate:](self->_URLCompletionProvider, "setDelegate:", self);
    -[URLCompletionProvider setProvidesTopHits:](self->_URLCompletionProvider, "setProvidesTopHits:", 1);

    URLCompletionProvider = self->_URLCompletionProvider;
  }
  -[URLCompletionProvider setSearchParametersList:](URLCompletionProvider, "setSearchParametersList:", self->_searchParametersList);
  if (!self->_universalSearchProvider && self->_parsecSearchSession)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "historyController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeProfileIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = v24;
    else
      v26 = *MEMORY[0x1E0D89E20];
    objc_msgSend(v23, "frequentlyVisitedSitesControllerForProfileIdentifier:loadIfNeeded:", v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = -[UniversalSearchCompletionProvider initWithFrequentlyVisitedSitesController:]([UniversalSearchCompletionProvider alloc], "initWithFrequentlyVisitedSitesController:", v27);
    universalSearchProvider = self->_universalSearchProvider;
    self->_universalSearchProvider = v28;

    -[CompletionProvider setDelegate:](self->_universalSearchProvider, "setDelegate:", self);
  }
  if (!self->_parsecSearchSession)
  {
    -[CompletionProvider setDelegate:](self->_universalSearchProvider, "setDelegate:", 0);
    v30 = self->_universalSearchProvider;
    self->_universalSearchProvider = 0;

  }
  if (!self->_pencilInputCompletionProvider)
  {
    v31 = objc_alloc_init(PencilInputCompletionProvider);
    pencilInputCompletionProvider = self->_pencilInputCompletionProvider;
    self->_pencilInputCompletionProvider = v31;

    -[CompletionProvider setDelegate:](self->_pencilInputCompletionProvider, "setDelegate:", self);
  }
  suggestionProvider = self->_suggestionProvider;
  if (self->_shouldIncludeNetworkedSearchSuggestions)
  {
    if (!suggestionProvider)
    {
      v34 = -[SearchSuggestionProvider initForPrivateBrowsing:]([SearchSuggestionProvider alloc], "initForPrivateBrowsing:", objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"));
      v35 = self->_suggestionProvider;
      self->_suggestionProvider = v34;

      -[CompletionProvider setDelegate:](self->_suggestionProvider, "setDelegate:", self);
      v36 = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
      -[SearchSuggestionProvider setLoadProgressObserver:](self->_suggestionProvider, "setLoadProgressObserver:", v36);
LABEL_22:

    }
  }
  else if (suggestionProvider)
  {
    -[SearchSuggestionProvider stop](suggestionProvider, "stop");
    -[CompletionProvider setDelegate:](self->_suggestionProvider, "setDelegate:", 0);
    -[SearchSuggestionProvider setLoadProgressObserver:](self->_suggestionProvider, "setLoadProgressObserver:", 0);
    v36 = self->_suggestionProvider;
    self->_suggestionProvider = 0;
    goto LABEL_22;
  }
  if (-[CompletionList _shouldFetchSearchSuggestions](self, "_shouldFetchSearchSuggestions")
    && -[CompletionList _canUseOfflineSearchSuggestions](self, "_canUseOfflineSearchSuggestions"))
  {
    v37 = -[CompletionProvider completionsForQuery:](self->_offlineSearchSuggestionsCompletionProvider, "completionsForQuery:", self->_query);
  }
  -[URLCompletionProvider setParsecSearchSession:](self->_URLCompletionProvider, "setParsecSearchSession:", self->_parsecSearchSession);
  -[UniversalSearchCompletionProvider setParsecSearchSession:](self->_universalSearchProvider, "setParsecSearchSession:", self->_parsecSearchSession);
  -[SearchSuggestionProvider setUniversalSearchSession:](self->_suggestionProvider, "setUniversalSearchSession:", self->_parsecSearchSession);
  v38 = self->_URLCompletionProvider;
  rewrittenQuery = self->_rewrittenQuery;
  if (!rewrittenQuery)
    rewrittenQuery = self->_query;
  -[NSArray firstObject](self->_searchParametersList, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[URLCompletionProvider completionsForQuery:isCFSearch:](v38, "completionsForQuery:isCFSearch:", rewrittenQuery, objc_msgSend(v40, "isCFSearch"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = -[CompletionProvider completionsForQuery:](self->_suggestionProvider, "completionsForQuery:", self->_query);
  v43 = -[UniversalSearchCompletionProvider completionsForQuery:](self->_universalSearchProvider, "completionsForQuery:", self->_query);
  searchRenderTimeoutStartTime = self->_searchRenderTimeoutStartTime;
  self->_searchRenderTimeoutStartTime = 0;

  otherRenderTimeoutStartTime = self->_otherRenderTimeoutStartTime;
  self->_otherRenderTimeoutStartTime = 0;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v46 = (NSDate *)objc_claimAutoreleasedReturnValue();
  minRenderTimeoutStartTime = self->_minRenderTimeoutStartTime;
  self->_minRenderTimeoutStartTime = v46;

  if (self->_findOnPageProvider || (objc_msgSend(v4, "isBlank") & 1) != 0)
  {
    if (objc_msgSend(v4, "isBlank"))
    {
      findOnPageProvider = self->_findOnPageProvider;
      self->_findOnPageProvider = 0;

    }
  }
  else
  {
    v49 = objc_alloc_init(FindOnPageCompletionProvider);
    v50 = self->_findOnPageProvider;
    self->_findOnPageProvider = v49;

    -[CompletionProvider setDelegate:](self->_findOnPageProvider, "setDelegate:", self);
    -[FindOnPageCompletionProvider setDataSource:](self->_findOnPageProvider, "setDataSource:", self);
  }
  v51 = -[FindOnPageCompletionProvider completionsForQuery:](self->_findOnPageProvider, "completionsForQuery:", self->_query);
  quickWebsiteSearchProvider = self->_quickWebsiteSearchProvider;
  if (!quickWebsiteSearchProvider)
  {
    v53 = objc_alloc_init(QuickWebsiteSearchCompletionProvider);
    v54 = self->_quickWebsiteSearchProvider;
    self->_quickWebsiteSearchProvider = v53;

    -[CompletionProvider setDelegate:](self->_quickWebsiteSearchProvider, "setDelegate:", self);
    quickWebsiteSearchProvider = self->_quickWebsiteSearchProvider;
  }
  v55 = -[CompletionProvider completionsForQuery:](quickWebsiteSearchProvider, "completionsForQuery:", self->_query);
  tabCompletionProvider = self->_tabCompletionProvider;
  if (!tabCompletionProvider)
  {
    v57 = objc_alloc_init(TabCompletionProvider);
    v58 = self->_tabCompletionProvider;
    self->_tabCompletionProvider = v57;

    -[CompletionProvider setDelegate:](self->_tabCompletionProvider, "setDelegate:", self);
    -[TabCompletionProvider setTabCompletionProviderDataSource:](self->_tabCompletionProvider, "setTabCompletionProviderDataSource:", self);
    tabCompletionProvider = self->_tabCompletionProvider;
  }
  v59 = -[CompletionProvider completionsForQuery:](tabCompletionProvider, "completionsForQuery:", self->_query);
  calculationResultProvider = self->_calculationResultProvider;
  if (!calculationResultProvider)
  {
    v61 = objc_alloc_init(CalculationResultCompletionProvider);
    v62 = self->_calculationResultProvider;
    self->_calculationResultProvider = v61;

    -[CompletionProvider setDelegate:](self->_calculationResultProvider, "setDelegate:", self);
    calculationResultProvider = self->_calculationResultProvider;
  }
  v63 = -[CompletionProvider completionsForQuery:](calculationResultProvider, "completionsForQuery:", self->_query);

}

- (void)setQuery:(id)a3
{
  WBSCompletionQuery *v5;
  void *v6;
  CompletionProvider *firstRemoteCompletionProviderToRespondToQuery;
  WBSCompletionQuery *rewrittenQuery;
  id WeakRetained;
  NSSet *siriSuggestedSitesURLStringsToIgnore;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CompletionGroupListing *listingOnDisplay;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  CompletionGroupListing *v21;
  CompletionGroupListing *currentCFListing;
  CompletionGroupListing *v23;
  CompletionGroupListing *currentListing;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  NSTimer *v30;
  NSTimer *parsecTimeout;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  id location;

  v5 = (WBSCompletionQuery *)a3;
  if (self->_query != v5)
  {
    objc_storeStrong((id *)&self->_query, a3);
    -[WBSCompletionQuery queryString](v5, "queryString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_inputTypeOfStringToComplete = WBSUnifiedFieldInputTypeForString();

    -[CompletionList _updateProviders](self, "_updateProviders");
    firstRemoteCompletionProviderToRespondToQuery = self->_firstRemoteCompletionProviderToRespondToQuery;
    self->_firstRemoteCompletionProviderToRespondToQuery = 0;

    self->_tryParsecRewritesIfNoTopHit = 0;
    rewrittenQuery = self->_rewrittenQuery;
    self->_rewrittenQuery = 0;

    -[CompletionList clearCachedSearchQuery](self, "clearCachedSearchQuery");
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    siriSuggestedSitesURLStringsToIgnore = self->_siriSuggestedSitesURLStringsToIgnore;
    self->_siriSuggestedSitesURLStringsToIgnore = 0;

    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D8A9B8], "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "tabController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeProfileIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCompletionQuery queryString](v5, "queryString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __27__CompletionList_setQuery___block_invoke;
    v33[3] = &unk_1E9CFAA40;
    objc_copyWeak(&v34, &location);
    objc_msgSend(v11, "getIgnoredSiriSuggestedSitesURLStringsInProfile:withQuery:completionHandler:", v13, v14, v33);

    listingOnDisplay = self->_listingOnDisplay;
    v17 = (!listingOnDisplay || -[CompletionGroupListing isEmpty](listingOnDisplay, "isEmpty"))
       && !self->_executingVoiceSearch;
    if (objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"))
      v17 |= 2uLL;
    objc_msgSend(MEMORY[0x1E0D8AC38], "searchParameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isCFSearch");

    if (v20)
    {
      v21 = -[CompletionGroupListing initWithQuery:titleProvider:options:]([CompletionGroupListing alloc], "initWithQuery:titleProvider:options:", self->_query, self, v17);
      currentCFListing = self->_currentCFListing;
      self->_currentCFListing = v21;

    }
    v23 = -[CompletionGroupListing initWithQuery:titleProvider:options:]([CompletionGroupListing alloc], "initWithQuery:titleProvider:options:", self->_query, self, v17);
    currentListing = self->_currentListing;
    self->_currentListing = v23;

    -[CompletionList _updateCompletionListing](self, "_updateCompletionListing");
    -[NSTimer invalidate](self->_parsecTimeout, "invalidate");
    -[UniversalSearchCompletionProvider minRenderTimeout](self->_universalSearchProvider, "minRenderTimeout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "integerValue");

    if (v26 < *MEMORY[0x1E0D8B200] || v26 > *MEMORY[0x1E0D8B208])
    {
      v28 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      v27 = *MEMORY[0x1E0D8B1D0];
      if (v29)
        -[CompletionList setQuery:].cold.1(v26, *MEMORY[0x1E0D8B1D0], v28);
    }
    else
    {
      v27 = v26;
    }
    v32[0] = v15;
    v32[1] = 3221225472;
    v32[2] = __27__CompletionList_setQuery___block_invoke_85;
    v32[3] = &unk_1E9CF6FB8;
    v32[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v32, (double)v27 / 1000.0);
    v30 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    parsecTimeout = self->_parsecTimeout;
    self->_parsecTimeout = v30;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

  }
}

void __27__CompletionList_setQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[28], "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = WBSIsEqual();

    if (v9)
      objc_storeStrong(v7 + 22, a3);
  }

}

uint64_t __27__CompletionList_setQuery___block_invoke_85(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  NSObject *v5;
  uint8_t v6[16];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "isAwaitingParsec");
  if ((_DWORD)result)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "Timed out waiting for Parsec results", v6, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "markParsecResultsReceived");
    return objc_msgSend(*(id *)(a1 + 32), "_updateCompletionListing");
  }
  return result;
}

- (void)setParsecSearchSession:(id)a3
{
  UniversalSearchSession *v5;

  v5 = (UniversalSearchSession *)a3;
  if (self->_parsecSearchSession != v5)
  {
    objc_storeStrong((id *)&self->_parsecSearchSession, a3);
    -[CompletionList _updateProviders](self, "_updateProviders");
    if (!self->_parsecSearchSession)
    {
      if (-[CompletionGroupListing numberOfGroups](self->_listingOnDisplay, "numberOfGroups"))
        -[CompletionList _updateCompletionListing](self, "_updateCompletionListing");
    }
  }

}

- (void)setLoadProgressObserver:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_loadProgressObserver, obj);
    -[SearchSuggestionProvider setLoadProgressObserver:](self->_suggestionProvider, "setLoadProgressObserver:", obj);
  }

}

- (BOOL)_topHitMatchesString:(id)a3
{
  id v4;
  NSString *stringMatchedByTopHit;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  stringMatchedByTopHit = self->_stringMatchedByTopHit;
  if (!stringMatchedByTopHit)
    goto LABEL_8;
  if (-[NSString isEqualToString:](stringMatchedByTopHit, "isEqualToString:", v4))
  {
    v6 = 1;
    goto LABEL_13;
  }
  if (!self->_topHit)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_13;
  }
  -[CompletionGroupListing topHit](self->_currentListing, "topHit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CompletionItem isEquivalentTo:](self->_topHit, "isEquivalentTo:", v7))
  {
    -[WBSCompletionQuery queryString](self->_rewrittenQuery, "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v6 = 1;
    }
    else
    {
      -[WBSCompletionQuery queryString](self->_query, "queryString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9 != 0;

    }
  }
  else
  {
    v6 = -[NSString safari_hasCaseInsensitivePrefix:](self->_matchingStringInTopHit, "safari_hasCaseInsensitivePrefix:", v4);
  }

LABEL_13:
  return v6;
}

- (id)topHitForString:(id)a3
{
  CompletionItem *v4;

  if (-[CompletionList _topHitMatchesString:](self, "_topHitMatchesString:", a3))
    v4 = self->_topHit;
  else
    v4 = 0;
  return v4;
}

- (BOOL)isTopHitReadyForString:(id)a3
{
  return !self->_query || -[CompletionList _topHitMatchesString:](self, "_topHitMatchesString:", a3);
}

- (void)completionProvider:(id)a3 didFinishCompletingString:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  UniversalSearchCompletionProvider *v11;
  void *v12;
  uint64_t v13;
  NSDate *v14;
  NSDate *searchRenderTimeoutStartTime;
  void *v16;
  void *v17;
  void *otherRenderTimeoutStartTime;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDate *v24;
  int v25;
  _BOOL4 v26;
  SearchSuggestionProvider *v27;

  v27 = (SearchSuggestionProvider *)a3;
  v7 = a4;
  -[WBSCompletionQuery queryString](self->_query, "queryString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {

  }
  else
  {
    -[WBSCompletionQuery queryString](self->_rewrittenQuery, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if (!v10)
      goto LABEL_29;
  }
  if (self->_queryRestorationCompletionItem)
    goto LABEL_29;
  v11 = (UniversalSearchCompletionProvider *)v27;
  if (self->_suggestionProvider == v27 && !self->_firstRemoteCompletionProviderToRespondToQuery)
  {
    -[UniversalSearchCompletionProvider searchRenderTimeout](self->_universalSearchProvider, "searchRenderTimeout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    v11 = (UniversalSearchCompletionProvider *)v27;
    if (v13)
    {
      objc_storeStrong((id *)&self->_firstRemoteCompletionProviderToRespondToQuery, a3);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      searchRenderTimeoutStartTime = self->_searchRenderTimeoutStartTime;
      self->_searchRenderTimeoutStartTime = v14;

      v11 = (UniversalSearchCompletionProvider *)v27;
    }
  }
  if (self->_universalSearchProvider == v11)
  {
    -[SearchSuggestionProvider parsecSearchSession](v27, "parsecSearchSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rewrittenQueryStringFromParsec");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      self->_tryParsecRewritesIfNoTopHit = 1;
    if (self->_firstRemoteCompletionProviderToRespondToQuery
      || (-[UniversalSearchCompletionProvider otherRenderTimeout](self->_universalSearchProvider, "otherRenderTimeout"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "integerValue"),
          v22,
          v23 < 1))
    {
      if (!self->_searchRenderTimeoutStartTime
        || !-[CompletionList _searchRenderTimeoutHasElapsed](self, "_searchRenderTimeoutHasElapsed"))
      {
        goto LABEL_19;
      }
      -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
      otherRenderTimeoutStartTime = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x1E0D8C658]);
      -[CompletionProvider completionsForQuery:](v27, "completionsForQuery:", self->_query);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithResults:", v20);
      objc_msgSend(otherRenderTimeoutStartTime, "postFeedback:forQueryID:", v21, -[WBSCompletionQuery queryID](self->_query, "queryID"));

    }
    else
    {
      objc_storeStrong((id *)&self->_firstRemoteCompletionProviderToRespondToQuery, a3);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (NSDate *)objc_claimAutoreleasedReturnValue();
      otherRenderTimeoutStartTime = self->_otherRenderTimeoutStartTime;
      self->_otherRenderTimeoutStartTime = v24;
    }

  }
LABEL_19:
  if (-[CompletionGroupListing isAwaitingParsec](self->_currentListing, "isAwaitingParsec")
    || -[CompletionGroupListing isAwaitingCompletionDatabase](self->_currentListing, "isAwaitingCompletionDatabase"))
  {
    v25 = 0;
  }
  else
  {
    v25 = !-[CompletionGroupListing isAwaitingTabCompletion](self->_currentListing, "isAwaitingTabCompletion");
  }
  if (self->_suggestionProvider == v27)
  {
    v26 = 1;
    if (!v25)
    {
LABEL_28:
      -[CompletionList _updateCompletionListing](self, "_updateCompletionListing");
      goto LABEL_29;
    }
  }
  else
  {
    v26 = self->_offlineSearchSuggestionsCompletionProvider == (OfflineSearchSuggestionsCompletionProvider *)v27;
    if (!v25)
      goto LABEL_28;
  }
  if (!-[CompletionGroupListing isAwaitingSearchProvider](self->_currentListing, "isAwaitingSearchProvider") || v26)
    goto LABEL_28;
LABEL_29:

}

- (id)windowHostingCompletionProvider:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentSearchEngineHostSuffixes
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "activeSearchEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostSuffixes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)numberOfGroups
{
  return -[CompletionGroupListing numberOfGroups](self->_listingOnDisplay, "numberOfGroups");
}

- (id)_groupOrNilAtIndex:(unint64_t)a3
{
  return -[CompletionGroupListing groupAtIndex:](self->_listingOnDisplay, "groupAtIndex:", a3);
}

- (id)defaultSectionTitleForGroupAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[CompletionList _groupOrNilAtIndex:](self, "_groupOrNilAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultHeaderTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)titleForGroupAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[CompletionList _groupOrNilAtIndex:](self, "_groupOrNilAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)completionsForGroupAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[CompletionList _groupOrNilAtIndex:](self, "_groupOrNilAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)headerViewReuseIdentifierForGroupAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[CompletionList _groupOrNilAtIndex:](self, "_groupOrNilAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerViewReuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)headerViewForGroupAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[CompletionList _groupOrNilAtIndex:](self, "_groupOrNilAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)configureHeaderView:(id)a3 forGroupAtIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CompletionList _groupOrNilAtIndex:](self, "_groupOrNilAtIndex:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureHeaderView:forCompletionList:", v6, self);

}

- (BOOL)hasCompletions
{
  CompletionGroupListing *listingOnDisplay;

  listingOnDisplay = self->_listingOnDisplay;
  if (listingOnDisplay)
    LOBYTE(listingOnDisplay) = !-[CompletionGroupListing isEmpty](listingOnDisplay, "isEmpty");
  return (char)listingOnDisplay;
}

- (void)setShouldIncludeNetworkedSearchSuggestions:(BOOL)a3
{
  if (self->_shouldIncludeNetworkedSearchSuggestions != a3)
  {
    self->_shouldIncludeNetworkedSearchSuggestions = a3;
    -[CompletionList _updateProviders](self, "_updateProviders");
    -[CompletionList _updateCompletionListing](self, "_updateCompletionListing");
  }
}

- (void)stopCompleting
{
  SearchSuggestionProvider *suggestionProvider;
  FindOnPageCompletionProvider *findOnPageProvider;
  UniversalSearchCompletionProvider *universalSearchProvider;
  TabCompletionProvider *tabCompletionProvider;
  CalculationResultCompletionProvider *calculationResultProvider;
  CompletionGroupListing *listingOnDisplay;
  WBSCompletionQuery *query;

  -[SearchSuggestionProvider stop](self->_suggestionProvider, "stop");
  -[CompletionProvider setDelegate:](self->_suggestionProvider, "setDelegate:", 0);
  suggestionProvider = self->_suggestionProvider;
  self->_suggestionProvider = 0;

  -[CompletionProvider setDelegate:](self->_findOnPageProvider, "setDelegate:", 0);
  findOnPageProvider = self->_findOnPageProvider;
  self->_findOnPageProvider = 0;

  -[URLCompletionProvider clearCachedCompletions](self->_URLCompletionProvider, "clearCachedCompletions");
  -[CompletionProvider setDelegate:](self->_universalSearchProvider, "setDelegate:", 0);
  universalSearchProvider = self->_universalSearchProvider;
  self->_universalSearchProvider = 0;

  -[CompletionProvider setDelegate:](self->_tabCompletionProvider, "setDelegate:", 0);
  -[TabCompletionProvider setTabCompletionProviderDataSource:](self->_tabCompletionProvider, "setTabCompletionProviderDataSource:", 0);
  tabCompletionProvider = self->_tabCompletionProvider;
  self->_tabCompletionProvider = 0;

  -[CompletionProvider setDelegate:](self->_calculationResultProvider, "setDelegate:", 0);
  calculationResultProvider = self->_calculationResultProvider;
  self->_calculationResultProvider = 0;

  listingOnDisplay = self->_listingOnDisplay;
  self->_listingOnDisplay = 0;

  query = self->_query;
  self->_query = 0;

}

- (void)updateRestorationCompletionItemForCompletionItem:(id)a3 isCF:(BOOL)a4
{
  uint64_t v5;
  SearchQueryRestorationCompletionItem *v6;
  CompletionGroupListing *listingOnDisplay;
  CompletionGroupListing *v8;
  SearchQueryRestorationCompletionItem *v9;
  void *v10;

  if (a4)
    v5 = 24;
  else
    v5 = 32;
  v6 = (SearchQueryRestorationCompletionItem *)*(id *)((char *)&self->super.isa + v5);
  listingOnDisplay = self->_listingOnDisplay;
  -[SearchQueryRestorationCompletionItem listingToRestore](v6, "listingToRestore");
  v8 = (CompletionGroupListing *)objc_claimAutoreleasedReturnValue();

  if (listingOnDisplay != v8)
  {
    v9 = -[SearchQueryRestorationCompletionItem initWithQuery:]([SearchQueryRestorationCompletionItem alloc], "initWithQuery:", self->_query);

    -[SearchQueryRestorationCompletionItem setListingToRestore:](v9, "setListingToRestore:", self->_listingOnDisplay);
    v6 = v9;
  }
  v10 = *(Class *)((char *)&self->super.isa + v5);
  *(Class *)((char *)&self->super.isa + v5) = (Class)v6;

}

- (void)cacheCurrentCompletionsAfterAcceptanceOfCompletionItem:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[CompletionList updateRestorationCompletionItemForCompletionItem:isCF:](self, "updateRestorationCompletionItemForCompletionItem:isCF:");
  -[NSArray firstObject](self->_searchParametersList, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCFSearch");

  if (v5)
    -[CompletionList updateRestorationCompletionItemForCompletionItem:isCF:](self, "updateRestorationCompletionItemForCompletionItem:isCF:", v6, 1);

}

- (void)restoreCachedCompletions
{
  CompletionGroupListing *v3;
  CompletionGroupListing *listingOnDisplay;
  void *v5;
  int v6;
  CompletionGroupListing *v7;
  CompletionGroupListing *cfListingOnDisplay;
  id v9;
  void *v10;
  void *v11;
  WBSCompletionQuery *v12;
  WBSCompletionQuery *query;
  id WeakRetained;

  -[SearchQueryRestorationCompletionItem listingToRestore](self->_queryRestorationCompletionItem, "listingToRestore");
  v3 = (CompletionGroupListing *)objc_claimAutoreleasedReturnValue();
  listingOnDisplay = self->_listingOnDisplay;
  self->_listingOnDisplay = v3;

  -[NSArray firstObject](self->_searchParametersList, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCFSearch");

  if (v6)
  {
    -[SearchQueryRestorationCompletionItem listingToRestore](self->_cfQueryRestorationCompletionItem, "listingToRestore");
    v7 = (CompletionGroupListing *)objc_claimAutoreleasedReturnValue();
    cfListingOnDisplay = self->_cfListingOnDisplay;
    self->_cfListingOnDisplay = v7;

  }
  v9 = objc_alloc(MEMORY[0x1E0D8A860]);
  -[SearchQueryRestorationCompletionItem queryToRestore](self->_queryRestorationCompletionItem, "queryToRestore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (WBSCompletionQuery *)objc_msgSend(v9, "initWithQueryString:triggerEvent:", v11, 26);
  query = self->_query;
  self->_query = v12;

  -[CompletionList _updateQueryIDForGroups](self, "_updateQueryIDForGroups");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "completionListDidRestoreCachedCompletions:", self);

}

- (void)_updateQueryIDForGroups
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CompletionGroupListing groups](self->_listingOnDisplay, "groups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        objc_msgSend(v8, "completions", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v15;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v15 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setParsecQueryID:", -[WBSCompletionQuery queryID](self->_query, "queryID"));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

}

- (void)didResumeSearchWithQuery:(id)a3
{
  CompletionGroupListing *listingOnDisplay;
  id v5;
  id v6;
  void *v7;
  WBSCompletionQuery *v8;
  WBSCompletionQuery *query;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  listingOnDisplay = self->_listingOnDisplay;
  v5 = a3;
  -[CompletionGroupListing groups](listingOnDisplay, "groups");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D8A860]);
  objc_msgSend(v5, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (WBSCompletionQuery *)objc_msgSend(v6, "initWithQueryString:", v7);
  query = self->_query;
  self->_query = v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "effectiveProfileIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCompletionQuery setProfileIdentifierToFilterResults:](self->_query, "setProfileIdentifierToFilterResults:", v11);

  -[CompletionList _updateQueryIDForGroups](self, "_updateQueryIDForGroups");
  -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WBSCompletionQuery queryID](self->_query, "queryID");
  -[CompletionGroupListing hiddenIgnoredSiriSuggestedSite](self->_listingOnDisplay, "hiddenIgnoredSiriSuggestedSite");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didRankSections:blendingDuration:feedbackForHiddenAndDuplicateResults:forQueryID:hiddenIgnoredSiriSuggestedSite:", v15, 0, v13, v14, 0.0);

}

- (void)clearCachedSearchQuery
{
  SearchQueryRestorationCompletionItem *queryRestorationCompletionItem;

  queryRestorationCompletionItem = self->_queryRestorationCompletionItem;
  self->_queryRestorationCompletionItem = 0;

}

- (void)clearCachedSearches
{
  -[CompletionProvider clearCachedCompletions](self->_suggestionProvider, "clearCachedCompletions");
}

- (void)clearCachedTabCompletionData
{
  -[TabCompletionProvider invalidateCachedTabData](self->_tabCompletionProvider, "invalidateCachedTabData");
}

- (id)swipeActionsForCompletionItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "row");
  if (v5 != -[CompletionGroupListing indexOfTopHitsGroup](self->_listingOnDisplay, "indexOfTopHitsGroup"))
    goto LABEL_10;
  -[CompletionGroupListing parsecTopHits](self->_listingOnDisplay, "parsecTopHits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

LABEL_10:
    v21 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  -[CompletionGroupListing localTopHits](self->_listingOnDisplay, "localTopHits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v6 >= v9)
    goto LABEL_10;
  -[CompletionGroupListing localTopHits](self->_listingOnDisplay, "localTopHits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v11, "isTopHit") & 1) == 0)
  {

    goto LABEL_10;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activeTabDocument");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "history");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "originalURLString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemForURLString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_initWeak(&location, self);
    v18 = (void *)MEMORY[0x1E0DC36C8];
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __59__CompletionList_swipeActionsForCompletionItemAtIndexPath___block_invoke;
    v26 = &unk_1E9CFAA68;
    objc_copyWeak(&v31, &location);
    v27 = v15;
    v28 = v17;
    v29 = v11;
    v30 = v4;
    objc_msgSend(v18, "contextualActionWithStyle:title:handler:", 1, v19, &v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1, v23, v24, v25, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C9AA60];
  }

LABEL_11:
  return v21;
}

void __59__CompletionList_swipeActionsForCompletionItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v10 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeItem:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "_removeIgnoredSiriSuggestedSiteRecordsForHistoryItem:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "_deleteTopHitCompletionItem:atIndexPath:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(WeakRetained[12], "localTopHits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v8 = WeakRetained[9];
    if (v8 == *(id *)(a1 + 48))
    {
      WeakRetained[9] = 0;

    }
    objc_msgSend(WeakRetained[32], "clearCachedCompletions");
    v9 = objc_loadWeakRetained(WeakRetained + 26);
    objc_msgSend(v9, "completionList:didRemoveItem:wasLastInSection:atIndexPath:withCompletionHandler:", WeakRetained, *(_QWORD *)(a1 + 48), v7 == 0, *(_QWORD *)(a1 + 56), v10);

  }
}

- (void)_deleteTopHitCompletionItem:(id)a3 atIndexPath:(id)a4
{
  CompletionGroupListing *listingOnDisplay;
  id v6;

  listingOnDisplay = self->_listingOnDisplay;
  v6 = a3;
  -[CompletionGroupListing deleteTopHit:atIndex:](listingOnDisplay, "deleteTopHit:atIndex:", v6, objc_msgSend(a4, "row"));

}

- (void)_requestFavicons
{
  NSCache *v3;
  NSCache *faviconCache;
  NSMutableDictionary *v5;
  NSMutableDictionary *urlStringToFaviconRequestTokens;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  void *v30;
  _QWORD v31[6];
  id v32;
  id location;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!self->_faviconCache)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    faviconCache = self->_faviconCache;
    self->_faviconCache = v3;

  }
  if (!self->_urlStringToFaviconRequestTokens)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    urlStringToFaviconRequestTokens = self->_urlStringToFaviconRequestTokens;
    self->_urlStringToFaviconRequestTokens = v5;

  }
  -[CompletionList _completionsRequiringFavicon](self, "_completionsRequiringFavicon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_95_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[NSMutableDictionary allKeys](self->_urlStringToFaviconRequestTokens, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        if ((objc_msgSend(v30, "containsObject:", v14) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_urlStringToFaviconRequestTokens, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "cancelRequestsWithTokens:", v16);

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_urlStringToFaviconRequestTokens, "setObject:forKeyedSubscript:", 0, v14);
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v11);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v7;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v20, "originalURLString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_alloc(MEMORY[0x1E0D8A8E8]);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithURL:iconSize:fallbackType:", v23, 0, 24.0, 24.0);

        v34 = 0;
        v35 = &v34;
        v36 = 0x2020000000;
        v37 = 1;
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __34__CompletionList__requestFavicons__block_invoke_2;
        v31[3] = &unk_1E9CFAAB0;
        objc_copyWeak(&v32, &location);
        v31[4] = v20;
        v31[5] = &v34;
        objc_msgSend(v25, "registerRequest:priority:responseHandler:", v24, 2, v31);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        *((_BYTE *)v35 + 24) = 0;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_urlStringToFaviconRequestTokens, "objectForKeyedSubscript:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_urlStringToFaviconRequestTokens, "objectForKeyedSubscript:", v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v26);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_urlStringToFaviconRequestTokens, "setObject:forKeyedSubscript:", v28, v21);
        }

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
        _Block_object_dispose(&v34, 8);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v17);
  }

}

uint64_t __34__CompletionList__requestFavicons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "originalURLString");
}

void __34__CompletionList__requestFavicons__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  id v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v3, "favicon");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(MEMORY[0x1E0D8A9C8], "resizedImage:withSize:", v5, 24.0, 24.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "sf_registerFaviconForDarkUserInterfaceStyleWithSize:", 24.0, 24.0);
      objc_msgSend(*(id *)(a1 + 32), "originalURLString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        v9 = (void *)*((_QWORD *)WeakRetained + 31);
        objc_msgSend(*(id *)(a1 + 32), "originalURLString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v7, v10);

      }
      else
      {
        v11 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __34__CompletionList__requestFavicons__block_invoke_2_cold_1(v11);
      }
      objc_msgSend(WeakRetained, "_indexPathForEquivalentCompletionItem:", *(_QWORD *)(a1 + 32));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        v14 = 1;
      else
        v14 = v12 == 0;
      if (!v14)
      {
        v15 = objc_loadWeakRetained((id *)WeakRetained + 26);
        objc_msgSend(v15, "completionList:didFetchFavicon:forRowAtIndexPath:", WeakRetained, v7, v13);

      }
    }
  }

}

- (id)_completionsRequiringFavicon
{
  void *v3;
  void *v4;

  -[CompletionGroupListing parsecTopHits](self->_listingOnDisplay, "parsecTopHits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[CompletionGroupListing localTopHits](self->_listingOnDisplay, "localTopHits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_indexPathForEquivalentCompletionItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;

  v4 = a3;
  -[CompletionGroupListing groups](self->_listingOnDisplay, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "completions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
        break;
LABEL_9:

      if (++v6 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_10;
    }
    v10 = 0;
    while (1)
    {
      objc_msgSend(v7, "completions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v4, "isEqual:", v12) & 1) != 0
        || (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "isEquivalentTo:", v12))
      {
        break;
      }

      ++v10;
      objc_msgSend(v7, "completions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v10 >= v14)
        goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v10, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_10:
    v15 = 0;
  }

  return v15;
}

- (NSIndexPath)indexPathOfAsTypedSearchSuggestion
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v3 = -[CompletionGroupListing indexOfSearchSuggestionsGroup](self->_listingOnDisplay, "indexOfSearchSuggestionsGroup");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    v5 = v3;
    -[CompletionGroupListing searchSuggestions](self->_listingOnDisplay, "searchSuggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCompletionQuery queryString](self->_query, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return (NSIndexPath *)v4;
}

- (BOOL)shouldOverrideBackgroundViewForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  BOOL v11;

  v4 = a3;
  -[CompletionList completionsForGroupAtIndex:](self, "completionsForGroupAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resultType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("maps"));

      if ((v9 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
  }
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
LABEL_8:
    v11 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v5, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10 != v4;

LABEL_9:
  return v11;
}

- (void)_updateOfflineSearchSuggestionAvailability
{
  OfflineSearchSuggestionsCompletionProvider *offlineSearchSuggestionsCompletionProvider;
  OfflineSearchSuggestionsCompletionProvider *v4;
  id WeakRetained;
  OfflineSearchSuggestionsCompletionProvider *v6;
  OfflineSearchSuggestionsCompletionProvider *v7;

  if (-[CompletionList _defaultSearchEngineIsGoogle](self, "_defaultSearchEngineIsGoogle"))
  {
    offlineSearchSuggestionsCompletionProvider = self->_offlineSearchSuggestionsCompletionProvider;
    if (offlineSearchSuggestionsCompletionProvider)
    {
      -[OfflineSearchSuggestionsCompletionProvider updateOfflineSearchSuggestionAvailability](offlineSearchSuggestionsCompletionProvider, "updateOfflineSearchSuggestionAvailability");
    }
    else
    {
      v4 = [OfflineSearchSuggestionsCompletionProvider alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      v6 = -[OfflineSearchSuggestionsCompletionProvider initWithMaximumNumberOfSuggestions:forPrivateBrowsing:](v4, "initWithMaximumNumberOfSuggestions:forPrivateBrowsing:", 9, objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"));
      v7 = self->_offlineSearchSuggestionsCompletionProvider;
      self->_offlineSearchSuggestionsCompletionProvider = v6;

      -[CompletionProvider setDelegate:](self->_offlineSearchSuggestionsCompletionProvider, "setDelegate:", self);
    }
  }
}

- (void)recordIgnoredSiriSuggestedSitesWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *ignoredSiriSuggestedSitesQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  CompletionList *v28;
  id v29;
  id v30;
  id v31;

  v4 = a3;
  -[CompletionGroupListing query](self->_listingOnDisplay, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeProfileIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CompletionGroupListing parsecTopHits](self->_listingOnDisplay, "parsecTopHits");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v13 = (void *)v10;
  else
    v13 = (void *)MEMORY[0x1E0C9AA60];
  v14 = v13;

  -[CompletionGroupListing topParsecResults](self->_listingOnDisplay, "topParsecResults");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v12;
  v18 = v17;

  ignoredSiriSuggestedSitesQueue = self->_ignoredSiriSuggestedSitesQueue;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__CompletionList_recordIgnoredSiriSuggestedSitesWithURL___block_invoke;
  v25[3] = &unk_1E9CF4E60;
  v26 = v14;
  v27 = v18;
  v28 = self;
  v29 = v4;
  v30 = v9;
  v31 = v6;
  v20 = v6;
  v21 = v9;
  v22 = v4;
  v23 = v18;
  v24 = v14;
  dispatch_async(ignoredSiriSuggestedSitesQueue, v25);

}

void __57__CompletionList_recordIgnoredSiriSuggestedSitesWithURL___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 48), "_isPegasusMapsCompositeResult:", v2) & 1) == 0)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = v2;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (!v4)
      goto LABEL_15;
    v5 = v4;
    v6 = *(_QWORD *)v30;
    v28 = v3;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v8, "resultType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual())
        {
          objc_msgSend(v8, "url");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = WBSIsEqual();

          if ((v11 & 1) != 0)
            continue;
          v12 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v13 = v12;
            objc_msgSend(v8, "url");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "absoluteString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = *(_QWORD *)(a1 + 64);
            v17 = *(_QWORD *)(a1 + 72);
            *(_DWORD *)buf = 138740483;
            v34 = v15;
            v35 = 2117;
            v36 = v16;
            v37 = 2117;
            v38 = v17;
            _os_log_impl(&dword_1D7CA3000, v13, OS_LOG_TYPE_INFO, "Recording an ignored Siri suggested site with URL: %{sensitive}@ profile: %{sensitive}@ query: %{sensitive}@.", buf, 0x20u);

          }
          objc_msgSend(MEMORY[0x1E0D8A9B8], "sharedController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "url");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "absoluteString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(_QWORD *)(a1 + 64);
          v21 = *(_QWORD *)(a1 + 72);
          objc_msgSend(*(id *)(a1 + 56), "absoluteString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addIgnoredSiriSuggestedSiteWithURLString:inProfile:withQuery:visitedURLString:", v19, v20, v21, v22);

          v3 = v28;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      if (!v5)
      {
LABEL_15:

        objc_msgSend(MEMORY[0x1E0D8A9B8], "sharedController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1 + 64);
        v24 = *(_QWORD *)(a1 + 72);
        objc_msgSend(*(id *)(a1 + 56), "absoluteString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:query:visitedURLString:", v25, v24, v26);

        v2 = v27;
        break;
      }
    }
  }

}

- (void)_removeIgnoredSiriSuggestedSiteRecordsForHistoryItem:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "url");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeProfileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userVisibleQueryFromSearchURL:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8A9B8], "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "removeIgnoredSiriSuggestedSitesInProfile:query:", v6, v8);
  }
  else
  {
    objc_msgSend(v12, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeIgnoredSiriSuggestedSitesInProfile:visitedURLHost:", v6, v11);

  }
}

- (BOOL)_isPegasusMapsCompositeResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v8 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0D8AA80];
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "typeForSFSearchResult:", v5) == 2)
    {
      v6 = (void *)MEMORY[0x1E0D8AA80];
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "typeForSFSearchResult:", v7) == 1;

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)tabDocumentForFindOnPageCompletionProvider:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)windowUUIDsToTabsForTabCompletionProvider:(id)a3
{
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v4 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(WeakRetained, "browserWindowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "browserControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v4 == objc_msgSend(v11, "isPrivateBrowsingEnabled"))
        {
          objc_msgSend(WeakRetained, "activeProfileIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "activeProfileIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if (v14)
          {
            objc_msgSend(v11, "tabController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "currentTabs");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "UUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, v17);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return v19;
}

- (id)selectedTabDocumentForTabCompletionProvider:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tabGroupsForTabCompletionProvider:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nonActiveTabGroupsInCurrentBrowsingMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentWindowUUIDForTabCompletionProvider:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)canPerformCommand:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CompletionList _urlFromCommand:](self, "_urlFromCommand:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !-[CompletionList _shouldSearchUIHandleEngagementForURL:](self, "_shouldSearchUIHandleEngagementForURL:", v5);

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)performCommand:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SFSearchResult *pegasusSearchResult;
  id v12;

  v12 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v12;
    -[CompletionList _urlFromCommand:](self, "_urlFromCommand:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "punchout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(v8, "forceOpenInBrowser");
    else
      v9 = 0;
    -[CompletionList delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "completionList:willGoToURL:fromPegasusSearchResult:forImageAttribution:", self, v7, self->_pegasusSearchResult, v9);

    pegasusSearchResult = self->_pegasusSearchResult;
    self->_pegasusSearchResult = 0;

    self->_safariShouldHandleCardSectionEngagement = 0;
    v5 = v12;
  }

}

- (id)_urlFromCommand:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "punchout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredOpenableURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SFSearchResult *pegasusSearchResult;

  v4 = a3;
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredOpenableURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CompletionList _shouldSearchUIHandleEngagementForURL:](self, "_shouldSearchUIHandleEngagementForURL:", v6);
  if (!v7)
  {
    objc_msgSend(v4, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(v8, "forceOpenInBrowser");
    else
      v9 = 0;
    -[CompletionList delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "completionList:willGoToURL:fromPegasusSearchResult:forImageAttribution:", self, v6, self->_pegasusSearchResult, v9);

    pegasusSearchResult = self->_pegasusSearchResult;
    self->_pegasusSearchResult = 0;

    self->_safariShouldHandleCardSectionEngagement = 0;
  }

  return v7;
}

- (BOOL)_shouldSearchUIHandleEngagementForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  v8 = 1;
  if (self->_safariShouldHandleCardSectionEngagement)
  {
    objc_msgSend(v4, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("weather.apple.com"));

    if ((v7 & 1) == 0
      && ((objc_msgSend(v5, "safari_isHTTPURL") & 1) != 0 || objc_msgSend(v5, "safari_isHTTPSURL")))
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)willDismissViewController:(id)a3
{
  id v4;

  -[CompletionList delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completionListDidDismissSearchUIViewController:", self);

}

- (void)didEngageResult:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  SFSearchResult *v7;
  SFSearchResult *pegasusSearchResult;
  id v9;

  v9 = a3;
  -[CompletionList _postFeedback:](self, "_postFeedback:");
  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "isSMARTParsecResultsEnabled") & 1) != 0
    || (objc_msgSend(v9, "result"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "domainName"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("web_answer")),
        v5,
        v4,
        v6))
  {
    self->_safariShouldHandleCardSectionEngagement = 1;
    objc_msgSend(v9, "result");
    v7 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();
    pegasusSearchResult = self->_pegasusSearchResult;
    self->_pegasusSearchResult = v7;

  }
}

- (void)_postFeedback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  +[UniversalSearchSession sharedSession](UniversalSearchSession, "sharedSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedbackDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionList query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "queryID");
  if (!v7)
    v7 = objc_msgSend(MEMORY[0x1E0D8A860], "currentQueryID");
  objc_msgSend(v5, "postFeedback:forQueryID:", v8, v7);

}

- (BrowserController)browserController
{
  return (BrowserController *)objc_loadWeakRetained((id *)&self->_browserController);
}

- (UniversalSearchSession)parsecSearchSession
{
  return self->_parsecSearchSession;
}

- (CompletionListDelegate)delegate
{
  return (CompletionListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LoadProgressObserver)loadProgressObserver
{
  return (LoadProgressObserver *)objc_loadWeakRetained((id *)&self->_loadProgressObserver);
}

- (BOOL)shouldIncludeNetworkedSearchSuggestions
{
  return self->_shouldIncludeNetworkedSearchSuggestions;
}

- (WBSCompletionQuery)query
{
  return self->_query;
}

- (WBSCompletionQuery)rewrittenQuery
{
  return self->_rewrittenQuery;
}

- (void)setRewrittenQuery:(id)a3
{
  objc_storeStrong((id *)&self->_rewrittenQuery, a3);
}

- (BOOL)isUsingPencilInput
{
  return self->_usingPencilInput;
}

- (void)setUsingPencilInput:(BOOL)a3
{
  self->_usingPencilInput = a3;
}

- (BOOL)isExecutingVoiceSearch
{
  return self->_executingVoiceSearch;
}

- (void)setExecutingVoiceSearch:(BOOL)a3
{
  self->_executingVoiceSearch = a3;
}

- (NSArray)searchParametersList
{
  return self->_searchParametersList;
}

- (void)setSearchParametersList:(id)a3
{
  objc_storeStrong((id *)&self->_searchParametersList, a3);
}

- (NSCache)faviconCache
{
  return self->_faviconCache;
}

- (URLCompletionProvider)URLCompletionProvider
{
  return self->_URLCompletionProvider;
}

- (void)setURLCompletionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_URLCompletionProvider, a3);
}

- (SearchSuggestionProvider)suggestionProvider
{
  return self->_suggestionProvider;
}

- (void)setSuggestionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionProvider, a3);
}

- (FindOnPageCompletionProvider)findOnPageProvider
{
  return self->_findOnPageProvider;
}

- (void)setFindOnPageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_findOnPageProvider, a3);
}

- (QuickWebsiteSearchCompletionProvider)quickWebsiteSearchProvider
{
  return self->_quickWebsiteSearchProvider;
}

- (void)setQuickWebsiteSearchProvider:(id)a3
{
  objc_storeStrong((id *)&self->_quickWebsiteSearchProvider, a3);
}

- (CompletionProvider)firstRemoteCompletionProviderToRespondToQuery
{
  return self->_firstRemoteCompletionProviderToRespondToQuery;
}

- (void)setFirstRemoteCompletionProviderToRespondToQuery:(id)a3
{
  objc_storeStrong((id *)&self->_firstRemoteCompletionProviderToRespondToQuery, a3);
}

- (UniversalSearchCompletionProvider)universalSearchProvider
{
  return self->_universalSearchProvider;
}

- (void)setUniversalSearchProvider:(id)a3
{
  objc_storeStrong((id *)&self->_universalSearchProvider, a3);
}

- (TabCompletionProvider)tabCompletionProvider
{
  return self->_tabCompletionProvider;
}

- (void)setTabCompletionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_tabCompletionProvider, a3);
}

- (PencilInputCompletionProvider)pencilInputCompletionProvider
{
  return self->_pencilInputCompletionProvider;
}

- (void)setPencilInputCompletionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInputCompletionProvider, a3);
}

- (OfflineSearchSuggestionsCompletionProvider)offlineSearchSuggestionsCompletionProvider
{
  return self->_offlineSearchSuggestionsCompletionProvider;
}

- (void)setOfflineSearchSuggestionsCompletionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_offlineSearchSuggestionsCompletionProvider, a3);
}

- (CalculationResultCompletionProvider)calculationResultProvider
{
  return self->_calculationResultProvider;
}

- (void)setCalculationResultProvider:(id)a3
{
  objc_storeStrong((id *)&self->_calculationResultProvider, a3);
}

- (NSDate)otherRenderTimeoutStartTime
{
  return self->_otherRenderTimeoutStartTime;
}

- (void)setOtherRenderTimeoutStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_otherRenderTimeoutStartTime, a3);
}

- (NSDate)searchRenderTimeoutStartTime
{
  return self->_searchRenderTimeoutStartTime;
}

- (void)setSearchRenderTimeoutStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_searchRenderTimeoutStartTime, a3);
}

- (NSDate)minRenderTimeoutStartTime
{
  return self->_minRenderTimeoutStartTime;
}

- (void)setMinRenderTimeoutStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_minRenderTimeoutStartTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minRenderTimeoutStartTime, 0);
  objc_storeStrong((id *)&self->_searchRenderTimeoutStartTime, 0);
  objc_storeStrong((id *)&self->_otherRenderTimeoutStartTime, 0);
  objc_storeStrong((id *)&self->_calculationResultProvider, 0);
  objc_storeStrong((id *)&self->_offlineSearchSuggestionsCompletionProvider, 0);
  objc_storeStrong((id *)&self->_pencilInputCompletionProvider, 0);
  objc_storeStrong((id *)&self->_tabCompletionProvider, 0);
  objc_storeStrong((id *)&self->_universalSearchProvider, 0);
  objc_storeStrong((id *)&self->_firstRemoteCompletionProviderToRespondToQuery, 0);
  objc_storeStrong((id *)&self->_quickWebsiteSearchProvider, 0);
  objc_storeStrong((id *)&self->_findOnPageProvider, 0);
  objc_storeStrong((id *)&self->_suggestionProvider, 0);
  objc_storeStrong((id *)&self->_URLCompletionProvider, 0);
  objc_storeStrong((id *)&self->_faviconCache, 0);
  objc_storeStrong((id *)&self->_searchParametersList, 0);
  objc_storeStrong((id *)&self->_rewrittenQuery, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_destroyWeak((id *)&self->_loadProgressObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parsecSearchSession, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_siriSuggestedSitesURLStringsToIgnore, 0);
  objc_storeStrong((id *)&self->_ignoredSiriSuggestedSitesQueue, 0);
  objc_storeStrong((id *)&self->_pegasusSearchResult, 0);
  objc_storeStrong((id *)&self->_urlStringToFaviconRequestTokens, 0);
  objc_storeStrong((id *)&self->_parsecTimeout, 0);
  objc_storeStrong((id *)&self->_currentCFListing, 0);
  objc_storeStrong((id *)&self->_currentListing, 0);
  objc_storeStrong((id *)&self->_cfListingOnDisplay, 0);
  objc_storeStrong((id *)&self->_listingOnDisplay, 0);
  objc_storeStrong((id *)&self->_switchToTabMatch, 0);
  objc_storeStrong((id *)&self->_topHit, 0);
  objc_storeStrong((id *)&self->_matchingStringInTopHit, 0);
  objc_storeStrong((id *)&self->_stringMatchedByTopHit, 0);
  objc_storeStrong((id *)&self->_findOnPageGroup, 0);
  objc_storeStrong((id *)&self->_rankingFeedbackForHiddenOrDuplicateResults, 0);
  objc_storeStrong((id *)&self->_queryRestorationCompletionItem, 0);
  objc_storeStrong((id *)&self->_cfQueryRestorationCompletionItem, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
}

- (void)_addUniversalSearchCompletions:(uint64_t)a1 toCompletionListing:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1D7CA3000, a2, OS_LOG_TYPE_DEBUG, "Top Pegasus' results set for Completion List: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

- (void)_addUniversalSearchCompletions:(os_log_t)log toCompletionListing:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_DEBUG, "Starting to add universal search completions.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_listingForQuery:(void *)a3 .cold.1(char a1, void *a2, void *a3)
{
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a1 & 1;
  v5 = a2;
  v6[0] = 67109376;
  v6[1] = v4;
  v7 = 1024;
  v8 = objc_msgSend(a3, "count");
  _os_log_debug_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEBUG, "Universal search provider is valid: (%i) and universal search completions count: (%d)", (uint8_t *)v6, 0xEu);

}

- (void)_listingForQuery:(char)a1 .cold.2(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D7CA3000, a2, OS_LOG_TYPE_DEBUG, "URL Completions  have Arrived: (%d)", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

- (void)setQuery:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_ERROR, "Parsec returned an invalid minRenderTimeout value of %lu ms. Using default value of %lu ms.", (uint8_t *)&v3, 0x16u);
}

void __34__CompletionList__requestFavicons__block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_ERROR, "Attempting to add favicon to cache with nil url.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

@end
