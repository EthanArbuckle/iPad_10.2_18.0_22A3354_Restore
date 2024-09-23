@implementation IMBalloonPluginManager

- (id)_insertPluginForExtension:(id)a3 balloonProviderBundle:(id)a4 precachedBalloonAppExtensions:(id)a5 timingCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  IMBalloonAppExtension *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && objc_msgSend((id)objc_opt_class(), "_allowExtensionWithIdentifier:", v14))
  {
    objc_msgSend(v13, "startTimingForKey:", CFSTR("createPlugin"));
    objc_msgSend(v12, "objectForKeyedSubscript:", v14);
    v15 = (IMBalloonAppExtension *)objc_claimAutoreleasedReturnValue();
    v16 = IMOSLoggingEnabled();
    if (v15)
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v29 = 138412290;
          v30 = v14;
          _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Using precached plugin for %@", (uint8_t *)&v29, 0xCu);
        }

      }
    }
    else
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v29 = 138412290;
          v30 = v14;
          _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "No precached plugin for %@, creating a new instance", (uint8_t *)&v29, 0xCu);
        }

      }
      v15 = -[IMBalloonAppExtension initWithPluginBundle:extension:]([IMBalloonAppExtension alloc], "initWithPluginBundle:extension:", v11, v10);
    }
    -[IMBalloonPlugin identifier](v15, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    IMBalloonExtensionIDWithSuffix();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToString:", v20);

    v22 = _os_feature_enabled_impl();
    if (v21)
    {
      if (v22)
        goto LABEL_18;
    }
    else
    {
      -[IMBalloonPlugin identifier](v15, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (!v24)
      {
LABEL_18:
        -[IMBalloonPluginManager model](self, "model");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "pluginsMap");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMBalloonPlugin identifier](v15, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setPlugin:forIdentifier:", v15, v27);

      }
    }
    objc_msgSend(v13, "stopTimingForKey:", CFSTR("createPlugin"));
    goto LABEL_20;
  }
  v15 = 0;
LABEL_20:

  return v15;
}

+ (id)sharedInstance
{
  if (qword_1ECF12520 != -1)
    dispatch_once(&qword_1ECF12520, &unk_1E4720450);
  objc_msgSend((id)qword_1ECF12318, "_postDeferredInstalledAppsChangedNotificationIfNecessary");
  return (id)qword_1ECF12318;
}

- (id)balloonPluginForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  -[IMBalloonPluginManager model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pluginsMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pluginForIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[IMBalloonPluginManager _fallBackMessagesExtensionPluginForBundleID:](self, "_fallBackMessagesExtensionPluginForBundleID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v10 = 138412290;
          v11 = v4;
          _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "IMBalloonPluginManager. Did not find any plugin for id %@", (uint8_t *)&v10, 0xCu);
        }

      }
      goto LABEL_8;
    }
  }
LABEL_9:

  return v7;
}

- (void)_postDeferredInstalledAppsChangedNotificationIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  -[IMBalloonPluginManager model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasDeferredInstalledAppsChangedNotification");

  if (v4)
  {
    -[IMBalloonPluginManager model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHasDeferredInstalledAppsChangedNotification:", 0);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Performing deffered IMBalloonPluginManagerInstalledAppsChangedNotification.", v7, 2u);
      }

    }
    -[IMBalloonPluginManager _postInstalledAppsChangedNotification](self, "_postInstalledAppsChangedNotification");
  }
}

- (IMBalloonPluginManagerModel)model
{
  return self->_model;
}

+ (BOOL)_allowExtensionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "_isServerBlocklistedBundleIdentifier:serverBag:", v4, v5);

  if ((v6 & 1) != 0)
    LOBYTE(v7) = 0;
  else
    v7 = objc_msgSend(a1, "_isExtensionBlocklisted:", v4) ^ 1;

  return v7;
}

+ (BOOL)_isServerBlocklistedBundleIdentifier:(id)a3 serverBag:(id)a4
{
  return IMSharedHelperAppBlocklisted();
}

+ (BOOL)_isExtensionBlocklisted:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "isRunningPPT") & 1) != 0 || (IMGetDomainBoolForKey() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "_extensionBlocklist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4);

  }
  return v5;
}

+ (BOOL)isRunningPPT
{
  return byte_1EE65F4D0;
}

+ (id)_extensionBlocklist
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A200C774;
  block[3] = &unk_1E471F058;
  block[4] = a1;
  if (qword_1ECF12298 != -1)
    dispatch_once(&qword_1ECF12298, block);
  return (id)qword_1ECF122A0;
}

- (id)signpostLogHandle
{
  return (id)objc_msgSend((id)objc_opt_class(), "signpostLogHandle");
}

