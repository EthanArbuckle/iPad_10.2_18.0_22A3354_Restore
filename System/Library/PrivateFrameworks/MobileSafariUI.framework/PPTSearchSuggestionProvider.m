@implementation PPTSearchSuggestionProvider

- (void)setQueryToComplete:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSString *v8;
  NSString *querySimulated;
  void *v10;
  NSTimer *v11;
  NSTimer *networkDelaySimulatorTimer;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  objc_msgSend(v4, "queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", self->querySimulated);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "queryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    querySimulated = self->querySimulated;
    self->querySimulated = v8;

    v10 = (void *)MEMORY[0x1E0C99E88];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__PPTSearchSuggestionProvider_setQueryToComplete___block_invoke;
    v13[3] = &unk_1E9CF6FE0;
    v13[4] = self;
    v14 = v4;
    objc_msgSend(v10, "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, 0.1);
    v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    networkDelaySimulatorTimer = self->networkDelaySimulatorTimer;
    self->networkDelaySimulatorTimer = v11;

  }
}

void __50__PPTSearchSuggestionProvider_setQueryToComplete___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_generateResultsForQuery:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompletions:forString:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));

}

- (id)_generateResultsForQuery:(id)a3
{
  id v3;
  void *v4;
  SearchSuggestion *v5;
  SearchSuggestion *v6;
  void *v7;
  SearchSuggestion *v8;
  SearchSuggestion *v9;
  void *v10;
  SearchSuggestion *v11;
  SearchSuggestion *v12;
  void *v13;
  SearchSuggestion *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "queryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SearchSuggestion initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:]([SearchSuggestion alloc], "initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:", v4, v3, 0, 0);
  v6 = [SearchSuggestion alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@a"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SearchSuggestion initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:](v6, "initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:", v7, v3, 0, 0);

  v9 = [SearchSuggestion alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ab"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SearchSuggestion initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:](v9, "initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:", v10, v3, 0, 0);

  v12 = [SearchSuggestion alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@abc"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SearchSuggestion initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:](v12, "initWithSearchEngineSuggestion:userQuery:forPrivateBrowsing:isOfflineSearchSuggestion:", v13, v3, 0, 0);

  v17[0] = v5;
  v17[1] = v8;
  v17[2] = v11;
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->querySimulated, 0);
  objc_storeStrong((id *)&self->networkDelaySimulatorTimer, 0);
}

@end
