@implementation NTKCompanion3rdPartyApp

+ (id)companion3rdPartyRemoteApp:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *log;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_isValidApplication:", v6))
  {
    objc_msgSend(v6, "companionAppBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 1, &v24);
    v10 = v24;
    if (!v9)
    {
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:device:].cold.4();

    }
    objc_msgSend(v9, "applicationState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isValid");

    if (v13)
    {
      objc_msgSend(v9, "URL");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        -[NSObject URLByAppendingPathComponent:isDirectory:](v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("Watch"), 1);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_URLOfFirstItemWithExtension:inDirectory:", CFSTR("app"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlugIns"), 1);
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_URLOfFirstItemWithExtension:inDirectory:", CFSTR("appex"), v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
            log = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v9;
              _os_log_impl(&dword_1B72A3000, log, OS_LOG_TYPE_INFO, "%@ contains an extensionless watch app", buf, 0xCu);
            }

          }
        }
        else
        {
          _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:device:].cold.2();
          v20 = 0;
        }

      }
      else
      {
        _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:device:].cold.1();
        v20 = 0;
      }

    }
    else
    {
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:device:].cold.3();
      v20 = 0;
    }

    v21 = -[NTKCompanion3rdPartyApp _initWithDevice:remoteApplication:galleryBundles:watchKitBundle:]([NTKCompanion3rdPartyApp alloc], "_initWithDevice:remoteApplication:galleryBundles:watchKitBundle:", v7, v6, 0, v20);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_initWithDevice:(id)a3 remoteApplication:(id)a4 galleryBundles:(id)a5 watchKitBundle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "companionAppBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "watchKitAppExtensionBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NTKCompanion3rdPartyApp _initWithWatchAppId:containerAppId:complicationClientId:](self, "_initWithWatchAppId:containerAppId:complicationClientId:", v14, v15, v16);
  if (v17)
  {
    v37 = v15;
    v38 = v14;
    v40 = v10;
    objc_msgSend(v10, "nrDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDevice:", v18);

    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "databaseUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "sequenceNumber"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@-%@"), v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUniqueID:", v24);

    objc_msgSend(v17, "setInstalled:", objc_msgSend(v17, "_installStateFromAppConduitInstallState:", 2));
    v39 = v12;
    objc_msgSend(v12, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUrlToComplicationBundle:", v25);

    objc_msgSend(v17, "setUrlToWatchKitBundle:", v13);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v11, "supportedComplicationFamilies");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(v27);
          if (CLKComplicationFamilyFromString())
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v32);

          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v29);
    }

    if (objc_msgSend(v26, "count"))
      objc_msgSend(v17, "setSupportedFamilies:", v26);
    objc_msgSend(v17, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "length");

    v10 = v40;
    if (!v34)
    {
      objc_msgSend(v17, "localizedNameForRemoteApp:", v11);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setName:", v35);

    }
    v12 = v39;
    v15 = v37;
    v14 = v38;
  }

  return v17;
}

- (id)localizedNameForRemoteApp:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  v4 = *MEMORY[0x1E0C9AAC8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0C9AAC8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedInfoPlistStringsForKeys:fetchingFirstMatchingLocalizationInList:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(v3, "applicationName");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return v8;
}

