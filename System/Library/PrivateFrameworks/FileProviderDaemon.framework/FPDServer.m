@implementation FPDServer

- (FPDExtensionManager)extensionManager
{
  return self->_extensionManager;
}

uint64_t __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeUnlockedStatusAndSetup");
}

- (void)signalProviderChanges
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] posting provider changes notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *setupQueue;
  NSObject *v10;
  FPDXPCServicer *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  int v16;
  void *v17;
  BOOL v18;
  void *v19;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id from;
  id location;
  _QWORD block[5];
  uint8_t buf[4];
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_sync((dispatch_queue_t)self->_makeSureSetupEnqueued, &__block_literal_global_103);
  v8 = MEMORY[0x1E0C809B0];
  setupQueue = self->_setupQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_2;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_sync(setupQueue, block);
  if (self->_isUnlocked)
  {
    objc_msgSend(v7, "valueForEntitlement:", CFSTR("application-identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.BackupAgent")) & 1) != 0
      || (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.backupd")) & 1) != 0
      || self->_isPastBuddy)
    {
      FPDDaemonXPCInterface();
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExportedInterface:", v22);
      v11 = objc_alloc_init(FPDXPCServicer);
      -[FPDXPCServicer setServer:](v11, "setServer:", self);
      -[FPDXPCServicer setConnection:](v11, "setConnection:", v7);
      location = 0;
      objc_initWeak(&location, v7);
      from = 0;
      objc_initWeak(&from, v11);
      v25[0] = v8;
      v25[1] = 3221225472;
      v25[2] = __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_111;
      v25[3] = &unk_1E8C764B8;
      objc_copyWeak(&v26, &location);
      objc_copyWeak(&v27, &from);
      objc_msgSend(v7, "setInvalidationHandler:", v25);
      v23[0] = v8;
      v23[1] = 3221225472;
      v23[2] = __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_2_112;
      v23[3] = &unk_1E8C75E70;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v7, "setInterruptionHandler:", v23);
      objc_msgSend(v7, "setExportedObject:", v11);
      v12 = (void *)MEMORY[0x1E0CAACF0];
      fp_default_log();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setupWithLog:forConnection:", v13, v7);

      objc_msgSend(v7, "resume");
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = v6;
        v16 = objc_msgSend(v7, "processIdentifier");
        objc_msgSend(v7, "processIdentifier");
        FPExecutableNameForProcessIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v32 = v16;
        v33 = 2112;
        v34 = v17;
        _os_log_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_INFO, "[INFO] New connection from pid %d [%@]", buf, 0x12u);

        v6 = v15;
      }

      objc_destroyWeak(&v24);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      v18 = 1;
      v19 = (void *)v22;
    }
    else
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      v19 = v21;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[FPDServer listener:shouldAcceptNewConnection:].cold.2();
        v18 = 0;
        v19 = v21;
      }
      else
      {
        v18 = 0;
      }
    }

  }
  else
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FPDServer listener:shouldAcceptNewConnection:].cold.1();
    v18 = 0;
  }

  return v18;
}

- (FPDActionOperationEngine)operationEngine
{
  return self->_operationEngine;
}

- (FPDAppMonitor)appMonitor
{
  return self->_appMonitor;
}

