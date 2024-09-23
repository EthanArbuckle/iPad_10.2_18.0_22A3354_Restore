@implementation LSApplicationProxy

- (id)_initWithBundleUnit:(unsigned int)a3 context:(LSContext *)a4 bundleIdentifier:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v6 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if ((_DWORD)v6 && !a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[LSApplicationProxy _initWithBundleUnit:context:bundleIdentifier:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("LSApplicationProxy.m"), 290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleUnit == kCSStoreNullID || context != NULL"));
    goto LABEL_10;
  }
  if (!(_DWORD)v6 || !a4)
  {
    if (!a4)
    {
LABEL_11:
      v9 = 0;
      goto LABEL_12;
    }
    _LSDatabaseGetCacheGUID();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _LSDatabaseGetSequenceNumber());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_debug_impl(&dword_182882000, v12, OS_LOG_TYPE_DEBUG, "LaunchServices: failed to find bundle record for %@ {%@ %@}", buf, 0x20u);
    }

LABEL_10:
    goto LABEL_11;
  }
  v15 = 0;
  v9 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]([LSApplicationRecord alloc], "_initWithContext:bundleID:bundleData:error:", a4, v6, 0, &v15);
LABEL_12:
  v13 = -[LSApplicationProxy _initWithContext:bundleUnit:applicationRecord:bundleID:resolveAndDetach:](self, "_initWithContext:bundleUnit:applicationRecord:bundleID:resolveAndDetach:", a4, v6, v9, v8, 1);

  return v13;
}

- (id)_initWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 applicationRecord:(id)a5 bundleID:(id)a6 resolveAndDetach:(BOOL)a7
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  LaunchServices::DatabaseContext *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  _BOOL4 v30;
  unsigned int v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  uint64_t v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v30 = a7;
  v53 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v34 = a6;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3812000000;
  v48 = __Block_byref_object_copy__6;
  v49 = __Block_byref_object_dispose__7;
  v50 = 256;
  v51 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  if (v9)
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __94__LSApplicationProxy__initWithContext_bundleUnit_applicationRecord_bundleID_resolveAndDetach___block_invoke;
    v40[3] = &unk_1E103FCA0;
    v40[4] = &v45;
    v40[5] = &v41;
    objc_msgSend(v9, "_performBlockWithContext:", v40);
  }
  objc_msgSend(v9, "_iconFileNames");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(v9, "infoDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:ofClass:", CFSTR("CFBundleIcons"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }

  objc_autoreleasePoolPop(v10);
  v31 = *((_DWORD *)v42 + 6);
  v13 = v46;
  if (objc_msgSend(v9, "isPlaceholder"))
    v14 = 3;
  else
    v14 = 1;
  objc_msgSend(v9, "bundleIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (id)v15;
  else
    v17 = v34;
  objc_msgSend(v9, "bundleContainerURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dataContainerURLFromDatabase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exactBundleVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39.receiver = self;
  v39.super_class = (Class)LSApplicationProxy;
  v22 = -[LSBundleProxy _initWithBundleUnit:context:bundleType:bundleID:localizedName:bundleContainerURL:dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:](&v39, sel__initWithBundleUnit_context_bundleType_bundleID_localizedName_bundleContainerURL_dataContainerURL_resourcesDirectoryURL_iconsDictionary_iconFileNames_version_, v31, v13 + 6, v14, v17, 0, v18, v19, v20, v32, v33, v21);

  if (v22)
  {
    if (v30 && _LSDatabaseContextGetDetachProxyObjects(v23))
    {
      objc_msgSend(v9, "_resolveAllProperties");
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v9, "claimRecords");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "_resolveAllProperties");
          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
        }
        while (v25);
      }

      objc_msgSend(v9, "detach");
    }
    objc_storeStrong(v22 + 20, a5);
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v22;
}

void __94__LSApplicationProxy__initWithContext_bundleUnit_applicationRecord_bundleID_resolveAndDetach___block_invoke(uint64_t a1, id *a2, uint64_t a3, int a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *a2);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
}

- (id)bundleType
{
  __CFString *v3;

  -[LSApplicationRecord typeForInstallMachinery](self->_record, "typeForInstallMachinery");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[LSApplicationProxy isInstalled](self, "isInstalled"))
      v3 = CFSTR("User");
    else
      v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugInKitPlugins, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierVendorName, 0);
}