- (id)_initWithWatchAppId:(id)a3 containerAppId:(id)a4 complicationClientId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTKCompanion3rdPartyApp *v11;
  NTKCompanion3rdPartyApp *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)NTKCompanion3rdPartyApp;
  v11 = -[NTKCompanion3rdPartyApp init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    -[NTKCompanionApp setWatchApplicationIdentifier:](v11, "setWatchApplicationIdentifier:", v8);
    -[NTKCompanionApp setContainerApplicationIdentifier:](v12, "setContainerApplicationIdentifier:", v9);
    -[NTKCompanion3rdPartyApp setComplicationClientIdentifier:](v12, "setComplicationClientIdentifier:", v10);
    -[NTKCompanionApp containerApplicationIdentifier](v12, "containerApplicationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0CA5870]);
      -[NTKCompanionApp containerApplicationIdentifier](v12, "containerApplicationIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v16 = (void *)objc_msgSend(v14, "initWithBundleIdentifier:allowPlaceholder:error:", v15, 1, &v23);
      v17 = v23;

      if (v16)
      {
        objc_msgSend(v16, "localizedName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCompanionApp setName:](v12, "setName:", v18);

        -[NTKCompanionApp name](v12, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v20)
        {
LABEL_9:

          goto LABEL_10;
        }
        objc_msgSend(v16, "localizedShortName");
        v21 = objc_claimAutoreleasedReturnValue();
        -[NTKCompanionApp setName:](v12, "setName:", v21);
      }
      else
      {
        _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[NTKCompanion3rdPartyApp _initWithWatchAppId:containerAppId:complicationClientId:].cold.1(v12, (uint64_t)v17, v21);
      }

      goto LABEL_9;
    }
  }
LABEL_10:

  return v12;
}

- (NSURL)urlToComplicationBundle
{
  NTKCompanion3rdPartyApp *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSURL *urlToComplicationBundle;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_galleryBundlesLoaded && !v2->_urlToComplicationBundle)
  {
    -[NTKCompanionApp containerApplicationIdentifier](v2, "containerApplicationIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKCompanion3rdPartyApp _urlsToGalleryBundleInApplicationWithContainerBundleId:](NTKCompanion3rdPartyApp, "_urlsToGalleryBundleInApplicationWithContainerBundleId:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    urlToComplicationBundle = v2->_urlToComplicationBundle;
    v2->_urlToComplicationBundle = (NSURL *)v5;

    v2->_galleryBundlesLoaded = 1;
  }
  objc_sync_exit(v2);

  return v2->_urlToComplicationBundle;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[NTKCompanionApp watchApplicationIdentifier](self, "watchApplicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NTKCompanionApp containerApplicationIdentifier](self, "containerApplicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[NTKCompanionApp watchApplicationIdentifier](self, "watchApplicationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "watchApplicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[NTKCompanionApp containerApplicationIdentifier](self, "containerApplicationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "containerApplicationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)appRegistrationDate
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[NTKCompanionApp containerApplicationIdentifier](self, "containerApplicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v10);
  v6 = v10;

  if (v5)
  {
    objc_msgSend(v5, "registrationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NTKCompanion3rdPartyApp _initWithWatchAppId:containerAppId:complicationClientId:].cold.1(self, (uint64_t)v6, v8);

    v7 = 0;
  }

  return v7;
}

- (BOOL)applicationHasBeenUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;

  v4 = a3;
  if (-[NTKCompanion3rdPartyApp isEqual:](self, "isEqual:", v4))
  {
    -[NTKCompanion3rdPartyApp uniqueID](self, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    v8 = v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)complication
{
  return +[NTKCompanionRemoteComplication complicationWithApp:](NTKCompanionRemoteComplication, "complicationWithApp:", self);
}

- (NSArray)supportedFamilies
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = self->_supportedFamilies;
  if (!v3)
  {
    -[NTKCompanion3rdPartyApp urlToComplicationBundle](self, "urlToComplicationBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB34D0];
      -[NTKCompanion3rdPartyApp urlToComplicationBundle](self, "urlToComplicationBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleWithURL:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[NTKComplicationBundleHelper supportedComplicationFamiliesForBundle:](NTKComplicationBundleHelper, "supportedComplicationFamiliesForBundle:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCompanion3rdPartyApp setSupportedFamilies:](self, "setSupportedFamilies:", v8);

    }
  }
  return v3;
}

- (void)install
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCompanionApp watchApplicationIdentifier](self, "watchApplicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCompanion3rdPartyApp device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__NTKCompanion3rdPartyApp_install__block_invoke;
  v7[3] = &unk_1E6BD1EE8;
  v7[4] = self;
  objc_msgSend(v3, "installApplication:onPairedDevice:completion:", v4, v5, v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("NTKCompanion3rdPartyAppInstallStartedNotification"), self);

}

void __34__NTKCompanion3rdPartyApp_install__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __34__NTKCompanion3rdPartyApp_install__block_invoke_cold_1(a1, (uint64_t)v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "setInstalled:", objc_msgSend(*(id *)(a1 + 32), "_installStateFromAppConduitInstallState:", a2));

}

+ (id)_URLOfFirstItemWithExtension:(id)a3 inDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  char v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, 0, 5, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;

  if (v8)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v8;
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v18 = v9;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "pathExtension");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v5);

          if ((v16 & 1) != 0)
          {
            v11 = v14;
            goto LABEL_12;
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v11)
          continue;
        break;
      }
