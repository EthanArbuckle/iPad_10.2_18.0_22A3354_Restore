@implementation AVTCoreDataStoreServer

- (AVTCoreDataStoreServer)initWithEnvironment:(id)a3 imageHandlingDelegate:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  AVTStickerUserDefaultsBackend *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  AVTPushNotificationsSupport *v16;
  AVTPushNotificationsConnectionFactory *v17;
  AVTSyncSchedulingAuthority *v18;
  void *v19;
  AVTCoreDataStoreMaintenance *v20;
  AVTCoreDataStoreMaintenance *v21;
  AVTAvatarsDaemonServer *v22;
  void *v23;
  AVTAvatarsDaemonServer *v24;
  AVTCoreDataRemoteChangesObserver *v26;
  AVTCoreDataChangeTracker *v27;
  id v28;
  AVTSyncSchedulingAuthority *v29;
  AVTPassthroughEventCoalescer *v30;
  void *v31;
  AVTPushNotificationsSupport *v32;
  AVTStickerChangeObserver *v33;
  AVTStickerUserDefaultsBackend *v34;
  AVTCoreDataStoreBackend *v35;
  id v36;
  AVTCoreDataStoreServer *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;

  v5 = a3;
  v36 = a4;
  objc_msgSend(v5, "serialQueueProvider");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const char *))v6)[2](v6, "com.apple.AvatarUI.AVTCoreDataStoreServer.backgroundQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "storeLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTCoreDataPersistentStoreConfiguration localConfigurationWithStoreLocation:environment:](AVTCoreDataPersistentStoreConfiguration, "localConfigurationWithStoreLocation:environment:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x24BDAC760];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __68__AVTCoreDataStoreServer_initWithEnvironment_imageHandlingDelegate___block_invoke;
  v42[3] = &unk_24DD32D90;
  v43 = v5;
  v11 = v5;
  v39 = (void *)MEMORY[0x22074B1E8](v42);
  v35 = -[AVTCoreDataStoreBackend initWithConfiguration:environment:]([AVTCoreDataStoreBackend alloc], "initWithConfiguration:environment:", v9, v11);
  v12 = [AVTStickerUserDefaultsBackend alloc];
  objc_msgSend(v11, "serialQueueProvider");
  v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const char *))v13)[2](v13, "com.apple.AvatarUI.AVTCoreDataStoreServer.stickerBackend");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[AVTStickerUserDefaultsBackend initWithWorkQueue:environment:userDefaults:](v12, "initWithWorkQueue:environment:userDefaults:", v14, v11, v15);

  v33 = -[AVTStickerChangeObserver initWithStickerBackend:environment:]([AVTStickerChangeObserver alloc], "initWithStickerBackend:environment:", v34, v11);
  v16 = [AVTPushNotificationsSupport alloc];
  v17 = objc_alloc_init(AVTPushNotificationsConnectionFactory);
  v32 = -[AVTPushNotificationsSupport initWithEnvironment:connectionFactory:](v16, "initWithEnvironment:connectionFactory:", v11, v17);

  +[AVTCoreDataCloudKitMirroringConfiguration createMirroringHandlerWithEnvironment:](AVTCoreDataCloudKitMirroringConfiguration, "createMirroringHandlerWithEnvironment:", v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [AVTSyncSchedulingAuthority alloc];
  objc_msgSend(v11, "logger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[AVTSyncSchedulingAuthority initWithLogger:](v18, "initWithLogger:", v19);

  v30 = objc_alloc_init(AVTPassthroughEventCoalescer);
  v26 = -[AVTCoreDataRemoteChangesObserver initWithConfiguration:workQueue:coalescer:environment:]([AVTCoreDataRemoteChangesObserver alloc], "initWithConfiguration:workQueue:coalescer:environment:", v9, v7, v30, v11);
  v27 = -[AVTCoreDataChangeTracker initWithConfiguration:environment:]([AVTCoreDataChangeTracker alloc], "initWithConfiguration:environment:", v9, v11);
  v20 = [AVTCoreDataStoreMaintenance alloc];
  v40[0] = v10;
  v40[1] = 3221225472;
  v40[2] = __68__AVTCoreDataStoreServer_initWithEnvironment_imageHandlingDelegate___block_invoke_2;
  v40[3] = &unk_24DD32DB8;
  v41 = v9;
  v28 = v9;
  v21 = -[AVTCoreDataStoreMaintenance initWithEnvironment:managedObjectContextFactory:](v20, "initWithEnvironment:managedObjectContextFactory:", v11, v40);
  v22 = [AVTAvatarsDaemonServer alloc];
  objc_msgSend(v11, "logger");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[AVTAvatarsDaemonServer initWithLogger:](v22, "initWithLogger:", v23);

  v38 = -[AVTCoreDataStoreServer initWithLocalBackend:configuration:migratorProvider:pushSupport:mirroringHandler:schedulingAuthority:remoteChangesObserver:stickerChangeObserver:changeTracker:daemonServer:storeMaintenance:backgroundQueue:environment:imageHandlingDelegate:](self, "initWithLocalBackend:configuration:migratorProvider:pushSupport:mirroringHandler:schedulingAuthority:remoteChangesObserver:stickerChangeObserver:changeTracker:daemonServer:storeMaintenance:backgroundQueue:environment:imageHandlingDelegate:", v35, v28, v39, v32, v31, v29, v26, v33, v27, v24, v21, v7, v11, v36);
  return v38;
}

AVTStoreBackendMigrator *__68__AVTCoreDataStoreServer_initWithEnvironment_imageHandlingDelegate___block_invoke(uint64_t a1)
{
  return -[AVTStoreBackendMigrator initWithEnvironment:]([AVTStoreBackendMigrator alloc], "initWithEnvironment:", *(_QWORD *)(a1 + 32));
}

uint64_t __68__AVTCoreDataStoreServer_initWithEnvironment_imageHandlingDelegate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createManagedObjectContext");
}

