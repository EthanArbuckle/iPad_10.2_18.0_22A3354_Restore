@implementation ATXSuggestedPagesGlobalModeAffinityAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[ATXSuggestedPagesUtils modeForSuggestedPageType:](ATXSuggestedPagesUtils, "modeForSuggestedPageType:", a3, a4);
  +[ATXGlobalAppModeAffinityModel supportedModeTypes](ATXGlobalAppModeAffinityModel, "supportedModeTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rankedAppsForMode:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_115);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __96__ATXSuggestedPagesGlobalModeAffinityAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "scoreMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureVector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationNumLocalOccurrences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationEntitySpecificFeatures"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("globalModeAffinityPrior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v5 && v7)
  {
    objc_msgSend(v7, "doubleValue");
    if (v9 <= 9.0 || objc_msgSend(v5, "integerValue") < 2)
    {
      v8 = 0;
    }
    else
    {
      __atxlog_handle_modes();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v2, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v11;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "ATXSuggestedPagesGlobalModeAffinityAppDataSource: %@ passes threshold with score: %@", (uint8_t *)&v15, 0x16u);

      }
      v12 = objc_alloc(MEMORY[0x1E0CF8E50]);
      objc_msgSend(v2, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v8 = (void *)objc_msgSend(v12, "initWithBundleId:predictionSource:score:", v13, CFSTR("Global Mode Entity"));

    }
  }

  return v8;
}

@end
