@implementation ATXFaceSuggestionServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_41 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_41, &__block_literal_global_223);
  return (id)sharedInstance__pasExprOnceResult_52;
}

void __41__ATXFaceSuggestionServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_52;
  sharedInstance__pasExprOnceResult_52 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXFaceSuggestionServer)init
{
  ATXFaceSuggestionServer *v2;
  uint64_t v3;
  ATXPosterConfigurationCache *configurationCache;
  uint64_t v5;
  ATXPosterDescriptorCache *descriptorCache;
  id v7;
  void *v8;
  uint64_t v9;
  _PASSimpleCoalescingTimer *modeFaceSuggestionRefreshCoalescingTimer;
  uint64_t v11;
  ATXFaceSuggestionAssetParameters *assetParameters;
  uint64_t v13;
  ATXComplicationSuggestionGenerator *complicationsGenerator;
  ATXFaceSuggestionGenerator *v15;
  ATXPosterDescriptorCache *v16;
  ATXPosterConfigurationCache *v17;
  ATXComplicationSuggestionGenerator *v18;
  void *v19;
  uint64_t v20;
  ATXFaceSuggestionGenerator *faceSuggestionGenerator;
  void *v22;
  id v23;
  uint64_t v24;
  NSXPCListener *listener;
  NSObject *v26;
  uint64_t v27;
  _ATXInternalUninstallNotification *uninstallNotification;
  uint64_t v29;
  ATXInternalLockedOrHiddenAppNotification *lockedOrHiddenAppNotification;
  ATXInternalLockedOrHiddenAppNotification *v31;
  uint64_t v32;
  uint64_t v33;
  ATXInternalUnLockedOrUnHiddenAppNotification *unlockedOrUnhiddenAppNotification;
  ATXInternalUnLockedOrUnHiddenAppNotification *v35;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  objc_super v41;
  uint8_t buf[4];
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)ATXFaceSuggestionServer;
  v2 = -[ATXFaceSuggestionServer init](&v41, sel_init);
  if (v2)
  {
    +[ATXPosterConfigurationCache sharedInstance](ATXPosterConfigurationCache, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    configurationCache = v2->_configurationCache;
    v2->_configurationCache = (ATXPosterConfigurationCache *)v3;

    +[ATXPosterDescriptorCache sharedInstance](ATXPosterDescriptorCache, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    descriptorCache = v2->_descriptorCache;
    v2->_descriptorCache = (ATXPosterDescriptorCache *)v5;

    -[ATXPosterDescriptorCache registerObserver:](v2->_descriptorCache, "registerObserver:", v2);
    v7 = objc_alloc(MEMORY[0x1E0D81618]);
    dispatch_get_global_queue(17, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithQueue:leewaySeconds:operation:", v8, &__block_literal_global_11_5, 10.0);
    modeFaceSuggestionRefreshCoalescingTimer = v2->_modeFaceSuggestionRefreshCoalescingTimer;
    v2->_modeFaceSuggestionRefreshCoalescingTimer = (_PASSimpleCoalescingTimer *)v9;

    v11 = objc_opt_new();
    assetParameters = v2->_assetParameters;
    v2->_assetParameters = (ATXFaceSuggestionAssetParameters *)v11;

    v13 = objc_opt_new();
    complicationsGenerator = v2->_complicationsGenerator;
    v2->_complicationsGenerator = (ATXComplicationSuggestionGenerator *)v13;

    v15 = [ATXFaceSuggestionGenerator alloc];
    v16 = v2->_descriptorCache;
    v17 = v2->_configurationCache;
    v18 = v2->_complicationsGenerator;
    objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ATXFaceSuggestionGenerator initWithDescriptorCache:configurationCache:complicationProvider:complicationDescriptorProvider:parameters:](v15, "initWithDescriptorCache:configurationCache:complicationProvider:complicationDescriptorProvider:parameters:", v16, v17, v18, v19, v2->_assetParameters);
    faceSuggestionGenerator = v2->_faceSuggestionGenerator;
    v2->_faceSuggestionGenerator = (ATXFaceSuggestionGenerator *)v20;

    -[ATXFaceSuggestionGenerator setDelegate:](v2->_faceSuggestionGenerator, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerObserver:", v2);

    v23 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v24 = objc_msgSend(v23, "initWithMachServiceName:", *MEMORY[0x1E0CF9308]);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v24;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    __atxlog_handle_lock_screen();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[ATXFaceSuggestionServer init]";
      _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "%s: listening for connections", buf, 0xCu);
    }

    v27 = objc_opt_new();
    uninstallNotification = v2->_uninstallNotification;
    v2->_uninstallNotification = (_ATXInternalUninstallNotification *)v27;

    -[_ATXInternalUninstallNotification registerForNotificationsWithUninstallBlock:](v2->_uninstallNotification, "registerForNotificationsWithUninstallBlock:", &__block_literal_global_22_3);
    objc_initWeak((id *)buf, v2);
    v29 = objc_opt_new();
    lockedOrHiddenAppNotification = v2->_lockedOrHiddenAppNotification;
    v2->_lockedOrHiddenAppNotification = (ATXInternalLockedOrHiddenAppNotification *)v29;

    v31 = v2->_lockedOrHiddenAppNotification;
    v32 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __31__ATXFaceSuggestionServer_init__block_invoke_2;
    v39[3] = &unk_1E82DC488;
    objc_copyWeak(&v40, (id *)buf);
    -[ATXInternalLockedOrHiddenAppNotification registerForNotificationsWithLockedOrHiddenAppBlock:](v31, "registerForNotificationsWithLockedOrHiddenAppBlock:", v39);
    v33 = objc_opt_new();
    unlockedOrUnhiddenAppNotification = v2->_unlockedOrUnhiddenAppNotification;
    v2->_unlockedOrUnhiddenAppNotification = (ATXInternalUnLockedOrUnHiddenAppNotification *)v33;

    v35 = v2->_unlockedOrUnhiddenAppNotification;
    v37[0] = v32;
    v37[1] = 3221225472;
    v37[2] = __31__ATXFaceSuggestionServer_init__block_invoke_3;
    v37[3] = &unk_1E82DC460;
    objc_copyWeak(&v38, (id *)buf);
    -[ATXInternalUnLockedOrUnHiddenAppNotification registerForNotificationsWithUnLockedOrUnHiddenAppBlock:](v35, "registerForNotificationsWithUnLockedOrUnHiddenAppBlock:", v37);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

void __31__ATXFaceSuggestionServer_init__block_invoke()
{
  ATXModeFaceSuggestionGenerator *v0;
  void *v1;
  void *v2;
  id v3;

  v3 = (id)os_transaction_create();
  v0 = objc_alloc_init(ATXModeFaceSuggestionGenerator);
  +[ATXPosterDescriptorCache sharedInstance](ATXPosterDescriptorCache, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeFaceSuggestionGenerator generateAndCacheFacesFromDescriptors:](v0, "generateAndCacheFacesFromDescriptors:", v2);

}

void __31__ATXFaceSuggestionServer_init__block_invoke_20()
{
  id v0;

  v0 = (id)objc_opt_new();
  objc_msgSend(v0, "evictCachedSuggestedFaces");

}

void __31__ATXFaceSuggestionServer_init__block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "lockedApps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.mobileslideshow"));

    if (v5)
      objc_msgSend(WeakRetained[5], "regenerateFaceGalleryConfigurationImmediatelyWithReason:", CFSTR("Photos app has been locked"));
  }

}

