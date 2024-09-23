@implementation ICSearchQueryOperation

+ (id)newOperationQueueWithName:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3828];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setName:", v4);

  objc_msgSend(v5, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v5, "setQualityOfService:", 25);
  return v5;
}

+ (void)initialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ICSearchQueryOperation;
  objc_msgSendSuper2(&v7, sel_initialize);
  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D64488];
    v11[0] = &unk_1E771AC90;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerDefaults:", v4);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D64480];
    v9 = &unk_1E771A5B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerDefaults:", v6);

  }
}

- (ICSearchQueryOperation)init
{
  -[ICSearchQueryOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICSearchQueryOperation)initWithSearchSuggestionsResponder:(id)a3 searchString:(id)a4 performNLSearch:(BOOL)a5 performTopHitSearch:(BOOL)a6 tokens:(id)a7 modernResultsOnly:(BOOL)a8
{
  id v15;
  __CFString *v16;
  id v17;
  ICSearchQueryOperation *v18;
  ICSearchQueryOperation *v19;
  __CFString *v20;
  uint64_t v21;
  NSString *tokensQueryString;
  objc_super v24;

  v15 = a3;
  v16 = (__CFString *)a4;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)ICSearchQueryOperation;
  v18 = -[ICSearchQueryOperation init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_searchSuggestionsResponder, a3);
    if (v16)
      v20 = v16;
    else
      v20 = &stru_1E76DB108;
    objc_storeStrong((id *)&v19->_searchString, v20);
    v19->_performNLSearch = a5;
    v19->_performTopHitSearch = a6;
    objc_storeStrong((id *)&v19->_searchTokens, a7);
    +[ICSearchQueryOperation tokensQueryStringFromTokens:](ICSearchQueryOperation, "tokensQueryStringFromTokens:", v17);
    v21 = objc_claimAutoreleasedReturnValue();
    tokensQueryString = v19->_tokensQueryString;
    v19->_tokensQueryString = (NSString *)v21;

    v19->_modernResultsOnly = a8;
  }

  return v19;
}

- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4 performTopHitSearch:(BOOL)a5 modernResultsOnly:(BOOL)a6
{
  return -[ICSearchQueryOperation initWithQueryString:rankingQueries:performTopHitSearch:modernResultsOnly:attributes:](self, "initWithQueryString:rankingQueries:performTopHitSearch:modernResultsOnly:attributes:", a3, a4, a5, a6, 0);
}

- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4 performTopHitSearch:(BOOL)a5 modernResultsOnly:(BOOL)a6 attributes:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  ICSearchQueryOperation *v15;
  ICSearchQueryOperation *v16;
  ICSearchSuggestionsResponder *searchSuggestionsResponder;
  ICSearchResultsQuery *v18;
  uint64_t v19;
  ICSearchQuery *defaultQuery;
  objc_super v22;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ICSearchQueryOperation;
  v15 = -[ICSearchQueryOperation init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    searchSuggestionsResponder = v15->_searchSuggestionsResponder;
    v15->_searchSuggestionsResponder = 0;

    v18 = [ICSearchResultsQuery alloc];
    if (v14)
      v19 = -[ICSearchResultsQuery initWithQueryString:externalRankingQueries:modernResultsOnly:attributes:](v18, "initWithQueryString:externalRankingQueries:modernResultsOnly:attributes:", v12, v13, v8, v14);
    else
      v19 = -[ICSearchResultsQuery initWithQueryString:externalRankingQueries:modernResultsOnly:](v18, "initWithQueryString:externalRankingQueries:modernResultsOnly:", v12, v13, v8);
    defaultQuery = v16->_defaultQuery;
    v16->_defaultQuery = (ICSearchQuery *)v19;

    v16->_allowEmptySearchString = 1;
    v16->_performTopHitSearch = a5;
  }

  return v16;
}

- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4
{
  return -[ICSearchQueryOperation initWithQueryString:rankingQueries:attributes:](self, "initWithQueryString:rankingQueries:attributes:", a3, a4, 0);
}

- (ICSearchQueryOperation)initWithQueryString:(id)a3 rankingQueries:(id)a4 attributes:(id)a5
{
  return -[ICSearchQueryOperation initWithQueryString:rankingQueries:performTopHitSearch:modernResultsOnly:attributes:](self, "initWithQueryString:rankingQueries:performTopHitSearch:modernResultsOnly:attributes:", a3, a4, 0, 0, a5);
}

- (ICSearchQueryOperation)initWithLinkSuggestionQuery:(id)a3
{
  id v5;
  ICSearchQueryOperation *v6;
  ICSearchQueryOperation *v7;
  ICSearchSuggestionsResponder *searchSuggestionsResponder;
  uint64_t v9;
  NSString *searchString;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICSearchQueryOperation;
  v6 = -[ICSearchQueryOperation init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    searchSuggestionsResponder = v6->_searchSuggestionsResponder;
    v6->_searchSuggestionsResponder = 0;

    objc_storeStrong((id *)&v7->_defaultQuery, a3);
    objc_msgSend(v5, "queryString");
    v9 = objc_claimAutoreleasedReturnValue();
    searchString = v7->_searchString;
    v7->_searchString = (NSString *)v9;

    v7->_allowEmptySearchString = 0;
    v7->_performTopHitSearch = 0;
    v7->_modernResultsOnly = 1;
  }

  return v7;
}