- (NSArray)activityTypes
{
  void *v2;
  void *v3;

  -[LSApplicationRecord userActivityTypes](self->_record, "userActivityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)teamID
{
  return -[LSBundleRecord teamIdentifier](self->_record, "teamIdentifier");
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LSApplicationProxy;
  if (-[LSApplicationProxy respondsToSelector:](&v5, sel_respondsToSelector_))
    return 1;
  else
    return +[LSApplicationRecord instancesRespondToSelector:](LSApplicationRecord, "instancesRespondToSelector:", a3);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  LSApplicationRecord *v3;

  v3 = self->_record;
  if (!v3)
  {
    if (forwardingTargetForSelector__once != -1)
      dispatch_once(&forwardingTargetForSelector__once, &__block_literal_global_3);
    v3 = (LSApplicationRecord *)(id)forwardingTargetForSelector__invalidRecord;
  }
  return v3;
}

- (LSApplicationRecord)correspondingApplicationRecord
{
  return self->_record;
}

+ (id)applicationProxyWithBundleUnitID:(unsigned int)a3 withContext:(LSContext *)a4
{
  void *v4;
  uint64_t v6;
  void *v8;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = *(_QWORD *)&a3;
    if (_LSBundleGet(a4->db, a3))
    {
      v8 = (void *)_CSStringCopyCFString();
      v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithBundleUnit:context:bundleIdentifier:", v6, a4, v8);

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

+ (id)applicationProxyForBundleType:(unint64_t)a3 identifier:(id)a4 isCompanion:(BOOL)a5 URL:(id)a6 itemID:(id)a7 bundleUnit:(unsigned int *)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v34;
  _QWORD v35[5];
  uint64_t v36;
  id *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v11 = a5;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v36 = 0;
  v37 = (id *)&v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  v41 = 0;
  if (!v14 || v11 || (objc_msgSend(a1, "canInstantiateFromDatabase") & 1) != 0)
  {
    v34 = 0;
    if (_LSContextInit(&v34))
    {
      LODWORD(v17) = 0;
    }
    else
    {
      if (v16)
        v18 = objc_msgSend(v16, "unsignedLongLongValue");
      else
        v18 = 0;
      v17 = _LSFindBundleWithInfo(&v34, a3, v14, v11, v15, v18, 0);
      v26 = objc_alloc((Class)a1);
      if (v11)
        v27 = 0;
      else
        v27 = v14;
      v28 = objc_msgSend(v26, "_initWithBundleUnit:context:bundleIdentifier:", v17, &v34, v27);
      v29 = v37[5];
      v37[5] = (id)v28;

      _LSContextDestroy(&v34);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v14, "isEqual:", v20);

    if (v21)
    {
      _LSDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        +[LSApplicationProxy applicationProxyForBundleType:identifier:isCompanion:URL:itemID:bundleUnit:].cold.1(v22);

      __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
      __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
      +[LSBundleProxy bundleProxyForCurrentProcess](LSBundleProxy, "bundleProxyForCurrentProcess");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong(v37 + 5, v23);
      }

    }
    if (!v37[5])
    {
      +[_LSApplicationProxyForIdentifierQuery queryWithIdentifier:](_LSApplicationProxyForIdentifierQuery, "queryWithIdentifier:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __97__LSApplicationProxy_applicationProxyForBundleType_identifier_isCompanion_URL_itemID_bundleUnit___block_invoke;
      v35[3] = &unk_1E103FC78;
      v35[4] = &v36;
      objc_msgSend(v25, "enumerateResolvedResultsOfQuery:withBlock:", v24, v35);

    }
    LODWORD(v17) = 0;
  }
  if (!v37[5])
  {
    objc_msgSend(a1, "applicationProxyForIdentifier:withContext:", v14, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v37[5];
    v37[5] = (id)v30;

  }
  if (a8)
    *a8 = v17;
  v32 = v37[5];
  _Block_object_dispose(&v36, 8);

  return v32;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LSApplicationProxy;
  v4 = a3;
  -[LSBundleProxy encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_record, CFSTR("record"), v5.receiver, v5.super_class);

}

- (LSApplicationProxy)initWithCoder:(id)a3
{
  id v4;
  LSApplicationProxy *v5;
  uint64_t v6;
  LSApplicationRecord *record;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSApplicationProxy;
  v5 = -[LSBundleProxy initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("record"));
    v6 = objc_claimAutoreleasedReturnValue();
    record = v5->_record;
    v5->_record = (LSApplicationRecord *)v6;

  }
  return v5;
}

+ (id)applicationProxyForIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "applicationProxyForBundleType:identifier:isCompanion:URL:itemID:bundleUnit:", 0, a3, 0, 0, 0, 0);
}

void __38__LSApplicationProxy_plugInKitPlugins__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "applicationExtensionRecords", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "uniqueIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[LSPlugInKitProxy pluginKitProxyForUUID:](LSPlugInKitProxy, "pluginKitProxyForUUID:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)groupContainerURLs
{
  return -[LSBundleRecord groupContainerURLs](self->_record, "groupContainerURLs");
}