void __31__ATXFaceSuggestionServer_init__block_invoke_3(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "unLockedApps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.mobileslideshow"));

    if (v5)
      objc_msgSend(WeakRetained[5], "regenerateFaceGalleryConfigurationImmediatelyWithReason:", CFSTR("Photos app has been unlockeed"));
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[ATXFaceSuggestionServer listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: incoming connection", buf, 0xCu);
  }

  objc_msgSend(v7, "valueForEntitlement:", *MEMORY[0x1E0CF9308]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    ATXFaceSuggestionClientXPCInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v10);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_initWeak((id *)buf, v7);
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke;
    v20[3] = &unk_1E82DB988;
    objc_copyWeak(&v21, (id *)buf);
    objc_msgSend(v7, "setInterruptionHandler:", v20);
    v15 = v11;
    v16 = 3221225472;
    v17 = __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_36;
    v18 = &unk_1E82DB988;
    objc_copyWeak(&v19, (id *)buf);
    objc_msgSend(v7, "setInvalidationHandler:", &v15);
    objc_msgSend(v7, "resume", v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
    v12 = 1;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXFaceSuggestionServer listener:shouldAcceptNewConnection:].cold.1();

    v12 = 0;
  }

  return v12;
}

void __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __atxlog_handle_lock_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();

}

