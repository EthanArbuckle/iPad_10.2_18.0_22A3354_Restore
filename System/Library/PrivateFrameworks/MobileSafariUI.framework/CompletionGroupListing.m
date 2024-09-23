@implementation CompletionGroupListing

- (CompletionGroupListing)initWithQuery:(id)a3 titleProvider:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v9;
  id v10;
  CompletionGroupListing *v11;
  CompletionGroupListing *v12;
  uint64_t v13;
  NSMutableArray *displayedParsecResults;
  CompletionGroupListing *v15;
  objc_super v17;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CompletionGroupListing;
  v11 = -[CompletionGroupListing init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_query, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    displayedParsecResults = v12->_displayedParsecResults;
    v12->_displayedParsecResults = (NSMutableArray *)v13;

    *(_DWORD *)&v12->_awaitingParsec = 16843009;
    objc_storeWeak((id *)&v12->_completionGroupTitleProvider, v10);
    v12->_isForPrivateBrowsing = (v5 & 2) != 0;
    v12->_databaseResultsSufficientForDisplay = v5 & 1;
    v12->_indexOfSearchSuggestionsGroup = 0x7FFFFFFFFFFFFFFFLL;
    v12->_indexOfTopHitsGroup = 0x7FFFFFFFFFFFFFFFLL;
    v12->_needsRebuild = 1;
    v15 = v12;
  }

  return v12;
}

- (BOOL)updateWithQuery:(id)a3
{
  id v5;
  char v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = WBSIsEqual();
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_query, a3);
    if (-[NSArray count](self->_groupListing, "count"))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = self->_groupListing;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "setQuery:", v5, (_QWORD)v13);
          }
          while (v9 != v11);
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

    }
  }

  return v6 ^ 1;
}

- (void)setURLCompletionMatches:(id)a3
{
  NSArray *v4;
  NSArray *URLCompletionMatches;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    URLCompletionMatches = self->_URLCompletionMatches;
    self->_URLCompletionMatches = v4;

    self->_needsRebuild = 1;
  }

}

- (void)setLocalTopHits:(id)a3
{
  NSArray *v4;
  NSArray *localTopHits;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    localTopHits = self->_localTopHits;
    self->_localTopHits = v4;

    self->_needsRebuild = 1;
  }

}

- (void)setParsecTopHits:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray **p_parsecTopHits;
  id v23;
  id v24;
  CompletionGroupListing *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    p_parsecTopHits = &self->_parsecTopHits;
    v23 = a3;
    v24 = v5;
    v25 = self;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
          v12 = objc_msgSend(MEMORY[0x1E0D89BE8], "isSearchEvaluationLoggingEnabled", p_parsecTopHits, v23);
          v13 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
          v14 = v13;
          if (v12)
          {
            v15 = v13;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "originalURLString");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "safari_urlHashesOfComponents");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v11, "query");
              else
                objc_msgSend(v11, "completedQuery");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v31 = v19;
              v32 = 2112;
              v33 = v20;
              _os_log_debug_impl(&dword_1D7CA3000, v15, OS_LOG_TYPE_DEBUG, "Parsec TopHit <%{public}@> query:\"%@\", buf, 0x16u);

            }
          }
          else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v16 = v14;
            objc_msgSend(v11, "originalURLString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138739971;
            v31 = v17;
            _os_log_impl(&dword_1D7CA3000, v16, OS_LOG_TYPE_INFO, "Parsec TopHit %{sensitive}@", buf, 0xCu);

          }
          ++v10;
        }
        while (v8 != v10);
        v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        v8 = v21;
      }
      while (v21);
    }

    objc_storeStrong((id *)p_parsecTopHits, v23);
    -[CompletionGroupListing _updateIconsForResultsIfNeeded:](v25, v6);
    v25->_needsRebuild = 1;
    v5 = v24;
  }

}

