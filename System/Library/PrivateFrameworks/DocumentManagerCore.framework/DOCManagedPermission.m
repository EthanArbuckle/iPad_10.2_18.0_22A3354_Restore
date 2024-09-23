@implementation DOCManagedPermission

- (void)setHostAccountDataOwnerState:(unint64_t)a3
{
  self->_hostAccountDataOwnerState = a3;
}

+ (id)defaultPermission
{
  if (defaultPermission_onceToken != -1)
    dispatch_once(&defaultPermission_onceToken, &__block_literal_global_7);
  return (id)defaultPermission_manager;
}

- (void)setHostIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)adoptPersonaliCloudPersonaAndPerformBlock:(id)a3
{
  id v4;
  DOCManagedPermission *v5;
  void *v6;
  int v7;
  __CFString **v8;
  __CFString *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[DOCManagedPermission personaStringForDomainID](v5, "personaStringForDomainID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = FPIsCloudDocsWithFPFSEnabled();
  v8 = DOCDocumentSourceIdentifierICloudFPFS;
  if (!v7)
    v8 = DOCDocumentSourceIdentifierICloudFPv2;
  v9 = *v8;
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[DOCManagedPermission adoptPersona:andPerformBlock:](v5, "adoptPersona:andPerformBlock:", v10, v4);
  objc_sync_exit(v5);

  return v11;
}

- (NSDictionary)personaStringForDomainID
{
  return self->_personaStringForDomainID;
}

- (BOOL)adoptPersona:(id)a3 andPerformBlock:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isSystemPersona") & 1) != 0)
  {
    v20 = 0;
    v9 = (void *)objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v20);
    v10 = v20;
    v11 = docPersonaLogHandle;
    if (!docPersonaLogHandle)
    {
      DOCInitLogging();
      v11 = docPersonaLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_2090A2000, v11, OS_LOG_TYPE_DEFAULT, "Copying current Persona into context. Persona: (%@)", buf, 0xCu);
    }
    v12 = docPersonaLogHandle;
    if (v10)
    {
      if (!docPersonaLogHandle)
      {
        DOCInitLogging();
        v12 = docPersonaLogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[DOCManagedPermission adoptPersona:andPerformBlock:].cold.3();
    }
    else
    {
      if (!docPersonaLogHandle)
      {
        DOCInitLogging();
        v12 = docPersonaLogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v5;
        _os_log_impl(&dword_2090A2000, v12, OS_LOG_TYPE_DEFAULT, "Generating and Restoring Persona from String. Persona String: (%@)", buf, 0xCu);
      }
      objc_msgSend(v8, "generateAndRestorePersonaContextWithIdentityString:", v5);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = docPersonaLogHandle;
      if (v15)
      {
        v10 = (id)v15;
        if (!docPersonaLogHandle)
        {
          DOCInitLogging();
          v16 = docPersonaLogHandle;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[DOCManagedPermission adoptPersona:andPerformBlock:].cold.2();
      }
      else
      {
        if (!docPersonaLogHandle)
        {
          DOCInitLogging();
          v16 = docPersonaLogHandle;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2090A2000, v16, OS_LOG_TYPE_DEFAULT, "Executing Block with temporary Persona", buf, 2u);
        }
        v6[2](v6);
        v17 = docPersonaLogHandle;
        if (!docPersonaLogHandle)
        {
          DOCInitLogging();
          v17 = docPersonaLogHandle;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v9;
          _os_log_impl(&dword_2090A2000, v17, OS_LOG_TYPE_DEFAULT, "Restoring Persona from context : %@", buf, 0xCu);
        }
        objc_msgSend(v8, "restorePersonaWithSavedPersonaContext:", v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v14 = 1;
          goto LABEL_39;
        }
        v18 = docPersonaLogHandle;
        if (!docPersonaLogHandle)
        {
          DOCInitLogging();
          v18 = docPersonaLogHandle;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[DOCManagedPermission adoptPersona:andPerformBlock:].cold.1();
      }
    }
    v6[2](v6);
    v14 = 0;
LABEL_39:

    goto LABEL_40;
  }
  v13 = docPersonaLogHandle;
  if (!docPersonaLogHandle)
  {
    DOCInitLogging();
    v13 = docPersonaLogHandle;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_2090A2000, v13, OS_LOG_TYPE_DEFAULT, "App already has a persona that's not system, just execute the block. Persona: (%@)", buf, 0xCu);
  }
  v6[2](v6);
  v14 = 0;
LABEL_40:

  return v14;
}

