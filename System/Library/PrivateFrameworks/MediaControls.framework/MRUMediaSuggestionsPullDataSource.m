@implementation MRUMediaSuggestionsPullDataSource

- (MRUMediaSuggestionsPullDataSource)init
{
  MRUMediaSuggestionsPullDataSource *v2;
  uint64_t v3;
  MRMediaSuggestionRequest *request;
  dispatch_queue_t v5;
  OS_dispatch_queue *requestQueue;
  MRMediaSuggestionPreferences *v7;
  MRMediaSuggestionPreferences *preferences;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MRUMediaSuggestionsPullDataSource;
  v2 = -[MRUMediaSuggestionsPullDataSource init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D4C590], "defaultRequestWithArtwork");
    v3 = objc_claimAutoreleasedReturnValue();
    request = v2->_request;
    v2->_request = (MRMediaSuggestionRequest *)v3;

    v5 = dispatch_queue_create("com.apple.MediaControls.MRUMediaSuggestionsPullDataSource/requestQueue", 0);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (OS_dispatch_queue *)v5;

    v7 = (MRMediaSuggestionPreferences *)objc_alloc_init(MEMORY[0x1E0D4C588]);
    preferences = v2->_preferences;
    v2->_preferences = v7;

    objc_initWeak(&location, v2);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__MRUMediaSuggestionsPullDataSource_init__block_invoke;
    v10[3] = &unk_1E5818E18;
    objc_copyWeak(&v11, &location);
    -[MRMediaSuggestionPreferences setUserDisplayPreferencesDidChangeCallback:](v2->_preferences, "setUserDisplayPreferencesDidChangeCallback:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__MRUMediaSuggestionsPullDataSource_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refreshMediaSuggestions");

}

- (NSDictionary)mediaSuggestions
{
  MRUMediaSuggestionsPullDataSource *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSDictionary copy](v2->_mediaSuggestions, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)refreshMediaSuggestions
{
  NSObject *requestQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke;
  block[3] = &unk_1E581BA68;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(requestQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    v5 = -v4 < 60.0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 0;
  }
  if (!*(_BYTE *)(v2 + 8) && !v5)
  {
    *(_BYTE *)(v2 + 8) = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    v11 = *(_QWORD *)(v9 + 56);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_2;
    v12[3] = &unk_1E581BA40;
    v12[4] = v9;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    objc_msgSend(v10, "performWithPreferences:completion:", v11, v12);
    objc_destroyWeak(&v13);
  }
}

void __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_3;
  v11[3] = &unk_1E581BA18;
  v11[4] = v7;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
}

void __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_3(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_sync_enter(v2);
  objc_msgSend(v2, "setMediaSuggestions:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_4;
  v8[3] = &unk_1E5818CB0;
  v8[4] = v2;
  v9 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v8);
  MCLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "%@, %@ request retrieved media suggestions: %@, error: %@", buf, 0x2Au);
  }

}

void __60__MRUMediaSuggestionsPullDataSource_refreshMediaSuggestions__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaSuggestionsDataSource:didChangeMediaSuggestions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (MRUMediaSuggestionsDataSourceDelegate)delegate
{
  return (MRUMediaSuggestionsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setMediaSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSuggestions, a3);
}

- (MRMediaSuggestionRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSDate)lastRequestDate
{
  return self->_lastRequestDate;
}

- (void)setLastRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastRequestDate, a3);
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (MRMediaSuggestionPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (BOOL)requestActive
{
  return self->_requestActive;
}

- (void)setRequestActive:(BOOL)a3
{
  self->_requestActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_mediaSuggestions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