- (IMBalloonPluginManager)init
{
  IMBalloonPluginManagerModel *v2;
  IMBalloonPluginManagerModel *model;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  IMBalloonPluginManager *v39;
  void *v40;
  void *v41;
  id obj;
  IMBalloonPluginManager *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  objc_super v50;
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)IMBalloonPluginManager;
  v39 = -[IMBalloonPluginManager init](&v50, sel_init);
  if (v39)
  {
    v2 = objc_alloc_init(IMBalloonPluginManagerModel);
    model = v39->_model;
    v39->_model = v2;

    if (sub_1A200DA9C())
    {
      -[IMBalloonPluginManager _loadAllDataSources](v39, "_loadAllDataSources");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObserver:selector:name:object:", v39, sel__transferUpdated_, CFSTR("__kIMFileTransferUpdatedNotification"), 0);

      v5 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingString:", CFSTR("/Library"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("SMS"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("PluginMetaDataCache"), 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "valueForKey:", CFSTR("PluginMetaDataCachePath"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = v11 == 0;

      if ((_DWORD)v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByDeletingLastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v41, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        -[IMBalloonPluginManager model](v39, "model");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "pluginMetaDataFolder");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        IMSharedHelperEnsureDirectoryExistsAtPath();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0;
        objc_msgSend(v40, "contentsOfDirectoryAtPath:error:", v12, &v49);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v49;
        if (v9 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v9;
            _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Error = %@ while trying to get contents of folder", buf, 0xCu);
          }

        }
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        obj = v19;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v46 != v22)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              if (objc_msgSend(v24, "hasSuffix:", CFSTR("plist")))
              {
                objc_msgSend(v24, "lastPathComponent");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "stringByAppendingPathComponent:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "stringByAppendingPathComponent:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v12, "stringByAppendingPathComponent:", v24);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = v9;
                objc_msgSend(v40, "moveItemAtPath:toPath:error:", v28, v27, &v44);
                v29 = v44;

                v9 = v29;
              }
            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
          }
          while (v21);
        }

        if (v9 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v9;
            _os_log_impl(&dword_1A1FF4000, v30, OS_LOG_TYPE_INFO, "Error = %@ while trying to copy file to new folder", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v41, CFSTR("PluginMetaDataCachePath"));

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "valueForKey:", CFSTR("PluginMetaDataCachePath"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v12, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v38, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMBalloonPluginManager model](v39, "model");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setPluginMetaDataFolder:", v32);

      v43 = v39;
      dword_1ECF11FB8 = IMDispatchForNotify();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMBalloonPluginManager model](v43, "model");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPluginIDToMetadataCache:", v34);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v15;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Un-allowlisted client tried to use IMBalloonPluginManager: %@", buf, 0xCu);

      }
    }
    -[IMBalloonPluginManager model](v39, "model");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setHasCompletedInitialization:", 1);

  }
  return v39;
}

- (Class)dataSourceClassForBundleID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = 0;
    goto LABEL_20;
  }
  v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D375F8]);
  if (!v6
    || (-[IMBalloonPluginManager model](self, "model"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "richLinksDataSourceClass"),
        v7,
        !v8))
  {
    -[IMBalloonPluginManager model](self, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pluginsMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pluginForIdentifier:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13
      || (-[IMBalloonPluginManager _fallBackMessagesExtensionPluginForBundleID:](self, "_fallBackMessagesExtensionPluginForBundleID:", v5), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (objc_msgSend((id)objc_msgSend(v13, "dataSourceClass"), "isSubclassOfClass:", objc_opt_class()))
        v14 = objc_msgSend(v13, "dataSourceClass");
      else
        v14 = objc_opt_class();
      v15 = (void *)v14;
      if (!v6)
        goto LABEL_19;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v21 = 138412290;
          v22 = v5;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "IMBalloonPluginManager. Did not find any plugin for id %@", (uint8_t *)&v21, 0xCu);
        }

      }
      v15 = 0;
      v13 = 0;
      if (!v6)
        goto LABEL_19;
    }
    -[IMBalloonPluginManager model](self, "model");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "richLinksDataSourceClass") == 0;

    if (v17)
    {
      -[IMBalloonPluginManager model](self, "model");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setRichLinksDataSourceClass:", v15);

    }
LABEL_19:
    v10 = v15;

    goto LABEL_20;
  }
  -[IMBalloonPluginManager model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "richLinksDataSourceClass");
  v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return (Class)v10;
}

- (id)allPlugins
{
  void *v2;
  void *v3;
  void *v4;

  -[IMBalloonPluginManager model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginsMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allPlugins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updatePluginsForExtensions:(id)a3 extensionPoint:(id)a4 precachedBalloonAppExtensions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  IMBalloonPluginManager *v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[5];
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint8_t buf[4];
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager _currentlyInstalledExtensionsExcludingExtensionPoint:](self, "_currentlyInstalledExtensionsExcludingExtensionPoint:", v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v32);
  objc_msgSend(MEMORY[0x1E0C99E58], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__removePluginsWithDelay, 0);
  -[IMBalloonPluginManager _appProxyBundleIdentifiersForAppPlugins](self, "_appProxyBundleIdentifiersForAppPlugins");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager _proxyIdentifiersForPlugins](self, "_proxyIdentifiersForPlugins");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = sub_1A200ADE4;
  v73 = sub_1A200AC64;
  v74 = 0;
  v74 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = sub_1A200ADE4;
  v67 = sub_1A200AC64;
  v68 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = sub_1A200ADE4;
  v61[4] = sub_1A200AC64;
  v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = sub_1A200ADE4;
  v59[4] = sub_1A200AC64;
  v60 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_1A200ADE4;
  v49 = sub_1A200AC64;
  v50 = 0;
  -[IMBalloonPluginManager model](self, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pluginsToRemoveAfterExtensionsUpdate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (id)objc_msgSend(v15, "mutableCopy");

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1A20099B4;
  v33[3] = &unk_1E4720580;
  v38 = &v69;
  v39 = &v45;
  v16 = v12;
  v40 = &v63;
  v41 = v61;
  v34 = v16;
  v35 = self;
  v42 = v59;
  v17 = v10;
  v36 = v17;
  v18 = v13;
  v37 = v18;
  v43 = &v55;
  v44 = &v51;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v33);
  -[IMBalloonPluginManager model](self, "model");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend((id)v46[5], "copy");
  objc_msgSend(v19, "setPluginsToRemoveAfterExtensionsUpdate:", v20);

  objc_msgSend(v16, "minusSet:", v70[5]);
  if (objc_msgSend(v16, "count"))
  {
    -[IMBalloonPluginManager _setPluginsToRemoveAndCallSelectorWithDelay:](self, "_setPluginsToRemoveAndCallSelectorWithDelay:", v16);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Clearing extensions to remove after delay", buf, 2u);
      }

    }
    -[IMBalloonPluginManager model](self, "model");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPluginsToRemoveAfterExtensionsUpdate:", v23);

  }
  if (v64[5] && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = v64[5];
      *(_DWORD *)buf = 138412290;
      v76 = v25;
      _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "app extension loading time: %@", buf, 0xCu);
    }

  }
  -[IMBalloonPluginManager _moveExtensionDataSourcesFromMessagesExtensionPluginToAppExtensions](self, "_moveExtensionDataSourcesFromMessagesExtensionPluginToAppExtensions");
  -[IMBalloonPluginManager _postInstalledAppsChangedNotification](self, "_postInstalledAppsChangedNotification");
  if ((byte_1EE65F4C8 & 1) == 0 && objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D38278]))
  {
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trackEvent:withCount:", *MEMORY[0x1E0D38988], v27);

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v56[3]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trackEvent:withCount:", *MEMORY[0x1E0D38980], v29);

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52[3]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trackEvent:withCount:", *MEMORY[0x1E0D389D0], v31);

  }
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(v59, 8);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
}

