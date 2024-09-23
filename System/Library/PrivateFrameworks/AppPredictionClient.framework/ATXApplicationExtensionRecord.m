@implementation ATXApplicationExtensionRecord

+ (id)recordForExtensionBundleId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  v8 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v3, &v8);
  v5 = v8;
  if (v5)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[ATXApplicationExtensionRecord recordForExtensionBundleId:].cold.2((uint64_t)v3, (uint64_t)v5, v6);
  }
  else
  {
    if (v4)
      goto LABEL_6;
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[ATXApplicationExtensionRecord recordForExtensionBundleId:].cold.1((uint64_t)v3, v6);
  }

LABEL_6:
  return v4;
}

+ (id)localizedNameForExtensionBundleId:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "recordForExtensionBundleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)containerBundleIdForExtensionBundleId:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "recordForExtensionBundleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containingBundleRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isDebuggingAllowedForExtensionBundleId:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "recordForExtensionBundleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("get-task-allow"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "containingBundleRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entitlements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:ofClass:", CFSTR("get-task-allow"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v9, "BOOLValue");
  }

  return v6;
}

+ (void)recordForExtensionBundleId:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Fetched nil record for bundle %@", (uint8_t *)&v2, 0xCu);
}

+ (void)recordForExtensionBundleId:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Couldn't fetch record for bundle %@, error: %@", (uint8_t *)&v3, 0x16u);
}

@end
