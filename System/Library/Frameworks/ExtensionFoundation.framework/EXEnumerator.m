@implementation EXEnumerator

+ (id)config
{
  if (config_onceToken[0] != -1)
    dispatch_once(config_onceToken, &__block_literal_global_13);
  return (id)config_config;
}

void __22__EXEnumerator_config__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)config_config;
  config_config = v0;

}

+ (id)extensionCacheFileURLs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x194018140]();
  objc_msgSend((id)objc_opt_class(), "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcExtensionsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
    objc_msgSend(v2, "addObject:", v5);

  objc_autoreleasePoolPop(v3);
  v9 = (void *)objc_msgSend(v2, "copy");

  return v9;
}

+ (id)extensionPointCacheFileURLs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x194018140]();
  objc_msgSend((id)objc_opt_class(), "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcExtensionPointsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
    objc_msgSend(v2, "addObject:", v5);

  objc_autoreleasePoolPop(v3);
  v9 = (void *)objc_msgSend(v2, "copy");

  return v9;
}

+ (id)extensionPointDefinitionDirectoryURLs
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportExtensionKitConfigPath");

  if (v5)
  {
    objc_msgSend(a1, "config");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library/ExtensionKit"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("ExtensionPoints"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v11, "allowsAppleInternalComponents");

    if ((_DWORD)v7)
    {
      objc_msgSend(a1, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rootURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppleInternal/System/Library/ExtensionKit"), 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("ExtensionPoints"), 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v15);

      objc_msgSend(a1, "config");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "rootURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppleInternal/Library/ExtensionKit"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", CFSTR("ExtensionPoints"), 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v19);

    }
  }
  v20 = (void *)objc_msgSend(v3, "copy");

  return v20;
}

+ (id)extensionInstallDirectoryURLs
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportExtensionKitConfigPath");

  if (v5)
  {
    objc_msgSend(a1, "config");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rootURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library/ExtensionKit"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("Extensions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v8;
    objc_msgSend(a1, "config");
    v9 = a1;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", CFSTR("/System/Cryptexes/OS/System/Library/ExtensionKit"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("Extensions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v14);

    v15 = v9;
    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v16, "allowsAppleInternalComponents");

    if ((_DWORD)v9)
    {
      objc_msgSend(v15, "config");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rootURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppleInternal/System/Library/ExtensionKit"), 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "URLByAppendingPathComponent:", CFSTR("Extensions"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v20);

      objc_msgSend(v15, "config");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "rootURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppleInternal/Library/ExtensionKit"), 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLByAppendingPathComponent:", CFSTR("Extensions"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v24);

    }
  }
  v25 = (void *)objc_msgSend(v3, "copy");

  return v25;
}

+ (id)extensionURLEnumerator
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  EXOSExtensionEnumerator *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  _EXRegistrationLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  _EXRegistrationLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "extensionURLEnumerator", ", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "extensionCacheFileURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "extensionInstallDirectoryURLs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = -[EXOSExtensionEnumerator initWithCacheURLs:]([EXOSExtensionEnumerator alloc], "initWithCacheURLs:", v8);
    v6 = (void *)v8;
  }
  else
  {
    _EXRegistrationLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_190C25000, v10, OS_LOG_TYPE_DEFAULT, "Failed to load or create cache extension/extension point info.", v15, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "_extensionLiveEnumerator");
    v9 = (EXOSExtensionEnumerator *)objc_claimAutoreleasedReturnValue();
  }
  _EXRegistrationLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v12, OS_SIGNPOST_INTERVAL_END, v3, "extensionURLEnumerator", ", v14, 2u);
  }

  return v9;
}

