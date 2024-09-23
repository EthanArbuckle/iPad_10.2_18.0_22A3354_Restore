@implementation FPDDomain

- (FPDProvider)provider
{
  return (FPDProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (FPDDomainIndexer)indexer
{
  return self->_indexer;
}

- (BOOL)unableToStartup
{
  return self->_unableToStartup;
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSString)providerDomainID
{
  return self->_providerDomainID;
}

- (BOOL)isHiddenByUser
{
  void *v2;
  char v3;

  -[FPDDomain nsDomain](self, "nsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHiddenByUser");

  return v3;
}

- (NSFileProviderDomain)nsDomainOrNilForDefault
{
  return self->_nsDomainOrNilForDefault;
}

- (FPDVolume)volume
{
  FPDVolume *volume;
  void *v4;
  NSObject *v5;

  volume = self->_volume;
  if (!volume)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ FPDDomain must have a volume attached"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomain volume]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 212, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  }
  return volume;
}

- (void)setNsDomainOrNilForDefault:(id)a3
{
  id v5;
  void *v6;
  NSFileProviderDomain *v7;
  void *v8;
  char v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  NSFileProviderDomain *v15;
  id v16;
  id location;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[FPDDomainBackend backingStoreIdentity](self->_defaultBackend, "backingStoreIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackingStoreIdentity:", v6);

  v7 = self->_nsDomain;
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0CAAB38]);

  if ((v9 & 1) == 0)
    objc_storeStrong((id *)&self->_nsDomainOrNilForDefault, a3);
  if (v5)
    objc_storeStrong((id *)&self->_nsDomain, a3);
  -[FPDDomain refreshConnectionState](self, "refreshConnectionState");
  if (self->_defaultBackend && (objc_opt_respondsToSelector() & 1) != 0)
    -[FPDDomainBackend didChangeDomainConfiguration:](self->_defaultBackend, "didChangeDomainConfiguration:", v7);
  if (-[NSFileProviderDomain isHidden](v7, "isHidden"))
    v10 = 1;
  else
    v10 = -[NSFileProviderDomain isHiddenByUser](v7, "isHiddenByUser");
  if ((objc_msgSend(v5, "isHidden") & 1) != 0)
  {
    v11 = 1;
    if (!v7)
      goto LABEL_17;
  }
  else
  {
    v11 = objc_msgSend(v5, "isHiddenByUser");
    if (!v7)
      goto LABEL_17;
  }
  if (v10 != v11)
  {
    location = 0;
    objc_initWeak(&location, self);
    -[FPDDomain indexer](self, "indexer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FPDDomain userEnabled](self, "userEnabled") & (v11 ^ 1);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__FPDDomain_setNsDomainOrNilForDefault___block_invoke;
    v14[3] = &unk_1E8C771B8;
    objc_copyWeak(&v16, &location);
    v15 = v7;
    objc_msgSend(v12, "setIndexingEnabled:completionHandler:", v13, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
LABEL_17:

}

- (BOOL)supportsSyncingTrash
{
  void *v2;
  char v3;

  -[FPDDomain nsDomain](self, "nsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSyncingTrash");

  return v3;
}

- (NSFileProviderDomain)nsDomain
{
  return self->_nsDomain;
}

- (BOOL)userEnabled
{
  void *v2;
  char v3;

  -[FPDDomain nsDomain](self, "nsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userEnabled");

  return v3;
}

- (BOOL)ejectable
{
  return self->_ejectable;
}

- (NSDictionary)domainUserInfo
{
  return self->_domainUserInfo;
}

- (unint64_t)disconnectionState
{
  FPDProvider **p_provider;
  id WeakRetained;
  int v6;
  id v7;
  void *v8;
  char v9;

  if (self->_fpfsTestingBackendClass)
    return 1;
  p_provider = &self->_provider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v6 = objc_msgSend(WeakRetained, "isAppExtensionReachable");

  if (!v6)
    return 5;
  if (-[NSFileProviderDomain isDisconnected](self->_nsDomain, "isDisconnected"))
  {
    if ((-[NSFileProviderDomain _disconnectionOptions](self->_nsDomain, "_disconnectionOptions") & 1) != 0)
      return 3;
    else
      return 4;
  }
  else if (-[FPDDomain _shouldDisconnectDueToLowDiskSpace](self, "_shouldDisconnectDueToLowDiskSpace"))
  {
    return 6;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_provider);
    objc_msgSend(v7, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "disallowedByMDM");

    if ((v9 & 1) != 0)
    {
      return 8;
    }
    else
    {
      if (!self->_unableToStartup)
        return 1;
      if ((-[NSError fp_isFileProviderInternalError:](self->_startupError, "fp_isFileProviderInternalError:", 22) & 1) != 0)
      {
        return 7;
      }
      else if (-[NSError fp_isFileProviderInternalError:](self->_startupError, "fp_isFileProviderInternalError:", 23))
      {
        return 9;
      }
      else
      {
        return 2;
      }
    }
  }
}

- (BOOL)_shouldDisconnectDueToLowDiskSpace
{
  FPDDomain *v2;
  NSNumber *shouldDisconnectDueToLowDiskSpace;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSNumber *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  shouldDisconnectDueToLowDiskSpace = v2->_shouldDisconnectDueToLowDiskSpace;
  if (!shouldDisconnectDueToLowDiskSpace)
  {
    -[FPDDomain volume](v2, "volume");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v4 = v5 != 0;
    if (v5)
    {
      v7 = objc_msgSend(v5, "monitorLowDiskSpaceRecovery");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v2->_shouldDisconnectDueToLowDiskSpace;
      v2->_shouldDisconnectDueToLowDiskSpace = (NSNumber *)v8;

      if (!(_DWORD)v7)
      {
        v4 = 0;
        goto LABEL_11;
      }
      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[NSString fp_obfuscatedProviderDomainID](v2->_providerDomainID, "fp_obfuscatedProviderDomainID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] [diskspace] Disconnecting %@ due to low disk space.", (uint8_t *)&v13, 0xCu);

      }
    }
    else
    {
      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[FPDDomain _shouldDisconnectDueToLowDiskSpace].cold.1();
    }

LABEL_11:
    goto LABEL_12;
  }
  v4 = -[NSNumber BOOLValue](shouldDisconnectDueToLowDiskSpace, "BOOLValue");
LABEL_12:
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)supportsSearch
{
  void *v2;
  char v3;

  -[FPDDomain nsDomain](self, "nsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSearch");

  return v3;
}

- (BOOL)supportsPickingFolders
{
  char v2;
  FPDProvider **p_provider;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  if (self->_isUsingFPFS)
    return 1;
  p_provider = &self->_provider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "supportsPickingFolders") & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)p_provider);
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) != 0)
    {
      v2 = 1;
    }
    else
    {
      v8 = objc_loadWeakRetained((id *)p_provider);
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider")) & 1) != 0)
      {
        v2 = 1;
      }
      else
      {
        v10 = objc_loadWeakRetained((id *)p_provider);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));

      }
    }

  }
  return v2;
}

- (id)rootURLsWithTransientState:(BOOL *)a3
{
  FPDDomain *v4;
  void *v5;
  void *v6;

  v4 = self;
  objc_sync_enter(v4);
  if (-[FPDDomain isPendingInitialization](v4, "isPendingInitialization"))
  {
    *a3 = 1;
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[FPDDomain defaultBackend](v4, "defaultBackend");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootURLsWithTransientState:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v4);

  return v5;
}

- (NSArray)extensionStorageURLs
{
  return self->_extensionStorageURLs;
}

- (BOOL)isUsingFPFS
{
  return self->_isUsingFPFS;
}

- (int64_t)errorGenerationCount
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[FPDDomainBackend errorGenerationCount](self->_defaultBackend, "errorGenerationCount");
  else
    return -1;
}

- (BOOL)backgroundActivityIsPaused
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[FPDDomainBackend backgroundActivityIsPaused](self->_defaultBackend, "backgroundActivityIsPaused");
  else
    return 0;
}

- (NSArray)rootURLs
{
  FPDDomain *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  if (-[FPDDomain isPendingInitialization](v2, "isPendingInitialization"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[FPDDomain defaultBackend](v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootURLs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (FPDDomainBackend)defaultBackend
{
  FPDDomain *v2;
  FPDDomainBackend *defaultBackend;
  FPDDomainBackend *v4;
  void *v6;
  NSObject *v7;

  v2 = self;
  objc_sync_enter(v2);
  defaultBackend = v2->_defaultBackend;
  if (!defaultBackend)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ not configured"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomain defaultBackend]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 381, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  }
  v4 = defaultBackend;
  objc_sync_exit(v2);

  return v4;
}

- (void)refreshConnectionState
{
  FPDDomain *v2;
  int isKindOfClass;
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  FPDExtensionSession *v8;
  void *v9;
  FPDDeadEndExtensionSession *v10;
  FPDDomainDeadEndBackend *v11;
  FPDDomainBackend *v12;
  NSObject *v13;
  FPDDomainBackend *extensionBackend;
  FPDExtensionSessionProtocol *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  FPDDomainDeadEndBackend *v19;
  FPDDomainBackend *deactivatedBackend;
  int v21;
  FPDDomain *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (-[FPDDomain isPendingInitialization](v2, "isPendingInitialization")
    || ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      ? (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass())
      : (isKindOfClass = 1),
        ((isKindOfClass ^ -[FPDDomain isConnectedToAppExtension](v2, "isConnectedToAppExtension")) & 1) != 0))
  {
    objc_sync_exit(v2);
  }
  else
  {
    v4 = -[FPDDomain isConnectedToAppExtension](v2, "isConnectedToAppExtension");
    if ((_DWORD)v4)
    {
      fp_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138543362;
        v22 = v2;
        _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] domain %{public}@ is being re-connected, enabling extension backend", (uint8_t *)&v21, 0xCu);
      }

      WeakRetained = objc_loadWeakRetained((id *)&v2->_provider);
      objc_msgSend(WeakRetained, "asAppExtensionBackedProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = [FPDExtensionSession alloc];
      objc_msgSend(v7, "sharedSessionQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[FPDExtensionSession initWithDomain:extension:queue:](v8, "initWithDomain:extension:queue:", v2, v7, v9);

      v11 = v2->_deactivatedBackend;
      v12 = 0;
    }
    else
    {
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138543362;
        v22 = v2;
        _os_log_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] domain %{public}@ is being disconnected, switching to a dead-end backend", (uint8_t *)&v21, 0xCu);
      }

      v10 = objc_alloc_init(FPDDeadEndExtensionSession);
      v11 = -[FPDDomainDeadEndBackend initWithDomain:]([FPDDomainDeadEndBackend alloc], "initWithDomain:", v2);
      if (-[FPDDomain isUsingFPFS](v2, "isUsingFPFS"))
        extensionBackend = v2->_extensionBackend;
      else
        extensionBackend = v2->_defaultBackend;
      v12 = extensionBackend;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[FPDDomainBackend updateShouldRetryThrottledOperations:completionHandler:](v2->_defaultBackend, "updateShouldRetryThrottledOperations:completionHandler:", v4, &__block_literal_global_82);
    -[FPDDeadEndExtensionSession start](v10, "start");
    v15 = v2->_session;
    objc_storeStrong((id *)&v2->_session, v10);
    v16 = -[FPDDomain isUsingFPFS](v2, "isUsingFPFS");
    v17 = 112;
    if (v16)
      v17 = 120;
    v18 = *(Class *)((char *)&v2->super.isa + v17);
    *(Class *)((char *)&v2->super.isa + v17) = (Class)v11;
    v19 = v11;

    deactivatedBackend = v2->_deactivatedBackend;
    v2->_deactivatedBackend = v12;

    objc_sync_exit(v2);
    -[FPDExtensionSessionProtocol cancelAsync](v15, "cancelAsync");
    -[FPDExtensionSessionProtocol invalidate](v15, "invalidate");
    v2 = (FPDDomain *)v15;
  }

}

- (BOOL)isConnectedToAppExtension
{
  return -[FPDDomain disconnectionState](self, "disconnectionState") == 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (FPDExtensionSessionProtocol)session
{
  return self->_session;
}

- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[FPDDomain isPendingInitialization](self, "isPendingInitialization"))
  {
    FPDomainUnavailableError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v7);

  }
  else
  {
    -[FPDDomainBackend fetchOperationServiceOrEndpointWithRequest:completionHandler:](self->_defaultBackend, "fetchOperationServiceOrEndpointWithRequest:completionHandler:", v8, v6);
  }

}

- (FPDDomainBackend)extensionBackend
{
  FPDDomain *v2;
  FPDDomainBackend *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_extensionBackend;
  objc_sync_exit(v2);

  return v3;
}

