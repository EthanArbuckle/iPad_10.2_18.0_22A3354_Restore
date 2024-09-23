@implementation NSFileProviderManager

+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 userAllowedDBDrop:(BOOL)a6 knownFolders:(id)a7 completionHandler:(id)a8
{
  objc_msgSend(a1, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:userAllowedDBDrop:knownFolders:synchronous:completionHandler:", a3, a4, a5, a6, a7, 0, a8);
}

+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 userAllowedDBDrop:(BOOL)a6 knownFolders:(id)a7 synchronous:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, id);
  id v20;
  _BOOL4 v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _BOOL4 v34;
  BOOL v35;
  _QWORD v36[4];
  id v37;
  id v38;
  void (**v39)(id, id);
  id v40;
  uint64_t v41;
  uint8_t buf[8];
  id v43;

  v11 = a6;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = (void (**)(id, id))a9;
  if (dyld_program_sdk_at_least())
  {
    v35 = a8;
    v20 = a1;
    v21 = v11;
    objc_msgSend(v15, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v23 = objc_msgSend(v22, "fp_isValidDomainIdentifierWithError:", &v43);
    v24 = v43;

    if ((v23 & 1) == 0)
    {
LABEL_9:
      v19[2](v19, v24);
      goto LABEL_10;
    }

    v11 = v21;
    a1 = v20;
    a8 = v35;
  }
  if (objc_msgSend(v18, "count"))
  {
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] Known folders are not supported outside of macOS", buf, 2u);
    }

    FPNotSupportedError();
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v24 = (id)v26;
    goto LABEL_9;
  }
  objc_msgSend(v15, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");

  if (!v28)
  {
    fp_current_or_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0A34000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] Domain identifier may not be empty.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("Domain identifier may not be empty."));
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v34 = v11;
  if (v17)
  {
    v41 = 0;
    +[FPSandboxingURLWrapper wrapperWithURL:readonly:error:](FPSandboxingURLWrapper, "wrapperWithURL:readonly:error:", v17, 0, &v41);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
    {

      v17 = 0;
    }
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EF0], "currentPersona");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "userPersonaUniqueString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (a8)
    +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  else
    +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __144__NSFileProviderManager_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_synchronous_completionHandler___block_invoke;
  v36[3] = &unk_1E444F410;
  v37 = v31;
  v38 = v15;
  v40 = a1;
  v39 = v19;
  v33 = v31;
  objc_msgSend(v32, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:", v38, v16, v24, v17, v34, v18, v36);

LABEL_10:
}

+ (void)addDomain:(NSFileProviderDomain *)domain completionHandler:(void *)completionHandler
{
  objc_msgSend(a1, "addDomain:userAllowedDBDrop:completionHandler:", domain, 0, completionHandler);
}

+ (void)addDomain:(id)a3 userAllowedDBDrop:(BOOL)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:userAllowedDBDrop:knownFolders:completionHandler:", a3, 0, 0, a4, MEMORY[0x1E0C9AA60], a5);
}

void __144__NSFileProviderManager_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_synchronous_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "fp_isFileProviderInternalError:", 3))
  {
    objc_msgSend(v6, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("parameter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("currentPersona"));

    if (v9)
    {
      objc_msgSend(v6, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("actual"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("expected"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v11);
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_FAULT);
      if ((v14 & 1) != 0)
      {
        if (v16)
        {
          v17 = *(_QWORD *)(a1 + 32);
          v21 = 138412802;
          v22 = v11;
          v23 = 2112;
          v24 = v13;
          v25 = 2112;
          v26 = v17;
          _os_log_fault_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_FAULT, "[CRIT] Called addDomain with an invalid persona; actual persona was %@, expected %@. Caller persona was %@.",
            (uint8_t *)&v21,
            0x20u);
        }
      }
      else if (v16)
      {
        __144__NSFileProviderManager_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_synchronous_completionHandler___block_invoke_cold_1();
      }

    }
  }
  if (v5)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fp_providerDomainIDFromProviderID:domainIdentifier:", v5, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "_registerNotificationsForProviderIdentifier:", v20);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)_initWithProviderIdentifier:(id)a3
{
  return -[NSFileProviderManager _initWithProviderIdentifier:domain:](self, "_initWithProviderIdentifier:domain:", a3, 0);
}

- (id)_initWithProviderIdentifier:(id)a3 groupName:(id)a4
{
  return -[NSFileProviderManager _initWithProviderIdentifier:groupName:domain:](self, "_initWithProviderIdentifier:groupName:domain:", a3, a4, 0);
}

- (id)_initWithProviderIdentifier:(id)a3 domain:(id)a4
{
  return -[NSFileProviderManager _initWithProviderIdentifier:groupName:domain:](self, "_initWithProviderIdentifier:groupName:domain:", a3, 0, a4);
}

- (id)_initWithProviderIdentifier:(id)a3 groupName:(id)a4 domain:(id)a5
{
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSFileProviderManager *v18;
  _FPFilePresenterObserver *v19;
  _FPFilePresenterObserver *presentedFileObserver;
  NSObject *v21;
  OS_dispatch_queue *v22;
  OS_dispatch_queue *signalUpdateQueue;
  OS_dispatch_source *v24;
  OS_dispatch_source *signalUpdateSource;
  OS_dispatch_group *v26;
  OS_dispatch_group *signalUpdateGroup;
  OS_dispatch_source *v28;
  NSObject *v29;
  dispatch_block_t v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *completionHandlersByItemID;
  FPProgressUpdater *v33;
  FPProgressUpdater *uploadProxy;
  FPProgressUpdater *v35;
  FPProgressUpdater *downloadProxy;
  id v37;
  void *v38;
  id v39;
  uint64_t v41;
  uint64_t v42;
  _QWORD block[4];
  id v44;
  id location;
  objc_super v46;

  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  if (_initWithProviderIdentifier_groupName_domain__onceToken != -1)
    dispatch_once(&_initWithProviderIdentifier_groupName_domain__onceToken, &__block_literal_global_52);
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "identifier");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v9 | v10)
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@;%@;%@"), v9, v10, v13);
  else
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13, v41, v42);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (id)fileProviderManagerByDomain;
  objc_sync_enter(v16);
  objc_msgSend((id)fileProviderManagerByDomain, "objectForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v16);

  if (!v17)
  {
    v46.receiver = self;
    v46.super_class = (Class)NSFileProviderManager;
    v18 = -[NSFileProviderManager init](&v46, sel_init);
    self = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_domain, a5);
      objc_storeStrong((id *)&self->_providerIdentifier, a3);
      objc_storeStrong((id *)&self->_groupName, a4);
      v19 = (_FPFilePresenterObserver *)objc_opt_new();
      presentedFileObserver = self->_presentedFileObserver;
      self->_presentedFileObserver = v19;

      -[_FPFilePresenterObserver setParentConnection:](self->_presentedFileObserver, "setParentConnection:", self);
      -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", &__block_literal_global_67);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (OS_dispatch_queue *)dispatch_queue_create("FPM-SignalUpdateQueue", v21);
      signalUpdateQueue = self->_signalUpdateQueue;
      self->_signalUpdateQueue = v22;

      v24 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, (dispatch_queue_t)self->_signalUpdateQueue);
      signalUpdateSource = self->_signalUpdateSource;
      self->_signalUpdateSource = v24;

      v26 = (OS_dispatch_group *)dispatch_group_create();
      signalUpdateGroup = self->_signalUpdateGroup;
      self->_signalUpdateGroup = v26;

      location = 0;
      objc_initWeak(&location, self);
      v28 = self->_signalUpdateSource;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__NSFileProviderManager__initWithProviderIdentifier_groupName_domain___block_invoke_3;
      block[3] = &unk_1E44499C0;
      objc_copyWeak(&v44, &location);
      v29 = v28;
      v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
      dispatch_source_set_event_handler(v29, v30);

      dispatch_resume((dispatch_object_t)self->_signalUpdateSource);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v31 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      completionHandlersByItemID = self->_completionHandlersByItemID;
      self->_completionHandlersByItemID = v31;

      v33 = objc_alloc_init(FPProgressUpdater);
      uploadProxy = self->_uploadProxy;
      self->_uploadProxy = v33;

      v35 = objc_alloc_init(FPProgressUpdater);
      downloadProxy = self->_downloadProxy;
      self->_downloadProxy = v35;

      -[FPProgressUpdater setProgress:](self->_uploadProxy, "setProgress:", 0);
      -[FPProgressUpdater setProgress:](self->_downloadProxy, "setProgress:", 0);
      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
    }
    v37 = (id)fileProviderManagerByDomain;
    objc_sync_enter(v37);
    objc_msgSend((id)fileProviderManagerByDomain, "objectForKey:", v15);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v38;
    if (v38)
      v39 = v38;
    else
      objc_msgSend((id)fileProviderManagerByDomain, "setObject:forKey:", self, v15);

    objc_sync_exit(v37);
    if (!v17)
    {
      self = self;
      v17 = self;
    }
  }

  return v17;
}

void __70__NSFileProviderManager__initWithProviderIdentifier_groupName_domain___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fileProviderManagerByDomain;
  fileProviderManagerByDomain = v0;

}

void __70__NSFileProviderManager__initWithProviderIdentifier_groupName_domain___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_signalPendingEnumerators");

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@:%@>"), objc_opt_class(), self, self->_providerIdentifier, self->_domain);
}

- (void)domainServicerWithCompletionHandler:(id)a3
{
  -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:](self, "fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:", a3 == 0, 0, a3);
}

+ (void)registerDomainServicer:(id)a3 forDomain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (createCaches_onceToken != -1)
    dispatch_once(&createCaches_onceToken, &__block_literal_global_562);
  v6 = (id)domainServicerByDomain;
  objc_sync_enter(v6);
  v7 = (void *)domainServicerByDomain;
  objc_msgSend(v5, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  objc_msgSend(v7, "setObject:forKey:", v11, v10);

  objc_sync_exit(v6);
}

+ (void)registerRootURL:(id)a3 forDomain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (createCaches_onceToken != -1)
    dispatch_once(&createCaches_onceToken, &__block_literal_global_562);
  v6 = (id)rootURLByDomain;
  objc_sync_enter(v6);
  v7 = (void *)rootURLByDomain;
  objc_msgSend(v5, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  objc_msgSend(v7, "setObject:forKey:", v11, v10);

  objc_sync_exit(v6);
}

- (void)_fetchDomainServicer:(id)a3 forProviderDomainID:(id)a4 handler:(id)a5
{
  objc_msgSend(a3, "fetchDomainServicerForProviderDomainID:handler:", a4, a5);
}