- (id)jointQueryWithSuggestions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v4 = a3;
  -[ICSearchQueryOperation tokensQueryString](self, "tokensQueryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[ICSearchQueryOperation tokensQueryString](self, "tokensQueryString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v7, "initWithFormat:", CFSTR("(%@) && (%@)"), v8, v4);

    }
    else
    {
      v6 = v4;
    }
  }

  return v6;
}

- (unint64_t)countOfNonSpaceCharsInSearchString
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[ICSearchQueryOperation searchString](self, "searchString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v8 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "length", (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)useSearchSuggestions
{
  void *v3;
  BOOL v4;

  if (!+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions"))return 0;
  -[ICSearchQueryOperation searchSuggestionsResponder](self, "searchSuggestionsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)createPrefixMatchingQuery
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  ICRankingQueriesDefinition *v8;
  ICSearchSuggestionsQuery *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  ICSearchResultsQuery *v15;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[ICSearchQueryOperation searchString](self, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchQueryOperation keyboardLanguage](self, "keyboardLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[ICSearchQueryParser prefixMatchingQueryStringForSearchString:enableSpellCheckSPI:languageForSpellchecking:expandedTokens:](ICSearchQueryParser, "prefixMatchingQueryStringForSearchString:enableSpellCheckSPI:languageForSpellchecking:expandedTokens:", v3, 1, v4, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;

  -[ICSearchQueryOperation jointQueryWithSuggestions:](self, "jointQueryWithSuggestions:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ICRankingQueriesDefinition initWithExpandedTokens:rankingQueryType:rankingQueryFlags:]([ICRankingQueriesDefinition alloc], "initWithExpandedTokens:rankingQueryType:rankingQueryFlags:", v6, 0, CFSTR("cwd"));
  if (-[ICSearchQueryOperation useSearchSuggestions](self, "useSearchSuggestions"))
  {
    v9 = [ICSearchSuggestionsQuery alloc];
    -[ICSearchQueryOperation searchString](self, "searchString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchQueryOperation searchTokens](self, "searchTokens");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICSearchQueryOperation modernResultsOnly](self, "modernResultsOnly");
    -[ICSearchQueryOperation searchSuggestionsResponder](self, "searchSuggestionsResponder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ICSearchSuggestionsQuery initWithSearchString:searchTokens:additionalQueries:rankingQueriesDefinition:modernResultsOnly:suggestionsResponder:](v9, "initWithSearchString:searchTokens:additionalQueries:rankingQueriesDefinition:modernResultsOnly:suggestionsResponder:", v10, v11, v12, v8, v13, v14);

  }
  else
  {
    v15 = -[ICSearchResultsQuery initWithQueryString:rankingQueriesDefinition:modernResultsOnly:]([ICSearchResultsQuery alloc], "initWithQueryString:rankingQueriesDefinition:modernResultsOnly:", v7, v8, -[ICSearchQueryOperation modernResultsOnly](self, "modernResultsOnly"));
  }

  return v15;
}

- (ICSearchQuery)defaultQuery
{
  ICSearchQuery *defaultQuery;
  ICSearchQuery *v4;
  ICSearchQuery *v5;

  defaultQuery = self->_defaultQuery;
  if (!defaultQuery)
  {
    -[ICSearchQueryOperation createPrefixMatchingQuery](self, "createPrefixMatchingQuery");
    v4 = (ICSearchQuery *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultQuery;
    self->_defaultQuery = v4;

    defaultQuery = self->_defaultQuery;
  }
  return defaultQuery;
}

- (ICSearchQuery)fuzzyQuery
{
  ICSearchQuery *fuzzyQuery;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ICRankingQueriesDefinition *v8;
  void *v9;
  ICRankingQueriesDefinition *v10;
  ICSearchResultsQuery *v11;
  ICSearchQuery *v12;

  fuzzyQuery = self->_fuzzyQuery;
  if (!fuzzyQuery)
  {
    v4 = (void *)objc_opt_class();
    -[ICSearchQueryOperation searchString](self, "searchString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fuzzyMatchingQueryStringForSearchString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICSearchQueryOperation jointQueryWithSuggestions:](self, "jointQueryWithSuggestions:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [ICRankingQueriesDefinition alloc];
    -[ICSearchQueryOperation searchString](self, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICRankingQueriesDefinition initWithSearchString:rankingQueryType:rankingQueryFlags:](v8, "initWithSearchString:rankingQueryType:rankingQueryFlags:", v9, 1, CFSTR("cwdt"));

    v11 = -[ICSearchResultsQuery initWithQueryString:rankingQueriesDefinition:modernResultsOnly:]([ICSearchResultsQuery alloc], "initWithQueryString:rankingQueriesDefinition:modernResultsOnly:", v7, v10, -[ICSearchQueryOperation modernResultsOnly](self, "modernResultsOnly"));
    v12 = self->_fuzzyQuery;
    self->_fuzzyQuery = &v11->super;

    fuzzyQuery = self->_fuzzyQuery;
  }
  return fuzzyQuery;
}

- (void)performPrefixAndFuzzyAndSubstringQueries
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "%@ was cancelled while substring query is running, or the substring query is force stopped before completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)performSpellCheckerAPIQueryIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "%@ was cancelled while mispelling query is running, or the misspelling query is force stopped before completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)performRelatedWordQueriesIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  ICRankingQueriesDefinition *v22;
  ICSearchResultsQuery *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D64478]);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0;
    v36 = &v35;
    v37 = 0x2050000000;
    v6 = (void *)getNLEmbeddingClass_softClass;
    v38 = getNLEmbeddingClass_softClass;
    if (!getNLEmbeddingClass_softClass)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __getNLEmbeddingClass_block_invoke;
      v34[3] = &unk_1E76C77A8;
      v34[4] = &v35;
      __getNLEmbeddingClass_block_invoke((uint64_t)v34);
      v6 = (void *)v36[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v35, 8);
    objc_msgSend(v7, "wordEmbeddingForLanguage:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchQueryOperation searchString](self, "searchString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v28, "containsString:", v27))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleForKey:", *MEMORY[0x1E0D64488]);
      v11 = v10;

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerForKey:", *MEMORY[0x1E0D64480]);

      objc_msgSend(v28, "neighborsForString:maximumCount:maximumDistance:distanceType:", v27, v13, 0, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSearchQueryOperation setRelatedWordQueries:](self, "setRelatedWordQueries:", v15);

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      obj = v14;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v31 != v17)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
            +[ICSearchQueryParser queryStringForSearchString:queryFields:matchType:](ICSearchQueryParser, "queryStringForSearchString:queryFields:matchType:", v19, 0, 0, v26);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICSearchQueryOperation jointQueryWithSuggestions:](self, "jointQueryWithSuggestions:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v22 = -[ICRankingQueriesDefinition initWithSearchString:rankingQueryType:rankingQueryFlags:]([ICRankingQueriesDefinition alloc], "initWithSearchString:rankingQueryType:rankingQueryFlags:", v19, 0, CFSTR("cwdt"));
            v23 = -[ICSearchResultsQuery initWithQueryString:rankingQueriesDefinition:modernResultsOnly:]([ICSearchResultsQuery alloc], "initWithQueryString:rankingQueriesDefinition:modernResultsOnly:", v21, v22, -[ICSearchQueryOperation modernResultsOnly](self, "modernResultsOnly"));
            -[ICSearchQueryOperation relatedWordQueries](self, "relatedWordQueries");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v23);

            v25 = -[ICSearchQueryOperation runICSearchQuery:](self, "runICSearchQuery:", v23);
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        }
        while (v16);
      }

    }
  }
}

