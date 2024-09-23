@implementation ICLocalization

void __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke()
{
  _BOOL4 v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v0 = +[ICDeviceSupport processIsSiri](ICDeviceSupport, "processIsSiri");
  localizedFrameworkStringForKey_value_table_allowSiri__shouldUseSiriLocalization = v0;
  if (v0)
  {
    if (!dlopen("/System/Library/PrivateFrameworks/SiriUI.framework/SiriUI", 1))
    {
      v1 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
        __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke_cold_2(v1, v2, v3, v4, v5, v6, v7, v8);

    }
    if (!dlopen("/System/Library/PrivateFrameworks/AssistantUI.framework/AssistantUI", 1))
    {
      v9 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

    }
  }
}

+ (id)localizedFrameworkStringForKey:(id)a3 value:(id)a4 table:(id)a5 allowSiri:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (localizedFrameworkStringForKey_value_table_allowSiri__onceToken != -1)
    dispatch_once(&localizedFrameworkStringForKey_value_table_allowSiri__onceToken, &__block_literal_global_13);
  v12 = localizedFrameworkStringForKey_value_table_allowSiri__shouldUseSiriLocalization;
  v13 = (void *)MEMORY[0x1E0CB34D0];
  ICSharedFrameworkBundleIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleWithIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 && v6)
  {
    objc_msgSend(v15, "siriUILocalizedStringForKey:value:table:", v9, v10, v11);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v15, "localizedStringForKey:value:table:", v9, v10, v11);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

  return v18;
}

void __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DDAA5000, a1, a3, "Unable to lazy load AssistantUI framework", a5, a6, a7, a8, 0);
}

void __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DDAA5000, a1, a3, "Unable to lazy load SiriUI framework", a5, a6, a7, a8, 0);
}

@end