- (AVTCoreDataStoreServer)initWithLocalBackend:(id)a3 configuration:(id)a4 migratorProvider:(id)a5 pushSupport:(id)a6 mirroringHandler:(id)a7 schedulingAuthority:(id)a8 remoteChangesObserver:(id)a9 stickerChangeObserver:(id)a10 changeTracker:(id)a11 daemonServer:(id)a12 storeMaintenance:(id)a13 backgroundQueue:(id)a14 environment:(id)a15 imageHandlingDelegate:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  AVTCoreDataStoreServer *v26;
  AVTCoreDataStoreServer *v27;
  uint64_t v28;
  AVTUILogger *logger;
  uint64_t v30;
  AVTBlockScheduler *blockScheduler;
  uint64_t v32;
  id migratorProvider;
  id v36;
  id v37;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;

  v46 = a3;
  v45 = a4;
  v47 = a5;
  v36 = a6;
  v44 = a6;
  v37 = a7;
  v43 = a7;
  v42 = a8;
  v41 = a9;
  v40 = a10;
  v39 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v48.receiver = self;
  v48.super_class = (Class)AVTCoreDataStoreServer;
  v26 = -[AVTCoreDataStoreServer init](&v48, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_backend, a3);
    objc_msgSend(v24, "logger");
    v28 = objc_claimAutoreleasedReturnValue();
    logger = v27->_logger;
    v27->_logger = (AVTUILogger *)v28;

    objc_msgSend(v24, "scheduler");
    v30 = objc_claimAutoreleasedReturnValue();
    blockScheduler = v27->_blockScheduler;
    v27->_blockScheduler = (AVTBlockScheduler *)v30;

    objc_storeStrong((id *)&v27->_configuration, a4);
    v32 = objc_msgSend(v47, "copy");
    migratorProvider = v27->_migratorProvider;
    v27->_migratorProvider = (id)v32;

    objc_storeStrong((id *)&v27->_pushNotificationsSupport, v36);
    -[AVTPushNotificationsSupport setDelegate:](v27->_pushNotificationsSupport, "setDelegate:", v27);
    objc_storeStrong((id *)&v27->_schedulingAuthority, a8);
    objc_storeStrong((id *)&v27->_mirroringHandler, v37);
    -[AVTCoreDataCloudKitMirroringHandler setDelegate:](v27->_mirroringHandler, "setDelegate:", v27);
    objc_storeStrong((id *)&v27->_remoteChangesObserver, a9);
    objc_storeStrong((id *)&v27->_stickerChangeObserver, a10);
    objc_storeStrong((id *)&v27->_changeTracker, a11);
    objc_storeStrong((id *)&v27->_daemonServer, a12);
    -[AVTAvatarsDaemonServer setDelegate:](v27->_daemonServer, "setDelegate:", v27);
    objc_storeStrong((id *)&v27->_storeMaintenance, a13);
    objc_storeStrong((id *)&v27->_backgroundQueue, a14);
    objc_storeStrong((id *)&v27->_environment, a15);
    objc_storeStrong((id *)&v27->_imageHandlingDelegate, a16);
    -[AVTStickerChangeObserver setImageHandlingDelegate:](v27->_stickerChangeObserver, "setImageHandlingDelegate:", v25);
  }

  return v27;
}