- (DOCManagedPermission)init
{
  DOCManagedPermission *v2;
  DOCManagedPermission *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DOCManagedPermission;
  v2 = -[DOCManagedPermission init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_hostAccountDataOwnerState = 0;
    v4 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    -[DOCManagedPermission setCache:](v3, "setCache:", v4);

    v5 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    -[DOCManagedPermission setAppContainerIDCache:](v3, "setAppContainerIDCache:", v5);

    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[DOCManagedPermission setPersonaStringForDomainID:](v3, "setPersonaStringForDomainID:", v6);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_resetAllCachedPermissions, *MEMORY[0x24BE63740], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_resetAllCachedPermissions, *MEMORY[0x24BE63B58], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_resetAllCachedPermissions, *MEMORY[0x24BE63B50], 0);

  }
  return v3;
}

- (void)cachePersonaStringForProviders:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  DOCManagedPermission *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "personaIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v13 = self;
  objc_sync_enter(v13);
  -[DOCManagedPermission setPersonaStringForDomainID:](v13, "setPersonaStringForDomainID:", v5);
  objc_sync_exit(v13);

}

- (void)setPersonaStringForDomainID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void)setAppContainerIDCache:(id)a3
{
  objc_storeStrong((id *)&self->_appContainerIDCache, a3);
}

- (BOOL)canHostAppPerformAction:(unint64_t)a3 bundleIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;

  v7 = a4;
  -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCManagedPermission.m"), 279, CFSTR("Missing hostIdentifier"));

  }
  -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DOCManagedPermission canAppWithBundleIdentifier:performAction:bundleIdentifier:](self, "canAppWithBundleIdentifier:performAction:bundleIdentifier:", v9, a3, v7);

  return v10;
}

- (BOOL)canHostAppPerformAction:(unint64_t)a3 targetNode:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  unint64_t v13;
  void *v15;

  v7 = a4;
  -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCManagedPermission.m"), 257, CFSTR("Missing hostIdentifier"));

  }
  -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(CFSTR("com.apple.DocumentsApp"), "isEqualToString:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[DOCManagedPermission dataOwnerStateForBundleIdentifier:](self, "dataOwnerStateForBundleIdentifier:", v12);

    v11 = -[DOCManagedPermission canAppWithDataOwnerState:performAction:node:](self, "canAppWithDataOwnerState:performAction:node:", v13, a3, v7);
  }

  return v11;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (BOOL)canAppWithBundleIdentifier:(id)a3 performAction:(unint64_t)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  BOOL v14;

  v8 = a3;
  v9 = a5;
  if (!-[DOCManagedPermission hasOpenInRestrictions](self, "hasOpenInRestrictions"))
    goto LABEL_19;
  v10 = v9;
  if (!v10
    || (id)objc_opt_class() == v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v10, "length"))
  {

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(v10, "count");

      if (!v11)
        goto LABEL_19;
    }
    else
    {

    }
    v12 = v8;
    if (!v12
      || (id)objc_opt_class() == v12
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v12, "length"))
    {

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "count");

        if (!v13)
          goto LABEL_19;
      }
      else
      {

      }
      if ((objc_msgSend(CFSTR("com.apple.DocumentsApp"), "isEqualToString:", v12) & 1) == 0)
      {
        v14 = -[DOCManagedPermission canAppWithDataOwnerState:performAction:dataOwnerState:](self, "canAppWithDataOwnerState:performAction:dataOwnerState:", -[DOCManagedPermission dataOwnerStateForBundleIdentifier:](self, "dataOwnerStateForBundleIdentifier:", v12), a4, -[DOCManagedPermission dataOwnerStateForBundleIdentifier:](self, "dataOwnerStateForBundleIdentifier:", v10));
        goto LABEL_20;
      }
    }
  }
LABEL_19:
  v14 = 1;
LABEL_20:

  return v14;
}

- (BOOL)hasAnyEffectiveRestrictions
{
  if (-[DOCManagedPermission hasOpenInRestrictions](self, "hasOpenInRestrictions")
    || -[DOCManagedPermission isManagedAppsCloudSyncDisallowed](self, "isManagedAppsCloudSyncDisallowed")
    || !-[DOCManagedPermission isUSBAccessAllowed](self, "isUSBAccessAllowed")
    || !-[DOCManagedPermission isNetworkDriveAllowed](self, "isNetworkDriveAllowed"))
  {
    return 1;
  }
  else
  {
    return !-[DOCManagedPermission isLocalStorageAllowed](self, "isLocalStorageAllowed");
  }
}

- (BOOL)isUSBAccessAllowed
{
  -[DOCManagedPermission _loadSharedConnectionValues](self, "_loadSharedConnectionValues");
  return self->_isUSBAccessAllowed;
}

- (BOOL)hasOpenInRestrictions
{
  -[DOCManagedPermission _loadSharedConnectionValues](self, "_loadSharedConnectionValues");
  return self->_hasOpenInRestrictions;
}

- (BOOL)isNetworkDriveAllowed
{
  -[DOCManagedPermission _loadSharedConnectionValues](self, "_loadSharedConnectionValues");
  return self->_isNetworkDriveAccessInFilesAllowed;
}

