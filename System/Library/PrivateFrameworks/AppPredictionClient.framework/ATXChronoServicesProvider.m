@implementation ATXChronoServicesProvider

- (ATXChronoServicesProvider)init
{
  void *v3;
  void *v4;
  ATXChronoServicesProvider *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXChronoServicesProvider initWithProactiveService:widgetMetricsService:](self, "initWithProactiveService:widgetMetricsService:", v3, v4);

  return v5;
}

- (ATXChronoServicesProvider)initWithProactiveService:(id)a3 widgetMetricsService:(id)a4
{
  id v7;
  id v8;
  ATXChronoServicesProvider *v9;
  ATXChronoServicesProvider *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  uint64_t v18;
  _PASQueueLock *lock;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ATXChronoServicesProvider;
  v9 = -[ATXChronoServicesProvider init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_proactiveService, a3);
    objc_storeStrong((id *)&v10->_widgetMetricService, a4);
    v11 = (_QWORD *)objc_opt_new();
    v12 = (void *)v11[1];
    v11[1] = 0;

    v13 = (void *)v11[2];
    v11[2] = MEMORY[0x1E0C9AA70];

    v14 = objc_opt_new();
    v15 = (void *)v11[3];
    v11[3] = v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.proactive.ATXChronoServicesProvider", v16);

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81600]), "initWithGuardedData:serialQueue:", v11, v17);
    lock = v10->_lock;
    v10->_lock = (_PASQueueLock *)v18;

  }
  return v10;
}

- (void)resetToPrewarmWidgetsInSuggestions:(id)a3
{
  id v4;
  _PASQueueLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ATXChronoServicesProvider_resetToPrewarmWidgetsInSuggestions___block_invoke;
  v7[3] = &unk_1E4D5A6A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v7);

}

void __64__ATXChronoServicesProvider_resetToPrewarmWidgetsInSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id *v8;
  uint64_t v9;
  _QWORD v10[4];
  id *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_removeOudatedFailureEntriesInGuardedData:", v3);
  objc_msgSend(v3[1], "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateGuardedData:withNewCachedSuggestions:", v3, *(_QWORD *)(a1 + 40));
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v7 = v3[2];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__ATXChronoServicesProvider_resetToPrewarmWidgetsInSuggestions___block_invoke_2;
  v10[3] = &unk_1E4D5A678;
  v13 = &v14;
  v8 = v3;
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
  if (!v15[3])
    objc_msgSend(*(id *)(a1 + 32), "_updateAndSendHomeScreenSuggestionsToDelegateWithGuardedData:", v8);

  _Block_object_dispose(&v14, 8);
}

void __64__ATXChronoServicesProvider_resetToPrewarmWidgetsInSuggestions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "state");
  if (!v7 || v7 == 3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      __atxlog_handle_home_screen();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543618;
        v11 = v8;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Short-circuit widget reload because it recently failed at %{public}@: %@", (uint8_t *)&v10, 0x16u);
      }

      objc_msgSend(v6, "setState:", 3);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_requestChronoToLoadWidget:inGuardedData:", v5, *(_QWORD *)(a1 + 32));
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }

  }
  else if (v7 == 1)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

- (void)_removeOudatedFailureEntriesInGuardedData:(id)a3
{
  id *v3;
  id v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v3 = (id *)a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  v4 = v3[3];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__ATXChronoServicesProvider__removeOudatedFailureEntriesInGuardedData___block_invoke;
  v5[3] = &unk_1E4D5A6C8;
  v5[4] = &v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  if (objc_msgSend((id)v7[5], "count"))
    objc_msgSend(v3[3], "removeObjectsForKeys:", v7[5]);
  _Block_object_dispose(&v6, 8);

}

void __71__ATXChronoServicesProvider__removeOudatedFailureEntriesInGuardedData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(a3, "timeIntervalSinceNow");
  if (v5 < -1800.0)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      v7 = objc_opt_new();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v6, "addObject:", v10);
  }

}

