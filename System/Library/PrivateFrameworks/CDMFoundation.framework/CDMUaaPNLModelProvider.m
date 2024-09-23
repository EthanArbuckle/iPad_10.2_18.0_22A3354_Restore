@implementation CDMUaaPNLModelProvider

- (CDMUaaPNLModelProvider)init
{
  CDMUaaPNLModelProvider *v2;
  uint64_t v3;
  FBSDisplayLayoutMonitorConfiguration *frontboardConfig;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDMUaaPNLModelProvider;
  v2 = -[CDMUaaPNLModelProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
    v3 = objc_claimAutoreleasedReturnValue();
    frontboardConfig = v2->_frontboardConfig;
    v2->_frontboardConfig = (FBSDisplayLayoutMonitorConfiguration *)v3;

  }
  return v2;
}

- (id)getModelConfigsForLocale:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CDMUaaPNLModelProvider getModelURLs:](self, "getModelURLs:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    +[CDMUaaPNLModelProvider createModelConfigurationsFromURLs:locale:error:](CDMUaaPNLModelProvider, "createModelConfigurationsFromURLs:locale:error:", v7, v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getForegroundModelConfigForLocale:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CDMUaaPNLModelProvider getModelURLForForegroundApp](self, "getModelURLForForegroundApp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[CDMUaaPNLModelProvider createModelConfigurationFromURL:locale:error:](CDMUaaPNLModelProvider, "createModelConfigurationFromURL:locale:error:", v7, v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getModelURLs:(id *)a3
{
  void *v4;
  id *v5;
  void *v6;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[CDMUaaPNLModelProvider getModelURLsFromDefaults](self, "getModelURLsFromDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
LABEL_5:
    a3 = v5;
    v6 = v5;
    goto LABEL_6;
  }
  +[CDMUaaPNLModelProvider modelURLsForInstalledApps](CDMUaaPNLModelProvider, "modelURLsForInstalledApps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v5 = v6;
    goto LABEL_5;
  }
  if (a3)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    v11[0] = CFSTR("No UaaP custom NLU model config found. Did you configure the model path?");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("UaaPNLService"), 1, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }
LABEL_6:

  return a3;
}

- (id)getModelURLForForegroundApp
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[CDMUaaPNLModelProvider foregroundBundeIdentifiers](self, "foregroundBundeIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = v2;
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v5)
    {
      v6 = v5;
      v21 = v3;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v23;
      while (2)
      {
        v10 = 0;
        v11 = v7;
        do
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v4);
          objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10));
          v7 = objc_claimAutoreleasedReturnValue();

          -[NSObject bundleURL](v7, "bundleURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            v8 = 0;
            goto LABEL_19;
          }
          objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("uaap"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("customLu"));
          v8 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject path](v8, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

          if (v16)
          {
            CDMOSLoggerForCategory(0);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject bundleIdentifier](v7, "bundleIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v27 = "-[CDMUaaPNLModelProvider getModelURLForForegroundApp]";
              v28 = 2112;
              v29 = v20;
              _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s UaaP detected foreground app with model available: %@", buf, 0x16u);

            }
            v18 = v4;
            goto LABEL_18;
          }
          ++v10;
          v11 = v7;
        }
        while (v6 != v10);
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v6)
          continue;
        break;
      }
      v17 = v7;
      v18 = v8;
      v7 = v4;
      v8 = 0;
LABEL_18:

      v4 = v18;
LABEL_19:
      v3 = v21;

      v4 = v7;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getModelURLsFromDefaults
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[CDMUserDefaultsUtils readUaaPNLAppModelPaths](CDMUserDefaultsUtils, "readUaaPNLAppModelPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("appDataPath"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);

  }
  return v3;
}

- (id)foregroundBundeIdentifiers
{
  void *v3;
  dispatch_semaphore_t v4;
  FBSDisplayLayoutMonitorConfiguration *frontboardConfig;
  id v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  frontboardConfig = self->_frontboardConfig;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __52__CDMUaaPNLModelProvider_foregroundBundeIdentifiers__block_invoke;
  v16 = &unk_24DCACE48;
  v6 = v3;
  v17 = v6;
  v7 = v4;
  v18 = v7;
  -[FBSDisplayLayoutMonitorConfiguration setTransitionHandler:](frontboardConfig, "setTransitionHandler:", &v13);
  objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", self->_frontboardConfig, v13, v14, v15, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 500000000);
  if (dispatch_semaphore_wait(v7, v9))
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMUaaPNLModelProvider foregroundBundeIdentifiers]";
      _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Timeout while fetching foreground app bundle identifiers.", buf, 0xCu);
    }

    objc_msgSend(v8, "invalidate");
    v11 = 0;
  }
  else
  {
    objc_msgSend(v8, "invalidate");
    v11 = v6;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontboardConfig, 0);
}

void __52__CDMUaaPNLModelProvider_foregroundBundeIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(a3, "elements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v9, "isUIApplicationElement"))
          {
            objc_msgSend(v9, "bundleIdentifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
              objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

  }
}

+ (id)modelURLsForInstalledApps
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[CDMUaaPNLModelProvider retrieveAllAppBundleURLs](CDMUaaPNLModelProvider, "retrieveAllAppBundleURLs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "retrieveModelURLFromBundleURL:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)retrieveAllAppBundleURLs
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "URL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

+ (id)retrieveModelURLFromBundleURL:(id)a3
{
  __CFBundle *Unique;
  __CFBundle *v4;
  CFURLRef v5;

  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    v4 = Unique;
    v5 = CFBundleCopyResourceURL(Unique, CFSTR("customLu"), 0, CFSTR("uaap"));
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)createModelConfigurationFromURL:(id)a3 locale:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", a4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE9E410], "configurationFromDirectoryUrl:error:", v6, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    v11[0] = CFSTR("Unable to build fullModelUrl from baseURL and locale");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("UaaPNLService"), 1, v8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

+ (id)createModelConfigurationsFromURLs:(id)a3 locale:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v22;
    *(_QWORD *)&v12 = 136315394;
    v19 = v12;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v10);
        +[CDMUaaPNLModelProvider createModelConfigurationFromURL:locale:error:](CDMUaaPNLModelProvider, "createModelConfigurationFromURL:locale:error:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15), v8, a5, v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v9, "addObject:", v16);
        }
        else
        {
          CDMOSLoggerForCategory(0);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*a5, "description");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v26 = "+[CDMUaaPNLModelProvider createModelConfigurationsFromURLs:locale:error:]";
            v27 = 2112;
            v28 = v20;
            _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Error creating UaaP model configuration %@", buf, 0x16u);

          }
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v13);
  }

  return v9;
}

+ (id)getCoreModelConfigurationForLocale:(id)a3 bundlePath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  +[CDMUserDefaultsUtils readUaaPNLCoreModelPath](CDMUserDefaultsUtils, "readUaaPNLCoreModelPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@/"), v8, CFSTR("model-core"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "+[CDMUaaPNLModelProvider getCoreModelConfigurationForLocale:bundlePath:error:]";
      v18 = 2112;
      v19 = v11;
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s UaaP Core model path not defined in user defaults, using default path: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE9E410], "configurationFromDirectoryUrl:error:", v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
