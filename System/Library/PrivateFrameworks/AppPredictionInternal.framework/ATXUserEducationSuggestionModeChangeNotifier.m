@implementation ATXUserEducationSuggestionModeChangeNotifier

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ATXUserEducationSuggestionModeChangeNotifier_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_2, block);
  return (id)sharedInstance__pasExprOnceResult_2;
}

void __62__ATXUserEducationSuggestionModeChangeNotifier_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_2;
  sharedInstance__pasExprOnceResult_2 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXUserEducationSuggestionModeChangeNotifier)init
{
  ATXUserEducationSuggestionModeChangeNotifier *v2;
  uint64_t v3;
  NSHashTable *observers;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  uint64_t v9;
  BMBiomeScheduler *scheduler;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BPSSink *sink;
  _QWORD v25[5];
  id v26;
  id location;
  _QWORD v28[5];
  objc_super v29;
  __int128 buf;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)ATXUserEducationSuggestionModeChangeNotifier;
  v2 = -[ATXUserEducationSuggestionModeChangeNotifier init](&v29, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    if (!v2->_queue)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = dispatch_queue_create("com.apple.ATXUserEducationSuggestionServer.queue", v5);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v6;

    }
    __atxlog_handle_context_user_education_suggestions();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[ATXUserEducationSuggestionModeChangeNotifier init]";
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: registering for real time mode change events", (uint8_t *)&buf, 0xCu);
    }

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("FocusModes.ATXUserEducationSuggestionServer"), v2->_queue);
    scheduler = v2->_scheduler;
    v2->_scheduler = (BMBiomeScheduler *)v9;

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v31 = 0x2020000000;
    v32 = 0;
    BiomeLibrary();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UserFocus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ComputedMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "atx_publisherWithStartTime:endTime:maxEvents:lastN:reversed:", 0, 0, &unk_1E83CBBD8, &unk_1E83CBBD8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_10;
    v28[3] = &unk_1E82DBE68;
    v28[4] = &buf;
    v16 = (id)objc_msgSend(v14, "sinkWithCompletion:receiveInput:", &__block_literal_global_17, v28);

    objc_initWeak(&location, v2);
    BiomeLibrary();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UserFocus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ComputedMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "atx_DSLPublisher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "subscribeOn:", v2->_scheduler);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_13;
    v25[3] = &unk_1E82DBEB0;
    v25[4] = &buf;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v21, "sinkWithCompletion:receiveInput:", &__block_literal_global_12_0, v25);
    v22 = objc_claimAutoreleasedReturnValue();
    sink = v2->_sink;
    v2->_sink = (BPSSink *)v22;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  return v2;
}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (objc_msgSend(v2, "state"))
  {
    __atxlog_handle_context_user_education_suggestions();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_cold_1(v2);

  }
}

uint64_t __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "timestamp");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  __atxlog_handle_context_user_education_suggestions();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_2_cold_1(v2);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ATXUserEducationSuggestionModeChangeNotifier init]_block_invoke_2";
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: done listening to mode change events", (uint8_t *)&v6, 0xCu);
  }

}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  NSObject *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "timestamp");
  if (v4 >= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(v3, "eventBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v3, "eventBody");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject processModeChangeEvent:](WeakRetained, "processModeChangeEvent:", v14);

    }
    else
    {
      __atxlog_handle_context_user_education_suggestions();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
        __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_13_cold_1();
    }
  }
  else
  {
    __atxlog_handle_context_user_education_suggestions();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "eventBody");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v3, "timestamp");
      objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timestamp");
      v10 = v9;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v15 = 136316418;
      v16 = "-[ATXUserEducationSuggestionModeChangeNotifier init]_block_invoke";
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = v8;
      v21 = 2048;
      v22 = v10;
      v23 = 2114;
      v24 = v11;
      v25 = 2048;
      v26 = v12;
      _os_log_impl(&dword_1C9A3B000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%s: Ignoring stale mode switch event: %{public}@ because it occurred on %{public}@ (%f), which was before the latest event in the stream at %{public}@ (%f)", (uint8_t *)&v15, 0x3Eu);

    }
  }

}

- (void)processModeChangeEvent:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_observers;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "processModeChangeEvent:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)registerObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)unregisterObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%s: error fetching mode change events from biome %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%s: error listening to mode change events: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __52__ATXUserEducationSuggestionModeChangeNotifier_init__block_invoke_13_cold_1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "%s: not notifying observers of mode change event because the biome event had no eventBody: %@", (uint8_t *)v1, 0x16u);
}

@end