- (void)_computeUnlockedStatusAndSetup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] [SIMULATED] Not instantiating file providers due to forced buddy state, stop forcing it with: 'fileproviderctl control exit_buddy_state'.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (FPDServer)init
{
  FPDServer *v2;
  FPDServer *v3;
  FPDActionOperationEngine *v4;
  FPDActionOperationEngine *operationEngine;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *setupQueue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *makeSureSetupEnqueued;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *afterSetupWorkQueue;
  dispatch_group_t v15;
  OS_dispatch_group *fileProviderManagerIsReadyGroup;
  uint64_t v17;
  FPDCacheDeleteService *cacheDelete;
  FPDTelemetryService *v19;
  FPDTelemetryService *telemetry;
  FPDVolumeManager *v21;
  FPDVolumeManager *volumeManager;
  FPDAppMonitor *v23;
  FPDAppMonitor *appMonitor;
  id v25;
  NSObject *v26;
  dispatch_queue_t v27;
  void *v28;
  double v29;
  uint64_t v30;
  FPPacer *signalProviderChangesPacer;
  FPPacer *v32;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  id location;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)FPDServer;
  v2 = -[FPDServer init](&v40, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FPDServer _initSignals](v2, "_initSignals");
    v4 = -[FPDActionOperationEngine initWithServer:]([FPDActionOperationEngine alloc], "initWithServer:", v3);
    operationEngine = v3->_operationEngine;
    v3->_operationEngine = v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("setup-queue", v6);
    setupQueue = v3->_setupQueue;
    v3->_setupQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("setup-enqueue", v9);
    makeSureSetupEnqueued = v3->_makeSureSetupEnqueued;
    v3->_makeSureSetupEnqueued = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("finishing-setup-queue", v12);
    afterSetupWorkQueue = v3->_afterSetupWorkQueue;
    v3->_afterSetupWorkQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_group_create();
    fileProviderManagerIsReadyGroup = v3->_fileProviderManagerIsReadyGroup;
    v3->_fileProviderManagerIsReadyGroup = (OS_dispatch_group *)v15;

    +[FPDCacheDeleteService sharedInstance](FPDCacheDeleteService, "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    cacheDelete = v3->_cacheDelete;
    v3->_cacheDelete = (FPDCacheDeleteService *)v17;

    v19 = objc_alloc_init(FPDTelemetryService);
    telemetry = v3->_telemetry;
    v3->_telemetry = v19;

    v21 = -[FPDVolumeManager initWithServer:]([FPDVolumeManager alloc], "initWithServer:", v3);
    volumeManager = v3->_volumeManager;
    v3->_volumeManager = v21;

    v23 = -[FPDAppMonitor initWithServer:]([FPDAppMonitor alloc], "initWithServer:", v3);
    appMonitor = v3->_appMonitor;
    v3->_appMonitor = v23;

    objc_msgSend(CFSTR("com.apple.fileprovider.providers-changed"), "fp_libnotifyPerUserNotificationName");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    notify_register_check((const char *)objc_msgSend(v25, "UTF8String"), &v3->_providerChangeNotificationToken);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("signalProviderChangesQueue", v26);

    +[FPDConfigurationStore defaultStore](FPDConfigurationStore, "defaultStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (double)(int)objc_msgSend(v28, "lowPrioritySignalProviderChangesIntervalSeconds");

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAAC90]), "initWithName:queue:minFireInterval:", CFSTR("signalProviderChanges"), v27, v29);
    signalProviderChangesPacer = v3->_signalProviderChangesPacer;
    v3->_signalProviderChangesPacer = (FPPacer *)v30;

    location = 0;
    objc_initWeak(&location, v3);
    v32 = v3->_signalProviderChangesPacer;
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __17__FPDServer_init__block_invoke;
    v37 = &unk_1E8C75E70;
    objc_copyWeak(&v38, &location);
    -[FPPacer setEventBlock:](v32, "setEventBlock:", &v34);
    -[FPPacer resume](v3->_signalProviderChangesPacer, "resume", v34, v35, v36, v37);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __17__FPDServer_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "signalProviderChanges");

}

- (void)signalProviderChangesWithLowPriority
{
  -[FPPacer signal](self->_signalProviderChangesPacer, "signal");
}

