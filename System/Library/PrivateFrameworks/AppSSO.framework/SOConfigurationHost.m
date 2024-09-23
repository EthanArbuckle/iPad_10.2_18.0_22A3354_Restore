@implementation SOConfigurationHost

- (id)configurationForClientWithError:(id *)a3
{
  NSObject *v5;
  SOConfigurationHost *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  SOConfigurationHost *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOConfigurationHost();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SOConfigurationHost configurationForClientWithError:]";
    v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6 = self;
  objc_sync_enter(v6);
  -[SOConfigurationHost _checkNewVersion](v6, "_checkNewVersion");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SOConfiguration profiles](v6->_configuration, "profiles", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "copyProfileForClient");
        objc_msgSend(v7, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if (a3)
    *a3 = 0;
  v13 = (void *)objc_msgSend(objc_alloc((Class)getSOConfigurationClass()), "initWithProfiles:", v7);

  objc_sync_exit(v6);
  return v13;
}

- (void)_checkNewVersion
{
  if (-[SOConfigurationVersion checkVersion](self->_configurationVersion, "checkVersion") == 1)
    -[SOConfigurationHost _reloadConfigWithReason:](self, "_reloadConfigWithReason:", 2);
}

+ (id)defaultManager
{
  void *v2;
  NSObject *v3;

  if (defaultManager_onceToken_0 != -1)
    dispatch_once(&defaultManager_onceToken_0, &__block_literal_global_11);
  v2 = (void *)defaultManager_manager_0;
  if (!defaultManager_manager_0)
  {
    SO_LOG_SOConfigurationHost();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[SOConfigurationHost defaultManager].cold.1();

    v2 = (void *)defaultManager_manager_0;
  }
  return v2;
}

uint64_t __37__SOConfigurationHost_defaultManager__block_invoke()
{
  SOConfigurationHost *v0;
  void *v1;

  v0 = objc_alloc_init(SOConfigurationHost);
  v1 = (void *)defaultManager_manager_0;
  defaultManager_manager_0 = (uint64_t)v0;

  return objc_msgSend((id)defaultManager_manager_0, "_loadConfigForFirstTime");
}

- (SOConfigurationHost)init
{
  NSObject *v3;
  SOConfigurationHost *v4;
  void *v5;
  objc_class *v6;
  uint64_t v7;
  SOConfigurationVersion *configurationVersion;
  NSMutableDictionary *v9;
  NSMutableDictionary *associatedDomainCache;
  objc_super v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE buf[24];
  void *v18;
  uint64_t *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOConfigurationHost();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SOConfigurationHost init]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v12.receiver = self;
  v12.super_class = (Class)SOConfigurationHost;
  v4 = -[SOConfigurationHost init](&v12, sel_init);
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v5 = (void *)getSOConfigurationVersionClass_softClass;
    v16 = getSOConfigurationVersionClass_softClass;
    if (!getSOConfigurationVersionClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSOConfigurationVersionClass_block_invoke;
      v18 = &unk_24C80C0B8;
      v19 = &v13;
      __getSOConfigurationVersionClass_block_invoke((uint64_t)buf);
      v5 = (void *)v14[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v13, 8);
    v7 = objc_msgSend([v6 alloc], "initWithMode:", 0);
    configurationVersion = v4->_configurationVersion;
    v4->_configurationVersion = (SOConfigurationVersion *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    associatedDomainCache = v4->_associatedDomainCache;
    v4->_associatedDomainCache = v9;

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SOConfigurationHost;
  -[SOConfigurationHost dealloc](&v4, sel_dealloc);
}

- (BOOL)saveConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  SOConfigurationHost *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  SOConfigurationHost *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  SO_LOG_SOConfigurationHost();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "maskRegistrationTokenInProfileList:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315651;
    v21 = "-[SOConfigurationHost saveConfiguration:error:]";
    v22 = 2113;
    v23 = v8;
    v24 = 2112;
    v25 = self;
    _os_log_impl(&dword_20DABC000, v7, OS_LOG_TYPE_DEFAULT, "%s saving new configuration: %{private}@ on %@", buf, 0x20u);

  }
  v9 = self;
  objc_sync_enter(v9);
  objc_msgSend((id)objc_opt_class(), "_loadProfilesFromDict:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[SOConfigurationHost _saveConfigToFile:error:](v9, "_saveConfigToFile:error:", v6, a4);
    if (v11)
      -[SOConfigurationVersion increaseVersionWithMessage:](v9->_configurationVersion, "increaseVersionWithMessage:", CFSTR("NewConfiguration"));
    if (!getuid())
    {
      -[SOConfigurationHost _defaultCacheFile](v9, "_defaultCacheFile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByDeletingLastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0;
      v14 = -[SOConfigurationHost _initCachePath:ifNeededWithError:](v9, "_initCachePath:ifNeededWithError:", v13, &v19);
      v15 = v19;
      if (!v14)
      {
        SO_LOG_SOConfigurationHost();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[SOConfigurationHost saveConfiguration:error:].cold.2();

      }
    }
  }
  else
  {
    SO_LOG_SOConfigurationHost();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SOConfigurationHost saveConfiguration:error:].cold.1();

    if (a4)
    {
      objc_msgSend(getSOErrorHelperClass_3(), "parameterErrorWithMessage:", CFSTR("invalid configuration format"));
      LOBYTE(v11) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  objc_sync_exit(v9);
  return v11;
}

- (BOOL)saveConfigurationData:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  SOConfigurationHost *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  SOConfiguration *configuration;
  BOOL v14;
  NSObject *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  SOConfigurationHost *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  SO_LOG_SOConfigurationHost();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "maskRegistrationTokenInProfileList:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315651;
    v19 = "-[SOConfigurationHost saveConfigurationData:error:]";
    v20 = 2113;
    v21 = v8;
    v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_20DABC000, v7, OS_LOG_TYPE_DEFAULT, "%s saving new configuration=%{private}@ on %@", (uint8_t *)&v18, 0x20u);

  }
  v9 = self;
  objc_sync_enter(v9);
  objc_msgSend((id)objc_opt_class(), "_loadProfilesFromDict:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    SO_LOG_SOConfigurationHost();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "maskRegistrationTokenInProfileList:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOConfigurationHost saveConfigurationData:error:].cold.1(v16, (uint64_t)&v18);
    }

    if (a4)
    {
      objc_msgSend(getSOErrorHelperClass_3(), "parameterErrorWithMessage:", CFSTR("invalid configuration format"));
      v10 = 0;
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v10 = 0;
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  if (!-[SOConfigurationHost _saveConfigToFile:error:](v9, "_saveConfigToFile:error:", v6, a4))
    goto LABEL_11;
  -[SOConfigurationHost _checkAssociatedDomainForProfiles:](v9, "_checkAssociatedDomainForProfiles:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(objc_alloc((Class)getSOConfigurationClass()), "initWithProfiles:", v11);
  configuration = v9->_configuration;
  v9->_configuration = (SOConfiguration *)v12;

  -[SOConfigurationVersion increaseVersionWithMessage:](v9->_configurationVersion, "increaseVersionWithMessage:", CFSTR("NewConfiguration"));
  v14 = 1;
  v10 = (void *)v11;
LABEL_12:

  objc_sync_exit(v9);
  return v14;
}

- (id)profileForURL:(id)a3 responseCode:(int64_t)a4
{
  SOConfigurationHost *v6;
  NSObject *v7;
  SOConfigurationHost *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  SOConfigurationHost *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (SOConfigurationHost *)a3;
  SO_LOG_SOConfigurationHost();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = (uint64_t)"-[SOConfigurationHost profileForURL:responseCode:]";
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_20DABC000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v15, 0x16u);
  }

  v8 = self;
  objc_sync_enter(v8);
  -[SOConfigurationHost _checkNewVersion](v8, "_checkNewVersion");
  -[SOConfiguration profileForURL:responseCode:](v8->_configuration, "profileForURL:responseCode:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (getSOFullProfileClass(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    SO_LOG_SOConfigurationHost();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SOConfigurationHost profileForURL:responseCode:].cold.1();

    v11 = 0;
  }
  else
  {
    SO_LOG_SOConfigurationHost();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[SOConfiguration profiles](v8->_configuration, "profiles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 141558787;
      v16 = 1752392040;
      v17 = 2117;
      v18 = v6;
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = v14;
      _os_log_debug_impl(&dword_20DABC000, v10, OS_LOG_TYPE_DEBUG, "profile for URL %{sensitive, mask.hash}@ => %{public}@ in %{public}@", (uint8_t *)&v15, 0x2Au);

    }
    v11 = v9;
  }

  objc_sync_exit(v8);
  return v11;
}

