@implementation DOCAppProtectionManager

+ (DOCAppProtectionManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_8);
  return (DOCAppProtectionManager *)(id)sharedManager__sharedManager;
}

void __40__DOCAppProtectionManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = v0;

}

+ (BOOL)hasAnyProtectedApps
{
  void *v2;
  BOOL v3;
  void *v4;

  if (!+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
    return 0;
  objc_msgSend(MEMORY[0x24BE042F8], "lockedApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE042F8], "hiddenApplications");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "count") != 0;

  }
  return v3;
}

- (DOCAppProtectionManager)init
{
  DOCAppProtectionManager *v2;
  DOCAppProtectionManager *v3;
  NSString *hostIdentifier;
  DOCProtectedAppContainerCache *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCAppProtectionManager;
  v2 = -[DOCAppProtectionManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    hostIdentifier = v2->_hostIdentifier;
    v2->_hostIdentifier = (NSString *)&stru_24C0FF868;

    v5 = -[DOCProtectedAppContainerCache initWithDelegate:]([DOCProtectedAppContainerCache alloc], "initWithDelegate:", v3);
    -[DOCAppProtectionManager setAppContainerCache:](v3, "setAppContainerCache:", v5);

    -[DOCAppProtectionManager appContainerCache](v3, "appContainerCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAppProtectionContext:", v3);

    -[DOCAppProtectionManager startObserving](v3, "startObserving");
  }
  return v3;
}

- (BOOL)hasAnyProtectedApps
{
  return objc_msgSend((id)objc_opt_class(), "hasAnyProtectedApps");
}

- (BOOL)isFilesAppLocked
{
  void *v2;
  char v3;

  -[DOCAppProtectionManager lockedApplicationBundleIDs](self, "lockedApplicationBundleIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("com.apple.DocumentsApp"));

  return v3;
}

- (NSArray)lockedApplicationBundleIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE042F8], "lockedApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v9, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v3, "addObject:", v13);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  objc_msgSend(v3, "sortUsingSelector:", sel_caseInsensitiveCompare_);

  return (NSArray *)v3;
}

- (NSArray)hiddenApplicationBundleIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE042F8], "hiddenApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v9, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v3, "addObject:", v13);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  objc_msgSend(v3, "sortUsingSelector:", sel_caseInsensitiveCompare_);

  return (NSArray *)v3;
}

- (NSArray)protectedApplicationBundleIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCAppProtectionManager hiddenApplicationBundleIDs](self, "hiddenApplicationBundleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[DOCAppProtectionManager lockedApplicationBundleIDs](self, "lockedApplicationBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  objc_msgSend(v3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)hiddenApplications
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE042F8], "hiddenApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 136315394;
    v15 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "bundleIdentifier", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DOCAppProtectionManager protectedAppForAppContainerBundleID:](self, "protectedAppForAppContainerBundleID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v3, "addObject:", v12);
        }
        else
        {
          v13 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v13 = docLogHandle;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v15;
            v21 = "-[DOCAppProtectionManager hiddenApplications]";
            v22 = 2112;
            v23 = v10;
            _os_log_debug_impl(&dword_2090A2000, v13, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s could not find protected app for ID: %@", buf, 0x16u);
          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NSArray)lockedApplications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v21;
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
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(MEMORY[0x24BE042F8], "lockedApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE042F8], "hiddenApplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", v9);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v23;
    *(_QWORD *)&v12 = 136315394;
    v21 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v16, "bundleIdentifier", v21, (_QWORD)v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[DOCAppProtectionManager protectedAppForAppContainerBundleID:](self, "protectedAppForAppContainerBundleID:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v3, "addObject:", v18);
        }
        else
        {
          v19 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v19 = docLogHandle;
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v21;
            v27 = "-[DOCAppProtectionManager lockedApplications]";
            v28 = 2112;
            v29 = v16;
            _os_log_debug_impl(&dword_2090A2000, v19, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s could not find protected app for ID: %@", buf, 0x16u);
          }
        }

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v13);
  }

  return (NSArray *)v3;
}