- (void)fetchDomainServicerSynchronously:(BOOL)a3 useOutgoingConnection:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v7;
  NSFileProviderManager *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSFileProviderManager *v28;
  FPDDomainServicing *v29;
  _BOOL4 isIncomingConnection;
  void *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSString *providerIdentifier;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  id v48;
  _BOOL4 v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void (**v53)(_QWORD, _QWORD);
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  uint64_t *v58;
  BOOL v59;
  uint8_t buf[8];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  id v65;
  id v66;
  _QWORD v67[5];
  id v68;
  id v69;
  char v70[32];
  uint64_t v71;

  v49 = a4;
  v5 = a3;
  v71 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = self;
  objc_sync_enter(v8);
  if (!v8->_providerIdentifier)
    -[NSFileProviderManager _cacheProviderInfo](v8, "_cacheProviderInfo");
  objc_sync_exit(v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[NSFileProviderDomain identifier](v8->_domain, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fp_obfuscatedFilename");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  if (v11)
    v13 = (const __CFString *)v11;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("domain servicer for %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke;
  v67[3] = &unk_1E444A070;
  v67[4] = v8;
  v15 = v7;
  v69 = v15;
  v16 = v14;
  v68 = v16;
  v53 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1B00850](v67);
  if (v8->_providerIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentPersona");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = 0;
    objc_msgSend(v50, "userPersonaUniqueString");
    v51 = objc_claimAutoreleasedReturnValue();
    -[NSFileProviderDomain personaIdentifier](v8->_domain, "personaIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v51 == v18)
    {
      v52 = 0;
      v26 = v51;
    }
    else
    {
      -[NSFileProviderDomain personaIdentifier](v8->_domain, "personaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[NSObject isEqualToString:](v51, "isEqualToString:", v19);

      if ((v20 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
        goto LABEL_17;
      v65 = 0;
      v21 = (void *)objc_msgSend(v50, "copyCurrentPersonaContextWithError:", &v65);
      v22 = v65;
      v23 = v66;
      v66 = v21;

      if (v22)
      {
        fp_current_or_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

      }
      -[NSFileProviderDomain personaIdentifier](v8->_domain, "personaIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "generateAndRestorePersonaContextWithPersonaUniqueString:", v25);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
      {
LABEL_17:
        v52 = 0;
        goto LABEL_20;
      }
      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        -[NSFileProviderDomain personaIdentifier](v8->_domain, "personaIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:].cold.1(v27, (uint64_t)v52, (uint64_t)v70);
      }
    }

LABEL_20:
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 1;
    v28 = v8;
    objc_sync_enter(v28);
    v29 = v28->_remoteFileProvider;
    isIncomingConnection = v28->_isIncomingConnection;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      if (createCaches_onceToken != -1)
        dispatch_once(&createCaches_onceToken, &__block_literal_global_562);
      -[NSFileProviderDomain identifier](v8->_domain, "identifier");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v32;
      v34 = CFSTR("NSFileProviderDomainDefaultIdentifier");
      if (v32)
        v34 = (__CFString *)v32;
      v35 = v34;

      v36 = (id)domainServicerByDomain;
      objc_sync_enter(v36);
      objc_msgSend((id)domainServicerByDomain, "objectForKey:", v35);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v36);

      isIncomingConnection = 1;
    }
    objc_sync_exit(v28);

    if (v31)
    {
      if (!isIncomingConnection || !v49)
      {
        if (v15)
          (*((void (**)(id, void *))v15 + 2))(v15, v31);
        goto LABEL_41;
      }
      fp_current_or_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0A34000, v37, OS_LOG_TYPE_INFO, "[INFO] forcing creation of a new connection to the daemon", buf, 2u);
      }

      *((_BYTE *)v62 + 24) = 0;
    }
    -[NSFileProviderManager _connection](v28, "_connection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v5)
      objc_msgSend(v38, "synchronousRemoteObjectProxyWithErrorHandler:", v53);
    else
      objc_msgSend(v38, "remoteObjectProxyWithErrorHandler:", v53);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v16;
    v42 = (void *)MEMORY[0x1E0CB3940];
    providerIdentifier = v8->_providerIdentifier;
    -[NSFileProviderDomain identifier](v8->_domain, "identifier");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    if (v44)
      v46 = (const __CFString *)v44;
    else
      v46 = CFSTR("NSFileProviderDomainDefaultIdentifier");
    objc_msgSend(v42, "fp_providerDomainIDFromProviderID:domainIdentifier:", providerIdentifier, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_132;
    v54[3] = &unk_1E444F158;
    v54[4] = v28;
    v58 = &v61;
    v16 = v41;
    v55 = v41;
    v48 = v39;
    v56 = v48;
    v59 = v49;
    v57 = v15;
    -[NSFileProviderManager _fetchDomainServicer:forProviderDomainID:handler:](v28, "_fetchDomainServicer:forProviderDomainID:handler:", v40, v47, v54);

LABEL_41:
    _Block_object_dispose(&v61, 8);

    _FPRestorePersona(&v66);
    goto LABEL_42;
  }
  FPProviderNotRegistered(0, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v53)[2](v53, v52);
LABEL_42:

}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  FPXPCAutomaticErrorProxy *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  FPXPCAutomaticErrorProxy *v16;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);

  if (*(_QWORD *)(a1 + 48))
  {
    v11 = [FPXPCAutomaticErrorProxy alloc];
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "fp_prettyDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (%@)"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FPXPCAutomaticErrorProxy initWithConnection:protocol:orError:name:requestPid:](v11, "initWithConnection:protocol:orError:name:requestPid:", 0, &unk_1EE5F7E00, v3, v15, 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_132(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  FPXPCAutomaticErrorProxy *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  FPXPCAutomaticErrorProxy *v19;
  NSObject *v20;
  uint64_t v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v13)
        __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_132_cold_3(a1 + 32, v10, v12);
    }
    else if (v13)
    {
      __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_132_cold_2(v10, v12);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  v14 = -[FPXPCAutomaticErrorProxy initWithConnection:protocol:orError:name:requestPid:]([FPXPCAutomaticErrorProxy alloc], "initWithConnection:protocol:orError:name:requestPid:", v7, &unk_1EE5F7E00, v10, *(_QWORD *)(a1 + 40), 0);
  v15 = a1 + 32;
  v16 = *(id *)(a1 + 32);
  objc_sync_enter(v16);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 16);
  if (v18)
  {
    if (!*(_BYTE *)(v17 + 24) || !*(_BYTE *)(a1 + 72))
    {
      v19 = v18;

      v14 = v19;
    }
  }
  else
  {
    if (*(_QWORD *)(v17 + 32) != *(_QWORD *)(a1 + 48))
    {
      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_132_cold_1(a1 + 32, (uint64_t *)(a1 + 48), v20);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      objc_storeStrong((id *)(*(_QWORD *)v15 + 16), v14);
      *(_BYTE *)(*(_QWORD *)v15 + 24) = 0;
    }
  }
  if (v8)
    +[NSFileProviderManager _registerNotificationsForProviderIdentifier:](NSFileProviderManager, "_registerNotificationsForProviderIdentifier:", v8);
  objc_sync_exit(v16);

  -[FPXPCAutomaticErrorProxy _t_setFilePresenterObserver:](v14, "_t_setFilePresenterObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v21 = *(_QWORD *)(a1 + 56);
  if (v21)
    (*(void (**)(uint64_t, FPXPCAutomaticErrorProxy *))(v21 + 16))(v21, v14);

}

+ (void)_registerNotificationsForProviderIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD handler[4];
  id v20;
  int out_token;

  v4 = a3;
  if (_registerNotificationsForProviderIdentifier__onceToken != -1)
    dispatch_once(&_registerNotificationsForProviderIdentifier__onceToken, &__block_literal_global_135);
  v5 = a1;
  objc_sync_enter(v5);
  if ((objc_msgSend((id)_registerNotificationsForProviderIdentifier__registeredNotificationDomains, "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.pendingSetChanged"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    out_token = 0;
    objc_msgSend(v6, "fp_libnotifyPerUserNotificationName");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    v9 = _registerNotificationsForProviderIdentifier__setNotificationQueue;
    v10 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __69__NSFileProviderManager__registerNotificationsForProviderIdentifier___block_invoke_2;
    handler[3] = &unk_1E444F180;
    v11 = v4;
    v20 = v11;
    notify_register_dispatch(v8, &out_token, v9, handler);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.materializedSetChanged"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fp_libnotifyPerUserNotificationName");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    v15 = _registerNotificationsForProviderIdentifier__setNotificationQueue;
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __69__NSFileProviderManager__registerNotificationsForProviderIdentifier___block_invoke_3;
    v17[3] = &unk_1E444F180;
    v16 = v11;
    v18 = v16;
    notify_register_dispatch(v14, &out_token, v15, v17);

    objc_msgSend((id)_registerNotificationsForProviderIdentifier__registeredNotificationDomains, "addObject:", v16);
  }
  objc_sync_exit(v5);

}

void __69__NSFileProviderManager__registerNotificationsForProviderIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v0 = objc_opt_new();
  v1 = (void *)_registerNotificationsForProviderIdentifier__registeredNotificationDomains;
  _registerNotificationsForProviderIdentifier__registeredNotificationDomains = v0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("set notifications", v4);
  v3 = (void *)_registerNotificationsForProviderIdentifier__setNotificationQueue;
  _registerNotificationsForProviderIdentifier__setNotificationQueue = (uint64_t)v2;

}

void __69__NSFileProviderManager__registerNotificationsForProviderIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fp_toDomainIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NSFileProviderPendingSetDidChange"), v2);

}

void __69__NSFileProviderManager__registerNotificationsForProviderIdentifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fp_toDomainIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NSFileProviderMaterializedSetDidChange"), v2);

}

- (id)_connection
{
  NSFileProviderManager *v2;
  FPDDaemon *connection;
  FPDDaemon *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  FPDDaemon *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id from;
  _QWORD v17[4];
  id v18;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (connection)
  {
    v4 = connection;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    v6 = (void *)objc_msgSend(v5, "newXPCConnection");

    location = 0;
    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __36__NSFileProviderManager__connection__block_invoke;
    v17[3] = &unk_1E44499C0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v6, "setInvalidationHandler:", v17);
    from = 0;
    objc_initWeak(&from, v6);
    v11 = v7;
    v12 = 3221225472;
    v13 = __36__NSFileProviderManager__connection__block_invoke_145;
    v14 = &unk_1E44499C0;
    objc_copyWeak(&v15, &from);
    objc_msgSend(v6, "setInterruptionHandler:", &v11);
    objc_msgSend(v6, "resume", v11, v12, v13, v14);
    v8 = v2->_connection;
    v2->_connection = (FPDDaemon *)v6;
    v9 = v6;

    v4 = v2->_connection;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  return v4;
}