- (id)removedProfileForExtensionBundleIdentifier:(id)a3
{
  char *v4;
  NSObject *v5;
  SOConfigurationHost *v6;
  NSMutableArray *v7;
  SOConfigurationHost *v8;
  uint64_t v9;
  SOConfigurationHost *i;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSMutableArray *removedProfiles;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  SOConfigurationHost *v24;
  __int16 v25;
  NSMutableArray *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  SO_LOG_SOConfigurationHost();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SOConfigurationHost removedProfileForExtensionBundleIdentifier:]";
    v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6 = self;
  objc_sync_enter(v6);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6->_removedProfiles;
  v8 = (SOConfigurationHost *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (SOConfigurationHost *)((char *)i + 1))
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "extensionBundleIdentifier", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
        {
          v8 = v11;
          goto LABEL_13;
        }
      }
      v8 = (SOConfigurationHost *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  SO_LOG_SOConfigurationHost();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    removedProfiles = v6->_removedProfiles;
    *(_DWORD *)buf = 138543874;
    v22 = v4;
    v23 = 2114;
    v24 = v8;
    v25 = 2114;
    v26 = removedProfiles;
    _os_log_debug_impl(&dword_20DABC000, v14, OS_LOG_TYPE_DEBUG, "removed profile for extension bundle ID %{public}@ => %{public}@ in %{public}@", buf, 0x20u);
  }

  if (v8)
    -[NSMutableArray removeObject:](v6->_removedProfiles, "removeObject:", v8);
  objc_sync_exit(v6);

  return v8;
}

- (id)profilesWithExtensionBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  SOConfigurationHost *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  SOConfigurationHost *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOConfigurationHost();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[SOConfigurationHost profilesWithExtensionBundleIdentifier:]";
    v24 = 2114;
    v25 = v4;
    v26 = 2112;
    v27 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s extensionBundleIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SOConfiguration profiles](v6->_configuration, "profiles", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "extensionBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if (v14)
        {
          v15 = (void *)objc_msgSend(v12, "copyProfile");
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_sync_exit(v6);
  return v7;
}

- (id)validatedProfileForPlatformSSO
{
  NSObject *v3;
  SOConfigurationHost *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  SOConfigurationHost *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOConfigurationHost();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SOConfigurationHost validatedProfileForPlatformSSO]";
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SOConfiguration profiles](v4->_configuration, "profiles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (-[SOConfigurationHost isPlatformSSOProfile:](v4, "isPlatformSSOProfile:", v9))
        {
          v6 = (void *)objc_msgSend(v9, "copyProfile");
          objc_msgSend(v9, "pssoRegistrationToken");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setPssoRegistrationToken:", v10);

          goto LABEL_13;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  objc_sync_exit(v4);
  return v6;
}

- (id)findPlatformSSOProfile:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  SOConfigurationHost *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOConfigurationHost();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[SOConfigurationHost findPlatformSSOProfile:]";
    v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[SOConfigurationHost isPlatformSSOProfile:](self, "isPlatformSSOProfile:", v11, (_QWORD)v14))
        {
          v12 = v11;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (id)findProfileForExtension:(id)a3 profiles:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  SOConfigurationHost *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOConfigurationHost();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SOConfigurationHost findProfileForExtension:profiles:]";
    v24 = 2112;
    v25 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v7;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "extensionBundleIdentifier", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v6);

        if ((v15 & 1) != 0)
        {
          v10 = v13;
          goto LABEL_13;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  return v10;
}

- (BOOL)isPlatformSSOProfile:(id)a3
{
  id v3;
  id SOFullProfileClass;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v3 = a3;
  SOFullProfileClass = getSOFullProfileClass();
  objc_msgSend(v3, "platformSSO");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(SOFullProfileClass, "authMethodWithString:", v6);

  v8 = v7 != 1000 && objc_msgSend(v3, "type") == 1;
  return v8;
}

- (id)_removeNotSupportedUserProfiles:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    *(_QWORD *)&v8 = 138543362;
    v19 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (-[SOConfigurationHost isPlatformSSOProfile:](self, "isPlatformSSOProfile:", v13, v19, (_QWORD)v20))
        {
          if ((v10 & 1) != 0)
          {
            SO_LOG_SOConfigurationHost();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              v25 = v13;
              _os_log_error_impl(&dword_20DABC000, v14, OS_LOG_TYPE_ERROR, "More than one Platform SSO profile is not supported (rejected): %{public}@", buf, 0xCu);
            }

            objc_msgSend(v5, "removeObject:", v13);
          }
          else
          {
            objc_msgSend(v13, "platformSSO");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UseSharedDeviceKeys"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v16, "BOOLValue"))
            {
              SO_LOG_SOConfigurationHost();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v19;
                v25 = v13;
                _os_log_error_impl(&dword_20DABC000, v17, OS_LOG_TYPE_ERROR, "Platform SSO shared device keys require a system profile (rejected): %{public}@", buf, 0xCu);
              }

              objc_msgSend(v5, "removeObject:", v13);
            }

          }
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v9);
  }

  return v5;
}

- (BOOL)hasAnyMDMProfileForExtension:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  SOConfigurationHost *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOConfigurationHost();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[SOConfigurationHost hasAnyMDMProfileForExtension:]";
    v29 = 2112;
    v30 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[SOConfigurationHost _defaultConfigurationFile](self, "_defaultConfigurationFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOConfigurationHost();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SOConfigurationHost hasAnyMDMProfileForExtension:].cold.3();

  v8 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_loadProfilesFromURL:logFileError:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v10;
  v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "extensionBundleIdentifier", (_QWORD)v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v4);

        if (v17)
        {
          SO_LOG_SOConfigurationHost();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            -[SOConfigurationHost hasAnyMDMProfileForExtension:].cold.2();

          v19 = 1;
          v18 = v11;
          goto LABEL_19;
        }
      }
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }

  SO_LOG_SOConfigurationHost();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[SOConfigurationHost hasAnyMDMProfileForExtension:].cold.1();
  v19 = 0;
LABEL_19:

  return v19;
}

- (id)systemMDMProfileForExtension:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  SOConfigurationHost *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOConfigurationHost();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[SOConfigurationHost systemMDMProfileForExtension:]";
    v30 = 2112;
    v31 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[SOConfigurationHost _defaultConfigurationFile](self, "_defaultConfigurationFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOConfigurationHost();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SOConfigurationHost hasAnyMDMProfileForExtension:].cold.3();

  v8 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_loadProfilesFromURL:logFileError:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v10;
  v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v16, "extensionBundleIdentifier", (_QWORD)v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v4);

        if (v18)
        {
          SO_LOG_SOConfigurationHost();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[SOConfigurationHost hasAnyMDMProfileForExtension:].cold.2();

          v20 = v16;
          v19 = v11;
          goto LABEL_19;
        }
      }
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v13)
        continue;
      break;
    }
  }

  SO_LOG_SOConfigurationHost();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[SOConfigurationHost hasAnyMDMProfileForExtension:].cold.1();
  v20 = 0;