- (FPDDomain)initWithIdentifier:(id)a3 nsDomain:(id)a4 extensionStorageURLs:(id)a5 purposeIdentifier:(id)a6 fpfsClass:(Class)a7 provider:(id)a8 volume:(id)a9
{
  id v16;
  id v17;
  id v18;
  FPDDomain *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *providerDomainID;
  id v24;
  uint64_t v25;
  OS_os_log *log;
  void *v27;
  void *v28;
  uint64_t v29;
  NSMutableDictionary *coordinatorMetadataPerURL;
  uint64_t v31;
  NSMutableDictionary *providedItemRecursiveGenCountPerURL;
  uint64_t v33;
  NSCache *versionsCache;
  void *v35;
  const char *v36;
  NSObject *v37;
  dispatch_queue_t v38;
  OS_dispatch_queue *serialQueue;
  id v40;
  const char *v41;
  NSObject *v42;
  dispatch_queue_t v43;
  OS_dispatch_queue *extCallOutQueue;
  uint64_t v45;
  FPPacer *rootCreationPacer;
  void *v47;
  char v48;
  NSNumber *shouldDisconnectDueToLowDiskSpace;
  uint64_t v50;
  SAPathManager *saPathManager;
  void *v52;
  FPDDomainDeadEndBackend *v53;
  FPDDomainBackend *defaultBackend;
  void *v56;
  NSObject *v57;
  id v58;
  Class v59;
  id obj;
  id v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id location;
  objc_super v67;

  v16 = a3;
  v17 = a4;
  v63 = a5;
  v62 = a6;
  v18 = a8;
  v61 = a9;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ no domain identifier"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomain initWithIdentifier:nsDomain:extensionStorageURLs:purposeIdentifier:fpfsClass:provider:volume:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 144, (const char *)objc_msgSend(objc_retainAutorelease(v56), "UTF8String"));
  }
  v67.receiver = self;
  v67.super_class = (Class)FPDDomain;
  v19 = -[FPDDomain init](&v67, sel_init);
  if (v19)
  {
    v59 = a7;
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v18, "identifier");
    obj = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fp_providerDomainIDFromProviderID:domainIdentifier:", v21, v16);
    v22 = objc_claimAutoreleasedReturnValue();
    providerDomainID = v19->_providerDomainID;
    v19->_providerDomainID = (NSString *)v22;

    -[NSString fp_obfuscatedProviderDomainID](v19->_providerDomainID, "fp_obfuscatedProviderDomainID");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v24, "UTF8String");
    fpfs_create_log_for_provider();
    v25 = objc_claimAutoreleasedReturnValue();
    log = v19->_log;
    v19->_log = (OS_os_log *)v25;

    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v19->_nsDomain, a4);
    objc_msgSend(v17, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isEqual:", *MEMORY[0x1E0CAAB38]))
      v28 = 0;
    else
      v28 = v17;
    objc_storeStrong((id *)&v19->_nsDomainOrNilForDefault, v28);

    objc_storeWeak((id *)&v19->_provider, obj);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = objc_claimAutoreleasedReturnValue();
    coordinatorMetadataPerURL = v19->_coordinatorMetadataPerURL;
    v19->_coordinatorMetadataPerURL = (NSMutableDictionary *)v29;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = objc_claimAutoreleasedReturnValue();
    providedItemRecursiveGenCountPerURL = v19->_providedItemRecursiveGenCountPerURL;
    v19->_providedItemRecursiveGenCountPerURL = (NSMutableDictionary *)v31;

    v33 = objc_opt_new();
    versionsCache = v19->_versionsCache;
    v19->_versionsCache = (NSCache *)v33;

    -[NSCache setCountLimit:](v19->_versionsCache, "setCountLimit:", 128);
    if (providedItemsOperationQueue_onceToken != -1)
      dispatch_once(&providedItemsOperationQueue_onceToken, &__block_literal_global_605);
    objc_storeStrong((id *)&v19->_providedItemsOperationQueue, (id)providedItemsOperationQueue_operationQueue);
    objc_storeStrong((id *)&v19->_purposeIdentifier, a6);
    -[NSString fp_obfuscatedProviderDomainID](v19->_providerDomainID, "fp_obfuscatedProviderDomainID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: domain-queue"), v35);
    v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v36 = (const char *)objc_msgSend(v58, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = dispatch_queue_create(v36, v37);
    serialQueue = v19->_serialQueue;
    v19->_serialQueue = (OS_dispatch_queue *)v38;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: ext-domain-queue"), v35);
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v41 = (const char *)objc_msgSend(v40, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = dispatch_queue_create(v41, v42);
    extCallOutQueue = v19->_extCallOutQueue;
    v19->_extCallOutQueue = (OS_dispatch_queue *)v43;

    v19->_fpfsClass = v59;
    objc_storeStrong((id *)&v19->_extensionStorageURLs, a5);
    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAAC90]), "initWithName:queue:minFireInterval:", CFSTR("root-creation"), v19->_serialQueue, 1.0);
    rootCreationPacer = v19->_rootCreationPacer;
    v19->_rootCreationPacer = (FPPacer *)v45;

    location = 0;
    objc_initWeak(&location, v19);
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __106__FPDDomain_initWithIdentifier_nsDomain_extensionStorageURLs_purposeIdentifier_fpfsClass_provider_volume___block_invoke;
    v64[3] = &unk_1E8C75E70;
    objc_copyWeak(&v65, &location);
    -[FPPacer setEventBlock:](v19->_rootCreationPacer, "setEventBlock:", v64);
    v18 = obj;
    if (!v19->_nsDomainOrNilForDefault)
    {
      v19->_isUsingFPFS = 0;
      objc_msgSend(v17, "setReplicated:", 0);
    }
    objc_storeStrong((id *)&v19->_volume, a9);
    -[FPDDomain nsDomain](v19, "nsDomain");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isReplicated");

    if ((v48 & 1) == 0)
    {
      shouldDisconnectDueToLowDiskSpace = v19->_shouldDisconnectDueToLowDiskSpace;
      v19->_shouldDisconnectDueToLowDiskSpace = (NSNumber *)MEMORY[0x1E0C9AAA0];

    }
    if (FPFeatureFlagSpaceAttributionIsEnabled())
    {
      v50 = objc_opt_new();
      saPathManager = v19->_saPathManager;
      v19->_saPathManager = (SAPathManager *)v50;

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CAAB48], -2012, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[FPDDomainDeadEndBackend initWithDomain:materializationError:]([FPDDomainDeadEndBackend alloc], "initWithDomain:materializationError:", v19, v52);
    defaultBackend = v19->_defaultBackend;
    v19->_defaultBackend = (FPDDomainBackend *)v53;

    objc_storeStrong((id *)&v19->_extensionBackend, v19->_defaultBackend);
    objc_destroyWeak(&v65);
    objc_destroyWeak(&location);

  }
  return v19;
}

void __106__FPDDomain_initWithIdentifier_nsDomain_extensionStorageURLs_purposeIdentifier_fpfsClass_provider_volume___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createRootAndObserveIfNeededWithReason:userAllowedDBDrop:completion:", CFSTR("deferredRootCreation"), 0, &__block_literal_global_15);

}

- (BOOL)isHiddenDefaultDomain
{
  _BOOL4 v3;

  v3 = -[NSFileProviderDomain isHidden](self->_nsDomain, "isHidden");
  if (v3)
    LOBYTE(v3) = -[NSString isEqualToString:](self->_identifier, "isEqualToString:", *MEMORY[0x1E0CAAB38]);
  return v3;
}

- (BOOL)isDefaultDomain
{
  void *v2;
  void *v3;
  char v4;

  -[FPDDomain nsDomain](self, "nsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CAAB38]);

  return v4;
}

- (BOOL)isHidden
{
  return -[NSFileProviderDomain isHidden](self->_nsDomain, "isHidden");
}

- (BOOL)isPendingInitialization
{
  void *v3;
  BOOL v4;

  if (!self->_defaultBackend)
    return 1;
  -[FPDDomain defaultBackend](self, "defaultBackend");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && self->_deactivatedBackend == 0;

  return v4;
}

- (NSArray)coordinationRootURLs
{
  FPDDomain *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  if (-[FPDDomain isPendingInitialization](v2, "isPendingInitialization"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[FPDDomain defaultBackend](v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinationRootURLs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)checkableURLs
{
  FPDDomain *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  if (-[FPDDomain isPendingInitialization](v2, "isPendingInitialization"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[FPDDomain defaultBackend](v2, "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "checkableURLs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPDDomain fp_prettyDescription](self, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSFileProviderDomain userEnabled](self->_nsDomain, "userEnabled");
  v7 = CFSTR("user-disabled");
  if (v6)
    v7 = CFSTR("user-enabled");
  if (self->_ejectable)
    v8 = CFSTR(", ejectable");
  else
    v8 = &stru_1E8C795D8;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@, %@%@"), v4, self, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)fp_prettyDescription
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString fp_obfuscatedFilename](self->_identifier, "fp_obfuscatedFilename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setDefaultBackend:(id)a3
{
  FPDDomainBackend *v4;
  FPDDomainBackend *defaultBackend;
  FPDDomain *obj;

  v4 = (FPDDomainBackend *)a3;
  obj = self;
  objc_sync_enter(obj);
  defaultBackend = obj->_defaultBackend;
  obj->_defaultBackend = v4;

  objc_sync_exit(obj);
}

- (void)setExtensionBackend:(id)a3
{
  FPDDomainBackend *v4;
  FPDDomainBackend *extensionBackend;
  FPDDomain *obj;

  v4 = (FPDDomainBackend *)a3;
  obj = self;
  objc_sync_enter(obj);
  extensionBackend = obj->_extensionBackend;
  obj->_extensionBackend = v4;

  objc_sync_exit(obj);
}

void __35__FPDDomain_refreshConnectionState__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __35__FPDDomain_refreshConnectionState__block_invoke_cold_1();

  }
}

- (void)setUserEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  FPDDomain *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (a3
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_provider),
        objc_msgSend(WeakRetained, "descriptor"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "canToggleDomainVisibility"),
        v6,
        WeakRetained,
        (v7 & 1) != 0))
  {
    -[FPDDomain nsDomain](self, "nsDomain");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserEnabled:", v3);

  }
  else
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring user-disabling the domain, because its visibility cannot be changed for %@", buf, 0xCu);
    }

    -[FPDDomain nsDomain](self, "nsDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserEnabled:", 1);

  }
}

- (void)setHiddenByUser:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  FPDDomain *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (a3
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_provider),
        objc_msgSend(WeakRetained, "descriptor"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "canToggleDomainVisibility"),
        v6,
        WeakRetained,
        (v7 & 1) != 0))
  {
    -[FPDDomain nsDomain](self, "nsDomain");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHiddenByUser:", v3);

  }
  else
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring user-disabling the domain, because its visibility cannot be changed for %@", buf, 0xCu);
    }

    -[FPDDomain nsDomain](self, "nsDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHiddenByUser:", 0);

  }
}

void __40__FPDDomain_setNsDomainOrNilForDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  int v6;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isHidden");
    v7 = objc_msgSend(WeakRetained[19], "isHidden");
    v8[0] = 67109634;
    v8[1] = v6;
    v9 = 1024;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_ERROR, "[ERROR] Failed switching indexer from %d to %d: %@", (uint8_t *)v8, 0x18u);
  }

}

- (BOOL)shouldDisconnectWithStartupError
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v14;
  FPDDomain *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[FPDDomain startupError](self, "startupError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fp_isPOSIXErrorCode:", 28);

  if (v4)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = self;
      _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] [diskspace] Initializing disconnected (low disk space) provider for %@", (uint8_t *)&v14, 0xCu);
    }

    -[FPDDomain volume](self, "volume");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[NSObject monitorLowDiskSpaceRecovery](v6, "monitorLowDiskSpaceRecovery");
    }
    else
    {
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[FPDDomain shouldDisconnectWithStartupError].cold.1();

    }
LABEL_15:

    return 1;
  }
  -[FPDDomain startupError](self, "startupError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fp_isFileProviderInternalError:", 22);

  if (v9)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[FPDDomain shouldDisconnectWithStartupError].cold.2();
    goto LABEL_15;
  }
  -[FPDDomain startupError](self, "startupError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fp_isFileProviderInternalError:", 23);

  if (v11)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[FPDDomain shouldDisconnectWithStartupError].cold.3();
    goto LABEL_15;
  }
  return 0;
}

- (void)finishSetup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] Initializing fpfs testing provider for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (BOOL)createRootByImportingDirectoryAtURL:(id)a3 knownFolders:(id)a4 error:(id *)a5
{
  void *v5;
  BOOL v6;

  -[FPDDomainBackend createRootByImportingURL:knownFolders:error:](self->_defaultBackend, "createRootByImportingURL:knownFolders:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)createRootURLWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  FPDDomainBackend *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  FPDDomainBackend *v34;
  void (**v35)(id, _QWORD, id);
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, id))a3;
  v5 = self->_defaultBackend;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPersona");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  objc_msgSend(v7, "userPersonaUniqueString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDDomain nsDomain](self, "nsDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v10)
  {

LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  -[FPDDomain nsDomain](self, "nsDomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "isEqualToString:", v12);

  if ((v13 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v37 = 0;
  v14 = (void *)objc_msgSend(v7, "copyCurrentPersonaContextWithError:", &v37);
  v15 = v37;
  v16 = v38;
  v38 = v14;

  if (v15)
  {
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:].cold.2();

  }
  -[FPDDomain nsDomain](self, "nsDomain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "personaIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generateAndRestorePersonaContextWithPersonaUniqueString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[FPDDomain nsDomain](self, "nsDomain");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "personaIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v32;
      v41 = 2112;
      v42 = v20;
      _os_log_error_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  if (-[FPDDomain isDefaultDomain](self, "isDefaultDomain"))
  {
    if (-[FPDDomain isHiddenDefaultDomain](self, "isHiddenDefaultDomain"))
    {
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[FPDDomain createRootURLWithCompletion:].cold.1();

      FPDomainUnavailableError();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v23);
    }
    else
    {
      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[FPDDomain createRootURLWithCompletion:].cold.2();

      v27 = (void *)MEMORY[0x1E0CAAC70];
      -[FPDDomain providerDomainID](self, "providerDomainID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "rootItemIDWithProviderDomainID:", v28);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      v29 = (void *)-[FPDExtensionSessionProtocol newFileProviderProxyWithTimeout:pid:](self->_session, "newFileProviderProxyWithTimeout:pid:", 0, -1.0);
      objc_msgSend(MEMORY[0x1E0CAAD30], "requestFromTheSystem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __41__FPDDomain_createRootURLWithCompletion___block_invoke;
      v33[3] = &unk_1E8C771E0;
      v33[4] = self;
      v35 = v4;
      v34 = v5;
      objc_msgSend(v29, "itemForItemID:request:completionHandler:", v23, v30, v33);

    }
  }
  else
  {
    fp_current_or_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[FPDDomain createRootURLWithCompletion:].cold.3();

    v36 = 0;
    -[FPDDomainBackend createRootByImportingURL:knownFolders:error:](v5, "createRootByImportingURL:knownFolders:error:", 0, MEMORY[0x1E0C9AA60], &v36);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v36;
    ((void (**)(id, void *, id))v4)[2](v4, v25, v23);

  }
  _FPRestorePersona();

}

void __41__FPDDomain_createRootURLWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v5 = a4;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 168);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__FPDDomain_createRootURLWithCompletion___block_invoke_2;
  v9[3] = &unk_1E8C76790;
  v10 = v5;
  v11 = v6;
  v13 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 40);
  v8 = v5;
  dispatch_async(v7, v9);

}

void __41__FPDDomain_createRootURLWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v2 = a1[4];
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
      __41__FPDDomain_createRootURLWithCompletion___block_invoke_2_cold_2((uint64_t)a1);

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (v4)
      __41__FPDDomain_createRootURLWithCompletion___block_invoke_2_cold_1((uint64_t)a1, v3, v5, v6, v7, v8, v9, v10);

    v11 = (void *)a1[6];
    v14 = 0;
    objc_msgSend(v11, "createRootByImportingURL:knownFolders:error:", 0, MEMORY[0x1E0C9AA60], &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    (*(void (**)(void))(a1[7] + 16))();

  }
}

- (void)_prepareFileCoordinationProviders
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  FPDFileCoordinationProvider *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  BOOL v20;
  id WeakRetained;
  NSString *identifier;
  id v23;
  id obj;
  uint64_t v25;
  FPDDomain *v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (id)fileCoordinationProviderByURL;
  objc_sync_enter(v3);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v26 = self;
  v23 = v3;
  -[FPDDomain coordinationRootURLs](self, "coordinationRootURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  obj = v4;
  v6 = 0;
  if (v5)
  {
    v25 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v9 = (id)fileCoordinationProviderByURL;
        v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(_QWORD *)v29 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v13, "fp_relationshipToItemAtURL:", v8) == 1)
              {
                objc_msgSend((id)fileCoordinationProviderByURL, "objectForKeyedSubscript:", v13);
                v14 = (FPDFileCoordinationProvider *)objc_claimAutoreleasedReturnValue();
                v10 = v13;
                goto LABEL_16;
              }
            }
            v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v10)
              continue;
            break;
          }
        }
        v14 = 0;