- (void)_updatePluginsForBundles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t v16[8];
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E58], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__removePluginsWithDelay, 0);
  -[IMBalloonPluginManager _appProxyBundleIdentifiersForAppPlugins](self, "_appProxyBundleIdentifiersForAppPlugins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager _proxyIdentifiersForPlugins](self, "_proxyIdentifiersForPlugins");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1A200ADE4;
  v42 = sub_1A200AC64;
  v43 = 0;
  v43 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_1A200ADE4;
  v36[4] = sub_1A200AC64;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_1A200ADE4;
  v34[4] = sub_1A200AC64;
  v35 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1A200ADE4;
  v30 = sub_1A200AC64;
  v31 = 0;
  -[IMBalloonPluginManager model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pluginsToRemoveAfterExtensionsUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v8, "mutableCopy");

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1A200C06C;
  v17[3] = &unk_1E4720558;
  v17[4] = self;
  v20 = &v38;
  v21 = &v26;
  v9 = v5;
  v18 = v9;
  v22 = v36;
  v23 = v34;
  v10 = v6;
  v19 = v10;
  v24 = v33;
  v25 = v32;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v17);
  -[IMBalloonPluginManager model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend((id)v27[5], "copy");
  objc_msgSend(v11, "setPluginsToRemoveAfterExtensionsUpdate:", v12);

  objc_msgSend(v9, "minusSet:", v39[5]);
  if (objc_msgSend(v9, "count"))
  {
    -[IMBalloonPluginManager _setPluginsToRemoveAndCallSelectorWithDelay:](self, "_setPluginsToRemoveAndCallSelectorWithDelay:", v9);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Clearing extensions to remove after delay", v16, 2u);
      }

    }
    -[IMBalloonPluginManager model](self, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPluginsToRemoveAfterExtensionsUpdate:", v15);

  }
  -[IMBalloonPluginManager _moveExtensionDataSourcesFromMessagesExtensionPluginToAppExtensions](self, "_moveExtensionDataSourcesFromMessagesExtensionPluginToAppExtensions");

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

}

- (BOOL)_shouldSkipUpdatingPluginBundleIdentifier:(id)a3
{
  id v3;
  int v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown");
  v5 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D374D0]);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isStickersAppEnabled"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5 & ~objc_msgSend(v7, "isClingEnabled");

    if ((v8 & 1) != 0)
    {
LABEL_6:
      v11 = 1;
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isWaldoEnabled") ^ 1 | v4) == 1)
  {
    v10 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37508]);

    if ((v10 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isZelkovaEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isSendMenuEnabled") & 1) != 0)
      v11 = 0;
    else
      v11 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37500]);

  }
  else
  {
    v11 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37500]);
  }

LABEL_15:
  return v11;
}

- (id)_proxyIdentifiersForPlugins
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[IMBalloonPluginManager model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "pluginCount"));

  -[IMBalloonPluginManager model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pluginsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryMapCopy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1A200BF1C;
  v12[3] = &unk_1E471F690;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

  return v10;
}

- (void)_postInstalledAppsChangedNotification
{
  void *v3;
  char v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  -[IMBalloonPluginManager model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasCompletedInitialization");

  v5 = IMOSLoggingEnabled();
  if ((v4 & 1) != 0)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Posting notification IMBalloonPluginManagerInstalledAppsChangedNotification", v9, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__mainThreadPostNotificationName:object:", CFSTR("__kIMBalloonPluginManagerInstalledAppsChangedNotification"), 0);
  }
  else
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Deffering IMBalloonPluginManagerInstalledAppsChangedNotification until after initialization is completed.", buf, 2u);
      }

    }
    -[IMBalloonPluginManager model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHasDeferredInstalledAppsChangedNotification:", 1);
  }

}