- (void)performTopHitSearchQuery
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Top Hit Search Query error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)processTopHits:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ICSortableSearchableItem *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  id v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = v4;
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
          v11 = (void *)MEMORY[0x1E0C99D80];
          -[ICSearchQueryOperation searchString](self, "searchString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICSearchQueryOperation keyboardLanguage](self, "keyboardLanguage");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "highlightInfoForSearchStringWithPrefixMatchInAllFields:language:", v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = -[ICSortableSearchableItem initWithSearchableItem:highlightInfo:rankingScore:attachmentUniqueIdentifiers:]([ICSortableSearchableItem alloc], "initWithSearchableItem:highlightInfo:rankingScore:attachmentUniqueIdentifiers:", v10, v14, 0, 0.0);
          objc_msgSend(v5, "addObject:", v15);
          if (-[ICSortableSearchableItem searchResultType](v15, "searchResultType") == 1)
          {
            objc_msgSend(v22, "addObject:", v15);
          }
          else
          {
            -[ICSearchQueryOperation resultsDictionary](self, "resultsDictionary");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "uniqueIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v7);
    }

    -[ICSearchQueryOperation retrieveNotesOfFoundAttachmentsForSearchResults:](self, "retrieveNotesOfFoundAttachmentsForSearchResults:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v5, "addObjectsFromArray:", v18);
    -[ICSearchQueryOperation appendSortableSearchableItemsToResults:](self, "appendSortableSearchableItemsToResults:", v5);
    -[ICSearchQueryOperation foundItemsHandler](self, "foundItemsHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[ICSearchQueryOperation foundItemsHandler](self, "foundItemsHandler");
      v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, uint64_t))v20)[2](v20, v5, 1);

    }
    v4 = v21;
  }

}