- (NSArray)protectedApplications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  DOCProtectedApp *v18;
  void *v19;
  DOCProtectedApp *v20;
  NSObject *v21;
  __int128 v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(MEMORY[0x24BE042F8], "lockedApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE042F8], "hiddenApplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v26;
    *(_QWORD *)&v9 = 136315394;
    v23 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v13, "bundleIdentifier", v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[DOCAppProtectionManager protectedAppForAppContainerBundleID:](self, "protectedAppForAppContainerBundleID:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v3, "addObject:", v15);
        }
        else
        {
          v16 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v16 = docLogHandle;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            v30 = "-[DOCAppProtectionManager protectedApplications]";
            v31 = 2112;
            v32 = v13;
            _os_log_debug_impl(&dword_2090A2000, v16, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s could not find protected app for ID: %@ in Spotlight cache. This means the ID does not represent an app with an App Container", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = [DOCProtectedApp alloc];
          objc_msgSend(v13, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[DOCProtectedApp initWith:oids:](v18, "initWith:oids:", v19, v17);

          objc_msgSend(v3, "addObject:", v20);
          v21 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v21 = docLogHandle;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            v30 = "-[DOCAppProtectionManager protectedApplications]";
            v31 = 2112;
            v32 = v13;
            _os_log_debug_impl(&dword_2090A2000, v21, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s created protected app for ID: %@", buf, 0x16u);
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v10);
  }

  return (NSArray *)v3;
}

- (NSArray)applicationsWithContentHiddenFromSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(MEMORY[0x24BE042F8], "applicationsWithContentHiddenFromSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE042F8], "hiddenApplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v21;
    *(_QWORD *)&v10 = 136315394;
    v19 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "bundleIdentifier", v19, (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[DOCAppProtectionManager protectedAppForAppContainerBundleID:](self, "protectedAppForAppContainerBundleID:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v3, "addObject:", v16);
        }
        else
        {
          v17 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v17 = docLogHandle;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v19;
            v25 = "-[DOCAppProtectionManager applicationsWithContentHiddenFromSearch]";
            v26 = 2112;
            v27 = v14;
            _os_log_debug_impl(&dword_2090A2000, v17, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s could not find protected app for ID: %@", buf, 0x16u);
          }
        }

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v11);
  }

  return (NSArray *)v3;
}

- (id)protectedAppForAppContainerOID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
  {
    -[DOCAppProtectionManager appContainerCache](self, "appContainerCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appForAppContainerOID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v7 = docLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager protectedAppForAppContainerOID:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v6 = 0;
  }

  return v6;
}

- (id)protectedAppForAppContainerBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
  {
    -[DOCAppProtectionManager appContainerCache](self, "appContainerCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appForAppContainerBundleID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v7 = docLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager protectedAppForAppContainerBundleID:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v6 = 0;
  }

  return v6;
}

- (void)protectedAppForAppContainerBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  if (+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
  {
    -[DOCAppProtectionManager appContainerCache](self, "appContainerCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appForAppContainerBundleID:completion:", v6, v7);

  }
  else
  {
    v9 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v9 = docLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager protectedAppForAppContainerBundleID:completion:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

  }
}

- (void)authenticateLocationWithShielding:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  void (**v42)(_QWORD, _QWORD, _QWORD);
  _QWORD v43[4];
  id v44;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke;
  v43[3] = &unk_24C0FEAF8;
  v10 = v8;
  v44 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0D5D4](v43);
  if (!+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
  {
    v15 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v15 = docLogHandle;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager authenticateLocationWithShielding:completion:].cold.4(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_23;
  }
  if (!v7)
  {
    v23 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v23 = docLogHandle;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager authenticateLocationWithShielding:completion:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_23;
  }
  if ((objc_msgSend((id)objc_opt_class(), "hasAnyProtectedApps") & 1) == 0)
  {
    v31 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v31 = docLogHandle;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager authenticateLocationWithShielding:completion:].cold.3(v31, v32, v33, v34, v35, v36, v37, v38);
LABEL_23:
    v11[2](v11, 1, 0);
    goto LABEL_24;
  }
  -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCAppProtectionManager.m"), 371, CFSTR("[PROTECTED APPS] Can not determine if host identifier is empty: %@"), v40);

  }
  v14 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v14 = docLogHandle;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[DOCAppProtectionManager authenticateLocationWithShielding:completion:].cold.2((uint64_t)v7, v14);
  v41[0] = v9;
  v41[1] = 3221225472;
  v41[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54;
  v41[3] = &unk_24C0FEB70;
  v41[4] = self;
  v42 = v11;
  objc_msgSend(v7, "fetchFPItem:", v41);

LABEL_24:
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_2;
  v8[3] = &unk_24C0FEAD0;
  v6 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  DOCRunInMainThread(v8);

}

uint64_t __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v5 = a2;
  v6 = a3;
  v7 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v7 = docLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54_cold_5((uint64_t)v5, v7);
  v8 = v5;
  objc_msgSend(v8, "cachedDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topLevelBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v11 = docLogHandle;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54_cold_4(a1, v11);
    if (!v10)
      goto LABEL_23;
  }
  else if (!v10)
  {
LABEL_23:
    v17 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_57;
    v18[3] = &unk_24C0FEB48;
    v18[4] = v17;
    v19 = v9;
    v21 = *(id *)(a1 + 40);
    v20 = v8;
    objc_msgSend(v17, "bundleIDOfAppContainer:completion:", v20, v18);

    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v13 = docLogHandle;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54_cold_3((uint64_t)v10, (uint64_t)v12, v13);
  if (!objc_msgSend(v12, "isLocked"))
  {

    goto LABEL_23;
  }
  v14 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v14 = docLogHandle;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54_cold_2();
  objc_msgSend(MEMORY[0x24BE04310], "sharedGuard");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_56;
  v22[3] = &unk_24C0FEB20;
  v23 = v10;
  v24 = *(id *)(a1 + 40);
  objc_msgSend(v15, "initiateAuthenticationWithShieldingForSubject:completion:", v12, v22);

  v16 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v16 = docLogHandle;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54_cold_1();
LABEL_24:

}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_56(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v6 = docLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_56_cold_1();
  }
  v7 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v7 = docLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 136315906;
    v10 = "-[DOCAppProtectionManager authenticateLocationWithShielding:completion:]_block_invoke";
    v11 = 2112;
    v12 = v8;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl(&dword_2090A2000, v7, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s Provider domain: %@ authentication completion handler success: %d error: %@", (uint8_t *)&v9, 0x26u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5
    && (objc_msgSend(*(id *)(a1 + 32), "hostIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v5, "isEqualToString:", v7),
        v7,
        (v8 & 1) == 0))
  {
    v10 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v10 = docLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(void **)(a1 + 32);
      v15 = v10;
      objc_msgSend(v14, "hostIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(void **)(a1 + 40);
      objc_msgSend(v17, "topLevelBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v22 = "-[DOCAppProtectionManager authenticateLocationWithShielding:completion:]_block_invoke";
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      v29 = 2112;
      v30 = v5;
      _os_log_debug_impl(&dword_2090A2000, v15, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s Authentication start for hostIdentifier: %@ node domain: %@ topLevelBundleIdentifier: %@ appContainerBundleIdentifier: %@", buf, 0x34u);

    }
    objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v12 = docLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_57_cold_2(v11, v12);
    objc_msgSend(MEMORY[0x24BE04310], "sharedGuard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_58;
    v19[3] = &unk_24C0FEAF8;
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v13, "initiateAuthenticationWithShieldingForSubject:completion:", v11, v19);

  }
  else
  {
    v9 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v9 = docLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_57_cold_1(a1, (uint64_t)v5, v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_58(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  if (v4)
  {
    v5 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v5 = docLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_58_cold_2();
  }
  v6 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v6 = docLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_58_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)authenticateLocationWithNoUI:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  os_log_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  os_log_t log;
  NSObject *loga;
  _QWORD v54[5];
  id v55;
  id v56;
  void (**v57)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v58[4];
  id v59;
  id v60;
  void (**v61)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v62[4];
  id v63;
  DOCAppProtectionManager *v64;
  id v65;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke;
  v62[3] = &unk_24C0FEBC0;
  v9 = v6;
  v63 = v9;
  v64 = self;
  v10 = v7;
  v65 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x20BD0D5D4](v62);
  if (+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
  {
    if ((objc_msgSend((id)objc_opt_class(), "hasAnyProtectedApps") & 1) != 0)
    {
      if (v9)
      {
        objc_msgSend(v9, "cachedDomain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "topLevelBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v14 = docLogHandle;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          loga = v14;
          -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "topLevelBundleIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          v67 = "-[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]";
          v68 = 2112;
          v69 = v48;
          v70 = 2112;
          v71 = v9;
          v72 = 2112;
          v73 = v12;
          v74 = 2112;
          v75 = v49;
          _os_log_debug_impl(&dword_2090A2000, loga, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s targetNode: %@ cachedDomain: %@, topLevelBundleIdentifier: %@ hostIdentifier: %@, ", buf, 0x34u);

        }
        v15 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v15 = docLogHandle;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:].cold.5(v15, self);
          if (!v13)
            goto LABEL_46;
        }
        else if (!v13)
        {
          goto LABEL_46;
        }
        objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", v13);
        log = (os_log_t)objc_claimAutoreleasedReturnValue();
        v16 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v16 = docLogHandle;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:].cold.4((uint64_t)v13, (uint64_t)log, v16);
        -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v13, "isEqualToString:", v17);

        if (v18)
        {
          v19 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v19 = docLogHandle;
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v50 = v19;
            -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v67 = "-[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]";
            v68 = 2112;
            v69 = v12;
            v70 = 2112;
            v71 = v51;
            v72 = 2112;
            v73 = v9;
            _os_log_debug_impl(&dword_2090A2000, v50, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s : cached file provider domain %@ matches host identifier: %@ for node: %@. Do not require auth.", buf, 0x2Au);

          }
          v20 = log;
          -[NSObject isLocked](log, "isLocked");
        }
        else
        {
          v20 = log;
          if (-[NSObject isLocked](log, "isLocked"))
          {
            v45 = docLogHandle;
            if (!docLogHandle)
            {
              DOCInitLogging();
              v45 = docLogHandle;
            }
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
              -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:].cold.3();
            objc_msgSend(MEMORY[0x24BE04310], "sharedGuard");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v58[0] = v8;
            v58[1] = 3221225472;
            v58[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_64;
            v58[3] = &unk_24C0FEBE8;
            v59 = v13;
            v60 = v9;
            v61 = v11;
            objc_msgSend(v46, "authenticateForSubject:completion:", log, v58);

            v47 = docLogHandle;
            if (!docLogHandle)
            {
              DOCInitLogging();
              v47 = docLogHandle;
            }
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:].cold.2();
            goto LABEL_47;
          }
        }

LABEL_46:
        v54[0] = v8;
        v54[1] = 3221225472;
        v54[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_66;
        v54[3] = &unk_24C0FEC38;
        v54[4] = self;
        v55 = v12;
        v56 = v9;
        v57 = v11;
        -[DOCAppProtectionManager bundleIDOfAppContainer:completion:](self, "bundleIDOfAppContainer:completion:", v56, v54);

LABEL_47:
        goto LABEL_35;
      }
      v37 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v37 = docLogHandle;
      }
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:].cold.1(v37, v38, v39, v40, v41, v42, v43, v44);
    }
    else
    {
      v29 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v29 = docLogHandle;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:].cold.6(v29, v30, v31, v32, v33, v34, v35, v36);
    }
  }
  else
  {
    v21 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v21 = docLogHandle;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:].cold.7(v21, v22, v23, v24, v25, v26, v27, v28);
  }
  v11[2](v11, 1, 0, 0);
