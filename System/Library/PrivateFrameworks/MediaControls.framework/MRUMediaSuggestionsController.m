@implementation MRUMediaSuggestionsController

- (MRUMediaSuggestionsController)initWithEndpointController:(id)a3 metadataController:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  MRUMediaSuggestionsController *v12;
  MRUMediaSuggestionsController *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *requestQueue;
  uint64_t v16;
  MRULockScreenMonitor *lockscreenMonitor;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MRUMediaSuggestionsController;
  v12 = -[MRUMediaSuggestionsController init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endpointController, a3);
    if (objc_msgSend(v9, "updatesActiveEndpointInPlace"))
      -[MRUEndpointController addObserver:](v13->_endpointController, "addObserver:", v13);
    objc_storeStrong((id *)&v13->_metadataController, a4);
    -[MRUMetadataController addObserver:](v13->_metadataController, "addObserver:", v13);
    objc_storeStrong((id *)&v13->_dataSource, a5);
    -[MRUMediaSuggestionsDataSource setDelegate:](v13->_dataSource, "setDelegate:", v13);
    v14 = dispatch_queue_create("com.apple.MediaControls.MRUMediaSuggestionsController/requestQueue", 0);
    requestQueue = v13->_requestQueue;
    v13->_requestQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_context, (id)*MEMORY[0x1E0D4C328]);
    +[MRULockScreenMonitor sharedMonitor](MRULockScreenMonitor, "sharedMonitor");
    v16 = objc_claimAutoreleasedReturnValue();
    lockscreenMonitor = v13->_lockscreenMonitor;
    v13->_lockscreenMonitor = (MRULockScreenMonitor *)v16;

    -[MRULockScreenMonitor addObserver:](v13->_lockscreenMonitor, "addObserver:", v13);
    objc_msgSend(v10, "nowPlayingInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_isPlaying = objc_msgSend(v18, "isPlaying");

    -[MRUMediaSuggestionsController updateLastPlayedDate](v13, "updateLastPlayedDate");
  }

  return v13;
}

- (void)setContext:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_context, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_context, a3);
    -[MRUMediaSuggestionsController updateMediaSuggestions](self, "updateMediaSuggestions");
  }

}

- (void)setIsQueueHandoffActive:(BOOL)a3
{
  if (self->_isQueueHandoffActive != a3)
  {
    self->_isQueueHandoffActive = a3;
    -[MRUMediaSuggestionsController updateMediaSuggestions](self, "updateMediaSuggestions");
  }
}

- (void)setMediaSuggestions:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_mediaSuggestions, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_mediaSuggestions, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "mediaSuggestionsController:didChangeMediaSuggestions:", self, v6);

  }
}

- (void)refreshMediaSuggestions
{
  -[MRUMediaSuggestionsDataSource refreshMediaSuggestions](self->_dataSource, "refreshMediaSuggestions");
}

- (void)playSuggestion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[MRUEndpointController route](self->_endpointController, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__MRUMediaSuggestionsController_playSuggestion_completion___block_invoke;
  v12[3] = &unk_1E581C160;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v11, "playOnEndpoint:completion:", v9, v12);

}

void __59__MRUMediaSuggestionsController_playSuggestion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    MCLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v11 = v5;
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = v3;
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Error trying to play suggestion: %{public}@ error: %{public}@", buf, 0x20u);
    }

  }
  if (*(_QWORD *)(a1 + 48))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__MRUMediaSuggestionsController_playSuggestion_completion___block_invoke_1;
    v7[3] = &unk_1E58194F0;
    v9 = *(id *)(a1 + 48);
    v8 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __59__MRUMediaSuggestionsController_playSuggestion_completion___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)metadataController:(id)a3 didChangeNowPlayingInfo:(id)a4
{
  -[MRUMediaSuggestionsController updatePlayingState](self, "updatePlayingState", a3, a4);
  -[MRUMediaSuggestionsController updateMediaSuggestions](self, "updateMediaSuggestions");
}

- (void)updatePlayingState
{
  void *v3;
  void *v4;
  char v5;
  NSDate *v6;
  NSDate *lastPlayingDate;
  id v8;

  -[MRUMetadataController nowPlayingInfo](self->_metadataController, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v8 = v3;
  if (self->_isPlaying)
  {
    v5 = objc_msgSend(v3, "isPlaying");
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastPlayingDate = self->_lastPlayingDate;
      self->_lastPlayingDate = v6;

      v4 = v8;
    }
  }
  self->_isPlaying = objc_msgSend(v4, "isPlaying");

}

