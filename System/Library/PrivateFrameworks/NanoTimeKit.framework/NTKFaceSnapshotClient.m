@implementation NTKFaceSnapshotClient

- (void)requestSnapshotOfFace:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Requesting snapshot for face:%@", buf, 0xCu);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__NTKFaceSnapshotClient_requestSnapshotOfFace___block_invoke;
  v8[3] = &unk_1E6BCD778;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

+ (NTKFaceSnapshotClient)sharedInstance
{
  if (sharedInstance_onceToken_23 != -1)
    dispatch_once(&sharedInstance_onceToken_23, &__block_literal_global_156);
  return (NTKFaceSnapshotClient *)(id)sharedInstance___sharedInstance_9;
}

void __39__NTKFaceSnapshotClient_sharedInstance__block_invoke()
{
  NTKFaceSnapshotClient *v0;
  void *v1;

  v0 = objc_alloc_init(NTKFaceSnapshotClient);
  v1 = (void *)sharedInstance___sharedInstance_9;
  sharedInstance___sharedInstance_9 = (uint64_t)v0;

}

- (NTKFaceSnapshotClient)init
{
  NTKFaceSnapshotClient *v2;
  NTKFaceSnapshotClient *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *snapshotFileQueue;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKFaceSnapshotClient;
  v2 = -[NTKFaceSnapshotClient init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NTKFaceSnapshotClient _setupDaemonConnection](v2, "_setupDaemonConnection");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.nanotimekit.facesnapshotclient.diskaccess", v4);
    snapshotFileQueue = v3->_snapshotFileQueue;
    v3->_snapshotFileQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__handleCustomMonogramChangedNotification, CFSTR("NTKCustomMonogramChangedNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__handleSignificantLocationChangeNotification, CFSTR("NTKLocationManagerSignificantLocationChangeNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__handleActiveDeviceChangedNotification, *MEMORY[0x1E0C93E48], 0);

  }
  return v3;
}

void __47__NTKFaceSnapshotClient_requestSnapshotOfFace___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setupDaemonConnection");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "instanceDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestSnapshotOfFaceInstanceDescriptor:", v2);

}

- (void)_setupDaemonConnection
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSXPCConnection *v4;
  NSXPCConnection *daemonConnection;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  _NTKFaceSnapshotClientProxy *v10;
  NSXPCConnection *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  NSXPCConnection *v14;
  uint64_t v15;
  NSXPCConnection *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  if (!self->_daemonConnection)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDaemonDidLaunchNotification_1, CFSTR("com.apple.nanotimekit.daemondidlaunch"), 0, (CFNotificationSuspensionBehavior)0);
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nanotimekit.facesnapshotserver"), 4096);
    daemonConnection = self->_daemonConnection;
    self->_daemonConnection = v4;

    v6 = self->_daemonConnection;
    NTKFaceSnapshotServerInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v8 = self->_daemonConnection;
    NTKFaceSnapshotClientInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    v10 = -[_NTKFaceSnapshotClientProxy initWithWeakProxy:]([_NTKFaceSnapshotClientProxy alloc], "initWithWeakProxy:", self);
    -[NSXPCConnection setExportedObject:](self->_daemonConnection, "setExportedObject:", v10);
    v11 = self->_daemonConnection;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.NanoTimeKit.NTKFaceSnapshotClient", v12);
    -[NSXPCConnection _setQueue:](v11, "_setQueue:", v13);

    objc_initWeak(&location, self);
    v14 = self->_daemonConnection;
    v15 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke;
    v19[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInterruptionHandler:](v14, "setInterruptionHandler:", v19);
    v16 = self->_daemonConnection;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_2;
    v17[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInvalidationHandler:](v16, "setInvalidationHandler:", v17);
    -[NSXPCConnection resume](self->_daemonConnection, "resume");
    -[NTKFaceSnapshotClient _register](self, "_register");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