void __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_36(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __atxlog_handle_lock_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_36_cold_1();

}

- (void)fetchFaceGalleryConfigurationWithCompletion:(id)a3
{
  ATXFaceSuggestionGenerator *faceSuggestionGenerator;
  id v5;
  id v6;

  faceSuggestionGenerator = self->_faceSuggestionGenerator;
  v5 = a3;
  -[ATXFaceSuggestionGenerator faceGalleryConfiguration](faceSuggestionGenerator, "faceGalleryConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (void)regenerateFaceGalleryConfigurationWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v6 = (id)os_transaction_create();
  -[ATXFaceSuggestionGenerator regenerateFaceGalleryConfigurationImmediatelyWithReason:](self->_faceSuggestionGenerator, "regenerateFaceGalleryConfigurationImmediatelyWithReason:", CFSTR("XPC request or activity"));
  -[ATXFaceSuggestionGenerator faceGalleryConfiguration](self->_faceSuggestionGenerator, "faceGalleryConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, 0);

}

- (void)fetchFaceSuggestionsForFocusMode:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  id v7;
  void *v8;
  void *v9;
  ATXModeFaceSuggestionGenerator *v10;

  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = a3;
  v10 = objc_alloc_init(ATXModeFaceSuggestionGenerator);
  -[ATXPosterDescriptorCache allDescriptors](self->_descriptorCache, "allDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeFaceSuggestionGenerator facesForMode:allDescriptors:](v10, "facesForMode:allDescriptors:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v9, 0);
}

- (void)fetchPosterDescriptorsAndSuggestionDataWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(id, void *, _QWORD);
  id obj;
  uint64_t v22;
  ATXFaceSuggestionScorer *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v20 = (void (**)(id, void *, _QWORD))a3;
  v24 = (void *)objc_opt_new();
  -[ATXPosterDescriptorCache allDescriptors](self->_descriptorCache, "allDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[ATXFaceSuggestionScorer initWithParameters:descriptors:]([ATXFaceSuggestionScorer alloc], "initWithParameters:descriptors:", self->_assetParameters, v4);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v25)
  {
    v22 = *(_QWORD *)v33;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v26 = v5;
        v6 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v5);
        v7 = (void *)objc_opt_new();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        -[ATXFaceSuggestionScorer signals](v23, "signals");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v29;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v29 != v10)
                objc_enumerationMutation(v27);
              v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
              v13 = (objc_class *)objc_opt_class();
              NSStringFromClass(v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v36[0] = CFSTR("weight");
              v15 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v12, "weight");
              objc_msgSend(v15, "numberWithDouble:");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v36[1] = CFSTR("value");
              v37[0] = v16;
              v17 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v12, "valueForDescriptor:", v6);
              objc_msgSend(v17, "numberWithDouble:");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v37[1] = v18;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v14);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
          }
          while (v9);
        }

        objc_msgSend(v24, "setObject:forKeyedSubscript:", v7, v6);
        v5 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v25);
  }

  v20[2](v20, v24, 0);
}