void __36__NSFileProviderManager__connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_INFO, "[INFO] file provider manager connection invalidated", v8, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_sync_enter(v5);
    v6 = (void *)v5[4];
    v5[4] = 0;

    v7 = (void *)v5[2];
    v5[2] = 0;

    objc_sync_exit(v5);
  }

}

void __36__NSFileProviderManager__connection__block_invoke_145(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_INFO, "[INFO] file provider manager connection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

+ (NSFileProviderManager)legacyDefaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NSFileProviderManager_legacyDefaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (legacyDefaultManager_onceToken != -1)
    dispatch_once(&legacyDefaultManager_onceToken, block);
  return (NSFileProviderManager *)(id)legacyDefaultManager__defaultManager;
}

void __45__NSFileProviderManager_legacyDefaultManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithProviderIdentifier:domain:", 0, 0);
  v2 = (void *)legacyDefaultManager__defaultManager;
  legacyDefaultManager__defaultManager = v1;

}

- (id)itemIDForIdentifier:(id)a3
{
  id v4;
  FPItemID *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  FPItemID *v10;

  v4 = a3;
  v5 = [FPItemID alloc];
  -[NSFileProviderManager providerIdentifier](self, "providerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileProviderDomain identifier](self->_domain, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  v10 = -[FPItemID initWithProviderID:domainIdentifier:itemIdentifier:](v5, "initWithProviderID:domainIdentifier:itemIdentifier:", v6, v9, v4);

  return v10;
}

- (id)providerDomainID
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSFileProviderManager providerIdentifier](self, "providerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileProviderDomain identifier](self->_domain, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  objc_msgSend(v3, "fp_providerDomainIDFromProviderID:domainIdentifier:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)signalEnumeratorForContainerItemIdentifier:(NSFileProviderItemIdentifier)containerItemIdentifier completionHandler:(void *)completion
{
  NSString *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSFileProviderManager *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  NSFileProviderManager *v18;
  id v19;

  v6 = containerItemIdentifier;
  v7 = completion;
  -[NSFileProviderManager itemIDForIdentifier:](self, "itemIDForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[NSFileProviderManager signalEnumeratorForContainerItemIdentifier:completionHandler:].cold.1();

  v10 = self;
  objc_sync_enter(v10);
  -[NSMutableDictionary objectForKeyedSubscript:](v10->_completionHandlersByItemID, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_completionHandlersByItemID, "setObject:forKeyedSubscript:", v11, v8);
  }
  dispatch_group_enter((dispatch_group_t)v10->_signalUpdateGroup);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __86__NSFileProviderManager_signalEnumeratorForContainerItemIdentifier_completionHandler___block_invoke;
  v17 = &unk_1E4449AF8;
  v18 = v10;
  v12 = v7;
  v19 = v12;
  v13 = (void *)MEMORY[0x1A1B00850](&v14);
  objc_msgSend(v11, "addObject:", v13, v14, v15, v16, v17, v18);

  objc_sync_exit(v10);
  dispatch_source_merge_data((dispatch_source_t)v10->_signalUpdateSource, 1uLL);

}

void __86__NSFileProviderManager_signalEnumeratorForContainerItemIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 96));
}

- (void)waitForSignalDeliveryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *signalUpdateGroup;
  NSObject *signalUpdateQueue;
  id v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  signalUpdateGroup = self->_signalUpdateGroup;
  signalUpdateQueue = self->_signalUpdateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__NSFileProviderManager_waitForSignalDeliveryWithCompletionHandler___block_invoke;
  block[3] = &unk_1E444A840;
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(signalUpdateGroup, signalUpdateQueue, block);

}

uint64_t __68__NSFileProviderManager_waitForSignalDeliveryWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_callCompletionHandlers:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_signalUpdateQueue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_failToSignalPendingChangesWithError:(id)a3 completionHandlersByItemID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_signalUpdateQueue);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderManager.m"), 568, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSFileProviderManager _callCompletionHandlers:error:](self, "_callCompletionHandlers:error:", v14, v7);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)_signalPendingEnumerators
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13_3();
  v3 = v0;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v1, (uint64_t)v1, "[DEBUG] ┏%llx sending enumerator signals to daemon for domain %@", v2);
  OUTLINED_FUNCTION_3();
}

void __50__NSFileProviderManager__signalPendingEnumerators__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id obj;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v3;
  objc_msgSend(v3, "synchronousRemoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v23 = v10;
          v24 = 2112;
          v25 = v5;
          _os_log_debug_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] sending signal for %@ on %@", buf, 0x16u);
        }

        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __50__NSFileProviderManager__signalPendingEnumerators__block_invoke_156;
        v16[3] = &unk_1E444DE20;
        v16[4] = *(_QWORD *)(a1 + 40);
        v17 = v11;
        v13 = v11;
        objc_msgSend(v5, "didChangeItemID:completionHandler:", v10, v16);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }

}

uint64_t __50__NSFileProviderManager__signalPendingEnumerators__block_invoke_156(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callCompletionHandlers:error:", *(_QWORD *)(a1 + 40), a2);
}

- (void)registerURLSessionTask:(NSURLSessionTask *)task forItemWithIdentifier:(NSFileProviderItemIdentifier)identifier completionHandler:(void *)completion
{
  NSURLSessionTask *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  NSURLSessionTask *v17;
  NSString *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  NSString *v22;
  NSURLSessionTask *v23;
  id v24;
  SEL v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  NSURLSessionTask *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = task;
  v10 = identifier;
  v11 = completion;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderManager.m"), 610, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderManager.m"), 611, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_3:
  v12 = -[NSURLSessionTask state](v9, "state");
  if (v12 != 1)
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v28 = v14;
      v29 = 2048;
      v30 = 1;
      v31 = 2112;
      v32 = v9;
      v33 = 2048;
      v34 = -[NSURLSessionTask state](v9, "state");
      v35 = 2112;
      v36 = (id)objc_opt_class();
      v15 = v36;
      _os_log_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ must be called with a task in suspended (%li) state, but task %@ has state %li. %@ will suspend the task and resume it again to work around this. To avoid this warning, resume the task from the completion handler.", buf, 0x34u);

    }
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke;
  v21[3] = &unk_1E444F1F8;
  v21[4] = self;
  v22 = v10;
  v26 = v12 != 1;
  v24 = v11;
  v25 = a2;
  v23 = v9;
  v16 = v11;
  v17 = v9;
  v18 = v10;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v21);

}

void __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "itemIDForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_1E444F1D0;
  v7 = *(id *)(a1 + 48);
  v16 = *(_BYTE *)(a1 + 72);
  v15 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v5, "resolveItemID:completionHandler:", v6, v10);

}

void __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _BYTE v14[24];
  void *v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "set_publishingURL:", v5);
      }
      else
      {
        if (!*(_BYTE *)(a1 + 72))
        {
          fp_current_or_default_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(*(SEL *)(a1 + 64));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = *(void **)(a1 + 32);
            *(_DWORD *)v14 = 138413314;
            *(_QWORD *)&v14[4] = v10;
            *(_WORD *)&v14[12] = 2048;
            *(_QWORD *)&v14[14] = 1;
            *(_WORD *)&v14[22] = 2112;
            v15 = v11;
            *(_WORD *)v16 = 2048;
            *(_QWORD *)&v16[2] = objc_msgSend(v11, "state");
            *(_WORD *)&v16[10] = 2112;
            *(_QWORD *)&v16[12] = objc_opt_class();
            v12 = *(id *)&v16[12];
            _os_log_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ must be called with a task in suspended (%li) state, but task %@ has state %li. %@ will suspend the task and resume it again to work around this. To avoid this warning, resume the task from the completion handler.", v14, 0x34u);

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "suspend", *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, *(_OWORD *)v16, *(_QWORD *)&v16[16], v17);
        objc_msgSend(*(id *)(a1 + 32), "set_publishingURL:", v5);
        objc_msgSend(*(id *)(a1 + 32), "resume");
      }
    }
  }
  else if (v6)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke_2_cold_1(a1, v7, v8);

  }
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v7);

}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 completionHandler:(id)a4
{
  -[NSFileProviderManager deleteSearchableItemsWithSpotlightDomainIdentifiers:indexReason:completionHandler:](self, "deleteSearchableItemsWithSpotlightDomainIdentifiers:indexReason:completionHandler:", a3, 0, a4);
}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  NSFileProviderManager *v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__NSFileProviderManager_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke;
  v12[3] = &unk_1E444F220;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v16 = a4;
  v10 = v9;
  v11 = v8;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v12);

}

void __107__NSFileProviderManager_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__NSFileProviderManager_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2;
  v5[3] = &unk_1E4449AF8;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "deleteSearchableItemsWithSpotlightDomainIdentifiers:indexReason:completionHandler:", v3, v4, v5);

}

uint64_t __107__NSFileProviderManager_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)writePlaceholderAtURL:(id)a3 withDictionary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v13;

  v7 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a4, 200, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v9;
  if (v9)
  {
    NSLog(CFSTR("Could not serialize metadata. Error: %@"), v9);
    v11 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    v11 = objc_msgSend(v8, "writeToURL:options:error:", v7, 1, a5);
  }

  return v11;
}

+ (BOOL)writePlaceholderAtURL:(NSURL *)placeholderURL withMetadata:(NSFileProviderItem)metadata error:(NSError *)error
{
  NSURL *v9;
  NSFileProviderItem v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v9 = placeholderURL;
  v10 = metadata;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileProviderManager.m"), 696, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placeholderURL"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileProviderManager.m"), 697, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata"));

LABEL_3:
  if (!_CFURLIsItemPromiseAtURL())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_placeholderURLForURL_);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileProviderManager.m"), 698, CFSTR("%@ must be called with a url returned from %@"), v23, v24);

  }
  v12 = (void *)objc_opt_new();
  objc_msgSend(v11, "filename");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C99A90]);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "contentType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C99AD0]);

  }
  else
  {
    v16 = *MEMORY[0x1E0C99AD0];
    objc_msgSend(v11, "typeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v16);
  }

  objc_msgSend(v11, "documentSize");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C99998]);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C99978], *MEMORY[0x1E0C99968]);
  v18 = objc_msgSend(a1, "writePlaceholderAtURL:withDictionary:error:", v9, v12, error);

  return v18;
}