LABEL_35:

}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  char v19;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v9 = docLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_cold_1((uint64_t)v7, a1, v9);
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_61;
  v14[3] = &unk_24C0FEB98;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v15 = v8;
  v16 = v10;
  v19 = a2;
  v17 = v7;
  v18 = v11;
  v12 = v7;
  v13 = v8;
  DOCRunInMainThread(v14);

}

uint64_t __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_61(_QWORD *a1)
{
  void *v2;

  if (a1[4])
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("DOCAppProtectionAuthenticationChallengeDidFinishNotification"), a1[5], a1[4]);

  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_64(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v6 = docLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_64_cold_2();
  }
  v7 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v7 = docLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = a1[4];
    v13 = 136315906;
    v14 = "-[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]_block_invoke";
    v15 = 2112;
    v16 = v12;
    v17 = 1024;
    v18 = a2;
    v19 = 2112;
    v20 = v5;
    _os_log_debug_impl(&dword_2090A2000, v7, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s Provider domain: %@ authentication completion handler success: %d error: %@", (uint8_t *)&v13, 0x26u);
  }
  v8 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v8 = docLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_64_cold_1();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[5];
  if (v11)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("DOCAppProtectionStatusNotificationUserInfoAuthenticatedNodeKey"));
  (*(void (**)(void))(a1[6] + 16))();

}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5
    && (objc_msgSend(*(id *)(a1 + 32), "hostIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v5, "isEqualToString:", v7),
        v7,
        (v8 & 1) == 0))
  {
    v10 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v10 = docLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(void **)(a1 + 32);
      v15 = v10;
      objc_msgSend(v14, "hostIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(void **)(a1 + 40);
      objc_msgSend(v17, "topLevelBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v24 = "-[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]_block_invoke";
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      v31 = 2112;
      v32 = v5;
      _os_log_debug_impl(&dword_2090A2000, v15, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s Authentication start for hostIdentifier: %@ node domain: %@ topLevelBundleIdentifier: %@ appContainerBundleIdentifier: %@", buf, 0x34u);

    }
    objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_67;
    v19[3] = &unk_24C0FEC10;
    v20 = v11;
    v21 = *(id *)(a1 + 48);
    v22 = *(id *)(a1 + 56);
    v13 = v11;
    objc_msgSend(v12, "protectedAppForAppContainerBundleID:completion:", v5, v19);

  }
  else
  {
    v9 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v9 = docLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_57_cold_1(a1, (uint64_t)v5, v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v4 = docLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_67_cold_1(a1, v4);
  objc_msgSend(MEMORY[0x24BE04310], "sharedGuard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_68;
  v8[3] = &unk_24C0FEBE8;
  v9 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v5, "authenticateForSubject:completion:", v6, v8);

}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_68(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v5 = docLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_68_cold_2();
  }
  v6 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v6 = docLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_64_cold_1();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[4])
  {
    v10[0] = a1[4];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("DOCAppProtectionStatusNotificationUserInfoAppsKey"));

  }
  v9 = a1[5];
  if (v9)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("DOCAppProtectionStatusNotificationUserInfoAuthenticatedNodeKey"));
  (*(void (**)(void))(a1[6] + 16))();

}

