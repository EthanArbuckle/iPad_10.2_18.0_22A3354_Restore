@implementation ABCAdministrator

+ (id)sharedInstance
{
  if (sharedInstance_sharedInstancePred != -1)
    dispatch_once(&sharedInstance_sharedInstancePred, &__block_literal_global_5);
  return (id)sharedInstance_sharedInstance_2;
}

void __34__ABCAdministrator_sharedInstance__block_invoke()
{
  ABCAdministrator *v0;
  void *v1;

  if (IDSBAASignerErrorDomain_block_invoke_oncePred != -1)
    dispatch_once(&IDSBAASignerErrorDomain_block_invoke_oncePred, &__block_literal_global_4);
  v0 = objc_alloc_init(ABCAdministrator);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

uint64_t __34__ABCAdministrator_sharedInstance__block_invoke_2()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(0);
  v1 = (void *)waitFirstUnlock;
  waitFirstUnlock = (uint64_t)v0;

  return notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &firstUnlockToken, MEMORY[0x1E0C80D38], &__block_literal_global_7);
}

uint64_t __34__ABCAdministrator_sharedInstance__block_invoke_3()
{
  dispatch_semaphore_signal((dispatch_semaphore_t)waitFirstUnlock);
  return notify_cancel(firstUnlockToken);
}

- (ABCAdministrator)init
{
  ABCAdministrator *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *adminQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABCAdministrator;
  v2 = -[ABCAdministrator init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.autobugcapture.administration", v3);
    adminQueue = v2->adminQueue;
    v2->adminQueue = (OS_dispatch_queue *)v4;

    v2->_autoBugCaptureState = 1;
  }
  return v2;
}

- (void)persistentStoreControllerReadyForUse:(id)a3
{
  NSObject *adminQueue;
  _QWORD block[5];

  adminQueue = self->adminQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ABCAdministrator_persistentStoreControllerReadyForUse___block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(adminQueue, block);
}

uint64_t __57__ABCAdministrator_persistentStoreControllerReadyForUse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueStartingAutoBugCapture");
}

- (void)startEssentialServices
{
  ABCConfigurationManager *v3;
  NSObject *v4;
  DiagnosticsTransport *v5;
  DiagnosticsTransport *diagTransport;
  void *v7;
  NSObject *v8;
  AutoBugCaptureCacheDelete *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = objc_alloc_init(ABCConfigurationManager);
  -[ABCAdministrator setConfigurationManager:](self, "setConfigurationManager:", v3);

  -[ABCAdministrator registerIDS](self, "registerIDS");
  adminLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEFAULT, "Initializing AutoBugCapture XPC service", buf, 2u);
  }

  v5 = objc_alloc_init(DiagnosticsTransport);
  diagTransport = self->diagTransport;
  self->diagTransport = v5;

  -[ABCAdministrator configurationManager](self, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("autoBugCaptureEnabled"), 1, 0);

  adminLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "Initializing CacheDelete handlers", v10, 2u);
  }

  v9 = -[AutoBugCaptureCacheDelete initWithStorageManager:]([AutoBugCaptureCacheDelete alloc], "initWithStorageManager:", 0);
  -[ABCAdministrator setCacheDeleteHandler:](self, "setCacheDeleteHandler:", v9);

}

- (void)stopEssentialServices
{
  NSObject *v3;
  DiagnosticsTransport *diagTransport;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  -[ABCAdministrator deregisterIDS](self, "deregisterIDS");
  if (self->diagTransport)
  {
    adminLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Stopping AutoBugCapture XPC services", buf, 2u);
    }

    -[DiagnosticsTransport shutdown](self->diagTransport, "shutdown");
    diagTransport = self->diagTransport;
    self->diagTransport = 0;

  }
  -[ABCAdministrator configurationManager](self, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("autoBugCaptureEnabled"), 0);

  -[ABCAdministrator setConfigurationManager:](self, "setConfigurationManager:", 0);
  -[ABCAdministrator cacheDeleteHandler](self, "cacheDeleteHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    adminLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Stopping CacheDelete handlers", v8, 2u);
    }

    -[ABCAdministrator setCacheDeleteHandler:](self, "setCacheDeleteHandler:", 0);
  }
}

- (id)getDiagnosticLiaison
{
  void *v3;
  DiagnosticLiaison *v4;

  -[ABCAdministrator diagnosticLiaison](self, "diagnosticLiaison");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(DiagnosticLiaison);
    -[ABCAdministrator setDiagnosticLiaison:](self, "setDiagnosticLiaison:", v4);

  }
  return -[ABCAdministrator diagnosticLiaison](self, "diagnosticLiaison");
}

