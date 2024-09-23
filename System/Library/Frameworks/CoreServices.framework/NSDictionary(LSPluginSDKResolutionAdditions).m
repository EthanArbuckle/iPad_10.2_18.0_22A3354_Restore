@implementation NSDictionary(LSPluginSDKResolutionAdditions)

- (id)ls_resolvePlugInKitInfoPlistWithDictionary:()LSPluginSDKResolutionAdditions
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  if (!objc_msgSend(v4, "count"))
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSDictionary(LSPluginSDKResolutionAdditions) ls_resolvePlugInKitInfoPlistWithDictionary:].cold.1((uint64_t)a1, (uint64_t)v4, v6);

  }
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("NSExtensionSandboxProfile"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__NSDictionary_LSPluginSDKResolutionAdditions__ls_resolvePlugInKitInfoPlistWithDictionary___block_invoke;
  v12[3] = &unk_1E10413C0;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)ls_resolvePlugInKitInfoPlistWithDictionary:()LSPluginSDKResolutionAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Attempting to merge SDK dictionary into PlugInKit plist %@ but SDK is %@", (uint8_t *)&v3, 0x16u);
}

@end
