@implementation EXFrameworkScanner

+ (id)frameworkPaths
{
  if (frameworkPaths_onceToken != -1)
    dispatch_once(&frameworkPaths_onceToken, &__block_literal_global_8);
  return (id)frameworkPaths_frameworkPaths;
}

void __36__EXFrameworkScanner_frameworkPaths__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  void *v3;

  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "allowsAppleInternalComponents");

  v2 = &unk_1E2D15CC0;
  v3 = (void *)frameworkPaths_frameworkPaths;
  if (v1)
    v2 = &unk_1E2D15CA8;
  frameworkPaths_frameworkPaths = (uint64_t)v2;

}

+ (id)rootURL
{
  if (rootURL_onceToken != -1)
    dispatch_once(&rootURL_onceToken, &__block_literal_global_8);
  return (id)rootURL_rootURL;
}

void __29__EXFrameworkScanner_rootURL__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rootURL_rootURL;
  rootURL_rootURL = v0;

}

- (EXFrameworkScanner)initWithSourceURL:(id)a3
{
  id v5;
  EXFrameworkScanner *v6;
  EXFrameworkScanner *v7;
  uint64_t v8;
  NSMutableDictionary *combinedExtensionSDK;
  uint64_t v10;
  NSMutableDictionary *combinedAppleInternalExtensionSDK;
  uint64_t v12;
  NSMutableArray *extensions;
  uint64_t v14;
  NSMutableArray *appleInternalExtensions;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EXFrameworkScanner;
  v6 = -[EXFrameworkScanner init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceURL, a3);
    v8 = objc_opt_new();
    combinedExtensionSDK = v7->__combinedExtensionSDK;
    v7->__combinedExtensionSDK = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    combinedAppleInternalExtensionSDK = v7->__combinedAppleInternalExtensionSDK;
    v7->__combinedAppleInternalExtensionSDK = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    extensions = v7->__extensions;
    v7->__extensions = (NSMutableArray *)v12;

    v14 = objc_opt_new();
    appleInternalExtensions = v7->__appleInternalExtensions;
    v7->__appleInternalExtensions = (NSMutableArray *)v14;

  }
  return v7;
}

- (NSDictionary)combinedExtensionSDK
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->__combinedExtensionSDK, "copy");
}

- (NSDictionary)combinedAppleInternalExtensionSDK
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->__combinedAppleInternalExtensionSDK, "copy");
}

- (NSArray)extensionPaths
{
  return (NSArray *)(id)-[NSMutableArray copy](self->__extensions, "copy");
}

- (NSArray)appleInternalExtensionPaths
{
  return (NSArray *)(id)-[NSMutableArray copy](self->__appleInternalExtensions, "copy");
}

- (BOOL)isCatalystSupportURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[EXFrameworkScanner sourceURL](self, "sourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("System/iOSSupport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "hasPrefix:", v10);

  return v11;
}

- (BOOL)isAppleInternalURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[EXFrameworkScanner sourceURL](self, "sourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("AppleInternal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "hasPrefix:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    -[EXFrameworkScanner sourceURL](self, "sourceURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("System/iOSSupport/AppleInternal"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lowercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v16, "hasPrefix:", v18);

  }
  return v12;
}

- (void)enumerateBundlesWithPathExtension:(id)a3 atURL:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(id, void *, _BYTE *);
  uint64_t v34;
  char v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  _QWORD v43[5];

  v43[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v33 = (void (**)(id, void *, _BYTE *))a5;
  v41 = 0;
  v9 = *MEMORY[0x1E0C99A28];
  v10 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v41, *MEMORY[0x1E0C99A28], 0);
  v11 = v41;
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  v31 = v11;
  if (!v12 && objc_msgSend(v11, "BOOLValue"))
  {
    objc_msgSend(v8, "URLByResolvingSymlinksInPath");
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v13;
  }
  v34 = *MEMORY[0x1E0C999D0];
  v43[0] = *MEMORY[0x1E0C999D0];
  v43[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v8;
  v30 = (void *)v14;
  objc_msgSend(v15, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, v14, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v23 = (void *)MEMORY[0x194018140]();
        objc_msgSend(v22, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "pathExtension");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25 && !objc_msgSend(v25, "caseInsensitiveCompare:", v7))
        {
          v36 = 0;
          v26 = objc_msgSend(v22, "getResourceValue:forKey:error:", &v36, v34, 0);
          v27 = v36;
          v28 = v27;
          if (v26)
            v29 = v27 == 0;
          else
            v29 = 1;
          if (!v29)
          {
            if (objc_msgSend(v27, "BOOLValue"))
            {
              v35 = 0;
              v33[2](v33, v22, &v35);
              if (v35)
              {

                objc_autoreleasePoolPop(v23);
                goto LABEL_25;
              }
            }
          }

        }
        objc_autoreleasePoolPop(v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v19)
        continue;
      break;
    }
  }
LABEL_25:

}