- (void)registerIDS
{
  void *v3;
  int v4;
  id v5;

  -[ABCAdministrator configurationManager](self, "configurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autoBugCaptureAvailable");

  if (v4)
  {
    -[ABCAdministrator getDiagnosticLiaison](self, "getDiagnosticLiaison");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerAdministrativeTransports");

  }
}

- (void)deregisterIDS
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[ABCAdministrator diagnosticLiaison](self, "diagnosticLiaison");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ABCAdministrator diagnosticLiaison](self, "diagnosticLiaison");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __33__ABCAdministrator_deregisterIDS__block_invoke;
    v5[3] = &unk_1EA3B4960;
    v5[4] = self;
    objc_msgSend(v4, "unregisterAllTransports:", v5);

  }
}

uint64_t __33__ABCAdministrator_deregisterIDS__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDiagnosticLiaison:", 0);
}

- (void)scheduleDiagnosticsMaintenanceActivity
{
  OS_dispatch_queue *adminQueue;
  _QWORD v3[6];
  _QWORD v4[4];

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v4[3] = 0;
  adminQueue = self->adminQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__ABCAdministrator_scheduleDiagnosticsMaintenanceActivity__block_invoke;
  v3[3] = &unk_1EA3B54A8;
  v3[4] = self;
  v3[5] = v4;
  +[ABCPeriodicMaintenanceActivity registerPeriodicActivityWithIdentifier:queue:activity:](ABCDailyMaintenanceActivity, "registerPeriodicActivityWithIdentifier:queue:activity:", CFSTR("Administrator.DailyCleanup"), adminQueue, v3);
  _Block_object_dispose(v4, 8);
}

uint64_t __58__ABCAdministrator_scheduleDiagnosticsMaintenanceActivity__block_invoke(uint64_t a1)
{
  void *v2;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "cleanupDiagnosticCaseStorage");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "cleanupDiagnosticCaseSummary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "cleanupUploadRecord");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "statsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cleanupDiagnosticCaseUsage");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "updateAverageCasesPerDay");
}

- (void)startUploadTaskScheduler
{
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  CloudKitUploadController *uploadController;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  uint8_t v10[2];
  uint8_t buf[16];

  v3 = -[ABCConfigurationManager cloudKitEnabled](self->_configurationManager, "cloudKitEnabled");
  adminLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "Scheduling periodic upload tasks", buf, 2u);
    }

    uploadController = self->_uploadController;
    if (uploadController)
    {
      -[CloudKitUploadController registerCloudKitUploadActivities](uploadController, "registerCloudKitUploadActivities");
      return;
    }
    adminLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      v7 = "No log upload controller allocated. Cannot schedule periodic upload tasks!";
      v8 = v10;
      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 0;
    v7 = "CloudKit uploading is not enabled";
    v8 = (uint8_t *)&v9;
LABEL_10:
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
  }

}

- (void)stopUploadTaskScheduler
{
  NSObject *v2;
  uint8_t v3[16];

  adminLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Unscheduling periodic upload tasks", v3, 2u);
  }

  +[CloudKitUploadController unregisterCloudKitUploadActivities](CloudKitUploadController, "unregisterCloudKitUploadActivities");
}

- (void)administrativelyEnableAutoBugCapture
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_autoBugCaptureAdministrativelyEnabled)
  {
    self->_autoBugCaptureAdministrativelyEnabled = 1;
    adminLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Administratively enabling AutoBugCapture", v4, 2u);
    }

    -[ABCAdministrator startAutoBugCaptureAdministrative:](self, "startAutoBugCaptureAdministrative:", 1);
  }
}

- (void)administrativelyDiableAutoBugCapture
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (self->_autoBugCaptureAdministrativelyEnabled)
  {
    self->_autoBugCaptureAdministrativelyEnabled = 0;
    adminLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Administratively disabling AutoBugCapture", v6, 2u);
    }

    -[ABCAdministrator storageManager](self, "storageManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "purgeAttachmentsForAllCases");

    -[ABCAdministrator caseManager](self, "caseManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetDiagnosticCaseStorage");

    -[ABCAdministrator stopAutoBugCapture:](self, "stopAutoBugCapture:", 1);
  }
}