- (BOOL)nodeRequiresAuthentication_Sync:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  double Current;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  double v33;
  NSObject *v34;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  int v44;
  int v45;
  int v46;
  const char *v47;
  __int16 v48;
  _BYTE v49[30];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
  {
LABEL_16:
    LOBYTE(v22) = 0;
    goto LABEL_55;
  }
  if ((objc_msgSend((id)objc_opt_class(), "hasAnyProtectedApps") & 1) == 0)
  {
    v14 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v14 = docLogHandle;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager nodeRequiresAuthentication_Sync:].cold.3(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_16;
  }
  objc_msgSend(v4, "cachedDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_24;
  objc_msgSend(v5, "topLevelBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_24;
  objc_msgSend(v6, "topLevelBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v11 = docLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v41 = v11;
      -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 136315906;
      v47 = "-[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]";
      v48 = 2112;
      *(_QWORD *)v49 = v6;
      *(_WORD *)&v49[8] = 2112;
      *(_QWORD *)&v49[10] = v42;
      *(_WORD *)&v49[18] = 2112;
      *(_QWORD *)&v49[20] = v4;
      _os_log_debug_impl(&dword_2090A2000, v41, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s : cached file provider domain %@ matches host identifier: %@ for node: %@. Do not require auth.", (uint8_t *)&v46, 0x2Au);

    }
  }
  objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isHidden") & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v12, "isLocked");
  v23 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v23 = docLogHandle;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v46 = 136315906;
    v47 = "-[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]";
    v48 = 2112;
    *(_QWORD *)v49 = v6;
    *(_WORD *)&v49[8] = 1024;
    *(_DWORD *)&v49[10] = v13;
    *(_WORD *)&v49[14] = 2112;
    *(_QWORD *)&v49[16] = v4;
    _os_log_debug_impl(&dword_2090A2000, v23, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s : cached file provider domain %@ locked or hidden: %d for node: %@", (uint8_t *)&v46, 0x26u);
  }

  if (((v10 | v13) & 1) != 0)
  {
    LOBYTE(v22) = v10 ^ 1;
  }
  else
  {
LABEL_24:
    if (-[DOCAppProtectionManager canNodeHostAnAppContainer:](self, "canNodeHostAnAppContainer:", v4))
    {
      Current = CFAbsoluteTimeGetCurrent();
      v25 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v25 = docLogHandle;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[DOCAppProtectionManager nodeRequiresAuthentication_Sync:].cold.1();
      -[DOCAppProtectionManager bundleIDOfAppContainer_Sync:](self, "bundleIDOfAppContainer_Sync:", v4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26
        && (-[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v26, "isEqualToString:", v27),
            v27,
            (v28 & 1) == 0))
      {
        objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v32 = docLogHandle;
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v43 = v32;
          v44 = objc_msgSend(v31, "isHidden");
          v45 = objc_msgSend(v31, "isLocked");
          v46 = 136316162;
          v47 = "-[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]";
          v48 = 2112;
          *(_QWORD *)v49 = v4;
          *(_WORD *)&v49[8] = 2112;
          *(_QWORD *)&v49[10] = v26;
          *(_WORD *)&v49[18] = 1024;
          *(_DWORD *)&v49[20] = v44;
          *(_WORD *)&v49[24] = 1024;
          *(_DWORD *)&v49[26] = v45;
          _os_log_debug_impl(&dword_2090A2000, v43, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s : target node: %@ appContainerBundleIdentifier: %@ isHidden: %d isLocked: %d", (uint8_t *)&v46, 0x2Cu);

        }
        if ((objc_msgSend(v31, "isHidden") & 1) != 0)
          v22 = 1;
        else
          v22 = objc_msgSend(v31, "isLocked");

      }
      else
      {
        v29 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v29 = docLogHandle;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v39 = v29;
          -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 136315906;
          v47 = "-[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]";
          v48 = 2112;
          *(_QWORD *)v49 = v4;
          *(_WORD *)&v49[8] = 2112;
          *(_QWORD *)&v49[10] = v26;
          *(_WORD *)&v49[18] = 2112;
          *(_QWORD *)&v49[20] = v40;
          _os_log_debug_impl(&dword_2090A2000, v39, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s Proceed without auth. Node: %@ is not in an app container OR app container bundle id: %@ matches host id: %@", (uint8_t *)&v46, 0x2Au);

        }
        v22 = 0;
      }
      v33 = CFAbsoluteTimeGetCurrent();
      v34 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v34 = docLogHandle;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v36 = (void *)MEMORY[0x24BDD16E0];
        v37 = v34;
        objc_msgSend(v36, "numberWithDouble:", v33 - Current);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 136315906;
        v47 = "-[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]";
        v48 = 1024;
        *(_DWORD *)v49 = v22;
        *(_WORD *)&v49[4] = 2112;
        *(_QWORD *)&v49[6] = v38;
        *(_WORD *)&v49[14] = 2112;
        *(_QWORD *)&v49[16] = v4;
        _os_log_debug_impl(&dword_2090A2000, v37, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s requiresAuthentication: %d took: %@ ms for node: %@", (uint8_t *)&v46, 0x26u);

      }
    }
    else
    {
      v30 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v30 = docLogHandle;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[DOCAppProtectionManager nodeRequiresAuthentication_Sync:].cold.2();
      LOBYTE(v22) = 0;
    }
  }

LABEL_55:
  return v22;
}

- (BOOL)canNodeHostAnAppContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
  {
    if (v4)
    {
      objc_msgSend(v4, "providerID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cachedDomain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isiCloudDriveProvider"))
      {
        v7 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v7 = docLogHandle;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[DOCAppProtectionManager canNodeHostAnAppContainer:].cold.2((uint64_t)v4, v7);
      }
      else
      {
        v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));
        v11 = docLogHandle;
        if (!v10)
        {
          if (!docLogHandle)
          {
            DOCInitLogging();
            v11 = docLogHandle;
          }
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v13 = v11;
            -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = 136315906;
            v16 = "-[DOCAppProtectionManager canNodeHostAnAppContainer:]";
            v17 = 2112;
            v18 = v4;
            v19 = 2112;
            v20 = v6;
            v21 = 2112;
            v22 = v14;
            _os_log_debug_impl(&dword_2090A2000, v13, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s targetNode: %@ returning NO. Cached domain: %@ Host ID: %@", (uint8_t *)&v15, 0x2Au);

          }
          v9 = 0;
          goto LABEL_24;
        }
        if (!docLogHandle)
        {
          DOCInitLogging();
          v11 = docLogHandle;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[DOCAppProtectionManager canNodeHostAnAppContainer:].cold.3((uint64_t)v4, v11);
      }
      v9 = 1;
LABEL_24:

      goto LABEL_25;
    }
    v8 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v8 = docLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager canNodeHostAnAppContainer:].cold.1(v8);
  }
  v9 = 0;