- (void)enumerateAppexptAtURL:(id)a3 block:(id)a4
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(id, void *, _BYTE *);
  uint64_t v31;
  char v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  _QWORD v40[5];

  v40[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = (void (**)(id, void *, _BYTE *))a4;
  v38 = 0;
  v6 = *MEMORY[0x1E0C99A28];
  v7 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v38, *MEMORY[0x1E0C99A28], 0);
  v8 = v38;
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  v28 = v8;
  if (!v9 && objc_msgSend(v8, "BOOLValue"))
  {
    objc_msgSend(v5, "URLByResolvingSymlinksInPath");
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v10;
  }
  v31 = *MEMORY[0x1E0C99A18];
  v40[0] = *MEMORY[0x1E0C99A18];
  v40[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v5;
  v27 = (void *)v11;
  objc_msgSend(v12, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v11, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x194018140]();
        objc_msgSend(v19, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "pathExtension");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 && !objc_msgSend(v22, "caseInsensitiveCompare:", CFSTR("appexpt")))
        {
          v33 = 0;
          v23 = objc_msgSend(v19, "getResourceValue:forKey:error:", &v33, v31, 0);
          v24 = v33;
          v25 = v24;
          if (v23)
            v26 = v24 == 0;
          else
            v26 = 1;
          if (!v26)
          {
            if (objc_msgSend(v24, "BOOLValue"))
            {
              v32 = 0;
              v30[2](v30, v19, &v32);
              if (v32)
              {

                objc_autoreleasePoolPop(v20);
                goto LABEL_25;
              }
            }
          }

        }
        objc_autoreleasePoolPop(v20);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_25:

}

- (void)enumerateFrameworksBundlesWithFrameworkURL:(id)a3 block:(id)a4
{
  void (**v4)(id, uint64_t, _BYTE *);
  uint64_t Unique;
  __CFBundle *v6;
  CFArrayRef v7;
  const __CFArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _BYTE *))a4;
  Unique = _CFBundleCreateUnique();
  v19 = 0;
  if (Unique)
  {
    v6 = (__CFBundle *)Unique;
    v4[2](v4, Unique, &v19);
    if (v19)
      v7 = (CFArrayRef)MEMORY[0x1E0C9AA60];
    else
      v7 = CFBundleCopyResourceURLsOfType(v6, CFSTR("framework"), CFSTR("Frameworks"));
    CFRelease(v6);
  }
  else
  {
    v7 = (CFArrayRef)MEMORY[0x1E0C9AA60];
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_9:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = _CFBundleCreateUnique();
      if (v13)
      {
        v14 = (const void *)v13;
        v4[2](v4, v13, &v19);
        CFRelease(v14);
      }
      if (v19)
        break;
      if (v10 == ++v12)
      {
        v10 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v10)
          goto LABEL_9;
        break;
      }
    }
  }

}

- (void)processExtensionSDKFromBundle:(__CFBundle *)a3
{
  void *v5;
  CFURLRef v6;
  NSObject *v7;

  -[__CFDictionary objectForKey:](CFBundleGetInfoDictionary(a3), "objectForKey:", CFSTR("NSExtensionSDK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFBundleCopyBundleURL(a3);
  if (v5)
  {
    _EXRegistrationLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[EXFrameworkScanner processExtensionSDKFromBundle:].cold.1();

    -[EXFrameworkScanner processExtensionSDK:declaringURL:](self, "processExtensionSDK:declaringURL:", v5, v6);
  }

}

- (void)processExtensionSDKFromFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 1, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (!v5)
  {
    _EXRegistrationLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[EXFrameworkScanner processExtensionSDKFromFile:].cold.2();
    goto LABEL_11;
  }
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v8 || !v7)
    {
      v6 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "_EX_parameterError");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_11:

    v8 = v6;
    goto LABEL_12;
  }
  if (v7)
  {
    -[EXFrameworkScanner processExtensionSDK:declaringURL:](self, "processExtensionSDK:declaringURL:", v7, v4);
    goto LABEL_14;
  }
LABEL_12:
  _EXRegistrationLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[EXFrameworkScanner processExtensionSDKFromFile:].cold.1();
LABEL_14:

}

- (void)processExtensionSDK:(id)a3 declaringURL:(id)a4
{
  id v6;
  int active_platform;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  int v19;

  v15 = a3;
  v6 = a4;
  active_platform = dyld_get_active_platform();
  v8 = -[EXFrameworkScanner isCatalystSupportURL:](self, "isCatalystSupportURL:", v6);
  v9 = -[EXFrameworkScanner isAppleInternalURL:](self, "isAppleInternalURL:", v6);
  -[EXFrameworkScanner _combinedExtensionSDK](self, "_combinedExtensionSDK");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[EXFrameworkScanner _combinedAppleInternalExtensionSDK](self, "_combinedAppleInternalExtensionSDK");
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  if (v8)
    v12 = 6;
  else
    v12 = active_platform;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__EXFrameworkScanner_processExtensionSDK_declaringURL___block_invoke;
  v16[3] = &unk_1E2CFD248;
  v17 = v6;
  v18 = v10;
  v19 = v12;
  v13 = v10;
  v14 = v6;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v16);

}