+ (NSURL)placeholderURLForURL:(NSURL *)url
{
  NSURL *v3;
  NSURL *v4;
  NSURL *v5;

  v3 = url;
  if (_CFURLIsItemPromiseAtURL())
    v4 = v3;
  else
    v4 = (NSURL *)_CFURLCopyPromiseURLOfLogicalURL();
  v5 = v4;

  return v5;
}

- (void)setEjectable:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NSFileProviderManager_setEjectable_completionHandler___block_invoke;
  v8[3] = &unk_1E444F248;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v8);

}

void __56__NSFileProviderManager_setEjectable_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__NSFileProviderManager_setEjectable_completionHandler___block_invoke_2;
  v5[3] = &unk_1E4449AF8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "setDomainEjectable:completionHandler:", v3, v5);

}

uint64_t __56__NSFileProviderManager_setEjectable_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_cacheProviderInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, v0, v1, "[ERROR] Could not look up containing app bundle (%{public}@).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t __43__NSFileProviderManager__cacheProviderInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSURL)documentStorageURL
{
  NSFileProviderManager *v3;
  NSURL *documentStorageURL;
  NSURL *v5;
  void *v7;

  v3 = self;
  objc_sync_enter(v3);
  documentStorageURL = v3->_documentStorageURL;
  if (!documentStorageURL)
  {
    -[NSFileProviderManager _cacheProviderInfo](v3, "_cacheProviderInfo");
    documentStorageURL = v3->_documentStorageURL;
    if (!documentStorageURL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("NSFileProviderManager.m"), 923, CFSTR("%@: documentStorageURL is not set. Extension may be missing %@ key, or current process may be missing necessary entitlements to access the specified container."), objc_opt_class(), CFSTR("NSExtensionFileProviderDocumentGroup"));

      documentStorageURL = v3->_documentStorageURL;
    }
  }
  v5 = documentStorageURL;
  objc_sync_exit(v3);

  return v5;
}

- (id)stateDirectoryURLWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  id v10;
  __CFString *v11;
  id v12;
  void *v13;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  __CFString *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  if (createCaches_onceToken != -1)
    dispatch_once(&createCaches_onceToken, &__block_literal_global_562);
  -[NSFileProviderDomain identifier](self->_domain, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  v9 = (id)stateURLByDomain;
  objc_sync_enter(v9);
  objc_msgSend((id)stateURLByDomain, "objectForKey:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v9);

  if (!v10)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__28;
    v31 = __Block_byref_object_dispose__28;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__28;
    v25 = __Block_byref_object_dispose__28;
    v26 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke;
    v17[3] = &unk_1E444F2D8;
    v11 = v8;
    v18 = v11;
    v19 = &v27;
    v20 = &v21;
    -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:](self, "fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:", 1, 0, v17);
    if (v28[5])
    {
LABEL_7:
      v12 = (id)stateURLByDomain;
      objc_sync_enter(v12);
      objc_msgSend((id)stateURLByDomain, "setObject:forKey:", v28[5], v11);
      objc_sync_exit(v12);

      v13 = (void *)v28[5];
      goto LABEL_10;
    }
    if (v22[5])
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v22[5];
      v22[5] = v15;

      v13 = (void *)v28[5];
      if (v13)
        goto LABEL_7;
    }
LABEL_10:
    if (a3 && !v13)
    {
      *a3 = objc_retainAutorelease((id)v22[5]);
      v13 = (void *)v28[5];
    }
    v10 = v13;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);

  }
  return v10;
}

void __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  __int128 v6;

  objc_msgSend(a2, "synchronousRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke_2;
  v4[3] = &unk_1E444F2B0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v3, "stateDirectoryWithCompletionHandler:", v4);

}

void __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  id *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a2, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke_2_cold_1(v7);

    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v7;
  }
  else
  {
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = a3;
  }
  objc_storeStrong(v9, v10);

}

- (NSURL)temporaryDirectoryURLWithError:(NSError *)error
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  pid_t v12;
  id v13;
  const char *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  _BOOL4 v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  __CFString *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  _QWORD v56[4];
  id v57;
  id v58;
  __CFString *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  char v78[32];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  if (createCaches_onceToken != -1)
    dispatch_once(&createCaches_onceToken, &__block_literal_global_562);
  -[NSFileProviderDomain identifier](self->_domain, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v8 = (id)temporaryURLByDomain;
  objc_sync_enter(v8);
  objc_msgSend((id)temporaryURLByDomain, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = v9;
    v12 = getpid();
    objc_msgSend(v11, "path");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");
    v15 = fpfs_lp_sandbox_check(v12, (uint64_t)"file-write-data", *MEMORY[0x1E0C806B0] | 1u, v14);

    if (!v15)
    {
      v41 = v11;
      v16 = 1;
      goto LABEL_13;
    }
    objc_msgSend((id)temporaryURLByDomain, "removeObjectForKey:", v7);
    if (objc_msgSend((id)cachedDirectoriesWithSecurityScope, "containsObject:", v11))
    {
      objc_msgSend(v11, "stopAccessingSecurityScopedResource");
      objc_msgSend((id)cachedDirectoriesWithSecurityScope, "removeObject:", v11);
    }
LABEL_12:
    v16 = 0;
LABEL_13:

    v10 = v9;
    goto LABEL_15;
  }
  v10 = 0;
  if (error)
    *error = (NSError *)objc_retainAutorelease(v9);
  v16 = 1;
LABEL_15:

  objc_sync_exit(v8);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentPersona");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = 0;
    objc_msgSend(v54, "userPersonaUniqueString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSFileProviderDomain personaIdentifier](self->_domain, "personaIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == v19)
    {

    }
    else
    {
      -[NSFileProviderDomain personaIdentifier](self->_domain, "personaIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "isEqualToString:", v20);

      if ((v21 & 1) == 0 && voucher_process_can_use_arbitrary_personas())
      {
        v70 = 0;
        v22 = (void *)objc_msgSend(v54, "copyCurrentPersonaContextWithError:", &v70);
        v23 = v70;
        v24 = v71;
        v71 = v22;

        if (v23)
        {
          fp_current_or_default_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

        }
        -[NSFileProviderDomain personaIdentifier](self->_domain, "personaIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "generateAndRestorePersonaContextWithPersonaUniqueString:", v26);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          fp_current_or_default_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            -[NSFileProviderDomain personaIdentifier](self->_domain, "personaIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:].cold.1(v28, (uint64_t)v53, (uint64_t)v78);
          }

LABEL_29:
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "temporaryDirectory");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v69 = 0;
          v31 = *MEMORY[0x1E0C99BC8];
          objc_msgSend(v30, "getResourceValue:forKey:error:", &v69, *MEMORY[0x1E0C99BC8], 0);
          v32 = v69;
          v33 = (id)rootURLByDomain;
          objc_sync_enter(v33);
          objc_msgSend((id)rootURLByDomain, "objectForKey:", v7);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_sync_exit(v33);

          v35 = v34 != 0;
          if (v32 && v34)
          {
            v68 = 0;
            objc_msgSend(v34, "getResourceValue:forKey:error:", &v68, v31, 0);
            v36 = v68;
            if (objc_msgSend(v32, "isEqual:", v36))
            {
              fp_current_or_default_log();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v30, "fp_shortDescription");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString fp_obfuscatedFilename](v7, "fp_obfuscatedFilename");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSFileProviderManager temporaryDirectoryURLWithError:].cold.1(v38, v39, (uint64_t)&v72);
              }

              v40 = (id)temporaryURLByDomain;
              objc_sync_enter(v40);
              objc_msgSend((id)temporaryURLByDomain, "setObject:forKey:", v30, v7);
              objc_sync_exit(v40);

              v10 = v30;
LABEL_48:

              _FPRestorePersona(&v71);
              goto LABEL_49;
            }

          }
          v72 = 0;
          v73 = &v72;
          v74 = 0x3032000000;
          v75 = __Block_byref_object_copy__28;
          v76 = __Block_byref_object_dispose__28;
          v77 = 0;
          v62 = 0;
          v63 = &v62;
          v64 = 0x3032000000;
          v65 = __Block_byref_object_copy__28;
          v66 = __Block_byref_object_dispose__28;
          v67 = 0;
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke;
          v56[3] = &unk_1E444F328;
          v57 = v32;
          v58 = v30;
          v42 = v7;
          v59 = v42;
          v60 = &v72;
          v61 = &v62;
          -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:](self, "fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:", 1, 0, v56);
          if (!v73[5])
          {
            if (!v63[5])
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
              v43 = objc_claimAutoreleasedReturnValue();
              v35 = v34 != 0;
              v44 = (void *)v63[5];
              v63[5] = v43;

              if (v73[5])
                v35 = 0;
            }
            if (v35)
            {
              v49 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend((id)v63[5], "fp_prettyDescription");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "stringWithFormat:", CFSTR("cannot get a temporary URL for domain %@: %@"), v42, v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              fp_current_or_default_log();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
                +[FPXExtensionContext principalClass].cold.1();

              __assert_rtn("-[NSFileProviderManager temporaryDirectoryURLWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/NSFileProviderManager.m", 1072, (const char *)objc_msgSend(objc_retainAutorelease(v51), "UTF8String"));
            }
          }
          v45 = (id)temporaryURLByDomain;
          objc_sync_enter(v45);
          v46 = v73[5];
          if (!v46)
            v46 = v63[5];
          objc_msgSend((id)temporaryURLByDomain, "setObject:forKey:", v46, v42);
          objc_sync_exit(v45);

          v47 = (void *)v73[5];
          if (error && !v47)
          {
            *error = (NSError *)objc_retainAutorelease((id)v63[5]);
            v47 = (void *)v73[5];
          }
          v10 = v47;

          _Block_object_dispose(&v62, 8);
          _Block_object_dispose(&v72, 8);

          goto LABEL_48;
        }
      }
    }
    v53 = 0;
    goto LABEL_29;
  }
LABEL_49:

  return (NSURL *)v10;
}

void __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  __int128 v8;

  objc_msgSend(a2, "synchronousRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2;
  v4[3] = &unk_1E444F300;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v3, "temporaryDirectoryWithCompletionHandler:", v4);

}