- (_LSApplicationState)appState
{
  void *v3;
  void *v4;
  _LSApplicationState *v5;
  _LSApplicationState *v6;
  void *v7;

  -[LSApplicationRecord applicationState](self->_record, "applicationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = [_LSApplicationState alloc];
    -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_LSApplicationState initWithBundleIdentifier:stateFlags:ratingRank:installType:](v6, "initWithBundleIdentifier:stateFlags:ratingRank:installType:", v7, 0, 0, 0);

  }
  return v5;
}

- (int64_t)deviceManagementPolicy
{
  int64_t result;
  LaunchServices::DMFSupport *v4;
  NSString *v5;
  int64_t v6;

  if (DeviceManagementLibrary_frameworkLibrary
    || (result = (int64_t)dlopen("/System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement", 2), (DeviceManagementLibrary_frameworkLibrary = result) != 0))
  {
    -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
    v4 = (LaunchServices::DMFSupport *)objc_claimAutoreleasedReturnValue();
    v6 = _LSGetDMFPolicy(v4, v5);

    return v6;
  }
  return result;
}

- (NSString)genre
{
  void *v2;
  void *v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "genre");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)subgenres
{
  void *v2;
  void *v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subgenres");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSNumber)genreID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "genreIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (id)dataContainerURL
{
  return -[LSBundleRecord dataContainerURL](self->_record, "dataContainerURL");
}

- (BOOL)profileValidated
{
  return -[LSBundleRecord isProfileValidated](self->_record, "isProfileValidated");
}

- (BOOL)isNewsstandApp
{
  return (-[LSApplicationRecord _rawBundleFlags](self->_record, "_rawBundleFlags") >> 16) & 1;
}

- (id)_managedPersonas
{
  return -[LSApplicationRecord managedPersonas](self->_record, "managedPersonas");
}

- (id)environmentVariables
{
  return -[LSApplicationRecord additionalEnvironmentVariables](self->_record, "additionalEnvironmentVariables");
}

+ (id)applicationProxyForIdentifier:(id)a3 placeholder:(BOOL)a4
{
  uint64_t v5;

  if (a4)
    v5 = 3;
  else
    v5 = 1;
  return (id)objc_msgSend(a1, "applicationProxyForBundleType:identifier:isCompanion:URL:itemID:bundleUnit:", v5, a3, 0, 0, 0, 0);
}

- (NSDictionary)siriActionDefinitionURLs
{
  return -[LSBundleRecord intentDefinitionURLs](self->_record, "intentDefinitionURLs");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)localizedNameForContext:(id)a3 preferredLocalizations:(id)a4 useShortNameOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  LSApplicationRecord *record;
  LSApplicationRecord *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if (v5)
    {
      _LSDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[LSApplicationProxy(Localization) localizedNameForContext:preferredLocalizations:useShortNameOnly:].cold.1((uint64_t)v8, v10);

    }
    record = self->_record;
    if (v9)
      -[LSApplicationRecord localizedNameWithContext:preferredLocalizations:](record, "localizedNameWithContext:preferredLocalizations:", v8, v9);
    else
      -[LSApplicationRecord localizedNameWithContext:](record, "localizedNameWithContext:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = self->_record;
    if (v5)
    {
      if (v9)
        -[LSBundleRecord localizedShortNameWithPreferredLocalizations:](v12, "localizedShortNameWithPreferredLocalizations:", v9);
      else
        -[LSBundleRecord localizedShortName](v12, "localizedShortName");
    }
    else if (v9)
    {
      -[LSBundleRecord localizedNameWithPreferredLocalizations:](v12, "localizedNameWithPreferredLocalizations:", v9);
    }
    else
    {
      -[LSBundleRecord localizedName](v12, "localizedName");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!objc_msgSend(v13, "length"))
    {
      -[LSBundleRecord _fallbackLocalizedName](self->_record, "_fallbackLocalizedName");
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
  }

  return v14;
}

- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4
{
  return -[LSApplicationProxy localizedNameForContext:preferredLocalizations:useShortNameOnly:](self, "localizedNameForContext:preferredLocalizations:useShortNameOnly:", 0, a3, a4);
}

- (BOOL)isBetaApp
{
  return -[LSApplicationRecord isBeta](self->_record, "isBeta");
}

- (NSArray)plugInKitPlugins
{
  LSApplicationProxy *v2;
  NSArray *plugInKitPlugins;
  id v4;
  id v5;
  uint64_t v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  LSApplicationProxy *v14;
  id v15;

  v2 = self;
  objc_sync_enter(v2);
  plugInKitPlugins = v2->_plugInKitPlugins;
  if (!plugInKitPlugins)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __38__LSApplicationProxy_plugInKitPlugins__block_invoke;
    v13 = &unk_1E103FCC8;
    v14 = v2;
    v5 = v4;
    v15 = v5;
    __LSRECORD_IS_CONSTRUCTING_A_COMPATIBILITY_OBJECT__((uint64_t)&v10);
    v6 = objc_msgSend(v5, "copy", v10, v11, v12, v13, v14);
    v7 = v2->_plugInKitPlugins;
    v2->_plugInKitPlugins = (NSArray *)v6;

    plugInKitPlugins = v2->_plugInKitPlugins;
  }
  v8 = plugInKitPlugins;
  objc_sync_exit(v2);

  return v8;
}

