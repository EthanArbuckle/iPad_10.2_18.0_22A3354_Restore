@implementation ATXSuggestedPagesModeAffinityAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  if ((unint64_t)(a3 - 3) < 9 && ((0x143u >> (a3 - 3)) & 1) != 0
    || (v6 = +[ATXSuggestedPagesUtils modeForSuggestedPageType:](ATXSuggestedPagesUtils, "modeForSuggestedPageType:", a3), v6 == 16))
  {
    v7 = 0;
  }
  else
  {
    v8 = v6;
    +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rankedAppsForMode:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_214);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id __90__ATXSuggestedPagesModeAffinityAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = a2;
  objc_msgSend(v2, "scoreMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "score");
  v5 = v4;
  v6 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v7 = (void *)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF9410]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "doubleValue");
  else
    objc_msgSend(v8, "suggestedPagesModeAffinityAppDataSourceScoreThreshold");
  v11 = v10;

  if (v5 <= v11)
  {
    v16 = 0;
  }
  else
  {
    __atxlog_handle_modes();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __90__ATXSuggestedPagesModeAffinityAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke_cold_1(v2, v12);

    v13 = objc_alloc(MEMORY[0x1E0CF8E50]);
    objc_msgSend(v2, "bundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scoreMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "score");
    v16 = (void *)objc_msgSend(v13, "initWithBundleId:predictionSource:score:", v14, CFSTR("Mode Entity"));

  }
  return v16;
}

void __90__ATXSuggestedPagesModeAffinityAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scoreMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "score");
  v7 = 138412546;
  v8 = v4;
  v9 = 2048;
  v10 = v6;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "ATXSuggestedPagesModeAffinityAppDataSource: %@ passes threshold with score: %f", (uint8_t *)&v7, 0x16u);

}

@end