LABEL_25:

  return v9;
}

- (unint64_t)hostAppCanNavigateToTargetNode:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;

  v5 = a3;
  if (!+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
  {
LABEL_11:
    v9 = 0;
    goto LABEL_14;
  }
  -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCAppProtectionManager.m"), 653, CFSTR("Can not determine if host identifier is empty: %@"), v20);

  }
  if ((objc_msgSend((id)objc_opt_class(), "hasAnyProtectedApps") & 1) == 0)
  {
    v10 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v10 = docLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager hostAppCanNavigateToTargetNode:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_11;
  }
  objc_msgSend(v5, "cachedDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = -[DOCAppProtectionManager hostAppCanNavigateToFileProviderDomain:](self, "hostAppCanNavigateToFileProviderDomain:", v8);
  else
    v9 = 0;

LABEL_14:
  return v9;
}

- (unint64_t)hostAppCanNavigateToFileProviderDomain:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a3;
  if (!+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
  {
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCAppProtectionManager.m"), 671, CFSTR("Can not determine if host identifier is empty: %@"), v22);

  }
  objc_msgSend(v5, "topLevelBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topLevelBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCAppProtectionManager.m"), 672, CFSTR("Can not determine if host identifier is empty: %@"), v24);

  }
  if ((objc_msgSend((id)objc_opt_class(), "hasAnyProtectedApps") & 1) == 0)
  {
    v12 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v12 = docLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager hostAppCanNavigateToFileProviderDomain:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_12;
  }
  objc_msgSend(v5, "topLevelBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DOCAppProtectionManager hostAppCanNavigateToAppBundleID:](self, "hostAppCanNavigateToAppBundleID:", v10);

LABEL_13:
  return v11;
}

- (unint64_t)hostAppCanNavigateToAppBundleID:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  void *v23;

  v5 = a3;
  if (!+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
  {
LABEL_11:
    v12 = 0;
    goto LABEL_14;
  }
  -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCAppProtectionManager.m"), 692, CFSTR("Can not determine if host identifier is empty: %@"), v23);

  }
  if ((objc_msgSend((id)objc_opt_class(), "hasAnyProtectedApps") & 1) == 0)
  {
    v13 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v13 = docLogHandle;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager hostAppCanNavigateToAppBundleID:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isHidden"))
  {
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    v12 = v11 ^ 1u;
  }
  else
  {
    v12 = 0;
  }

LABEL_14:
  return v12;
}

- (BOOL)hostAppCanSeeFileProviderDomain:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a3;
  if (!+[DOCFeature protectedAppsEnabled](DOCFeature, "protectedAppsEnabled"))
    goto LABEL_13;
  -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCAppProtectionManager.m"), 722, CFSTR("Can not determine if host identifier is empty: %@"), v23);

  }
  objc_msgSend(v5, "topLevelBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topLevelBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCAppProtectionManager.m"), 723, CFSTR("Can not determine if host identifier is empty: %@"), v25);

  }
  if ((objc_msgSend((id)objc_opt_class(), "hasAnyProtectedApps") & 1) == 0)
  {
    v13 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v13 = docLogHandle;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager hostAppCanSeeFileProviderDomain:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_13;
  }
  if (!objc_msgSend(v5, "owningApplicationIsHidden"))
  {
LABEL_13:
    v12 = 1;
    goto LABEL_14;
  }
  objc_msgSend(v5, "topLevelBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCAppProtectionManager hostIdentifier](self, "hostIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

LABEL_14:
  return v12;
}

- (unint64_t)hostAppPermissionForTargetNode:(id)a3
{
  return -[DOCAppProtectionManager hostAppCanNavigateToTargetNode:](self, "hostAppCanNavigateToTargetNode:", a3) == 1;
}

- (BOOL)itemIsAppContainer:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "fpfs_fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_appContainerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)itemIsInAppContainer:(id)a3
{
  return 0;
}

- (void)bundleIDOfAppContainer:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  CFAbsoluteTime Current;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(_QWORD, _QWORD);
  _QWORD v23[4];
  id v24;
  id v25;
  CFAbsoluteTime v26;
  _QWORD v27[4];
  id v28;
  CFAbsoluteTime v29;

  v5 = a3;
  v6 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  v8 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v8 = docLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DOCAppProtectionManager bundleIDOfAppContainer:completion:].cold.4();
  v9 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke;
  v27[3] = &unk_24C0FEC60;
  v10 = v5;
  v28 = v10;
  v29 = Current;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD0D5D4](v27);
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_76;
  v23[3] = &unk_24C0FECB0;
  v12 = v6;
  v25 = v12;
  v13 = v10;
  v24 = v13;
  v26 = Current;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD0D5D4](v23);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v15 = docLogHandle;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[DOCAppProtectionManager bundleIDOfAppContainer:completion:].cold.1();
    ((void (**)(_QWORD, id))v14)[2](v14, v13);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v16 = docLogHandle;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[DOCAppProtectionManager bundleIDOfAppContainer:completion:].cold.3();
      ((void (**)(_QWORD, id))v11)[2](v11, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v18 = docLogHandle;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[DOCAppProtectionManager bundleIDOfAppContainer:completion:].cold.2();
        (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v17, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "nodeURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v9;
        v21[1] = 3221225472;
        v21[2] = __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_82;
        v21[3] = &unk_24C0FE2F0;
        v22 = v14;
        objc_msgSend(v19, "fetchItemForURL:completionHandler:", v20, v21);

      }
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
    }
  }

}