- (void)appendSortableSearchableItemsToResults:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[ICSearchQueryOperation results](self, "results");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "searchableItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)main
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "%@ search string has no non-space chars, and no suggestions is found. Not performing search", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (id)retrieveNotesOfFoundAttachmentsForSearchResults:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ICSearchQueryOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  _UNKNOWN **v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  id obj;
  id obja;
  ICSearchQueryOperation *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v4;
  v74 = self;
  if (objc_msgSend(v4, "count"))
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v84 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          objc_msgSend(v10, "searchableItem");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "attributeSet");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "ic_searchResultType") == 1)
          {
            objc_msgSend(v12, "ic_relatedModernNoteUniqueIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "ic_addNonNilObject:", v13);
            objc_msgSend(v10, "searchableItem");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "uniqueIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              -[ICSearchQueryOperation uniqueIdentifiersOfAttachmentsFoundInNotes](self, "uniqueIdentifiersOfAttachmentsFoundInNotes");
              v16 = self;
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", v13);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(v18, "ic_addNonNilObject:", v15);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "ic_addNonNilObject:", v15);
                -[ICSearchQueryOperation uniqueIdentifiersOfAttachmentsFoundInNotes](v16, "uniqueIdentifiersOfAttachmentsFoundInNotes");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "ic_setNonNilObject:forNonNilKey:", v18, v13);

              }
              self = v74;
            }

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
      }
      while (v7);
    }

  }
  v65 = v5;
  v20 = (void *)MEMORY[0x1E0C99E60];
  -[ICSearchQueryOperation resultsDictionary](self, "resultsDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "minusSet:", v23);

  v24 = v65;
  if (objc_msgSend(v65, "count"))
  {
    v25 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[ICSearchQueryOperation retrieveNotesOfFoundAttachmentsForSearchResults:].cold.1();

    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "workerManagedObjectContext");
    v27 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)v27;
    +[ICSearchQueryOperation fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs:context:](ICSearchQueryOperation, "fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs:context:", v28, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v29, "count"))
    {
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v62 = v29;
      v68 = v29;
      v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      if (!v70)
        goto LABEL_42;
      v31 = *(_QWORD *)v80;
      v32 = &off_1E76C6000;
      v66 = *(_QWORD *)v80;
      v67 = v30;
      while (1)
      {
        for (j = 0; j != v70; ++j)
        {
          if (*(_QWORD *)v80 != v31)
            objc_enumerationMutation(v68);
          v34 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
          -[ICSearchQueryOperation uniqueIdentifiersOfAttachmentsFoundInNotes](self, "uniqueIdentifiersOfAttachmentsFoundInNotes", v62);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "uniqueIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = 0.0;
          obja = v37;
          if (!v37)
            goto LABEL_39;
          v71 = j;
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v39 = v37;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
          if (!v40)
          {

LABEL_39:
            v55 = (void *)MEMORY[0x1E0C99D80];
            -[ICSearchQueryOperation searchString](self, "searchString");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICSearchQueryOperation keyboardLanguage](self, "keyboardLanguage");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "highlightInfoForSearchStringWithPrefixMatchInAllFields:language:", v56, v57);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_40;
          }
          v41 = v40;
          v69 = v34;
          v42 = 0;
          v43 = *(_QWORD *)v76;
          do
          {
            v44 = 0;
            v45 = v42;
            do
            {
              if (*(_QWORD *)v76 != v43)
                objc_enumerationMutation(v39);
              v46 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v44);
              -[ICSearchQueryOperation resultsDictionary](self, "resultsDictionary");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "objectForKeyedSubscript:", v46);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "rankingScore");
              v50 = v49;

              if (v38 < v50)
                v38 = v50;
              v51 = (void *)MEMORY[0x1E0C99D80];
              -[ICSearchQueryOperation resultsDictionary](self, "resultsDictionary");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "objectForKeyedSubscript:", v46);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "highlightInfo");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "mergeHighlightInfo:withHighlighInfo:", v45, v54);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              self = v74;
              ++v44;
              v45 = v42;
            }
            while (v41 != v44);
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
          }
          while (v41);

          v31 = v66;
          v30 = v67;
          v32 = &off_1E76C6000;
          j = v71;
          v34 = v69;
          if (!v42)
            goto LABEL_39;
LABEL_40:
          v58 = (void *)objc_msgSend(objc_alloc((Class)v32[6]), "initWithSearchableItem:highlightInfo:rankingScore:attachmentUniqueIdentifiers:", v34, v42, obja, v38);
          -[ICSearchQueryOperation resultsDictionary](self, "resultsDictionary");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "uniqueIdentifier");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setObject:forKeyedSubscript:", v58, v60);

          objc_msgSend(v30, "addObject:", v58);
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
        if (!v70)
        {
LABEL_42:

          v29 = v62;
          break;
        }
      }
    }

    v24 = v65;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)runICSearchQuery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
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
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  NSObject *v30;
  id v31;
  ICSearchQueryOperation *v32;
  id v33;

  v4 = a3;
  if (!v4)
  {
    v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICSearchQueryOperation runICSearchQuery:].cold.1();
    goto LABEL_11;
  }
  if (-[ICSearchQueryOperation isCancelled](self, "isCancelled"))
  {
    v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICSearchQueryOperation runICSearchQuery:].cold.2();
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v4, "run:", 0);
  if ((objc_msgSend(v4, "wasForceStopped") & 1) != 0
    || -[ICSearchQueryOperation isCancelled](self, "isCancelled"))
  {
    v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICSearchQueryOperation runICSearchQuery:].cold.3();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topHits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchQueryOperation processTopHits:](self, "processTopHits:", v9);

  }
  objc_msgSend(v4, "queryResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v10, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E60];
  -[ICSearchQueryOperation resultsDictionary](self, "resultsDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "minusSet:", v17);
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __43__ICSearchQueryOperation_runICSearchQuery___block_invoke;
  v29 = &unk_1E76CBE50;
  v5 = v10;
  v30 = v5;
  v31 = v4;
  v32 = self;
  v19 = v18;
  v33 = v19;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v26);
  if (objc_msgSend(v19, "count", v26, v27, v28, v29))
  {
    -[ICSearchQueryOperation retrieveNotesOfFoundAttachmentsForSearchResults:](self, "retrieveNotesOfFoundAttachmentsForSearchResults:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v20);

  }
  +[ICSortableSearchableItem sortDescriptorsForRankingStrategy:](ICSortableSearchableItem, "sortDescriptorsForRankingStrategy:", -[ICSearchQueryOperation rankingStrategy](self, "rankingStrategy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortedArrayUsingDescriptors:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSearchQueryOperation appendSortableSearchableItemsToResults:](self, "appendSortableSearchableItemsToResults:", v22);
  if (-[ICSearchQueryOperation isCancelled](self, "isCancelled"))
  {
    v23 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[ICSearchQueryOperation runICSearchQuery:].cold.4();

    v6 = 0;
  }
  else
  {
    -[ICSearchQueryOperation foundItemsHandler](self, "foundItemsHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[ICSearchQueryOperation foundItemsHandler](self, "foundItemsHandler");
      v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v25)[2](v25, v22, 0);

    }
    v6 = (void *)objc_msgSend(v19, "copy");
  }

LABEL_12:
  return v6;
}

void __43__ICSearchQueryOperation_runICSearchQuery___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  ICSortableSearchableItem *v8;
  void *v9;
  void *v10;
  void *v11;
  ICSortableSearchableItem *v12;
  void *v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "rankingQueriesDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rankingScoreForSearchableItem:", v14);
  v7 = v6;

  v8 = [ICSortableSearchableItem alloc];
  objc_msgSend(*(id *)(a1 + 48), "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "rankingQueriesDefinition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "keyboardLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICSortableSearchableItem initWithSearchableItem:searchString:rankingQueriesDefinition:rankingScore:attachmentUniqueIdentifiers:language:](v8, "initWithSearchableItem:searchString:rankingQueriesDefinition:rankingScore:attachmentUniqueIdentifiers:language:", v14, v9, v10, 0, v11, v7);

  objc_msgSend(*(id *)(a1 + 48), "resultsDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", v12, v4);

  objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
}

- (void)cancel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "%@ cancelling search query", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (id)prefixMatchingQueryStringForSearchString:(id)a3
{
  return +[ICSearchQueryParser prefixMatchingQueryStringForSearchString:enableSpellCheckSPI:languageForSpellchecking:expandedTokens:](ICSearchQueryParser, "prefixMatchingQueryStringForSearchString:enableSpellCheckSPI:languageForSpellchecking:expandedTokens:", a3, 0, 0, 0);
}

+ (id)fuzzyMatchingQueryStringForSearchString:(id)a3
{
  return +[ICSearchQueryParser queryStringForSearchString:queryFields:matchType:](ICSearchQueryParser, "queryStringForSearchString:queryFields:matchType:", a3, 0, 2);
}

+ (id)substringMatchingQueryStringForSearchString:(id)a3
{
  return +[ICSearchQueryParser queryStringForSearchString:queryFields:matchType:](ICSearchQueryParser, "queryStringForSearchString:queryFields:matchType:", a3, 0, 3);
}

+ (id)exactMatchingQueryStringForTitleSearchString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("_ICItemDisplayName");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSearchQueryParser queryStringForSearchString:queryFields:matchType:](ICSearchQueryParser, "queryStringForSearchString:queryFields:matchType:", v4, v5, 0, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)prefixMatchingQueryStringTitleForSearchString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("_ICItemDisplayName");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSearchQueryParser queryStringForSearchString:queryFields:matchType:](ICSearchQueryParser, "queryStringForSearchString:queryFields:matchType:", v4, v5, 1, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)nlpSerialQueue
{
  if (nlpSerialQueue_createSerialQueueToken != -1)
    dispatch_once(&nlpSerialQueue_createSerialQueueToken, &__block_literal_global_38);
  return (id)nlpSerialQueue_nlpQueue;
}