- (void)_loadSharedConnectionValues
{
  DOCManagedPermission *v2;
  void *v3;
  DOCManagedPermission *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_didLoadSharedConnectionValues)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    obj->_mayOpenFromManagedToUnmanaged = objc_msgSend(v3, "mayOpenFromManagedToUnmanaged");
    obj->_mayOpenFromUnmanagedToManaged = objc_msgSend(v3, "mayOpenFromUnmanagedToManaged");
    obj->_isManagedAppsCloudSyncDisallowed = objc_msgSend(v3, "BOOLRestrictionForFeature:", *MEMORY[0x24BE639C8]) == 2;
    obj->_isUSBAccessAllowed = objc_msgSend(v3, "BOOLRestrictionForFeature:", *MEMORY[0x24BE63AE0]) != 2;
    obj->_isNetworkDriveAccessInFilesAllowed = objc_msgSend(v3, "isNetworkDriveAccessInFilesAllowed");
    obj->_isLocalStorageAllowed = objc_msgSend(v3, "isLocalStorageAllowed");
    obj->_hasOpenInRestrictions = objc_msgSend(v3, "isOpenInRestrictionInEffect");
    obj->_didLoadSharedConnectionValues = 1;

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (BOOL)isManagedAppsCloudSyncDisallowed
{
  -[DOCManagedPermission _loadSharedConnectionValues](self, "_loadSharedConnectionValues");
  return self->_isManagedAppsCloudSyncDisallowed;
}

- (BOOL)isLocalStorageAllowed
{
  -[DOCManagedPermission _loadSharedConnectionValues](self, "_loadSharedConnectionValues");
  return self->_isLocalStorageAllowed;
}

- (unint64_t)dataOwnerStateForBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;

  v4 = a3;
  if (!v4
    || (id)objc_opt_class() == v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v4, "length"))
  {

LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      goto LABEL_9;
  }
  else
  {

  }
  -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v8))
  {
    v9 = -[DOCManagedPermission hostAccountDataOwnerState](self, "hostAccountDataOwnerState");

    if (v9)
    {
      v6 = -[DOCManagedPermission hostAccountDataOwnerState](self, "hostAccountDataOwnerState");
      goto LABEL_10;
    }
  }
  else
  {

  }
  -[DOCManagedPermission cache](self, "cache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  containingBundleForBundle(v4, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v4;
  v14 = v13;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isAppManaged:", v14);

  if (v16)
    v6 = 1;
  else
    v6 = 2;

LABEL_10:
  return v6;
}

- (unint64_t)hostAccountDataOwnerState
{
  return self->_hostAccountDataOwnerState;
}

- (NSCache)cache
{
  return self->_cache;
}

- (unint64_t)userActionForConfiguration:(id)a3
{
  return objc_msgSend(a3, "forPickingFolders") ^ 1;
}

- (BOOL)canHostAppPerformAction:(unint64_t)a3 fileProviderDomain:(id)a4
{
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  BOOL v11;
  char v12;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  int v18;
  void *v19;
  unint64_t v20;
  void *v21;
  int v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  BOOL v27;
  _BOOL4 v28;
  void *v29;
  void *v30;

  v7 = a4;
  -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCManagedPermission.m"), 210, CFSTR("Missing hostIdentifier"));

  }
  v9 = -[DOCManagedPermission hasAnyEffectiveRestrictions](self, "hasAnyEffectiveRestrictions");
  v10 = v7;
  if (!v10
    || (id)objc_opt_class() == v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v10, "length"))
  {

    goto LABEL_10;
  }
  objc_opt_class();
  v11 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "count") == 0;

  v12 = 1;
  if (!v11 && v9)
  {
    objc_msgSend(v10, "providerID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(CFSTR("com.apple.FileProvider.LocalStorage"), "isEqualToString:", v14);

    if (v15)
    {
      v16 = -[DOCManagedPermission isLocalStorageAllowed](self, "isLocalStorageAllowed");
LABEL_17:
      v12 = v16;
      goto LABEL_11;
    }
    objc_msgSend(v10, "providerID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(CFSTR("com.apple.filesystems.UserFS.FileProvider"), "isEqualToString:", v17);

    if (v18)
    {
      if (!-[DOCManagedPermission isUSBAccessAllowed](self, "isUSBAccessAllowed"))
      {
        v12 = 0;
        goto LABEL_11;
      }
      -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[DOCManagedPermission dataOwnerStateForBundleIdentifier:](self, "dataOwnerStateForBundleIdentifier:", v19);

      v16 = -[DOCManagedPermission canAppWithDataOwnerState:performAction:dataOwnerState:](self, "canAppWithDataOwnerState:performAction:dataOwnerState:", v20, a3, 2);
      goto LABEL_17;
    }
    -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(CFSTR("com.apple.DocumentsApp"), "isEqualToString:", v21);

    if ((v22 & 1) == 0)
    {
      if (objc_msgSend(v10, "isiCloudDriveProvider"))
      {
        -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[DOCManagedPermission dataOwnerStateForBundleIdentifier:](self, "dataOwnerStateForBundleIdentifier:", v23);

        v25 = -[DOCManagedPermission dataOwnerStateForiCloudDomain:](self, "dataOwnerStateForiCloudDomain:", v10);
        v26 = -[DOCManagedPermission isLocalStorageAllowed](self, "isLocalStorageAllowed");
        v27 = -[DOCManagedPermission isManagedAppsCloudSyncAllowed](self, "isManagedAppsCloudSyncAllowed");
        v28 = -[DOCManagedPermission canAppWithDataOwnerState:performAction:dataOwnerState:](self, "canAppWithDataOwnerState:performAction:dataOwnerState:", v24, a3, v25);
        v12 = !v26;
        if (v26 && v28)
          v12 = v24 != 1 || v27;
      }
      else
      {
        objc_msgSend(v10, "topLevelBundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[DOCManagedPermission canHostAppPerformAction:bundleIdentifier:](self, "canHostAppPerformAction:bundleIdentifier:", a3, v29);

      }
      goto LABEL_11;
    }
LABEL_10:
    v12 = 1;
  }
LABEL_11:

  return v12;
}

- (BOOL)canHostAppPerformAction:(unint64_t)a3 legacyPickerExtension:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;

  v7 = a4;
  -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCManagedPermission.m"), 271, CFSTR("Missing hostIdentifier"));

  }
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DOCManagedPermission canHostAppPerformAction:bundleIdentifier:](self, "canHostAppPerformAction:bundleIdentifier:", a3, v9);

  return v10;
}