- (void)setImageHandlingDelegate:(id)a3
{
  AVTPBackendImageHandlingDelegate *v5;

  v5 = (AVTPBackendImageHandlingDelegate *)a3;
  if (self->_imageHandlingDelegate != v5)
  {
    objc_storeStrong((id *)&self->_imageHandlingDelegate, a3);
    -[AVTStickerChangeObserver setImageHandlingDelegate:](self->_stickerChangeObserver, "setImageHandlingDelegate:", v5);
  }

}

- (void)startListening
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  id location;
  id v28;
  _QWORD v29[5];

  if (AVTIsRunningAsSetupUser())
  {
    -[AVTCoreDataStoreServer logger](self, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logAvatarsdExitingWithReason:", CFSTR("Cancelling due to running as Setup User"));

    exit(0);
  }
  v3 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke;
  v29[3] = &unk_24DD31D38;
  v29[4] = self;
  if (!-[AVTCoreDataStoreServer processInternalSettingsChanges:](self, "processInternalSettingsChanges:", v29))
  {
    -[AVTCoreDataStoreServer logger](self, "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logStartingServer");

    -[AVTCoreDataStoreServer configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v5, "createStoreServerWithError:", &v28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v28;
    -[AVTCoreDataStoreServer setServer:](self, "setServer:", v6);

    -[AVTCoreDataStoreServer server](self, "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[AVTCoreDataStoreServer server](self, "server");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startListening");

      -[AVTCoreDataStoreServer daemonServer](self, "daemonServer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startListening");

      -[AVTCoreDataStoreServer pushNotificationsSupport](self, "pushNotificationsSupport");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startListeningToPushNotifications");

      objc_initWeak(&location, self);
      -[AVTCoreDataStoreServer remoteChangesObserver](self, "remoteChangesObserver");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v3;
      v25[1] = 3221225472;
      v25[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_2;
      v25[3] = &unk_24DD31790;
      objc_copyWeak(&v26, &location);
      objc_msgSend(v12, "addChangesHandler:", v25);

      -[AVTCoreDataStoreServer remoteChangesObserver](self, "remoteChangesObserver");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startObservingChanges");

      -[AVTCoreDataStoreServer mirroringHandler](self, "mirroringHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTCoreDataStoreServer environment](self, "environment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "notificationCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startObservingResetSyncWithNotificationCenter:", v16);

      +[AVTBackgroundActivitySchedulerFactory schedulerForPostInstallMigrationActivity](AVTBackgroundActivitySchedulerFactory, "schedulerForPostInstallMigrationActivity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v3;
      v24[1] = 3221225472;
      v24[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_4;
      v24[3] = &unk_24DD32E28;
      v24[4] = self;
      objc_msgSend(v17, "scheduleWithBlock:", v24);
      +[AVTBackgroundActivitySchedulerFactory schedulerForUserRequestedBackupActivity](AVTBackgroundActivitySchedulerFactory, "schedulerForUserRequestedBackupActivity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v3;
      v23[1] = 3221225472;
      v23[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_7;
      v23[3] = &unk_24DD32E28;
      v23[4] = self;
      objc_msgSend(v18, "scheduleWithBlock:", v23);
      v22[0] = v3;
      v22[1] = 3221225472;
      v22[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_11;
      v22[3] = &unk_24DD31D38;
      v22[4] = self;
      -[AVTCoreDataStoreServer scheduleSetupThen:](self, "scheduleSetupThen:", v22);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    else
    {
      -[AVTCoreDataStoreServer logger](self, "logger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logErrorStartingServer:", v20);

    }
  }
}

void __40__AVTCoreDataStoreServer_startListening__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logAvatarsdExitingWithReason:", CFSTR("Completed Internal Settings changes"));

  exit(0);
}

void __40__AVTCoreDataStoreServer_startListening__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((*((unsigned int (**)(uint64_t, void *, void *))AVTAnyTransactionHasChangesFromAuthor + 2))((uint64_t)AVTAnyTransactionHasChangesFromAuthor, v5, CFSTR("AvatarUIClient")))
  {
    objc_msgSend(WeakRetained, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logChangesRequireExport");

    objc_msgSend(WeakRetained, "schedulingAuthority");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "madeLocalChanges");

    objc_msgSend(WeakRetained, "scheduleExportWithManagedObjectContext:discretionary:completion:", v11, 0, &__block_literal_global_9);
  }
  if ((*((unsigned int (**)(uint64_t, void *, void *))AVTAnyTransactionHasChangesFromOtherThanAuthor + 2))((uint64_t)AVTAnyTransactionHasChangesFromOtherThanAuthor, v5, CFSTR("AvatarUIClient")))
  {
    objc_msgSend(WeakRetained, "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logChangesRequireThumbnailUpdate");

    objc_msgSend(WeakRetained, "storeMaintenance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storeDidChange");

    objc_msgSend(WeakRetained, "scheduleUpdateThumbnails");
    objc_msgSend(WeakRetained, "deleteStickerRecents");
  }
  if (!AVTUIHasDisplayedSplashScreen_once()
    || !AVTUIHasDisplayedAnimojiSplashScreen_once()
    || !AVTUIHasDisplayedCameraEffectsSplashScreen_once()
    || (AVTUIHasDisplayedPaddleView_once() & 1) == 0)
  {
    if ((*((unsigned int (**)(uint64_t, void *))AVTAnyTransactionHasAvatarChange + 2))((uint64_t)AVTAnyTransactionHasAvatarChange, v5))
    {
      AVTUISetHasDisplayedSplashScreen(1);
      AVTUISetHasDisplayedAnimojiSplashScreen(1);
      AVTUISetHasDisplayedCameraEffectsSplashScreen(1);
      AVTUISetHasDisplayedPaddleView(1);
    }
  }

}

void __40__AVTCoreDataStoreServer_startListening__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_5;
  v6[3] = &unk_24DD32E00;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performingMigrationXPCActivity:", v6);

}

void __40__AVTCoreDataStoreServer_startListening__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "blockScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_6;
  v5[3] = &unk_24DD31740;
  v3 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  objc_msgSend(*(id *)(a1 + 32), "backgroundQueue", v5[0], 3221225472, __40__AVTCoreDataStoreServer_startListening__block_invoke_6, &unk_24DD31740, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBlock:afterDelay:onQueue:", v5, v4, 0.0);

}

uint64_t __40__AVTCoreDataStoreServer_startListening__block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMigrationActivityCompletion:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "completeMigrationActivityIfNeeded");
}

void __40__AVTCoreDataStoreServer_startListening__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_8;
  v6[3] = &unk_24DD32E00;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performingUserRequestedBackupActivity:", v6);

}

void __40__AVTCoreDataStoreServer_startListening__block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "blockScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_9;
  v5[3] = &unk_24DD31740;
  v3 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  objc_msgSend(*(id *)(a1 + 32), "backgroundQueue", v5[0], 3221225472, __40__AVTCoreDataStoreServer_startListening__block_invoke_9, &unk_24DD31740, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBlock:afterDelay:onQueue:", v5, v4, 0.0);

}

uint64_t __40__AVTCoreDataStoreServer_startListening__block_invoke_9(uint64_t a1)
{
  uint64_t result;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "setUserRequestedBackupActivityCompletion:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "setupCompleted");
  if ((_DWORD)result)
  {
    v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_10;
    v4[3] = &unk_24DD31D38;
    v4[4] = v3;
    return objc_msgSend(v3, "scheduleImportExportIfRequiredWithPostImportHandler:completion:", 0, v4);
  }
  return result;
}

uint64_t __40__AVTCoreDataStoreServer_startListening__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserRequestedBackupActivityIfNeeded");
}