- (void)_initSignals
{
  const dispatch_source_type_s *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *sigIntSrc;
  OS_dispatch_source *v6;
  OS_dispatch_source *sigQuitSrc;
  OS_dispatch_source *v8;
  OS_dispatch_source *sigTermSrc;
  uint64_t v10;
  OS_dispatch_source *v11;
  NSObject *v12;
  dispatch_block_t v13;
  OS_dispatch_source *v14;
  NSObject *v15;
  dispatch_block_t v16;
  OS_dispatch_source *v17;
  NSObject *v18;
  dispatch_block_t v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD block[5];

  signal(13, (void (__cdecl *)(int))1);
  signal(1, (void (__cdecl *)(int))1);
  signal(30, (void (__cdecl *)(int))1);
  signal(31, (void (__cdecl *)(int))1);
  signal(3, (void (__cdecl *)(int))1);
  signal(15, (void (__cdecl *)(int))1);
  signal(2, (void (__cdecl *)(int))1);
  v3 = (const dispatch_source_type_s *)MEMORY[0x1E0C80DC0];
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DC0], 2uLL, 0, 0);
  sigIntSrc = self->_sigIntSrc;
  self->_sigIntSrc = v4;

  v6 = (OS_dispatch_source *)dispatch_source_create(v3, 3uLL, 0, 0);
  sigQuitSrc = self->_sigQuitSrc;
  self->_sigQuitSrc = v6;

  v8 = (OS_dispatch_source *)dispatch_source_create(v3, 0xFuLL, 0, 0);
  sigTermSrc = self->_sigTermSrc;
  self->_sigTermSrc = v8;

  v10 = MEMORY[0x1E0C809B0];
  v11 = self->_sigIntSrc;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__FPDServer__initSignals__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  v12 = v11;
  v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_source_set_event_handler(v12, v13);

  v14 = self->_sigQuitSrc;
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __25__FPDServer__initSignals__block_invoke_2;
  v21[3] = &unk_1E8C75E48;
  v21[4] = self;
  v15 = v14;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v21);
  dispatch_source_set_event_handler(v15, v16);

  v17 = self->_sigTermSrc;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __25__FPDServer__initSignals__block_invoke_3;
  v20[3] = &unk_1E8C75E48;
  v20[4] = self;
  v18 = v17;
  v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v20);
  dispatch_source_set_event_handler(v18, v19);

  dispatch_resume((dispatch_object_t)self->_sigIntSrc);
  dispatch_resume((dispatch_object_t)self->_sigQuitSrc);
  dispatch_resume((dispatch_object_t)self->_sigTermSrc);
}

uint64_t __25__FPDServer__initSignals__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleExitSignal:", 2);
}

uint64_t __25__FPDServer__initSignals__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleExitSignal:", 3);
}

uint64_t __25__FPDServer__initSignals__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleExitSignal:", 15);
}

- (void)materializeURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDExtensionManager domainForURL:reason:](self->_extensionManager, "domainForURL:reason:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "serialQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__FPDServer_materializeURL_completion___block_invoke;
    block[3] = &unk_1E8C75C50;
    v15 = v10;
    v16 = v6;
    v17 = v7;
    dispatch_async(v11, block);

    v12 = v15;
  }
  else
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FPDServer materializeURL:completion:].cold.1();

    FPInvalidURLError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }

}

void __39__FPDServer_materializeURL_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__FPDServer_materializeURL_completion___block_invoke_2;
  v6[3] = &unk_1E8C75420;
  v7 = *(id *)(a1 + 48);
  v5 = (id)objc_msgSend(v2, "startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:", v3, CFSTR("materializeURL"), 0, v4, v6);

}

void __39__FPDServer_materializeURL_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__FPDServer_materializeURL_completion___block_invoke_2_cold_1(v3, v4);

    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v5();

}

- (void)handleExitSignal:(int)a3
{
  NSObject *v5;
  FPDServer *v6;
  SEL v7;
  int v8;
  int v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = strsignal(a3);
    _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] starting exit sequence because of received signal (%s)", (uint8_t *)&v9, 0xCu);
  }

  v6 = (FPDServer *)-[FPDServer exitWithCode:](self, "exitWithCode:", 0);
  -[FPDServer exitWithCode:](v6, v7, v8);
}

- (void)exitWithCode:(int)a3
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] exiting with code %d...", (uint8_t *)v5, 8u);
  }

  exit(a3);
}

- (void)_setup
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_9();
  _os_log_fault_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_FAULT, "[CRIT] There is no need to call setupFileProviderManager twice!", v1, 2u);
  OUTLINED_FUNCTION_5();
}

uint64_t __19__FPDServer__setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "providersDidChange");
}