- (void)startAutoBugCaptureAdministrative:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  _DWORD v16[2];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  adminLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "Preparing to start AutoBugCapture...", (uint8_t *)v16, 2u);
  }

  v6 = MKBDeviceUnlockedSinceBoot();
  adminLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16[0]) = 0;
      v9 = "Device is ready for AutoBugCapture";
      v10 = v8;
      v11 = OS_LOG_TYPE_INFO;
LABEL_14:
      _os_log_impl(&dword_1DBAE1000, v10, v11, v9, (uint8_t *)v16, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "Device not yet ready. Waiting for first unlock...", (uint8_t *)v16, 2u);
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)waitFirstUnlock, 0xFFFFFFFFFFFFFFFFLL);
    v12 = MKBDeviceUnlockedSinceBoot();
    if (v12 != 1)
    {
      v13 = v12;
      adminLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16[0] = 67109120;
        v16[1] = v13;
        _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_ERROR, "Unexpected first-unlock event, %d", (uint8_t *)v16, 8u);
      }

    }
    adminLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      v9 = "Device is now ready for AutoBugCapture";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_14;
    }
  }

  -[ABCAdministrator autoBugCaptureConfig](self, "autoBugCaptureConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCAdministrator startAutoBugCaptureAdministrative:parameters:](self, "startAutoBugCaptureAdministrative:parameters:", v3, v15);

}

- (void)startAutoBugCaptureAdministrative:(BOOL)a3 parameters:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  ABCPersistentStoreController *v12;
  void *v13;
  void *v14;
  ABCPersistentStoreController *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  BOOL v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  adminLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Starting AutoBugCapture with parameters: %@", buf, 0xCu);
  }

  if (-[ABCAdministrator autoBugCaptureState](self, "autoBugCaptureState") <= 1)
  {
    -[ABCAdministrator setAutoBugCaptureState:](self, "setAutoBugCaptureState:", 2);
    -[ABCConfigurationManager logArchivePath](self->_configurationManager, "logArchivePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ABCConfigurationManager logArchiveUID](self->_configurationManager, "logArchiveUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ABCConfigurationManager logArchiveGID](self->_configurationManager, "logArchiveGID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABCAdministrator prepareLogArchiveDirectory:uid:gid:](self, "prepareLogArchiveDirectory:uid:gid:", v8, v9, v10);

    adminLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEFAULT, "Initializing persistent storage", buf, 2u);
    }

    v12 = [ABCPersistentStoreController alloc];
    -[ABCAdministrator configurationManager](self, "configurationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "databaseContainerPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ABCPersistentStoreController initWithDirectory:](v12, "initWithDirectory:", v14);
    -[ABCAdministrator setStoreController:](self, "setStoreController:", v15);

    -[ABCAdministrator storeController](self, "storeController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", self);

    -[ABCAdministrator getDiagnosticLiaison](self, "getDiagnosticLiaison");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__ABCAdministrator_startAutoBugCaptureAdministrative_parameters___block_invoke;
    v18[3] = &unk_1EA3B54F0;
    v19 = a3;
    v18[4] = self;
    objc_msgSend(v17, "registerAutoBugCaptureTransports:", v18);

  }
}

void __65__ABCAdministrator_startAutoBugCaptureAdministrative_parameters___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (*(_BYTE *)(a1 + 40))
  {
    adminLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEBUG, "ABC administratively enabled. Enabling ABC on remote devices.", v4, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "diagnosticLiaison");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remotelyEnableAutoBugCapture:", &__block_literal_global_22);

  }
}

void __65__ABCAdministrator_startAutoBugCaptureAdministrative_parameters___block_invoke_21()
{
  NSObject *v0;
  uint8_t v1[16];

  adminLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DBAE1000, v0, OS_LOG_TYPE_DEBUG, "Finished remotely enabling ABC.", v1, 2u);
  }

}

