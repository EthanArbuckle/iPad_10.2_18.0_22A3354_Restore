@implementation MKAutocompleteAnalyticsProvider

- (MKAutocompleteAnalyticsProvider)init
{
  MKAutocompleteAnalyticsProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *isolationQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MKAutocompleteAnalyticsProvider;
  v2 = -[MKAutocompleteAnalyticsProvider init](&v13, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@.isolationQueue.%p"), v5, objc_opt_class(), v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_retainAutorelease(v6);
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

- (void)updateStateWithQuery:(id)a3 queryTokens:(id)a4 visibleSuggestionEntries:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MKAutocompleteAnalyticsProvider isolationQueue](self, "isolationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__MKAutocompleteAnalyticsProvider_updateStateWithQuery_queryTokens_visibleSuggestionEntries___block_invoke;
  v15[3] = &unk_1E20D9B98;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __93__MKAutocompleteAnalyticsProvider_updateStateWithQuery_queryTokens_visibleSuggestionEntries___block_invoke(uint64_t a1)
{
  MKAutocompleteAnalyticsState *v2;

  v2 = -[MKAutocompleteAnalyticsState initWithQuery:queryTokens:suggestionEntries:]([MKAutocompleteAnalyticsState alloc], "initWithQuery:queryTokens:suggestionEntries:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", v2);

}

- (id)captureNewMetrics
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[MKAutocompleteAnalyticsProvider isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__25;
  v12 = __Block_byref_object_dispose__25;
  v13 = 0;
  -[MKAutocompleteAnalyticsProvider isolationQueue](self, "isolationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__MKAutocompleteAnalyticsProvider_captureNewMetrics__block_invoke;
  v7[3] = &unk_1E20D7F20;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __52__MKAutocompleteAnalyticsProvider_captureNewMetrics__block_invoke(uint64_t a1)
{
  void *v2;
  MKLocalSearchKeypressMetrics *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = [MKLocalSearchKeypressMetrics alloc];
    objc_msgSend(*(id *)(a1 + 32), "currentState");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "query");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryTokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestionEntries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MKLocalSearchKeypressMetrics initWithQuery:queryTokens:suggestionEntries:](v3, "initWithQuery:queryTokens:suggestionEntries:", v4, v6, v8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_isolationQueue, a3);
}

- (MKAutocompleteAnalyticsState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