+ (id)_extensionLiveEnumerator
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  EXFrameworkScanner *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  EXOSExtensionEnumerator *v14;
  void *v15;
  EXOSExtensionEnumerator *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v20[16];
  uint8_t buf[16];

  _EXRegistrationLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  _EXRegistrationLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "_extensionLiveEnumerator", ", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[EXFrameworkScanner initWithSourceURL:]([EXFrameworkScanner alloc], "initWithSourceURL:", v7);
  -[EXFrameworkScanner start](v8, "start");
  -[EXFrameworkScanner extensionPaths](v8, "extensionPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "appleInternal");

  if (v11)
  {
    -[EXFrameworkScanner appleInternalExtensionPaths](v8, "appleInternalExtensionPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  v14 = [EXOSExtensionEnumerator alloc];
  objc_msgSend((id)objc_opt_class(), "extensionInstallDirectoryURLs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[EXOSExtensionEnumerator initWithCacheURLs:paths:](v14, "initWithCacheURLs:paths:", v15, v9);

  _EXRegistrationLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v18, OS_SIGNPOST_INTERVAL_END, v3, "_extensionLiveEnumerator", ", v20, 2u);
  }

  return v16;
}

+ (id)extensionPointDefinitionEnumerator
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  EXExtensionPointEnumerator *v9;
  void *v10;
  EXExtensionPointEnumerator *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  _EXRegistrationLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  _EXRegistrationLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "extensionPointDefinitionEnumerator", ", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "extensionPointCacheFileURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "extensionPointDefinitionDirectoryURLs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = [EXExtensionPointEnumerator alloc];
    objc_msgSend((id)objc_opt_class(), "config");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[EXExtensionPointEnumerator initWithCacheURLs:config:](v9, "initWithCacheURLs:config:", v8, v10);

    v6 = (void *)v8;
  }
  else
  {
    _EXRegistrationLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_190C25000, v12, OS_LOG_TYPE_DEFAULT, "Failed to load or create cache extension/extension point info.", v17, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "_extensionPointLiveEnumerator");
    v11 = (EXExtensionPointEnumerator *)objc_claimAutoreleasedReturnValue();
  }
  _EXRegistrationLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v14, OS_SIGNPOST_INTERVAL_END, v3, "extensionPointDefinitionEnumerator", ", v16, 2u);
  }

  return v11;
}

+ (id)_extensionPointLiveEnumerator
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  EXFrameworkScanner *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  EXExtensionPointEnumerator *v15;
  void *v16;
  EXExtensionPointEnumerator *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t v21[16];
  uint8_t buf[16];

  _EXRegistrationLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  _EXRegistrationLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "_extensionPointLiveEnumerator", ", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[EXFrameworkScanner initWithSourceURL:]([EXFrameworkScanner alloc], "initWithSourceURL:", v7);
  -[EXFrameworkScanner start](v8, "start");
  -[EXFrameworkScanner combinedExtensionSDK](v8, "combinedExtensionSDK");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowsAppleInternalComponents");

  if (v11)
  {
    -[EXFrameworkScanner combinedAppleInternalExtensionSDK](v8, "combinedAppleInternalExtensionSDK");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  objc_msgSend((id)objc_opt_class(), "extensionPointDefinitionDirectoryURLs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [EXExtensionPointEnumerator alloc];
  objc_msgSend((id)objc_opt_class(), "config");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[EXExtensionPointEnumerator initWithSDKDictionary:urls:config:](v15, "initWithSDKDictionary:urls:config:", v9, v14, v16);

  _EXRegistrationLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v19, OS_SIGNPOST_INTERVAL_END, v3, "_extensionPointLiveEnumerator", ", v21, 2u);
  }

  return v17;
}

+ (id)extensionPointDefinitionEnumeratorWithSDKDictionary:(id)a3
{
  id v3;
  EXExtensionPointEnumerator *v4;
  void *v5;
  EXExtensionPointEnumerator *v6;

  v3 = a3;
  v4 = [EXExtensionPointEnumerator alloc];
  objc_msgSend((id)objc_opt_class(), "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EXExtensionPointEnumerator initWithSDKDictionary:config:](v4, "initWithSDKDictionary:config:", v3, v5);

  return v6;
}

@end