- (void)_updateIconsForResultsIfNeeded:(void *)a1
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    v9 = v3;
    v4 = (unint64_t)objc_msgSend(v3, "count") > 1;
    v3 = v9;
    if (!v4)
    {
      objc_msgSend(v9, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "topHit");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sfSearchResultValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v7)
        v8 = 6;
      else
        v8 = 4;
      objc_msgSend(v5, "safari_setCompletionIconForCompactRow:", v8);

      v3 = v9;
    }
  }

}

- (void)deleteTopHit:(id)a3 atIndex:(unint64_t)a4
{
  NSArray *v6;
  NSArray *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *groupListing;
  NSArray *localTopHits;
  NSArray *v15;

  v6 = (NSArray *)-[NSArray mutableCopy](self->_localTopHits, "mutableCopy", a3);
  if (-[NSArray count](v6, "count") > a4)
    -[NSArray removeObjectAtIndex:](v6, "removeObjectAtIndex:", a4);
  self->_topHitRemoved = 1;
  v7 = (NSArray *)-[NSArray mutableCopy](self->_groupListing, "mutableCopy");
  if (-[NSArray count](v6, "count"))
  {
    -[NSArray firstObject](v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "completions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "removeObjectAtIndex:", a4);
    -[NSArray count](v6, "count");
    -[CompletionGroupListing _titleForTopHits:](self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CompletionGroupListing _groupWithTitle:completions:](self, v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray replaceObjectAtIndex:withObject:](v7, "replaceObjectAtIndex:withObject:", 0, v12);
  }
  else
  {
    -[NSArray removeObjectAtIndex:](v7, "removeObjectAtIndex:", 0);
  }
  groupListing = self->_groupListing;
  self->_groupListing = v7;
  v15 = v7;

  localTopHits = self->_localTopHits;
  self->_localTopHits = v6;

}

- (id)_titleForTopHits:(void *)a1
{
  if (a1)
  {
    _WBSLocalizedString();
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_groupWithTitle:(void *)a3 completions:
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (objc_msgSend(v6, "count"))
    {
      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)a1, v5, v7, 5);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)setTabCompletionMatch:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[WBSBrowserTabCompletionMatch tabUUID](self->_tabCompletionMatch, "tabUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tabUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = WBSIsEqual();

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tabCompletionMatch, a3);
    self->_needsRebuild = 1;
  }

}

- (void)setTopParsecResults:(id)a3
{
  NSArray *v4;
  NSArray *topParsecResults;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    topParsecResults = self->_topParsecResults;
    self->_topParsecResults = v4;

    -[CompletionGroupListing _updateIconsForResultsIfNeeded:](self, v6);
    -[NSMutableArray addObjectsFromArray:](self->_displayedParsecResults, "addObjectsFromArray:", v6);
    self->_needsRebuild = 1;
  }

}

- (void)setBottomParsecResults:(id)a3
{
  NSArray *v4;
  NSArray *bottomParsecResults;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    bottomParsecResults = self->_bottomParsecResults;
    self->_bottomParsecResults = v4;

    -[CompletionGroupListing _updateIconsForResultsIfNeeded:](self, v6);
    -[NSMutableArray addObjectsFromArray:](self->_displayedParsecResults, "addObjectsFromArray:", v6);
    self->_needsRebuild = 1;
  }

}

- (void)setSearchSuggestions:(id)a3 fromSource:(int64_t)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_searchSuggestions, a3);
    self->_searchSuggestionsSource = a4;
    if (a4 == 2)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setQuery:", self->_query, (_QWORD)v13);
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }

    }
    self->_needsRebuild = 1;
  }

}

- (void)setSuggestedSites:(id)a3
{
  NSArray *v4;
  NSArray *suggestedSites;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    suggestedSites = self->_suggestedSites;
    self->_suggestedSites = v4;

    self->_needsRebuild = 1;
  }

}

- (void)setCalculationResultItem:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[CalculationResultCompletionItem calculationResult](self->_calculationResultItem, "calculationResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calculationResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = WBSIsEqual();

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_calculationResultItem, a3);
    self->_needsRebuild = 1;
  }

}