- (void)continueStartingAutoBugCapture
{
  NSObject *v3;
  DiagnosticCaseManager *v4;
  void *v5;
  void *v6;
  void *v7;
  DiagnosticCaseManager *v8;
  void *v9;
  NSObject *v10;
  DiagnosticExtensionController *v11;
  NSObject *v12;
  DiagnosticStorageManager *v13;
  void *v14;
  void *v15;
  DiagnosticStorageManager *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  CloudKitUploadController *v28;
  void *v29;
  void *v30;
  CloudKitUploadController *v31;
  CloudKitUploadController *uploadController;
  NSObject *v33;
  uint8_t v34[16];

  if (-[ABCAdministrator autoBugCaptureState](self, "autoBugCaptureState") == 2)
  {
    adminLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Initializing case management", v34, 2u);
    }

    v4 = [DiagnosticCaseManager alloc];
    -[ABCAdministrator storeController](self, "storeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABCAdministrator diagnosticLiaison](self, "diagnosticLiaison");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[DiagnosticCaseManager initWithWorkspace:liaison:](v4, "initWithWorkspace:liaison:", v6, v7);
    -[ABCAdministrator setCaseManager:](self, "setCaseManager:", v8);

    -[ABCAdministrator caseManager](self, "caseManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "forceCloseDiagnosticCaseStorage");

    adminLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "Initializing diagnostic extension controller", v34, 2u);
    }

    v11 = objc_alloc_init(DiagnosticExtensionController);
    -[ABCAdministrator setDiagExtensionController:](self, "setDiagExtensionController:", v11);

    adminLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEFAULT, "Initializing storage management", v34, 2u);
    }

    v13 = [DiagnosticStorageManager alloc];
    -[ABCAdministrator storeController](self, "storeController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABCConfigurationManager logArchivePath](self->_configurationManager, "logArchivePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[DiagnosticStorageManager initWithPersistentStoreController:logArchiveDirectory:](v13, "initWithPersistentStoreController:logArchiveDirectory:", v14, v15);
    -[ABCAdministrator setStorageManager:](self, "setStorageManager:", v16);

    -[ABCAdministrator storageManager](self, "storageManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABCAdministrator caseManager](self, "caseManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStorageDelegate:", v17);

    -[ABCAdministrator cacheDeleteHandler](self, "cacheDeleteHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    adminLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_DEFAULT, "Configuring CacheDelete handler with storage management", v34, 2u);
      }

      -[ABCAdministrator storageManager](self, "storageManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABCAdministrator cacheDeleteHandler](self, "cacheDeleteHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setStorageManager:", v22);

      -[ABCAdministrator cacheDeleteHandler](self, "cacheDeleteHandler");
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject initCacheDeletePurgeMonitor](v21, "initCacheDeletePurgeMonitor");
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_ERROR, "CacheDelete handler is unexpectedly nil", v34, 2u);
    }

    -[ABCAdministrator configurationManager](self, "configurationManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "cloudKitEnabled");

    adminLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEFAULT, "Initializing CloudKit upload controller", v34, 2u);
      }

      v28 = [CloudKitUploadController alloc];
      -[ABCAdministrator storeController](self, "storeController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "workspace");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[CloudKitUploadController initWithWorkspace:](v28, "initWithWorkspace:", v30);
      uploadController = self->_uploadController;
      self->_uploadController = v31;

      -[ABCAdministrator startUploadTaskScheduler](self, "startUploadTaskScheduler");
    }
    else
    {
      if (v27)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEFAULT, "CloudKit upload is disabled - not initializing", v34, 2u);
      }

      -[ABCAdministrator stopUploadTaskScheduler](self, "stopUploadTaskScheduler");
    }
    adminLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_DEFAULT, "Completed startup of all AutoBugCapture services", v34, 2u);
    }

    -[ABCAdministrator setAutoBugCaptureState:](self, "setAutoBugCaptureState:", 3);
  }
}

- (void)stopAutoBugCapture:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  DiagnosticsTransport *diagTransport;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  v3 = a3;
  adminLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "Stopping AutoBugCapture services", buf, 2u);
  }

  -[ABCAdministrator setAutoBugCaptureState:](self, "setAutoBugCaptureState:", 4);
  adminLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_INFO, "Stopping XPC services", v20, 2u);
  }

  -[DiagnosticsTransport shutdown](self->diagTransport, "shutdown");
  diagTransport = self->diagTransport;
  self->diagTransport = 0;

  adminLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_INFO, "Stopping persistent storage", v19, 2u);
  }

  -[ABCAdministrator storeController](self, "storeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shutdown");

  -[ABCAdministrator setStoreController:](self, "setStoreController:", 0);
  if (v3)
  {
    -[ABCAdministrator diagnosticLiaison](self, "diagnosticLiaison");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remotelyDisableAutoBugCapture:", &__block_literal_global_26);

    -[ABCAdministrator stopUploadTaskScheduler](self, "stopUploadTaskScheduler");
  }
  adminLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_INFO, "Stopping case management", v18, 2u);
  }

  -[ABCAdministrator setCaseManager:](self, "setCaseManager:", 0);
  adminLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_INFO, "Stopping storage management", v17, 2u);
  }

  -[ABCAdministrator setStorageManager:](self, "setStorageManager:", 0);
  adminLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "Stopping diagnostic extension controller", v16, 2u);
  }

  -[ABCAdministrator setDiagExtensionController:](self, "setDiagExtensionController:", 0);
  adminLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_INFO, "Stopping CacheDelete handlers", v15, 2u);
  }

  -[ABCAdministrator setCacheDeleteHandler:](self, "setCacheDeleteHandler:", 0);
  -[ABCAdministrator setAutoBugCaptureState:](self, "setAutoBugCaptureState:", 1);
}