- (void)detach
{
  -[LSRecord _resolveAllProperties](self->_record, "_resolveAllProperties");
  -[LSRecord detach](self->_record, "detach");
}

+ (id)applicationProxyForIdentifier:(id)a3 withContext:(LSContext *)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  if (a4)
    v7 = _LSFindBundleWithInfo(a4, 0, v6, 0, 0, 0, 0);
  else
    v7 = 0;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithBundleUnit:context:bundleIdentifier:", v7, a4, v6);

  return v8;
}

void __97__LSApplicationProxy_applicationProxyForBundleType_identifier_isCompanion_URL_itemID_bundleUnit___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

+ (id)applicationProxyForCompanionIdentifier:(id)a3
{
  void *v3;
  int v5;

  v5 = 0;
  objc_msgSend(a1, "applicationProxyForBundleType:identifier:isCompanion:URL:itemID:bundleUnit:", 0, a3, 1, 0, 0, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !v5)
  {

    v3 = 0;
  }
  return v3;
}

+ (id)applicationProxyForSystemPlaceholder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = 0;
  objc_msgSend(a1, "applicationProxyForBundleType:identifier:isCompanion:URL:itemID:bundleUnit:", 7, v4, 0, 0, 0, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !v8)
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "No system placeholder found with identifier %@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)applicationProxyForBundleURL:(id)a3
{
  return (id)objc_msgSend(a1, "applicationProxyForBundleType:identifier:isCompanion:URL:itemID:bundleUnit:", 0, 0, 0, a3, 0, 0);
}

+ (id)applicationProxyForItemID:(id)a3
{
  void *v3;
  int v5;

  v5 = 0;
  objc_msgSend(a1, "applicationProxyForBundleType:identifier:isCompanion:URL:itemID:bundleUnit:", 1, 0, 0, 0, a3, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !v5)
  {

    v3 = 0;
  }
  return v3;
}

- (NSString)companionApplicationIdentifier
{
  return 0;
}

- (NSDate)registeredDate
{
  return -[LSBundleRecord registrationDate](self->_record, "registrationDate");
}