uint64_t __40__AVTCoreDataStoreServer_startListening__block_invoke_11(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeMigrationActivityIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "completeUserRequestedBackupActivityIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "importSetupUserDataIfNeeded");
}

- (void)completeMigrationActivityIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  -[AVTCoreDataStoreServer backgroundQueue](self, "backgroundQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[AVTCoreDataStoreServer setupCompleted](self, "setupCompleted"))
  {
    -[AVTCoreDataStoreServer migrationActivityCompletion](self, "migrationActivityCompletion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[AVTCoreDataStoreServer logger](self, "logger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMigrationXPCActivityFinished");

      -[AVTCoreDataStoreServer migrationActivityCompletion](self, "migrationActivityCompletion");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, 1);

      -[AVTCoreDataStoreServer setMigrationActivityCompletion:](self, "setMigrationActivityCompletion:", 0);
    }
  }
}

- (void)completeUserRequestedBackupActivityIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  -[AVTCoreDataStoreServer backgroundQueue](self, "backgroundQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[AVTCoreDataStoreServer setupCompleted](self, "setupCompleted"))
  {
    -[AVTCoreDataStoreServer userRequestedBackupActivityCompletion](self, "userRequestedBackupActivityCompletion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[AVTCoreDataStoreServer logger](self, "logger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logUserRequestedBackupXPCActivityFinished");

      -[AVTCoreDataStoreServer userRequestedBackupActivityCompletion](self, "userRequestedBackupActivityCompletion");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, 1);

      -[AVTCoreDataStoreServer setUserRequestedBackupActivityCompletion:](self, "setUserRequestedBackupActivityCompletion:", 0);
    }
  }
}