- (void)fetchRankedPosterDescriptors:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  ATXFaceGalleryLayoutGenerator *v5;
  void *v6;
  ATXComplicationSuggestionGenerator *complicationsGenerator;
  void *v8;
  ATXFaceSuggestionAssetParameters *assetParameters;
  void *v10;
  void *v11;
  ATXFaceGalleryLayoutGenerator *v12;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = [ATXFaceGalleryLayoutGenerator alloc];
  -[ATXPosterDescriptorCache descriptors](self->_descriptorCache, "descriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  complicationsGenerator = self->_complicationsGenerator;
  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  assetParameters = self->_assetParameters;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXFaceGalleryLayoutGenerator initWithDescriptors:complicationProvider:complicationDescriptorProvider:parameters:dayZero:locale:](v5, "initWithDescriptors:complicationProvider:complicationDescriptorProvider:parameters:dayZero:locale:", v6, complicationsGenerator, v8, assetParameters, 0, v10);

  -[ATXFaceGalleryLayoutGenerator rankedFeaturedDescriptors](v12, "rankedFeaturedDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v11, 0);

}

- (void)fetchPosterConfigurationsWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ATXFaceSuggestionServer fetchPosterConfigurationsWithCompletion:]";
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[ATXPosterConfigurationCache configurations](self->_configurationCache, "configurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6, 0);

}

- (void)fetchComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  ATXComplicationSuggestionGenerator *complicationsGenerator;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v5 = (void (**)(id, void *, _QWORD))a4;
  v6 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v7, "fetchAccessoryWidgetDescriptorMetadataWithError:", &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;

  v10 = v8;
  if (!v8)
  {
    __atxlog_handle_lock_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXFaceSuggestionServer fetchComplicationSetsForFaceGalleryItem:completion:].cold.1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

    v10 = (void *)MEMORY[0x1E0C9AA70];
  }
  v18 = objc_alloc_init(MEMORY[0x1E0CF8CB8]);
  objc_msgSend(v18, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  complicationsGenerator = self->_complicationsGenerator;
  objc_msgSend(v19, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXCompanionBundleIdMapper generateMappingForAppBundleIds:](_TtC21AppPredictionInternal26ATXCompanionBundleIdMapper, "generateMappingForAppBundleIds:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationSuggestionGenerator modularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](complicationsGenerator, "modularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v10, v19, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v23, 0);
}

- (void)fetchLandscapeComplicationSetsForFaceGalleryItem:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  ATXComplicationSuggestionGenerator *complicationsGenerator;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v5 = (void (**)(id, void *, _QWORD))a4;
  v6 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v7, "fetchAccessoryWidgetDescriptorMetadataWithError:", &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;

  v10 = v8;
  if (!v8)
  {
    __atxlog_handle_lock_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXFaceSuggestionServer fetchComplicationSetsForFaceGalleryItem:completion:].cold.1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

    v10 = (void *)MEMORY[0x1E0C9AA70];
  }
  v18 = objc_alloc_init(MEMORY[0x1E0CF8CB8]);
  objc_msgSend(v18, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  complicationsGenerator = self->_complicationsGenerator;
  objc_msgSend(v19, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXCompanionBundleIdMapper generateMappingForAppBundleIds:](_TtC21AppPredictionInternal26ATXCompanionBundleIdMapper, "generateMappingForAppBundleIds:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplicationSuggestionGenerator landscapeModularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](complicationsGenerator, "landscapeModularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v10, v19, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v23, 0);
}

- (void)posterBoardDidUpdateConfigurations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ATXFaceSuggestionServer posterBoardDidUpdateConfigurations:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  -[ATXPosterConfigurationCache updateConfigurations:completion:](self->_configurationCache, "updateConfigurations:completion:", v6, v7);
}

- (void)posterBoardDidUpdateDescriptors:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ATXFaceSuggestionServer posterBoardDidUpdateDescriptors:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  -[ATXPosterDescriptorCache updateDescriptors:](self->_descriptorCache, "updateDescriptors:", v6);
  v7[2](v7, 1);

}