id __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke(uint64_t a1)
{
  void **v2;
  id v3;
  void *v4;
  void *v5;
  double Current;
  double v7;
  NSObject *v8;
  NSObject *v9;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void **)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(id *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BE2BEB0], "appLibraryNodeForNode:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(double *)(a1 + 40);
    v8 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v8 = docLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = *v2;
      v12 = v8;
      objc_msgSend(v11, "displayName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", Current - v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136316162;
      v16 = "-[DOCAppProtectionManager bundleIDOfAppContainer:completion:]_block_invoke";
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v3;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v14;
      _os_log_debug_impl(&dword_2090A2000, v12, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s 1. FINode: (%@) %@ appIdentifier: %@ took: %@ ms", (uint8_t *)&v15, 0x34u);

    }
    v9 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v9 = docLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_cold_1((uint64_t)v2, v9);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  v4 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v4 = docLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_76_cold_2((uint64_t)v3, v4);
  objc_msgSend(v3, "fp_appContainerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v6 = docLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_76_cold_1(v6, (uint64_t)v3);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "fp_appContainerBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_78;
    v11[3] = &unk_24C0FEC88;
    v12 = v3;
    v13 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v9, "fetchParentsForItemID:recursively:completionHandler:", v10, 1, v11);

    v8 = v12;
  }

}

void __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double Current;
  double v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v7 = docLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_78_cold_1(a1, v7, (uint64_t)v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "fp_appContainerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v5, "reverseObjectEnumerator", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v15, "fp_appContainerBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "fp_appContainerBundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "copy");

          v9 = (void *)v18;
          goto LABEL_16;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_16:

  Current = CFAbsoluteTimeGetCurrent();
  v20 = *(double *)(a1 + 56);
  v21 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v21 = docLogHandle;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(void **)(a1 + 40);
    v23 = v21;
    objc_msgSend(v22, "displayName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", Current - v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v32 = "-[DOCAppProtectionManager bundleIDOfAppContainer:completion:]_block_invoke";
    v33 = 2112;
    v34 = v24;
    v35 = 2112;
    v36 = v25;
    v37 = 2112;
    v38 = v9;
    v39 = 2112;
    v40 = v26;
    v41 = 2112;
    v42 = v5;
    _os_log_debug_impl(&dword_2090A2000, v23, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s 4 FPItem. node: (%@) %@ appContainerBundleIdentifier: %@ took: %@ ms, parentItems: %@", buf, 0x3Eu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  v7 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v7 = docLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_82_cold_1((uint64_t)v5, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)bundleIDOfAppContainer_Sync:(id)a3
{
  id v4;
  NSObject *v5;
  double Current;
  NSObject *v7;
  NSObject *v8;
  double v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v5 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v5 = docLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DOCAppProtectionManager bundleIDOfAppContainer_Sync:].cold.1();
  Current = CFAbsoluteTimeGetCurrent();
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __55__DOCAppProtectionManager_bundleIDOfAppContainer_Sync___block_invoke;
  v19 = &unk_24C0FECD8;
  v21 = &v22;
  v8 = v7;
  v20 = v8;
  -[DOCAppProtectionManager bundleIDOfAppContainer:completion:](self, "bundleIDOfAppContainer:completion:", v4, &v16);
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = CFAbsoluteTimeGetCurrent();
  v10 = (void *)docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v10 = (void *)docLogHandle;
  }
  v11 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = v23[5];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9 - Current, v16, v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v29 = "-[DOCAppProtectionManager bundleIDOfAppContainer_Sync:]";
    v30 = 2112;
    v31 = v4;
    v32 = 2112;
    v33 = v14;
    v34 = 2112;
    v35 = v15;
    _os_log_debug_impl(&dword_2090A2000, v11, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s node: %@ appContainerBundleIdentifier: %@ took: %@ ms", buf, 0x2Au);

  }
  v12 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __55__DOCAppProtectionManager_bundleIDOfAppContainer_Sync___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)appProtectionCacheDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v5 = docLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DOCAppProtectionManager appProtectionCacheDidUpdate:].cold.1();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__DOCAppProtectionManager_appProtectionCacheDidUpdate___block_invoke;
  v6[3] = &unk_24C0FE168;
  v6[4] = self;
  DOCRunInMainThread(v6);

}

void __55__DOCAppProtectionManager_appProtectionCacheDidUpdate___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:userInfo:", CFSTR("DOCAppProtectionStatusDidChangeNotification"), *(_QWORD *)(a1 + 32), MEMORY[0x24BDBD1B8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v2 = docLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __55__DOCAppProtectionManager_appProtectionCacheDidUpdate___block_invoke_cold_1();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotification:", v1);

}

- (void)startObserving
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s feature disabled. Not starting subscription.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)stopObserving
{
  NSObject *v1;
  id v2;
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "appMonitorSubscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v1, v4, "[PROTECTED APPS] %s invalidating subscription: %@ self: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_2_3();
}