- (void)scheduleSetupThen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  -[AVTCoreDataStoreServer blockScheduler](self, "blockScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__AVTCoreDataStoreServer_scheduleSetupThen___block_invoke;
  v10[3] = &unk_24DD31E40;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  -[AVTCoreDataStoreServer backgroundQueue](self, "backgroundQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performBlock:afterDelay:onQueue:", v10, v9, 0.0);

}

void __44__AVTCoreDataStoreServer_scheduleSetupThen___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__AVTCoreDataStoreServer_scheduleSetupThen___block_invoke_2;
  v3[3] = &unk_24DD31740;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "setupThen:", v3);

}

uint64_t __44__AVTCoreDataStoreServer_scheduleSetupThen___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setupThen:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AVTCoreDataStoreServer logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__AVTCoreDataStoreServer_setupThen___block_invoke;
  v7[3] = &unk_24DD32E00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "settingUpStore:", v7);

}

void __36__AVTCoreDataStoreServer_setupThen___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v2 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __36__AVTCoreDataStoreServer_setupThen___block_invoke_2;
  v19[3] = &unk_24DD31740;
  v3 = *(void **)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = v3;
  v4 = (void *)MEMORY[0x22074B1E8](v19);
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v6 = objc_msgSend(v5, "setupIfNeeded:", &v18);
  v7 = v18;

  v8 = (void *)os_transaction_create();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backgroundQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v16[1] = 3221225472;
  v16[2] = __36__AVTCoreDataStoreServer_setupThen___block_invoke_3;
  v16[3] = &unk_24DD32E50;
  v17 = v8;
  v11 = v8;
  objc_msgSend(v9, "updateBackupInclusionStatusOnQueue:completionHandler:", v10, v16);

  v12 = *(void **)(a1 + 32);
  if ((v6 & 1) != 0)
  {
    v15[0] = v2;
    v15[1] = 3221225472;
    v15[2] = __36__AVTCoreDataStoreServer_setupThen___block_invoke_4;
    v15[3] = &unk_24DD31C40;
    v15[4] = v12;
    objc_msgSend(v12, "scheduleImportExportIfRequiredWithPostImportHandler:completion:", v15, v4);
  }
  else
  {
    objc_msgSend(v12, "logger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logErrorSettingUpStore:", v14);

  }
}

uint64_t __36__AVTCoreDataStoreServer_setupThen___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSetupCompleted:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __36__AVTCoreDataStoreServer_setupThen___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logSetupSchedulingMigrationCheck");

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__AVTCoreDataStoreServer_setupThen___block_invoke_5;
  v7[3] = &unk_24DD31740;
  v7[4] = v5;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "scheduleMigrationThen:", v7);

}

uint64_t __36__AVTCoreDataStoreServer_setupThen___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateThumbnails");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)scheduleImportExportIfRequiredWithPostImportHandler:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  int v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD, _QWORD);
  _QWORD v17[5];
  id v18;
  id v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke;
  v17[3] = &unk_24DD32EC8;
  v17[4] = self;
  v20 = 1;
  v9 = v7;
  v18 = v9;
  v10 = v6;
  v19 = v10;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x22074B1E8](v17);
  -[AVTCoreDataStoreServer schedulingAuthority](self, "schedulingAuthority");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "importRequired");

  if (v13)
  {
    -[AVTCoreDataStoreServer logger](self, "logger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logSetupSchedulingImport");

    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_4;
    v15[3] = &unk_24DD32EF0;
    v16 = v11;
    -[AVTCoreDataStoreServer scheduleImportDiscretionary:completionBlock:](self, "scheduleImportDiscretionary:completionBlock:", 1, v15);

  }
  else
  {
    v11[2](v11, 0);
  }

}

void __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_2;
  v7[3] = &unk_24DD32EA0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v8 = v4;
  v10 = *(_BYTE *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  v5 = (void (**)(_QWORD))MEMORY[0x22074B1E8](v7);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, void (**)(_QWORD)))(v6 + 16))(v6, v5);
  else
    v5[2](v5);

}

void __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "schedulingAuthority");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "exportRequired");

  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "createManagedObjectContext");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logSetupSchedulingExport");

    v8 = *(void **)(a1 + 32);
    v9 = *(unsigned __int8 *)(a1 + 56);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_3;
    v10[3] = &unk_24DD32E78;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v8, "scheduleExportWithManagedObjectContext:discretionary:completion:", v5, v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)scheduleMigrationThen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  -[AVTCoreDataStoreServer blockScheduler](self, "blockScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__AVTCoreDataStoreServer_scheduleMigrationThen___block_invoke;
  v10[3] = &unk_24DD31E40;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  -[AVTCoreDataStoreServer backgroundQueue](self, "backgroundQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performBlock:afterDelay:onQueue:", v10, v9, 0.0);

}

