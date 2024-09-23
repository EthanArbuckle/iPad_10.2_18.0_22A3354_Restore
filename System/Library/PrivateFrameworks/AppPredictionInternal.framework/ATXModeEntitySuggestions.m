@implementation ATXModeEntitySuggestions

- (void)suggestedBundleIDsForAllowListWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id obj;
  _QWORD block[4];
  id v19;
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  allModesForTraining();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v9), "unsignedIntegerValue");
        v11 = (void *)objc_opt_new();
        ATXModeToString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

        dispatch_group_enter(v5);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke;
        v21[3] = &unk_1E82DBDC0;
        v22 = v5;
        v23 = v3;
        v24 = v10;
        objc_msgSend(v4, "recommendedAndCandidateAllowedAppsForMode:reply:", v10, v21);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  dispatch_get_global_queue(21, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke_2;
  block[3] = &unk_1E82DB0F0;
  v19 = v3;
  v20 = v16;
  v14 = v3;
  v15 = v16;
  dispatch_group_notify(v5, v13, block);

}

void __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_usage_insights();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v5, "recommendedApps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_15);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(id *)(a1 + 40);
    objc_sync_enter(v16);
    v17 = *(void **)(a1 + 40);
    ATXModeToString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v18);

    objc_sync_exit(v16);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

  }
}

uint64_t __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleId");
}

uint64_t __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)suggestedBundleIDsForDenyListWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id obj;
  _QWORD block[4];
  id v19;
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  allModesForTraining();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v9), "unsignedIntegerValue");
        v11 = (void *)objc_opt_new();
        ATXModeToString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

        dispatch_group_enter(v5);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke;
        v21[3] = &unk_1E82DBDC0;
        v22 = v5;
        v23 = v3;
        v24 = v10;
        objc_msgSend(v4, "recommendedAndCandidateDeniedAppsForMode:reply:", v10, v21);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  dispatch_get_global_queue(21, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke_2;
  block[3] = &unk_1E82DB0F0;
  v19 = v3;
  v20 = v16;
  v14 = v3;
  v15 = v16;
  dispatch_group_notify(v5, v13, block);

}

void __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v5, "recommendedApps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(id *)(a1 + 40);
    objc_sync_enter(v16);
    v17 = *(void **)(a1 + 40);
    ATXModeToString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v18);

    objc_sync_exit(v16);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

  }
}

uint64_t __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleId");
}

uint64_t __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __73__ATXModeEntitySuggestions_suggestedBundleIDsForAllowListWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Could not get recommended and candidate allowed apps: %@", a5, a6, a7, a8, 2u);
}

void __72__ATXModeEntitySuggestions_suggestedBundleIDsForDenyListWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Could not get recommended and candidate denied apps: %@", a5, a6, a7, a8, 2u);
}

@end
