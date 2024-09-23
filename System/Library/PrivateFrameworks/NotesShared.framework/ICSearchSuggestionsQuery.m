@implementation ICSearchSuggestionsQuery

- (ICSearchSuggestionsQuery)initWithSearchString:(id)a3 searchTokens:(id)a4 additionalQueries:(id)a5 rankingQueriesDefinition:(id)a6 modernResultsOnly:(BOOL)a7 suggestionsResponder:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  ICSearchSuggestionsQuery *v28;
  ICSearchSuggestionsQuery *v29;
  uint64_t v31;
  ICSearchSuggestionsQuery *v32;
  id v33;
  objc_super v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v33 = a8;
  if (!+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions"))
  {
    v32 = self;
    v19 = a4;
    v20 = a5;
    v21 = a8;
    v22 = v17;
    v23 = a7;
    v24 = v16;
    v25 = v15;
    v26 = (void *)MEMORY[0x1E0D641A0];
    v31 = objc_opt_class();
    v27 = v26;
    v15 = v25;
    v16 = v24;
    a7 = v23;
    v17 = v22;
    a8 = v21;
    a5 = v20;
    a4 = v19;
    self = v32;
    objc_msgSend(v27, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "ICSearchSuggestionsContext.supportsSearchSuggestions", "-[ICSearchSuggestionsQuery initWithSearchString:searchTokens:additionalQueries:rankingQueriesDefinition:modernResultsOnly:suggestionsResponder:]", 1, 0, CFSTR("%@ is only supported to use if search suggestions are supported."), v31);
  }
  v34.receiver = self;
  v34.super_class = (Class)ICSearchSuggestionsQuery;
  v28 = -[ICSearchQuery initWithRankingQueriesDefinition:](&v34, sel_initWithRankingQueriesDefinition_, v18);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_searchString, a3);
    objc_storeStrong((id *)&v29->_searchTokens, a4);
    objc_storeStrong((id *)&v29->_additionalQueries, a5);
    v29->_modernResultsOnly = a7;
    objc_storeStrong((id *)&v29->_suggestionsResponder, a8);
  }

  return v29;
}

- (NSMutableArray)foundSuggestions
{
  NSMutableArray *foundSuggestions;
  NSMutableArray *v4;
  NSMutableArray *v5;

  foundSuggestions = self->_foundSuggestions;
  if (!foundSuggestions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_foundSuggestions;
    self->_foundSuggestions = v4;

    foundSuggestions = self->_foundSuggestions;
  }
  return foundSuggestions;
}

- (id)newSearchQueryContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  -[ICSearchSuggestionsQuery suggestionsResponder](self, "suggestionsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchSuggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSearchSuggestionsQuery searchTokens](self, "searchTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_65);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CA6B70];
  -[ICSearchSuggestionsQuery searchString](self, "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v5, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA6B98], "userQueryContextWithCurrentSuggestion:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchSuggestionsQuery additionalQueries](self, "additionalQueries");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = v12;
  else
    v14 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v11, "setFilterQueries:", v14);

  objc_msgSend(v11, "setEnableRankedResults:", 1);
  objc_msgSend(v11, "setEnableSuggestionTokens:", 1);
  objc_msgSend(v11, "setEnableResultCountsPerSuggestion:", 1);
  objc_msgSend(v11, "setMaxSuggestionCount:", 5);
  objc_msgSend(v11, "setDisableBlockingOnIndex:", 1);

  return v11;
}

uint64_t __49__ICSearchSuggestionsQuery_newSearchQueryContext__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "csToken");
}

- (id)newSearchQueryWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CA6B90]);
  -[ICSearchSuggestionsQuery searchString](self, "searchString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUserQueryString:userQueryContext:", v7, v5);

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke;
  v10[3] = &unk_1E76CD760;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v8, "setFoundSuggestionsHandler:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

void __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  int v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(WeakRetained, "wasForceStopped");
  v6 = os_log_create("com.apple.notes", "SearchIndexer");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke_cold_1((uint64_t)WeakRetained, v7);
  }
  else
  {
    v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke_cold_2((uint64_t)WeakRetained, v3, v8);

    objc_msgSend(v3, "ic_compactMap:", &__block_literal_global_13);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "foundSuggestions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v7);

  }
}

ICSearchSuggestion *__54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  ICSearchSuggestion *v3;

  v2 = a2;
  v3 = -[ICSearchSuggestion initWithSuggestion:]([ICSearchSuggestion alloc], "initWithSuggestion:", v2);

  return v3;
}

- (id)queryResultsToAddFromBatch:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[ICSearchSuggestionsQuery topHits](self, "topHits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v4;
  }
  else if ((unint64_t)objc_msgSend(v4, "count") > 2)
  {
    objc_msgSend(v4, "ic_arrayBySplittingIntoTwoArraysWithMaxPrefixCount:prefixMatchingPredicate:", 2, &__block_literal_global_17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSearchSuggestionsQuery setTopHits:](self, "setTopHits:", v10);

    }
    objc_msgSend(v7, "secondObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICSearchSuggestionsQuery setTopHits:](self, "setTopHits:", v4);
    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

BOOL __55__ICSearchSuggestionsQuery_queryResultsToAddFromBatch___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_searchResultType") == 0;

  return v3;
}

- (void)queryFinishedRunningWithError:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[ICSearchSuggestionsQuery foundSuggestions](self, "foundSuggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "copy");

  }
  v5 = v3;
  performBlockOnMainThread();

}

void __58__ICSearchSuggestionsQuery_queryFinishedRunningWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "suggestionsResponder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVisibleSearchSuggestions:", *(_QWORD *)(a1 + 40));

}

- (BOOL)modernResultsOnly
{
  return self->_modernResultsOnly;
}

- (NSArray)topHits
{
  return self->_topHits;
}

- (void)setTopHits:(id)a3
{
  objc_storeStrong((id *)&self->_topHits, a3);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (NSArray)searchTokens
{
  return self->_searchTokens;
}

- (void)setSearchTokens:(id)a3
{
  objc_storeStrong((id *)&self->_searchTokens, a3);
}

- (NSArray)additionalQueries
{
  return self->_additionalQueries;
}

- (void)setAdditionalQueries:(id)a3
{
  objc_storeStrong((id *)&self->_additionalQueries, a3);
}

- (void)setFoundSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_foundSuggestions, a3);
}

- (ICSearchSuggestionsResponder)suggestionsResponder
{
  return self->_suggestionsResponder;
}

- (void)setSuggestionsResponder:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsResponder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsResponder, 0);
  objc_storeStrong((id *)&self->_foundSuggestions, 0);
  objc_storeStrong((id *)&self->_additionalQueries, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_topHits, 0);
}

void __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "FoundSuggestionsHandler of search query called, but search query was force stopped earlier: %@", (uint8_t *)&v2, 0xCu);
}

void __54__ICSearchSuggestionsQuery_newSearchQueryWithContext___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "%@ found %d suggestions", (uint8_t *)&v4, 0x12u);
}

@end
