@implementation CDSiriLearningSettings

void __55___CDSiriLearningSettings_allLearningDisabledBundleIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[_CDSiriLearningSettings _unsafe_allLearningDisabledBundleIDs](*(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __46___CDSiriLearningSettings__startWithCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __46___CDSiriLearningSettings__startWithCallback___block_invoke_cold_1(v2);

  -[_CDSiriLearningSettings _unsafe_allLearningDisabledBundleIDs](*(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSiriLearningSettings _unsafe_clearAllLearningDisabledBundleIDs](*(_QWORD **)(a1 + 32));
  -[_CDSiriLearningSettings _unsafe_allLearningDisabledBundleIDs](*(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v5;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "Learning toggled. New disabled: %@. New enabled: %@", buf, 0x16u);
  }

  if (objc_msgSend(v4, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = *(_QWORD **)(a1 + 32);
    if (v10)
      v10 = (_QWORD *)v10[4];
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15);
          objc_msgSend(v5, "allObjects", (_QWORD)v18);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

  }
}

void __44___CDSiriLearningSettings_notificationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.coreduet.siriLearningTracker", v2);
  v1 = (void *)notificationQueue_queue;
  notificationQueue_queue = (uint64_t)v0;

}

void __41___CDSiriLearningSettings_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  uint8_t buf[16];

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_manager;
  sharedInstance_manager = (uint64_t)v1;

  if (sharedInstance_manager)
    *(_QWORD *)(sharedInstance_manager + 12) = 0xFFFFFFFFLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSiriLearningSettings setDelegates:](sharedInstance_manager, v3);

  getpid();
  v4 = sandbox_check();
  if (v4 == -1)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel", "com.apple.suggestions");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __41___CDSiriLearningSettings_sharedInstance__block_invoke_cold_2(v5);
    goto LABEL_9;
  }
  if (!v4)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel", "com.apple.suggestions");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "Process has access to preferences for Siri Learning toggles.", buf, 2u);
    }
LABEL_9:

    v6 = sharedInstance_manager;
    if (!sharedInstance_manager)
      return;
    v7 = 1;
    goto LABEL_15;
  }
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel", "com.apple.suggestions");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __41___CDSiriLearningSettings_sharedInstance__block_invoke_cold_1(v8);

  v6 = sharedInstance_manager;
  if (sharedInstance_manager)
  {
    v7 = 0;
LABEL_15:
    *(_BYTE *)(v6 + 8) = v7;
  }
}

void __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  os_activity_scope_state_s state;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = _os_activity_create(&dword_18DDBE000, "Duet: _CDSiriLearningSettings startSanitizingKnowledgeStore", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  +[_DKQuery predicateForEventsWithStreamNames:](_DKEventQuery, "predicateForEventsWithStreamNames:", &unk_1E272BD58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        +[_DKQuery predicateForEventsWithBundleID:](_DKQuery, "predicateForEventsWithBundleID:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3528];
  v26[0] = v5;
  v26[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke_2;
  v19[3] = &unk_1E26E4C30;
  v20 = v7;
  v18 = v7;
  objc_msgSend(v17, "deleteAllEventsMatchingPredicate:responseQueue:withCompletion:", v16, 0, v19);

}

void __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke_2_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = 138412546;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_DEFAULT, "Deleted %@ objects for newly-disabled learning bundles: %@", (uint8_t *)&v16, 0x16u);

  }
}

void __59___CDSiriLearningSettings_startSanitizingInteractionStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundleId IN %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("startSanitizingInteractionStore (newDisabledBundles=%@)"), v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___CDSiriLearningSettings_startSanitizingInteractionStore___block_invoke_2;
  v8[3] = &unk_1E26E4C30;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:completionHandler:", v4, 0, 0x7FFFFFFFFFFFFFFFLL, v6, v8);

}

void __59___CDSiriLearningSettings_startSanitizingInteractionStore___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59___CDSiriLearningSettings_startSanitizingInteractionStore___block_invoke_2_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = 138412546;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_DEFAULT, "Deleted %@ interactions for newly-disabled learning bundles: %@", (uint8_t *)&v16, 0x16u);

  }
}

uint64_t __41___CDSiriLearningSettings_stopSanitizing__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  -[_CDSiriLearningSettings _unsafe_clearAllLearningDisabledBundleIDs](*(_QWORD **)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 32);
  else
    v3 = 0;
  return objc_msgSend(v3, "removeAllObjects");
}

void __41___CDSiriLearningSettings_sharedInstance__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "Unable to access preferences for Siri Learning toggles. Disabling checks.", v1, 2u);
}

void __41___CDSiriLearningSettings_sharedInstance__block_invoke_cold_2(NSObject *a1)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_18DDBE000, a1, OS_LOG_TYPE_ERROR, "Error checking preferences access (errno %{darwin.errno}d). Attempting checks but they may not work.", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_5();
}

void __46___CDSiriLearningSettings__startWithCallback___block_invoke_cold_1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = CFSTR("com.apple.suggestions.settingsChanged");
  _os_log_debug_impl(&dword_18DDBE000, log, OS_LOG_TYPE_DEBUG, "Handling callback for %@", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Failed to delete objects for disabled learning bundles: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __59___CDSiriLearningSettings_startSanitizingInteractionStore___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Failed to delete interactions for disabled learning bundles: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