void __40__ICSearchQueryOperation_nlpSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.nlpParser", v2);
  v1 = (void *)nlpSerialQueue_nlpQueue;
  nlpSerialQueue_nlpQueue = (uint64_t)v0;

}

+ (void)nlpParser
{
  if (nlpParser_createParserToken != -1)
    dispatch_once(&nlpParser_createParserToken, &__block_literal_global_68_0);
  return (void *)nlpParser_nlpParser;
}

void __35__ICSearchQueryOperation_nlpParser__block_invoke()
{
  uint64_t *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (uint64_t *)getkNLSearchParserContextIdentifierKeySymbolLoc_ptr;
  v8 = (void *)getkNLSearchParserContextIdentifierKeySymbolLoc_ptr;
  if (!getkNLSearchParserContextIdentifierKeySymbolLoc_ptr)
  {
    v1 = (void *)NLPLibrary();
    v0 = (uint64_t *)dlsym(v1, "kNLSearchParserContextIdentifierKey");
    v6[3] = (uint64_t)v0;
    getkNLSearchParserContextIdentifierKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
    goto LABEL_8;
  v9 = *v0;
  v10[0] = CFSTR("com.apple.Notes");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v3 = getNLSearchParserCreateSymbolLoc_ptr;
  v8 = getNLSearchParserCreateSymbolLoc_ptr;
  if (!getNLSearchParserCreateSymbolLoc_ptr)
  {
    v4 = (void *)NLPLibrary();
    v3 = dlsym(v4, "NLSearchParserCreate");
    v6[3] = (uint64_t)v3;
    getNLSearchParserCreateSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v5, 8);
  if (!v3)
  {
LABEL_8:
    __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
    __break(1u);
  }
  nlpParser_nlpParser = ((uint64_t (*)(void *))v3)(v2);

}

+ (void)nlSearchQueryWithSearchString:(id)a3 queryString:(id *)a4 rankingQueries:(id *)a5 highlightString:(id *)a6
{
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  _QWORD block[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE v48[32];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!a4)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "queryStringResult != ((void *)0)", "+[ICSearchQueryOperation nlSearchQueryWithSearchString:queryString:rankingQueries:highlightString:]", 1, 0, CFSTR("queryStringResult is NULL. It cannot be NULL otherwise we don't have the result returned."));
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__33;
  v46 = __Block_byref_object_dispose__33;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__33;
  v40 = __Block_byref_object_dispose__33;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__33;
  v34 = __Block_byref_object_dispose__33;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  +[ICSearchQueryOperation nlpSerialQueue](ICSearchQueryOperation, "nlpSerialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__ICSearchQueryOperation_nlSearchQueryWithSearchString_queryString_rankingQueries_highlightString___block_invoke;
  block[3] = &unk_1E76CBEB8;
  v11 = v9;
  v25 = a5 != 0;
  v20 = v11;
  v21 = &v42;
  v22 = &v36;
  v23 = &v30;
  v24 = &v26;
  dispatch_sync(v10, block);

  if (*((_DWORD *)v27 + 6))
  {
    v12 = (id)v43[5];
    if (a5)
    {
      objc_msgSend((id)v37[5], "keysSortedByValueUsingComparator:", &__block_literal_global_76);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    v12 = 0;
  }
  v15 = objc_retainAutorelease(v12);
  *a4 = v15;
  objc_msgSend(a1, "highlightStringForAttributedInputs:", v31[5]);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  if (a5)
    *a5 = objc_retainAutorelease(v14);
  v16 = os_log_create("com.apple.notes", "NLP");
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v17)
      +[ICSearchQueryOperation nlSearchQueryWithSearchString:queryString:rankingQueries:highlightString:].cold.2((uint64_t)v48, objc_msgSend(v11, "hash"), objc_msgSend(v11, "length"));
  }
  else if (v17)
  {
    +[ICSearchQueryOperation nlSearchQueryWithSearchString:queryString:rankingQueries:highlightString:].cold.1((uint64_t)v48, objc_msgSend(v11, "hash"), objc_msgSend(v11, "length"));
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

}

void __99__ICSearchQueryOperation_nlSearchQueryWithSearchString_queryString_rankingQueries_highlightString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _Unwind_Exception *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;

  v2 = +[ICSearchQueryOperation nlpParser](ICSearchQueryOperation, "nlpParser");
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 32);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v5 = getNLSearchParserSetStringSymbolLoc_ptr;
    v33 = getNLSearchParserSetStringSymbolLoc_ptr;
    if (!getNLSearchParserSetStringSymbolLoc_ptr)
    {
      v6 = (void *)NLPLibrary();
      v5 = dlsym(v6, "NLSearchParserSetString");
      v31[3] = (uint64_t)v5;
      getNLSearchParserSetStringSymbolLoc_ptr = v5;
    }
    _Block_object_dispose(&v30, 8);
    if (v5)
    {
      ((void (*)(void *, uint64_t))v5)(v3, v4);
      if (*(_BYTE *)(a1 + 72))
        v7 = 14;
      else
        v7 = 12;
      v30 = 0;
      v31 = &v30;
      v32 = 0x2020000000;
      v8 = getNLSearchParserCopyParseWithOptionsSymbolLoc_ptr;
      v33 = getNLSearchParserCopyParseWithOptionsSymbolLoc_ptr;
      if (!getNLSearchParserCopyParseWithOptionsSymbolLoc_ptr)
      {
        v9 = (void *)NLPLibrary();
        v8 = dlsym(v9, "NLSearchParserCopyParseWithOptions");
        v31[3] = (uint64_t)v8;
        getNLSearchParserCopyParseWithOptionsSymbolLoc_ptr = v8;
      }
      _Block_object_dispose(&v30, 8);
      if (v8)
      {
        v10 = ((uint64_t (*)(void *, uint64_t, uint64_t))v8)(v3, 1, v7);
        if (!v10)
          return;
        v11 = (const void *)v10;
        v30 = 0;
        v31 = &v30;
        v32 = 0x2020000000;
        v12 = getNLSearchParseCandidateCopyDescriptionSymbolLoc_ptr;
        v33 = getNLSearchParseCandidateCopyDescriptionSymbolLoc_ptr;
        if (!getNLSearchParseCandidateCopyDescriptionSymbolLoc_ptr)
        {
          v13 = (void *)NLPLibrary();
          v12 = dlsym(v13, "NLSearchParseCandidateCopyDescription");
          v31[3] = (uint64_t)v12;
          getNLSearchParseCandidateCopyDescriptionSymbolLoc_ptr = v12;
        }
        _Block_object_dispose(&v30, 8);
        if (v12)
        {
          v14 = ((uint64_t (*)(const void *))v12)(v11);
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v16 = *(void **)(v15 + 40);
          *(_QWORD *)(v15 + 40) = v14;

          v30 = 0;
          v31 = &v30;
          v32 = 0x2020000000;
          v17 = getNLSearchParseCandidateCopyRankTermsSymbolLoc_ptr;
          v33 = getNLSearchParseCandidateCopyRankTermsSymbolLoc_ptr;
          if (!getNLSearchParseCandidateCopyRankTermsSymbolLoc_ptr)
          {
            v18 = (void *)NLPLibrary();
            v17 = dlsym(v18, "NLSearchParseCandidateCopyRankTerms");
            v31[3] = (uint64_t)v17;
            getNLSearchParseCandidateCopyRankTermsSymbolLoc_ptr = v17;
          }
          _Block_object_dispose(&v30, 8);
          if (v17)
          {
            v19 = ((uint64_t (*)(const void *))v17)(v11);
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v21 = *(void **)(v20 + 40);
            *(_QWORD *)(v20 + 40) = v19;

            v30 = 0;
            v31 = &v30;
            v32 = 0x2020000000;
            v22 = getNLSearchParseCandidateCopyAttributedInputSymbolLoc_ptr;
            v33 = getNLSearchParseCandidateCopyAttributedInputSymbolLoc_ptr;
            if (!getNLSearchParseCandidateCopyAttributedInputSymbolLoc_ptr)
            {
              v23 = (void *)NLPLibrary();
              v22 = dlsym(v23, "NLSearchParseCandidateCopyAttributedInput");
              v31[3] = (uint64_t)v22;
              getNLSearchParseCandidateCopyAttributedInputSymbolLoc_ptr = v22;
            }
            _Block_object_dispose(&v30, 8);
            if (v22)
            {
              v24 = ((uint64_t (*)(const void *))v22)(v11);
              v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v26 = *(void **)(v25 + 40);
              *(_QWORD *)(v25 + 40) = v24;

              v30 = 0;
              v31 = &v30;
              v32 = 0x2020000000;
              v27 = getNLSearchParseGetConfidenceSymbolLoc_ptr;
              v33 = getNLSearchParseGetConfidenceSymbolLoc_ptr;
              if (!getNLSearchParseGetConfidenceSymbolLoc_ptr)
              {
                v28 = (void *)NLPLibrary();
                v27 = dlsym(v28, "NLSearchParseGetConfidence");
                v31[3] = (uint64_t)v27;
                getNLSearchParseGetConfidenceSymbolLoc_ptr = v27;
              }
              _Block_object_dispose(&v30, 8);
              if (v27)
              {
                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = ((uint64_t (*)(const void *))v27)(v11);
                CFRelease(v11);
                return;
              }
LABEL_31:
              v29 = (_Unwind_Exception *)__35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
              _Block_object_dispose(&v30, 8);
              _Unwind_Resume(v29);
            }
LABEL_30:
            __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
            goto LABEL_31;
          }
LABEL_29:
          __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
          goto LABEL_30;
        }
LABEL_28:
        __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
        goto LABEL_29;
      }
    }
    else
    {
      __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
    }
    __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
    goto LABEL_28;
  }
}