uint64_t __48__AVTCoreDataStoreServer_scheduleMigrationThen___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "migrate");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)migrate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void (**v12)(void);
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[AVTCoreDataStoreServer logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logCheckingIfMigrationNeeded");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AVTCoreDataStoreServer configuration](self, "configuration", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "migratableSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "migrationNeeded"))
        {
          if (!v8)
          {
            -[AVTCoreDataStoreServer migratorProvider](self, "migratorProvider");
            v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v12[2]();
            v8 = (void *)objc_claimAutoreleasedReturnValue();

          }
          -[AVTCoreDataStoreServer backend](self, "backend");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "migrateContentFromSource:toDestination:error:", v11, v13, 0);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

}

- (void)scheduleImportDiscretionary:(BOOL)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  BOOL v16;

  v6 = a4;
  -[AVTCoreDataStoreServer logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logSchedulingImport");

  v8 = (void *)os_transaction_create();
  -[AVTCoreDataStoreServer blockScheduler](self, "blockScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v16 = a3;
  v14 = v8;
  v15 = v6;
  v10 = v8;
  v11 = v6;
  -[AVTCoreDataStoreServer backgroundQueue](self, "backgroundQueue", v13, 3221225472, __70__AVTCoreDataStoreServer_scheduleImportDiscretionary_completionBlock___block_invoke, &unk_24DD32F40, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBlock:afterDelay:onQueue:", &v13, v12, 1.0);

}

void __70__AVTCoreDataStoreServer_scheduleImportDiscretionary_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "mirroringHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "backgroundQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__AVTCoreDataStoreServer_scheduleImportDiscretionary_completionBlock___block_invoke_2;
  v8[3] = &unk_24DD32F18;
  v8[4] = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v4, "importChangesWithManagedObjectContext:discretionary:workQueue:completionHandler:", v7, v5, v6, v8);

}

uint64_t __70__AVTCoreDataStoreServer_scheduleImportDiscretionary_completionBlock___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "schedulingAuthority");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "importDidCompleteSuccessfully");

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (BOOL)processInternalSettingsChanges:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  void (**v21)(_QWORD);
  void (**v22)(_QWORD);
  id v23;
  _QWORD v24[5];

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)os_transaction_create();
  v6 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __57__AVTCoreDataStoreServer_processInternalSettingsChanges___block_invoke;
  v24[3] = &unk_24DD31D38;
  v24[4] = self;
  v7 = (void (**)(_QWORD))MEMORY[0x22074B1E8](v24);
  if (AVTUIWipeLocalDatabase())
  {
    AVTUISetWipeLocalDatabase(0);
    v7[2](v7);
    v4[2](v4);
LABEL_9:
    v15 = 1;
    goto LABEL_10;
  }
  if (AVTUIWipeCloudKitContainer())
  {
    -[AVTCoreDataStoreServer logger](self, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logWillResetZone");

    AVTUISetWipeCloudKitContainer(0);
    -[AVTCoreDataStoreServer configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v10 = objc_msgSend(v9, "setupIfNeeded:", &v23);
    v11 = v23;

    if ((v10 & 1) != 0)
    {
      -[AVTCoreDataStoreServer configuration](self, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "createManagedObjectContext");
      v13 = objc_claimAutoreleasedReturnValue();

      -[AVTCoreDataStoreServer mirroringHandler](self, "mirroringHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v6;
      v19[1] = 3221225472;
      v19[2] = __57__AVTCoreDataStoreServer_processInternalSettingsChanges___block_invoke_2;
      v19[3] = &unk_24DD32F68;
      v19[4] = self;
      v21 = v7;
      v20 = v5;
      v22 = v4;
      objc_msgSend(v14, "resetZoneWithManagedObjectContext:completionHandler:", v13, v19);

      v11 = (id)v13;
    }
    else
    {
      -[AVTCoreDataStoreServer logger](self, "logger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logErrorSettingUpStore:", v17);

      v4[2](v4);
    }

    goto LABEL_9;
  }
  v15 = 0;
LABEL_10:

  return v15;
}

void __57__AVTCoreDataStoreServer_processInternalSettingsChanges___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tearDownAndEraseAllContent:", 0);

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageStoreLocation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "imageHandlingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearContentAtLocation:", v5);

}

