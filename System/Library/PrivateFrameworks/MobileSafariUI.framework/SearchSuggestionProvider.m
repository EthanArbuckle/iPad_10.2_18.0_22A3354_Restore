@implementation SearchSuggestionProvider

- (id)initForPrivateBrowsing:(BOOL)a3
{
  _BOOL8 v3;
  SearchSuggestionProvider *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *userAgentString;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  WBSSearchSuggestionsFetcher *searchSuggestionsFetcher;
  SearchSuggestionProvider *v15;
  objc_super v17;

  v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SearchSuggestionProvider;
  v4 = -[CompletionProvider init](&v17, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0DD97A8];
    _SFApplicationNameForUserAgent();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_standardUserAgentWithApplicationName:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    userAgentString = v4->_userAgentString;
    v4->_userAgentString = (NSString *)v7;

    v9 = objc_alloc(MEMORY[0x1E0D8AC48]);
    objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultSearchEngineForPrivateBrowsing:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suggestionsURLTemplate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "initWithSuggestionsURLTemplate:", v12);
    searchSuggestionsFetcher = v4->_searchSuggestionsFetcher;
    v4->_searchSuggestionsFetcher = (WBSSearchSuggestionsFetcher *)v13;

    v4->_forPrivateBrowsing = v3;
    v15 = v4;
  }

  return v4;
}

- (void)setQueryToComplete:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BOOL forPrivateBrowsing;
  void *v9;
  id WeakRetained;
  WBSSearchSuggestionsFetcher *searchSuggestionsFetcher;
  NSString *userAgentString;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id location;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentCompletionQuery, a3);
    objc_msgSend(v5, "queryString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    forPrivateBrowsing = self->_forPrivateBrowsing;
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didRequestSearchSuggestions");

    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
    objc_msgSend(WeakRetained, "didStartLoadingResource");
    searchSuggestionsFetcher = self->_searchSuggestionsFetcher;
    userAgentString = self->_userAgentString;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__SearchSuggestionProvider_setQueryToComplete___block_invoke;
    v15[3] = &unk_1E9CF6250;
    v13 = WeakRetained;
    v16 = v13;
    objc_copyWeak(&v19, &location);
    v17 = v5;
    v20 = forPrivateBrowsing;
    v14 = v7;
    v18 = v14;
    -[WBSSearchSuggestionsFetcher updateSuggestionsRequestWithSearchTerms:userAgentString:completionHandler:](searchSuggestionsFetcher, "updateSuggestionsRequestWithSearchTerms:userAgentString:completionHandler:", v14, userAgentString, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

void __47__SearchSuggestionProvider_setQueryToComplete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  char v14;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "didStopLoadingResource");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(v5, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D8B580]))
      {
        v8 = objc_msgSend(v5, "code");

        if (!v8)
          goto LABEL_9;
      }
      else
      {

      }
      objc_msgSend(WeakRetained, "fail");
    }
    else
    {
      objc_msgSend(v11, "suggestions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __47__SearchSuggestionProvider_setQueryToComplete___block_invoke_2;
      v12[3] = &unk_1E9CF6228;
      v13 = *(id *)(a1 + 40);
      v14 = *(_BYTE *)(a1 + 64);
      objc_msgSend(v9, "safari_mapObjectsUsingBlock:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "setCompletions:forString:", v10, *(_QWORD *)(a1 + 48));
    }
  }
LABEL_9:

}

SearchSuggestion *__47__SearchSuggestionProvider_setQueryToComplete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SearchSuggestion *v4;

  v3 = a2;
  v4 = -[SearchSuggestion initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:]([SearchSuggestion alloc], "initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:", v3, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);

  return v4;
}

- (void)stop
{
  -[WBSSearchSuggestionsFetcher cancelExistingSuggestionsRequest](self->_searchSuggestionsFetcher, "cancelExistingSuggestionsRequest");
  -[WBSSearchSuggestionsFetcher disconnectFromSearchHelperIfNecessary](self->_searchSuggestionsFetcher, "disconnectFromSearchHelperIfNecessary");
}

- (void)dealloc
{
  objc_super v3;

  -[WBSSearchSuggestionsFetcher disconnectFromSearchHelperIfNecessary](self->_searchSuggestionsFetcher, "disconnectFromSearchHelperIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)SearchSuggestionProvider;
  -[SearchSuggestionProvider dealloc](&v3, sel_dealloc);
}

- (unint64_t)maximumCachedCompletionCount
{
  return 100;
}

- (LoadProgressObserver)loadProgressObserver
{
  return (LoadProgressObserver *)objc_loadWeakRetained((id *)&self->_loadProgressObserver);
}

- (void)setLoadProgressObserver:(id)a3
{
  objc_storeWeak((id *)&self->_loadProgressObserver, a3);
}

- (UniversalSearchSession)universalSearchSession
{
  return (UniversalSearchSession *)objc_loadWeakRetained((id *)&self->_universalSearchSession);
}

- (void)setUniversalSearchSession:(id)a3
{
  objc_storeWeak((id *)&self->_universalSearchSession, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_universalSearchSession);
  objc_destroyWeak((id *)&self->_loadProgressObserver);
  objc_storeStrong((id *)&self->_searchSuggestionsFetcher, 0);
  objc_storeStrong((id *)&self->_userAgentString, 0);
  objc_storeStrong((id *)&self->_currentCompletionQuery, 0);
}

@end