- (void)_moveExtensionDataSourcesFromMessagesExtensionPluginToAppExtensions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[IMBalloonPluginManager model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluginsMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginForIdentifier:", *MEMORY[0x1E0D375D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "messageToDatasourceMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        objc_msgSend(v5, "messageToDatasourceMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "bundleID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMBalloonPluginManager balloonPluginForBundleID:](self, "balloonPluginForBundleID:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v16, "existingDataSourceForMessageGUID:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            objc_msgSend(v16, "insertDataSource:forGUID:", v14, v12);
            objc_msgSend(v5, "messageToDatasourceMap");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "removeObjectForKey:", v12);

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

- (void)_loadAppExtensionDataSources
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[IMBalloonPluginManager _loadAppExtensionDataSourcesForExtensionPoint:](self, "_loadAppExtensionDataSourcesForExtensionPoint:", *MEMORY[0x1E0D38278]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtensionMatchingContext:", v3);

  -[IMBalloonPluginManager _loadAppExtensionDataSourcesForExtensionPoint:](self, "_loadAppExtensionDataSourcesForExtensionPoint:", *MEMORY[0x1E0D38280]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighMemoryExtensionMatchingContext:", v6);

}

- (id)_loadAppExtensionDataSourcesForExtensionPoint:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  IMBalloonPluginManager *v17;
  id v18;
  id location;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((byte_1EE65F4C8 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("beginMatchingExtensionsWithAttributes_%@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startTimingForKey:", v7);
    v20 = *MEMORY[0x1E0CB2A28];
    v21[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0CB35D8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1A200B3B0;
    v13[3] = &unk_1E47204F0;
    v10 = v6;
    v14 = v10;
    v11 = v7;
    v15 = v11;
    v16 = v4;
    objc_copyWeak(&v18, &location);
    v17 = self;
    objc_msgSend(v9, "beginMatchingExtensionsWithAttributes:completion:", v8, v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_loadAppBundleDataSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if ((byte_1EE65F4C8 & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    IMAppBundleRootDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C999D0];
    v12[0] = *MEMORY[0x1E0C99A90];
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v8, 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__imArrayByApplyingBlock:", &unk_1E4720530);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMBalloonPluginManager _updatePluginsForBundles:](self, "_updatePluginsForBundles:", v11);
  }
}

- (void)_loadAllDataSources
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v3, "startTimingForKey:", CFSTR("loadAllDataSources"));
  -[IMBalloonPluginManager signpostLogHandle](self, "signpostLogHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager signpostLogHandle](self, "signpostLogHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, "loadAllDataSources");

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1FF4000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "loadAllDataSources", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
  }

  if ((IMGetDomainBoolForKey() & 1) != 0)
  {
    IMBalloonProviderBundleRootDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginManager _findPluginsInPathInternal:](self, "_findPluginsInPathInternal:", v7);

    -[IMBalloonPluginManager _findPluginsInPathInternal:](self, "_findPluginsInPathInternal:", CFSTR("/AppleInternal/Library/Bundles/Messages/iMessageBalloons/"));
  }
  else
  {
    IMBalloonProviderBundlePaths();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginManager _findPluginsInPaths:](self, "_findPluginsInPaths:", v8);

  }
  -[IMBalloonPluginManager _loadAppBundleDataSources](self, "_loadAppBundleDataSources");
  -[IMBalloonPluginManager _loadAppExtensionDataSources](self, "_loadAppExtensionDataSources");
  -[IMBalloonPluginManager signpostLogHandle](self, "signpostLogHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager signpostLogHandle](self, "signpostLogHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, "loadAllDataSources");

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1FF4000, v9, OS_SIGNPOST_INTERVAL_END, v11, "loadAllDataSources", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
  }

  objc_msgSend(v3, "stopTimingForKey:", CFSTR("loadAllDataSources"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v3;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Finished loading all data sources: %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (id)_insertPluginForAppBundle:(id)a3 balloonProviderBundle:(id)a4
{
  id v6;
  id v7;
  IMBalloonAppExtension *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = -[IMBalloonAppExtension initWithPluginBundle:appBundle:]([IMBalloonAppExtension alloc], "initWithPluginBundle:appBundle:", v7, v6);
    -[IMBalloonPlugin identifier](v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[IMBalloonPluginManager model](self, "model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pluginsMap");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMBalloonPlugin identifier](v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPlugin:forIdentifier:", v8, v12);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_findPluginsInPaths:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  IMBalloonPlugin *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  IMBalloonPluginManager *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v29, "startTimingForKey:", CFSTR("loadPlugins"));
  v31 = self;
  -[IMBalloonPluginManager signpostLogHandle](self, "signpostLogHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager signpostLogHandle](v31, "signpostLogHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, "findPluginsInPaths");

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1FF4000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "findPluginsInPaths", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (byte_1EE65F4C8 != 1
          || objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "hasSuffix:", CFSTR("MSMessageExtensionBalloonPlugin.bundle")))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v12);
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_39;
          -[IMBalloonPluginManager model](v31, "model");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "pluginsMap");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pluginForIdentifier:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v38 = v14;
                _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Found plugin: %@", buf, 0xCu);
              }

            }
            v21 = -[IMBalloonPlugin initWithBundle:]([IMBalloonPlugin alloc], "initWithBundle:", v13);
            if (v21)
              objc_msgSend(v30, "setObject:forKey:", v21, v14);

          }
          else
          {
LABEL_39:
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v38 = v13;
                _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Failed to get bundle identifier for %@", buf, 0xCu);
              }

            }
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v30, "count"))
  {
    -[IMBalloonPluginManager model](v31, "model");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pluginsMap");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(v23, "updateWithMap:", v24);

  }
  -[IMBalloonPluginManager signpostLogHandle](v31, "signpostLogHandle");
  v25 = objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager signpostLogHandle](v31, "signpostLogHandle");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_signpost_id_make_with_pointer(v26, "findPluginsInPaths");

  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1FF4000, v25, OS_SIGNPOST_INTERVAL_END, v27, "findPluginsInPaths", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(v29, "stopTimingForKey:", CFSTR("loadPlugins"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v29;
      _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "Find Plugin time: %@", buf, 0xCu);
    }

  }
}