LABEL_19:

  return v20;
}

- (id)realms
{
  NSObject *v3;
  SOConfigurationHost *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  SOConfigurationHost *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOConfigurationHost();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SOConfigurationHost realms]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[SOConfiguration realms](v4->_configuration, "realms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v5;
}

- (int64_t)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  SOConfigurationHost *v11;
  SOConfiguration *configuration;
  int64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  SOConfigurationHost *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  SO_LOG_SOConfigurationHost();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316163;
    v32 = (uint64_t)"-[SOConfigurationHost willHandleURL:responseCode:callerBundleIdentifier:]";
    v33 = 2160;
    v34 = 1752392040;
    v35 = 2117;
    v36 = v8;
    v37 = 2114;
    v38 = v9;
    v39 = 2112;
    v40 = self;
    _os_log_debug_impl(&dword_20DABC000, v10, OS_LOG_TYPE_DEBUG, "%s URL: %{sensitive, mask.hash}@, callerBundleIdentifier: %{public}@ on %@", buf, 0x34u);
  }

  v11 = self;
  objc_sync_enter(v11);
  configuration = v11->_configuration;
  v30 = 0;
  v13 = -[SOConfiguration willHandleURL:responseCode:callerBundleIdentifier:profile:](configuration, "willHandleURL:responseCode:callerBundleIdentifier:profile:", v8, a4, v9, &v30);
  v14 = v30;
  v15 = v14;
  if (!v13)
  {
    if (objc_msgSend(v14, "type") == 1)
    {
      objc_msgSend(v15, "extensionBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[SOExtensionManager isAppleConnectExtensionBundleIdentifier:](SOExtensionManager, "isAppleConnectExtensionBundleIdentifier:", v16))
      {
        v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(v8, "scheme");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lowercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("ssoid"));

      if ((v19 & 1) == 0)
      {
        +[SOExtensionManager sharedInstance](SOExtensionManager, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v16);
        +[SOExtensionManager sharedInstance](SOExtensionManager, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "extensionBundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "loadedExtensionWithBundleIdentifer:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v22, "hasAssociatedDomainsApproved") & 1) != 0)
        {
          v13 = 0;
        }
        else
        {
          SO_LOG_SOConfigurationHost();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            -[SOConfigurationHost willHandleURL:responseCode:callerBundleIdentifier:].cold.2();

          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[SOConfigurationHost _checkAssociatedDomainForProfiles:](v11, "_checkAssociatedDomainForProfiles:", v24);

          if (objc_msgSend(v22, "hasAssociatedDomainsApproved"))
          {
            SO_LOG_SOConfigurationHost();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              -[SOConfigurationHost willHandleURL:responseCode:callerBundleIdentifier:].cold.1();

            -[SOConfigurationHost _reloadConfigWithReason:](v11, "_reloadConfigWithReason:", 1);
            v13 = -[SOConfiguration willHandleURL:responseCode:callerBundleIdentifier:profile:](v11->_configuration, "willHandleURL:responseCode:callerBundleIdentifier:profile:", v8, a4, v9, 0);
          }
          else
          {
            v13 = +[SOPreferences isAssociatedDomainValidated](SOPreferences, "isAssociatedDomainValidated");
          }
        }

        objc_sync_exit(v16);
        goto LABEL_19;
      }
    }
    v13 = 0;
  }
LABEL_20:
  SO_LOG_SOConfigurationHost();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(getSOConfigurationClass(), "stringWithHandleResult:", v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141558787;
    v32 = 1752392040;
    v33 = 2117;
    v34 = (uint64_t)v8;
    v35 = 2114;
    v36 = v9;
    v37 = 2114;
    v38 = v28;
    _os_log_impl(&dword_20DABC000, v27, OS_LOG_TYPE_INFO, "willHandleURL(host): %{sensitive, mask.hash}@ callerBundleIdentifier: %{public}@ result: %{public}@", buf, 0x2Au);

  }
  objc_sync_exit(v11);

  return v13;
}

- (int64_t)configVersion
{
  return -[SOConfigurationVersion version](self->_configurationVersion, "version");
}

+ (id)_loadProfilesFromDict:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  SO_LOG_SOConfigurationHost();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "+[SOConfigurationHost _loadProfilesFromDict:]";
    v29 = 2112;
    v30 = a1;
    _os_log_impl(&dword_20DABC000, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  obj = a1;
  objc_sync_enter(obj);
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Profiles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    SO_LOG_SOConfigurationHost();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SOConfigurationHost _loadProfilesFromDict:].cold.4();
LABEL_25:
    v16 = 0;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v8)
    goto LABEL_14;
  v9 = 0;
  v10 = *(_QWORD *)v23;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        SO_LOG_SOConfigurationHost();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(obj, "maskRegistrationTokenInConfigurationData:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[SOConfigurationHost _loadProfilesFromDict:].cold.3(v17, (uint64_t)buf);
        }
        goto LABEL_24;
      }
      v13 = objc_msgSend(objc_alloc((Class)getSOFullProfileClass()), "initWithProfileData:", v12);
      v14 = v13;
      if (!v13)
      {
        SO_LOG_SOConfigurationHost();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          +[SOConfigurationHost _loadProfilesFromDict:].cold.1();
        goto LABEL_23;
      }
      v15 = -[NSObject pssoAuthenticationMethod](v13, "pssoAuthenticationMethod") != 1000;
      if ((v15 & v9) == 1)
      {
        SO_LOG_SOConfigurationHost();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          +[SOConfigurationHost _loadProfilesFromDict:].cold.2();
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      -[NSObject addObject:](v6, "addObject:", v14);

      v9 |= v15;
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
      continue;
    break;
  }
LABEL_14:

  v6 = v6;
  v16 = v6;
LABEL_26:

  objc_sync_exit(obj);
  return v16;
}

+ (id)_loadProfilesFromURL:(id)a3 logFileError:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;

  v4 = a4;
  v6 = a3;
  v7 = a1;
  objc_sync_enter(v7);
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v6, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v9)
  {
    if (v4)
    {
      SO_LOG_SOConfigurationHost();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[SOConfigurationHost _loadProfilesFromURL:logFileError:].cold.1();

    }
    v11 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_loadProfilesFromDict:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_sync_exit(v7);
  return v11;
}

- (void)_loadCacheFromDisk
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_20DABC000, v0, v1, "failed to load cache at %{private}@, error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_loadConfigForFirstTime
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  SOConfigurationHost *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOConfigurationHost();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SOConfigurationHost _loadConfigForFirstTime]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v5, 0x16u);
  }

  if (-[SOConfigurationHost _isConfigFileAvailable](self, "_isConfigFileAvailable"))
    -[SOConfigurationHost _reloadConfigWithReason:](self, "_reloadConfigWithReason:", 0);
  else
    -[SOConfigurationHost _startKeyBagObserverForReloadingConfiguration](self, "_startKeyBagObserverForReloadingConfiguration");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__extensionsLoaded_, CFSTR("com.apple.AppSSO.SOExtensionManager.ExtensionsChanged"), 0);

}

- (void)_startKeyBagObserverForReloadingConfiguration
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20DABC000, a2, OS_LOG_TYPE_ERROR, "failed to start keybag observer with error=%u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_8();
}