void __57__AVTCoreDataStoreServer_processInternalSettingsChanges___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)a1[4];
  v6 = a3;
  objc_msgSend(v5, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "logDidResetZoneWithSuccess:error:", a2, v8);
  if ((_DWORD)a2)
  {
    (*(void (**)(void))(a1[6] + 16))();
    (*(void (**)(void))(a1[7] + 16))();
  }
}

- (void)scheduleExportWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)os_transaction_create();
  -[AVTCoreDataStoreServer mirroringHandler](self, "mirroringHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreDataStoreServer backgroundQueue](self, "backgroundQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __90__AVTCoreDataStoreServer_scheduleExportWithManagedObjectContext_discretionary_completion___block_invoke;
  v15[3] = &unk_24DD32F90;
  v16 = v10;
  v17 = v8;
  v15[4] = self;
  v13 = v10;
  v14 = v8;
  objc_msgSend(v11, "scheduleExportChangesWithManagedObjectContext:discretionary:workQueue:completionHandler:", v9, v5, v12, v15);

}

void __90__AVTCoreDataStoreServer_scheduleExportWithManagedObjectContext_discretionary_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "schedulingAuthority");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exportDidCompleteSuccessfully");

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (void)updateThumbnails
{
  void *v3;
  void *v4;
  id v5;

  -[AVTCoreDataStoreServer logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logUpdatingThumbnails");

  -[AVTCoreDataStoreServer imageHandlingDelegate](self, "imageHandlingDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTCoreDataStoreServer changeTracker](self, "changeTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateThumbnailsForChangesWithTracker:recordProvider:", v4, 0);

}

- (void)scheduleUpdateThumbnails
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)os_transaction_create();
  -[AVTCoreDataStoreServer logger](self, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logSchedulingUpdateThumbnails");

  -[AVTCoreDataStoreServer blockScheduler](self, "blockScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = v3;
  v6 = v3;
  -[AVTCoreDataStoreServer backgroundQueue](self, "backgroundQueue", v8, 3221225472, __50__AVTCoreDataStoreServer_scheduleUpdateThumbnails__block_invoke, &unk_24DD318B8, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:afterDelay:onQueue:", &v8, v7, 1.0);

}

uint64_t __50__AVTCoreDataStoreServer_scheduleUpdateThumbnails__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateThumbnails");
}

- (void)deleteStickerRecents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = (void *)os_transaction_create();
  -[AVTCoreDataStoreServer logger](self, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logDeletingStickerRecents");

  -[AVTCoreDataStoreServer stickerChangeObserver](self, "stickerChangeObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreDataStoreServer changeTracker](self, "changeTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__AVTCoreDataStoreServer_deleteStickerRecents__block_invoke;
  v8[3] = &unk_24DD32E50;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "processChangesForChangeTracker:completionHandler:", v6, v8);

}

- (void)didReceivePushNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = (void *)os_transaction_create();
  -[AVTCoreDataStoreServer blockScheduler](self, "blockScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = v4;
  v6 = v4;
  -[AVTCoreDataStoreServer backgroundQueue](self, "backgroundQueue", v8, 3221225472, __53__AVTCoreDataStoreServer_didReceivePushNotification___block_invoke, &unk_24DD318B8, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:afterDelay:onQueue:", &v8, v7, 0.0);

}

void __53__AVTCoreDataStoreServer_didReceivePushNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "schedulingAuthority");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceivePushNotification");

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__AVTCoreDataStoreServer_didReceivePushNotification___block_invoke_2;
  v4[3] = &unk_24DD31F58;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "scheduleImportDiscretionary:completionBlock:", 1, v4);

}

+ (BOOL)resetSyncShouldPreserveContentForReason:(unint64_t)a3
{
  BOOL result;

  result = AVTUIPreserveContentOnAccountChange();
  if (a3 == 4)
    return 0;
  return result;
}

- (void)mirroringHandler:(id)a3 willResetSyncWithReason:(unint64_t)a4
{
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (objc_msgSend((id)objc_opt_class(), "resetSyncShouldPreserveContentForReason:", a4))
  {
    -[AVTCoreDataStoreServer configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v6 = objc_msgSend(v5, "copyStorageAside:", &v10);
    v7 = v10;

    if ((v6 & 1) == 0)
    {
      -[AVTCoreDataStoreServer logger](self, "logger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logErrorCopyingStorageAside:", v9);

    }
  }
}

- (void)mirroringHandler:(id)a3 didResetSyncWithReason:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v6 = (void *)os_transaction_create();
  -[AVTCoreDataStoreServer blockScheduler](self, "blockScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__AVTCoreDataStoreServer_mirroringHandler_didResetSyncWithReason___block_invoke;
  v10[3] = &unk_24DD31B00;
  v11 = v6;
  v12 = a4;
  v10[4] = self;
  v8 = v6;
  -[AVTCoreDataStoreServer backgroundQueue](self, "backgroundQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performBlock:afterDelay:onQueue:", v10, v9, 0.0);

}

void __66__AVTCoreDataStoreServer_mirroringHandler_didResetSyncWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "schedulingAuthority");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didResetSync");

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__AVTCoreDataStoreServer_mirroringHandler_didResetSyncWithReason___block_invoke_2;
  v7[3] = &unk_24DD32FB8;
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__AVTCoreDataStoreServer_mirroringHandler_didResetSyncWithReason___block_invoke_3;
  v5[3] = &unk_24DD31D38;
  v6 = v4;
  objc_msgSend(v8, "scheduleImportExportIfRequiredWithPostImportHandler:completion:", v7, v5);

}