- (void)prepareLogArchiveDirectory:(id)a3 uid:(id)a4 gid:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  char v12;
  id v13;
  int v14;
  id v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  BOOL v36;
  BOOL v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  NSObject *v44;
  void *v45;
  int v46;
  NSObject *v47;
  NSObject *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  NSObject *v53;
  NSObject *v54;
  int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  void *v61;
  NSObject *v62;
  id v63;
  id v64;
  id v65;
  char v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  _QWORD v71[3];
  _QWORD v72[3];
  uint8_t buf[4];
  id v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  v11 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v7, &v66);
  if (v66)
    v12 = v11;
  else
    v12 = 0;
  if (v11)
  {
    if (v66)
    {
      v13 = 0;
      goto LABEL_21;
    }
    v65 = 0;
    v14 = objc_msgSend(v10, "removeItemAtPath:error:", v7, &v65);
    v15 = v65;
    if (v14)
    {
      adminLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v74 = v7;
        v17 = "Successfully removed file at %@";
        v18 = v16;
        v19 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
        _os_log_impl(&dword_1DBAE1000, v18, v19, v17, buf, 0xCu);
      }
    }
    else
    {
      adminLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (v15)
      {
        if (v20)
        {
          objc_msgSend(v15, "localizedFailureReason");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v74 = v7;
          v75 = 2112;
          v76 = v21;
          _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_ERROR, "Failed to remove file at %@. (%@)", buf, 0x16u);

        }
        goto LABEL_16;
      }
      if (v20)
      {
        *(_DWORD *)buf = 138412290;
        v74 = v7;
        v17 = "Failed to remove file at %@";
        v18 = v16;
        v19 = OS_LOG_TYPE_ERROR;
        goto LABEL_15;
      }
    }
