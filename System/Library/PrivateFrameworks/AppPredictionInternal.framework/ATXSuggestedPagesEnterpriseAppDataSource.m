@implementation ATXSuggestedPagesEnterpriseAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  if (a3 == 7)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedAppIDs");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    __atxlog_handle_modes();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ATXSuggestedPagesEnterpriseAppDataSource provideAppsForSuggestedPageType:environment:].cold.1((uint64_t)v10, v11);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__ATXSuggestedPagesEnterpriseAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke;
    v14[3] = &unk_1E82DC9C8;
    v15 = v5;
    objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __88__ATXSuggestedPagesEnterpriseAppDataSource_provideAppsForSuggestedPageType_environment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0CF8CE8], "isBetaAppForBundle:", v3))
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v3;
      v5 = "ATXSuggestedPagesEnterpriseAppDataSource: not considering beta app: %@";
LABEL_8:
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "appLaunchCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rawLaunchCount");

  if (!v8)
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v3;
      v5 = "ATXSuggestedPagesEnterpriseAppDataSource: not considering app that was not launched: %@";
      goto LABEL_8;
    }
LABEL_9:

    v9 = 0;
    goto LABEL_10;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:predictionSource:", v3, CFSTR("Enterprise"));
LABEL_10:

  return v9;
}

- (void)provideAppsForSuggestedPageType:(uint64_t)a1 environment:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "ATXSuggestedPagesEnterpriseAppDataSource: suggested enterprise apps: %@", (uint8_t *)&v2, 0xCu);
}

@end