- (void)inputDescriptionForComplicationSuggestionSignal:(id)a3 completion:(id)a4
{
  ATXComplicationSuggestionGenerator *complicationsGenerator;
  void (**v6)(id, id, _QWORD);
  id v7;

  complicationsGenerator = self->_complicationsGenerator;
  v6 = (void (**)(id, id, _QWORD))a4;
  -[ATXComplicationSuggestionGenerator inputDescriptionForComplicationSuggestionSignal:](complicationsGenerator, "inputDescriptionForComplicationSuggestionSignal:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

}

- (void)fetchComplicationSuggestionsModelDescriptionWithCompletion:(id)a3
{
  ATXComplicationSuggestionGenerator *complicationsGenerator;
  void (**v4)(id, id, _QWORD);
  id v5;

  complicationsGenerator = self->_complicationsGenerator;
  v4 = (void (**)(id, id, _QWORD))a3;
  -[ATXComplicationSuggestionGenerator modelDescription](complicationsGenerator, "modelDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, 0);

}

- (void)fetchInlineComplicationSetForFaceGalleryItem:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  id v7;

  v5 = (void (**)(id, void *, _QWORD))a4;
  v7 = (id)os_transaction_create();
  -[ATXComplicationSuggestionGenerator inlineSet](self->_complicationsGenerator, "inlineSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6, 0);

}

- (void)refreshComplicationsCacheWithCompletion:(id)a3
{
  ATXComplicationSuggestionGenerator *complicationsGenerator;
  void (**v4)(id, _QWORD);

  complicationsGenerator = self->_complicationsGenerator;
  v4 = (void (**)(id, _QWORD))a3;
  -[ATXComplicationSuggestionGenerator refreshComplicationCache](complicationsGenerator, "refreshComplicationCache");
  v4[2](v4, 0);

}

- (void)reloadLockScreenSuggestionsWithCompletion:(id)a3
{
  -[ATXFaceSuggestionServer reloadLockScreenSuggestionsWithActivity:completion:](self, "reloadLockScreenSuggestionsWithActivity:completion:", 0, a3);
}

- (void)reloadLockScreenSuggestionsWithActivity:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CF9208], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke;
  v10[3] = &unk_1E82E9E60;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "refreshWithCompletion:", v10);

}

void __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  ATXModeFaceSuggestionGenerator *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_lock_screen();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_cold_1();

  }
  if (objc_msgSend(*(id *)(a1 + 32), "didDefer"))
  {
    __atxlog_handle_lock_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[ATXFaceSuggestionServer reloadLockScreenSuggestionsWithActivity:completion:]_block_invoke";
      v9 = "%s: deferred after fetching watch faces";
LABEL_11:
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "refreshComplicationCache");

  if (objc_msgSend(*(id *)(a1 + 32), "didDefer"))
  {
    __atxlog_handle_lock_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[ATXFaceSuggestionServer reloadLockScreenSuggestionsWithActivity:completion:]_block_invoke";
      v9 = "%s: deferred after refreshing complication cache";
      goto LABEL_11;
    }
LABEL_12:

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  v11 = objc_alloc_init(ATXModeFaceSuggestionGenerator);
  +[ATXPosterDescriptorCache sharedInstance](ATXPosterDescriptorCache, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allDescriptors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeFaceSuggestionGenerator generateAndCacheFacesFromDescriptors:](v11, "generateAndCacheFacesFromDescriptors:", v13);

  if (objc_msgSend(*(id *)(a1 + 32), "didDefer"))
  {
    __atxlog_handle_lock_screen();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[ATXFaceSuggestionServer reloadLockScreenSuggestionsWithActivity:completion:]_block_invoke";
      _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "%s: deferred after refreshing mode face suggestions", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[ATXFaceSuggestionServer sharedInstance](ATXFaceSuggestionServer, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_56;
    v16[3] = &unk_1E82E9E38;
    v17 = *(id *)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v15, "regenerateFaceGalleryConfigurationWithCompletion:", v16);

  }
LABEL_19:

}