uint64_t __68__SOConfigurationHost__startKeyBagObserverForReloadingConfiguration__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint8_t v6[16];

  SO_LOG_SOConfigurationHost();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20DABC000, v4, OS_LOG_TYPE_INFO, "the device key bag is unlocked, reloading config...", v6, 2u);
  }

  notify_cancel(a2);
  return objc_msgSend(*(id *)(a1 + 32), "_reloadConfigWithReason:", 0);
}

- (void)_reloadConfigWithReason:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  char *v24;
  void *v25;
  uint64_t v26;
  id *p_removedProfiles;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  SOAuthorization *v35;
  void *v36;
  void *v37;
  SOAuthorizationParameters *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  SOConfiguration *configuration;
  void *v43;
  void *v44;
  void *v45;
  SOConfigurationHost *v47;
  id v48;
  id obj;
  id v50;
  id v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  const __CFString *v65;
  void *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  SOConfigurationHost *v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOConfigurationHost();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SOConfigurationHost _stringWithReason:](self, "_stringWithReason:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v71 = "-[SOConfigurationHost _reloadConfigWithReason:]";
    v72 = 2112;
    v73 = v5;
    v74 = 2112;
    v75 = self;
    _os_log_impl(&dword_20DABC000, v4, OS_LOG_TYPE_DEFAULT, "%s reason = %@ on %@", buf, 0x20u);

  }
  v47 = self;
  objc_sync_enter(v47);
  if (a3 != 1)
    -[SOConfigurationHost _loadCacheFromDisk](v47, "_loadCacheFromDisk");
  -[SOConfigurationHost _defaultConfigurationFile](v47, "_defaultConfigurationFile");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  SO_LOG_SOConfigurationHost();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SOConfigurationHost hasAnyMDMProfileForExtension:].cold.3();

  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v45);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_loadProfilesFromURL:logFileError:", v8, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[SOConfigurationHost _mergeProfile:userProfiles:](v47, "_mergeProfile:userProfiles:", v44, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOConfigurationHost _checkExtensionsExistenceForProfiles:](v47, "_checkExtensionsExistenceForProfiles:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SOConfigurationHost _checkAssociatedDomainForProfiles:](v47, "_checkAssociatedDomainForProfiles:", v10);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    -[SOConfiguration profiles](v47->_configuration, "profiles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (!v12)
    {
      v48 = 0;
      goto LABEL_33;
    }
    v48 = 0;
    v50 = *(id *)v62;
    obj = v11;
    while (1)
    {
      v13 = 0;
      do
      {
        if (*(id *)v62 != v50)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v13);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v15 = v52;
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v58;
LABEL_15:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v58 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v18);
            objc_msgSend(v14, "extensionBundleIdentifier", v44);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "extensionBundleIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v19) = objc_msgSend(v20, "isEqualToString:", v21);

            if ((v19 & 1) != 0)
              goto LABEL_24;
            if (v16 == ++v18)
            {
              v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
              if (v16)
                goto LABEL_15;
              break;
            }
          }
        }

        objc_msgSend(v14, "extensionBundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = +[SOExtensionManager isAppleConnectExtensionBundleIdentifier:](SOExtensionManager, "isAppleConnectExtensionBundleIdentifier:", v22);

        if (v23)
        {
          SO_LOG_SOConfigurationHost();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v14, "extensionBundleIdentifier");
            v24 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v71 = v24;
            _os_log_impl(&dword_20DABC000, v15, OS_LOG_TYPE_INFO, "Removed configuration ignored for extension: %{public}@", buf, 0xCu);

          }
LABEL_24:

          goto LABEL_25;
        }
        v25 = v48;
        if (!v48)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v48 = v25;
        objc_msgSend(v25, "addObject:", v14, v44);
LABEL_25:
        ++v13;
      }
      while (v13 != v12);
      v11 = obj;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      v12 = v26;
      if (!v26)
      {
LABEL_33:

        p_removedProfiles = (id *)&v47->_removedProfiles;
        objc_storeStrong((id *)&v47->_removedProfiles, v48);
        if (-[NSMutableArray count](v47->_removedProfiles, "count"))
        {
          SO_LOG_SOConfigurationHost();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = (const char *)*p_removedProfiles;
            *(_DWORD *)buf = 138477827;
            v71 = v29;
            _os_log_impl(&dword_20DABC000, v28, OS_LOG_TYPE_DEFAULT, "removed profiles = %{private}@", buf, 0xCu);
          }

          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          v51 = *p_removedProfiles;
          v30 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
          if (v30)
          {
            v31 = *(_QWORD *)v54;
            v32 = MEMORY[0x24BDBD1B8];
            do
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v54 != v31)
                  objc_enumerationMutation(v51);
                v34 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                v35 = objc_alloc_init(SOAuthorization);
                v65 = CFSTR("removedProfileExtensionBundleIdentifier");
                objc_msgSend(v34, "extensionBundleIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = v36;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[SOAuthorization setAuthorizationOptions:](v35, "setAuthorizationOptions:", v37);

                v38 = objc_alloc_init(SOAuthorizationParameters);
                -[SOAuthorizationParameters setOperation:](v38, "setOperation:", CFSTR("configuration_removed"));
                objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24C80D4A8);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                -[SOAuthorizationParameters setUrl:](v38, "setUrl:", v39);

                -[SOAuthorizationParameters setHttpHeaders:](v38, "setHttpHeaders:", v32);
                v40 = (void *)objc_opt_new();
                -[SOAuthorizationParameters setHttpBody:](v38, "setHttpBody:", v40);

                -[SOAuthorizationParameters setUseInternalExtensions:](v38, "setUseInternalExtensions:", 0);
                -[SOAuthorization beginAuthorizationWithParameters:](v35, "beginAuthorizationWithParameters:", v38);

              }
              v30 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
            }
            while (v30);
          }

        }
        break;
      }
    }
  }
  v41 = objc_msgSend(objc_alloc((Class)getSOConfigurationClass()), "initWithProfiles:", v52);
  configuration = v47->_configuration;
  v47->_configuration = (SOConfiguration *)v41;

  -[SOConfigurationHost _configurationLoadedWithReason:](v47, "_configurationLoadedWithReason:", a3);
  -[SOConfigurationHost _stringWithReason:](v47, "_stringWithReason:", a3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOAnalytics analyticsForMDMProfiles:reason:](SOAnalytics, "analyticsForMDMProfiles:reason:", v52, v43);

  objc_sync_exit(v47);
}