- (void)_updateGuardedData:(id)a3 withNewCachedSuggestions:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int IsSpecialWidgetExtensionBundleId;
  id v21;
  id v22;
  id v23;
  id obj;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  id *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v31 = (id *)a3;
  v6 = a4;
  v30 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v26 = v6;
  objc_msgSend(v6, "cachedSuggestedWidgetsLayouts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v37;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(obj);
        v28 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v7);
        objc_msgSend(v26, "cachedSuggestedWidgetsLayouts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v29 = v10;
        v11 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v33 != v13)
                objc_enumerationMutation(v29);
              v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              -[ATXChronoServicesProvider _widgetFromSuggestionLayout:](self, "_widgetFromSuggestionLayout:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_msgSend(v31[2], "objectForKeyedSubscript:", v16);
                v17 = objc_claimAutoreleasedReturnValue();
                if (!v17)
                {
                  v17 = objc_opt_new();
                  -[NSObject setState:](v17, "setState:", 0);
                }
                objc_msgSend(v16, "extensionIdentity");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "extensionBundleIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                IsSpecialWidgetExtensionBundleId = ATXBundleIdIsSpecialWidgetExtensionBundleId();

                if (IsSpecialWidgetExtensionBundleId)
                  -[NSObject setState:](v17, "setState:", 2);
                -[NSObject setWidget:](v17, "setWidget:", v16);
                -[NSObject setSuggestedStackId:](v17, "setSuggestedStackId:", v8);
                objc_msgSend(v30, "setObject:forKeyedSubscript:", v17, v16);
              }
              else
              {
                __atxlog_handle_home_screen();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v41 = v8;
                  v42 = 2112;
                  v43 = v15;
                  _os_log_fault_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_FAULT, "ATXChronoServicesProvider: Unable to prewarm suggested widget for stack %{public}@ due to failure of converting suggestion layout into ATXHomeScreenWidgetIdentifiable. Layout: \n%@", buf, 0x16u);
                }
              }

            }
            v12 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
          }
          while (v12);
        }

        v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v27);
  }

  v21 = v31[1];
  v31[1] = v26;
  v22 = v26;

  v23 = v31[2];
  v31[2] = v30;

}

- (id)_widgetFromSuggestionLayout:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  +[ATXHomeScreenStackSuggestion widgetFromSuggestionLayout:](ATXHomeScreenStackSuggestion, "widgetFromSuggestionLayout:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D10148]);
    v5 = objc_alloc(MEMORY[0x1E0D10038]);
    objc_msgSend(v3, "extensionBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v6, v7, 0);
    objc_msgSend(v3, "widgetKind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CHSWidgetFamilyFromATXStackLayoutSize(objc_msgSend(v3, "size"));
    objc_msgSend(v3, "intent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v4, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v8, v9, v10, v11, 0);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_requestChronoToLoadWidget:(id)a3 inGuardedData:(id)a4
{
  id v6;
  id *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  CHSProactiveService *proactiveService;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (id *)a4;
  __atxlog_handle_home_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Requesting Chrono to load widget %@", buf, 0xCu);
  }

  objc_msgSend(v7[2], "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SBSWidgetMetricsService systemMetricsForWidget:](self->_widgetMetricService, "systemMetricsForWidget:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "setState:", 1);
      proactiveService = self->_proactiveService;
      objc_msgSend(v9, "suggestedStackId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70__ATXChronoServicesProvider__requestChronoToLoadWidget_inGuardedData___block_invoke;
      v15[3] = &unk_1E4D5A6F0;
      v15[4] = self;
      v16 = v6;
      -[CHSProactiveService loadSuggestedWidget:metrics:stackIdentifier:completion:](proactiveService, "loadSuggestedWidget:metrics:stackIdentifier:completion:", v16, v10, v12, v15);

    }
    else
    {
      __atxlog_handle_home_screen();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXChronoServicesProvider _requestChronoToLoadWidget:inGuardedData:].cold.2((uint64_t)v6, v13);

      objc_msgSend(v9, "setState:", 3);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7[3], "setObject:forKeyedSubscript:", v14, v6);

    }
  }
  else
  {
    __atxlog_handle_home_screen();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXChronoServicesProvider _requestChronoToLoadWidget:inGuardedData:].cold.1((uint64_t)v6, v10);
  }

}

uint64_t __70__ATXChronoServicesProvider__requestChronoToLoadWidget_inGuardedData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_chronoDidReplyHandle:timelineEntries:forWidget:withError:", a2, a3, *(_QWORD *)(a1 + 40), a4);
}

- (void)_chronoDidReplyHandle:(id)a3 timelineEntries:(id)a4 forWidget:(id)a5 withError:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PASQueueLock *lock;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  ATXChronoServicesProvider *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  lock = self->_lock;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__ATXChronoServicesProvider__chronoDidReplyHandle_timelineEntries_forWidget_withError___block_invoke;
  v19[3] = &unk_1E4D5A718;
  v20 = v10;
  v21 = v13;
  v22 = v12;
  v23 = self;
  v24 = v11;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v10;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v19);

}