uint64_t __99__ICSearchQueryOperation_nlSearchQueryWithSearchString_queryString_rankingQueries_highlightString___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "intValue");
  if (v6 == objc_msgSend(v5, "intValue"))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "intValue");
    if (v8 < (int)objc_msgSend(v5, "intValue"))
      v7 = -1;
    else
      v7 = 1;
  }

  return v7;
}

+ (id)highlightStringForAttributedInputs:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  _QWORD v10[4];
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke;
  v10[3] = &unk_1E76CBF48;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1E76DB108;
  }

  return v8;
}

void __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v7, "length");
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke_2;
  v10[3] = &unk_1E76CBF20;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("kMDUserQueryTopicKey"), 0, v4, 0, v10);
  v6 = objc_msgSend(v7, "length");
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke_3;
  v8[3] = &unk_1E76CBF20;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("kMDUserQueryTitleKey"), 0, v6, 0, v8);

}

void __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

void __61__ICSearchQueryOperation_highlightStringForAttributedInputs___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

+ (id)searchableItemsFromSortableItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "searchableItem", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (id)tokensQueryStringFromTokens:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "ic_compactMap:", &__block_literal_global_89);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" && "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __54__ICSearchQueryOperation_tokensQueryStringFromTokens___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "subQueryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "subQueryString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("(%@)"), v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke;
  v19[3] = &unk_1E76CBFB0;
  v9 = v6;
  v20 = v9;
  objc_msgSend(v5, "ic_compactMap:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke_2;
    v14[3] = &unk_1E76C8C70;
    v15 = v10;
    v16 = v9;
    v17 = v5;
    v11 = v7;
    v18 = v11;
    objc_msgSend(v16, "performBlockAndWait:", v14);
    v12 = (void *)objc_msgSend(v11, "copy");

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

id __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_managedObjectIDForURIString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("ICNote"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setResultType:", 2);
  objc_msgSend(v2, "setPropertiesToFetch:", &unk_1E771AB60);
  v31 = a1;
  v4 = *(void **)(a1 + 40);
  v37 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v37);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v37;
  if (v6)
  {
    obj = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke_2_cold_1(v31, obj, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v5;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v13)
    {
      v14 = v13;
      v29 = v5;
      v30 = v2;
      v15 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_opt_class();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("objectID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          ICCheckedDynamicCast();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "URIRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "absoluteString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("modificationDate"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          ICCheckedDynamicCast();
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
            v24 = v23 == 0;
          else
            v24 = 1;
          if (!v24)
          {
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", CFSTR("com.apple.notes.spotlightrecord"));
            objc_msgSend(v25, "setIc_dataSourceIdentifier:", CFSTR("Modern"));
            objc_msgSend(v25, "setIc_searchResultType:", 0);
            objc_msgSend(v25, "setContentModificationDate:", v23);
            objc_opt_class();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("folder.account.identifier"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            ICDynamicCast();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setDomainIdentifier:", v27);

            v28 = objc_alloc_init(MEMORY[0x1E0CA6B48]);
            objc_msgSend(v28, "setAttributeSet:", v25);
            objc_msgSend(v28, "setUniqueIdentifier:", v21);
            objc_msgSend(*(id *)(v31 + 56), "addObject:", v28);

          }
        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v14);
      v5 = v29;
      v2 = v30;
      v6 = 0;
    }
  }

}

- (id)foundItemsHandler
{
  return self->_foundItemsHandler;
}

- (void)setFoundItemsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (int64_t)requestIndex
{
  return self->_requestIndex;
}

- (void)setRequestIndex:(int64_t)a3
{
  self->_requestIndex = a3;
}

- (BOOL)modernResultsOnly
{
  return self->_modernResultsOnly;
}

- (void)setModernResultsOnly:(BOOL)a3
{
  self->_modernResultsOnly = a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSArray)searchTokens
{
  return self->_searchTokens;
}

- (ICSearchSuggestionsResponder)searchSuggestionsResponder
{
  return self->_searchSuggestionsResponder;
}

- (void)setSearchSuggestionsResponder:(id)a3
{
  objc_storeStrong((id *)&self->_searchSuggestionsResponder, a3);
}

- (void)setDefaultQuery:(id)a3
{
  objc_storeStrong((id *)&self->_defaultQuery, a3);
}

- (void)setFuzzyQuery:(id)a3
{
  objc_storeStrong((id *)&self->_fuzzyQuery, a3);
}

- (ICSearchQuery)substringQuery
{
  return self->_substringQuery;
}

- (void)setSubstringQuery:(id)a3
{
  objc_storeStrong((id *)&self->_substringQuery, a3);
}

- (ICSearchQuery)nlQuery
{
  return self->_nlQuery;
}

- (void)setNlQuery:(id)a3
{
  objc_storeStrong((id *)&self->_nlQuery, a3);
}

- (ICSearchQuery)spellingQuery
{
  return self->_spellingQuery;
}

- (void)setSpellingQuery:(id)a3
{
  objc_storeStrong((id *)&self->_spellingQuery, a3);
}

- (ICSearchQuery)topHitQuery
{
  return self->_topHitQuery;
}

- (void)setTopHitQuery:(id)a3
{
  objc_storeStrong((id *)&self->_topHitQuery, a3);
}

- (NSMutableArray)relatedWordQueries
{
  return self->_relatedWordQueries;
}

- (void)setRelatedWordQueries:(id)a3
{
  objc_storeStrong((id *)&self->_relatedWordQueries, a3);
}

- (NSMutableDictionary)resultsDictionary
{
  return self->_resultsDictionary;
}

- (void)setResultsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_resultsDictionary, a3);
}