void __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void **v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v7, "getResourceValue:forKey:error:", &v17, *MEMORY[0x1E0C99BC8], 0);
  v8 = v17;
  v9 = (void *)a1[4];
  if (v9 && objc_msgSend(v9, "isEqual:", v8))
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_3((uint64_t)a1);
LABEL_14:

    v14 = (void *)a1[5];
    v13 = (void **)(*(_QWORD *)(a1[7] + 8) + 40);
    goto LABEL_16;
  }
  if (!v7)
  {
    if (!objc_msgSend(v6, "fp_isFeatureUnsupportedError"))
    {
      v13 = (void **)(*(_QWORD *)(a1[8] + 8) + 40);
      v14 = v6;
      goto LABEL_16;
    }
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_1((uint64_t)a1);
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "startAccessingSecurityScopedResource"))
  {
    v11 = (id)temporaryURLByDomain;
    objc_sync_enter(v11);
    objc_msgSend((id)cachedDirectoriesWithSecurityScope, "addObject:", v7);
    objc_sync_exit(v11);

  }
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_2(v7);

  v13 = (void **)(*(_QWORD *)(a1[7] + 8) + 40);
  v14 = v7;
LABEL_16:
  v15 = v14;
  v16 = *v13;
  *v13 = v15;

}

- (NSString)providerIdentifier
{
  NSFileProviderManager *v2;
  NSString *providerIdentifier;
  NSString *v4;

  v2 = self;
  objc_sync_enter(v2);
  providerIdentifier = v2->_providerIdentifier;
  if (!providerIdentifier)
  {
    -[NSFileProviderManager _cacheProviderInfo](v2, "_cacheProviderInfo");
    providerIdentifier = v2->_providerIdentifier;
  }
  v4 = providerIdentifier;
  objc_sync_exit(v2);

  return v4;
}

+ (id)resolvableErrorCodes
{
  if (resolvableErrorCodes_onceToken != -1)
    dispatch_once(&resolvableErrorCodes_onceToken, &__block_literal_global_205);
  return (id)resolvableErrorCodes__resolvableErrorCodes;
}

void __45__NSFileProviderManager_resolvableErrorCodes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -1000);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -1004);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -1003);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -2005);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -2010);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -5009);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v8, v1, v2, v3, v4, v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)resolvableErrorCodes__resolvableErrorCodes;
  resolvableErrorCodes__resolvableErrorCodes = v6;

}

- (BOOL)isErrorSupportedForSignalResolved:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FPResolveErrorItemIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("NSFileProviderErrorDomain")))
    {
      +[NSFileProviderManager resolvableErrorCodes](NSFileProviderManager, "resolvableErrorCodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "code"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "containsObject:", v9);

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (void)signalErrorResolved:(NSError *)error completionHandler:(void *)completionHandler
{
  NSError *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSError *v13;
  NSFileProviderManager *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  BOOL v18;

  v6 = error;
  v7 = completionHandler;
  v8 = -[NSFileProviderManager isErrorSupportedForSignalResolved:](self, "isErrorSupportedForSignalResolved:", v6);
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[NSFileProviderManager signalErrorResolved:completionHandler:].cold.1(v6, v10);

    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v18 = 0;
    v18 = -[NSError code](v6, "code") == -1000;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke;
    v12[3] = &unk_1E444F398;
    v16 = v17;
    v13 = v6;
    v14 = self;
    v15 = v7;
    -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:](self, "fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:", 0, 0, v12);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NSFileProviderManager signalErrorResolved:completionHandler:].cold.2(v6, v10);

    FPNotSupportedError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v11);

  }
}

void __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[5];
  __int128 v8;

  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke_2;
  v7[3] = &unk_1E444F370;
  v4 = *(_QWORD *)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(v3, "signalErrorResolved:completionHandler:", v4, v7);

}

void __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (v3 || !*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke_3;
    v5[3] = &unk_1E4449AF8;
    v4 = (void *)a1[5];
    v6 = (id)a1[4];
    v7 = v4;
    objc_msgSend(v6, "signalEnumeratorForContainerItemIdentifier:completionHandler:", CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), v5);

  }
}

uint64_t __63__NSFileProviderManager_signalErrorResolved_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getUserVisibleURLForItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  void *v6;
  NSString *v7;
  FPItemID *v8;
  NSString *providerIdentifier;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  FPItemID *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = completionHandler;
  v7 = itemIdentifier;
  v8 = [FPItemID alloc];
  providerIdentifier = self->_providerIdentifier;
  -[NSFileProviderDomain identifier](self->_domain, "identifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  v13 = -[FPItemID initWithProviderID:domainIdentifier:itemIdentifier:](v8, "initWithProviderID:domainIdentifier:itemIdentifier:", providerIdentifier, v12, v7);

  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__NSFileProviderManager_getUserVisibleURLForItemIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E444ABC0;
  v16[4] = self;
  v17 = v6;
  v15 = v6;
  objc_msgSend(v14, "fetchURLForItemID:completionHandler:", v13, v16);

}

uint64_t __78__NSFileProviderManager_getUserVisibleURLForItemIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)getIdentifierForUserVisibleFileAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  NSURL *v5;
  void *v6;
  void *v7;
  NSURL *v8;
  id v9;
  _QWORD v10[4];
  NSURL *v11;
  id v12;

  v5 = url;
  v6 = completionHandler;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__NSFileProviderManager_getIdentifierForUserVisibleFileAtURL_completionHandler___block_invoke;
  v10[3] = &unk_1E444F3C0;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "providerItemIDForURL:completionHandler:", v8, v10);

}

void __80__NSFileProviderManager_getIdentifierForUserVisibleFileAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v9, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "domainIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, id))(v6 + 16))(v6, v7, v8, v5);

  }
  else
  {
    if (v5)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD, id))(v6 + 16))(*(_QWORD *)(a1 + 40), 0, 0, v5);
      goto LABEL_6;
    }
    FPItemNotFoundErrorAtURL(*(void **)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v6 + 16))(v6, 0, 0, v7);
  }

LABEL_6:
}

+ (BOOL)checkDomainsCanBeStored:(BOOL *)a3 onVolumeAtURL:(id)a4 unsupportedReason:(unint64_t *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  BOOL v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v9 = a4;
  if ((FPFeatureFlagEbihilIsEnabled() & 1) != 0)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__28;
    v18 = __Block_byref_object_dispose__28;
    v19 = 0;
    +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87__NSFileProviderManager_checkDomainsCanBeStored_onVolumeAtURL_unsupportedReason_error___block_invoke;
    v13[3] = &unk_1E444F3E8;
    v13[4] = &v24;
    v13[5] = &v20;
    v13[6] = &v14;
    objc_msgSend(v10, "checkLocationEligibilityForDomain:completionHandler:", v9, v13);
    if (a3)
      *a3 = *((_BYTE *)v25 + 24);
    if (a5)
      *a5 = v21[3];
    if (a6)
      *a6 = objc_retainAutorelease((id)v15[5]);
    v11 = v15[5] == 0;

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
  }
  else if (a6)
  {
    FPNotSupportedError();
    v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __87__NSFileProviderManager_checkDomainsCanBeStored_onVolumeAtURL_unsupportedReason_error___block_invoke(_QWORD *a1, char a2, uint64_t a3, id obj)
{
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

+ (void)removeDomain:(NSFileProviderDomain *)domain mode:(NSFileProviderDomainRemovalMode)mode completionHandler:(void *)completionHandler
{
  NSFileProviderDomain *v7;
  void (**v8)(void *, _QWORD, void *);
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(void *, _QWORD, void *);

  v7 = domain;
  v8 = completionHandler;
  if ((unint64_t)mode >= (NSFileProviderDomainRemovalModePreserveDownloadedUserData|NSFileProviderDomainRemovalModePreserveDirtyUserData))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:description:", 22, CFSTR("Invalid options provided to removeDomain:options:%lu completionHandler:"), mode);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);

  }
  else
  {
    v9 = qword_1A0B53E80[mode];
    +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__NSFileProviderManager_removeDomain_mode_completionHandler___block_invoke;
    v12[3] = &unk_1E444D040;
    v13 = v8;
    objc_msgSend(v10, "removeDomain:mode:completionHandler:", v7, v9, v12);

  }
}

void __61__NSFileProviderManager_removeDomain_mode_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

+ (void)removeDomain:(NSFileProviderDomain *)domain completionHandler:(void *)completionHandler
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = completionHandler;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NSFileProviderManager_removeDomain_completionHandler___block_invoke;
  v8[3] = &unk_1E444ADF0;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "removeDomain:mode:completionHandler:", domain, 0, v8);

}

uint64_t __56__NSFileProviderManager_removeDomain_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)removeDomain:(id)a3 forProviderIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fp_providerDomainIDFromProviderID:domainIdentifier:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__NSFileProviderManager_removeDomain_forProviderIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E444D040;
  v16 = v7;
  v14 = v7;
  objc_msgSend(v10, "removeDomainAndPreserveDataWithID:mode:completionHandler:", v13, 0, v15);

}

uint64_t __78__NSFileProviderManager_removeDomain_forProviderIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)removeAllDomainsWithCompletionHandler:(void *)completionHandler
{
  objc_msgSend(a1, "removeAllDomainsForProviderIdentifier:completionHandler:", 0, completionHandler);
}

+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:userAllowedDBDrop:knownFolders:completionHandler:", a3, a4, 0, 0, MEMORY[0x1E0C9AA60], a5);
}

+ (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 persona:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentPersona");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v15, "userPersonaUniqueString");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 == v12
    || (objc_msgSend(v16, "isEqualToString:", v12) & 1) != 0
    || !voucher_process_can_use_arbitrary_personas())
  {
    v22 = 0;
  }
  else
  {
    v24 = 0;
    v18 = (void *)objc_msgSend(v15, "copyCurrentPersonaContextWithError:", &v24);
    v19 = v24;
    v20 = v25;
    v25 = v18;

    if (v19)
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

    }
    objc_msgSend(v15, "generateAndRestorePersonaContextWithPersonaUniqueString:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        +[NSFileProviderManager addDomain:forProviderIdentifier:persona:completionHandler:].cold.1();

    }
  }
  objc_msgSend(a1, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:userAllowedDBDrop:knownFolders:completionHandler:", v10, v11, 0, 0, MEMORY[0x1E0C9AA60], v13);

  _FPRestorePersona(&v25);
}

+ (void)removeAllDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllDomainsForProviderIdentifier:completionHandler:", v6, v5);

}