void __87__ATXChronoServicesProvider__chronoDidReplyHandle_timelineEntries_forWidget_withError___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    __atxlog_handle_home_screen();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v38 = v8;
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Chrono successfully loaded widget %@.", buf, 0xCu);
    }

    v5 = objc_msgSend(*(id *)(a1 + 56), "_shouldBlockSuggestionForWidget:entries:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64)) ^ 1;
    v6 = 1;
  }
  else
  {
    __atxlog_handle_home_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __87__ATXChronoServicesProvider__chronoDidReplyHandle_timelineEntries_forWidget_withError___block_invoke_cold_1(a1, (uint64_t *)(a1 + 32), v4);

    v5 = 0;
    v6 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + 32));
  objc_msgSend(WeakRetained, "chronoServiceProvider:reloadDidCompleteForWidget:success:widgetIsReadyForDisplay:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v6, v5, *(_QWORD *)(a1 + 40));

  objc_msgSend(v3[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if ((v5 & 1) != 0)
    {
      if (v12)
      {
        v13 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v38 = v13;
        _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Widget is OK to display %@.", buf, 0xCu);
      }

      objc_msgSend(v10, "setState:", 2);
      objc_msgSend(v10, "setWidgetHandle:", *(_QWORD *)(a1 + 32));
      goto LABEL_30;
    }
    v31 = v10;
    v32 = v3;
    if (v12)
    {
      v14 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v38 = v14;
      _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Widget is NOT OK to display %@.", buf, 0xCu);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = *(id *)(a1 + 64);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (!v16)
    {
LABEL_29:

      v10 = v31;
      objc_msgSend(v31, "setState:", 3);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v32;
      objc_msgSend(v32[3], "setObject:forKeyedSubscript:", v30, *(_QWORD *)(a1 + 48));

LABEL_30:
      if (objc_msgSend(*(id *)(a1 + 56), "_allReloadsAreCompletedInGuardedData:", v3))
        objc_msgSend(*(id *)(a1 + 56), "_updateAndSendHomeScreenSuggestionsToDelegateWithGuardedData:", v3);
      goto LABEL_32;
    }
    v17 = v16;
    v18 = *(_QWORD *)v34;
LABEL_18:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v19);
      objc_msgSend(v20, "relevance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      __atxlog_handle_home_screen();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          objc_msgSend(v20, "date");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "relevance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "score");
          v27 = v26;
          objc_msgSend(v20, "relevance");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "duration");
          *(_DWORD *)buf = 138412802;
          v38 = v24;
          v39 = 2048;
          v40 = v27;
          v41 = 2048;
          v42 = v29;
          _os_log_impl(&dword_1A49EF000, v22, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: timeline entry at %@ has relevance score %f duration %f", buf, 0x20u);

LABEL_26:
        }
      }
      else if (v23)
      {
        objc_msgSend(v20, "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v24;
        _os_log_impl(&dword_1A49EF000, v22, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: timeline entry at %@ has nil relevance", buf, 0xCu);
        goto LABEL_26;
      }

      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        if (!v17)
          goto LABEL_29;
        goto LABEL_18;
      }
    }
  }
LABEL_32:

}

- (BOOL)_shouldBlockSuggestionForWidget:(id)a3 entries:(id)a4
{
  return -[ATXChronoServicesProvider _isCurrentTimelineRelevanceScoreNonPositiveForEntries:](self, "_isCurrentTimelineRelevanceScoreNonPositiveForEntries:", a4);
}