LABEL_16:

        +[FPDKnownFolderArbiter desktopURL](FPDKnownFolderArbiter, "desktopURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "fp_relationshipToItemAtURL:", v8) == 1;

        +[FPDKnownFolderArbiter documentsURL](FPDKnownFolderArbiter, "documentsURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "fp_relationshipToItemAtURL:", v8) == 1;

        if (v18)
          v6 |= v16 | 2;
        else
          v6 |= v16;
        if (v14)
        {
          objc_msgSend((id)fileCoordinationProviderByURL, "removeObjectForKey:", v10);
        }
        else
        {
          v14 = -[FPDFileCoordinationProvider initWithRootURL:]([FPDFileCoordinationProvider alloc], "initWithRootURL:", v8);
          -[FPDFileCoordinationProvider setExtensionIdentifier:](v14, "setExtensionIdentifier:", v26->_identifier);
        }
        objc_msgSend((id)fileCoordinationProviderByURL, "setObject:forKeyedSubscript:", v14, v8);
        -[FPDFileCoordinationProvider setDelegate:](v14, "setDelegate:", v26);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v5);
  }

  objc_sync_exit(v23);
  -[FPDDomain nsDomain](v26, "nsDomain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6 == objc_msgSend(v19, "replicatedKnownFolders");

  if (!v20)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v26->_provider);
    identifier = v26->_identifier;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __46__FPDDomain__prepareFileCoordinationProviders__block_invoke;
    v27[3] = &unk_1E8C753A8;
    v27[4] = v26;
    objc_msgSend(WeakRetained, "setReplicatedKnownFolders:forDomainIdentifier:completionHandler:", v6, identifier, v27);

  }
}

void __46__FPDDomain__prepareFileCoordinationProviders__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 208));
  objc_msgSend(WeakRetained, "manager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signalProviderChanges");

}

- (void)_checkDomainConnectionPermittedWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char isKindOfClass;
  NSObject *extCallOutQueue;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[FPDDomain volume](self, "volume");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "role");

  if (v6 == 3
    && (-[FPDDomain session](self, "session"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) == 0))
  {
    extCallOutQueue = self->_extCallOutQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E8C75698;
    v10[4] = self;
    v11 = v4;
    dispatch_async(extCallOutQueue, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newFileProviderProxyWithTimeout:pid:", 0, 180.0);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E8C75530;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "shouldConnectExternalDomainWithCompletionHandler:", v5);

}

void __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 168);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E8C76C10;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __66__FPDDomain__checkDomainConnectionPermittedWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_startObservingRootAndResumeIndexerWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5
{
  id v7;
  NSObject *serialQueue;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;

  v7 = a3;
  serialQueue = self->_serialQueue;
  v9 = a5;
  dispatch_assert_queue_V2(serialQueue);
  -[FPDDomain provider](self, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asAppExtensionBackedProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  self->_isObservingRoot = 1;
  -[FPDDomain _prepareFileCoordinationProviders](self, "_prepareFileCoordinationProviders");
  v14 = MEMORY[0x1E0C809B0];
  v15 = v7;
  v12 = v11;
  v13 = v7;
  fp_dispatch_async_with_logs();
  -[FPDDomain _registerFileCoordinatorAndSpaceForceWithCompletion:](self, "_registerFileCoordinatorAndSpaceForceWithCompletion:", v9, v14, 3221225472, __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke, &unk_1E8C75F38, self);

}

uint64_t __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;
  uint64_t section;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  section = __fp_create_section();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD **)(a1 + 32);
    v6 = v5[19];
    objc_msgSend(v5, "defaultBackend");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v15 = section;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_debug_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx starting domain %@ with backend %@", buf, 0x20u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_94;
  v8[3] = &unk_1E8C77230;
  v3 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v12 = *(_BYTE *)(a1 + 56);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v9, "_checkDomainConnectionPermittedWithCompletionHandler:", v8);

  return __fp_leave_section_Debug();
}

void __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[5];
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_94_cold_2(v3, v4);

    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_externalDomainRejectedErrorWithUnderlyingError:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(unsigned __int8 *)(a1 + 56);
  v25 = 0;
  v9 = objc_msgSend(v6, "startWithReason:userAllowedDBDrop:error:", v7, v8, &v25);
  v5 = v25;

  if ((v9 & 1) == 0)
  {
LABEL_7:
    v12 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
    objc_msgSend(*(id *)(a1 + 48), "server");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_94_cold_1((uint64_t)v12, v5, v14);

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(NSObject **)(v15 + 168);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_95;
    v20[3] = &unk_1E8C75930;
    v20[4] = v15;
    v21 = *(id *)(a1 + 48);
    v22 = v12;
    v5 = v5;
    v23 = v5;
    v24 = v13;
    v17 = v13;
    v18 = v12;
    dispatch_async(v16, v20);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 168);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_3;
    block[3] = &unk_1E8C75E48;
    block[4] = v10;
    dispatch_async(v11, block);
  }

}

void __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_95(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 105))
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  else
  {
    v1 = *(void **)(a1 + 40);
    v2 = *(_QWORD *)(a1 + 48);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_2;
    v5[3] = &unk_1E8C77208;
    v3 = *(_QWORD *)(a1 + 56);
    v6 = *(id *)(a1 + 64);
    objc_msgSend(v1, "reloadDomain:unableToStartup:startupError:completionHandler:", v2, 1, v3, v5);

  }
}

uint64_t __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalProviderChanges");
}

void __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _BYTE *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingStoreIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setBackingStoreIdentity:", v3);

  v4 = *(_BYTE **)(a1 + 32);
  if (v4[105] || v4[51])
  {
    objc_msgSend(v4, "defaultBackend");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

  }
  else if (objc_msgSend(MEMORY[0x1E0CAAC18], "runningInSyncBubble"))
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_INFO, "[INFO] shared iPad: skipping indexing because we're just finishing sync", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "indexer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "start");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) = 1;
  }
}

- (void)createRootAndObserveIfNeededWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  NSObject *v11;
  FPPacer *v12;
  FPPacer *v13;
  NSObject *v14;
  _QWORD v15[5];
  FPPacer *v16;
  id v17;
  void (**v18)(_QWORD);
  BOOL v19;
  id v20;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[FPDDomain log](self, "log");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_isObservingRoot)
  {
    v9[2](v9);
  }
  else if ((-[FPDDomainBackend needsRootsCreation](self->_defaultBackend, "needsRootsCreation") & 1) != 0)
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FPDDomain createRootAndObserveIfNeededWithReason:userAllowedDBDrop:completion:].cold.1();

    v12 = self->_rootCreationPacer;
    -[FPPacer suspend](v12, "suspend");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke;
    v15[3] = &unk_1E8C77258;
    v15[4] = self;
    v13 = v12;
    v16 = v13;
    v18 = v9;
    v17 = v8;
    v19 = v6;
    -[FPDDomain createRootURLWithCompletion:](self, "createRootURLWithCompletion:", v15);

  }
  else
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[FPDDomain createRootAndObserveIfNeededWithReason:userAllowedDBDrop:completion:].cold.2();

    -[FPDDomain _startObservingRootAndResumeIndexerWithReason:userAllowedDBDrop:completion:](self, "_startObservingRootAndResumeIndexerWithReason:userAllowedDBDrop:completion:", v8, v6, v9);
  }
  __fp_pop_log();

}

void __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 168));
  objc_msgSend(*(id *)(a1 + 32), "log");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(_BYTE **)(a1 + 32);
  if (v8[105])
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

  }
  else
  {
    if (!v6)
    {
      v14 = *(unsigned __int8 *)(a1 + 64);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke_98;
      v16[3] = &unk_1E8C75698;
      v15 = *(_QWORD *)(a1 + 48);
      v17 = *(id *)(a1 + 40);
      v18 = *(id *)(a1 + 56);
      objc_msgSend(v8, "_startObservingRootAndResumeIndexerWithReason:userAllowedDBDrop:completion:", v15, v14, v16);

      goto LABEL_4;
    }
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "fp_prettyDescription");
      objc_claimAutoreleasedReturnValue();
      __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    v12 = *(_BYTE **)(a1 + 32);
    if (!v12[50])
    {
      objc_msgSend(v12, "indexer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "start");

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) = 1;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "resume");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_4:
  __fp_pop_log();

}

uint64_t __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke_98(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "resume");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)didRefreshRootURLsWithCompletionHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *serialQueue;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  fpfs_adopt_log();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signalProviderChanges");

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__FPDDomain_didRefreshRootURLsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E8C75698;
  block[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_sync(serialQueue, block);

  __fp_pop_log();
}

uint64_t __53__FPDDomain_didRefreshRootURLsWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_prepareFileCoordinationProviders");
  return objc_msgSend(*(id *)(a1 + 32), "_registerFileCoordinatorAndSpaceForceWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)diskImportFinished
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] disk import finished for domain %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)_startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  id WeakRetained;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  id v39;
  uint64_t section;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v6 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[FPDDomain indexer](self, "indexer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ domain already registered"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomain _startWithReason:userAllowedDBDrop:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 929, (const char *)objc_msgSend(objc_retainAutorelease(v31), "UTF8String"));
  }
  -[FPDDomain identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ no domain"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomain _startWithReason:userAllowedDBDrop:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 930, (const char *)objc_msgSend(objc_retainAutorelease(v33), "UTF8String"));
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ no provider"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomain _startWithReason:userAllowedDBDrop:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 931, (const char *)objc_msgSend(objc_retainAutorelease(v35), "UTF8String"));
  }
  self->_started = 1;
  fpfs_adopt_log();
  v41 = (id)objc_claimAutoreleasedReturnValue();
  section = __fp_create_section();
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[FPDDomain identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fp_obfuscatedProviderDomainID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v43 = section;
    v44 = 2114;
    v45 = v15;
    v46 = 2114;
    v47 = v8;
    _os_log_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx starting domain %{public}@ with reason %{public}@", buf, 0x20u);

  }
  -[FPDExtensionSessionProtocol start](self->_session, "start");
  -[FPDDomain provider](self, "provider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isAppExtensionReachable");

  if ((v17 & 1) == 0)
  {
    -[FPDDomain defaultBackend](self, "defaultBackend");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "startWithReason:userAllowedDBDrop:error:", v8, v6, 0);

    goto LABEL_13;
  }
  if (-[FPDDomain isHiddenDefaultDomain](self, "isHiddenDefaultDomain"))
  {
LABEL_13:
    v9[2](v9);
    goto LABEL_14;
  }
  -[FPDDomain defaultBackend](self, "defaultBackend");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isDeadEndBackend");

  if (v19)
  {
    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_INFO, "[INFO] registering for coordination and returning early for deadend backend", buf, 2u);
    }

    -[FPDDomain _prepareFileCoordinationProviders](self, "_prepareFileCoordinationProviders");
    -[FPDDomain _registerFileCoordinatorAndSpaceForceWithCompletion:](self, "_registerFileCoordinatorAndSpaceForceWithCompletion:", v9);
  }
  else
  {
    -[FPDDomain provider](self, "provider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "asAppExtensionBackedProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[FPDDomain userEnabled](self, "userEnabled") && !-[FPDDomain isHiddenByUser](self, "isHiddenByUser"))
      v24 = -[FPDDomain isHidden](self, "isHidden") ^ 1;
    else
      v24 = 0;
    -[FPDDomain defaultBackend](self, "defaultBackend");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v25, "createIndexerWithExtension:enabled:error:", v23, v24, &v39);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v39;

    if (v26)
    {
      objc_msgSend(v26, "setDelegate:", self);
      -[FPDDomain setIndexer:](self, "setIndexer:", v26);
      -[FPDDomain indexer](self, "indexer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28 == 0;

      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ should not be nil"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

        __assert_rtn("-[FPDDomain _startWithReason:userAllowedDBDrop:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 982, (const char *)objc_msgSend(objc_retainAutorelease(v37), "UTF8String"));
      }
      -[FPDDomain createRootAndObserveIfNeededWithReason:userAllowedDBDrop:completion:](self, "createRootAndObserveIfNeededWithReason:userAllowedDBDrop:completion:", v8, v6, v9);
      -[FPPacer resume](self->_rootCreationPacer, "resume");
    }
    else
    {
      fp_current_or_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v27, "fp_prettyDescription");
        objc_claimAutoreleasedReturnValue();
        -[FPDDomain _startWithReason:userAllowedDBDrop:completion:].cold.3();
      }

      v9[2](v9);
    }

  }