- (id)_mergeProfile:(id)a3 userProfiles:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  SOConfigurationHost *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOConfigurationHost();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315906;
    v22 = "-[SOConfigurationHost _mergeProfile:userProfiles:]";
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = v10;
    v27 = 2112;
    v28 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s systemProfiles = %{public}@, userProfiles = %{public}@ on %@", (uint8_t *)&v21, 0x2Au);

  }
  -[SOConfigurationHost _removeNotSupportedUserProfiles:](self, "_removeNotSupportedUserProfiles:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {
    v19 = v6;
LABEL_14:
    v18 = v19;
    goto LABEL_19;
  }
  if (!objc_msgSend(v6, "count") && objc_msgSend(v11, "count"))
  {
    v19 = v11;
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "count") && objc_msgSend(v11, "count"))
  {
    -[SOConfigurationHost findPlatformSSOProfile:](self, "findPlatformSSOProfile:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOConfigurationHost findPlatformSSOProfile:](self, "findPlatformSSOProfile:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v12, "extensionBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOConfigurationHost findProfileForExtension:profiles:](self, "findProfileForExtension:profiles:", v14, v11);
      v15 = objc_claimAutoreleasedReturnValue();

      if (v13 | v15)
      {
        objc_msgSend((id)v15, "extensionData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setExtensionData:", v16);

        objc_msgSend((id)v15, "pssoRegistrationToken");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPssoRegistrationToken:", v17);

        v18 = (id)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v18, "removeObject:", v15);
        objc_msgSend(v18, "addObject:", v12);
      }
      else
      {
        objc_msgSend(v11, "arrayByAddingObject:", v12);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v18 = v11;
    }

  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (void)_configurationLoadedWithReason:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  SOConfiguration *configuration;
  void *v8;
  void *v9;
  void **v10;
  const __CFString **v11;
  SOConfigurationVersion *configurationVersion;
  SOConfigurationHost *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  SOConfiguration *v27;
  __int16 v28;
  SOConfigurationHost *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOConfigurationHost();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SOConfigurationHost _stringWithReason:](self, "_stringWithReason:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    configuration = self->_configuration;
    *(_DWORD *)buf = 136315906;
    v23 = "-[SOConfigurationHost _configurationLoadedWithReason:]";
    v24 = 2114;
    v25 = v6;
    v26 = 2114;
    v27 = configuration;
    v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@, configuration = %{public}@ on %@", buf, 0x2Au);

  }
  if (!-[SOConfiguration empty](self->_configuration, "empty"))
  {
    if (a3 == 1)
    {
      configurationVersion = self->_configurationVersion;
      v13 = self;
      v14 = 1;
    }
    else
    {
      if (a3)
        goto LABEL_13;
      -[SOConfigurationVersion checkVersion](self->_configurationVersion, "checkVersion");
      if (-[SOConfigurationVersion version](self->_configurationVersion, "version"))
      {
        if (-[SOConfigurationVersion version](self->_configurationVersion, "version") != -1)
          goto LABEL_13;
      }
      configurationVersion = self->_configurationVersion;
      v13 = self;
      v14 = 0;
    }
    -[SOConfigurationHost _stringWithReason:](v13, "_stringWithReason:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOConfigurationVersion increaseVersionWithMessage:](configurationVersion, "increaseVersionWithMessage:", v15);

LABEL_13:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3, CFSTR("reason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v19;
    v11 = (const __CFString **)&v18;
    goto LABEL_14;
  }
  -[SOConfigurationVersion setAppSSOUnavailable](self->_configurationVersion, "setAppSSOUnavailable");
  if (!a3)
    return;
  v20 = CFSTR("reason");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v8;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = &v21;
  v11 = &v20;
LABEL_14:
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppSSO.SOConfigurationHost.ConfigurationChanged"), self, v16);

}

- (id)_checkExtensionsExistenceForProfiles:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  SOConfigurationHost *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  SOConfigurationHost *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOConfigurationHost();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[SOConfigurationHost _checkExtensionsExistenceForProfiles:]";
    v25 = 2112;
    v26 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        +[SOExtensionManager sharedInstance](SOExtensionManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "extensionBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isLoadedExtensionWithBundleIdentifer:", v13);

        if (v14)
        {
          objc_msgSend(v6, "addObject:", v11);
        }
        else
        {
          SO_LOG_SOConfigurationHost();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v24 = (const char *)v11;
            _os_log_error_impl(&dword_20DABC000, v15, OS_LOG_TYPE_ERROR, "no extension available for profile (ignored): %{public}@", buf, 0xCu);
          }

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_sync_exit(obj);
  return v6;
}

- (id)_checkAssociatedDomainForProfiles:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableDictionary *associatedDomainCache;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  NSMutableDictionary *v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  SOConfigurationHost *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  BOOL v46;
  NSMutableDictionary *v47;
  void *v48;
  void *v49;
  char v50;
  int v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  BOOL v58;
  NSObject *v59;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id obj;
  uint64_t j;
  SOConfigurationHost *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  SOConfigurationHost *v87;
  __int16 v88;
  void *v89;
  uint8_t v90[128];
  uint8_t v91[4];
  uint64_t v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOConfigurationHost();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v85 = (uint64_t)"-[SOConfigurationHost _checkAssociatedDomainForProfiles:]";
    v86 = 2112;
    v87 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v69 = self;
  objc_sync_enter(v69);
  +[SOExtensionManager sharedInstance](SOExtensionManager, "sharedInstance");
  v62 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v62);
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v81;
    v8 = (void *)MEMORY[0x24BDBD1B8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v81 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 1)
        {
          +[SOExtensionManager sharedInstance](SOExtensionManager, "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "extensionBundleIdentifier");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "loadedExtensionWithBundleIdentifer:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "extensionBundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = +[SOExtensionManager isAppleConnectExtensionBundleIdentifier:](SOExtensionManager, "isAppleConnectExtensionBundleIdentifier:", v14);

          if ((v12 & 1) == 0)
          {
            associatedDomainCache = v69->_associatedDomainCache;
            objc_msgSend(v10, "extensionBundleIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](associatedDomainCache, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)objc_msgSend(v17, "mutableCopy");
            v19 = v18;
            if (v18)
              v20 = v18;
            else
              v20 = (id)objc_msgSend(v8, "mutableCopy");
            v21 = v20;

            objc_msgSend(v13, "checkAssociatedDomainsWithCache:", v21);
            v22 = v69->_associatedDomainCache;
            objc_msgSend(v10, "extensionBundleIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v21, v23);

          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
    }
    while (v6);
  }

  v24 = v69->_associatedDomainCache;
  v79 = 0;
  v25 = -[SOConfigurationHost _saveCacheToFile:error:](v69, "_saveCacheToFile:error:", v24, &v79);
  v61 = v79;
  if (!v25)
  {
    SO_LOG_SOConfigurationHost();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[SOConfigurationHost _checkAssociatedDomainForProfiles:].cold.2();

  }
  if (+[SOPreferences isAssociatedDomainValidated](SOPreferences, "isAssociatedDomainValidated"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v64 = (id)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v63 = obj;
    v66 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
    if (v66)
    {
      v65 = *(_QWORD *)v76;
      do
      {
        for (j = 0; j != v66; ++j)
        {
          if (*(_QWORD *)v76 != v65)
            objc_enumerationMutation(v63);
          v27 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
          if (objc_msgSend(v27, "type") != 1)
          {
            objc_msgSend(v64, "addObject:", v27);
            continue;
          }
          +[SOExtensionManager sharedInstance](SOExtensionManager, "sharedInstance");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "extensionBundleIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "loadedExtensionWithBundleIdentifer:", v29);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v70)
          {
            SO_LOG_SOConfigurationHost();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v85 = (uint64_t)v27;
              _os_log_error_impl(&dword_20DABC000, v34, OS_LOG_TYPE_ERROR, "Associated domain: validation failed to find extension for profile: %{public}@, ignoring profile", buf, 0xCu);
            }

            goto LABEL_66;
          }
          objc_msgSend(v27, "extensionBundleIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = +[SOExtensionManager isAppleConnectExtensionBundleIdentifier:](SOExtensionManager, "isAppleConnectExtensionBundleIdentifier:", v30);

          if (!v31)
          {
            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            objc_msgSend(v27, "URLPrefix");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v90, 16);
            if (!v36)
              goto LABEL_64;
            v37 = *(_QWORD *)v72;
            while (1)
            {
              v38 = 0;
              do
              {
                if (*(_QWORD *)v72 != v37)
                  objc_enumerationMutation(v35);
                v39 = *(SOConfigurationHost **)(*((_QWORD *)&v71 + 1) + 8 * v38);
                objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "scheme");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v41, "isEqualToString:", CFSTR("http")))
                {

                }
                else
                {
                  objc_msgSend(v40, "scheme");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("https"));

                  if ((v43 & 1) == 0)
                  {
                    SO_LOG_SOConfigurationHost();
                    v53 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                      goto LABEL_55;
                    *(_DWORD *)buf = 141558531;
                    v85 = 1752392040;
                    v86 = 2117;
                    v87 = v39;
                    v88 = 2114;
                    v89 = v70;
                    v54 = v53;
                    v55 = "Associated domain: validation removed URL: %{sensitive, mask.hash}@ because it is not a http s"
                          "cheme for extension %{public}@";
                    goto LABEL_62;
                  }
                }
                objc_msgSend(v40, "host");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v44, "rangeOfString:", CFSTR("*")) != 0x7FFFFFFFFFFFFFFFLL)
                {

LABEL_52:
                  SO_LOG_SOConfigurationHost();
                  v53 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                    goto LABEL_55;
                  *(_DWORD *)buf = 141558531;
                  v85 = 1752392040;
                  v86 = 2117;
                  v87 = v39;
                  v88 = 2114;
                  v89 = v70;
                  v54 = v53;
                  v55 = "Associated domain: validation removed URL: %{sensitive, mask.hash}@ because it contains a wildca"
                        "rd in the host name for extension %{public}@";
LABEL_62:
                  _os_log_error_impl(&dword_20DABC000, v54, OS_LOG_TYPE_ERROR, v55, buf, 0x20u);
                  goto LABEL_55;
                }
                objc_msgSend(v40, "host");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v45, "rangeOfString:", CFSTR("?")) == 0x7FFFFFFFFFFFFFFFLL;

                if (!v46)
                  goto LABEL_52;
                v47 = v69->_associatedDomainCache;
                objc_msgSend(v27, "extensionBundleIdentifier");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKeyedSubscript:](v47, "objectForKeyedSubscript:", v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = objc_msgSend(v70, "hasURLApprovedAssociatedDomain:cache:", v40, v49);

                if ((v50 & 1) != 0)
                  goto LABEL_56;
                v51 = objc_msgSend(v70, "hasAssociatedDomainsApproved");
                SO_LOG_SOConfigurationHost();
                v52 = objc_claimAutoreleasedReturnValue();
                v53 = v52;
                if (v51)
                {
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 141558531;
                    v85 = 1752392040;
                    v86 = 2117;
                    v87 = v39;
                    v88 = 2114;
                    v89 = v70;
                    v54 = v53;
                    v55 = "Associated domain: validation removed URL: %{sensitive, mask.hash}@ because it has no approved"
                          " associated domains for extensions %{public}@";
                    goto LABEL_62;
                  }
LABEL_55:

                  objc_msgSend(v27, "removeURLPrefix:", v39);
                  goto LABEL_56;
                }
                if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 141558531;
                  v85 = 1752392040;
                  v86 = 2117;
                  v87 = v39;
                  v88 = 2114;
                  v89 = v70;
                  _os_log_impl(&dword_20DABC000, v53, OS_LOG_TYPE_INFO, "Associated domain: validation failed for URL: %{sensitive, mask.hash}@ because it has no approved associated domains for extensions %{public}@, it will be checked again when the extension is used", buf, 0x20u);
                }

LABEL_56:
                ++v38;
              }
              while (v36 != v38);
              v56 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v90, 16);
              v36 = v56;
              if (!v56)
              {
LABEL_64:

                objc_msgSend(v27, "URLPrefix");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend(v57, "count") == 0;

                if (!v58)
                  goto LABEL_65;
                goto LABEL_66;
              }
            }
          }
          SO_LOG_SOConfigurationHost();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v27, "extensionBundleIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[SOConfigurationHost _checkAssociatedDomainForProfiles:].cold.1(v33, v91, &v92, v32);
          }