void __41__DOCManagedPermission_defaultPermission__block_invoke()
{
  DOCManagedPermission *v0;
  void *v1;

  v0 = objc_alloc_init(DOCManagedPermission);
  v1 = (void *)defaultPermission_manager;
  defaultPermission_manager = (uint64_t)v0;

}

- (void)resetAllCachedPermissions
{
  void *v2;
  DOCManagedPermission *obj;

  obj = self;
  objc_sync_enter(obj);
  -[DOCManagedPermission cache](obj, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  obj->_didLoadSharedConnectionValues = 0;
  objc_sync_exit(obj);

}

- (BOOL)mayOpenFromManagedToUnmanaged
{
  -[DOCManagedPermission _loadSharedConnectionValues](self, "_loadSharedConnectionValues");
  return self->_mayOpenFromManagedToUnmanaged;
}

- (BOOL)mayOpenFromUnmanagedToManaged
{
  -[DOCManagedPermission _loadSharedConnectionValues](self, "_loadSharedConnectionValues");
  return self->_mayOpenFromUnmanagedToManaged;
}

- (BOOL)isManagedAppsCloudSyncAllowed
{
  return !-[DOCManagedPermission isManagedAppsCloudSyncDisallowed](self, "isManagedAppsCloudSyncDisallowed");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *MEMORY[0x24BE63740]);
  objc_msgSend(v3, "removeObserver:", *MEMORY[0x24BE63B58]);
  objc_msgSend(v3, "removeObserver:", *MEMORY[0x24BE63B50]);

  v4.receiver = self;
  v4.super_class = (Class)DOCManagedPermission;
  -[DOCManagedPermission dealloc](&v4, sel_dealloc);
}

- (BOOL)canHostAppPerformAction:(unint64_t)a3 accountIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;

  v7 = a4;
  -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCManagedPermission.m"), 286, CFSTR("Missing hostIdentifier"));

  }
  -[DOCManagedPermission hostIdentifier](self, "hostIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DOCManagedPermission canAppWithBundleIdentifier:performAction:accountIdentifier:](self, "canAppWithBundleIdentifier:performAction:accountIdentifier:", v9, a3, v7);

  return v10;
}

- (BOOL)canItem:(id)a3 performAction:(unint64_t)a4 item:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;

  v8 = a5;
  v9 = -[DOCManagedPermission dataOwnerStateForNode:](self, "dataOwnerStateForNode:", a3);
  v10 = -[DOCManagedPermission dataOwnerStateForNode:](self, "dataOwnerStateForNode:", v8);

  return -[DOCManagedPermission canAppWithDataOwnerState:performAction:dataOwnerState:](self, "canAppWithDataOwnerState:performAction:dataOwnerState:", v9, a4, v10);
}