- (void)updateMediaSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSDate *lastPlayingDate;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;
  int v13;
  _BOOL4 isQueueHandoffActive;
  _BOOL4 v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  id WeakRetained;
  _BOOL4 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  int v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[MRUMetadataController nowPlayingInfo](self->_metadataController, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaSuggestionsDataSource mediaSuggestions](self->_dataSource, "mediaSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", self->_context);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "count");
  lastPlayingDate = self->_lastPlayingDate;
  if (lastPlayingDate)
  {
    -[NSDate timeIntervalSinceNow](lastPlayingDate, "timeIntervalSinceNow");
    v10 = -v9 >= 480.0;
  }
  else
  {
    v10 = 0;
  }
  if (-[MRUEndpointController isEndpointDiscovered](self->_endpointController, "isEndpointDiscovered"))
    v28 = -[MRUEndpointController state](self->_endpointController, "state") == 3;
  else
    v28 = 0;
  v11 = -[MRULockScreenMonitor isDeviceLocked](self->_lockscreenMonitor, "isDeviceLocked");
  v12 = objc_msgSend(v3, "isPlaying");
  v13 = objc_msgSend(v3, "showPlaceholder");
  isQueueHandoffActive = self->_isQueueHandoffActive;
  v15 = +[MRUFeatureFlagProvider isMediaSuggestionsDevEnabled](MRUFeatureFlagProvider, "isMediaSuggestionsDevEnabled");
  v16 = !v11;
  v17 = v7 >= 4 || v15;
  v18 = v15 || v10;
  if ((v16 & 1) == 0)
  {
    v19 = 0;
    v20 = MRUseInternalUI() ^ 1;
    if (isQueueHandoffActive)
      v20 = 1;
    if (((v20 | v12 | v17 ^ 1) & 1) != 0)
      goto LABEL_22;
LABEL_18:
    if (v28)
    {
      if (v18 | v13)
        v19 = v6;
      else
        v19 = 0;
    }
    goto LABEL_22;
  }
  v19 = 0;
  v21 = v17 ^ 1;
  if (isQueueHandoffActive)
    v21 = 1;
  if (((v21 | v12) & 1) == 0)
    goto LABEL_18;
LABEL_22:
  v22 = v19;

  if (!-[NSArray isEqualToArray:](self->_mediaSuggestions, "isEqualToArray:", v22))
  {
    objc_storeStrong((id *)&self->_mediaSuggestions, v19);
    MCLogCategoryDefault();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_opt_class();
      v25 = objc_msgSend(v22, "count");
      v26 = self->_isQueueHandoffActive;
      *(_DWORD *)buf = 138545154;
      v30 = v24;
      v31 = 2048;
      v32 = v25;
      v33 = 1024;
      v34 = v16;
      v35 = 1024;
      v36 = v26;
      v37 = 1024;
      v38 = objc_msgSend(v3, "isPlaying");
      v39 = 1024;
      v40 = v28;
      v41 = 1024;
      v42 = v18;
      v43 = 1024;
      v44 = objc_msgSend(v3, "showPlaceholder");
      _os_log_impl(&dword_1AA991000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ update media suggestions: #%lu | unlocked: %{BOOL}u | QHO: %{BOOL}u | playing: %{BOOL}u, connected: %{BOOL}u | elapsed: %{BOOL}u | placeholder: %{BOOL}u", buf, 0x3Au);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "mediaSuggestionsController:didChangeMediaSuggestions:", self, v22);

  }
}

- (void)updateLastPlayedDate
{
  void *v3;
  void *v4;
  void *v5;
  OS_dispatch_queue *requestQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  -[MRUEndpointController route](self->_endpointController, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v3, "endpoint"), "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C5B0]), "initWithOrigin:", v4);
  objc_initWeak(&location, self);
  requestQueue = self->_requestQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__MRUMediaSuggestionsController_updateLastPlayedDate__block_invoke;
  v8[3] = &unk_1E581C188;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "requestDeviceLastPlayingDateOnQueue:completion:", requestQueue, v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __53__MRUMediaSuggestionsController_updateLastPlayedDate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    MCLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_ERROR, "%@, failed to get the last playing date for origin: %@, error: %@", buf, 0x20u);
    }

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__MRUMediaSuggestionsController_updateLastPlayedDate__block_invoke_7;
  v11[3] = &unk_1E5818C18;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  v12 = v5;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v13);
}

void __53__MRUMediaSuggestionsController_updateLastPlayedDate__block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLastPlayingDate:", v1);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "updateMediaSuggestions");

}

- (MRUEndpointController)endpointController
{
  return self->_endpointController;
}

- (MRUMetadataController)metadataController
{
  return self->_metadataController;
}

- (MRUMediaSuggestionsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (MRUMediaSuggestionsControllerDelegate)delegate
{
  return (MRUMediaSuggestionsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)mediaSuggestions
{
  return self->_mediaSuggestions;
}

- (NSString)context
{
  return self->_context;
}

- (BOOL)isQueueHandoffActive
{
  return self->_isQueueHandoffActive;
}

- (MRULockScreenMonitor)lockscreenMonitor
{
  return self->_lockscreenMonitor;
}

- (void)setLockscreenMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_lockscreenMonitor, a3);
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (NSDate)lastPlayingDate
{
  return self->_lastPlayingDate;
}

- (void)setLastPlayingDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlayingDate, a3);
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlayingDate, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_lockscreenMonitor, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_mediaSuggestions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_metadataController, 0);
  objc_storeStrong((id *)&self->_endpointController, 0);
}

@end