LABEL_65:
          objc_msgSend(v64, "addObject:", v27);
LABEL_66:

        }
        v66 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
      }
      while (v66);
    }

  }
  else
  {
    SO_LOG_SOConfigurationHost();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DABC000, v59, OS_LOG_TYPE_INFO, "Associated domain: validation is ignored, using all URLs in AppSSO configuration", buf, 2u);
    }

    v64 = obj;
  }

  objc_sync_exit(v62);
  objc_sync_exit(v69);

  return v64;
}

- (BOOL)_initDataVaultIfNeededWithError:(id *)a3
{
  NSObject *v5;
  char *v6;
  SOConfigurationHost *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  char *v17;
  int v18;
  NSObject *v19;
  int *v20;
  char *v21;
  id SOErrorHelperClass_3;
  void *v23;
  int *v24;
  id v25;
  BOOL v26;
  char *v27;
  int v28;
  NSObject *v29;
  int *v30;
  char *v31;
  id v32;
  void *v33;
  int *v34;
  id v36;
  _QWORD v37[2];
  _QWORD v38[2];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  SOConfigurationHost *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOConfigurationHost();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "-[SOConfigurationHost _initDataVaultIfNeededWithError:]";
    v41 = 2112;
    v42 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[SOConfigurationHost _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v6, 0);

  if ((v9 & 1) == 0)
  {
    v10 = *MEMORY[0x24BDD0C78];
    v37[0] = *MEMORY[0x24BDD0CB0];
    v37[1] = v10;
    v38[0] = CFSTR("mobile");
    v38[1] = CFSTR("mobile");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, v11, &v36);
    v14 = v36;

    if (v14)
      v13 = 0;
    SO_LOG_SOConfigurationHost();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((v13 & 1) == 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SOConfigurationHost _initDataVaultIfNeededWithError:].cold.3();

      if (a3)
        *a3 = objc_retainAutorelease(v14);

      v26 = 0;
      goto LABEL_31;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v6;
      _os_log_impl(&dword_20DABC000, v16, OS_LOG_TYPE_DEFAULT, "created configuration directory at %{public}@", buf, 0xCu);
    }

  }
  v17 = objc_retainAutorelease(v6);
  objc_msgSend(v17, "UTF8String");
  v18 = rootless_check_datavault_flag();
  if (v18)
  {
    if (v18 == -1)
    {
      SO_LOG_SOConfigurationHost();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = __error();
        v21 = strerror(*v20);
        -[SOConfigurationHost _initDataVaultIfNeededWithError:].cold.2((uint64_t)v21, (uint64_t)buf);
      }

      if (a3)
      {
        SOErrorHelperClass_3 = getSOErrorHelperClass_3();
        v23 = (void *)MEMORY[0x24BDD17C8];
        v24 = __error();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("failed to check the state of datavault: %s"), strerror(*v24));
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(SOErrorHelperClass_3, "internalErrorWithMessage:", v14);
        v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
        v26 = 0;
        *a3 = v25;
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      v27 = objc_retainAutorelease(v17);
      objc_msgSend(v27, "UTF8String");
      v28 = rootless_convert_to_datavault();
      SO_LOG_SOConfigurationHost();
      v29 = objc_claimAutoreleasedReturnValue();
      v14 = v29;
      if (v28 != -1)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v40 = v27;
          _os_log_impl(&dword_20DABC000, v14, OS_LOG_TYPE_DEFAULT, "successfully created datavault at %{public}@", buf, 0xCu);
        }
        v26 = 1;
        goto LABEL_31;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = __error();
        v31 = strerror(*v30);
        -[SOConfigurationHost _initDataVaultIfNeededWithError:].cold.1((uint64_t)v31, (uint64_t)buf);
      }

      if (a3)
      {
        v32 = getSOErrorHelperClass_3();
        v33 = (void *)MEMORY[0x24BDD17C8];
        v34 = __error();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("failed to convert to datavault: %s"), strerror(*v34));
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "internalErrorWithMessage:", v14);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
    }
    v26 = 0;
    goto LABEL_32;
  }
  v26 = 1;
LABEL_32:
  objc_sync_exit(v7);

  return v26;
}