- (BOOL)canItems:(id)a3 performAction:(unint64_t)a4 fileProviderDomain:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "providerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(CFSTR("com.apple.FileProvider.LocalStorage"), "isEqualToString:", v11);

    if (v12)
    {
      v13 = -[DOCManagedPermission isLocalStorageAllowed](self, "isLocalStorageAllowed");
    }
    else
    {
      objc_msgSend(v8, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[DOCManagedPermission dataOwnerStateForNode:](self, "dataOwnerStateForNode:", v15);

      v13 = -[DOCManagedPermission canAppWithDataOwnerState:performAction:dataOwnerState:](self, "canAppWithDataOwnerState:performAction:dataOwnerState:", v16, a4, -[DOCManagedPermission dataOwnerStateForFPDomain:](self, "dataOwnerStateForFPDomain:", v9));
    }
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)canAppWithDataOwnerState:(unint64_t)a3 performAction:(unint64_t)a4 node:(id)a5
{
  return -[DOCManagedPermission canAppWithDataOwnerState:performAction:dataOwnerState:](self, "canAppWithDataOwnerState:performAction:dataOwnerState:", a3, a4, -[DOCManagedPermission dataOwnerStateForNode:](self, "dataOwnerStateForNode:", a5));
}

- (BOOL)canAppWithConfiguration:(id)a3 handleNode:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;

  v6 = a4;
  v7 = a3;
  v8 = -[DOCManagedPermission dataOwnerStateForConfiguration:](self, "dataOwnerStateForConfiguration:", v7);
  v9 = -[DOCManagedPermission userActionForConfiguration:](self, "userActionForConfiguration:", v7);

  LOBYTE(v7) = -[DOCManagedPermission canAppWithDataOwnerState:performAction:node:](self, "canAppWithDataOwnerState:performAction:node:", v8, v9, v6);
  return (char)v7;
}

- (BOOL)canAppWithBundleIdentifier:(id)a3 performAction:(unint64_t)a4 item:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  BOOL v12;

  v8 = a3;
  v9 = a5;
  if (!-[DOCManagedPermission hasOpenInRestrictions](self, "hasOpenInRestrictions"))
    goto LABEL_10;
  v10 = v8;
  if (!v10
    || (id)objc_opt_class() == v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v10, "length"))
  {

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(v10, "count");

      if (!v11)
        goto LABEL_10;
    }
    else
    {

    }
    if ((objc_msgSend(CFSTR("com.apple.DocumentsApp"), "isEqualToString:", v10) & 1) == 0)
    {
      v12 = -[DOCManagedPermission canAppWithDataOwnerState:performAction:dataOwnerState:](self, "canAppWithDataOwnerState:performAction:dataOwnerState:", -[DOCManagedPermission dataOwnerStateForBundleIdentifier:](self, "dataOwnerStateForBundleIdentifier:", v10), a4, -[DOCManagedPermission dataOwnerStateForNode:](self, "dataOwnerStateForNode:", v9));
      goto LABEL_11;
    }
  }
LABEL_10:
  v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)canAppWithBundleIdentifier:(id)a3 performAction:(unint64_t)a4 accountIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  BOOL v14;

  v8 = a3;
  v9 = a5;
  if (!-[DOCManagedPermission hasOpenInRestrictions](self, "hasOpenInRestrictions"))
    goto LABEL_19;
  v10 = v9;
  if (!v10
    || (id)objc_opt_class() == v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v10, "length"))
  {

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(v10, "count");

      if (!v11)
        goto LABEL_19;
    }
    else
    {

    }
    v12 = v8;
    if (!v12
      || (id)objc_opt_class() == v12
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v12, "length"))
    {

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "count");

        if (!v13)
          goto LABEL_19;
      }
      else
      {

      }
      if ((objc_msgSend(CFSTR("com.apple.DocumentsApp"), "isEqualToString:", v12) & 1) == 0)
      {
        v14 = -[DOCManagedPermission canAppWithDataOwnerState:performAction:dataOwnerState:](self, "canAppWithDataOwnerState:performAction:dataOwnerState:", -[DOCManagedPermission dataOwnerStateForBundleIdentifier:](self, "dataOwnerStateForBundleIdentifier:", v12), a4, -[DOCManagedPermission dataOwnerStateForAccountIdentifier:](self, "dataOwnerStateForAccountIdentifier:", v10));
        goto LABEL_20;
      }
    }
  }
LABEL_19:
  v14 = 1;
LABEL_20:

  return v14;
}