LABEL_14:
  __fp_leave_section_Notice();
  __fp_pop_log();

}

- (void)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *serialQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FPDDomain_startWithReason_userAllowedDBDrop_completion___block_invoke;
  block[3] = &unk_1E8C77280;
  block[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(serialQueue, block);

}

uint64_t __58__FPDDomain_startWithReason_userAllowedDBDrop_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startWithReason:userAllowedDBDrop:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)cancelPendingCoordinations
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary copy](self->_coordinatorMetadataPerURL, "copy");
  -[NSMutableDictionary removeAllObjects](self->_coordinatorMetadataPerURL, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3640], "responseWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v3;
  objc_msgSend(v3, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v10, "allValues");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "completionHandler");
              v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *))v16)[2](v16, v4);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

}

- (void)stopIndexer
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a3, (uint64_t)a3, "[DEBUG] ┏%llx Stopping indexer %@...", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void __24__FPDDomain_stopIndexer__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[51])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ Trying to stop already stopped indexer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomain stopIndexer]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 1017, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  }
  if (v1[105])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ Trying to stop indexer on invalided domain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomain stopIndexer]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 1018, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  }
  v1[50] = 1;
  objc_msgSend(*(id *)(a1 + 32), "indexer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) = 1;
}

- (void)invalidateWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *serialQueue;
  _QWORD v7[5];
  uint64_t section;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  FPDDomain *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_invalidated = 1;
  section = __fp_create_section();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v10 = section;
    v11 = 2112;
    v12 = self;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Invalidating %@ (reason: %{public}@)...", buf, 0x20u);
  }

  -[FPDDomain _unregisterFromFileCoordinatorAndSpaceForce](self, "_unregisterFromFileCoordinatorAndSpaceForce");
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__FPDDomain_invalidateWithReason___block_invoke;
  v7[3] = &unk_1E8C75E48;
  v7[4] = self;
  dispatch_sync(serialQueue, v7);
  -[NSURL stopAccessingSecurityScopedResource](self->_previouslyAccessedSecurityScopedURL, "stopAccessingSecurityScopedResource");
  __fp_leave_section_Notice();

}

void __34__FPDDomain_invalidateWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  fpfs_adopt_log();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 51))
  {
    *(_BYTE *)(v2 + 50) = 1;
    objc_msgSend(*(id *)(a1 + 32), "indexer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 51) = 1;
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 112), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "cancelPendingCoordinations");
  __fp_pop_log();

}

- (void)invalidateSession
{
  -[FPDExtensionSessionProtocol invalidate](self->_session, "invalidate");
}

- (id)cleanupDomainWithMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  int *v28;
  char *v29;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[16];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log();
  v32 = (id)objc_claimAutoreleasedReturnValue();
  -[FPDDomain provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[FPDDomain provider](self, "provider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider"));

  }
  objc_msgSend(MEMORY[0x1E0CD32E8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDDomain providerDomainID](self, "providerDomainID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:completionHandler:", v12, &__block_literal_global_113);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FPDDomainBackend cleanupDomainWithMode:error:](self->_defaultBackend, "cleanupDomainWithMode:error:", a3, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "resultURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  -[FPDDomain indexer](self, "indexer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = v7;
  else
    v17 = 1;
  if ((v17 & 1) != 0)
  {
    if (v7)
    {
      fp_current_or_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[FPDDomain providerDomainID](self, "providerDomainID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fp_obfuscatedProviderDomainID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPDDomain cleanupDomainWithMode:].cold.3(v20, (uint64_t)v35, v18, v19);
      }

    }
  }
  else
  {
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      -[FPDDomain providerDomainID](self, "providerDomainID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fp_obfuscatedProviderDomainID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDDomain cleanupDomainWithMode:].cold.4(v23, (uint64_t)v35, v21, v22);
    }

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __35__FPDDomain_cleanupDomainWithMode___block_invoke_116;
    v31[3] = &unk_1E8C753A8;
    v31[4] = self;
    objc_msgSend(v16, "dropIndexForReason:completion:", 1, v31);
  }
  -[FPDDomain supportURL](self, "supportURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v24;
    _os_log_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_INFO, "[INFO] removing support directory at %@", buf, 0xCu);
  }

  v26 = objc_retainAutorelease(v24);
  objc_msgSend(v26, "fileSystemRepresentation");
  if ((fpfs_recursive_unlinkat() & 0x80000000) != 0)
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = __error();
      v29 = strerror(*v28);
      -[FPDDomain cleanupDomainWithMode:].cold.1((uint64_t)v29, (uint64_t)buf, (uint64_t)v26, v27);
    }
  }
  else
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[FPDDomain cleanupDomainWithMode:].cold.2();
  }

  __fp_pop_log();
  return v15;
}

void __35__FPDDomain_cleanupDomainWithMode___block_invoke_116(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "indexer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "fp_prettyDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to async drop index for %@: %@", (uint8_t *)&v8, 0x16u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __35__FPDDomain_cleanupDomainWithMode___block_invoke_116_cold_1(a1, v5);
  }

}

- (void)extensionIndexer:(id)a3 didChangeNeedsAuthentification:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  fpfs_adopt_log();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && !self->_isObservingRoot)
    -[FPPacer signal](self->_rootCreationPacer, "signal");
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "manager");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "signalProviderChanges");

  -[FPDDomain defaultBackend](self, "defaultBackend");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[FPDDomain defaultBackend](self, "defaultBackend");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didChangeNeedsAuthentification:", v4);

  }
  __fp_pop_log();

}

- (id)_fileReactorID
{
  return self->_purposeIdentifier;
}

- (id)_providedItemsOperationQueue
{
  return self->_providedItemsOperationQueue;
}

- (id)_physicalURLForURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (self->_extensionBackend == self->_defaultBackend)
  {
    v6 = 0;
    if ((objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CAAD28], "placeholderURLForURL:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      if (objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0))
        v6 = v7;

    }
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (id)_siblingDelegateForURL:(id)a3
{
  id v4;
  void *v5;
  FPDDomain *v6;
  FPDDomain *v7;

  v4 = a3;
  -[FPDDomain provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domainForURL:", v4);
  v6 = (FPDDomain *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (id)_removeProgressForProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  serialQueue = self->_serialQueue;
  v8 = a4;
  dispatch_assert_queue_V2(serialQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_coordinatorMetadataPerURL, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v8);

  if (!objc_msgSend(v9, "count"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_coordinatorMetadataPerURL, "setObject:forKeyedSubscript:", 0, v6);

  return v10;
}

- (id)getProvidedItemRecursiveGenerationCountForItemAtURL:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  v5 = self->_providedItemRecursiveGenCountPerURL;
  if ((objc_msgSend(v4, "hasDirectoryPath") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:isDirectory:", v7, 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  v9 = v5;
  objc_sync_enter(v9);
  -[NSMutableDictionary objectForKey:](v9, "objectForKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v9);

  if (errorInjectionPointEnabled(0, 2))
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLong:", 0xFFFFFFFFLL);
  else
    v11 = v10;
  v12 = v11;

  return v12;
}

- (void)setProvidedItemRecursiveGenerationCount:(id)a3 forItemAtURL:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self->_providedItemRecursiveGenCountPerURL;
  if ((objc_msgSend(v6, "hasDirectoryPath") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v10;
  }
  v11 = v7;
  objc_sync_enter(v11);
  if (v12)
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v6);
  objc_sync_exit(v11);

}

- (BOOL)_isProviderBlockingConsumer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[FPDDomain provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[FPDDomain provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "blockedProcessNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  objc_sync_exit(v5);
  return v8;
}

- (void)_provideItemAtURL:(id)a3 toReaderWithID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  _OWORD v15[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3600], "_kernelMaterializationInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(MEMORY[0x1E0CB3600], "_readingOptions");
  if (v9)
    v13 = objc_msgSend(MEMORY[0x1E0CB3600], "_processIdentifierForID:", v9);
  else
    v13 = 0;
  *(_QWORD *)&v14 = -1;
  *((_QWORD *)&v14 + 1) = -1;
  v15[0] = v14;
  v15[1] = v14;
  -[FPDDomain _provideItemAtURL:withReaderID:withProcessID:withAuditToken:kernelInfo:readingOptions:completionHandler:](self, "_provideItemAtURL:withReaderID:withProcessID:withAuditToken:kernelInfo:readingOptions:completionHandler:", v8, v9, v13, v15, v11, v12, v10);

}

- (void)_provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _OWORD v14[2];
  audit_token_t atoken;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
    objc_msgSend(v9, "readerAuditToken");
  else
    memset(&atoken, 0, sizeof(atoken));
  v11 = audit_token_to_pid(&atoken);
  objc_msgSend(v9, "readerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v9, "readerAuditToken");
  else
    memset(v14, 0, sizeof(v14));
  objc_msgSend(v9, "kernelMaterializationInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDDomain _provideItemAtURL:withReaderID:withProcessID:withAuditToken:kernelInfo:readingOptions:completionHandler:](self, "_provideItemAtURL:withReaderID:withProcessID:withAuditToken:kernelInfo:readingOptions:completionHandler:", v8, v12, v11, v14, v13, objc_msgSend(v9, "readingOptions"), v10);

}

- (void)_provideItemAtURL:(id)a3 withReaderID:(id)a4 withProcessID:(int)a5 withAuditToken:(id *)a6 kernelInfo:(id)a7 readingOptions:(unint64_t)a8 completionHandler:(id)a9
{
  uint64_t v12;
  id v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  id v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  __int128 v39;
  void *v40;
  $115C4C562B26FF47E01F9F4EA65B5887 *v41;
  unint64_t v42;
  id v43;
  int v44;
  __CFString *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  uint8_t buf[32];
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  const __CFString *v67;
  _BYTE v68[12];
  __int16 v69;
  void *v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v12 = *(_QWORD *)&a5;
  v73 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v46 = a7;
  v43 = a9;
  fpfs_adopt_log();
  v57 = a8;
  v58 = (id)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  if ((_DWORD)v12)
  {
    FPExecutableNameForProcessIdentifier();
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("(unknown)");
  }
  +[FPDCoordinator requestForClaimID:](FPDCoordinator, "requestForClaimID:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v18, "processName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ (on behalf of %@)"), v17, v21);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    memset(buf, 0, sizeof(buf));
    objc_msgSend(v19, "audit_token");
    if ((*(_QWORD *)buf & *(_QWORD *)&buf[8] & *(_QWORD *)&buf[16] & *(_QWORD *)&buf[24]) == -1)
    {
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v15, "fp_shortDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v68 = 138412802;
        *(_QWORD *)&v68[4] = v40;
        v69 = 2112;
        v70 = v48;
        v71 = 2114;
        v72 = v16;
        _os_log_fault_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_FAULT, "[CRIT] _provideItemAtURL for %@: requestToken is empty, consumer:%@, readerID: %{public}@", v68, 0x20u);

      }
    }
  }
  else
  {
    v48 = v17;
  }
  v42 = v55[3];
  if ((v42 & 0x40000000) != 0)
  {
    objc_msgSend(v46, "fileMaterializationInfo");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v46, "operation");
    if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%lld, %lld>"), objc_msgSend(v47, "offset"), objc_msgSend(v47, "size"));
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {
    v44 = 0;
  }
  v45 = 0;
  v47 = 0;
LABEL_15:
  *(_QWORD *)v68 = 0;
  *(_QWORD *)v68 = __fp_create_section();
  fp_current_or_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v41 = a6;
    v24 = v12;
    v25 = v16;
    v26 = *(_QWORD *)v68;
    -[FPDDomain fp_prettyDescription](self, "fp_prettyDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fp_shortDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_coordinatorReadingOptions:", v55[3]);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v31 = CFSTR("<full>");
    *(_DWORD *)buf = 134219522;
    if (v45)
      v31 = v45;
    *(_QWORD *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v28;
    v60 = 2112;
    v61 = v48;
    v62 = 2114;
    v16 = v25;
    v63 = v25;
    v64 = 2114;
    v65 = v29;
    v66 = 2114;
    v67 = v31;
    _os_log_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx ⭕️ NSFileCoordinator requested %@ to provide item at %@ (consumer: %@, readerID: %{public}@, options: %{public}@, range: %{public}@)", buf, 0x48u);

    v12 = v24;
    a6 = v41;

  }
  if ((*((_BYTE *)v55 + 27) & 0x40) == 0)
    goto LABEL_26;
  v32 = _executableNameIsBlockedForMaterialization_once;
  v33 = v48;
  if (v32 != -1)
    dispatch_once(&_executableNameIsBlockedForMaterialization_once, &__block_literal_global_607);
  v34 = objc_msgSend((id)_executableNameIsBlockedForMaterialization_blockedProcesses, "containsObject:", v33);

  if (v34)
  {
    fp_current_or_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v33;
      _os_log_impl(&dword_1CF55F000, v35, OS_LOG_TYPE_INFO, "[INFO] ⛔️ item not provided, consumer %@ blocked by the system", buf, 0xCu);
    }

    v36 = 1;
  }
  else
  {
LABEL_26:
    v36 = 0;
  }
  if (-[FPDDomain _isProviderBlockingConsumer:](self, "_isProviderBlockingConsumer:", v48))
  {
    fp_current_or_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v48;
      _os_log_impl(&dword_1CF55F000, v37, OS_LOG_TYPE_INFO, "[INFO] ⛔️ item not provided, consumer %@ blocked by the provider", buf, 0xCu);
    }

    v36 = 1;
  }
  if (!v19)
  {
    v38 = fpfs_supports_partial_materialization() & v44;
    v39 = *(_OWORD *)&a6->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a6->var0;
    *(_OWORD *)&buf[16] = v39;
    if (v38 == 1)
      +[FPDRequest requestForPID:auditToken:fromPOSIX:kernelFileInfo:](FPDRequest, "requestForPID:auditToken:fromPOSIX:kernelFileInfo:", v12, buf, (v42 >> 30) & 1, v47);
    else
      +[FPDRequest requestForPID:auditToken:fromPOSIX:](FPDRequest, "requestForPID:auditToken:fromPOSIX:", v12, buf, (v42 >> 30) & 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "setShouldFailCoordinationIfDownloadRequired:", v36);
  v49 = v15;
  v50 = v16;
  v51 = v19;
  v52 = v48;
  v53 = v43;
  fp_dispatch_async_with_logs();

  __fp_leave_section_Notice();
  _Block_object_dispose(&v54, 8);
  __fp_pop_log();

}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  FPCoordinationContext *v16;
  __int128 v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  int v23;
  id v24;

  fpfs_adopt_log();
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      fp_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_cold_2();

      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
  }
  v6 = *(_DWORD *)(a1 + 88);
  if ((v6 & 0x10) != 0)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_cold_1();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) |= 0x20000uLL;
    v6 = *(_DWORD *)(a1 + 88);
  }
  if ((v6 & 0xA) != 0)
    objc_msgSend(*(id *)(a1 + 56), "setAllowsResurrection:", 1);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = *(void **)(v8 + 112);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_132;
  v18[3] = &unk_1E8C772F0;
  v18[4] = v8;
  v19 = v9;
  v20 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 64);
  v23 = *(_DWORD *)(a1 + 88);
  v17 = *(_OWORD *)(a1 + 72);
  v14 = (id)v17;
  v22 = v17;
  objc_msgSend(v10, "startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:", v19, v12, v11, v13, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FPCoordinationContext initWithProgress:completionHandler:]([FPCoordinationContext alloc], "initWithProgress:completionHandler:", v15, *(_QWORD *)(a1 + 72));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 48));