- (void)setFindOnPageCompletionItem:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[FindOnPageCompletionItem isEquivalentTo:](self->_findOnPageCompletionItem, "isEquivalentTo:"))
  {
    objc_storeStrong((id *)&self->_findOnPageCompletionItem, a3);
    self->_needsRebuild = 1;
  }

}

- (uint64_t)_maximumNumberOfSearchSuggestionsToShow
{
  uint64_t v1;
  BOOL v2;
  void *v3;
  BOOL v4;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 36))
      v2 = *(_QWORD *)(result + 96) == 0;
    else
      v2 = 1;
    if (objc_msgSend(*(id *)(result + 176), "numberOfMatches"))
      return 5;
    -[CompletionGroupListing _filteredURLCompletions](v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {

      return 5;
    }
    if (objc_msgSend(*(id *)(v1 + 112), "count"))
      v4 = 0;
    else
      v4 = v2;

    if (v4)
      return 10;
    else
      return 5;
  }
  return result;
}

- (id)_filteredURLCompletions
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    goto LABEL_8;
  v2 = (void *)MEMORY[0x1E0D8ABC0];
  objc_msgSend(MEMORY[0x1E0D8ABC0], "searchParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "includeBookmarksAndHistory:", v3))
  {

    goto LABEL_8;
  }
  v4 = *(_QWORD *)(a1 + 64);

  if (!v4)
  {
LABEL_8:
    v5 = 0;
    return v5;
  }
  objc_msgSend(MEMORY[0x1E0D8ABC0], "filterOutUnlikelyMatchesFromMatches:forQuery:rewrittenQuery:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8ABC0], "searchParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "enableCompletionListHistoryDeduplicationValue");

  if (v7)
  {
    if (*(_QWORD *)(a1 + 96))
    {
      v29[0] = *(_QWORD *)(a1 + 96);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_msgSend(MEMORY[0x1E0D8ABC0], "dedupeSameTitleHistoryResults:withMobile:withTophits:withTabs:", *(_QWORD *)(a1 + 64), 1, *(_QWORD *)(a1 + 88), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0D8ABC0], "dedupeSameURLResults:withUniversalSearchResults:", v10, *(_QWORD *)(a1 + 24));
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }

    v5 = v10;
  }
  if (!objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled"))
    return v5;
  v12 = *(void **)(a1 + 136);
  if ((unint64_t)objc_msgSend(v12, "count") > 4)
    v13 = 5;
  else
    v13 = objc_msgSend(*(id *)(a1 + 136), "count");
  objc_msgSend(v12, "subarrayWithRange:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __49__CompletionGroupListing__filteredURLCompletions__block_invoke;
  v27[3] = &unk_1E9CFA180;
  v16 = v15;
  v28 = v16;
  objc_msgSend(v14, "safari_setByApplyingBlock:", v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "queryString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 48), "queryString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safari_stringByTrimmingWhitespace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lowercaseString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v17, "setByAddingObject:", v21);

  }
  v23 = (void *)MEMORY[0x1E0D8ABC0];
  objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "defaultSearchEngineForPrivateBrowsing:", *(unsigned __int8 *)(a1 + 35));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dedupeResults:withSearchSuggestionStrings:searchProvider:", v5, v17, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[CompletionGroupListing _calculatePreviousSearchesWithSearchSuggestionsDictionary:filteredURLCompletions:](a1, v16, v26);
  return v26;
}

- (id)_titleForTabCompletionMatch:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "tabGroupTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tabGroupTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, v8);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _WBSLocalizedString();
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return a1;
}