- (id)_fallBackMessagesExtensionPluginForBundleID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = *MEMORY[0x1E0D375D0], !objc_msgSend(v4, "rangeOfString:", *MEMORY[0x1E0D375D0])))
  {
    -[IMBalloonPluginManager model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pluginsMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pluginForIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_currentlyInstalledExtensionsExcludingExtensionPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pluginsMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryMapCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1A200B2E8;
  v14[3] = &unk_1E47204A0;
  v15 = v4;
  v9 = v5;
  v16 = v9;
  v10 = v4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

- (id)_appProxyBundleIdentifiersForAppPlugins
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[IMBalloonPluginManager model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluginsMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
        -[IMBalloonPluginManager model](self, "model");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pluginsMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pluginForIdentifier:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "proxy");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            objc_msgSend(v14, "proxy");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "bundleIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_msgSend(v14, "proxy");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "bundleIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v20);

            }
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  return v22;
}

+ (id)signpostLogHandle
{
  if (qword_1ECF122B0 != -1)
    dispatch_once(&qword_1ECF122B0, &unk_1E471D6B8);
  return (id)qword_1ECF122B8;
}

+ (id)precacheBalloonAppExtensionsForExtensions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  IMBalloonAppExtension *v12;
  NSObject *v13;
  NSObject *v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "balloonProviderBundlePathURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v16);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && objc_msgSend(a1, "_allowExtensionWithIdentifier:", v11))
        {
          v12 = -[IMBalloonAppExtension initWithPluginBundle:extension:]([IMBalloonAppExtension alloc], "initWithPluginBundle:extension:", v5, v10);
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, v11);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v11;
              _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Precached balloon app extension for %@", buf, 0xCu);
            }

          }
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v11;
            _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Not precached balloon app extension for %@, identifier was blocked", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v7);
  }

  return v17;
}

+ (id)balloonProviderBundlePathURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E98];
  IMBalloonProviderBundleRootDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = CFSTR("MSMessageExtensionBalloonPlugin.bundle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)_shouldAddSafetyMonitorToBlockList
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isZelkovaEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSendMenuEnabled") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

+ (BOOL)_shouldAddFindMyToBlockList
{
  void *v3;
  char v4;

  if ((objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown") & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWaldoEnabled");

  return v4 ^ 1;
}

- (void)insertPlugin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[IMBalloonPluginManager model](self, "model");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pluginsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlugin:forIdentifier:", v4, v6);

}

+ (void)disableExtensionDiscovery
{
  byte_1EE65F4C8 = 1;
}

+ (void)enableAlternatePathPlugins
{
  byte_1EE65F4C9 = 1;
}

+ (BOOL)_shouldAddGenPlaygroundToBlockList
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGenPlaygroundEnabled");

  return v3 ^ 1;
}

+ (void)setIsRunningPPT:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  byte_1EE65F4D0 = a3;
  if (a3)
  {
    +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "balloonProviderBundlePathURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v19);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(a1, "_extensionBlocklist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v4, "model");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "pluginsMap");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "pluginForIdentifier:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13 == 0;

          if (v14)
          {
            v20 = 0;
            objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v10, &v20);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v20;
            if (!v15 && IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v10;
                _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Failed to load previously blocklisted extension for identifier %@", buf, 0xCu);
              }

            }
            v18 = (id)objc_msgSend(v4, "_insertPluginForExtension:balloonProviderBundle:precachedBalloonAppExtensions:timingCollection:", v15, v5, 0, 0);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v7);
    }

  }
}

- (void)pluginChatItem:(id)a3 didRelinquishReusableController:(id)a4 contextIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager balloonPluginForBundleID:](self, "balloonPluginForBundleID:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "moveController:toReusePoolFromChatItem:contextIdentifier:", v9, v10, v8);
}