LABEL_14:
  __fp_pop_log();

}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_132(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  int v16;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 168);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_2;
  block[3] = &unk_1E8C772C8;
  block[4] = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v13 = v3;
  v14 = *(id *)(a1 + 56);
  v16 = *(_DWORD *)(a1 + 80);
  v9 = *(_OWORD *)(a1 + 64);
  v7 = (id)v9;
  v15 = v9;
  v8 = v3;
  dispatch_async(v6, block);

}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_removeProgressForProvidingItemAtURL:toReaderWithID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "fp_prettyDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 64);
      v9 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB3940], "fp_coordinatorReadingOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_DWORD *)(a1 + 88);
      v18 = 138413570;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      v27 = v10;
      v28 = 1024;
      v29 = v11;
      _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] ❌ NSFileCoordinator: failed providing item at %@: %@ (consumer: %@, readerID: %{public}@, options: %{public}@, kernelOperation: 0x%x)", (uint8_t *)&v18, 0x3Au);

    }
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 64);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_coordinatorReadingOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    v22 = 2114;
    v23 = v14;
    v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] ✅ NSFileCoordinator: providing item at %@ (consumer: %@, readerID: %{public}@, options: %{public}@)", (uint8_t *)&v18, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "getProvidedItemRecursiveGenerationCountForItemAtURL:", *(_QWORD *)(a1 + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(*(id *)(a1 + 32), "setProvidedItemRecursiveGenerationCount:forItemAtURL:", 0, *(_QWORD *)(a1 + 40));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3640], "responseWithError:", *(_QWORD *)(a1 + 56));
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject setProvidedItemRecursiveGenerationCount:](v17, "setProvidedItemRecursiveGenerationCount:", objc_msgSend(v16, "unsignedLongLongValue"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_2_cold_1();
  }

}

- (void)_cancelProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t section;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  fpfs_adopt_log();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(MEMORY[0x1E0CB3600], "_processIdentifierForID:", v7))
  {
    FPExecutableNameForProcessIdentifier();
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("(unknown)");
  }
  section = __fp_create_section();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    -[FPDDomain fp_prettyDescription](self, "fp_prettyDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fp_shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v17 = section;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v7;
    _os_log_debug_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx ❌ NSFileCoordinator cancelled request for %@ to provide item at %@ (consumer: %@, readerID: %@)", buf, 0x34u);

  }
  v12 = v6;
  v13 = v7;
  fp_dispatch_async_with_logs();

  __fp_leave_section_Debug();
  __fp_pop_log();

}

void __54__FPDDomain__cancelProvidingItemAtURL_toReaderWithID___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;

  v1 = (uint64_t *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_removeProgressForProvidingItemAtURL:toReaderWithID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __54__FPDDomain__cancelProvidingItemAtURL_toReaderWithID___block_invoke_cold_2(v2, v4);

    objc_msgSend(v2, "progress");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject cancel](v4, "cancel");
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __54__FPDDomain__cancelProvidingItemAtURL_toReaderWithID___block_invoke_cold_1(v1, v4, v5);
  }

}

- (void)_writerWithID:(id)a3 didFinishWritingForURL:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  FPDDomainBackend *defaultBackend;
  void *v13;
  FPDDomainBackend *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  FPDDomain *v20;
  int v21;
  uint64_t section;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB3600], "_processIdentifierForID:", v6);
    if ((_DWORD)v8)
    {
      FPExecutableNameForProcessIdentifier();
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = CFSTR("(unknown)");
LABEL_6:
  section = __fp_create_section();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "fp_shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v24 = section;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx NSFileCoordinator is telling us the item at %@ was changed (consumer: %@, writerID: %@)", buf, 0x2Au);

  }
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPDDomain fp_prettyDescription](self, "fp_prettyDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPDDomain _writerWithID:didFinishWritingForURL:].cold.1();
  }

  defaultBackend = self->_defaultBackend;
  +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDDomainBackend itemChangedAtURL:request:](defaultBackend, "itemChangedAtURL:request:", v7, v13);

  v14 = self->_defaultBackend;
  +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __50__FPDDomain__writerWithID_didFinishWritingForURL___block_invoke;
  v18[3] = &unk_1E8C77380;
  v16 = v7;
  v19 = v16;
  v20 = self;
  v21 = v8;
  -[FPDDomainBackend itemForURL:request:completionHandler:](v14, "itemForURL:request:completionHandler:", v16, v15, v18);

  __fp_leave_section_Debug();
}

void __50__FPDDomain__writerWithID_didFinishWritingForURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __50__FPDDomain__writerWithID_didFinishWritingForURL___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(v5, "lastUsedDate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v5, "lastUsedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentModificationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "compare:", v11);

      if (v12 == -1)
      {
        objc_msgSend(v5, "contentModificationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setLastUsedDate:", v13);

        v14 = *(void **)(a1 + 40);
        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", *(unsigned int *)(a1 + 48));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "daemonSideItemChange:changedFields:request:completionHandler:", v5, 8, v15, &__block_literal_global_136);

      }
    }
  }

}

- (BOOL)_wantsPresenterNotifications
{
  return 1;
}

- (void)_providedItemAtURL:(id)a3 didGainPresenterWithInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  FPDDomainBackend *defaultBackend;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t section;
  uint8_t buf[40];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  section = __fp_create_section();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "fp_shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presenterID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = section;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v20;
    _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Item at %@ gaining presenter %@", buf, 0x20u);

  }
  if (-[FPDDomain _wantsPresenterNotifications](self, "_wantsPresenterNotifications"))
  {
    memset(buf, 0, 32);
    if (v7)
      objc_msgSend(v7, "presenterAuditToken");
    WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    objc_msgSend(WeakRetained, "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presenterManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "presenterID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "promisePresenterWithID:", v12);

    defaultBackend = self->_defaultBackend;
    +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __57__FPDDomain__providedItemAtURL_didGainPresenterWithInfo___block_invoke;
    v21[3] = &unk_1E8C773A8;
    v22 = v6;
    v16 = v11;
    v23 = v16;
    v17 = v7;
    v26 = *(_OWORD *)buf;
    v27 = *(_OWORD *)&buf[16];
    v24 = v17;
    v25 = v13;
    -[FPDDomainBackend itemIDForURL:requireProviderItemID:request:completionHandler:](defaultBackend, "itemIDForURL:requireProviderItemID:request:completionHandler:", v22, 0, v15, v21);

  }
  else
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[FPDDomain _providedItemAtURL:didGainPresenterWithInfo:].cold.1();

  }
  __fp_leave_section_Debug();

}

void __57__FPDDomain__providedItemAtURL_didGainPresenterWithInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__FPDDomain__providedItemAtURL_didGainPresenterWithInfo___block_invoke_cold_1();

  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "presenterID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_OWORD *)(a1 + 80);
    v13[0] = *(_OWORD *)(a1 + 64);
    v13[1] = v12;
    objc_msgSend(v8, "addPresenter:itemID:urlHint:auditToken:promiseID:", v9, v5, v10, v13, v11);
  }
  else
  {
    objc_msgSend(v8, "forgetPromiseForPresenterWithID:promiseID:", v9, *(_QWORD *)(a1 + 56));
  }

}

- (void)_providedItemAtURL:(id)a3 didLosePresenterWithID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t section;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  fpfs_adopt_log();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  section = __fp_create_section();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "fp_shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v16 = section;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v7;
    _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Item at %@ losing presenter %@", buf, 0x20u);

  }
  if (-[FPDDomain _wantsPresenterNotifications](self, "_wantsPresenterNotifications"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    objc_msgSend(WeakRetained, "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presenterManager");
    v11 = objc_claimAutoreleasedReturnValue();

    -[NSObject removePresenter:](v11, "removePresenter:", v7);
  }
  else
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FPDDomain _providedItemAtURL:didGainPresenterWithInfo:].cold.1();
  }

  __fp_leave_section_Debug();
  __fp_pop_log();

}

- (void)_providedItemAtURL:(id)a3 withPresenterWithID:(id)a4 didMoveToURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id WeakRetained;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  FPDDomainBackend *defaultBackend;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t section;
  id v34;
  uint8_t buf[32];
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  fpfs_adopt_log();
  v34 = (id)objc_claimAutoreleasedReturnValue();
  section = __fp_create_section();
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "fp_shortDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fp_shortDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = section;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v9;
    v36 = 2112;
    v37 = v23;
    _os_log_debug_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Item at %@, presenter %@, moving to %@", buf, 0x2Au);

  }
  if (-[FPDDomain _wantsPresenterNotifications](self, "_wantsPresenterNotifications"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    objc_msgSend(WeakRetained, "server");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presenterManager");
    v14 = objc_claimAutoreleasedReturnValue();

    -[NSObject presenterWithID:](v14, "presenterWithID:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      memset(buf, 0, sizeof(buf));
      objc_msgSend(v15, "auditToken");
      -[NSObject removePresenter:](v14, "removePresenter:", v9);
      v17 = -[NSObject promisePresenterWithID:](v14, "promisePresenterWithID:", v9);
      defaultBackend = self->_defaultBackend;
      +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __65__FPDDomain__providedItemAtURL_withPresenterWithID_didMoveToURL___block_invoke;
      v26[3] = &unk_1E8C773A8;
      v27 = v10;
      v28 = v14;
      v20 = v9;
      v31 = *(_OWORD *)buf;
      v32 = *(_OWORD *)&buf[16];
      v29 = v20;
      v30 = v17;
      -[FPDDomainBackend itemIDForURL:requireProviderItemID:request:completionHandler:](defaultBackend, "itemIDForURL:requireProviderItemID:request:completionHandler:", v27, 0, v19, v26);

    }
    else
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "fp_shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fp_shortDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v25;
        _os_log_error_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_ERROR, "[ERROR] Move of a presenter %@ from %@ to %@ notified but no previous presenter existed", buf, 0x20u);

      }
    }

  }
  else
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[FPDDomain _providedItemAtURL:didGainPresenterWithInfo:].cold.1();
  }

  __fp_leave_section_Debug();
  __fp_pop_log();

}

void __65__FPDDomain__providedItemAtURL_withPresenterWithID_didMoveToURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__FPDDomain__providedItemAtURL_withPresenterWithID_didMoveToURL___block_invoke_cold_1();

  }
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_OWORD *)(a1 + 80);
    v13[0] = *(_OWORD *)(a1 + 64);
    v13[1] = v12;
    objc_msgSend(v8, "addPresenter:itemID:urlHint:auditToken:promiseID:", v9, v5, v10, v13, v11);
  }
  else
  {
    objc_msgSend(v8, "forgetPromiseForPresenterWithID:promiseID:", v9, *(_QWORD *)(a1 + 56));
  }

}

- (void)_movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t section;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  section = __fp_create_section();
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "fp_shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "destinationDirectoryURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fp_shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v23 = section;
    v24 = 2112;
    v25 = v15;
    v26 = 2112;
    v27 = v17;
    _os_log_debug_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Checking if download is required for moving %@ to %@", buf, 0x20u);

  }
  -[FPDDomain defaultBackend](self, "defaultBackend");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__FPDDomain__movingItemAtURL_withInfo_completionHandler___block_invoke;
  v18[3] = &unk_1E8C773D0;
  v13 = v8;
  v19 = v13;
  v14 = v10;
  v20 = v14;
  objc_msgSend(v12, "movingItemAtURL:withInfo:completionHandler:", v13, v9, v18);

  __fp_leave_section_Debug();
}