void __66__AVTCoreDataStoreServer_mirroringHandler_didResetSyncWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  if (objc_msgSend((id)objc_opt_class(), "resetSyncShouldPreserveContentForReason:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "copiedAsideMigratableSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "migratorProvider");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "backend");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v9 = objc_msgSend(v7, "migrateContentFromSource:toDestination:error:", v5, v8, &v13);
    v10 = v13;

    if ((v9 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logErrorMergingCopiedAsideContent:", v12);

    }
  }
  v3[2](v3);

}

- (void)clientDidCheckInForServer:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = (void *)os_transaction_create();
  -[AVTCoreDataStoreServer blockScheduler](self, "blockScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = v4;
  v6 = v4;
  -[AVTCoreDataStoreServer backgroundQueue](self, "backgroundQueue", v8, 3221225472, __52__AVTCoreDataStoreServer_clientDidCheckInForServer___block_invoke, &unk_24DD318B8, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:afterDelay:onQueue:", &v8, v7, 0.0);

}

void __52__AVTCoreDataStoreServer_clientDidCheckInForServer___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "setupCompleted"))
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __52__AVTCoreDataStoreServer_clientDidCheckInForServer___block_invoke_2;
    v3[3] = &unk_24DD31D38;
    v2 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "scheduleImportExportIfRequiredWithPostImportHandler:completion:", 0, v3);

  }
}

- (AVTPBackendImageHandlingDelegate)imageHandlingDelegate
{
  return self->_imageHandlingDelegate;
}

- (AVTStoreBackend)backend
{
  return self->_backend;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTBlockScheduler)blockScheduler
{
  return self->_blockScheduler;
}

- (AVTCoreDataPersistentStoreLocalConfiguration)configuration
{
  return self->_configuration;
}

- (id)migratorProvider
{
  return self->_migratorProvider;
}

- (NSXPCStoreServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (AVTPushNotificationsSupport)pushNotificationsSupport
{
  return self->_pushNotificationsSupport;
}

- (AVTCoreDataCloudKitMirroringHandler)mirroringHandler
{
  return self->_mirroringHandler;
}

- (AVTSyncSchedulingAuthority)schedulingAuthority
{
  return self->_schedulingAuthority;
}

- (AVTCoreDataRemoteChangesObserver)remoteChangesObserver
{
  return self->_remoteChangesObserver;
}

- (AVTStickerChangeObserver)stickerChangeObserver
{
  return self->_stickerChangeObserver;
}

- (AVTAvatarRecordChangeTracker)changeTracker
{
  return self->_changeTracker;
}

- (AVTAvatarsDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (AVTCoreDataStoreMaintenance)storeMaintenance
{
  return self->_storeMaintenance;
}

- (BOOL)setupCompleted
{
  return self->_setupCompleted;
}

- (void)setSetupCompleted:(BOOL)a3
{
  self->_setupCompleted = a3;
}

- (id)migrationActivityCompletion
{
  return self->_migrationActivityCompletion;
}

- (void)setMigrationActivityCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)userRequestedBackupActivityCompletion
{
  return self->_userRequestedBackupActivityCompletion;
}

- (void)setUserRequestedBackupActivityCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userRequestedBackupActivityCompletion, 0);
  objc_storeStrong(&self->_migrationActivityCompletion, 0);
  objc_storeStrong((id *)&self->_storeMaintenance, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_changeTracker, 0);
  objc_storeStrong((id *)&self->_stickerChangeObserver, 0);
  objc_storeStrong((id *)&self->_remoteChangesObserver, 0);
  objc_storeStrong((id *)&self->_schedulingAuthority, 0);
  objc_storeStrong((id *)&self->_mirroringHandler, 0);
  objc_storeStrong((id *)&self->_pushNotificationsSupport, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong(&self->_migratorProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_blockScheduler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_imageHandlingDelegate, 0);
}

@end
