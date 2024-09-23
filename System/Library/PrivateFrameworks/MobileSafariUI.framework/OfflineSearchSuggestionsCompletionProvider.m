@implementation OfflineSearchSuggestionsCompletionProvider

- (OfflineSearchSuggestionsCompletionProvider)initWithMaximumNumberOfSuggestions:(unint64_t)a3 forPrivateBrowsing:(BOOL)a4
{
  OfflineSearchSuggestionsCompletionProvider *v6;
  uint64_t v7;
  WBSOfflineSearchSuggestionsFetcher *offlineSearchSuggestionsFetcher;
  OfflineSearchSuggestionsCompletionProvider *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OfflineSearchSuggestionsCompletionProvider;
  v6 = -[CompletionProvider init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8AA38]), "initWithMaximumSuggestionsToFetch:", a3);
    offlineSearchSuggestionsFetcher = v6->_offlineSearchSuggestionsFetcher;
    v6->_offlineSearchSuggestionsFetcher = (WBSOfflineSearchSuggestionsFetcher *)v7;

    -[WBSOfflineSearchSuggestionsFetcher setDelegate:](v6->_offlineSearchSuggestionsFetcher, "setDelegate:", v6);
    v6->_forPrivateBrowsing = a4;
    v9 = v6;
  }

  return v6;
}

- (BOOL)areOfflineSearchSuggestionsAvailable
{
  return -[WBSOfflineSearchSuggestionsFetcher areOfflineSearchSuggestionsAvailable](self->_offlineSearchSuggestionsFetcher, "areOfflineSearchSuggestionsAvailable");
}

- (void)updateOfflineSearchSuggestionAvailability
{
  -[WBSOfflineSearchSuggestionsFetcher updateAvailability](self->_offlineSearchSuggestionsFetcher, "updateAvailability");
}

- (void)setQueryToComplete:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentCompletionQuery, a3);
    -[WBSOfflineSearchSuggestionsFetcher setCurrentQuery:](self->_offlineSearchSuggestionsFetcher, "setCurrentQuery:", v5);
  }

}

- (void)offlineSearchSuggestionsFetcher:(id)a3 didFindSuggestions:(id)a4 forQuery:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  OfflineSearchSuggestionsCompletionProvider *v13;

  v7 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__OfflineSearchSuggestionsCompletionProvider_offlineSearchSuggestionsFetcher_didFindSuggestions_forQuery___block_invoke;
  v11[3] = &unk_1E9CF6D48;
  v12 = v7;
  v13 = self;
  v10 = v7;
  objc_msgSend(a4, "safari_mapObjectsUsingBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionProvider setCompletions:forString:](self, "setCompletions:forString:", v8, v9);

}

SearchSuggestion *__106__OfflineSearchSuggestionsCompletionProvider_offlineSearchSuggestionsFetcher_didFindSuggestions_forQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SearchSuggestion *v4;

  v3 = a2;
  v4 = -[SearchSuggestion initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:]([SearchSuggestion alloc], "initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:", v3, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 56), 1);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineSearchSuggestionsFetcher, 0);
  objc_storeStrong((id *)&self->_currentCompletionQuery, 0);
}

@end