- (NSString)hostIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHostIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (DOCProtectedAppContainerCache)appContainerCache
{
  return (DOCProtectedAppContainerCache *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAppContainerCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)appToOID
{
  return self->_appToOID;
}

- (APSubjectMonitorSubscription)appMonitorSubscription
{
  return (APSubjectMonitorSubscription *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppMonitorSubscription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appMonitorSubscription, 0);
  objc_storeStrong((id *)&self->_appToOID, 0);
  objc_storeStrong((id *)&self->_appContainerCache, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  DOCAppProtectionManager *v12;

  v6 = a3;
  v7 = a4;
  v8 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v8 = docLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DOCAppProtectionManager(APSubjectMonitorConformance) appProtectionSubjectsChanged:forSubscription:].cold.1();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke;
  v10[3] = &unk_24C0FE190;
  v11 = v6;
  v12 = self;
  v9 = v6;
  DOCRunInMainThread(v10);

}

void __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v22;
    *(_QWORD *)&v4 = 136315394;
    v19 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(*(id *)(a1 + 40), "protectedAppForAppContainerBundleID:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              objc_msgSend(v20, "addObject:", v10);
            }
            else
            {
              v12 = docLogHandle;
              if (!docLogHandle)
              {
                DOCInitLogging();
                v12 = docLogHandle;
              }
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v19;
                v28 = "-[DOCAppProtectionManager(APSubjectMonitorConformance) appProtectionSubjectsChanged:forSubscriptio"
                      "n:]_block_invoke";
                v29 = 2112;
                v30 = v9;
                _os_log_error_impl(&dword_2090A2000, v12, OS_LOG_TYPE_ERROR, "[PROTECTED APPS] %s could not find cached app for ID: %@", buf, 0x16u);
              }
            }

          }
          else
          {
            v11 = docLogHandle;
            if (!docLogHandle)
            {
              DOCInitLogging();
              v11 = docLogHandle;
            }
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              v28 = "-[DOCAppProtectionManager(APSubjectMonitorConformance) appProtectionSubjectsChanged:forSubscription:]_block_invoke";
              v29 = 2112;
              v30 = v8;
              _os_log_error_impl(&dword_2090A2000, v11, OS_LOG_TYPE_ERROR, "[PROTECTED APPS] %s could not get app ID from subject: %@", buf, 0x16u);
            }
          }

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v5);
  }

  v13 = (void *)MEMORY[0x24BDD16C8];
  v14 = *(_QWORD *)(a1 + 40);
  v25 = CFSTR("DOCAppProtectionStatusNotificationUserInfoAppsKey");
  v26 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "notificationWithName:object:userInfo:", CFSTR("DOCAppProtectionStatusDidChangeNotification"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v17 = docLogHandle;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke_cold_1();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotification:", v16);

}

- (void)protectedAppForAppContainerOID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s feature disabled", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)protectedAppForAppContainerBundleID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s feature disabled", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)protectedAppForAppContainerBundleID:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s feature disabled", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)authenticateLocationWithShielding:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s null node, proceed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)authenticateLocationWithShielding:(uint64_t)a1 completion:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "displayName");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "nodeURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315906;
  v9 = "-[DOCAppProtectionManager authenticateLocationWithShielding:completion:]";
  v10 = 2112;
  v11 = a1;
  v12 = 2112;
  v13 = v3;
  v14 = 2112;
  v15 = v6;
  OUTLINED_FUNCTION_16(&dword_2090A2000, v2, v7, "[PROTECTED APPS] %s targetNode: %@ displayName: %@ nodeURL: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_6();
}