- (BOOL)_initCachePath:(id)a3 ifNeededWithError:(id *)a4
{
  char *v6;
  NSObject *v7;
  SOConfigurationHost *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  char *v18;
  int v19;
  NSObject *v20;
  id SOErrorHelperClass_3;
  void *v22;
  int *v23;
  NSObject *v24;
  id v25;
  char *v26;
  int v27;
  NSObject *v28;
  id v29;
  void *v30;
  int *v31;
  id v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  SOConfigurationHost *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  SO_LOG_SOConfigurationHost();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[SOConfigurationHost _initCachePath:ifNeededWithError:]";
    v38 = 2112;
    v39 = self;
    _os_log_impl(&dword_20DABC000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v8 = self;
  objc_sync_enter(v8);
  v9 = *MEMORY[0x24BDD0C78];
  v34[0] = *MEMORY[0x24BDD0CB0];
  v34[1] = v9;
  v35[0] = CFSTR("mobile");
  v35[1] = CFSTR("mobile");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v12 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, v10, &v33);
  v13 = v33;

  if (v13)
    v12 = 0;
  SO_LOG_SOConfigurationHost();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v6;
      _os_log_impl(&dword_20DABC000, v15, OS_LOG_TYPE_DEFAULT, "created cache directory at %{public}@", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SOConfigurationHost saveConfiguration:error:].cold.2();

    if (a4)
      *a4 = objc_retainAutorelease(v13);
  }

  objc_sync_exit(v8);
  if (!v12)
    goto LABEL_32;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v6, 0);

  if (v17)
  {
    v18 = objc_retainAutorelease(v6);
    objc_msgSend(v18, "UTF8String");
    v19 = rootless_check_datavault_flag();
    if (v19)
    {
      if (v19 == -1)
      {
        SO_LOG_SOConfigurationHost();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[SOConfigurationHost _initCachePath:ifNeededWithError:].cold.2(v20);

        if (a4)
        {
          SOErrorHelperClass_3 = getSOErrorHelperClass_3();
          v22 = (void *)MEMORY[0x24BDD17C8];
          v23 = __error();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("failed to check the state of datavault: %s"), strerror(*v23));
          v24 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(SOErrorHelperClass_3, "internalErrorWithMessage:", v24);
          v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
          LOBYTE(v17) = 0;
          *a4 = v25;
LABEL_31:

          goto LABEL_33;
        }
      }
      else
      {
        v26 = objc_retainAutorelease(v18);
        objc_msgSend(v26, "UTF8String");
        v27 = rootless_convert_to_datavault();
        SO_LOG_SOConfigurationHost();
        v28 = objc_claimAutoreleasedReturnValue();
        v24 = v28;
        if (v27 != -1)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v37 = v26;
            _os_log_impl(&dword_20DABC000, v24, OS_LOG_TYPE_DEFAULT, "successfully created datavault at %{public}@", buf, 0xCu);
          }
          LOBYTE(v17) = 1;
          goto LABEL_31;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[SOConfigurationHost _initCachePath:ifNeededWithError:].cold.1(v24);

        if (a4)
        {
          v29 = getSOErrorHelperClass_3();
          v30 = (void *)MEMORY[0x24BDD17C8];
          v31 = __error();
          objc_msgSend(v30, "stringWithFormat:", CFSTR("failed to convert to datavault: %s"), strerror(*v31));
          v24 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "internalErrorWithMessage:", v24);
          v25 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
        }
      }
LABEL_32:
      LOBYTE(v17) = 0;
      goto LABEL_33;
    }
    LOBYTE(v17) = 1;
  }
LABEL_33:

  return v17;
}

- (BOOL)_saveConfigToFile:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  SOConfigurationHost *v8;
  char *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  SOConfigurationHost *v20;
  BOOL v21;
  NSObject *v22;
  id v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  SOConfigurationHost *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  SO_LOG_SOConfigurationHost();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[SOConfigurationHost _saveConfigToFile:error:]";
    v30 = 2112;
    v31 = self;
    _os_log_impl(&dword_20DABC000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v8 = self;
  objc_sync_enter(v8);
  if (-[SOConfigurationHost _initDataVaultIfNeededWithError:](v8, "_initDataVaultIfNeededWithError:", a4))
  {
    -[SOConfigurationHost _defaultConfigurationFile](v8, "_defaultConfigurationFile");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v11 = objc_msgSend(v6, "writeToURL:error:", v10, &v25);
    v12 = v25;

    if (v11)
    {
      v13 = *MEMORY[0x24BDD0C78];
      v26[0] = *MEMORY[0x24BDD0CB0];
      v26[1] = v13;
      v27[0] = CFSTR("mobile");
      v27[1] = CFSTR("mobile");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v16 = objc_msgSend(v15, "setAttributes:ofItemAtPath:error:", v14, v9, &v24);
      v17 = v24;

      SO_LOG_SOConfigurationHost();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if ((v16 & 1) != 0)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)objc_opt_class(), "maskRegistrationTokenInProfileList:", v6);
          v20 = (SOConfigurationHost *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v29 = v9;
          v30 = 2112;
          v31 = v20;
          _os_log_impl(&dword_20DABC000, v19, OS_LOG_TYPE_DEFAULT, "config written to file: %{public}@, %@", buf, 0x16u);

        }
        v21 = 1;
        goto LABEL_20;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SOConfigurationHost _saveConfigToFile:error:].cold.1();

      if (a4)
        *a4 = objc_retainAutorelease(v17);

    }
    else
    {
      SO_LOG_SOConfigurationHost();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SOConfigurationHost _saveConfigToFile:error:].cold.2();

      if (a4)
      {
        v21 = 0;
        *a4 = objc_retainAutorelease(v12);
LABEL_20:

        goto LABEL_21;
      }
    }
    v21 = 0;
    goto LABEL_20;
  }
  v21 = 0;
LABEL_21:
  objc_sync_exit(v8);

  return v21;
}

- (BOOL)_saveCacheToFile:(id)a3 error:(id *)a4
{
  SOConfigurationHost *v6;
  NSObject *v7;
  SOConfigurationHost *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  SOConfigurationHost *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = (SOConfigurationHost *)a3;
  SO_LOG_SOConfigurationHost();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[SOConfigurationHost _saveCacheToFile:error:]";
    v35 = 2112;
    v36 = self;
    _os_log_impl(&dword_20DABC000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v8 = self;
  objc_sync_enter(v8);
  -[SOConfigurationHost _defaultCacheFile](v8, "_defaultCacheFile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SOConfigurationHost _initCachePath:ifNeededWithError:](v8, "_initCachePath:ifNeededWithError:", v10, a4))
  {
    -[SOConfigurationHost _defaultCacheFile](v8, "_defaultCacheFile");
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 3, &v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v30;
    if (!v12)
    {
      SO_LOG_SOConfigurationHost();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[SOConfigurationHost _saveCacheToFile:error:].cold.1();

      v22 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v13);
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v15 = objc_msgSend(v12, "writeToURL:options:error:", v14, 0, &v29);
    v16 = v29;

    if (v15)
    {
      v17 = *MEMORY[0x24BDD0C78];
      v31[0] = *MEMORY[0x24BDD0CB0];
      v31[1] = v17;
      v32[0] = CFSTR("mobile");
      v32[1] = CFSTR("mobile");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v19 = objc_msgSend(v18, "setAttributes:ofItemAtPath:error:", v27, v11, &v28);
      v26 = v28;

      SO_LOG_SOConfigurationHost();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if ((v19 & 1) != 0)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v34 = v11;
          v35 = 2114;
          v36 = v6;
          _os_log_impl(&dword_20DABC000, v21, OS_LOG_TYPE_DEFAULT, "cache written to file: %{public}@, %{public}@", buf, 0x16u);
        }

        v22 = 1;
        goto LABEL_25;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SOConfigurationHost _saveConfigToFile:error:].cold.1();

      if (a4)
        *a4 = objc_retainAutorelease(v26);

    }
    else
    {
      SO_LOG_SOConfigurationHost();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[SOConfigurationHost _saveCacheToFile:error:].cold.1();

      if (a4)
      {
        v22 = 0;
        *a4 = objc_retainAutorelease(v16);
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
    }
    v22 = 0;
    goto LABEL_25;
  }
  v22 = 0;
LABEL_27:

  objc_sync_exit(v8);
  return v22;
}

- (void)_extensionsLoaded:(id)a3
{
  id v4;
  NSObject *v5;
  SOConfigurationHost *v6;
  void *v7;
  char *v8;
  void *v9;
  SOConfigurationHost *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  SOConfigurationHost *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOConfigurationHost();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SOConfigurationHost _extensionsLoaded:]";
    v18 = 2112;
    v19 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extensions"));
  v8 = (char *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("new"));
  v10 = (SOConfigurationHost *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("removed"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SO_LOG_SOConfigurationHost();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v17 = v8;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v12;
    _os_log_impl(&dword_20DABC000, v13, OS_LOG_TYPE_INFO, "extensions changed: %{public}@, new: %{public}@, removed: %{public}@", buf, 0x20u);
  }

  if (-[SOConfigurationHost count](v10, "count") || objc_msgSend(v12, "count"))
  {
    v14 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__SOConfigurationHost__extensionsLoaded___block_invoke;
    block[3] = &unk_24C80CAD8;
    block[4] = v6;
    dispatch_after(v14, MEMORY[0x24BDAC9B8], block);
  }

  objc_sync_exit(v6);
}

uint64_t __41__SOConfigurationHost__extensionsLoaded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadConfigWithReason:", 1);
}