id __49__CompletionGroupListing__filteredURLCompletions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isLabelPreviousSearchesInCompletionListEnabled"))
  {
    objc_msgSend(v3, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_stringByTrimmingWhitespace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v6);
  }
  objc_msgSend(v3, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_stringByTrimmingWhitespace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_calculatePreviousSearchesWithSearchSuggestionsDictionary:(void *)a3 filteredURLCompletions:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v37 = a1;
  if (a1 && objc_msgSend(MEMORY[0x1E0D89BE8], "isLabelPreviousSearchesInCompletionListEnabled"))
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = *(id *)(a1 + 64);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v45;
      do
      {
        v10 = 0;
        v38 = v8;
        do
        {
          if (*(_QWORD *)v45 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
          if ((objc_msgSend(v6, "containsObject:", v11) & 1) == 0)
          {
            v12 = v6;
            objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "defaultSearchEngineForPrivateBrowsing:", *(unsigned __int8 *)(v37 + 35));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v11, "originalURLString");
            v16 = v5;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "URLWithString:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "userVisibleQueryFromSearchURL:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v5 = v16;
            objc_msgSend(v16, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v20, "hasBeenSearchedBefore")
              || (objc_msgSend(v20, "lastVisitTimeInterval"),
                  v22 = v21,
                  objc_msgSend(v11, "lastVisitTimeInterval"),
                  v22 <= v23))
            {
              objc_msgSend(v20, "setHasBeenSearchedBefore:", 1);
              objc_msgSend(v11, "lastVisitTimeInterval");
              objc_msgSend(v20, "setLastVisitTimeInterval:");
            }

            v6 = v12;
            v8 = v38;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v8);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    +[RecentWebSearchesController sharedController](RecentWebSearchesController, "sharedController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "recentWebSearcheEntries");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v41 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v30, "searchString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "date");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "timeIntervalSinceReferenceDate");
          v35 = v34;

          if (!objc_msgSend(v32, "hasBeenSearchedBefore")
            || (objc_msgSend(v32, "lastVisitTimeInterval"), v36 <= v35))
          {
            objc_msgSend(v32, "setHasBeenSearchedBefore:", 1);
            objc_msgSend(v32, "setLastVisitTimeInterval:", v35);
          }

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v27);
    }

  }
}

- (void)markDatabaseResultsReceived
{
  self->_awaitingCompletionDatabase = 0;
}

- (void)markSearchResultsReceived
{
  self->_awaitingSearchProvider = 0;
}

- (void)markParsecResultsReceived
{
  self->_awaitingParsec = 0;
}

- (void)markTabCompletionReceived
{
  self->_awaitingTabCompletion = 0;
}

- (void)setNeedsParsecDatabaseQueryRewrite
{
  self->_awaitingCompletionDatabase = 1;
}

- (BOOL)isSufficientlyComputedForDisplay
{
  _BOOL4 awaitingCompletionDatabase;
  BOOL result;

  awaitingCompletionDatabase = self->_awaitingCompletionDatabase;
  result = !self->_awaitingCompletionDatabase;
  if (!self->_databaseResultsSufficientForDisplay)
    return !self->_awaitingParsec && !awaitingCompletionDatabase && !self->_awaitingTabCompletion;
  return result;
}

- (CompletionGroup)_groupWithTitle:(void *)a3 completions:(uint64_t)a4 maximumCompletions:
{
  CompletionGroup *v4;
  id v8;
  id v9;

  v4 = 0;
  if (a1 && a3)
  {
    v8 = a3;
    v9 = a2;
    v4 = -[CompletionGroup initWithTitle:completions:query:maximumNumberOfCompletions:]([CompletionGroup alloc], "initWithTitle:completions:query:maximumNumberOfCompletions:", v9, v8, *(_QWORD *)(a1 + 48), a4);

  }
  return v4;
}

- (id)_groupByAddingCompletions:(void *)a3 toGroup:
{
  id v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a1;
  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v5, "maxInitiallyVisibleResults");
    -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v3, v7, v9, v10);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_bookmarksAndHistoryGroup:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if (*(_BYTE *)(a1 + 36) && *(_QWORD *)(a1 + 96))
    {
      v11[0] = *(_QWORD *)(a1 + 96);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = 6;
      v5 = (id)v7;
    }
    else
    {
      v8 = 5;
    }
    if (objc_msgSend(v5, "count"))
    {
      _WBSLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:](a1, v9, v5, v8);
      a1 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }

  }
  return (id)a1;
}