+ (void)getDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v7 = a3;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__NSFileProviderManager_getDomainsForProviderIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E444F438;
  v11 = v6;
  v12 = a1;
  v9 = v6;
  objc_msgSend(v8, "getDomainsForProviderIdentifier:completionHandler:", v7, v10);

}

void __75__NSFileProviderManager_getDomainsForProviderIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "fp_providerDomainIDFromProviderID:domainIdentifier:", v7, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "_registerNotificationsForProviderIdentifier:", v16);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)getDomainsWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = getDomainsWithCompletionHandler__onceToken;
  v5 = completionHandler;
  v7 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(&getDomainsWithCompletionHandler__onceToken, &__block_literal_global_222);
    v6 = v7;
  }
  objc_msgSend(a1, "getDomainsForProviderIdentifier:completionHandler:", 0, v6);

}

void __57__NSFileProviderManager_getDomainsWithCompletionHandler___block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  const char *v4;
  id v5;

  objc_msgSend(CFSTR("com.apple.fileprovider.providers-changed"), "fp_libnotifyPerUserNotificationName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.fileprovider.domain.changes", v1);
  v3 = (void *)getDomainsWithCompletionHandler__queue;
  getDomainsWithCompletionHandler__queue = (uint64_t)v2;

  v5 = objc_retainAutorelease(v0);
  v4 = (const char *)objc_msgSend(v5, "UTF8String");
  notify_register_dispatch(v4, (int *)&getDomainsWithCompletionHandler__notifyToken, (dispatch_queue_t)getDomainsWithCompletionHandler__queue, &__block_literal_global_226);

}

void __57__NSFileProviderManager_getDomainsWithCompletionHandler___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("NSFileProviderDomainDidChange"), 0);

}

+ (NSFileProviderManager)managerForDomain:(NSFileProviderDomain *)domain
{
  NSFileProviderDomain *v4;
  void *v5;

  v4 = domain;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithProviderIdentifier:domain:", 0, v4);

  return (NSFileProviderManager *)v5;
}

+ (NSFileProviderManager)managerWithProviderIdentifier:(id)a3 groupName:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithProviderIdentifier:groupName:domain:", v10, v9, v8);

  return (NSFileProviderManager *)v11;
}

+ (BOOL)fileProviderReadyForBackupOrMigrationForSourceURL:(id)a3 error:(id *)a4
{
  if (a4)
  {
    FPNotSupportedError();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)dealloc
{
  FPDDaemon *connection;
  id v4;
  objc_super v5;
  id location;

  location = 0;
  connection = self->_connection;
  v4 = objc_initWeak(&location, connection);
  -[FPDDaemon invalidate](connection, "invalidate");

  objc_destroyWeak(&location);
  v5.receiver = self;
  v5.super_class = (Class)NSFileProviderManager;
  -[NSFileProviderManager dealloc](&v5, sel_dealloc);
}

- (void)addDomain:(id)a3 userAllowedDBDrop:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_class();
  -[NSFileProviderManager providerIdentifier](self, "providerIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:userAllowedDBDrop:knownFolders:completionHandler:", v9, v11, 0, v5, MEMORY[0x1E0C9AA60], v8);

}

- (void)addDomain:(id)a3 completionHandler:(id)a4
{
  -[NSFileProviderManager addDomain:userAllowedDBDrop:completionHandler:](self, "addDomain:userAllowedDBDrop:completionHandler:", a3, 0, a4);
}

- (void)removeDomain:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  void (**v8)(id, _QWORD, void *);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  if ((unint64_t)a4 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:description:", 22, CFSTR("Invalid options provided to removeDomain:options:%lu completionHandler:"), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);
  }
  else
  {
    v9 = qword_1A0B53E80[a4];
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[NSFileProviderManager providerIdentifier](self, "providerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fp_providerDomainIDFromProviderID:domainIdentifier:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPProviderDomain removeDomainAndPreserveDataWithID:mode:completionHandler:](FPProviderDomain, "removeDomainAndPreserveDataWithID:mode:completionHandler:", v13, v9, v8);

  }
}

- (BOOL)removeDomain:(id)a3 options:(int64_t)a4 preservedLocation:(id *)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  if ((unint64_t)a4 >= 3)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:description:", 22, CFSTR("Invalid options provided to removeDomain:options:%lu completionHandler:"), a4);
      v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v11 = qword_1A0B53E80[a4];
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__28;
    v31 = __Block_byref_object_dispose__28;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__28;
    v25 = __Block_byref_object_dispose__28;
    v26 = 0;
    +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[NSFileProviderManager providerIdentifier](self, "providerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fp_providerDomainIDFromProviderID:domainIdentifier:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __70__NSFileProviderManager_removeDomain_options_preservedLocation_error___block_invoke;
    v20[3] = &unk_1E444F480;
    v20[4] = &v27;
    v20[5] = &v21;
    objc_msgSend(v12, "removeDomainAndPreserveDataWithID:mode:completionHandler:", v16, v11, v20);

    v17 = (void *)v22[5];
    v18 = v17 == 0;
    if (v17)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v17);
    }
    else if (a5)
    {
      objc_msgSend((id)v28[5], "url");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }

  return v18;
}

void __70__NSFileProviderManager_removeDomain_options_preservedLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)removeDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NSFileProviderManager_removeDomain_completionHandler___block_invoke;
  v8[3] = &unk_1E444ADF0;
  v9 = v6;
  v7 = v6;
  -[NSFileProviderManager removeDomain:options:completionHandler:](self, "removeDomain:options:completionHandler:", a3, 0, v8);

}

- (void)getDomainsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[NSFileProviderManager providerIdentifier](self, "providerIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDomainsForProviderIdentifier:completionHandler:", v6, v4);

}

- (void)removeAllDomainsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[NSFileProviderManager providerIdentifier](self, "providerIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllDomainsForProviderIdentifier:completionHandler:", v6, v4);

}

- (NSProgress)globalProgressForKind:(NSProgressFileOperationKind)kind
{
  NSString *v4;
  void *v5;
  void *v7;
  NSObject *v8;

  v4 = kind;
  if (!-[NSString isEqualToString:](v4, "isEqualToString:", *MEMORY[0x1E0CB30E0])
    && !-[NSString isEqualToString:](v4, "isEqualToString:", *MEMORY[0x1E0CB30B8]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid kind given for global progress: %@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[FPXExtensionContext principalClass].cold.1();

    __assert_rtn("-[NSFileProviderManager globalProgressForKind:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/NSFileProviderManager.m", 1626, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
  }
  -[NSFileProviderManager startObservingGlobalProgressForKind:](self, "startObservingGlobalProgressForKind:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSProgress *)v5;
}

- (void)startObservingUploadProgress
{
  void *v3;
  _QWORD v4[5];

  -[FPProgressUpdater progress](self->_uploadProxy, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__NSFileProviderManager_startObservingUploadProgress__block_invoke;
    v4[3] = &unk_1E444F4A8;
    v4[4] = self;
    -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v4);
  }
}

uint64_t __53__NSFileProviderManager_startObservingUploadProgress__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 120);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__NSFileProviderManager_startObservingUploadProgress__block_invoke_2;
  v5[3] = &unk_1E444A598;
  v5[4] = v2;
  return objc_msgSend(a2, "subscribeToUploadProgressUpdates:completionHandler:", v3, v5);
}

void __53__NSFileProviderManager_startObservingUploadProgress__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_10;
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]) || objc_msgSend(v4, "code") > 4223)
  {

    goto LABEL_9;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 <= 4096)
  {
LABEL_9:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setProgress:", 0);
    goto LABEL_10;
  }
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __53__NSFileProviderManager_startObservingUploadProgress__block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "startObservingUploadProgress");
LABEL_10:

}

- (void)startObservingDownloadProgress
{
  void *v3;
  _QWORD v4[5];

  -[FPProgressUpdater progress](self->_downloadProxy, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke;
    v4[3] = &unk_1E444F4A8;
    v4[4] = self;
    -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v4);
  }
}

uint64_t __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 112);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke_2;
  v5[3] = &unk_1E444A598;
  v5[4] = v2;
  return objc_msgSend(a2, "subscribeToDownloadProgressUpdates:completionHandler:", v3, v5);
}

void __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_10;
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]) || objc_msgSend(v4, "code") > 4223)
  {

    goto LABEL_9;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 <= 4096)
  {
LABEL_9:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setProgress:", 0);
    goto LABEL_10;
  }
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "startObservingDownloadProgress");
LABEL_10:

}

- (id)startObservingGlobalProgressForKind:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  FPProgressUpdater **p_downloadProxy;
  void *v10;
  void *v11;
  FPProgressProxy *v12;

  v4 = a3;
  v5 = v4;
  if (self->_domain)
  {
    v6 = *MEMORY[0x1E0CB30E0];
    v7 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB30E0]);
    v8 = (_QWORD *)MEMORY[0x1E0CB30B8];
    if (!v7
      || (p_downloadProxy = &self->_uploadProxy,
          -[FPProgressUpdater progress](self->_uploadProxy, "progress"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      if (!objc_msgSend(v5, "isEqualToString:", *v8))
        goto LABEL_7;
      p_downloadProxy = &self->_downloadProxy;
      -[FPProgressUpdater progress](self->_downloadProxy, "progress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_7;
    }
    -[FPProgressUpdater progress](*p_downloadProxy, "progress");
    v12 = (FPProgressProxy *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_7:
      v12 = objc_alloc_init(FPProgressProxy);
      -[FPProgressProxy setUpdateFileCount:](v12, "setUpdateFileCount:", 1);
      -[FPProgressProxy setCompletedUnitCount:](v12, "setCompletedUnitCount:", 1);
      -[FPProgressProxy setTotalUnitCount:](v12, "setTotalUnitCount:", 1);
      -[FPProgressProxy setFileCompletedCount:](v12, "setFileCompletedCount:", &unk_1E448E968);
      -[FPProgressProxy setFileTotalCount:](v12, "setFileTotalCount:", &unk_1E448E968);
      -[FPProgressProxy setKind:](v12, "setKind:", *MEMORY[0x1E0CB30F8]);
      -[FPProgressProxy setFileOperationKind:](v12, "setFileOperationKind:", v5);
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        -[FPProgressUpdater setProgress:](self->_uploadProxy, "setProgress:", v12);
        -[NSFileProviderManager startObservingUploadProgress](self, "startObservingUploadProgress");
      }
      if (objc_msgSend(v5, "isEqualToString:", *v8))
      {
        -[FPProgressUpdater setProgress:](self->_downloadProxy, "setProgress:", v12);
        -[NSFileProviderManager startObservingDownloadProgress](self, "startObservingDownloadProgress");
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSArray)presentedFiles
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPresentedFiles:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedFiles, 0);
  objc_storeStrong((id *)&self->_uploadProxy, 0);
  objc_storeStrong((id *)&self->_downloadProxy, 0);
  objc_storeStrong((id *)&self->_completionHandlersByItemID, 0);
  objc_storeStrong((id *)&self->_signalUpdateGroup, 0);
  objc_storeStrong((id *)&self->_signalUpdateSource, 0);
  objc_storeStrong((id *)&self->_signalUpdateQueue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_documentStorageURL, 0);
  objc_storeStrong((id *)&self->_presentedFileObserver, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteFileProvider, 0);
  objc_storeStrong((id *)&self->_sem, 0);
}

- (id)enumeratorForMaterializedItems
{
  return -[FPMaterializedSetEnumerator initWithManager:]([FPMaterializedSetEnumerator alloc], "initWithManager:", self);
}

- (id)enumeratorForPendingItems
{
  return -[FPPendingSetEnumerator initWithManager:]([FPPendingSetEnumerator alloc], "initWithManager:", self);
}

+ (void)importDomain:(NSFileProviderDomain *)domain fromDirectoryAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  NSURL *v9;
  void *v10;
  void *v11;
  NSFileProviderDomain *v12;

  v12 = domain;
  v9 = url;
  v10 = completionHandler;
  if (!-[NSFileProviderDomain isReplicated](v12, "isReplicated")
    && !-[NSFileProviderDomain isReplicated](v12, "isReplicated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileProviderManager.m"), 1970, CFSTR("Trying to import a non-replicated domain"));

  }
  objc_msgSend(a1, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:userAllowedDBDrop:knownFolders:completionHandler:", v12, 0, v9, 0, MEMORY[0x1E0C9AA60], v10);

}

