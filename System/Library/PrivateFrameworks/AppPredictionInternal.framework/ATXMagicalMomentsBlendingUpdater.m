@implementation ATXMagicalMomentsBlendingUpdater

+ (void)updateBlendingLayerWithMagicalMomentsMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v4 = a3;
  +[ATXAppPredictionBlacklist sharedInstance](ATXAppPredictionBlacklist, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disabledBundleIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __77__ATXMagicalMomentsBlendingUpdater_updateBlendingLayerWithMagicalMomentsMap___block_invoke;
  v19 = &unk_1E82EAE80;
  v7 = v6;
  v20 = v7;
  v21 = &v22;
  objc_msgSend(v4, "keysOfEntriesPassingTest:", &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (*((_BYTE *)v23 + 24))
  {
    objc_msgSend(v8, "allObjects", v16, v17, v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithValuesForKeys:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v11;
  }
  objc_msgSend(a1, "clientModelSpecForMagicalMomentsPredictions", v16, v17, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestionBuilder proactiveSuggestionsForAppsWithMagicalMomentsMap:clientModelSpec:](ATXProactiveSuggestionBuilder, "proactiveSuggestionsForAppsWithMagicalMomentsMap:clientModelSpec:", v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clientModelForMagicalMomentsPredictions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "feedbackMetadataForMmMap:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v14, "updateSuggestions:feedbackMetadata:", v13, v15);

  _Block_object_dispose(&v22, 8);
}

+ (id)clientModelSpecForMagicalMomentsPredictions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 24);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v2, CFSTR("1.0"), 0);

  return v3;
}

+ (id)clientModelForMagicalMomentsPredictions
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 24);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blendingLayerServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithClientModelId:blendingLayerServer:", v2, v5);

  return v6;
}

+ (id)feedbackMetadataForMmMap:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "anchorType"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v14 = (void *)MEMORY[0x1CAA48B6C]();
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v20;
  objc_autoreleasePoolPop(v14);
  if (v16)
  {
    __atxlog_handle_pmm();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[ATXMagicalMomentsBlendingUpdater feedbackMetadataForMmMap:].cold.1((uint64_t)v16, v17);

    v18 = 0;
  }
  else
  {
    v18 = v15;
  }

  return v18;
}

uint64_t __77__ATXMagicalMomentsBlendingUpdater_updateBlendingLayerWithMagicalMomentsMap___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  if (v4)
  {
    __atxlog_handle_pmm();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Removing blacklisted bundle id: %@", (uint8_t *)&v7, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

  return v4 ^ 1u;
}

+ (void)feedbackMetadataForMmMap:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Error while archiving feedback metadata: %@. Not updating blending with mm predictions.", (uint8_t *)&v2, 0xCu);
}

@end