LABEL_16:

  }
  if ((v12 & 1) == 0)
  {
    v22 = *MEMORY[0x1E0CB2A90];
    v71[0] = *MEMORY[0x1E0CB2AA8];
    v71[1] = v22;
    v72[0] = &unk_1EA3CFA98;
    v72[1] = v8;
    v71[2] = *MEMORY[0x1E0CB2A50];
    v72[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v24 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, v23, &v64);
    v13 = v64;
    if (!v24)
    {
      adminLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
      if (v13)
      {
        if (v42)
        {
          objc_msgSend(v13, "localizedFailureReason");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v74 = v7;
          v75 = 2112;
          v76 = v43;
          _os_log_impl(&dword_1DBAE1000, v41, OS_LOG_TYPE_ERROR, "Failed to create log archive directory at %@. (%@)", buf, 0x16u);

        }
      }
      else
      {
        if (v42)
        {
          *(_DWORD *)buf = 138412290;
          v74 = v7;
          _os_log_impl(&dword_1DBAE1000, v41, OS_LOG_TYPE_ERROR, "Failed to create log archive directory at %@", buf, 0xCu);
        }
        v13 = 0;
      }
      goto LABEL_58;
    }

LABEL_21:
    objc_msgSend(v10, "attributesOfItemAtPath:error:", v7, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v25;
    if (!v25)
    {
LABEL_59:

      goto LABEL_60;
    }
    v61 = v10;
    v26 = v13;
    v27 = v9;
    v28 = objc_msgSend(v25, "filePosixPermissions");
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A90]);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x1E0CB2A50];
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A50]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v29;
    v60 = v8;
    v32 = -[NSObject isEqual:](v29, "isEqual:", v8);
    v33 = objc_msgSend(v31, "isEqual:", v27);
    v34 = objc_msgSend(&unk_1EA3CFA98, "shortValue");
    v35 = v34;
    if (v32)
      v36 = v33 == 0;
    else
      v36 = 1;
    v58 = v28;
    v37 = !v36 && v28 == v34;
    v9 = v27;
    v13 = v26;
    if (!v37)
    {
      v57 = v31;
      storageLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v38, OS_LOG_TYPE_DEFAULT, "Log archive directory path requires repairing...", buf, 2u);
      }

      if (v32)
      {
        if ((v33 & 1) != 0)
        {
          v39 = 0;
          v31 = v57;
          v40 = v61;
        }
        else
        {
          v69 = v30;
          v70 = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0;
          v40 = v61;
          v46 = objc_msgSend(v61, "setAttributes:ofItemAtPath:error:", v45, v7, &v63);
          v39 = v63;

          adminLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v46)
          {
            v31 = v57;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v49 = objc_msgSend(v9, "shortValue");
              *(_DWORD *)buf = 67109120;
              LODWORD(v74) = v49;
              _os_log_impl(&dword_1DBAE1000, v48, OS_LOG_TYPE_DEFAULT, "Repaired group ownership to %d", buf, 8u);
            }
          }
          else
          {
            v31 = v57;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              -[NSObject localizedFailureReason](v39, "localizedFailureReason");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v74 = v7;
              v75 = 2112;
              v76 = v50;
              _os_log_impl(&dword_1DBAE1000, v48, OS_LOG_TYPE_ERROR, "Unable to fix group for %@: %@", buf, 0x16u);

              v31 = v57;
            }
          }

        }
        if (v58 == v35)
        {
          v44 = v39;
        }
        else
        {
          v67 = *MEMORY[0x1E0CB2AA8];
          v68 = &unk_1EA3CFA98;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v39;
          v52 = objc_msgSend(v40, "setAttributes:ofItemAtPath:error:", v51, v7, &v62);
          v44 = v62;

          adminLogHandle();
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = v53;
          if (v52)
          {
            v31 = v57;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              v55 = objc_msgSend(&unk_1EA3CFA98, "shortValue");
              *(_DWORD *)buf = 67109120;
              LODWORD(v74) = v55;
              _os_log_impl(&dword_1DBAE1000, v54, OS_LOG_TYPE_DEFAULT, "Repaired permission to %od", buf, 8u);
            }
          }
          else
          {
            v31 = v57;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              -[NSObject localizedFailureReason](v44, "localizedFailureReason");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v74 = v7;
              v75 = 2112;
              v76 = v56;
              _os_log_impl(&dword_1DBAE1000, v54, OS_LOG_TYPE_ERROR, "Unable to fix permission for %@: %@", buf, 0x16u);

              v31 = v57;
            }
          }

        }
      }
      else
      {
        adminLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        v31 = v57;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v74 = v7;
          _os_log_impl(&dword_1DBAE1000, v44, OS_LOG_TYPE_ERROR, "Incorrect ownership for %@. (Log collection may not work correctly)", buf, 0xCu);
        }
      }

    }
    v41 = v59;
    v8 = v60;
    v10 = v61;
LABEL_58:

    goto LABEL_59;
  }
  v13 = 0;
LABEL_60:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  NSObject *adminQueue;
  uint64_t (*v17)(uint64_t);
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x1E0CB2CB8];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("autoBugCaptureEnabled")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_5;
    v12 = v11;
    adminLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = -[NSObject BOOLValue](v12, "BOOLValue");
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEFAULT, "KVO: autoBugCaptureEnabled is %d", buf, 8u);
    }

    v15 = -[NSObject BOOLValue](v12, "BOOLValue");
    adminQueue = self->adminQueue;
    if (v15)
    {
      v20 = MEMORY[0x1E0C809B0];
      v17 = __67__ABCAdministrator_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v18 = &v20;
    }
    else
    {
      v19 = MEMORY[0x1E0C809B0];
      v17 = __67__ABCAdministrator_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v18 = &v19;
    }
    v18[1] = 3221225472;
    v18[2] = (uint64_t)v17;
    v18[3] = (uint64_t)&unk_1EA3B4960;
    v18[4] = (uint64_t)self;
    dispatch_async(adminQueue, v18);
  }
  else
  {
    adminLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "KVO: unknown keypath (%@) observed with value %@", buf, 0x16u);

    }
  }

LABEL_5:
}

uint64_t __67__ABCAdministrator_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "administrativelyEnableAutoBugCapture");
}

uint64_t __67__ABCAdministrator_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "administrativelyDiableAutoBugCapture");
}