- (void)pluginChatItem:(id)a3 didRelenquishNonResuableController:(id)a4 contextIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager balloonPluginForBundleID:](self, "balloonPluginForBundleID:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "removeController:forChatItem:contextIdentifier:", v9, v10, v8);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  notify_cancel(dword_1ECF11FB8);
  v3 = (void *)MEMORY[0x1E0CB35D8];
  -[IMBalloonPluginManager model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionMatchingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endMatchingExtensions:", v5);

  v6 = (void *)MEMORY[0x1E0CB35D8];
  -[IMBalloonPluginManager model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highMemoryExtensionMatchingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endMatchingExtensions:", v8);

  v9.receiver = self;
  v9.super_class = (Class)IMBalloonPluginManager;
  -[IMBalloonPluginManager dealloc](&v9, sel_dealloc);
}

- (id)_pluginPlistPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[IMBalloonPluginManager model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pluginMetaDataFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("plist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_infoPlistPathForPluginCreatingFolderIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMBalloonPluginManager model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pluginMetaDataFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IMSharedHelperEnsureDirectoryExistsAtPath();

  -[IMBalloonPluginManager _pluginPlistPath:](self, "_pluginPlistPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_metadataForPluginIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[IMBalloonPluginManager model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pluginIDToMetadataCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v18 = 138412290;
          v19 = v4;
          _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Reading plugin metadata from disk for ID %@", (uint8_t *)&v18, 0xCu);
        }

      }
      v9 = (void *)MEMORY[0x1E0C99D80];
      -[IMBalloonPluginManager _infoPlistPathForPluginCreatingFolderIfNeeded:](self, "_infoPlistPathForPluginCreatingFolderIfNeeded:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryWithContentsOfFile:", v10);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99D80]);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v18 = 138412290;
            v19 = v4;
            _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "No metadataForPluginIdentifer %@", (uint8_t *)&v18, 0xCu);
          }

        }
      }
    }
    if (objc_msgSend(v7, "count"))
    {
      -[IMBalloonPluginManager model](self, "model");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pluginIDToMetadataCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v14, "setObject:forKey:", v7, v4);
      -[IMBalloonPluginManager model](self, "model");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v15, "setPluginIDToMetadataCache:", v16);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_storeMetadata:(id)a3 _forPlugin:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[IMBalloonPluginManager _infoPlistPathForPluginCreatingFolderIfNeeded:](self, "_infoPlistPathForPluginCreatingFolderIfNeeded:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      objc_msgSend(v12, "removeItemAtPath:error:", v9, &v28);
      v13 = v28;

      if (v13 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v32 = v9;
          v33 = 2112;
          v34 = v13;
          _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "IMBalloonPluginManager could not delete file at path %@ error %@", buf, 0x16u);
        }

      }
    }
    if ((objc_msgSend(v6, "writeToFile:atomically:", v9, 1) & 1) == 0 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v32 = v6;
        v33 = 2112;
        v34 = v9;
        v35 = 2112;
        v36 = v8;
        _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "IMBalloonPluginManager could not write metadata %@ to file %@ idenitifier %@", buf, 0x20u);
      }

    }
    -[IMBalloonPluginManager model](self, "model");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pluginIDToMetadataCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "setObject:forKey:", v6, v8);
    -[IMBalloonPluginManager model](self, "model");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v19, "setPluginIDToMetadataCache:", v20);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0CB2AD8];
    v30 = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v23 = objc_msgSend(v21, "setAttributes:ofItemAtPath:error:", v22, v9, &v27);
    v24 = v27;

    if ((v23 & 1) == 0 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v9;
        v33 = 2112;
        v34 = v24;
        _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "Failed making file class C: %@ with error %@", buf, 0x16u);
      }

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v6;
      v33 = 2112;
      v34 = v8;
      _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "IMBalloonPluginManager invalid args to _storeMetadata %@ identifier %@", buf, 0x16u);
    }

  }
}

- (id)localParticipantIdentifierForAppID:(id)a3 conversationID:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  CFMutableDictionaryRef Mutable;
  char *v10;
  char *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (v6)
  {
    -[IMBalloonPluginManager _metadataForPluginIdentifier:](self, "_metadataForPluginIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = (CFMutableDictionaryRef)objc_msgSend(v8, "mutableCopy");

    -[__CFDictionary objectForKey:](Mutable, "objectForKey:", CFSTR("localID"));
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v11 = v10;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v18 = 138412290;
          v19 = v6;
          _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Generating local ID for app %@", (uint8_t *)&v18, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v11 = (char *)objc_claimAutoreleasedReturnValue();

      if (!Mutable)
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v11, CFSTR("localID"));
      -[IMBalloonPluginManager _storeMetadata:_forPlugin:](self, "_storeMetadata:_forPlugin:", Mutable, v6);
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v18 = 138412546;
        v19 = v11;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "localID %@ for appID %@", (uint8_t *)&v18, 0x16u);
      }

    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v18 = 136315138;
        v19 = "-[IMBalloonPluginManager localParticipantIdentifierForAppID:conversationID:]";
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "IMBalloonPluginManager %s appID = nil", (uint8_t *)&v18, 0xCu);
      }

    }
    v13 = 0;
  }

  return v13;
}

- (id)recipientIDForRecipient:(id)a3 appID:(id)a4
{
  id v6;
  char *v7;
  char *v8;
  void *v9;
  CFMutableDictionaryRef Mutable;
  char *v11;
  char *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (char *)a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[IMBalloonPluginManager _metadataForPluginIdentifier:](self, "_metadataForPluginIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = (CFMutableDictionaryRef)objc_msgSend(v9, "mutableCopy");

    -[__CFDictionary objectForKey:](Mutable, "objectForKey:", v6);
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v12 = v11;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v19 = 138412290;
          v20 = v8;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Generating recipientID ID for app %@", (uint8_t *)&v19, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v12 = (char *)objc_claimAutoreleasedReturnValue();

      if (!Mutable)
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v12, v6);
      -[IMBalloonPluginManager _storeMetadata:_forPlugin:](self, "_storeMetadata:_forPlugin:", Mutable, v8);
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v19 = 138412546;
        v20 = v12;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "recipient %@ for appID %@", (uint8_t *)&v19, 0x16u);
      }

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v19 = 136315650;
        v20 = "-[IMBalloonPluginManager recipientIDForRecipient:appID:]";
        v21 = 2112;
        v22 = v8;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "IMBalloonPluginManager %s appID: %@ recipient: %@ ", (uint8_t *)&v19, 0x20u);
      }

    }
    v14 = 0;
  }

  return v14;
}