void __57__FPDDomain__movingItemAtURL_withInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __57__FPDDomain__movingItemAtURL_withInfo_completionHandler___block_invoke_cold_1(v3, a1, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_registerFileCoordinatorAndSpaceForceWithCompletion:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  FPDDomain *v16;
  BOOL v17;
  NSOperationQueue *providedItemsOperationQueue;
  NSOperationQueue *v19;
  NSObject *serialQueue;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  id obj;
  dispatch_block_t block;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  FPDDomain *v35;
  uint64_t v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[16];
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  block = a3;
  fpfs_adopt_log();
  v48 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CAAC18], "runningInSyncBubble"))
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_INFO, "[INFO] shared iPad: skipping file coordination registration because we're just finishing sync", buf, 2u);
    }

    dispatch_async((dispatch_queue_t)self->_serialQueue, block);
  }
  else
  {
    v27 = (void *)objc_opt_new();
    v5 = dispatch_group_create();
    WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    objc_msgSend(WeakRetained, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_loadWeakRetained((id *)&self->_provider);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ no provider"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDDomain _registerFileCoordinatorAndSpaceForceWithCompletion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 1604, (const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
    }
    if (!v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ no provider identifier"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDDomain _registerFileCoordinatorAndSpaceForceWithCompletion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 1605, (const char *)objc_msgSend(objc_retainAutorelease(v23), "UTF8String"));
    }
    obj = (id)fileCoordinationProviderByURL;
    objc_sync_enter(obj);
    v8 = (void *)MEMORY[0x1E0C99E60];
    -[FPDDomain coordinationRootURLs](self, "coordinationRootURLs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend((id)fileCoordinationProviderByURL, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend((id)fileCoordinationProviderByURL, "objectForKeyedSubscript:", v14, obj, block);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "delegate");
          v16 = (FPDDomain *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == self;

          if (v17)
          {
            dispatch_group_enter(v5);
            if (objc_msgSend(v29, "containsObject:", v14))
            {
              providedItemsOperationQueue = self->_providedItemsOperationQueue;
              v37[0] = MEMORY[0x1E0C809B0];
              v37[1] = 3221225472;
              v37[2] = __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke;
              v37[3] = &unk_1E8C773F8;
              v37[4] = self;
              v38 = v27;
              v39 = v14;
              v40 = v15;
              v41 = v5;
              v42 = v28;
              -[NSOperationQueue addOperationWithBlock:](providedItemsOperationQueue, "addOperationWithBlock:", v37);

            }
            else
            {
              objc_msgSend((id)fileCoordinationProviderByURL, "removeObjectForKey:", v14);
              v19 = self->_providedItemsOperationQueue;
              v32[0] = MEMORY[0x1E0C809B0];
              v32[1] = 3221225472;
              v32[2] = __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_150;
              v32[3] = &unk_1E8C77420;
              v33 = v15;
              v34 = v5;
              v35 = self;
              v36 = v14;
              -[NSOperationQueue addOperationWithBlock:](v19, "addOperationWithBlock:", v32);

            }
          }

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v11);
    }

    objc_sync_exit(obj);
    -[FPDDomain _registerInSpaceForce](self, "_registerInSpaceForce");
    serialQueue = self->_serialQueue;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_151;
    v30[3] = &unk_1E8C77448;
    v31 = block;
    dispatch_group_notify(v5, serialQueue, v30);

  }
  __fp_pop_log();

}

void __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  id WeakRetained;
  NSObject *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  unsigned __int8 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));

  objc_msgSend(*(id *)(a1 + 32), "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));

  if ((v4 & 1) == 0 && (v7 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 208));
    objc_msgSend(WeakRetained, "descriptor");
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject hasExplicitExtensionStorageURLs](v9, "hasExplicitExtensionStorageURLs"))
      goto LABEL_11;
    v10 = objc_msgSend(*(id *)(a1 + 32), "isUsingFPFS");

    if ((v10 & 1) != 0)
      goto LABEL_13;
  }
  v31 = 0;
  v11 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v12, &v31);
  v13 = v31;

  if (!(_DWORD)v11 || !v13)
  {
    v14 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v30 = 0;
    v16 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v30);
    WeakRetained = v30;
    if ((v16 & 1) != 0)
      goto LABEL_12;
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "fp_prettyDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v22;
      v34 = 2112;
      v35 = v23;
      v36 = 2112;
      v37 = v24;
      _os_log_error_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_ERROR, "[ERROR] ❌ Error preparing documentStorage directory %@ for provider %@: %@", buf, 0x20u);

    }
LABEL_11:

    goto LABEL_12;
  }
  WeakRetained = 0;
LABEL_12:

LABEL_13:
  if (objc_msgSend(*(id *)(a1 + 56), "isRegistered"))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "setRegistered:", 1);
    v17 = (void *)MEMORY[0x1E0CB3600];
    v18 = *(_QWORD *)(a1 + 56);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_149;
    v25[3] = &unk_1E8C75930;
    v25[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 72);
    v20 = *(_QWORD *)(a1 + 48);
    v21 = *(void **)(a1 + 56);
    v26 = v19;
    v27 = v20;
    v28 = v21;
    v29 = *(id *)(a1 + 64);
    objc_msgSend(v17, "_addFileProvider:completionHandler:", v18, v25);

  }
}

void __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_149(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_INFO, "[INFO] 🅿️ Registered file provider extension %@ (%@) for path %@: %@", buf, 0x2Au);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  __fp_pop_log();

}

void __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_150(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isRegistered") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRegistered:", 0);
    objc_msgSend(MEMORY[0x1E0CB3600], "_removeFileProvider:", *(_QWORD *)(a1 + 32));
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 48), "fp_prettyDescription");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 208));
      objc_msgSend(WeakRetained, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "fp_shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138413058;
      v9 = v3;
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] 🅾️ Deregistered file provider extension %@ (%@) for path %@: %@", (uint8_t *)&v8, 0x2Au);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

uint64_t __65__FPDDomain__registerFileCoordinatorAndSpaceForceWithCompletion___block_invoke_151(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_registerInSpaceForce
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SAPathManager *saPathManager;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  FPDDomain *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[FPDDomain isUsingFPFS](self, "isUsingFPFS") && FPFeatureFlagSpaceAttributionIsEnabled())
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[FPDDomain checkableURLs](self, "checkableURLs");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDDomain provider](self, "provider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = self;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: Space Attribution registration for paths %@ and bundle %@", buf, 0x20u);

    }
    -[FPDDomain checkableURLs](self, "checkableURLs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fp_map:", &__block_literal_global_153);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    saPathManager = self->_saPathManager;
    -[FPDDomain provider](self, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __34__FPDDomain__registerInSpaceForce__block_invoke_2;
    v12[3] = &unk_1E8C753A8;
    v12[4] = self;
    -[SAPathManager registerPaths:forBundleID:completionHandler:](saPathManager, "registerPaths:forBundleID:completionHandler:", v8, v11, v12);

  }
}

uint64_t __34__FPDDomain__registerInSpaceForce__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DA8BF0], "pathInfoWithURL:", a2);
}

void __34__FPDDomain__registerInSpaceForce__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __34__FPDDomain__registerInSpaceForce__block_invoke_2_cold_1(a1, v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "checkableURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_INFO, "[INFO] Paths %@ were registered in Space Attribution with bundle %@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)_unregisterFromFileCoordinatorAndSpaceForce
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  FPDDomain *v9;
  BOOL v10;
  NSOperationQueue *providedItemsOperationQueue;
  id obj;
  _QWORD v13[4];
  id v14;
  FPDDomain *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  obj = (id)fileCoordinationProviderByURL;
  objc_sync_enter(obj);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[FPDDomain coordinationRootURLs](self, "coordinationRootURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend((id)fileCoordinationProviderByURL, "objectForKeyedSubscript:", v7, obj);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "delegate");
        v9 = (FPDDomain *)objc_claimAutoreleasedReturnValue();
        v10 = v9 == self;

        if (v10)
        {
          objc_msgSend((id)fileCoordinationProviderByURL, "removeObjectForKey:", v7);
          providedItemsOperationQueue = self->_providedItemsOperationQueue;
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __56__FPDDomain__unregisterFromFileCoordinatorAndSpaceForce__block_invoke;
          v13[3] = &unk_1E8C75240;
          v14 = v8;
          v15 = self;
          v16 = v7;
          -[NSOperationQueue addOperationWithBlock:](providedItemsOperationQueue, "addOperationWithBlock:", v13);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

  objc_sync_exit(obj);
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_providedItemsOperationQueue, "waitUntilAllOperationsAreFinished");
  __fp_pop_log();

}

void __56__FPDDomain__unregisterFromFileCoordinatorAndSpaceForce__block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "isRegistered"))
  {
    objc_msgSend(a1[4], "setRegistered:", 0);
    objc_msgSend(MEMORY[0x1E0CB3600], "_removeFileProvider:", a1[4]);
    objc_msgSend(a1[5], "_unregisterURLFromSpaceForce:", a1[6]);
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1[5], "fp_prettyDescription");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)a1[5] + 26);
      objc_msgSend(WeakRetained, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "fp_shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a1[4];
      v8 = 138413058;
      v9 = v3;
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] 🅾️ Deregistered file provider extension %@ (%@) for path %@: %@", (uint8_t *)&v8, 0x2Au);

    }
  }
}

- (void)_unregisterURLFromSpaceForce:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  SAPathManager *saPathManager;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  FPDDomain *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FPDDomain isUsingFPFS](self, "isUsingFPFS") && FPFeatureFlagSpaceAttributionIsEnabled())
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[FPDDomain provider](self, "provider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v16 = self;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: Space Attribution unregistration for path %@ and bundle %@", buf, 0x20u);

    }
    saPathManager = self->_saPathManager;
    v14 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDDomain provider](self, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__FPDDomain__unregisterURLFromSpaceForce___block_invoke;
    v12[3] = &unk_1E8C75AC0;
    v12[4] = self;
    v13 = v4;
    -[SAPathManager unregisterURLs:forBundleID:completionHandler:](saPathManager, "unregisterURLs:forBundleID:completionHandler:", v9, v11, v12);

  }
}

void __42__FPDDomain__unregisterURLFromSpaceForce___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __42__FPDDomain__unregisterURLFromSpaceForce___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_INFO, "[INFO] Path %@ was unregistered from Space Attribution with bundle %@", (uint8_t *)&v9, 0x16u);

  }
}

- (BOOL)isProviderForRealPathURL:(id)a3
{
  id v4;
  char v5;
  FPDDomainBackend *extensionBackend;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[FPDDomainBackend isProviderForRealPathURL:](self->_defaultBackend, "isProviderForRealPathURL:", v4) & 1) != 0)
  {
LABEL_2:
    v5 = 1;
  }
  else
  {
    extensionBackend = self->_extensionBackend;
    if (self->_defaultBackend == extensionBackend)
    {
      if (!-[FPDDomain isConnectedToAppExtension](self, "isConnectedToAppExtension"))
      {
        -[FPDDomain provider](self, "provider");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "extensionStorageURLs");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSFileProviderDomain pathRelativeToDocumentStorage](self->_nsDomain, "pathRelativeToDocumentStorage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              v15 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * i);
              v16 = v15;
              v17 = v15;
              if (v9)
              {
                objc_msgSend(v15, "URLByAppendingPathComponent:", v9, (_QWORD)v20);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

              }
              v18 = objc_msgSend(v16, "fp_realPathRelationshipToItemAtRealPathURL:", v4, (_QWORD)v20);

              if (v18 != 2)
              {

                goto LABEL_2;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      v5 = 0;
    }
    else
    {
      v5 = -[FPDDomainBackend isProviderForRealPathURL:](extensionBackend, "isProviderForRealPathURL:", v4);
    }
  }

  return v5;
}

- (void)daemonSideItemChange:(id)a3 changedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  FPDDomain *v19;
  id v20;
  unint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a5;
  -[FPDDomain defaultBackend](self, "defaultBackend");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__FPDDomain_daemonSideItemChange_changedFields_request_completionHandler___block_invoke;
  v17[3] = &unk_1E8C774B0;
  v18 = v10;
  v19 = self;
  v20 = v11;
  v21 = a4;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v13, "bulkItemChanges:changedFields:request:completionHandler:", v14, a4, v12, v17);

}

void __74__FPDDomain_daemonSideItemChange_changedFields_request_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 56);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138413058;
      v17 = v13;
      v18 = 2048;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v11;
      _os_log_error_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_ERROR, "[ERROR] can't notify extension %@ of item change %lu for item %@; %@",
        (uint8_t *)&v16,
        0x2Au);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)didChangeItemID:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  v11 = a4;
  v12 = a5;
  v8 = v11;
  v9 = v12;
  v10 = v7;
  fp_dispatch_async_with_logs();

}

void __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  id WeakRetained;
  void *v8;
  char v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void (**v14)(id, void *);
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  int8x16_t v24;
  _QWORD v25[4];
  int8x16_t v26;
  id v27;
  id v28;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke_cold_1((uint64_t)a1, v2, v3);

  objc_msgSend(a1[4], "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *((_QWORD *)a1[5] + 16));

  if ((v5 & 1) == 0)
  {
    v14 = (void (**)(id, void *))a1[7];
    objc_msgSend(a1[4], "domainIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    FPInvalidParameterError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v16);

    return;
  }
  objc_msgSend(a1[4], "providerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)a1[5] + 26);
  objc_msgSend(WeakRetained, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    v14 = (void (**)(id, void *))a1[7];
    objc_msgSend(a1[4], "providerID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(a1[4], "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CAABD8]);

  v12 = a1[5];
  if (v11)
  {
    objc_msgSend(v12, "defaultBackend");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "workingSetDidChangeWithCompletionHandler:", a1[7]);

  }
  else
  {
    objc_msgSend(v12, "provider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "server");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v18, "presenterManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "signalPresentersForItemID:", a1[4]);

    objc_msgSend(a1[5], "defaultBackend");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_opt_respondsToSelector();

    v21 = a1[5];
    if ((v18 & 1) != 0)
    {
      objc_msgSend(v21, "defaultBackend");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke_162;
      v25[3] = &unk_1E8C75710;
      v24 = *((int8x16_t *)a1 + 2);
      v23 = (id)v24.i64[0];
      v26 = vextq_s8(v24, v24, 8uLL);
      v27 = a1[6];
      v28 = a1[7];
      objc_msgSend(v22, "didChangeItemID:completionHandler:", v23, v25);

    }
    else
    {
      objc_msgSend(v21, "callExtensionForItemDidChange:request:completionHandler:", a1[4], a1[6], a1[7]);
    }
  }
}

void __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke_162(id *a1)
{
  id v2;
  id v3;
  id v4;

  v2 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  fp_dispatch_async_with_logs();

}

uint64_t __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callExtensionForItemDidChange:request:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)callExtensionForItemDidChange:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *serialQueue;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a3;
  v9 = a5;
  serialQueue = self->_serialQueue;
  v11 = a4;
  dispatch_assert_queue_V2(serialQueue);
  -[FPDDomain session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "pid");

  objc_msgSend(v12, "existingFileProviderProxyWithTimeout:onlyAlreadyLifetimeExtended:pid:", 1, v13, 180.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__FPDDomain_callExtensionForItemDidChange_request_completionHandler___block_invoke;
  v17[3] = &unk_1E8C774D8;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v14, "didChangeItemID:completionHandler:", v16, v17);

}