- (NSMutableDictionary)uniqueIdentifiersOfAttachmentsFoundInNotes
{
  return self->_uniqueIdentifiersOfAttachmentsFoundInNotes;
}

- (void)setUniqueIdentifiersOfAttachmentsFoundInNotes:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifiersOfAttachmentsFoundInNotes, a3);
}

- (NSString)tokensQueryString
{
  return self->_tokensQueryString;
}

- (void)setTokensQueryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (void)setKeyboardLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (BOOL)performTopHitSearch
{
  return self->_performTopHitSearch;
}

- (void)setPerformTopHitSearch:(BOOL)a3
{
  self->_performTopHitSearch = a3;
}

- (BOOL)performNLSearch
{
  return self->_performNLSearch;
}

- (void)setPerformNLSearch:(BOOL)a3
{
  self->_performNLSearch = a3;
}

- (BOOL)allowEmptySearchString
{
  return self->_allowEmptySearchString;
}

- (unint64_t)rankingStrategy
{
  return self->_rankingStrategy;
}

- (void)setRankingStrategy:(unint64_t)a3
{
  self->_rankingStrategy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_tokensQueryString, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiersOfAttachmentsFoundInNotes, 0);
  objc_storeStrong((id *)&self->_resultsDictionary, 0);
  objc_storeStrong((id *)&self->_relatedWordQueries, 0);
  objc_storeStrong((id *)&self->_topHitQuery, 0);
  objc_storeStrong((id *)&self->_spellingQuery, 0);
  objc_storeStrong((id *)&self->_nlQuery, 0);
  objc_storeStrong((id *)&self->_substringQuery, 0);
  objc_storeStrong((id *)&self->_fuzzyQuery, 0);
  objc_storeStrong((id *)&self->_defaultQuery, 0);
  objc_storeStrong((id *)&self->_searchSuggestionsResponder, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_foundItemsHandler, 0);
}