- (void)startup
{
  NSObject *adminQueue;
  _QWORD block[5];

  adminQueue = self->adminQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ABCAdministrator_startup__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(adminQueue, block);
}

uint64_t __27__ABCAdministrator_startup__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint8_t v7[16];

  adminLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEFAULT, "Starting up daemon", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "startEssentialServices");
  objc_msgSend(*(id *)(a1 + 32), "startMaintenanceServices");
  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autoBugCaptureEnabled");

  v5 = *(void **)(a1 + 32);
  if (v4)
    return objc_msgSend(v5, "startAutoBugCaptureAdministrative:", 0);
  else
    return objc_msgSend(v5, "stopUploadTaskScheduler");
}

- (void)shutdown
{
  NSObject *adminQueue;
  _QWORD block[5];

  adminQueue = self->adminQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__ABCAdministrator_shutdown__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(adminQueue, block);
}

uint64_t __28__ABCAdministrator_shutdown__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  adminLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEFAULT, "Shutting down daemon", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "stopAutoBugCapture:", 0);
  objc_msgSend(*(id *)(a1 + 32), "stopMaintenanceServices");
  return objc_msgSend(*(id *)(a1 + 32), "stopEssentialServices");
}

- (id)autoBugCaptureConfig
{
  return 0;
}