- (void)authenticateLocationWithShielding:(uint64_t)a3 completion:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s there are no protected apps, proceed without auth", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)authenticateLocationWithShielding:(uint64_t)a3 completion:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s feature disabled, proceed without auth", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s domain: %@ required auth. Skipping item auth check", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s Provider domain: %@ is locked starting authentication", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54_cold_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v4 = a3;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_21(&dword_2090A2000, v5, v6, "[PROTECTED APPS] %s Check if provider domain: %@ subject: %@ isHidden: %d isLocked: %d", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6();
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54_cold_4(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7[14];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_19(), "hostIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "topLevelBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315906;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_16(&dword_2090A2000, v2, v6, "[PROTECTED APPS] %s hostIdentifier: %@, cachedDomain: %@, topLevelBundleIdentifier: %@", (uint8_t *)v7);

  OUTLINED_FUNCTION_6();
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_54_cold_5(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;

  OUTLINED_FUNCTION_18(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315650;
  v6 = "-[DOCAppProtectionManager authenticateLocationWithShielding:completion:]_block_invoke";
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v2, v4, "[PROTECTED APPS] %s fetched FPItem: %@ displayName: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_3();
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_56_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s Provider domain: %@ isinitiateAuthenticationWithShieldingForSubject failed with error: %@", v2);
  OUTLINED_FUNCTION_10();
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_57_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  OUTLINED_FUNCTION_23(a1, a2, a3);
  objc_msgSend((id)OUTLINED_FUNCTION_19(), "hostIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v3, v6, "[PROTECTED APPS] Proceed without auth. Node: %@ is not in an app container OR app container bundle id: %@ matches host id: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2_3();
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_57_cold_2(void *a1, void *a2)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;

  OUTLINED_FUNCTION_18((uint64_t)a1, a2);
  v5 = 136315906;
  v6 = "-[DOCAppProtectionManager authenticateLocationWithShielding:completion:]_block_invoke";
  v7 = 2112;
  v8 = a1;
  v9 = 1024;
  v10 = objc_msgSend((id)OUTLINED_FUNCTION_12(), "isHidden");
  v11 = 1024;
  v12 = objc_msgSend(a1, "isLocked");
  OUTLINED_FUNCTION_28(&dword_2090A2000, v2, v4, "[PROTECTED APPS] %s authentication subject creation: %@ isHidden: %d isLocked: %d", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_3();
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_58_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s authentication completion handler success: %d error: %@", v2);
  OUTLINED_FUNCTION_10();
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_58_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_24(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s initiateAuthenticationWithShieldingForSubject failed with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)authenticateLocationWithNoUI:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s null node, proceed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)authenticateLocationWithNoUI:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s domain: %@ required auth. Skipping item auth check", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)authenticateLocationWithNoUI:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s Provider domain: %@ is locked starting authentication", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)authenticateLocationWithNoUI:(void *)a3 completion:.cold.4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v4 = a3;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_21(&dword_2090A2000, v5, v6, "[PROTECTED APPS] %s Check if provider domain: %@ subject: %@ isHidden: %d isLocked: %d", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6();
}

- (void)authenticateLocationWithNoUI:(void *)a1 completion:(void *)a2 .cold.5(void *a1, void *a2)
{
  NSObject *v2;
  id v4;
  void *v5;
  uint64_t v6;
  int v7[14];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_19(), "hostIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "topLevelBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315906;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_16(&dword_2090A2000, v2, v6, "[PROTECTED APPS] %s hostIdentifier: %@, cachedDomain: %@, topLevelBundleIdentifier: %@", (uint8_t *)v7);

  OUTLINED_FUNCTION_6();
}

- (void)authenticateLocationWithNoUI:(uint64_t)a3 completion:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s there are no protected apps, proceed without auth", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)authenticateLocationWithNoUI:(uint64_t)a3 completion:(uint64_t)a4 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s feature disabled, proceed without auth", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_14(&dword_2090A2000, a2, a3, "[PROTECTED APPS] %s authentication failed with error: %@ for node: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *(_QWORD *)(a2 + 32));
  OUTLINED_FUNCTION_10();
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_64_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s authenticateForSubject completion success: %d error: %@", v2);
  OUTLINED_FUNCTION_10();
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_64_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_14(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s Provider domain: %@ isinitiateAuthenticationWithShieldingForSubject failed with error: %@", v2);
  OUTLINED_FUNCTION_10();
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_67_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v6 = objc_msgSend((id)OUTLINED_FUNCTION_19(), "isHidden");
  v7 = objc_msgSend(*(id *)(a1 + 32), "isLocked");
  v9 = 136315906;
  v10 = "-[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]_block_invoke";
  v11 = 2112;
  v12 = v4;
  v13 = 1024;
  v14 = v6;
  v15 = 1024;
  v16 = v7;
  OUTLINED_FUNCTION_28(&dword_2090A2000, v2, v8, "[PROTECTED APPS] %s authentication subject creation: %@ isHidden: %d isLocked: %d", (uint8_t *)&v9);

  OUTLINED_FUNCTION_2_3();
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_68_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_24(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s authenticateForSubject failed with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)nodeRequiresAuthentication_Sync:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s Checking if location needs auth authentication start node: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)nodeRequiresAuthentication_Sync:.cold.2()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v0, (uint64_t)v0, "[PROTECTED APPS] %s : target node: %@ can't host an appContainer, and isn't in a locked file provider domain %@ can't require auth", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

- (void)nodeRequiresAuthentication_Sync:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s there are no protected apps, proceed without auth", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)canNodeHostAnAppContainer:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "hostIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(&dword_2090A2000, v1, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s Empty target node. Host ID: %@", (uint8_t *)v4, 0x16u);

  OUTLINED_FUNCTION_10();
}

- (void)canNodeHostAnAppContainer:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5[10];

  OUTLINED_FUNCTION_18(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "hostIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v2, v4, "[PROTECTED APPS] %s targetNode: %@ Is iCloud Drive returning YES. Host ID: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_2_3();
}

- (void)canNodeHostAnAppContainer:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5[10];

  OUTLINED_FUNCTION_18(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "hostIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v2, v4, "[PROTECTED APPS] %s targetNode: %@ Is Local Storage returning YES Host ID: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_2_3();
}

- (void)hostAppCanNavigateToTargetNode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s there are no protected apps, returning DOCAppProtectionStatusAllowed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)hostAppCanNavigateToFileProviderDomain:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s there are no protected apps, returning DOCAppProtectionStatusAllowed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)hostAppCanNavigateToAppBundleID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s there are no protected apps, returning DOCAppProtectionStatusAllowed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)hostAppCanSeeFileProviderDomain:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_2090A2000, a1, a3, "[PROTECTED APPS] %s there are no protected apps, returning DOCAppProtectionStatusAllowed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)bundleIDOfAppContainer:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s 2: provided node is a FPItem: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)bundleIDOfAppContainer:completion:.cold.2()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v0, (uint64_t)v0, "[PROTECTED APPS] %s 3: returning bundleID: %@ for FINode: %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

- (void)bundleIDOfAppContainer:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s 3: provided node is a FINode: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)bundleIDOfAppContainer:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s 1: provided node: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_19(), "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v2, v5, "[PROTECTED APPS] %s 1. FINode: (%@) %@ appIdentifier was nil. Falling back to FPItem.", (uint8_t *)v6);

  OUTLINED_FUNCTION_2_3();
}

void __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_76_cold_1(void *a1, uint64_t a2)
{
  NSObject *v2;
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "displayName");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_26(), "fp_appContainerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315906;
  v9 = "-[DOCAppProtectionManager bundleIDOfAppContainer:completion:]_block_invoke";
  v10 = 2112;
  v11 = v3;
  v12 = 2112;
  v13 = a2;
  v14 = 2112;
  v15 = v6;
  OUTLINED_FUNCTION_16(&dword_2090A2000, v2, v7, "[PROTECTED APPS] %s 2. FPItem: provided node: (%@) %@ appContainerBundleIdentifier: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_6();
}

void __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_76_cold_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;

  OUTLINED_FUNCTION_18(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "fp_appContainerBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315650;
  v6 = "-[DOCAppProtectionManager bundleIDOfAppContainer:completion:]_block_invoke";
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v2, v4, "[PROTECTED APPS] %s 1: FPItem: provided node as fpfs_fpItem: %@ appContainerBundleIdentifier: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_3();
}

void __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_78_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = 136316162;
  v11 = "-[DOCAppProtectionManager bundleIDOfAppContainer:completion:]_block_invoke";
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = a3;
  v16 = 2112;
  v17 = v8;
  v18 = 2112;
  v19 = v9;
  _os_log_error_impl(&dword_2090A2000, v6, OS_LOG_TYPE_ERROR, "[PROTECTED APPS] %s 3 FPItem. fetchParentsForItemID: %@ error: %@  from item: %@ from node: %@", (uint8_t *)&v10, 0x34u);

  OUTLINED_FUNCTION_6();
}

void __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_82_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;

  OUTLINED_FUNCTION_18(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "fp_appContainerBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315650;
  v6 = "-[DOCAppProtectionManager bundleIDOfAppContainer:completion:]_block_invoke";
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v2, v4, "[PROTECTED APPS] %s 4 FPItem: provided node as fpfs_fpItem: %@ appContainerBundleIdentifier: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_3();
}

- (void)bundleIDOfAppContainer_Sync:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s starting to check for bundle ID of node: %@ ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)appProtectionCacheDidUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s appCache: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__DOCAppProtectionManager_appProtectionCacheDidUpdate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_2090A2000, v0, v1, "[PROTECTED APPS] %s posting notification: %@ because appCache did update", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke_cold_1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v0, (uint64_t)v0, "[PROTECTED APPS] %s posting notification: %@ with changed apps: %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

@end