- (BOOL)canAppWithDataOwnerState:(unint64_t)a3 performAction:(unint64_t)a4 dataOwnerState:(unint64_t)a5
{
  int v7;
  int v8;
  _BOOL4 v9;
  _BOOL4 v10;
  BOOL v11;
  int v12;
  int v13;
  BOOL v14;
  int v15;

  v7 = a3 == 1;
  v8 = a5 == 1;
  v9 = -[DOCManagedPermission mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged");
  v10 = -[DOCManagedPermission mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged");
  v11 = 1;
  if (v7 != v8 && (!v9 || !v10))
  {
    if (a4 == 2)
      v12 = v8;
    else
      v12 = v7;
    if (a4 == 1)
      v13 = v8;
    else
      v13 = v7;
    if (v12)
      v14 = v13 == 0;
    else
      v14 = 0;
    v15 = !v14 || v9;
    if (v12)
      v11 = 1;
    else
      v11 = v10;
    if (!v13)
      v11 = 1;
    if (v15 != 1)
      v11 = 0;
    if (!a4)
      return 0;
  }
  return v11;
}

- (unint64_t)dataOwnerStateForNode:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[DOCManagedPermission dataOwnerStateForItem:](self, "dataOwnerStateForItem:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)MEMORY[0x24BDC82F8];
      objc_msgSend(v4, "providerDomainID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "providerDomainWithID:cachePolicy:error:", v7, 2, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v5 = -[DOCManagedPermission dataOwnerStateForFPDomain:](self, "dataOwnerStateForFPDomain:", v8);
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)dataOwnerStateForItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "providerID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) == 0
    && (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")) & 1) == 0
    && !objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")))
  {
    v10 = objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));

    if (v10)
      goto LABEL_5;
    objc_msgSend(v4, "providerDomainID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(CFSTR("com.apple.FileProvider.LocalStorage"), "isEqualToString:", v11);

    if (!v12)
    {
      objc_msgSend(v4, "providerID");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    objc_msgSend(v4, "parentItemIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDC8228]))
      {
        objc_msgSend(v4, "fp_appContainerBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      if (-[DOCManagedPermission hasAnyEffectiveRestrictions](self, "hasAnyEffectiveRestrictions"))
      {
        -[DOCManagedPermission appContainerBundleIDForFPItem:](self, "appContainerBundleIDForFPItem:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v6 = v15;
        if (v6)
        {
          if ((id)objc_opt_class() != v6)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "length"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = objc_msgSend(v6, "count");

                if (!v16)
                  goto LABEL_28;
              }
              else
              {

              }
LABEL_16:
              v7 = -[DOCManagedPermission dataOwnerStateForBundleIdentifier:](self, "dataOwnerStateForBundleIdentifier:", v6);
              goto LABEL_7;
            }
          }
        }

LABEL_28:
        v8 = 2;
        goto LABEL_9;
      }
    }
    v6 = 0;
    goto LABEL_28;
  }

LABEL_5:
  objc_msgSend(MEMORY[0x24BDC82F8], "providerDomainForItem:cachePolicy:error:", v4, 3, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8 = 0;
    goto LABEL_9;
  }
  v7 = -[DOCManagedPermission dataOwnerStateForiCloudDomain:](self, "dataOwnerStateForiCloudDomain:", v6);
LABEL_7:
  v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)dataOwnerStateForItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "providerDomainID", (_QWORD)v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "providerDomainID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) == 0)
          {
            v17 = docPersonaLogHandle;
            if (!docPersonaLogHandle)
            {
              DOCInitLogging();
              v17 = docPersonaLogHandle;
            }
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              -[DOCManagedPermission dataOwnerStateForItems:].cold.2();
            goto LABEL_21;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_21:

    v16 = -[DOCManagedPermission dataOwnerStateForNode:](self, "dataOwnerStateForNode:", v6);
  }
  else
  {
    v15 = docPersonaLogHandle;
    if (!docPersonaLogHandle)
    {
      DOCInitLogging();
      v15 = docPersonaLogHandle;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[DOCManagedPermission dataOwnerStateForItems:].cold.1();
    v16 = 0;
  }

  return v16;
}

- (unint64_t)dataOwnerStateForFPDomain:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(v4, "isiCloudDriveProvider"))
  {
    v5 = -[DOCManagedPermission dataOwnerStateForiCloudDomain:](self, "dataOwnerStateForiCloudDomain:", v4);
  }
  else
  {
    objc_msgSend(v4, "topLevelBundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = -[DOCManagedPermission dataOwnerStateForBundleIdentifier:](self, "dataOwnerStateForBundleIdentifier:", v6);
    v4 = (id)v6;
  }

  return v5;
}

- (unint64_t)dataOwnerStateForiCloudDomain:(id)a3
{
  id v5;
  unint64_t v6;
  void *v8;

  v5 = a3;
  if ((objc_msgSend(v5, "isiCloudDriveProvider") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCManagedPermission.m"), 530, CFSTR("Expect isiCloudDriveProvider to be true, check if DOCDocumentSourceIdentifierICloud is out of date"));

  }
  if (objc_msgSend(v5, "isEnterpriseDomain"))
    v6 = 1;
  else
    v6 = 2;

  return v6;
}

- (unint64_t)dataOwnerStateForAccountIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  ACAccountStore *v8;
  ACAccountStore *accountStore;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (!v4
    || (id)objc_opt_class() == v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v4, "length"))
  {
    v6 = 2;
    v7 = v4;
LABEL_18:

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_10;
  }
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
LABEL_10:
    if (!self->_accountStore)
    {
      v8 = (ACAccountStore *)objc_alloc_init(MEMORY[0x24BDB4398]);
      accountStore = self->_accountStore;
      self->_accountStore = v8;

    }
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACAccountStore accountWithIdentifier:](self->_accountStore, "accountWithIdentifier:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "aa_isManagedAppleID"))
        v6 = 1;
      else
        v6 = 2;
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_18;
  }
  v6 = 2;
LABEL_19:

  return v6;
}