- (void)reimportItemsBelowItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  NSString *v6;
  id v7;
  id v8;
  NSString *v9;
  _QWORD v10[4];
  NSString *v11;
  NSFileProviderManager *v12;
  id v13;

  v6 = itemIdentifier;
  v7 = completionHandler;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__NSFileProviderManager_Import__reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E444F658;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:](self, "fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:", 0, 1, v10);

}

void __88__NSFileProviderManager_Import__reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__NSFileProviderManager_Import__reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2;
  v4[3] = &unk_1E4449AF8;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "reimportItemsBelowItemWithIdentifier:completionHandler:", v3, v4);

}

uint64_t __88__NSFileProviderManager_Import__reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)requestModificationOfFields:(NSFileProviderItemFields)fields forItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier options:(NSFileProviderModifyItemOptions)options completionHandler:(void *)completionHandler
{
  NSString *v9;
  id v10;
  id v11;
  NSString *v12;
  _QWORD v13[4];
  NSString *v14;
  NSFileProviderManager *v15;
  id v16;
  NSFileProviderItemFields v17;

  v9 = itemIdentifier;
  v10 = completionHandler;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __109__NSFileProviderManager_Import__requestModificationOfFields_forItemWithIdentifier_options_completionHandler___block_invoke;
  v13[3] = &unk_1E444F220;
  v14 = v9;
  v15 = self;
  v16 = v10;
  v17 = fields;
  v11 = v10;
  v12 = v9;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v13);

}

void __109__NSFileProviderManager_Import__requestModificationOfFields_forItemWithIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __109__NSFileProviderManager_Import__requestModificationOfFields_forItemWithIdentifier_options_completionHandler___block_invoke_2;
  v5[3] = &unk_1E4449AF8;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "ingestFromCacheItemWithIdentifier:requestedFields:completionHandler:", v3, v4, v5);

}

uint64_t __109__NSFileProviderManager_Import__requestModificationOfFields_forItemWithIdentifier_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)importDomain:(id)a3 forProviderIdentifier:(id)a4 fromDirectoryAtURL:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v15, "isReplicated") & 1) == 0 && (objc_msgSend(v15, "isReplicated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileProviderManager.m"), 2058, CFSTR("Trying to import a non-replicated domain"));

  }
  objc_msgSend(a1, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:userAllowedDBDrop:knownFolders:completionHandler:", v15, v11, v12, 0, MEMORY[0x1E0C9AA60], v13);

}

+ (void)importDomain:(id)a3 forProviderIdentifier:(id)a4 fromDirectoryAtURL:(id)a5 knownFolders:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if ((objc_msgSend(v18, "isReplicated") & 1) == 0 && (objc_msgSend(v18, "isReplicated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileProviderManager.m"), 2064, CFSTR("Trying to import a non-replicated domain"));

  }
  objc_msgSend(a1, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:userAllowedDBDrop:knownFolders:completionHandler:", v18, v13, v14, 0, v15, v16);

}

+ (BOOL)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 knownFolders:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__28;
  v24 = __Block_byref_object_dispose__28;
  v25 = 0;
  v19[1] = 3221225472;
  v19[2] = __117__NSFileProviderManager_ImportPrivate__addDomain_forProviderIdentifier_byImportingDirectoryAtURL_knownFolders_error___block_invoke;
  v19[3] = &unk_1E444BE98;
  v19[4] = &v20;
  v19[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(a1, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:userAllowedDBDrop:knownFolders:synchronous:completionHandler:", v12, v13, v14, 0, v15, 1, v19);
  v16 = (void *)v21[5];
  if (a7 && v16)
  {
    *a7 = objc_retainAutorelease(v16);
    v16 = (void *)v21[5];
  }
  v17 = v16 == 0;
  _Block_object_dispose(&v20, 8);

  return v17;
}

void __117__NSFileProviderManager_ImportPrivate__addDomain_forProviderIdentifier_byImportingDirectoryAtURL_knownFolders_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (BOOL)addDomain:(id)a3 forProviderIdentifier:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:knownFolders:error:", a3, a4, 0, MEMORY[0x1E0C9AA60], a5);
}

+ (BOOL)importDomain:(id)a3 forProviderIdentifier:(id)a4 fromDirectoryAtURL:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:knownFolders:error:", a3, a4, a5, MEMORY[0x1E0C9AA60], a6);
}

- (void)waitForChangesOnItemsBelowItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  NSString *v6;
  id v7;
  id v8;
  NSString *v9;
  _QWORD v10[5];
  NSString *v11;
  id v12;

  v6 = itemIdentifier;
  v7 = completionHandler;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__NSFileProviderManager_Barrier__waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E444F658;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v10);

}

uint64_t __97__NSFileProviderManager_Barrier__waitForChangesOnItemsBelowItemWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "waitForChangesOnItemsBelowItemWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)waitForStabilizationWithCompletionHandler:(void *)completionHandler
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = completionHandler;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__NSFileProviderManager_Stabilization__waitForStabilizationWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E444F580;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v6);

}

uint64_t __82__NSFileProviderManager_Stabilization__waitForStabilizationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "waitForStabilizationWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)evictItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  NSString *v6;
  id v7;
  id v8;
  NSString *v9;
  _QWORD v10[4];
  NSString *v11;
  NSFileProviderManager *v12;
  id v13;

  v6 = itemIdentifier;
  v7 = completionHandler;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__NSFileProviderManager_Eviction__evictItemWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E444F658;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v10);

}

void __77__NSFileProviderManager_Eviction__evictItemWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__NSFileProviderManager_Eviction__evictItemWithIdentifier_completionHandler___block_invoke_2;
  v4[3] = &unk_1E4449AF8;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "evictItemWithIdentifier:completionHandler:", v3, v4);

}

void __77__NSFileProviderManager_Eviction__evictItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *MEMORY[0x1E0CB28A8];
  v8 = CFSTR("NSFileProviderErrorDomain");
  v9 = v3;
  v10 = *MEMORY[0x1E0CB2FE0];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_unwrappedErrorForDomains:", v6, v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v7);
}

- (void)lookupRequestingApplicationIdentifier:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v6, 0, v7);

}

- (void)ingestFromCacheItemWithIdentifier:(id)a3 requestedFields:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  NSFileProviderManager *v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __109__NSFileProviderManager_ForceIngestion__ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke;
  v12[3] = &unk_1E444F220;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v16 = a4;
  v10 = v9;
  v11 = v8;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v12);

}

void __109__NSFileProviderManager_ForceIngestion__ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __109__NSFileProviderManager_ForceIngestion__ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_2;
  v5[3] = &unk_1E4449AF8;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "ingestFromCacheItemWithIdentifier:requestedFields:completionHandler:", v3, v4, v5);

}

uint64_t __109__NSFileProviderManager_ForceIngestion__ingestFromCacheItemWithIdentifier_requestedFields_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)disconnectWithReason:(NSString *)localizedReason options:(NSFileProviderManagerDisconnectionOptions)options completionHandler:(void *)completionHandler
{
  NSFileProviderDomain *domain;
  void *v9;
  NSString *v10;
  id v11;

  domain = self->_domain;
  v9 = completionHandler;
  v10 = localizedReason;
  v11 = (id)-[NSFileProviderDomain copy](domain, "copy");
  objc_msgSend(v11, "setDisconnected:", 1);
  objc_msgSend(v11, "_setDisconnectionReason:", v10);

  objc_msgSend(v11, "_setDisconnectionOptions:", options);
  -[NSFileProviderManager addDomain:completionHandler:](self, "addDomain:completionHandler:", v11, v9);

}

- (void)reconnectWithCompletionHandler:(void *)completionHandler
{
  NSFileProviderDomain *domain;
  void *v5;
  id v6;

  domain = self->_domain;
  v5 = completionHandler;
  v6 = (id)-[NSFileProviderDomain copy](domain, "copy");
  objc_msgSend(v6, "setDisconnected:", 0);
  objc_msgSend(v6, "_setDisconnectionReason:", 0);
  objc_msgSend(v6, "_setDisconnectionOptions:", 0);
  -[NSFileProviderManager addDomain:completionHandler:](self, "addDomain:completionHandler:", v6, v5);

}

- (NSArray)listAvailableTestingOperationsWithError:(NSError *)error
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__28;
  v22 = __Block_byref_object_dispose__28;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__28;
  v16 = __Block_byref_object_dispose__28;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__NSFileProviderManager_TestingModeInteractive__listAvailableTestingOperationsWithError___block_invoke;
  v11[3] = &unk_1E444F680;
  v11[4] = &v18;
  v11[5] = &v12;
  -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:](self, "fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:", 1, 0, v11);
  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = 0;
    if (error)
      *error = (NSError *)objc_retainAutorelease(v6);
  }
  else
  {
    v8 = (void *)v19[5];
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderManager.m"), 2233, CFSTR("missing operations"));

      v8 = (void *)v19[5];
    }
    if (!v8)
      v8 = (void *)MEMORY[0x1E0C9AA60];
    v7 = v8;
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return (NSArray *)v7;
}