- (id)conversationID:(id)a3 appID:(id)a4
{
  id v6;
  char *v7;
  char *v8;
  void *v9;
  CFMutableDictionaryRef Mutable;
  char *v11;
  char *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (char *)a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[IMBalloonPluginManager _metadataForPluginIdentifier:](self, "_metadataForPluginIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = (CFMutableDictionaryRef)objc_msgSend(v9, "mutableCopy");

    -[__CFDictionary objectForKey:](Mutable, "objectForKey:", v6);
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v12 = v11;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v19 = 138412290;
          v20 = v8;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Generating randomConversationID ID for app %@", (uint8_t *)&v19, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v12 = (char *)objc_claimAutoreleasedReturnValue();

      if (!Mutable)
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v12, v6);
      -[IMBalloonPluginManager _storeMetadata:_forPlugin:](self, "_storeMetadata:_forPlugin:", Mutable, v8);
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v19 = 138412546;
        v20 = v12;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "randomConversationID %@ for appID %@", (uint8_t *)&v19, 0x16u);
      }

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v19 = 136315650;
        v20 = "-[IMBalloonPluginManager conversationID:appID:]";
        v21 = 2112;
        v22 = v8;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "IMBalloonPluginManager %s appID: %@ recipient: %@ ", (uint8_t *)&v19, 0x20u);
      }

    }
    v14 = 0;
  }

  return v14;
}

- (id)_identifiersForAppPlugins
{
  __CFArray *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[IMBalloonPluginManager model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(obj);
        v11 = *(const void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[IMBalloonPluginManager model](self, "model");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pluginsMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pluginForIdentifier:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v3 && v11)
          CFArrayAppendValue(v3, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v3;
}

- (id)_pluginsForWhichWeHaveMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginMetaDataFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v5, &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pluginMetaDataFolder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "fileExistsAtPath:", v10);
  if (v7)
    v12 = v11;
  else
    v12 = 0;

  if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        -[IMBalloonPluginManager model](self, "model");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pluginMetaDataFolder");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v15;
        v31 = 2112;
        v32 = v7;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "IMBalloonPluginManager could not read contents of dir %@ error %@", buf, 0x16u);

      }
    }
    v16 = 0;
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v24;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "stringByDeletingPathExtension", (_QWORD)v23);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v18);
    }

  }
  return v16;
}

- (void)_deleteMetaDataForPlugins:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "_deleteMetaDataForPlugins %@", buf, 0xCu);
    }

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v24;
    *(_QWORD *)&v7 = 138412546;
    v20 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[IMBalloonPluginManager _pluginPlistPath:](self, "_pluginPlistPath:", v10, v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v12, "removeItemAtPath:error:", v11, &v22);
        v13 = v22;

        if (v13 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            v28 = v11;
            v29 = 2112;
            v30 = v13;
            _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Could not delete plugin meta data at path %@ %@", buf, 0x16u);
          }

        }
        -[IMBalloonPluginManager model](self, "model");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pluginIDToMetadataCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "mutableCopy");

        objc_msgSend(v17, "removeObjectForKey:", v10);
        -[IMBalloonPluginManager model](self, "model");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(v18, "setPluginIDToMetadataCache:", v19);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v6);
  }

}

- (void)_clearPluginMetadataForUninstalledApps
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  -[IMBalloonPluginManager _identifiersForAppPlugins](self, "_identifiersForAppPlugins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager _pluginsForWhichWeHaveMetadata](self, "_pluginsForWhichWeHaveMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectsInArray:", v3);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "clearing in memory salt cache", v7, 2u);
    }

  }
  -[IMBalloonPluginManager _deleteMetaDataForPlugins:](self, "_deleteMetaDataForPlugins:", v5);

}

- (void)loadExtensionWithIdentifierIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMBalloonPluginManager model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pluginsMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pluginForIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Plugin already loaded: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMBalloonPluginManager _extensionWithIdentifier:](self, "_extensionWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extensionPointIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D38278]);

    if ((v13 & 1) != 0)
    {
      v17 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMBalloonPluginManager _updatePluginsForExtensions:extensionPoint:](self, "_updatePluginsForExtensions:extensionPoint:", v14, 0);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "extensionPointIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "IMBalloonPluginManager asked to load an extension that is not an iMessage app. Identifier: %@ extensionPointIdentifier: %@", buf, 0x16u);

      }
    }

  }
}

- (id)_extensionWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "IMBalloonPluginManager failed to find extension with extension identifier: %@", buf, 0xCu);
    }

  }
  return v4;
}

- (void)_setPluginsToRemoveAndCallSelectorWithDelay:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Setting plugins to remove with delay: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  -[IMBalloonPluginManager model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v6, "setPluginsToRemoveAfterExtensionsUpdate:", v7);

  -[IMBalloonPluginManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__removePluginsWithDelay, 0, 60.0);
}

- (void)_updatePluginsForExtensions:(id)a3 extensionPoint:(id)a4
{
  -[IMBalloonPluginManager _updatePluginsForExtensions:extensionPoint:precachedBalloonAppExtensions:](self, "_updatePluginsForExtensions:extensionPoint:precachedBalloonAppExtensions:", a3, a4, 0);
}

- (void)removePluginWithBundleID:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v4;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Explicitly removing plugin with bundleID: %@", (uint8_t *)&v14, 0xCu);
      }

    }
    -[IMBalloonPluginManager model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pluginsMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pluginForIdentifier:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[IMBalloonPluginManager model](self, "model");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pluginsMap");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removePluginWithIdentifier:", v4);

      -[IMBalloonPluginManager _clearPluginMetadataForUninstalledApps](self, "_clearPluginMetadataForUninstalledApps");
      -[IMBalloonPluginManager _postInstalledAppsChangedNotification](self, "_postInstalledAppsChangedNotification");
    }
  }
  else if (v6)
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Attempting to explicitly remove a plugin with a nil bundleID", (uint8_t *)&v14, 2u);
    }

  }
}