- (unint64_t)dataOwnerStateForConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isContentManaged") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "hostIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[DOCManagedPermission dataOwnerStateForBundleIdentifier:](self, "dataOwnerStateForBundleIdentifier:", v6);

  }
  return v5;
}

- (id)defaultFileProviderForAppBundle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[DOCManagedPermission cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  containingBundleForBundle(v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v4;
  v9 = v8;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAppManaged:", v9);

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectRestrictionForFeature:", CFSTR("MCFeatureManagedAppsDefaultFileProviderAppBundleID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)queueFileDataForAcceptance:(id)a3 originalFileName:(id)a4 forBundleID:(id)a5 outError:(id *)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v9 = (void *)MEMORY[0x24BE63CB0];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "queueFileDataForAcceptance:originalFileName:forBundleID:outError:", v12, v11, v10, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)canCopyfromContainingBundleIdentifer:(id)a3
{
  return -[DOCManagedPermission canCopySourceIsContentManaged:](self, "canCopySourceIsContentManaged:", -[DOCManagedPermission dataOwnerStateForBundleIdentifier:](self, "dataOwnerStateForBundleIdentifier:", a3) == 1);
}

- (BOOL)canCopyItems:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[DOCManagedPermission hasOpenInRestrictions](self, "hasOpenInRestrictions")
    && !-[DOCManagedPermission mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (-[DOCManagedPermission dataOwnerStateForNode:](self, "dataOwnerStateForNode:", v11, (_QWORD)v15) == 1
            || (objc_msgSend(v11, "doc_isAppContainerRoot") & 1) != 0)
          {
LABEL_18:
            v5 = 0;
            goto LABEL_20;
          }
          objc_msgSend(v11, "providerDomainID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) != 0)
          {
            objc_msgSend(v11, "fp_appContainerBundleIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
              goto LABEL_18;
          }
          else
          {

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v5 = 1;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v5 = 1;
    }
LABEL_20:

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)canCopySourceIsContentManaged:(BOOL)a3
{
  if (-[DOCManagedPermission hasOpenInRestrictions](self, "hasOpenInRestrictions"))
    return -[DOCManagedPermission mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged") || !a3;
  else
    return 1;
}

- (id)appContainerBundleIDForFPItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  dispatch_semaphore_t dsema;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  dispatch_semaphore_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DOCManagedPermission appContainerIDCache](self, "appContainerIDCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[DOCManagedPermission appContainerIDCache](self, "appContainerIDCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v34;
    if (v34)
    {
      v8 = v34;
    }
    else
    {
      v46 = 0;
      v47 = &v46;
      v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__2;
      v50 = __Block_byref_object_dispose__2;
      v51 = 0;
      v12 = dispatch_semaphore_create(0);
      objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "itemID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __54__DOCManagedPermission_appContainerBundleIDForFPItem___block_invoke;
      v43[3] = &unk_24C0FEA10;
      v45 = &v46;
      dsema = v12;
      v44 = dsema;
      objc_msgSend(v13, "fetchParentsForItemID:recursively:completionHandler:", v14, 1, v43);

      v15 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(dsema, v15);
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      objc_msgSend((id)v47[5], "reverseObjectEnumerator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      if (v8)
      {
        v17 = *(_QWORD *)v40;
LABEL_7:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(v16);
          v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v18);
          objc_msgSend(v19, "fp_appContainerBundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20 == 0;

          if (!v21)
            break;
          if (v8 == (id)++v18)
          {
            v8 = (id)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
            if (v8)
              goto LABEL_7;
            goto LABEL_25;
          }
        }
        objc_msgSend(v19, "fp_appContainerBundleIdentifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_26;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v22 = (id)v47[5];
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v36 != v24)
                objc_enumerationMutation(v22);
              v26 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              if ((objc_msgSend(v26, "isRootItem") & 1) == 0)
              {
                -[DOCManagedPermission appContainerIDCache](self, "appContainerIDCache");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "itemID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKey:", v8, v28);

              }
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
          }
          while (v23);
        }

        -[DOCManagedPermission appContainerIDCache](self, "appContainerIDCache");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "itemID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v8, v30);

        -[DOCManagedPermission appContainerIDCache](self, "appContainerIDCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "parentItemID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v8, v31);

      }
LABEL_25:

LABEL_26:
      _Block_object_dispose(&v46, 8);

      v11 = 0;
    }

  }
  return v8;
}