- (NSNumber)itemID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "storeItemIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSString)vendorName
{
  void *v2;
  void *v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artistName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)itemName
{
  void *v2;
  void *v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)storeCohortMetadata
{
  void *v2;
  void *v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeCohort");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)preferredArchitecture
{
  return -[LSApplicationRecord _preferredLaunchArchitecture](self->_record, "_preferredLaunchArchitecture");
}

- (void)clearAdvertisingIdentifier
{
  -[LSApplicationRecord clearAdvertisingIdentifier](self->_record, "clearAdvertisingIdentifier");
}

- (NSProgress)installProgress
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[LSApplicationProxy appState](self, "appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaceholder");

  if (v4)
  {
    +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "installProgressForBundleID:makeSynchronous:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSProgress *)v7;
}

- (NSNumber)staticDiskUsage
{
  void *v2;
  void *v3;

  -[LSApplicationProxy diskUsage](self, "diskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "staticUsage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)dynamicDiskUsage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[LSApplicationProxy diskUsage](self, "diskUsage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[LSApplicationProxy diskUsage](self, "diskUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "onDemandResourcesUsage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "unsignedLongLongValue") + objc_msgSend(v4, "unsignedLongLongValue"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
      v8 = v4;
    else
      v8 = v6;
    v7 = v8;
  }
  v9 = v7;

  return (NSNumber *)v9;
}

- (NSNumber)ODRDiskUsage
{
  void *v2;
  void *v3;

  -[LSApplicationProxy diskUsage](self, "diskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onDemandResourcesUsage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (BOOL)isInstalled
{
  void *v2;
  char v3;

  -[LSApplicationProxy appState](self, "appState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInstalled");

  return v3;
}

- (BOOL)isPlaceholder
{
  void *v2;
  char v3;

  -[LSApplicationProxy appState](self, "appState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaceholder");

  return v3;
}

- (BOOL)isRestricted
{
  void *v2;
  char v3;

  -[LSApplicationProxy appState](self, "appState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRestricted");

  return v3;
}

- (BOOL)isRemovedSystemApp
{
  return 0;
}

- (NSString)applicationDSID
{
  void *v2;
  void *v3;

  -[LSApplicationProxy purchaserDSID](self, "purchaserDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)purchaserDSID
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[LSApplicationRecord applicationDSID](self->_record, "applicationDSID"));
}

- (NSNumber)downloaderDSID
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[LSApplicationRecord applicationDownloaderDSID](self->_record, "applicationDownloaderDSID"));
}

- (NSNumber)familyID
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[LSApplicationRecord applicationFamilyID](self->_record, "applicationFamilyID"));
}

- (unint64_t)installType
{
  if (-[LSApplicationProxy isPlaceholder](self, "isPlaceholder"))
    return -[LSApplicationProxy originalInstallType](self, "originalInstallType");
  else
    return 0;
}

- (unint64_t)originalInstallType
{
  return -[LSApplicationRecord installType](self->_record, "installType");
}

- (NSArray)requiredDeviceCapabilities
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[LSApplicationRecord requiredDeviceCapabilities](self->_record, "requiredDeviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__LSApplicationProxy_requiredDeviceCapabilities__block_invoke;
    v7[3] = &unk_1E103FCF0;
    v8 = v3;
    v4 = v3;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v7);
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

void __48__LSApplicationProxy_requiredDeviceCapabilities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (NSArray)deviceFamily
{
  return -[LSApplicationRecord deviceFamilies](self->_record, "deviceFamilies");
}

- (NSString)appIDPrefix
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v7;

  v7 = 0;
  -[LSBundleRecord applicationIdentifier](self->_record, "applicationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    _LSSplitApplicationIdentifier(v2, &v7, 0);
    v4 = v7;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return (NSString *)v5;
}

