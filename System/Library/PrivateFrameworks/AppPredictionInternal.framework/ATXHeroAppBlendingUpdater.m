@implementation ATXHeroAppBlendingUpdater

+ (void)updateBlendingLayerWithHeroAppPredictions:(id)a3 currentLocation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;

  v6 = a4;
  objc_msgSend(a1, "nonBlacklistedPredictionsFrom:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clientModelSpecForHeroAppPredictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestionBuilder proactiveSuggestionsForAppsWithHeroAppPredictions:clientModelSpec:](ATXProactiveSuggestionBuilder, "proactiveSuggestionsForAppsWithHeroAppPredictions:clientModelSpec:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clientModelForHeroAppPredictions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11 = (void *)MEMORY[0x1CAA48B6C]();
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    objc_autoreleasePoolPop(v11);
    if (v13)
    {
      __atxlog_handle_hero();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[ATXHeroAppBlendingUpdater updateBlendingLayerWithHeroAppPredictions:currentLocation:].cold.1((uint64_t)v13, v14);

    }
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v10, "updateSuggestions:feedbackMetadata:", v9, v12);
  +[ATXHeroSpotlightPOIBlendingUpdater updateBlendingLayerWithHeroAppPredictions:](ATXHeroSpotlightPOIBlendingUpdater, "updateBlendingLayerWithHeroAppPredictions:", v7);

}

+ (id)nonBlacklistedPredictionsFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  +[ATXAppPredictionBlacklist sharedInstance](ATXAppPredictionBlacklist, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disabledBundleIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__ATXHeroAppBlendingUpdater_nonBlacklistedPredictionsFrom___block_invoke;
  v9[3] = &unk_1E82DD4C8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v3, "_pas_filteredArrayWithTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)clientModelSpecForHeroAppPredictions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 23);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v2, CFSTR("1.0"), 0);

  return v3;
}

+ (id)clientModelForHeroAppPredictions
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 23);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blendingLayerServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithClientModelId:blendingLayerServer:", v2, v5);

  return v6;
}

uint64_t __59__ATXHeroAppBlendingUpdater_nonBlacklistedPredictionsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
  {
    __atxlog_handle_hero();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "bundleId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Removed blacklisted hero app prediction: %@", (uint8_t *)&v10, 0xCu);

    }
  }

  return v6 ^ 1u;
}

+ (void)updateBlendingLayerWithHeroAppPredictions:(uint64_t)a1 currentLocation:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Error while archiving feedback metadata: %@", (uint8_t *)&v2, 0xCu);
}

@end