- (_QWORD)_switchToTabCompletionGroup
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v1 = a1;
  v7[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)a1[12];
    if (v2)
    {
      -[CompletionGroupListing _titleForTabCompletionMatch:](a1, v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = v1[12];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v1, v3, v4, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    }
    v1 = 0;
  }
  return v1;
}

- (void)_suggestedSitesGroup
{
  void **v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend(a1[19], "count"))
    {
      _WBSLocalizedString();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionGroupListing _groupWithTitle:completions:](v1, v2, v1[19]);
      v1 = (void **)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (_QWORD)_calculationResultGroup
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v1 = a1;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)a1[20];
    if (v2)
    {
      objc_msgSend(v2, "calculationResult");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sectionTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v1[20];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v1, v4, v5, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
    v1 = 0;
  }
  return v1;
}

- (id)_pencilScribbleGroup
{
  id v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v1 = a1;
  v5[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a1[21])
    {
      v5[0] = a1[21];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v1, &stru_1E9CFDBB0, v2, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    }
    v1 = 0;
  }
  return v1;
}

- (id)_searchSuggestionsGroup
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend(a1[17], "count"))
    {
      WeakRetained = objc_loadWeakRetained(v1 + 23);
      objc_msgSend(WeakRetained, "titleForSearchSuggestionsCompletion");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v1[17];
      v5 = -[CompletionGroupListing _maximumNumberOfSearchSuggestionsToShow]((uint64_t)v1);
      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v1, v3, v4, v5);
      v1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (id)_quickWebsiteSearchGroup
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v1 = a1;
  v10[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a1[15])
    {
      v2 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1[15], "searchProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringWithFormat:", v3, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v10[0] = v1[15];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionGroupListing _groupWithTitle:completions:](v1, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return (id *)v8;
    }
    v1 = 0;
  }
  return v1;
}

- (id)_topParsecResultGroup
{
  void **v1;

  if (a1)
  {
    v1 = a1;
    a1 = (id *)objc_msgSend(a1[13], "count");
    if (a1)
    {
      if ((-[CompletionGroupListing _hasTopHitDuplicateInResults:](v1, v1[13]) & 1) != 0)
        return (id *)0;
      -[CompletionGroupListing _parsecResultsGroupFromResults:](v1, v1[13]);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (uint64_t)_hasTopHitDuplicateInResults:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1
    && (objc_msgSend(a1, "topHits"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    objc_msgSend(a1, "topHits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "originalURLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3998];
      objc_msgSend(v7, "originalURLString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsWithString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "host");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "length"))
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v14 = v3;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v35;
          v33 = v3;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v35 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_msgSend(v7, "userVisibleURLString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "userVisibleURLString");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v20, "isEqualToString:", v21);

              if ((v22 & 1) != 0)
                goto LABEL_21;
              objc_msgSend(v19, "originalURLString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "rangeOfString:", v13);

              if (v24 != 0x7FFFFFFFFFFFFFFFLL)
              {
                if (!v24)
                  goto LABEL_21;
                v25 = (void *)MEMORY[0x1E0CB3998];
                objc_msgSend(v19, "originalURLString");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "componentsWithString:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "host");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "isEqualToString:", v13);

                if ((v29 & 1) != 0)
                {
LABEL_21:
                  v30 = 1;
                  v3 = v33;
                  goto LABEL_24;
                }
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
            v30 = 0;
            v3 = v33;
            if (v16)
              continue;
            break;
          }
        }
        else
        {
          v30 = 0;
        }
LABEL_24:

      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v31 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[CompletionGroupListing _hasTopHitDuplicateInResults:].cold.1(v31);
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)_parsecResultsGroupFromResults:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sectionHeader");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)a1, v6, v4, 5);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_findOnPageGroup
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v1 = a1;
  v7[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a1[22])
    {
      WeakRetained = objc_loadWeakRetained(a1 + 23);
      objc_msgSend(WeakRetained, "titleForFindOnPageCompletion:", v1[22]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = v1[22];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:]((uint64_t)v1, v3, v4, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return (id *)v5;
    }
    v1 = 0;
  }
  return v1;
}

- (void)_buildListIfNeeded
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_DEBUG, "Rebuilding completion list.", v1, 2u);
}

- (void)_mergeGroup:(void *)a3 toListing:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (a1 && v11)
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "completions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "completions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:](a1, 0, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", objc_msgSend(v5, "count") - 1, v10);
    }
    else
    {
      objc_msgSend(v11, "completions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionGroupListing _groupWithTitle:completions:maximumCompletions:](a1, 0, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v10);
    }

  }
}

uint64_t __44__CompletionGroupListing__buildListIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "hasBeenSearchedBefore") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "queryString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", v6) ^ 1;

  }
  return v4;
}