LABEL_12:
      v9 = v18;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_isValidApplication:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (!v5)
  {
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[NTKCompanion3rdPartyApp _isValidApplication:].cold.1();

  }
  return v5 != 0;
}

+ (BOOL)_isValidComplicationsInformation:(id)a3
{
  uint64_t v3;
  NSObject *v4;

  v3 = objc_msgSend(a3, "count");
  if (!v3)
  {
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[NTKCompanion3rdPartyApp _isValidComplicationsInformation:].cold.1(v4);

  }
  return v3 != 0;
}

- (BOOL)_installStateFromAppConduitInstallState:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)_urlsToGalleryBundleInApplicationWithContainerBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v31 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v31);
  v6 = v31;
  if (!v5)
  {
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[NTKCompanion3rdPartyApp companion3rdPartyRemoteApp:device:].cold.4();

  }
  objc_msgSend(v5, "applicationState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInstalled");

  if (v9)
  {
    v24 = v6;
    v25 = v3;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v30 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v10;
    objc_msgSend(v10, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v30;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v17, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "hasSuffix:", CFSTR(".ckcomplication"));

          if (v19)
            objc_msgSend(v4, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v14);
    }

    v6 = v24;
    v3 = v25;
  }

  return v4;
}

- (NSString)complicationClientIdentifier
{
  return self->_complicationClientIdentifier;
}

- (void)setComplicationClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_complicationClientIdentifier, a3);
}

- (void)setUrlToComplicationBundle:(id)a3
{
  objc_storeStrong((id *)&self->_urlToComplicationBundle, a3);
}

- (NSURL)urlToWatchKitBundle
{
  return self->_urlToWatchKitBundle;
}

- (void)setUrlToWatchKitBundle:(id)a3
{
  objc_storeStrong((id *)&self->_urlToWatchKitBundle, a3);
}

- (void)setSupportedFamilies:(id)a3
{
  objc_storeStrong((id *)&self->_supportedFamilies, a3);
}

- (BOOL)isInstalled
{
  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (BOOL)galleryBundlesLoaded
{
  return self->_galleryBundlesLoaded;
}

- (void)setGalleryBundlesLoaded:(BOOL)a3
{
  self->_galleryBundlesLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_supportedFamilies, 0);
  objc_storeStrong((id *)&self->_urlToWatchKitBundle, 0);
  objc_storeStrong((id *)&self->_urlToComplicationBundle, 0);
  objc_storeStrong((id *)&self->_complicationClientIdentifier, 0);
}

+ (void)companion3rdPartyRemoteApp:device:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Error. Missing bundleURL from application proxy: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)companion3rdPartyRemoteApp:device:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Error. Missing .app from directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)companion3rdPartyRemoteApp:device:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Error. Missing application proxy for identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)companion3rdPartyRemoteApp:device:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, (uint64_t)v0, "App record missing for ID %@ - %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithWatchAppId:(void *)a1 containerAppId:(uint64_t)a2 complicationClientId:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "containerApplicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, v5, "App record missing for ID %@ - %@", v6);

  OUTLINED_FUNCTION_8();
}

void __34__NTKCompanion3rdPartyApp_install__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "watchApplicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, v5, "Installation failed for %@. Error: %@", v6);

  OUTLINED_FUNCTION_8();
}

+ (void)_isValidApplication:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Error. Missing watch application identifier in application description: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_isValidComplicationsInformation:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Error. The watch application is missing the list of complication families it supports", v1, 2u);
}

@end