void __69__FPDDomain_callExtensionForItemDidChange_request_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(void);
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
LABEL_9:
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  v5 = objc_msgSend(v3, "fp_isCocoaErrorCode:", 3072);
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__FPDDomain_callExtensionForItemDidChange_request_completionHandler___block_invoke_cold_1(a1, v4, v7);

    goto LABEL_9;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_INFO, "[INFO] Extension %@ signalled for item at %@ without active enumerators, not launching it", (uint8_t *)&v11, 0x16u);

  }
  v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_10:
  v10();

}

- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  -[FPDDomainBackend valuesForAttributes:forURL:request:completionHandler:](self->_defaultBackend, "valuesForAttributes:forURL:request:completionHandler:", a3, a4, a5, a6);
}

- (id)materializedURLForItemID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FPDDomainBackend materializedURLForItemID:](self->_defaultBackend, "materializedURLForItemID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)forceIngestionAtURL:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[FPDDomainBackend forceIngestionAtURL:](self->_defaultBackend, "forceIngestionAtURL:", v4);

}

- (void)forceFSIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[FPDDomainBackend forceFSIngestionForItemID:completionHandler:](self->_defaultBackend, "forceFSIngestionForItemID:completionHandler:", v7, v6);
  else
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);

}

- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FPDDomainBackend forceIngestionForItemID:completionHandler:](self->_defaultBackend, "forceIngestionForItemID:completionHandler:", v8, v6);
  }
  else
  {
    FPNotSupportedError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);

  }
}

- (void)downloadItemWithItemID:(id)a3 request:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FPDDomainBackend downloadItemWithItemID:request:progress:completionHandler:](self->_defaultBackend, "downloadItemWithItemID:request:progress:completionHandler:", v14, v10, v11, v12);
  }
  else
  {
    FPNotSupportedError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v13);

  }
}

- (void)downloadVersionThumbnail:(id)a3 version:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  FPDDomainBackend *defaultBackend;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  defaultBackend = self->_defaultBackend;
  objc_msgSend(v8, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "version");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__FPDDomain_downloadVersionThumbnail_version_completionHandler___block_invoke;
  v18[3] = &unk_1E8C77500;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  -[FPDDomainBackend fetchThumbnailsAtURL:versions:size:perThumbnailCompletionHandler:completionHandler:](defaultBackend, "fetchThumbnailsAtURL:versions:size:perThumbnailCompletionHandler:completionHandler:", v12, v14, v18, &__block_literal_global_175, 1024.0, 1024.0);

}

void __64__FPDDomain_downloadVersionThumbnail_version_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;

  v9 = a4;
  v10 = a7;
  if (v10)
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __64__FPDDomain_downloadVersionThumbnail_version_completionHandler___block_invoke_cold_1(a1, v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeItemAtURL:error:", v13, 0);

  }
}

- (void)downloadVersionWithItemID:(id)a3 etag:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FPDDomainBackend *defaultBackend;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    defaultBackend = self->_defaultBackend;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke;
    v16[3] = &unk_1E8C77598;
    v19 = v13;
    v16[4] = self;
    v17 = v11;
    v18 = v10;
    -[FPDDomainBackend itemForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:request:completionHandler:](defaultBackend, "itemForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:request:completionHandler:", v18, 0, 1, v12, v16);

  }
  else
  {
    FPNotSupportedError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, 0, v15);

  }
}

void __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v5 = a2;
  if (a3)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke_2;
    v27[3] = &unk_1E8C77548;
    v29 = a1[7];
    v7 = v5;
    v28 = v7;
    v8 = (void *)MEMORY[0x1D17D1C84](v27);
    objc_msgSend(a1[4], "versionsCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", a1[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10
      && (objc_msgSend(v10, "fpItemIdentifier"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isEqualToItemID:", a1[6]),
          v11,
          v12))
    {
      v13 = a1[4];
      objc_msgSend(v7, "providerItemID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "version");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "downloadVersionWithItemID:version:originalURL:completionHandler:", v14, v15, v16, v8);

    }
    else
    {
      v17 = (void *)*((_QWORD *)a1[4] + 14);
      objc_msgSend(v7, "fileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v6;
      v20[1] = 3221225472;
      v20[2] = __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke_3;
      v20[3] = &unk_1E8C77570;
      v18 = a1[5];
      v19 = a1[4];
      v21 = v18;
      v22 = v19;
      v23 = v7;
      v25 = v8;
      v26 = a1[7];
      v24 = a1[6];
      objc_msgSend(v17, "listRemoteVersionsOfItemAtURL:includeCachedVersions:completionHandler:", v14, 1, v20);

      v15 = v21;
    }

  }
}

uint64_t __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3, a4);
}

void __70__FPDDomain_downloadVersionWithItemID_etag_request_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "etag", (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v11)
        {
          v15 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 48), "providerItemID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "version");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "fileURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "downloadVersionWithItemID:version:originalURL:completionHandler:", v14, v16, v17, *(_QWORD *)(a1 + 64));

          v13 = v4;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }

  v12 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 56), "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FPItemNotFoundError();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v12 + 16))(v12, 0, 0, 0, v14);
LABEL_11:

}

- (void)downloadVersionWithItemID:(id)a3 version:(id)a4 originalURL:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FPDDomainBackend downloadVersionWithItemID:version:originalURL:completionHandler:](self->_defaultBackend, "downloadVersionWithItemID:version:originalURL:completionHandler:", v14, v10, v11, v12);
  }
  else
  {
    FPNotSupportedError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v13);

  }
}

- (int64_t)nonEvictableSpace
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[FPDDomainBackend nonEvictableSpace](self->_defaultBackend, "nonEvictableSpace");
  else
    return 0;
}

- (int64_t)accumulatedSizeOfPinnedItems
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[FPDDomainBackend accumulatedSizeOfPinnedItems](self->_defaultBackend, "accumulatedSizeOfPinnedItems");
  else
    return 0;
}

- (id)accumulatedSizeOfItems
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FPDDomainBackend accumulatedSizeOfItems](self->_defaultBackend, "accumulatedSizeOfItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)telemetryReportWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[FPDDomainBackend telemetryReportWithCompletionHandler:](self->_defaultBackend, "telemetryReportWithCompletionHandler:", v4);
  else
    v4[2](v4, 0);

}

- (id)providerVersion
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FPDDomainBackend providerVersion](self->_defaultBackend, "providerVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setSupportsSyncingTrash:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[FPDDomain nsDomain](self, "nsDomain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportsSyncingTrash:", v3);

}

- (void)setSupportsSearch:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[FPDDomain nsDomain](self, "nsDomain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportsSearch:", v3);

}

- (BOOL)supportsRemoteVersions
{
  void *v2;
  char v3;

  -[FPDDomain nsDomain](self, "nsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsRemoteVersions");

  return v3;
}

- (void)setSupportsRemoteVersions:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[FPDDomain nsDomain](self, "nsDomain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportsRemoteVersions:", v3);

}

- (void)dumpStateTo:(id)a3 limitNumberOfItems:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  id v9;
  void *v10;
  char v11;
  __CFString *v12;
  void *v13;
  int v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  id WeakRetained;
  char v37;
  void *v38;
  int v39;
  __CFString *v40;
  __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  void *v44;
  int v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  int v49;
  __CFString *v50;
  void *v51;
  int v52;
  __CFString *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t j;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  char v96;
  void *v97;
  void *v98;
  __CFString *v99;
  __CFString *v100;
  __CFString *v101;
  __CFString *v102;
  id v103;
  id v104;
  _BOOL4 v105;
  _QWORD v106[5];
  id v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v105 = a4;
  v119 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v103 = a5;
  v104 = a6;
  -[FPDDomain identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CAAB38]);

  objc_msgSend(v9, "write:", CFSTR("-----------------------------------------------------\n"));
  if ((v11 & 1) != 0)
  {
    v12 = CFSTR("(default)");
  }
  else
  {
    -[FPDDomain identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fp_obfuscatedFilename");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[FPDDomain nsDomain](self, "nsDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isHidden");
  v15 = &stru_1E8C795D8;
  v16 = CFSTR(" (hidden)");
  if (!v14)
    v16 = &stru_1E8C795D8;
  objc_msgSend(v9, "write:", CFSTR("domain: %@%@"), v12, v16);

  if ((v11 & 1) == 0)
  {

  }
  -[FPDDomain nsDomain](self, "nsDomain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    -[FPDDomain nsDomain](self, "nsDomain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fp_obfuscatedFilename");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "write:", CFSTR(" (%@)"), v22);

  }
  -[FPDDomain nsDomain](self, "nsDomain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "containsPhotos");

  if (v24)
    objc_msgSend(v9, "write:", CFSTR(" (photos)"));
  -[FPDDomain nsDomain](self, "nsDomain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "readOnly");

  if (v26)
    objc_msgSend(v9, "write:", CFSTR(" (readOnly)"));
  -[FPDDomain nsDomain](self, "nsDomain");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isErasable");

  if (v28)
    objc_msgSend(v9, "write:", CFSTR(" (erasable)"));
  -[FPDDomain nsDomain](self, "nsDomain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isContentManaged");

  if (v30)
  {
    objc_msgSend(v9, "startFgColor:", 1);
    objc_msgSend(v9, "startAttributes:", 2);
    objc_msgSend(v9, "write:", CFSTR(" (managed)"));
    objc_msgSend(v9, "reset");
  }
  objc_msgSend(v9, "write:", CFSTR("\n"));
  objc_msgSend(v9, "write:", CFSTR("-----------------------------------------------------\n"));
  -[FPDDomain session](self, "session");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dumpStateTo:", v9);

  if (!-[FPDDomain userEnabled](self, "userEnabled"))
  {
    objc_msgSend(v9, "startFgColor:", 3);
    objc_msgSend(v9, "write:", CFSTR("  + (⏹  user-disabled)\n"));
    objc_msgSend(v9, "reset");
  }
  if (self->_unableToStartup)
  {
    objc_msgSend(v9, "startFgColor:", 1);
    -[FPDDomain startupError](self, "startupError");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "fp_isFileProviderInternalError:", 22);

    if (v33)
    {
      objc_msgSend(v9, "write:", CFSTR("  + (⏹  unable to startup - needs reimport)\n"));
    }
    else
    {
      -[NSError fp_prettyDescription](self->_startupError, "fp_prettyDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "write:", CFSTR("  + (⏹  unable to startup)\n    %@\n"), v34);

    }
    objc_msgSend(v9, "reset");
  }
  if (-[FPDDomain disconnectionState](self, "disconnectionState") != 1)
  {
    objc_msgSend(v9, "startFgColor:", 3);
    -[FPDDomain disconnectionState](self, "disconnectionState");
    FPConnectionStateToPrettyString();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "write:", CFSTR("  + %@\n"), v35);
    objc_msgSend(v9, "reset");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v37 = objc_msgSend(WeakRetained, "isAppExtensionReachable");

  if ((v37 & 1) == 0)
  {
    objc_msgSend(v9, "startFgColor:", 3);
    objc_msgSend(v9, "write:", CFSTR("  + (❔ app-ext not reachable)\n"));
    objc_msgSend(v9, "reset");
  }
  if (-[FPDDomain ejectable](self, "ejectable"))
  {
    objc_msgSend(v9, "startFgColor:", 9);
    objc_msgSend(v9, "write:", CFSTR("  + (ejectable)\n"));
    objc_msgSend(v9, "reset");
  }
  -[FPDDomain nsDomain](self, "nsDomain");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isReplicated");

  v40 = CFSTR("repl,");
  if (!v39)
    v40 = &stru_1E8C795D8;
  v41 = v40;
  v42 = &stru_1E8C795D8;
  v43 = &stru_1E8C795D8;
  if (v39)
  {
    -[FPDDomain nsDomain](self, "nsDomain");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "supportsSyncingTrash");
    v46 = CFSTR("syncTrash,");
    if (!v45)
      v46 = &stru_1E8C795D8;
    v47 = v46;

    -[FPDDomain nsDomain](self, "nsDomain");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "supportsSearch");
    v50 = CFSTR("search,");
    if (!v49)
      v50 = &stru_1E8C795D8;
    v42 = v50;

    -[FPDDomain nsDomain](self, "nsDomain");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "supportsRemoteVersions");
    v53 = CFSTR("remoteVersions,");
    if (!v52)
      v53 = &stru_1E8C795D8;
    v43 = v53;

    v15 = v47;
  }
  v100 = (__CFString *)v43;
  v101 = (__CFString *)v42;
  objc_msgSend(v9, "write:", CFSTR("  + features: %@%@%@%@\n"), v41, v15, v42, v43);
  -[FPDDomain rootURLs](self, "rootURLs");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "count");

  v102 = v41;
  if (v55)
  {
    -[FPDDomain rootURLs](self, "rootURLs");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "count");

    if (v57 == 1)
    {
      -[FPDDomain rootURLs](self, "rootURLs");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "firstObject");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "fp_shortDescription");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "write:", CFSTR("  + root: %@\n"), v60);

    }
    else
    {
      objc_msgSend(v9, "write:", CFSTR("  + roots:\n"));
      v115 = 0u;
      v116 = 0u;
      v114 = 0u;
      v113 = 0u;
      -[FPDDomain rootURLs](self, "rootURLs");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v113, v118, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v114;
        do
        {
          for (i = 0; i != v62; ++i)
          {
            if (*(_QWORD *)v114 != v63)
              objc_enumerationMutation(v58);
            objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * i), "fp_shortDescription");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "write:", CFSTR("    + %@\n"), v65);

          }
          v62 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v113, v118, 16);
        }
        while (v62);
      }
    }

  }
  else
  {
    objc_msgSend(v9, "startFgColor:", 1);
    objc_msgSend(v9, "write:", CFSTR("  + no root\n"));
    objc_msgSend(v9, "reset");
  }
  objc_msgSend(v9, "write:", CFSTR("  + FPDDomain instance: <%@:%p>\n"), objc_opt_class(), self);
  objc_msgSend(v9, "write:", CFSTR("      - default backend: <%@:%p>\n"), objc_opt_class(), self->_defaultBackend);
  objc_msgSend(v9, "write:", CFSTR("      - extension backend: <%@:%p>\n"), objc_opt_class(), self->_extensionBackend);
  objc_msgSend(v9, "write:", CFSTR("      - deactivated backend: <%@:%p>\n"), objc_opt_class(), self->_deactivatedBackend);
  objc_msgSend(v9, "write:", CFSTR("      - volume: %@\n"), self->_volume);
  -[FPDDomain nsDomain](self, "nsDomain");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "personaIdentifier");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(v68, "descriptor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "personaIdentifier");
  v70 = objc_claimAutoreleasedReturnValue();
  if (v67 == (void *)v70)
  {

  }
  else
  {
    v71 = (void *)v70;
    -[FPDDomain nsDomain](self, "nsDomain");
    v99 = v15;
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "personaIdentifier");
    v98 = v68;
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_loadWeakRetained((id *)&self->_provider);
    objc_msgSend(v74, "descriptor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "personaIdentifier");
    v97 = v66;
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v73, "isEqual:", v76);

    v15 = v99;
    if ((v96 & 1) == 0)
      objc_msgSend(v9, "startFgColor:", 1);
  }
  -[FPDDomain nsDomain](self, "nsDomain");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "personaIdentifier");
  v78 = objc_claimAutoreleasedReturnValue();
  v79 = (void *)v78;
  v80 = CFSTR("none");
  if (v78)
    v80 = (const __CFString *)v78;
  objc_msgSend(v9, "write:", CFSTR("  + persona: %@\n"), v80);

  objc_msgSend(v9, "reset");
  -[FPDDomain nsDomain](self, "nsDomain");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "userInfo");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    -[FPDDomain nsDomain](self, "nsDomain");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "userInfo");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "write:", CFSTR("  + userInfo: %d keys\n"), objc_msgSend(v84, "count"));
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v85 = v84;
    v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
    if (v86)
    {
      v87 = v86;
      v88 = *(_QWORD *)v110;
      do
      {
        for (j = 0; j != v87; ++j)
        {
          if (*(_QWORD *)v110 != v88)
            objc_enumerationMutation(v85);
          v90 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * j);
          objc_msgSend(v85, "objectForKeyedSubscript:", v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "write:", CFSTR("      %@: %@\n"), v90, v91);

        }
        v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
      }
      while (v87);
    }

  }
  objc_msgSend(v9, "write:", CFSTR("  + indexer:\n"));
  -[FPDDomain indexer](self, "indexer");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "dumpStateTo:", v9);

  -[FPDDomain defaultBackend](self, "defaultBackend");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __70__FPDDomain_dumpStateTo_limitNumberOfItems_request_completionHandler___block_invoke;
  v106[3] = &unk_1E8C774D8;
  v106[4] = self;
  v107 = v9;
  v108 = v104;
  v94 = v104;
  v95 = v9;
  objc_msgSend(v93, "dumpStateTo:limitNumberOfItems:request:completionHandler:", v95, v105, v103, v106);

}