- (void)_register
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Registering for updates", v5, 2u);
  }

  -[NSXPCConnection remoteObjectProxy](self->_daemonConnection, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForUpdates");

  self->_registrationNeeded = 0;
}

void __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_cold_1();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_25;
  block[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_25(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("NTKFaceSnapshotClientInterruptionName"), WeakRetained);

  objc_msgSend(WeakRetained, "_handleConnectionInterrupted");
}

void __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  void *v4;

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__NTKPersistentFaceCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_4_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKFaceSnapshotClient;
  -[NTKFaceSnapshotClient dealloc](&v4, sel_dealloc);
}

- (void)performAfterCompletingCurrentlyPendingSnapshots:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__NTKFaceSnapshotClient_performAfterCompletingCurrentlyPendingSnapshots___block_invoke;
  v6[3] = &unk_1E6BD00B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __73__NTKFaceSnapshotClient_performAfterCompletingCurrentlyPendingSnapshots___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setupDaemonConnection");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAfterCompletingCurrentlyPendingSnapshots:", *(_QWORD *)(a1 + 40));

}

- (void)_askXPCServiceForSnapshotOfDescriptor:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  dispatch_time_t v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _QWORD *v49;
  _QWORD v50[3];
  char v51;
  _QWORD aBlock[6];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__50;
  v63 = __Block_byref_object_dispose__50;
  v64 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.NTKFaceSnapshotService"));
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.NTKFaceSnapshotService"));
  v12 = (void *)v60[5];
  v60[5] = v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F8EBD300);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v60[5], "setRemoteObjectInterface:", v13);

  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__50;
  v57 = __Block_byref_object_dispose__50;
  v58 = 0;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke;
  aBlock[3] = &unk_1E6BCFA78;
  aBlock[4] = &v59;
  aBlock[5] = &v53;
  v15 = _Block_copy(aBlock);
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v51 = 0;
  objc_msgSend(v8, "description");
  v45[0] = v14;
  v45[1] = 3221225472;
  v45[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3;
  v45[3] = &unk_1E6BD97C0;
  v49 = v50;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v46 = v16;
  v17 = v10;
  v47 = v17;
  v18 = v15;
  v48 = v18;
  v19 = _Block_copy(v45);
  v20 = (void *)v60[5];
  v43[0] = v14;
  v43[1] = 3221225472;
  v43[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_34;
  v43[3] = &unk_1E6BD3F30;
  v21 = v19;
  v44 = v21;
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v43);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v54[5];
  v54[5] = v22;

  objc_initWeak(&location, self);
  v24 = (void *)v60[5];
  v39[0] = v14;
  v39[1] = 3221225472;
  v39[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_37;
  v39[3] = &unk_1E6BD1890;
  objc_copyWeak(&v41, &location);
  v25 = v21;
  v40 = v25;
  objc_msgSend(v24, "setInterruptionHandler:", v39);
  v26 = (void *)v60[5];
  v37[0] = v14;
  v37[1] = 3221225472;
  v37[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_39;
  v37[3] = &unk_1E6BCDF60;
  v27 = v25;
  v38 = v27;
  objc_msgSend(v26, "setInvalidationHandler:", v37);
  objc_msgSend((id)v60[5], "resume");
  v28 = (void *)v54[5];
  v35[0] = v14;
  v35[1] = 3221225472;
  v35[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_41;
  v35[3] = &unk_1E6BCFDB8;
  v29 = v27;
  v36 = v29;
  objc_msgSend(v28, "provideSnapshotOfFaceInstanceDescriptor:options:completion:", v8, v9, v35);
  v30 = dispatch_time(0, 30000000000);
  v33[0] = v14;
  v33[1] = 3221225472;
  v33[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_4;
  v33[3] = &unk_1E6BCDF60;
  v34 = v29;
  v31 = v29;
  v32 = (void *)MEMORY[0x1E0C80D38];
  dispatch_after(v30, MEMORY[0x1E0C80D38], v33);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  __int128 v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2;
  v1[3] = &unk_1E6BCFA78;
  v2 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v1);
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setInvalidationHandler:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3(_QWORD *a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v6 = *(_QWORD *)(a1[7] + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    if ((a3 & 1) == 0)
    {
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_cold_2();

    }
  }
  else
  {
    if (a3)
    {
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_cold_1();

      v6 = *(_QWORD *)(a1[7] + 8);
    }
    *(_BYTE *)(v6 + 24) = 1;
    v9 = a1[5];
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
    (*(void (**)(void))(a1[6] + 16))();
  }

}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_34_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_35;
  block[3] = &unk_1E6BCDF60;
  v12 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_37(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_37_cold_1();

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_38;
  v3[3] = &unk_1E6BD1890;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

  objc_destroyWeak(&v5);
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_38(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKFaceSnapshotClientInterruptionName"), WeakRetained);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_39(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_39_cold_1();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_40;
  block[3] = &unk_1E6BCDF60;
  v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_41(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_42;
  v7[3] = &unk_1E6BCE3C8;
  v5 = *(id *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_42(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_askDaemonForSnapshotOfDescriptor:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  dispatch_time_t v18;
  id v19;
  void *v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v8, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v12 = MEMORY[0x1E0C809B0];
  v30 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke;
  aBlock[3] = &unk_1E6BD97E8;
  v28 = v29;
  v13 = v11;
  v26 = v13;
  v14 = v10;
  v27 = v14;
  v15 = _Block_copy(aBlock);
  -[NTKFaceSnapshotClient _setupDaemonConnection](self, "_setupDaemonConnection");
  -[NSXPCConnection remoteObjectProxy](self->_daemonConnection, "remoteObjectProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_44;
  v23[3] = &unk_1E6BD0150;
  v17 = v15;
  v24 = v17;
  objc_msgSend(v16, "snapshotFaceInstanceDescriptor:options:completion:", v8, v9, v23);
  v18 = dispatch_time(0, 30000000000);
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_3;
  block[3] = &unk_1E6BCDF60;
  v22 = v17;
  v19 = v17;
  v20 = (void *)MEMORY[0x1E0C80D38];
  dispatch_after(v18, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v29, 8);
}

void __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    if ((a3 & 1) == 0)
    {
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_cold_2();

    }
  }
  else
  {
    if (a3)
    {
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_cold_1();

      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    *(_BYTE *)(v6 + 24) = 1;
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
  }

}

void __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_2;
  v6[3] = &unk_1E6BCE3C8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)snapshotFace:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  int v20;
  dispatch_qos_class_t v21;
  int v22;
  id v23;
  dispatch_block_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  NTKFaceSnapshotClient *v35;
  id v36;
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke;
  aBlock[3] = &unk_1E6BD1840;
  v12 = v8;
  v34 = v12;
  v35 = self;
  v13 = v9;
  v36 = v13;
  v14 = v10;
  v37 = v14;
  v15 = _Block_copy(aBlock);
  if ((NTKAlwaysGenerateSnapshots() & 1) != 0)
    goto LABEL_15;
  objc_msgSend(v13, "valueForKey:", CFSTR("NTKSnapshotPersistableKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  v17 = objc_msgSend(v16, "BOOLValue");

  if (!v17)
  {
LABEL_15:
    objc_msgSend(v12, "instanceDescriptor");
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_5;
    v25[3] = &unk_1E6BD1840;
    v25[4] = self;
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = v13;
    v28 = v14;
    v18 = v26;
    dispatch_async(MEMORY[0x1E0C80D38], v25);

    v23 = v26;
    goto LABEL_16;
  }
  objc_msgSend(v13, "valueForKey:", CFSTR("NTKSnapshotPriorityKey"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = objc_msgSend(v18, "unsignedIntegerValue");
    if (v19 == 2)
      v20 = 21;
    else
      v20 = 17;
    if (v19 == 3)
      v21 = QOS_CLASS_USER_INITIATED;
    else
      v21 = v20;
    if (v19 == 3)
      v22 = -1;
    else
      v22 = 0;
  }
  else
  {
    v22 = 0;
    v21 = QOS_CLASS_UTILITY;
  }
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_3;
  block[3] = &unk_1E6BD5EE0;
  v30 = v12;
  v31 = v14;
  v32 = v15;
  v24 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v21, v22, block);
  dispatch_async((dispatch_queue_t)self->_snapshotFileQueue, v24);

  v23 = v30;
LABEL_16:

}

void __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_2;
  v5[3] = &unk_1E6BD1840;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "instanceDescriptor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_askDaemonForSnapshotOfDescriptor:options:completion:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  NTKCachedSnapshotForFace(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_4;
    v3[3] = &unk_1E6BCE3C8;
    v5 = *(id *)(a1 + 40);
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __57__NTKFaceSnapshotClient_snapshotFace_options_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_askXPCServiceForSnapshotOfDescriptor:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)snapshotLibrarySelectedFaceForDeviceUUID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v12;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "Snapshotting SelectedFace for device UUID:%@", buf, 0xCu);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__NTKFaceSnapshotClient_snapshotLibrarySelectedFaceForDeviceUUID_options_completion___block_invoke;
  v16[3] = &unk_1E6BD1840;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

void __85__NTKFaceSnapshotClient_snapshotLibrarySelectedFaceForDeviceUUID_options_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setupDaemonConnection");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotLibrarySelectedFaceForDeviceUUID:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)faceSnapshotChangedForKey:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "snapshot changed for key:%@", buf, 0xCu);
  }

  NTKSnapshotMappedImageCache();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_noteExternalChangeForKey:", v3);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NTKFaceSnapshotClient_faceSnapshotChangedForKey___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  v8 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__NTKFaceSnapshotClient_faceSnapshotChangedForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKFaceSnapshotChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_updateAllSnapshots
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NTKFaceSnapshotClient__updateAllSnapshots__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __44__NTKFaceSnapshotClient__updateAllSnapshots__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setupDaemonConnection");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAllSnapshots");

}

- (void)_handleCustomMonogramChangedNotification
{
  NSObject *v3;
  uint8_t v4[16];

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Update all snapshots due to custom monogram changed notification", v4, 2u);
  }

  -[NTKFaceSnapshotClient _updateAllSnapshots](self, "_updateAllSnapshots");
}

- (void)_handleSignificantLocationChangeNotification
{
  NSObject *v3;
  uint8_t v4[16];

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Update all snapshots due to significant location change notification", v4, 2u);
  }

  -[NTKFaceSnapshotClient _updateAllSnapshots](self, "_updateAllSnapshots");
}

- (void)_handleActiveDeviceChangedNotification
{
  NSObject *v3;
  uint8_t v4[16];

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Update all snapshots due to active device change notification", v4, 2u);
  }

  -[NTKFaceSnapshotClient _updateAllSnapshots](self, "_updateAllSnapshots");
}

- (void)_registerIfNeeded
{
  if (self->_registrationNeeded)
    -[NTKFaceSnapshotClient _register](self, "_register");
}

- (void)_handleConnectionInterrupted
{
  self->_registrationNeeded = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotFileQueue, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

void __47__NTKFaceSnapshotClient__setupDaemonConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "xpc connection interrupted. This is recoverable.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_4_0(&dword_1B72A3000, v0, v1, "Failed to snapshot %@ in timely manner", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Delayed XPC completion of %@ finally called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_34_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Snapshotting proxy had an error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_37_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "persist-less xpc connection interrupted. This is recoverable.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void __82__NTKFaceSnapshotClient__askXPCServiceForSnapshotOfDescriptor_options_completion___block_invoke_2_39_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "persist-less xpc connection invalidated. This is unrecoverable.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void __78__NTKFaceSnapshotClient__askDaemonForSnapshotOfDescriptor_options_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Delayed completion of %@ finally called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