void __54__DOCManagedPermission_appContainerBundleIDForFPItem___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)cleanAppContainerBundleIDCache
{
  id v2;

  -[DOCManagedPermission appContainerIDCache](self, "appContainerIDCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)allowedFileProviderBundleIdentifiersForHostBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  DOCManagedPermission *v15;

  v4 = a3;
  if (-[DOCManagedPermission hasAnyEffectiveRestrictions](self, "hasAnyEffectiveRestrictions"))
  {
    +[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHostIdentifier:", v4);

    v6 = (void *)MEMORY[0x24BDC82F8];
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __84__DOCManagedPermission_allowedFileProviderBundleIdentifiersForHostBundleIdentifier___block_invoke;
    v13 = &unk_24C0FEA38;
    v14 = v4;
    v15 = self;
    objc_msgSend(v6, "allowedFileProviderBundleIdentifiersFiltered:", &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __84__DOCManagedPermission_allowedFileProviderBundleIdentifiersForHostBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isAvailableSystemWide") & 1) != 0
    || (objc_msgSend(v3, "topLevelBundleIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)),
        v4,
        v5))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "canHostAppPerformAction:fileProviderDomain:", 0, v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)adoptPersonaFromItem:(id)a3 andPerformBlock:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[DOCManagedPermission personaStringFromItem:](self, "personaStringFromItem:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[DOCManagedPermission adoptPersona:andPerformBlock:](self, "adoptPersona:andPerformBlock:", v7, v6);

  return (char)self;
}

- (BOOL)adoptPersonaFromItems:(id)a3 andPerformBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  DOCManagedPermission *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v22 = self;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "providerDomainID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "providerDomainID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqual:", v15);

          if ((v16 & 1) == 0)
          {
            v19 = docPersonaLogHandle;
            if (!docPersonaLogHandle)
            {
              DOCInitLogging();
              v19 = docPersonaLogHandle;
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              -[DOCManagedPermission adoptPersonaFromItems:andPerformBlock:].cold.2();
            goto LABEL_21;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_21:

    -[DOCManagedPermission personaStringFromItem:](v22, "personaStringFromItem:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[DOCManagedPermission adoptPersona:andPerformBlock:](v22, "adoptPersona:andPerformBlock:", v20, v7);

  }
  else
  {
    v17 = docPersonaLogHandle;
    if (!docPersonaLogHandle)
    {
      DOCInitLogging();
      v17 = docPersonaLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[DOCManagedPermission adoptPersonaFromItems:andPerformBlock:].cold.1();
    v7[2](v7);
    v18 = 0;
  }

  return v18;
}

- (BOOL)adoptPersonaFromDomain:(id)a3 andPerformBlock:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "personaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[DOCManagedPermission adoptPersona:andPerformBlock:](self, "adoptPersona:andPerformBlock:", v7, v6);

  return (char)self;
}

- (BOOL)isCurrentPersonaEnterprise
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnterprisePersona");

  return v4;
}

- (id)personaStringFromItem:(id)a3
{
  id v4;
  DOCManagedPermission *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[DOCManagedPermission personaStringForDomainID](v5, "personaStringForDomainID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerDomainID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  if (!v8)
  {
    v9 = docPersonaLogHandle;
    if (!docPersonaLogHandle)
    {
      DOCInitLogging();
      v9 = docPersonaLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2090A2000, v9, OS_LOG_TYPE_DEFAULT, "No cached persona string, trying to fetch domain instead", buf, 2u);
    }
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDC82F8], "providerDomainForItem:cachePolicy:error:", v4, 3, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    if (v11 || !v10)
    {
      v12 = docPersonaLogHandle;
      if (!docPersonaLogHandle)
      {
        DOCInitLogging();
        v12 = docPersonaLogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[DOCManagedPermission personaStringFromItem:].cold.1((uint64_t)v11, v12);
      v8 = 0;
    }
    else
    {
      objc_msgSend(v10, "personaIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v8;
}

- (NSCache)appContainerIDCache
{
  return self->_appContainerIDCache;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_appContainerIDCache, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_personaStringForDomainID, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

- (void)dataOwnerStateForItems:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2090A2000, v0, v1, "Can't compute DataOwnerState for empty array of items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dataOwnerStateForItems:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2090A2000, v0, v1, "Trying to compute DataOwnerState for items from different domains. Using DataOwnerState from first item and try anyway", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)adoptPersonaFromItems:andPerformBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2090A2000, v0, v1, "Can't adopt persona from Items (items array is nil or empty, executing block anyway", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)adoptPersonaFromItems:andPerformBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2090A2000, v0, v1, "Trying to adopt persona from items from different domains. Adopting persona from first item and try anyway", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)adoptPersona:andPerformBlock:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2090A2000, v0, v1, "Could not restore current persona contex : Context: (%@) Error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)adoptPersona:andPerformBlock:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2090A2000, v0, v1, "Could not adopt persona: (%@) Error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)adoptPersona:andPerformBlock:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2090A2000, v0, v1, "Could not copy current persona contex: Persona: (%@) Error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)personaStringFromItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2090A2000, a2, OS_LOG_TYPE_ERROR, "Couldn't get domain to get the persona string to adopt : %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