void __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  __atxlog_handle_lock_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_56_cold_2();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315138;
    v20 = "-[ATXFaceSuggestionServer reloadLockScreenSuggestionsWithActivity:completion:]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: successfully regenerated face gallery configuration", (uint8_t *)&v19, 0xCu);
  }

  v9 = objc_msgSend(*(id *)(a1 + 32), "setDone");
  __atxlog_handle_lock_screen();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = "-[ATXFaceSuggestionServer reloadLockScreenSuggestionsWithActivity:completion:]_block_invoke";
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "%s: activity set to DONE", (uint8_t *)&v19, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_56_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchScoredComplicationDescriptionWithCompletion:(id)a3
{
  ATXComplicationSuggestionGenerator *complicationsGenerator;
  id v5;
  id v6;

  complicationsGenerator = self->_complicationsGenerator;
  v5 = a3;
  -[ATXComplicationSuggestionGenerator scoredComplicationsDescription](complicationsGenerator, "scoredComplicationsDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (void)fetchMetricsDescriptionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "dailyMetricsDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a3 + 2))(v4, v5, 0);

}

- (void)logPosterEdit:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a4;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "postEditMetricWithEvent:", v5);

  v7[2](v7, 0);
}

- (void)logPosterEditUIViewedWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)logPosterSwitch:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a4;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "postSwitchMetricWithEvent:", v5);

  v7[2](v7, 0);
}

- (void)logFaceGalleryDidAppearWithFaceGalleryConfiguration:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v5 = *MEMORY[0x1E0CF95C8];
  v6 = v4;
  if ((objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0CF95C8]) & 1) == 0)
    objc_msgSend(v6, "setBool:forKey:", 1, v5);

}

- (void)logComplicationsSeenInGalleryWithEngagements:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(id, _QWORD);
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = (void (**)(id, _QWORD))a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue");

        if (v15 >= 5)
          v15 = 5;
        v16 = (void *)objc_opt_new();
        objc_msgSend(v13, "extensionBundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setExtensionBundleId:", v17);

        objc_msgSend(v16, "setFamily:", objc_msgSend(v13, "widgetFamily"));
        objc_msgSend(v13, "kind");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setKind:", v18);

        objc_msgSend(v16, "setReason:", (int)objc_msgSend(v13, "source"));
        objc_msgSend(v16, "setOutcome:", 0);
        objc_msgSend(v16, "setNumEngaged:", v15);
        objc_msgSend(v16, "setSessionId:", v7);
        objc_msgSend(v16, "logToCoreAnalytics");

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v19[2](v19, 0);
}

- (void)logFaceGalleryItemsSeenInGalleryWithOutcomes:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
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
  int v17;
  uint64_t v18;
  uint64_t v19;
  void (**v20)(id, _QWORD);
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = (void (**)(id, _QWORD))a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_opt_new();
        objc_msgSend(v13, "extensionBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setExtensionBundleId:", v16);

        objc_msgSend(v15, "setSection:", objc_msgSend(v13, "source"));
        objc_msgSend(v15, "setSessionId:", v7);
        v17 = objc_msgSend(v14, "isEqualToString:", CFSTR("viewed"));
        if ((v17 & 1) != 0 || (objc_msgSend(v14, "isEqualToString:", CFSTR("tapped")) & 1) != 0)
        {
          v18 = 0;
LABEL_9:
          objc_msgSend(v15, "setOutcome:", v18);
          objc_msgSend(v15, "setEngaged:", v17 ^ 1u);
          goto LABEL_10;
        }
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("added")))
        {
          v18 = 1;
          goto LABEL_9;
        }
LABEL_10:
        objc_msgSend(v15, "logToCoreAnalytics");

        ++v12;
      }
      while (v10 != v12);
      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v10 = v19;
    }
    while (v19);
  }

  v20[2](v20, 0);
}

- (void)synchronousDateOfLastGalleryAppearanceWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;

  v3 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__97;
  v14[4] = __Block_byref_object_dispose__97;
  v15 = 0;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "publisherFromStartTime:", 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "last");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__ATXFaceSuggestionServer_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke;
  v11[3] = &unk_1E82E9E88;
  v8 = v3;
  v12 = v8;
  v13 = v14;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __80__ATXFaceSuggestionServer_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke_72;
  v10[3] = &unk_1E82DBE68;
  v10[4] = v14;
  v9 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", v11, v10);

  _Block_object_dispose(v14, 8);
}