uint64_t __19__FPDServer__setup__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "loadAdditionalVolumesWithCompletion:", &__block_literal_global_6);
  return objc_msgSend(*(id *)(a1 + 32), "_finishSetup");
}

- (void)purge
{
  FPDExtensionManager *extensionManager;
  id v3;

  extensionManager = self->_extensionManager;
  -[FPDServer fpdPurgerClass](self, "fpdPurgerClass");
  v3 = (id)objc_opt_new();
  -[FPDExtensionManager purge:](extensionManager, "purge:", v3);

}

- (void)_finishSetup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] registering task to auto-delete old trashed items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __25__FPDServer__finishSetup__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  _xpc_activity_s *v20;
  uint8_t buf[16];

  v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_INFO, "[INFO] remove trashed items older than 30 days", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "extensionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "providerWithIdentifier:reason:", CFSTR("com.apple.FileProvider.LocalStorage"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asAppExtensionBackedProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (!xpc_activity_set_state(v3, 4))
      {
        fp_current_or_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __25__FPDServer__finishSetup__block_invoke_cold_2();

      }
      +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __25__FPDServer__finishSetup__block_invoke_72;
      v19[3] = &unk_1E8C75E48;
      v20 = v3;
      objc_msgSend(v8, "removeTrashedItemsOlderThanDate:request:completionHandler:", v5, v10, v19);

      v11 = v20;
    }
    else
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __25__FPDServer__finishSetup__block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }

  }
}

void __25__FPDServer__finishSetup__block_invoke_72(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __25__FPDServer__finishSetup__block_invoke_72_cold_2();

  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __25__FPDServer__finishSetup__block_invoke_72_cold_1();

  }
}

- (void)_startXPCListener
{
  NSObject *v3;
  NSXPCListener *v4;
  NSXPCListener *listener;
  pid_t v6;
  id v7;
  void *v8;
  uint64_t section;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  pid_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  section = __fp_create_section();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = getpid();
    FPOSVersion();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    FPVersion();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v11 = section;
    v12 = 1024;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_debug_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx starting up, welcome, pid:%d, os:%@, version:%@", buf, 0x26u);

  }
  v4 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.FileProvider"));
  listener = self->_listener;
  self->_listener = v4;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
  __fp_leave_section_Debug();
}

- (void)_monitorUnlockedStatus
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)firstUnlockNotificationCallback, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)pastBuddyNotificationCallback, (CFStringRef)*MEMORY[0x1E0D8D6D8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (BOOL)isPastBuddy
{
  return self->_isPastBuddy;
}

- (void)localeDidChange
{
  void *v3;
  NSObject *v4;
  NSString *locale;
  id v6;
  uint8_t buf[4];
  NSString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", self->_locale) & 1) == 0)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      locale = self->_locale;
      *(_DWORD *)buf = 138412546;
      v8 = locale;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] current local did change (%@ -> %@), exiting...", buf, 0x16u);
    }

    -[FPDServer exitWithCode:](self, "exitWithCode:", 0);
  }

}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] ┣%llx starting file provider server", v2);
  OUTLINED_FUNCTION_8_0();
}

void __18__FPDServer_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_block_t v5;
  _QWORD v6[6];

  objc_msgSend(*(id *)(a1 + 32), "_startXPCListener");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v2 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __18__FPDServer_start__block_invoke_2;
  v6[3] = &unk_1E8C76470;
  v6[4] = v2;
  v6[5] = v3;
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v6);
  dispatch_async(v4, v5);

}

uint64_t __18__FPDServer_start__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 40);
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __18__FPDServer_start__block_invoke_2_cold_1(&v5, v2, v3);

  objc_msgSend(*(id *)(a1 + 32), "_monitorUnlockedStatus");
  objc_msgSend(*(id *)(a1 + 32), "_computeUnlockedStatusAndSetup");
  return __fp_leave_section_Debug();
}

- (void)migrateLegacyFPFSLocations
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] Not migrating: sokoban is off", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_111(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExportedObject:", 0);

  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "invalidate");

}