void __44__CompletionGroupListing__buildListIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSearchEvaluationLoggingEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = a1;
    obj = *(id *)(a1 + 32);
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v18)
    {
      v17 = *(_QWORD *)v25;
      do
      {
        v3 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(obj);
          v19 = v3;
          v4 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v3);
          objc_msgSend(v4, "title");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendFormat:", CFSTR("%@: "), v5);

          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          objc_msgSend(v4, "completions");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v21;
            do
            {
              v10 = 0;
              do
              {
                if (*(_QWORD *)v21 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
                v12 = objc_opt_class();
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v11, "uuidString");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v2, "appendFormat:", CFSTR("%@[%@], "), v12, v13);

                }
                else
                {
                  objc_msgSend(v2, "appendFormat:", CFSTR("%@[%@], "), v12, &stru_1E9CFDBB0);
                }
                ++v10;
              }
              while (v8 != v10);
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v8);
          }

          objc_msgSend(v2, "appendString:", CFSTR("\n"));
          v3 = v19 + 1;
        }
        while (v19 + 1 != v18);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v18);
    }

    v14 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __44__CompletionGroupListing__buildListIfNeeded__block_invoke_2_cold_1(v15, v14, (uint64_t)v2);

  }
}

- (id)groupAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[CompletionGroupListing numberOfGroups](self, "numberOfGroups") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[CompletionGroupListing groups](self, "groups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSArray)topHits
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSArray count](self->_parsecTopHits, "count");
  v4 = 80;
  if (!v3)
    v4 = 88;
  return (NSArray *)*(id *)((char *)&self->super.isa + v4);
}

- (CompletionItem)topHit
{
  void *v2;
  void *v3;

  -[CompletionGroupListing topHits](self, "topHits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CompletionItem *)v3;
}

- (BOOL)isEmpty
{
  BOOL v3;
  void *v5;

  if (-[NSMutableArray count](self->_displayedParsecResults, "count")
    || -[NSArray count](self->_searchSuggestions, "count"))
  {
    return 0;
  }
  -[CompletionGroupListing _filteredURLCompletions]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "count") == 0;

  return v3;
}