void __80__ATXFaceSuggestionServer_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[ATXFaceSuggestionServer synchronousDateOfLastGalleryAppearanceWithCompletion:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%s: failed to fetch Biome events with error %@", (uint8_t *)&v9, 0x16u);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v3, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);

}

void __80__ATXFaceSuggestionServer_synchronousDateOfLastGalleryAppearanceWithCompletion___block_invoke_72(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "timestamp");
  v7 = v6;

  v8 = objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:", v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)generatorDidUpdateFaceGalleryConfiguration:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)getPRSServiceClass_softClass_0;
  v14 = getPRSServiceClass_softClass_0;
  v5 = MEMORY[0x1E0C809B0];
  if (!getPRSServiceClass_softClass_0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getPRSServiceClass_block_invoke_0;
    v10[3] = &unk_1E82DA7D8;
    v10[4] = &v11;
    __getPRSServiceClass_block_invoke_0((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __70__ATXFaceSuggestionServer_generatorDidUpdateFaceGalleryConfiguration___block_invoke;
  v8[3] = &unk_1E82E6638;
  v9 = (id)objc_opt_new();
  v7 = v9;
  objc_msgSend(v7, "pushPosterGalleryUpdate:completion:", v3, v8);

}

void __70__ATXFaceSuggestionServer_generatorDidUpdateFaceGalleryConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__ATXFaceSuggestionServer_generatorDidUpdateFaceGalleryConfiguration___block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 136315394;
    v8 = "-[ATXFaceSuggestionServer generatorDidUpdateFaceGalleryConfiguration:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: service: %@, successfully pushed face gallery configuration to PosterBoard", (uint8_t *)&v7, 0x16u);
  }

}

- (void)widgetDescriptorCacheDidUpdateDescriptors:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ATXFaceSuggestionServer widgetDescriptorCacheDidUpdateDescriptors:]";
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%s: refreshing complication cache", (uint8_t *)&v5, 0xCu);
  }

  -[ATXComplicationSuggestionGenerator refreshComplicationCache](self->_complicationsGenerator, "refreshComplicationCache");
}

- (void)descriptorCacheDidUpdateWithDescriptors:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ATXFaceSuggestionServer descriptorCacheDidUpdateWithDescriptors:]";
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%s: scheduling mode face suggestions cache refresh due to descriptor update", (uint8_t *)&v5, 0xCu);
  }

  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_modeFaceSuggestionRefreshCoalescingTimer, "runAfterDelaySeconds:coalescingBehavior:", 1, 30.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_modeFaceSuggestionRefreshCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_unlockedOrUnhiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_lockedOrHiddenAppNotification, 0);
  objc_storeStrong((id *)&self->_uninstallNotification, 0);
  objc_storeStrong((id *)&self->_faceSuggestionGenerator, 0);
  objc_storeStrong((id *)&self->_complicationsGenerator, 0);
  objc_storeStrong((id *)&self->_assetParameters, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
  objc_storeStrong((id *)&self->_configurationCache, 0);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_11(&dword_1C9A3B000, v0, v1, "%s: rejecting connection %@ without entitlement %@", v2);
}

void __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: connection interrupted: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __62__ATXFaceSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_36_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: connection invalidated: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchComplicationSetsForFaceGalleryItem:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Could not load accessory widget descriptors while fetching complication sets: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: Error refreshing watch face configurations: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_56_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: could not set activity to DONE", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __78__ATXFaceSuggestionServer_reloadLockScreenSuggestionsWithActivity_completion___block_invoke_56_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: error regenerating face gallery configuration: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __70__ATXFaceSuggestionServer_generatorDidUpdateFaceGalleryConfiguration___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[ATXFaceSuggestionServer generatorDidUpdateFaceGalleryConfiguration:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_1_11(&dword_1C9A3B000, a2, a3, "%s: service: %@, error pushing face gallery configuration to PosterBoard: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], a2);
}

@end