- (BOOL)_isConfigFileAvailable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  v2 = (void *)MEMORY[0x24BDBCE70];
  v3 = (void *)MEMORY[0x24BDBCF48];
  -[SOConfigurationHost _defaultConfigurationFile](self, "_defaultConfigurationFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "dictionaryWithContentsOfURL:error:", v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v7)
  {
    SO_LOG_SOConfigurationHost();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SOConfigurationHost _isConfigFileAvailable].cold.1();

  }
  return v6 != 0;
}

- (id)_stringWithReason:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("FirstLoad");
  if (a3 == 1)
    v3 = CFSTR("ExtensionsChanged");
  if (a3 == 2)
    return CFSTR("ModifiedByMDM");
  else
    return (id)v3;
}

+ (id)maskRegistrationTokenInConfigurationData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RegistrationToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = CFSTR("present");
  else
    v6 = CFSTR("<null>");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("RegistrationToken"));

  return v4;
}

+ (id)maskRegistrationTokenInProfileList:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Profiles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v17 = (void *)objc_msgSend(v3, "mutableCopy");
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Profiles"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v12 = (void *)objc_msgSend(v11, "mutableCopy", v17);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("RegistrationToken"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            v14 = CFSTR("present");
          else
            v14 = CFSTR("<null>");
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("RegistrationToken"));

          objc_msgSend(v5, "addObject:", v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    v15 = v17;
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v5, CFSTR("Profiles"));

    v3 = v18;
  }
  else
  {
    v15 = v3;
  }

  return v15;
}

- (id)_defaultConfigurationPath
{
  return CFSTR("/var/mobile/Library/ExtensibleSSO/Configuration");
}

- (id)_defaultConfigurationFile
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SOConfigurationHost _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@"), v3, CFSTR("com.apple.AppSSO.configuration.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_defaultCacheFile
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SOConfigurationHost _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/Cache/%@"), v3, CFSTR("com.apple.AppSSO.cache.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableDictionary)associatedDomainCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssociatedDomainCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDomainCache, 0);
  objc_storeStrong((id *)&self->_removedProfiles, 0);
  objc_storeStrong((id *)&self->_configurationVersion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (void)defaultManager
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_20DABC000, v0, v1, "no SOConfigurationManager!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)saveConfiguration:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_20DABC000, v0, v1, "unable to save new configuration, invalid format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)saveConfiguration:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_20DABC000, v0, v1, "failed to create cache directory at %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)saveConfigurationData:(void *)a1 error:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13_1((uint64_t)a1, a2, 5.808e-34);
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, v3, (uint64_t)v3, "unable to save new configuration, invalid format: %{private}@", v4);

  OUTLINED_FUNCTION_11_0();
}

- (void)profileForURL:responseCode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_20DABC000, v0, v1, "unexpected class in the configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)hasAnyMDMProfileForExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "extension: %{public}@ not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)hasAnyMDMProfileForExtension:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "found profile for extension: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)hasAnyMDMProfileForExtension:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "Checking default path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)willHandleURL:responseCode:callerBundleIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_1_1(&dword_20DABC000, v0, v1, "willHandleURL(host): reloading configuration with updated associated domains for URL: %{sensitive, mask.hash}@, extension: %{public}@");
  OUTLINED_FUNCTION_10_2();
}

- (void)willHandleURL:responseCode:callerBundleIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_1_1(&dword_20DABC000, v0, v1, "willHandleURL(host): checking associated domains again for URL: %{sensitive, mask.hash}@, extension: %{public}@");
  OUTLINED_FUNCTION_10_2();
}

+ (void)_loadProfilesFromDict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, v0, v1, "invalid profile: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)_loadProfilesFromDict:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, v0, v1, "multiple profiles have Platform SSO: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)_loadProfilesFromDict:(void *)a1 .cold.3(void *a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13_1((uint64_t)a1, a2, 5.808e-34);
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, v3, (uint64_t)v3, "invalid profile: %{private}@", v4);

  OUTLINED_FUNCTION_11_0();
}

+ (void)_loadProfilesFromDict:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, v0, v1, "invalid config: %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)_loadProfilesFromURL:logFileError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_20DABC000, v0, v1, "failed to load config at %{private}@, error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_checkAssociatedDomainForProfiles:(_QWORD *)a3 .cold.1(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_debug_impl(&dword_20DABC000, log, OS_LOG_TYPE_DEBUG, "Associated domain: validation skipped for extension: %{public}@", buf, 0xCu);

  OUTLINED_FUNCTION_11_0();
}

- (void)_checkAssociatedDomainForProfiles:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_20DABC000, v0, v1, "Associated domain: failed to save cache to file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_initDataVaultIfNeededWithError:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_13_1(a1, a2, 4.8751e-34);
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, v2, (uint64_t)v2, "failed to convert to datavault: %{public}s", v3);
}

- (void)_initDataVaultIfNeededWithError:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_13_1(a1, a2, 4.8751e-34);
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, v2, (uint64_t)v2, "failed to check the state of datavault: %{public}s", v3);
}

- (void)_initDataVaultIfNeededWithError:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_20DABC000, v0, v1, "failed to create configuration directory at %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_initCachePath:(NSObject *)a1 ifNeededWithError:.cold.1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, a1, v3, "failed to convert to datavault: %{public}s", v4);
  OUTLINED_FUNCTION_10_2();
}

- (void)_initCachePath:(NSObject *)a1 ifNeededWithError:.cold.2(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, a1, v3, "failed to check the state of datavault: %{public}s", v4);
  OUTLINED_FUNCTION_10_2();
}

- (void)_saveConfigToFile:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_20DABC000, v0, v1, "failed to change file attributes of file: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_saveConfigToFile:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_20DABC000, v0, v1, "failed to save config to file: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_saveCacheToFile:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_20DABC000, v0, v1, "failed to save cache to file: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_isConfigFileAvailable
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_20DABC000, v0, v1, "config file is unavailable: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

@end