- (NSNumber)storeFront
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "storeFront"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)externalVersionIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "versionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)betaExternalVersionIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "betaVersionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)ratingRank
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "ratingRank"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSString)ratingLabel
{
  void *v2;
  void *v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ratingLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sourceAppIdentifier
{
  void *v2;
  void *v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)applicationVariant
{
  void *v2;
  void *v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variantID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isAppUpdate
{
  return -[LSApplicationRecord isUpdate](self->_record, "isUpdate");
}

- (BOOL)isWhitelisted
{
  id *v3;
  void *v4;

  +[LSApplicationRestrictionsManager sharedInstance]();
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:](v3, v4, -[LSApplicationRecord _rawBundleFlags](self->_record, "_rawBundleFlags")) ^ 1;

  return (char)self;
}

- (BOOL)isDeviceBasedVPP
{
  void *v2;
  char v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeviceBasedVPP");

  return v3;
}

- (BOOL)supportsODR
{
  return -[LSApplicationRecord supportsOnDemandResources](self->_record, "supportsOnDemandResources");
}

- (BOOL)fileSharingEnabled
{
  return -[LSApplicationRecord isFileSharingEnabled](self->_record, "isFileSharingEnabled");
}

- (BOOL)iconIsPrerendered
{
  return 0;
}

- (BOOL)iconUsesAssetCatalog
{
  return 0;
}

- (BOOL)isPurchasedReDownload
{
  void *v2;
  char v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPurchasedRedownload");

  return v3;
}

- (BOOL)hasMIDBasedSINF
{
  return -[LSApplicationRecord applicationHasMIDBasedSINF](self->_record, "applicationHasMIDBasedSINF");
}

- (BOOL)missingRequiredSINF
{
  return -[LSApplicationRecord applicationMissingRequiredSINF](self->_record, "applicationMissingRequiredSINF");
}

- (BOOL)isDeletableIgnoringRestrictions
{
  return (-[LSApplicationRecord _rawBundleFlags](self->_record, "_rawBundleFlags") >> 40) & 1;
}

- (BOOL)_usesSystemPersona
{
  return (-[LSApplicationRecord _rawBundleFlags](self->_record, "_rawBundleFlags") >> 56) & 1;
}

- (BOOL)isRemoveableSystemApp
{
  return 0;
}

- (BOOL)isWatchKitApp
{
  return 0;
}

- (NSString)complicationPrincipalClass
{
  return 0;
}

- (BOOL)isGameCenterEnabled
{
  void *v2;
  char v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGameCenterEnabled");

  return v3;
}

- (BOOL)gameCenterEverEnabled
{
  void *v2;
  char v3;

  -[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wasGameCenterEverEnabled");

  return v3;
}

- (NSNumber)installFailureReason
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[LSApplicationRecord placeholderFailureReason](self->_record, "placeholderFailureReason"));
}

- (void)setAlternateIconName:(id)a3 withResult:(id)a4
{
  -[LSApplicationRecord setAlternateIconName:completionHandler:](self->_record, "setAlternateIconName:completionHandler:", a3, a4);
}

- (id)alternateIconName
{
  return -[LSApplicationRecord alternateIconName](self->_record, "alternateIconName");
}

- (id)primaryIconDataForVariant:(int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  if (IconServicesLibrary_frameworkLibrary
    || (v5 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary = (uint64_t)v5) != 0))
  {
    softLink_ISPrimaryIconDataForApplicationProxy(self, v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)iconDataForVariant:(int)a3
{
  return -[LSApplicationProxy iconDataForVariant:withOptions:](self, "iconDataForVariant:withOptions:", *(_QWORD *)&a3, 0);
}

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (IconServicesLibrary_frameworkLibrary
    || (v7 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary = (uint64_t)v7) != 0))
  {
    ((void (*)(void *, uint64_t, uint64_t))softLink_ISIconDataForResourceProxy[0])(self, v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)getDeviceManagementPolicyWithCompletionHandler:(id)a3
{
  -[LSApplicationRecord getDeviceManagementPolicyWithCompletionHandler:](self->_record, "getDeviceManagementPolicyWithCompletionHandler:", a3);
}

- (NSSet)claimedDocumentContentTypes
{
  id v3;
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

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[LSBundleRecord claimRecords](self->_record, "claimRecords", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "typeIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)claimedURLSchemes
{
  id v3;
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

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[LSBundleRecord claimRecords](self->_record, "claimRecords", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "URLSchemes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (id)handlerRankOfClaimForContentType:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __CFString *v18;
  int v19;
  void *v20;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationProxy.m"), 966, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("typeIdentifier != nil"));

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[LSBundleRecord claimRecords](self->_record, "claimRecords");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    v9 = 0x8000;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "typeIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v13);
              if (!objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "caseInsensitiveCompare:", v5))
              {
                objc_msgSend(v11, "handlerRank");
                v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v19 = _LSNumericHandlerRankFromHandlerRankString(v18);

                if (v9 <= v19)
                  v9 = v19;
                goto LABEL_19;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v15)
              continue;
            break;
          }
        }
LABEL_19:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0x8000;
  }

  v20 = _LSCopyHandlerRankStringFromNumericHandlerRank(v9);
  return v20;
}