void __89__NSFileProviderManager_TestingModeInteractive__listAvailableTestingOperationsWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  __int128 v5;

  objc_msgSend(a2, "synchronousRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__NSFileProviderManager_TestingModeInteractive__listAvailableTestingOperationsWithError___block_invoke_2;
  v4[3] = &unk_1E444D440;
  v5 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "listAvailableTestingOperationsWithCompletionHandler:", v4);

}

void __89__NSFileProviderManager_TestingModeInteractive__listAvailableTestingOperationsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (NSDictionary)runTestingOperations:(NSArray *)operations error:(NSError *)error
{
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSArray *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  NSArray *v24;
  uint64_t *v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__28;
  v41 = __Block_byref_object_dispose__28;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__28;
  v35 = __Block_byref_object_dispose__28;
  v36 = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = operations;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (error)
          {
            FPInvalidParameterError((uint64_t)CFSTR("testingOperations"), (uint64_t)v7, v11, v12, v13, v14, v15, v16);
            v18 = 0;
            *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = 0;
          }
          v19 = v7;
          goto LABEL_22;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      if (v8)
        continue;
      break;
    }
  }

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __76__NSFileProviderManager_TestingModeInteractive__runTestingOperations_error___block_invoke;
  v23[3] = &unk_1E444F2D8;
  v24 = v7;
  v25 = &v37;
  v26 = &v31;
  -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:](self, "fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:", 1, 0, v23);
  v17 = (void *)v32[5];
  if (v17)
  {
    v18 = 0;
    if (error)
      *error = (NSError *)objc_retainAutorelease(v17);
  }
  else
  {
    v20 = (void *)v38[5];
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderManager.m"), 2266, CFSTR("missing operations"));

      v20 = (void *)v38[5];
    }
    if (!v20)
      v20 = (void *)MEMORY[0x1E0C9AA70];
    v18 = v20;
  }
  v19 = v24;
LABEL_22:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return (NSDictionary *)v18;
}

void __76__NSFileProviderManager_TestingModeInteractive__runTestingOperations_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(a2, "synchronousRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__NSFileProviderManager_TestingModeInteractive__runTestingOperations_error___block_invoke_2;
  v5[3] = &unk_1E444D490;
  v6 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v3, "runTestingOperations:completionHandler:", v4, v5);

}

void __76__NSFileProviderManager_TestingModeInteractive__runTestingOperations_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_test_existingProgressForKind:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB30E0]) & 1) != 0)
  {
    v5 = 120;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB30B8]))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = 112;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v5), "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (void)getServiceWithName:(NSFileProviderServiceName)serviceName itemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  NSString *v8;
  NSString *v9;
  id v10;
  id v11;
  NSString *v12;
  NSString *v13;
  _QWORD v14[4];
  NSString *v15;
  NSFileProviderManager *v16;
  NSString *v17;
  id v18;

  v8 = serviceName;
  v9 = itemIdentifier;
  v10 = completionHandler;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E444F6D0;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[NSFileProviderManager fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:](self, "fetchDomainServicerSynchronously:useOutgoingConnection:completionHandler:", 0, 0, v14);

}

void __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  id v12;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v4, "itemIDForIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_1E444F6A8;
  v12 = *(id *)(a1 + 56);
  v9 = *(int8x16_t *)(a1 + 32);
  v8 = (id)v9.i64[0];
  v11 = vextq_s8(v9, v9, 8uLL);
  objc_msgSend(v6, "startAccessingServiceWithName:itemID:completionHandler:", v3, v7, v10);

}

void __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  FPService *v9;
  void *v10;
  void *v11;
  FPService *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  FPService *v20;
  _QWORD block[4];
  FPService *v22;

  v7 = a2;
  v8 = a3;
  if (!v7 || a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = [FPService alloc];
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D4C98);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "providerDomainID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FPService initWithEndpoint:interface:lifetimeExtender:providerDomainID:](v9, "initWithEndpoint:interface:lifetimeExtender:providerDomainID:", v7, v10, v8, v11);

    v13 = dispatch_group_create();
    v14 = *(_QWORD *)(a1 + 48);
    v15 = objc_alloc(MEMORY[0x1E0CB3630]);
    v16 = *(_QWORD *)(a1 + 40);
    -[FPService remoteObjectProxyCreating](v12, "remoteObjectProxyCreating");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithName:endpointCreatingProxy:requestFinishedGroup:", v16, v17, v13);
    (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v18, 0);

    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E444A308;
    v22 = v12;
    v20 = v12;
    dispatch_group_notify(v13, v19, block);

  }
}

uint64_t __100__NSFileProviderManager_NSFileProviderService__getServiceWithName_itemIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)requestDownloadForItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier requestedRange:(NSRange)rangeToMaterialize completionHandler:(void *)completionHandler
{
  NSUInteger length;
  NSUInteger location;
  NSString *v9;
  id v10;
  id v11;
  NSString *v12;
  _QWORD v13[5];
  NSString *v14;
  id v15;
  NSUInteger v16;
  NSUInteger v17;

  length = rangeToMaterialize.length;
  location = rangeToMaterialize.location;
  v9 = itemIdentifier;
  v10 = completionHandler;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__NSFileProviderManager_Materialize__requestDownloadForItemWithIdentifier_requestedRange_completionHandler___block_invoke;
  v13[3] = &unk_1E444F6F8;
  v13[4] = self;
  v14 = v9;
  v16 = location;
  v17 = length;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v13);

}

void __108__NSFileProviderManager_Materialize__requestDownloadForItemWithIdentifier_requestedRange_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __108__NSFileProviderManager_Materialize__requestDownloadForItemWithIdentifier_requestedRange_completionHandler___block_invoke_2;
  v5[3] = &unk_1E4449AF8;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "materializeItemWithIdentifier:requestedRange:completionHandler:", v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v5);

}

void __108__NSFileProviderManager_Materialize__requestDownloadForItemWithIdentifier_requestedRange_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *MEMORY[0x1E0CB28A8];
  v8 = CFSTR("NSFileProviderErrorDomain");
  v9 = v3;
  v10 = *MEMORY[0x1E0CB2FE0];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_unwrappedErrorForDomains:", v6, v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v7);
}

- (void)getDiagnosticAttributesForItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  NSFileProviderManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__NSFileProviderManager_Diagnostics__getDiagnosticAttributesForItems_completionHandler___block_invoke;
  v10[3] = &unk_1E444F658;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](self, "domainServicerWithCompletionHandler:", v10);

}

void __88__NSFileProviderManager_Diagnostics__getDiagnosticAttributesForItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__NSFileProviderManager_Diagnostics__getDiagnosticAttributesForItems_completionHandler___block_invoke_2;
  v4[3] = &unk_1E444A7F0;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "getDiagnosticAttributesForItems:completionHandler:", v3, v4);

}

uint64_t __88__NSFileProviderManager_Diagnostics__getDiagnosticAttributesForItems_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)claimKnownFolders:(id)a3 localizedReason:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);

}

- (void)releaseKnownFolders:(unint64_t)a3 localizedReason:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);

}

- (void)fetchDomainServicerSynchronously:(void *)a1 useOutgoingConnection:(uint64_t)a2 completionHandler:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_16_0((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_19(&dword_1A0A34000, v6, v4, "[ERROR] Can't adopt persona %@: %@", v5);

  OUTLINED_FUNCTION_27();
}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, a2, a3, "[ERROR] failed fetching remote file provider with identifier %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_132_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v4 = *a2;
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, (uint64_t)a3, "[DEBUG] connection mismatch (%p, %p), it was probably invalidated while fetching the proxy. Not going to cache the domain servicer", (uint8_t *)&v5);
  OUTLINED_FUNCTION_3();
}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_132_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] Couldn't instantiate embedded file provider: %@\nCheck whether your application has a file provider extension embedded.", v5);

  OUTLINED_FUNCTION_6_1();
}

void __98__NSFileProviderManager_fetchDomainServicerSynchronously_useOutgoingConnection_completionHandler___block_invoke_132_cold_3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_4();
  v8 = v5;
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a3, v6, "[ERROR] Can't fetch remote file provider for identifier %@; %@", v7);

  OUTLINED_FUNCTION_7();
}

- (void)signalEnumeratorForContainerItemIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] signaling change on %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __88__NSFileProviderManager_registerURLSessionTask_forItemWithIdentifier_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint8_t v8[14];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_4();
  v9 = v4;
  v10 = v6;
  v11 = v7;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Failed registering URL session task %@ with item %@; %@",
    v8,
    0x20u);

}

void __52__NSFileProviderManager_stateDirectoryURLWithError___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v2, v3, "[DEBUG] caching state URL (daemon) %@ for domain %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)temporaryDirectoryURLWithError:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_16_0((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v7, v5, "[DEBUG] registering temporary URL (system) %@ for domain %@", v6);

  OUTLINED_FUNCTION_27();
}

void __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v2, v3, "[DEBUG] registering temporary URL (system) %@ for domain %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v2, v3, "[DEBUG] registering temporary URL (daemon) %@ for domain %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __56__NSFileProviderManager_temporaryDirectoryURLWithError___block_invoke_2_cold_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v2, v3, "[DEBUG] registering temporary URL (system) %@ for domain %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)signalErrorResolved:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Signaling as resolved error: %@", v4, 0xCu);

  OUTLINED_FUNCTION_6_1();
}

- (void)signalErrorResolved:(void *)a1 completionHandler:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] Failed signaling error as resolved: error %@ not supported.", v5);

  OUTLINED_FUNCTION_6_1();
}

void __144__NSFileProviderManager_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_synchronous_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13_3();
  v3 = v0;
  _os_log_fault_impl(&dword_1A0A34000, v1, OS_LOG_TYPE_FAULT, "[CRIT] Persona transmission failed. Caller persona was %@, fileproviderd received %@.", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

+ (void)addDomain:forProviderIdentifier:persona:completionHandler:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_19(&dword_1A0A34000, v1, (uint64_t)v1, "[ERROR] Can't adopt persona %@: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __53__NSFileProviderManager_startObservingUploadProgress__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] Restarting upload observation (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__NSFileProviderManager_startObservingDownloadProgress__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] Restarting download observation (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