- (BOOL)_isCurrentTimelineRelevanceScoreNonPositiveForEntries:(id)a3
{
  void *v3;
  double v4;
  double v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_54);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v7)
  {

    v9 = 0;
    v8 = 0;
    goto LABEL_21;
  }
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v27;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v27 != v10)
      objc_enumerationMutation(v6);
    v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
    objc_msgSend(v12, "date", (_QWORD)v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    v15 = v14;

    if (v15 > v5)
      break;
    objc_msgSend(v12, "relevance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v12, "relevance");
      v17 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "date");
      v18 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v17;
      v9 = (void *)v18;
    }
    if (v7 == ++v11)
    {
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v7)
        goto LABEL_3;
      break;
    }
  }

  if (!v8)
  {
LABEL_20:
    LOBYTE(v7) = 0;
    goto LABEL_21;
  }
  objc_msgSend(v8, "duration");
  if (v19 >= 0.0)
  {
    objc_msgSend(v8, "duration");
    if (v20 == 0.0
      || (objc_msgSend(v9, "timeIntervalSinceReferenceDate"), v22 = v21, objc_msgSend(v8, "duration"), v5 < v22 + v23))
    {
      objc_msgSend(v8, "score");
      LOBYTE(v7) = v24 <= 0.0;
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  __atxlog_handle_home_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[ATXChronoServicesProvider _isCurrentTimelineRelevanceScoreNonPositiveForEntries:].cold.1(v7);

  LOBYTE(v7) = 1;
LABEL_21:

  return (char)v7;
}

uint64_t __83__ATXChronoServicesProvider__isCurrentTimelineRelevanceScoreNonPositiveForEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  objc_msgSend(v4, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  if (v7 < v10)
    return -1;
  else
    return v7 > v10;
}

- (BOOL)_allReloadsAreCompletedInGuardedData:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*((id *)a3 + 2), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!objc_msgSend(v8, "state") || objc_msgSend(v8, "state") == 1)
        {
          v9 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 1;
  }
LABEL_13:

  return v9;
}

- (void)_updateAndSendHomeScreenSuggestionsToDelegateWithGuardedData:(id)a3
{
  id *v4;
  ATXChronoServicesProviderDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id *location;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  id obj;
  uint64_t v50;
  ATXChronoServicesProvider *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v51 = self;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    location = (id *)p_delegate;
    v7 = (void *)objc_opt_new();
    objc_msgSend(v4[1], "cachedTopOfStackLayouts");
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    v9 = v4;
    v44 = v7;
    if (!v8)
      goto LABEL_25;
    v10 = v8;
    v11 = *(_QWORD *)v61;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v61 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v12);
        objc_msgSend(obj, "objectForKeyedSubscript:", v13, location);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "isNPlusOne"))
          goto LABEL_18;
        -[ATXChronoServicesProvider _recordFromSuggestionLayout:guardedData:](v51, "_recordFromSuggestionLayout:guardedData:", v14, v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          __atxlog_handle_home_screen();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543618;
            v67 = v13;
            v68 = 2112;
            v69 = v14;
            _os_log_fault_impl(&dword_1A49EF000, v16, OS_LOG_TYPE_FAULT, "ATXChronoServicesProvider: Unable to find record for a N+1 topOfStackLayout for stack %{public}@. Layout %@", buf, 0x16u);
          }

          v7 = v44;
        }
        if (CFPreferencesGetAppBooleanValue(CFSTR("widgetKitDeveloperModeEnabled"), CFSTR("com.apple.duetexpertd"), 0))
        {
          __atxlog_handle_home_screen();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v67 = v13;
            v68 = 2112;
            v69 = v14;
            _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: widgetkit developer mode on, allowing topOfStackLayout for stack %{public}@. Layout %@", buf, 0x16u);
          }

LABEL_17:
          v4 = v9;
LABEL_18:
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);
          goto LABEL_19;
        }
        if (objc_msgSend(v15, "state") == 2)
          goto LABEL_17;
        __atxlog_handle_home_screen();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v67 = v13;
          v68 = 2112;
          v69 = v14;
          _os_log_impl(&dword_1A49EF000, v18, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Skipping topOfStackLayout for stack %{public}@ because it's a suggested widget and it's not ready for display. Layout %@", buf, 0x16u);
        }

        v4 = v9;