- (unint64_t)numberOfGroups
{
  void *v2;
  unint64_t v3;

  -[CompletionGroupListing groups](self, "groups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSSet)topHitAddresses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[CompletionGroupListing topHits](self, "topHits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

id __41__CompletionGroupListing_topHitAddresses__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "originalURLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_urlStringForCompletionDeduplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasParsecCompletions
{
  return -[NSMutableArray count](self->_displayedParsecResults, "count") != 0;
}

- (NSArray)groups
{
  -[CompletionGroupListing _buildListIfNeeded]((uint64_t)self);
  return (NSArray *)(id)-[NSArray copy](self->_groupListing, "copy");
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

- (BOOL)isAwaitingParsec
{
  return self->_awaitingParsec;
}

- (BOOL)isAwaitingSearchProvider
{
  return self->_awaitingSearchProvider;
}

- (BOOL)isAwaitingCompletionDatabase
{
  return self->_awaitingCompletionDatabase;
}

- (BOOL)isAwaitingTabCompletion
{
  return self->_awaitingTabCompletion;
}

- (NSArray)URLCompletionMatches
{
  return self->_URLCompletionMatches;
}

- (unint64_t)indexOfTopHitsGroup
{
  return self->_indexOfTopHitsGroup;
}

- (NSArray)parsecTopHits
{
  return self->_parsecTopHits;
}

- (NSArray)localTopHits
{
  return self->_localTopHits;
}

- (WBSBrowserTabCompletionMatch)tabCompletionMatch
{
  return self->_tabCompletionMatch;
}

- (NSArray)topParsecResults
{
  return self->_topParsecResults;
}

- (NSArray)bottomParsecResults
{
  return self->_bottomParsecResults;
}

- (QuickWebsiteSearchCompletionItem)quickWebsiteSearchItem
{
  return self->_quickWebsiteSearchItem;
}

- (void)setQuickWebsiteSearchItem:(id)a3
{
  objc_storeStrong((id *)&self->_quickWebsiteSearchItem, a3);
}

- (int64_t)searchSuggestionsSource
{
  return self->_searchSuggestionsSource;
}

- (NSArray)searchSuggestions
{
  return self->_searchSuggestions;
}

- (unint64_t)indexOfSearchSuggestionsGroup
{
  return self->_indexOfSearchSuggestionsGroup;
}

- (NSArray)suggestedSites
{
  return self->_suggestedSites;
}

- (CalculationResultCompletionItem)calculationResultItem
{
  return self->_calculationResultItem;
}

- (PencilInputCompletionItem)pencilCompletionItem
{
  return self->_pencilCompletionItem;
}

- (void)setPencilCompletionItem:(id)a3
{
  objc_storeStrong((id *)&self->_pencilCompletionItem, a3);
}

- (FindOnPageCompletionItem)findOnPageCompletionItem
{
  return self->_findOnPageCompletionItem;
}

- (CompletionGroupTitleProviding)completionGroupTitleProvider
{
  return (CompletionGroupTitleProviding *)objc_loadWeakRetained((id *)&self->_completionGroupTitleProvider);
}

- (void)setCompletionGroupTitleProvider:(id)a3
{
  objc_storeWeak((id *)&self->_completionGroupTitleProvider, a3);
}

- (SFSearchResult)hiddenIgnoredSiriSuggestedSite
{
  return self->_hiddenIgnoredSiriSuggestedSite;
}

- (void)setHiddenIgnoredSiriSuggestedSite:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenIgnoredSiriSuggestedSite, 0);
  objc_destroyWeak((id *)&self->_completionGroupTitleProvider);
  objc_storeStrong((id *)&self->_findOnPageCompletionItem, 0);
  objc_storeStrong((id *)&self->_pencilCompletionItem, 0);
  objc_storeStrong((id *)&self->_calculationResultItem, 0);
  objc_storeStrong((id *)&self->_suggestedSites, 0);
  objc_storeStrong((id *)&self->_searchSuggestions, 0);
  objc_storeStrong((id *)&self->_quickWebsiteSearchItem, 0);
  objc_storeStrong((id *)&self->_bottomParsecResults, 0);
  objc_storeStrong((id *)&self->_topParsecResults, 0);
  objc_storeStrong((id *)&self->_tabCompletionMatch, 0);
  objc_storeStrong((id *)&self->_localTopHits, 0);
  objc_storeStrong((id *)&self->_parsecTopHits, 0);
  objc_storeStrong((id *)&self->_URLCompletionMatches, 0);
  objc_storeStrong((id *)&self->_rewrittenQuery, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_displayedParsecResults, 0);
  objc_storeStrong((id *)&self->_groupListing, 0);
}

- (void)_hasTopHitDuplicateInResults:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_ERROR, "Primary TopHit originalURLString is nil.", v1, 2u);
}

void __44__CompletionGroupListing__buildListIfNeeded__block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  v5 = a2;
  objc_msgSend(v4, "queryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_debug_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEBUG, "Built Completion List for query \"%@\": %@", (uint8_t *)&v7, 0x16u);

}

@end