+ (NSOperationQueue)searchSuggestionsQueue
{
  if (qword_1EF50B250 != -1)
    swift_once();
  return (NSOperationQueue *)(id)qword_1EF50F3D8;
}

+ (void)suggestionSearchResultsWithLinkSuggestionQuery:(ICLinkSuggestionQuery *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  ICLinkSuggestionQuery *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED23A600);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = sub_1BDBFDBC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF50F3F8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF50EF98;
  v14[5] = v13;
  v15 = a3;
  sub_1BDBA8D44((uint64_t)v9, (uint64_t)&unk_1EF50EFA0, (uint64_t)v14);
  swift_release();
}

- (void)retrieveNotesOfFoundAttachmentsForSearchResults:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2_7(&dword_1BD918000, v0, v1, "%@ About to retrieve notes that are found through attachments: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)runICSearchQuery:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "%@ query is not ran because it is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)runICSearchQuery:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2_7(&dword_1BD918000, v0, v1, "%@ was cancelled before starting to run query: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)runICSearchQuery:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2_7(&dword_1BD918000, v0, v1, "%@ was canceled and query was force stopped: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)runICSearchQuery:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2_7(&dword_1BD918000, v0, v1, "%@ was cancelled when about to call foundItemsHandler for query: %@");
  OUTLINED_FUNCTION_1_0();
}

uint64_t __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return +[ICSearchQueryOperation nlSearchQueryWithSearchString:queryString:rankingQueries:highlightString:].cold.1(v0);
}

+ (void)nlSearchQueryWithSearchString:(uint64_t)a3 queryString:rankingQueries:highlightString:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_7_5(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_9(&dword_1BD918000, v5, v3, "NLP algorithm doesn't recognize searchString: hash=%lu, length=%lu", v4);
}

+ (void)nlSearchQueryWithSearchString:(uint64_t)a3 queryString:rankingQueries:highlightString:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_7_5(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_9(&dword_1BD918000, v5, v3, "NLP algorithm has recognized searchString: hash=%lu, length=%lu", v4);
}

void __101__ICSearchQueryOperation_fetchModernNoteSearchableItemAttributesFromCoreDataForObjectIDURIs_context___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "error fetching attributes for identifiers:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