- (id)internalStateDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ABCAdministrator autoBugCaptureState](self, "autoBugCaptureState") > 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("serviceEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[ABCAdministrator autoBugCaptureState](self, "autoBugCaptureState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("serviceState"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[ABCAdministrator configurationManager](self, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "arbitratorDailyCountLimit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dailyCaseLimit"));

  -[ABCAdministrator configurationManager](self, "configurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "disableAPIRateLimit");

  if ((_DWORD)v7)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA3CFAB0, CFSTR("apiRateLimit"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA3CFAB0, CFSTR("apiLimitWindow"));
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[ABCAdministrator configurationManager](self, "configurationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "apiRateLimit");
    objc_msgSend(v10, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("apiRateLimit"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[ABCAdministrator configurationManager](self, "configurationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "apiLimitWindow");
    objc_msgSend(v13, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("apiLimitWindow"));

  }
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[ABCAdministrator configurationManager](self, "configurationManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "cloudKitEnabled"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("ckEnabled"));

  -[ABCAdministrator configurationManager](self, "configurationManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v19, "cloudKitEnabled");

  if ((_DWORD)v17)
  {
    -[ABCAdministrator configurationManager](self, "configurationManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "cloudKitSandboxEnvironment"))
      v21 = CFSTR("Sandbox");
    else
      v21 = CFSTR("Production");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("ckEnvironment"));

    -[ABCAdministrator configurationManager](self, "configurationManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cloudKitContainerIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("ckContainerID"));

    -[ABCAdministrator configurationManager](self, "configurationManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cloudKitInvernessService");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("ckInvernessID"));

    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[ABCAdministrator configurationManager](self, "configurationManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "cloudKitTimeoutIntervalForResource");
    objc_msgSend(v26, "numberWithDouble:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("ckTimeoutForResource"));

    v29 = (void *)MEMORY[0x1E0CB37E8];
    -[ABCAdministrator configurationManager](self, "configurationManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "cloudKitTimeoutIntervalForRequest");
    objc_msgSend(v29, "numberWithDouble:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("ckTimeoutForRequest"));

    v32 = (void *)MEMORY[0x1E0CB37E8];
    -[ABCAdministrator configurationManager](self, "configurationManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "cloudKitFallbackMaximumLogCount"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("ckUploadFallbackCount"));

    v35 = (void *)MEMORY[0x1E0CB37E8];
    -[ABCAdministrator configurationManager](self, "configurationManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "maxCaseSummaryPerSubmission"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("ckSummaryMaxPerSubmission"));

    v38 = (void *)MEMORY[0x1E0CB37E8];
    -[ABCAdministrator configurationManager](self, "configurationManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "submittedCaseSummaryRetentionDays"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("ckSummarySubRetDays"));

    v41 = (void *)MEMORY[0x1E0CB37E8];
    -[ABCAdministrator configurationManager](self, "configurationManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "unsubmittedCaseSummaryRetentionDays"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("ckSummaryUnsubRetDays"));

  }
  v44 = (void *)MEMORY[0x1E0CB37E8];
  -[ABCAdministrator configurationManager](self, "configurationManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "numberWithBool:", objc_msgSend(v45, "submitToDiagnosticPipeline"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("dpSubmission"));

  v47 = (void *)MEMORY[0x1E0CB37E8];
  -[ABCAdministrator configurationManager](self, "configurationManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "diagnosticPipelineSubmissionRate");
  objc_msgSend(v47, "numberWithDouble:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("dpSubmissionRate"));

  -[ABCAdministrator configurationManager](self, "configurationManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v48) = objc_msgSend(v50, "arbitratorDisableDampening");

  if ((_DWORD)v48)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("overrideDisableDampening"));
  -[ABCAdministrator configurationManager](self, "configurationManager");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "disable_internal_build");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("overrideDisableInternalBuild"));

  -[ABCAdministrator configurationManager](self, "configurationManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "carrier_seed_flag");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("overrideCarrierSeed"));

  -[ABCAdministrator configurationManager](self, "configurationManager");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "seed_flag");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("overrideSeedBuild"));

  -[ABCAdministrator configurationManager](self, "configurationManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "vendor_flag");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("overrideVendorBuild"));

  -[ABCAdministrator configurationManager](self, "configurationManager");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "npi_flag");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("overrideNPI"));

  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v61, "internalBuild"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("internalBuild"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v61, "carrierBuild"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("carrierBuild"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v61, "vendorBuild"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("vendorBuild"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v61, "customerBuild"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("customerBuild"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v61, "seedBuild"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("seedBuild"));

  v67 = (void *)MEMORY[0x1E0CB37E8];
  -[ABCAdministrator configurationManager](self, "configurationManager");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "numberWithBool:", objc_msgSend(v68, "isAutomatedDeviceGroup"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("automatedDeviceGroup"));

  v70 = (void *)MEMORY[0x1E0CB37E8];
  -[ABCAdministrator configurationManager](self, "configurationManager");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "numberWithBool:", objc_msgSend(v71, "hasAppleEmail"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("hasAppleEmail"));

  v73 = (void *)MEMORY[0x1E0CB37E8];
  -[ABCAdministrator configurationManager](self, "configurationManager");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "numberWithBool:", objc_msgSend(v74, "isCarryDevice"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("carryDevice"));

  -[ABCAdministrator caseManager](self, "caseManager");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addToInternalStateDictionary:", v3);

  return v3;
}

- (CloudKitUploadController)ckUploadController
{
  return self->_uploadController;
}

- (void)setCkUploadController:(id)a3
{
  objc_storeStrong((id *)&self->_uploadController, a3);
}

- (int)autoBugCaptureState
{
  return self->_autoBugCaptureState;
}

- (void)setAutoBugCaptureState:(int)a3
{
  self->_autoBugCaptureState = a3;
}

- (DiagnosticExtensionController)diagExtensionController
{
  return self->_diagExtensionController;
}

- (void)setDiagExtensionController:(id)a3
{
  objc_storeStrong((id *)&self->_diagExtensionController, a3);
}

- (AutoBugCaptureCacheDelete)cacheDeleteHandler
{
  return self->_cacheDeleteHandler;
}

- (void)setCacheDeleteHandler:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDeleteHandler, a3);
}

- (DiagnosticCaseManager)caseManager
{
  return self->_caseManager;
}

- (void)setCaseManager:(id)a3
{
  objc_storeStrong((id *)&self->_caseManager, a3);
}

- (DiagnosticStorageManager)storageManager
{
  return self->_storageManager;
}

- (void)setStorageManager:(id)a3
{
  objc_storeStrong((id *)&self->_storageManager, a3);
}

- (ABCPersistentStoreController)storeController
{
  return self->_storeController;
}

- (void)setStoreController:(id)a3
{
  objc_storeStrong((id *)&self->_storeController, a3);
}

- (ABCConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (DiagnosticLiaison)diagnosticLiaison
{
  return self->_diagnosticLiaison;
}

- (void)setDiagnosticLiaison:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticLiaison, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticLiaison, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_storeStrong((id *)&self->_storageManager, 0);
  objc_storeStrong((id *)&self->_caseManager, 0);
  objc_storeStrong((id *)&self->_cacheDeleteHandler, 0);
  objc_storeStrong((id *)&self->_diagExtensionController, 0);
  objc_storeStrong((id *)&self->diagTransport, 0);
  objc_storeStrong((id *)&self->diagCollectionTransport, 0);
  objc_storeStrong((id *)&self->adminQueue, 0);
  objc_storeStrong((id *)&self->_uploadController, 0);
}

@end