void __70__FPDDomain_dumpStateTo_limitNumberOfItems_request_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__FPDDomain_dumpStateTo_limitNumberOfItems_request_completionHandler___block_invoke_2;
  v8[3] = &unk_1E8C76790;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, v8);

}

void __70__FPDDomain_dumpStateTo_limitNumberOfItems_request_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 208));
  objc_msgSend(WeakRetained, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presenterManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentersForDomain:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "dumpStateTo:", *(_QWORD *)(a1 + 40), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR("\n"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)providerSupportURL
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;

  -[FPDDomain provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v5 = objc_msgSend(v4, "fp_isValidProviderIdentifierWithError:", &v18);
  v6 = v18;

  if ((v5 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[FPDDomain provider](self, "provider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomain providerSupportURL]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 2280, (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
  }
  -[FPDDomain volume](self, "volume");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDDomain provider](self, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSURL)supportURL
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;

  -[FPDDomain identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v4 = objc_msgSend(v3, "fp_isValidDomainIdentifierWithError:", &v15);
  v5 = v15;

  if ((v4 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[FPDDomain provider](self, "provider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDDomain supportURL]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDDomain.m", 2288, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  }
  -[FPDDomain providerSupportURL](self, "providerSupportURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDDomain identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setEjectable:(BOOL)a3
{
  self->_ejectable = a3;
}

- (void)setUnableToStartup:(BOOL)a3
{
  self->_unableToStartup = a3;
}

- (NSError)startupError
{
  return self->_startupError;
}

- (void)setStartupError:(id)a3
{
  objc_storeStrong((id *)&self->_startupError, a3);
}

- (NSString)purposeIdentifier
{
  return self->_purposeIdentifier;
}

- (FPDDomainBackend)deactivatedBackend
{
  return self->_deactivatedBackend;
}

- (NSMutableDictionary)filePresenters
{
  return self->_filePresenters;
}

- (void)setFilePresenters:(id)a3
{
  objc_storeStrong((id *)&self->_filePresenters, a3);
}

- (void)setDomainUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_domainUserInfo, a3);
}

- (void)setIndexer:(id)a3
{
  objc_storeStrong((id *)&self->_indexer, a3);
}

- (BOOL)shouldIndexWhenStart
{
  return self->_shouldIndexWhenStart;
}

- (void)setShouldIndexWhenStart:(BOOL)a3
{
  self->_shouldIndexWhenStart = a3;
}

- (NSData)fpfsRootBookmarkData
{
  return self->_fpfsRootBookmarkData;
}

- (void)setFpfsRootBookmarkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (Class)fpfsTestingBackendClass
{
  return self->_fpfsTestingBackendClass;
}

- (void)setFpfsTestingBackendClass:(Class)a3
{
  objc_storeStrong((id *)&self->_fpfsTestingBackendClass, a3);
}

- (NSURL)stateURL
{
  return self->_stateURL;
}

- (NSCache)versionsCache
{
  return self->_versionsCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionsCache, 0);
  objc_storeStrong((id *)&self->_stateURL, 0);
  objc_storeStrong((id *)&self->_fpfsTestingBackendClass, 0);
  objc_storeStrong((id *)&self->_fpfsRootBookmarkData, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_domainUserInfo, 0);
  objc_storeStrong((id *)&self->_filePresenters, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_deactivatedBackend, 0);
  objc_storeStrong((id *)&self->_purposeIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionStorageURLs, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_startupError, 0);
  objc_storeStrong((id *)&self->_nsDomain, 0);
  objc_storeStrong((id *)&self->_nsDomainOrNilForDefault, 0);
  objc_storeStrong((id *)&self->_providerDomainID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_extensionBackend, 0);
  objc_storeStrong((id *)&self->_defaultBackend, 0);
  objc_storeStrong((id *)&self->_extCallOutQueue, 0);
  objc_storeStrong((id *)&self->_saPathManager, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_rootCreationPacer, 0);
  objc_storeStrong((id *)&self->_previouslyAccessedSecurityScopedURL, 0);
  objc_storeStrong((id *)&self->_shouldDisconnectDueToLowDiskSpace, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_providedItemsOperationQueue, 0);
  objc_storeStrong((id *)&self->_providedItemRecursiveGenCountPerURL, 0);
  objc_storeStrong((id *)&self->_coordinatorMetadataPerURL, 0);
}

- (void)_shouldDisconnectDueToLowDiskSpace
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_19(&dword_1CF55F000, v0, v1, "[CRIT] domain %@ doesn't have a volume, cannot determine disk space state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __35__FPDDomain_refreshConnectionState__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] error in updateShouldRetryThrottledOperations: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)shouldDisconnectWithStartupError
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] [external rejected] Initializing disconnected provider for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)createRootURLWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] %@: is a hidden default domain, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)createRootURLWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] %@: is the default domain, fetching the root first", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)createRootURLWithCompletion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] %@: is not the default domain, creating a root right away", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __41__FPDDomain_createRootURLWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] %@: creating default root", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __41__FPDDomain_createRootURLWithCompletion___block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v1;
  OUTLINED_FUNCTION_20_0();
  v6 = v2;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v3, (uint64_t)v3, "[DEBUG] %@: can't get FP root, we'll retry once working set is signalled: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_94_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a3, v6, "[ERROR] domain %@ initialization failed with %@, disabling it", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

void __88__FPDDomain__startObservingRootAndResumeIndexerWithReason_userAllowedDBDrop_completion___block_invoke_94_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] domain initialization won't be attempted: provider rejected it with %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)createRootAndObserveIfNeededWithReason:userAllowedDBDrop:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] %@: need root creation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)createRootAndObserveIfNeededWithReason:userAllowedDBDrop:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] %@: root already created", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __81__FPDDomain_createRootAndObserveIfNeededWithReason_userAllowedDBDrop_completion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v6, v4, "[ERROR] %@: error while creating root for domain: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

- (void)_startWithReason:userAllowedDBDrop:completion:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_10_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v6, v4, "[ERROR] cannot create indexer for domain %@: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

- (void)cleanupDomainWithMode:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2080;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a4, a3, "[ERROR] failed removing domainSupportFolder at %@: %s", (uint8_t *)a2);
}

- (void)cleanupDomainWithMode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] removed support directory at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)cleanupDomainWithMode:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a3, (uint64_t)a3, "[DEBUG] no index to remove for %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_6_1();
}

- (void)cleanupDomainWithMode:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a3, (uint64_t)a3, "[DEBUG] removing index for %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_6_1();
}

void __35__FPDDomain_cleanupDomainWithMode___block_invoke_116_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_14(a1), "indexer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] async dropped index for %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] Request to materialize recursively from kernel, adding recursiveContentProviding key.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_ERROR, "[ERROR] readyID already registered", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __117__FPDDomain__provideItemAtURL_withReaderID_withProcessID_withAuditToken_kernelInfo_readingOptions_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] ☠️ NSFileCoordinator: already replied to coordination request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __54__FPDDomain__cancelProvidingItemAtURL_toReaderWithID___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, a3, "[ERROR] got cancellation request for unknown reader ID %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void __54__FPDDomain__cancelProvidingItemAtURL_toReaderWithID___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] 🗑  cancel progress %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)_writerWithID:didFinishWritingForURL:.cold.1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_19_0();
  v2 = (void *)v1;
  OUTLINED_FUNCTION_10_2(v1, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v7, v5, "[DEBUG] The item at %@ is provided by the domain %@", v6);

  OUTLINED_FUNCTION_6_1();
}

void __50__FPDDomain__writerWithID_didFinishWritingForURL___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[14];
  uint64_t v6;

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v2), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_2();
  v6 = v1;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v0, v4, "[DEBUG] can't retrieve item for URL %@; %@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)_providedItemAtURL:didGainPresenterWithInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] ignoring call for LocalStorage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __57__FPDDomain__providedItemAtURL_didGainPresenterWithInfo___block_invoke_cold_1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v2), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v5, "[ERROR] Item ID not found while adding presenter for item at %@: %@", v6);

  OUTLINED_FUNCTION_2();
}

void __65__FPDDomain__providedItemAtURL_withPresenterWithID_didMoveToURL___block_invoke_cold_1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v2), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v5, "[ERROR] Item ID not found while updating presenter for item at %@: %@", v6);

  OUTLINED_FUNCTION_2();
}

void __57__FPDDomain__movingItemAtURL_withInfo_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "requiresProviding"))
    v6 = "needs";
  else
    v6 = "doesn't need";
  objc_msgSend(*(id *)(a2 + 32), "fp_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "syncRootID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 136315650;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_debug_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %s providing %@ (sync root %@)", (uint8_t *)&v9, 0x20u);

  OUTLINED_FUNCTION_4_2();
}

void __34__FPDDomain__registerInSpaceForce__block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "checkableURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 138413058;
  v15 = v6;
  OUTLINED_FUNCTION_20_0();
  v16 = v7;
  v17 = v11;
  v18 = v9;
  v19 = v11;
  v20 = v12;
  OUTLINED_FUNCTION_22(&dword_1CF55F000, a3, v13, "[CRIT] %@: paths %@ for bundle %@ Space Attribution registration error: %@", (uint8_t *)&v14);

  OUTLINED_FUNCTION_15_1();
}

void __42__FPDDomain__unregisterURLFromSpaceForce___block_invoke_cold_1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_21();
  v18 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(v2 + 32);
  v4 = *(_QWORD *)(v2 + 40);
  objc_msgSend(v3, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138413058;
  v12 = v3;
  OUTLINED_FUNCTION_20_0();
  v13 = v4;
  v14 = v8;
  v15 = v6;
  v16 = v8;
  v17 = v9;
  OUTLINED_FUNCTION_22(&dword_1CF55F000, v0, v10, "[CRIT] %@: path %@ for bundle %@ Space Attribution unregistration error: %@", (uint8_t *)&v11);

  OUTLINED_FUNCTION_15_1();
}

void __55__FPDDomain_didChangeItemID_request_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315394;
  v5 = "-[FPDDomain didChangeItemID:request:completionHandler:]_block_invoke";
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a2, a3, "[DEBUG] %s: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void __69__FPDDomain_callExtensionForItemDidChange_request_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "fp_prettyDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138412802;
  v12 = v6;
  OUTLINED_FUNCTION_20_0();
  v13 = v7;
  v14 = v9;
  v15 = v10;
  _os_log_error_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Could not tell extension %@ that item at %@ did change. Error: %@", (uint8_t *)&v11, 0x20u);

  OUTLINED_FUNCTION_4_2();
}

void __64__FPDDomain_downloadVersionThumbnail_version_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  objc_msgSend((id)OUTLINED_FUNCTION_14(a1), "providerItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "etag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a2, v6, "[DEBUG] failed to download the thumbnail for %@: %@", v7);

  OUTLINED_FUNCTION_2();
}

@end