- (void)_removePluginsWithDelay
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMBalloonPluginManager model](self, "model");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pluginsToRemoveAfterExtensionsUpdate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Removing plugins with identifiers after delay: %@", (uint8_t *)&v13, 0xCu);

    }
  }
  -[IMBalloonPluginManager model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pluginsToRemoveAfterExtensionsUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") == 0;

  if (!v8)
  {
    -[IMBalloonPluginManager model](self, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pluginsToRemoveAfterExtensionsUpdate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginManager _removePluginsForIdentifiers:](self, "_removePluginsForIdentifiers:", v10);

    -[IMBalloonPluginManager model](self, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPluginsToRemoveAfterExtensionsUpdate:", v12);

    -[IMBalloonPluginManager _clearPluginMetadataForUninstalledApps](self, "_clearPluginMetadataForUninstalledApps");
    -[IMBalloonPluginManager _postInstalledAppsChangedNotification](self, "_postInstalledAppsChangedNotification");
  }
}

- (void)_removePluginsForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  IMBalloonPluginManager *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  -[IMBalloonPluginManager _proxyIdentifiersForPlugins](self, "_proxyIdentifiersForPlugins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1A200ADE4;
  v18 = sub_1A200AC64;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A2098FC8;
  v10[3] = &unk_1E47205A8;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v13 = &v14;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
  -[IMBalloonPluginManager model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pluginsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend((id)v15[5], "copy");
  objc_msgSend(v8, "removePluginsWithIdentifiers:", v9);

  _Block_object_dispose(&v14, 8);
}

- (void)setPluginEnabled:(BOOL)a3 identifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = a4;
  -[IMBalloonPluginManager model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pluginsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pluginForIdentifier:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "app");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsEnabled:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("IMBalloonPluginEnabledStateChangedNotification"), v11);

}

- (void)_findPluginsInPathInternal:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  IMBalloonPlugin *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Loading all internal plugins", buf, 2u);
    }

  }
  v24 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v24, "startTimingForKey:", CFSTR("loadPlugins"));
  v22 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 7, &unk_1E47205E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_12;
        -[IMBalloonPluginManager model](self, "model");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pluginsMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pluginForIdentifier:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if (v15)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v11;
              _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Found plugin: %@", buf, 0xCu);
            }

          }
          v16 = -[IMBalloonPlugin initWithBundle:]([IMBalloonPlugin alloc], "initWithBundle:", v10);
          if (v16)
            objc_msgSend(v25, "setObject:forKey:", v16, v11);
        }
        else
        {
LABEL_12:
          if (!IMOSLoggingEnabled())
            goto LABEL_23;
          OSLogHandleForIMFoundationCategory();
          v16 = (IMBalloonPlugin *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v10;
            _os_log_impl(&dword_1A1FF4000, &v16->super, OS_LOG_TYPE_INFO, "Failed to get bundle identifier for %@", buf, 0xCu);
          }
        }

LABEL_23:
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v25, "count"))
  {
    -[IMBalloonPluginManager model](self, "model");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pluginsMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v19, "updateWithMap:", v20);

  }
  objc_msgSend(v24, "stopTimingForKey:", CFSTR("loadPlugins"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v24;
      _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Find Plugin time: %@", buf, 0xCu);
    }

  }
}

- (id)dataSourceForPluginPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (*v10)(void *);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  uint8_t v26[16];
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "pluginBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    *(_OWORD *)v26 = xmmword_1E4720608;
    v27 = *(_OWORD *)off_1E4720618;
    v28 = 1811;
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = IMFileLocationTrimFileName();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4725068);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("pluginPayload.pluginBundleID != nil"), "-[IMBalloonPluginManager dataSourceForPluginPayload:]", v7, 1811, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v10)
    {
      v10(v9);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v9;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }

    }
  }
  -[IMBalloonPluginManager model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pluginsMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pluginForIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v4, "pluginBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginManager _fallBackMessagesExtensionPluginForBundleID:](self, "_fallBackMessagesExtensionPluginForBundleID:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "pluginBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = v15 == 0;
  else
    v18 = 0;
  v19 = v18;

  if (v19 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "pluginBundleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138412290;
      *(_QWORD *)&v26[4] = v21;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "IMBalloonPluginManager. Did not find any plugin for id %@", v26, 0xCu);

    }
  }
  objc_msgSend(v15, "dataSourceForPluginPayload:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)existingDataSourceForMessageGUID:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[IMBalloonPluginManager model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pluginsMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pluginForIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[IMBalloonPluginManager _fallBackMessagesExtensionPluginForBundleID:](self, "_fallBackMessagesExtensionPluginForBundleID:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v14 = 138412290;
            v15 = v7;
            _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "IMBalloonPluginManager. Did not find any plugin for id %@", (uint8_t *)&v14, 0xCu);
          }

        }
        v10 = 0;
      }
    }
    objc_msgSend(v10, "existingDataSourceForMessageGUID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)insertDataSource:(id)a3 forGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bundleID");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginManager model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pluginsMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pluginForIdentifier:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "insertDataSource:forGUID:", v7, v6);
}

- (id)systemBundleIdentifierForPluginIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = a3;
    -[IMBalloonPluginManager model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pluginsMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pluginForIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "appBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_transferUpdated:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "transferState") == 5)
  {
    objc_msgSend(v6, "messageGUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginManager existingDataSourceForMessageGUID:bundleID:](self, "existingDataSourceForMessageGUID:bundleID:", v4, *MEMORY[0x1E0D375F8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "pluginPayloadDidChange:", 2);
  }

}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