void __55__EXFrameworkScanner_processExtensionSDK_declaringURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    _EXRegistrationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __55__EXFrameworkScanner_processExtensionSDK_declaringURL___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_EX_dictionaryBySettingObject:forKey:", v9, CFSTR("EXDeclaringPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = (id)objc_opt_new();
    v14 = v13;

    v15 = *(_DWORD *)(a1 + 48);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("EXCatalystSDKVariant"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 == 6)
    {

      if (v17)
      {
        _EXRegistrationLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = *(_QWORD *)(a1 + 32);
          v24 = 138543362;
          v25 = v19;
        }

      }
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("EXCatalystSDKVariant"));
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v14, v5);
      goto LABEL_24;
    }
    v20 = objc_msgSend(v14, "count");
    if (v17)
    {
      if (v20 <= 1)
      {
        v21 = (void *)objc_msgSend(v10, "mutableCopy");

LABEL_22:
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, CFSTR("EXCatalystSDKVariant"));
LABEL_23:
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v21, v5);

        v14 = v21;
LABEL_24:

        goto LABEL_25;
      }
    }
    else if (!v20)
    {
      v21 = (void *)objc_msgSend(v10, "mutableCopy");

      goto LABEL_23;
    }
    _EXRegistrationLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = 138543362;
      v25 = v23;
    }

    v21 = (void *)objc_msgSend(v10, "mutableCopy");
    if (!v17)
      goto LABEL_23;
    goto LABEL_22;
  }
  v10 = v6;
LABEL_25:

}

- (void)processExtensionsFromBundle:(__CFBundle *)a3
{
  CFURLRef v4;
  NSObject *v5;

  v4 = CFBundleCopyBuiltInPlugInsURL(a3);
  _EXRegistrationLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[EXFrameworkScanner processExtensionsFromBundle:].cold.1(v4, v5);

  -[EXFrameworkScanner processExtensionsInDirectory:](self, "processExtensionsInDirectory:", v4);
}

- (void)processExtensionsInDirectory:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__EXFrameworkScanner_processExtensionsInDirectory___block_invoke;
  v3[3] = &unk_1E2CFD270;
  v3[4] = self;
  -[EXFrameworkScanner enumerateBundlesWithPathExtension:atURL:block:](self, "enumerateBundlesWithPathExtension:atURL:block:", CFSTR("appex"), a3, v3);
}

void __51__EXFrameworkScanner_processExtensionsInDirectory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "sourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_1E2CFF9B8, 1, 0, objc_msgSend(v6, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend((id)objc_opt_class(), "rootURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:relativeToURL:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "isAppleInternalURL:", v11))
    v12 = 280;
  else
    v12 = 272;
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + v12);
  objc_msgSend(v11, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  _EXRegistrationLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    __51__EXFrameworkScanner_processExtensionsInDirectory___block_invoke_cold_1();

}

- (void)main
{
  void *v7;

  objc_msgSend(a2, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_debug_impl(&dword_190C25000, a4, OS_LOG_TYPE_DEBUG, "Scanning frameworks at '%{public}@'", a1, 0xCu);

}

void __26__EXFrameworkScanner_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  void *v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__EXFrameworkScanner_main__block_invoke_2;
  v6[3] = &unk_1E2CFD298;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v4, "enumerateFrameworksBundlesWithFrameworkURL:block:", v5, v6);

}

uint64_t __26__EXFrameworkScanner_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  _EXRegistrationLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __26__EXFrameworkScanner_main__block_invoke_2_cold_1(a1, v4);

  objc_msgSend(*(id *)(a1 + 40), "processExtensionSDKFromBundle:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "processExtensionsFromBundle:", a2);
}

- (NSURL)sourceURL
{
  return (NSURL *)objc_getProperty(self, a2, 248, 1);
}

- (NSMutableDictionary)_combinedExtensionSDK
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)set_combinedExtensionSDK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSMutableDictionary)_combinedAppleInternalExtensionSDK
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (void)set_combinedAppleInternalExtensionSDK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSMutableArray)_extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)set_extensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSMutableArray)_appleInternalExtensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 280, 1);
}

- (void)set_appleInternalExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__appleInternalExtensions, 0);
  objc_storeStrong((id *)&self->__extensions, 0);
  objc_storeStrong((id *)&self->__combinedAppleInternalExtensionSDK, 0);
  objc_storeStrong((id *)&self->__combinedExtensionSDK, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (void)processExtensionSDKFromBundle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190C25000, v0, v1, "NSExtensionSDK found in '%{public}@'", v2);
  OUTLINED_FUNCTION_6();
}

- (void)processExtensionSDKFromFile:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6();
}

- (void)processExtensionSDKFromFile:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_6();
}

void __55__EXFrameworkScanner_processExtensionSDK_declaringURL___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6();
}

- (void)processExtensionsFromBundle:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();

  OUTLINED_FUNCTION_2_1();
}

void __51__EXFrameworkScanner_processExtensionsInDirectory___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6();
}

void __26__EXFrameworkScanner_main__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190C25000, a2, v4, "Processing: %{public}@", v5);

  OUTLINED_FUNCTION_2_1();
}

@end