LABEL_19:

        ++v12;
      }
      while (v10 != v12);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      v10 = v19;
      if (!v19)
      {
LABEL_25:
        v46 = (void *)objc_opt_new();
        objc_msgSend(v4[1], "cachedSuggestedWidgetsLayouts");
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v48 = (id)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        if (!v47)
          goto LABEL_53;
        v45 = *(_QWORD *)v57;
        while (1)
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v57 != v45)
              objc_enumerationMutation(v48);
            v50 = v20;
            v21 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v20);
            v22 = (void *)objc_opt_new();
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            objc_msgSend(v48, "objectForKeyedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v53;
              do
              {
                v27 = 0;
                do
                {
                  if (*(_QWORD *)v53 != v26)
                    objc_enumerationMutation(v23);
                  v28 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v27);
                  -[ATXChronoServicesProvider _recordFromSuggestionLayout:guardedData:](v51, "_recordFromSuggestionLayout:guardedData:", v28, v9, location);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v29)
                  {
                    __atxlog_handle_home_screen();
                    v30 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v67 = v21;
                      v68 = 2112;
                      v69 = v28;
                      _os_log_fault_impl(&dword_1A49EF000, v30, OS_LOG_TYPE_FAULT, "ATXChronoServicesProvider: Unable to find record for a suggestedWidgetLayout for stack %{public}@. Layout %@", buf, 0x16u);
                    }

                  }
                  if (CFPreferencesGetAppBooleanValue(CFSTR("widgetKitDeveloperModeEnabled"), CFSTR("com.apple.duetexpertd"), 0))
                  {
                    __atxlog_handle_home_screen();
                    v31 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v67 = v21;
                      v68 = 2112;
                      v69 = v28;
                      _os_log_impl(&dword_1A49EF000, v31, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: widgetkit developer mode on, allowing suggestedWidgetLayout for stack %{public}@. Layout %@", buf, 0x16u);
                    }

LABEL_44:
                    objc_msgSend(v22, "addObject:", v28);
                    goto LABEL_45;
                  }
                  if (objc_msgSend(v29, "state") == 2)
                    goto LABEL_44;
                  __atxlog_handle_home_screen();
                  v32 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v67 = v21;
                    v68 = 2112;
                    v69 = v28;
                    _os_log_impl(&dword_1A49EF000, v32, OS_LOG_TYPE_DEFAULT, "ATXChronoServicesProvider: Skipping suggestedWidgetLayout for stack %{public}@ because it's not ready for display. Layout %@", buf, 0x16u);
                  }

LABEL_45:
                  ++v27;
                }
                while (v25 != v27);
                v33 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
                v25 = v33;
              }
              while (v33);
            }

            objc_msgSend(v46, "setObject:forKeyedSubscript:", v22, v21);
            v20 = v50 + 1;
          }
          while (v50 + 1 != v47);
          v47 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          if (!v47)
          {
LABEL_53:
            v34 = objc_alloc(MEMORY[0x1E0D81148]);
            v4 = v9;
            objc_msgSend(v9[1], "uuid");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4[1], "cachedSuggestionWidgetLayouts");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4[1], "cachedAppPredictionPanelLayouts");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4[1], "fallbackSuggestions");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)objc_msgSend(v34, "initWithUUID:suggestionWidgetLayouts:appPredictionPanelLayouts:topOfStackLayouts:suggestedWidgetLayouts:fallbackSuggestions:", v35, v36, v37, v44, v46, v38);

            v40 = v4[1];
            v4[1] = v39;
            v41 = v39;

            v42 = objc_loadWeakRetained(location);
            objc_msgSend(v42, "chronoServiceProvider:finishedPrewarmingSuggestions:", v51, v41);

            goto LABEL_54;
          }
        }
      }
    }
  }
LABEL_54:

}

- (id)_recordFromSuggestionLayout:(id)a3 guardedData:(id)a4
{
  id *v6;
  void *v7;
  void *v8;

  v6 = (id *)a4;
  -[ATXChronoServicesProvider _widgetFromSuggestionLayout:](self, "_widgetFromSuggestionLayout:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6[2], "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (ATXChronoServicesProviderDelegate)delegate
{
  return (ATXChronoServicesProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_widgetMetricService, 0);
  objc_storeStrong((id *)&self->_proactiveService, 0);
}

- (void)_requestChronoToLoadWidget:(uint64_t)a1 inGuardedData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "ATXChronoServicesProvider: No record found for widget %@ in guardedData.", (uint8_t *)&v2, 0xCu);
}

- (void)_requestChronoToLoadWidget:(uint64_t)a1 inGuardedData:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "ATXChronoServicesProvider: Failed - SBSWidgetMetricsService returned nil metrics for widget %@.", (uint8_t *)&v2, 0xCu);
}

void __87__ATXChronoServicesProvider__chronoDidReplyHandle_timelineEntries_forWidget_withError___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = 138412802;
  v7 = v4;
  v8 = 2112;
  v9 = v3;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXChronoServicesProvider: Chrono reload failed for widget %@: returned widget handle %@, error %@", (uint8_t *)&v6, 0x20u);
}

- (void)_isCurrentTimelineRelevanceScoreNonPositiveForEntries:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXChronoServicesProvider: Unexpectedly found TimelineEntry with negative duration!", v1, 2u);
}

@end