- (NSNumber)platform
{
  uint64_t v2;
  void *v3;

  v2 = -[LSBundleRecord platform](self->_record, "platform");
  if ((_DWORD)v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (BOOL)isStandaloneWatchApp
{
  return 0;
}

- (BOOL)getGenericTranslocationTargetURL:(id *)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[LSApplicationProxy getGenericTranslocationTargetURL:error:]", 1016, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)getBundleMetadata
{
  return -[LSApplicationRecord bundleMetadataReturningError:](self->_record, "bundleMetadataReturningError:", 0);
}

- (id)installProgressSync
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[LSApplicationProxy appState](self, "appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaceholder");

  if (v4)
  {
    +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "installProgressForBundleID:makeSynchronous:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int)bundleModTime
{
  return -[LSApplicationRecord _bundleModTime](self->_record, "_bundleModTime");
}

- (BOOL)UPPValidated
{
  return -[LSBundleRecord isUPPValidated](self->_record, "isUPPValidated");
}

- (BOOL)freeProfileValidated
{
  return -[LSBundleRecord isFreeProfileValidated](self->_record, "isFreeProfileValidated");
}

- (id)signerOrganization
{
  return -[LSBundleRecord signerOrganization](self->_record, "signerOrganization");
}

- (id)signerIdentity
{
  return -[LSBundleRecord signerIdentity](self->_record, "signerIdentity");
}

- (id)_stringLocalizerForTable:(id)a3
{
  LSApplicationRecord *record;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  _LSStringLocalizer *v10;
  void *v11;
  _LSStringLocalizer *v12;
  uint64x2_t v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  record = self->_record;
  v5 = a3;
  v6 = -[LSBundleRecord platform](record, "platform");
  -[LSBundleRecord SDKVersion](self->_record, "SDKVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LSVersionNumberMakeWithString(v14, v7);
  v8 = _LSMakeDYLDVersionFromVersionNumber(v14);

  v9 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:sdkVersion:](_LSStringLocalizer, "useLegacyLocalizationListForPlatform:sdkVersion:", v6, v8);
  v10 = [_LSStringLocalizer alloc];
  -[LSBundleProxy bundleURL](self, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_LSStringLocalizer initWithBundleURL:stringsFile:legacyLocalizationList:](v10, "initWithBundleURL:stringsFile:legacyLocalizationList:", v11, v5, v9);

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)LSApplicationProxy;
  -[LSApplicationProxy description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleProxy bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleProxy bundleURL](self, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationProxy appState](self, "appState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[LSApplicationProxy installType](self, "installType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@ <%@:%@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __50__LSApplicationProxy_forwardingTargetForSelector___block_invoke()
{
  id v0;
  void *v1;

  v0 = -[LSRecord _initInvalid]([LSApplicationRecord alloc], "_initInvalid");
  v1 = (void *)forwardingTargetForSelector__invalidRecord;
  forwardingTargetForSelector__invalidRecord = (uint64_t)v0;

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LSApplicationProxy;
  -[LSApplicationProxy methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[LSApplicationRecord instanceMethodSignatureForSelector:](LSApplicationRecord, "instanceMethodSignatureForSelector:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  return (id)-[LSApplicationRecord valueForKey:](self->_record, "valueForKey:", a3);
}

- (BOOL)userInitiatedUninstall
{
  return self->_userInitiatedUninstall;
}

- (void)setUserInitiatedUninstall:(BOOL)a3
{
  self->_userInitiatedUninstall = a3;
}

- (id)localizedNameForContext:(id)a3
{
  return -[LSApplicationProxy localizedNameForContext:preferredLocalizations:useShortNameOnly:](self, "localizedNameForContext:preferredLocalizations:useShortNameOnly:", a3, 0, 0);
}

- (id)localizedNameForContext:(id)a3 preferredLocalizations:(id)a4
{
  return -[LSApplicationProxy localizedNameForContext:preferredLocalizations:useShortNameOnly:](self, "localizedNameForContext:preferredLocalizations:useShortNameOnly:", a3, a4, 0);
}

+ (void)applicationProxyForBundleType:(os_log_t)log identifier:isCompanion:URL:itemID:bundleUnit:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "+[LSApplicationProxy applicationProxyFor*] is not a supported method for getting the LSApplicationProxy for the current process, use +[LSBundleProxy bundleProxyForCurrentProcess] instead.", v1, 2u);
}

@end