void __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_2_112(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

+ (id)homeDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)personaCloudStoragePath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_cloudStorageDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)appSupportPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_supportDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FPDCacheDeleteService)cacheDelete
{
  return self->_cacheDelete;
}

- (FPDTelemetryService)telemetry
{
  return self->_telemetry;
}

- (FPDVolumeManager)volumeManager
{
  return self->_volumeManager;
}

- (FPDPresenterManager)presenterManager
{
  return self->_presenterManager;
}

- (Class)fpfsClass
{
  return self->_fpfsClass;
}

- (void)setFpfsClass:(Class)a3
{
  objc_storeStrong((id *)&self->_fpfsClass, a3);
}

- (Class)fpfsSQLBackupManagerClass
{
  return self->_fpfsSQLBackupManagerClass;
}

- (void)setFpfsSQLBackupManagerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_fpfsSQLBackupManagerClass, a3);
}

- (Class)fpfsSQLRestoreManagerClass
{
  return self->_fpfsSQLRestoreManagerClass;
}

- (void)setFpfsSQLRestoreManagerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_fpfsSQLRestoreManagerClass, a3);
}

- (Class)fpckTaskClass
{
  return self->_fpckTaskClass;
}

- (void)setFpckTaskClass:(Class)a3
{
  objc_storeStrong((id *)&self->_fpckTaskClass, a3);
}

- (Class)fpdPurgerClass
{
  return self->_fpdPurgerClass;
}

- (void)setFpdPurgerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_fpdPurgerClass, a3);
}

- (FPDSpotlightDaemonClient)spotlightDaemonClient
{
  return self->_spotlightDaemonClient;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_spotlightDaemonClient, 0);
  objc_storeStrong((id *)&self->_fpdPurgerClass, 0);
  objc_storeStrong((id *)&self->_fpckTaskClass, 0);
  objc_storeStrong((id *)&self->_fpfsSQLRestoreManagerClass, 0);
  objc_storeStrong((id *)&self->_fpfsSQLBackupManagerClass, 0);
  objc_storeStrong((id *)&self->_fpfsClass, 0);
  objc_storeStrong((id *)&self->_presenterManager, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_appMonitor, 0);
  objc_storeStrong((id *)&self->_volumeManager, 0);
  objc_storeStrong((id *)&self->_operationEngine, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_bubble, 0);
  objc_storeStrong((id *)&self->_signalProviderChangesPacer, 0);
  objc_storeStrong((id *)&self->_telemetry, 0);
  objc_storeStrong((id *)&self->_cacheDelete, 0);
  objc_storeStrong((id *)&self->_machServerQueue, 0);
  objc_storeStrong((id *)&self->_fileProviderManagerIsReadyGroup, 0);
  objc_storeStrong((id *)&self->_afterSetupWorkQueue, 0);
  objc_storeStrong((id *)&self->_setupQueue, 0);
  objc_storeStrong((id *)&self->_makeSureSetupEnqueued, 0);
  objc_storeStrong((id *)&self->_machSrc, 0);
  objc_storeStrong((id *)&self->_sigTermSrc, 0);
  objc_storeStrong((id *)&self->_sigQuitSrc, 0);
  objc_storeStrong((id *)&self->_sigIntSrc, 0);
}

- (void)materializeURL:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1CF55F000, v0, v1, "[ERROR] no provider domain for path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __39__FPDServer_materializeURL_completion___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_ERROR, "[ERROR] materialization failed: %@", v4, 0xCu);

}

void __25__FPDServer__finishSetup__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1CF55F000, a1, a3, "[ERROR] can't find extension with identifier \"%s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __25__FPDServer__finishSetup__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] can't set activity state to CONTINUE, process might be killed before completion of maintenance task", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __25__FPDServer__finishSetup__block_invoke_72_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] can't set activity state to DONE", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __25__FPDServer__finishSetup__block_invoke_72_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] task to remove old trashed items complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __18__FPDServer_start__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, a3, "[DEBUG] ┳%llx continue startup in utility", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] denying connection because the device is locked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] denying connection because the device is not set up", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
