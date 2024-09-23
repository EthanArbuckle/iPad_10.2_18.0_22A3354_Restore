@implementation CAMNebulaDaemon

- (CAMNebulaDaemon)init
{
  CAMNebulaDaemon *v2;
  NSObject *v3;
  CAMNebulaKeepAliveController *v4;
  CAMNebulaKeepAliveController *keepAliveController;
  CAMPersistenceController *v6;
  CAMPersistenceController *persistenceController;
  CAMTimelapseBackendController *v8;
  CAMTimelapseBackendController *timelapseBackendController;
  CAMNebulaIrisBackendController *v10;
  CAMNebulaIrisBackendController *irisBackendController;
  uint64_t v12;
  NSMutableArray *connections;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  NSXPCListener *listener;
  uint8_t v19[16];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CAMNebulaDaemon;
  v2 = -[CAMNebulaDaemon init](&v20, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Timelapse daemon started running", v19, 2u);
    }

    v4 = objc_alloc_init(CAMNebulaKeepAliveController);
    keepAliveController = v2->__keepAliveController;
    v2->__keepAliveController = v4;

    v6 = -[CAMPersistenceController initWithLocationController:burstController:protectionController:powerController:irisVideoController:]([CAMPersistenceController alloc], "initWithLocationController:burstController:protectionController:powerController:irisVideoController:", 0, 0, 0, 0, 0);
    persistenceController = v2->__persistenceController;
    v2->__persistenceController = v6;

    -[CAMPersistenceController setResultDelegate:](v2->__persistenceController, "setResultDelegate:", v2);
    v8 = -[CAMTimelapseBackendController initWithPersistenceController:keepAliveController:]([CAMTimelapseBackendController alloc], "initWithPersistenceController:keepAliveController:", v2->__persistenceController, v2->__keepAliveController);
    timelapseBackendController = v2->__timelapseBackendController;
    v2->__timelapseBackendController = v8;

    v10 = -[CAMNebulaIrisBackendController initWithPersistenceController:keepAliveController:]([CAMNebulaIrisBackendController alloc], "initWithPersistenceController:keepAliveController:", v2->__persistenceController, v2->__keepAliveController);
    irisBackendController = v2->__irisBackendController;
    v2->__irisBackendController = v10;

    -[CAMNebulaKeepAliveController removeKeepAliveFileIfNotKeptForAnyIdentifiers](v2->__keepAliveController, "removeKeepAliveFileIfNotKeptForAnyIdentifiers");
    objc_msgSend(MEMORY[0x1E0CB3B58], "enableTransactions");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    connections = v2->__connections;
    v2->__connections = (NSMutableArray *)v12;

    v14 = dispatch_queue_create("com.apple.assetsd.nebulad.daemon", 0);
    queue = v2->__queue;
    v2->__queue = (OS_dispatch_queue *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.assetsd.nebulad"));
    listener = v2->__listener;
    v2->__listener = (NSXPCListener *)v16;

    -[NSXPCListener setDelegate:](v2->__listener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->__listener, "_setQueue:", v2->__queue);
    -[NSXPCListener resume](v2->__listener, "resume");
  }
  return v2;
}

- (void)performPendingWorkAfterDelay:(double)a3
{
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = a3;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Timelapse daemon will check for pending work after %.2f seconds", buf, 0xCu);
  }

  v6 = (void *)os_transaction_create();
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__CAMNebulaDaemon_performPendingWorkAfterDelay___block_invoke;
  v9[3] = &unk_1EA328A40;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_after(v7, MEMORY[0x1E0C80D38], v9);

}

void __48__CAMNebulaDaemon_performPendingWorkAfterDelay___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "Timelapse daemon checking for pending work", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_timelapseBackendController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePendingWorkFromDiskForceEndLastSession:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_irisBackendController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performIrisCrashRecoveryForceFileSystemCheck:", 0);

}

- (id)allowedProtocolForClientAccess:(id)a3
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("camera")) & 1) != 0)
  {
    v4 = (id *)&protocolRef_CAMNebulaDaemonProtocol;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqual:", CFSTR("photos")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = (id *)&protocolRef_CAMNebulaDaemonProtocolLimited;
  }
  v5 = *v4;
LABEL_7:

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  __CFString *v7;
  int v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  int *v18;
  char *v19;
  __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  Protocol *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  CAMNebulaDaemonConnectionManager *v28;
  CAMNebulaDaemonConnectionManager *v29;
  BOOL v30;
  _QWORD block[4];
  CAMNebulaDaemonConnectionManager *v33;
  CAMNebulaDaemon *v34;
  CFStringRef v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[4];
  id v39;
  __int16 v40;
  char *v41;
  uint8_t buf[32];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.assetsd.nebulad.access"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (__CFString *)v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 0;
      v9 = 1;
      goto LABEL_10;
    }
    v10 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("com.apple.private.assetsd.nebulad.access");
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: value for entitlement %{public}@ is invalid", buf, 0x16u);
    }

  }
  v11 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = CFSTR("com.apple.private.assetsd.nebulad.access");
    _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ has no valid entitlement for %{public}@. Will fallback on bundle identifier", buf, 0x16u);
  }

  v9 = 0;
  v7 = 0;
  v8 = 1;
LABEL_10:
  v36 = 0u;
  v37 = 0u;
  if (v5)
    objc_msgSend(v5, "auditToken");
  v35 = 0;
  *(_OWORD *)buf = v36;
  *(_OWORD *)&buf[16] = v37;
  if (!CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    v12 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ has no bundle identifier. Will fallback on process ID", buf, 0xCu);
    }

    v13 = objc_msgSend(v5, "processIdentifier");
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    memset(buf, 0, sizeof(buf));
    if (proc_name(v13, buf, 0x100u))
    {
      v35 = CFStringCreateWithCString(0, (const char *)buf, 0x8000100u);
      if (v35)
        goto LABEL_23;
      v14 = os_log_create("com.apple.camera", "Nebula");
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)v38 = 0;
      v15 = "Can't decypher process name";
      v16 = v14;
      v17 = 2;
    }
    else
    {
      v14 = os_log_create("com.apple.camera", "Nebula");
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        goto LABEL_23;
      }
      v18 = __error();
      v19 = strerror(*v18);
      *(_DWORD *)v38 = 138543618;
      v39 = v5;
      v40 = 2080;
      v41 = v19;
      v15 = "Can't get process name for %{public}@: %s";
      v16 = v14;
      v17 = 22;
    }
    _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, v15, v38, v17);
    goto LABEL_22;
  }
LABEL_23:
  v20 = (__CFString *)v35;
  if (!v35)
  {
    v20 = (__CFString *)CFRetain(CFSTR("anonymous"));
    v35 = v20;
    if (v8)
      goto LABEL_25;
LABEL_31:
    if (!v9)
      goto LABEL_43;
    goto LABEL_36;
  }
  if (!v8)
    goto LABEL_31;
LABEL_25:
  if ((-[__CFString isEqual:](v20, "isEqual:", CFSTR("com.apple.camera")) & 1) != 0
    || -[__CFString isEqual:](v20, "isEqual:", CFSTR("com.apple.MobileSMS")))
  {
    v21 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = CFSTR("camera");
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v20;
      _os_log_impl(&dword_1DB760000, v21, OS_LOG_TYPE_DEFAULT, "Will use default camera access '%{public}@' for %{public}@", buf, 0x16u);
    }

    v7 = CFSTR("camera");
  }
  else
  {
    v22 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("com.apple.private.assetsd.nebulad.access");
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v20;
      _os_log_impl(&dword_1DB760000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ has no valid entitlement for %{public}@ and bundle id %{public}@ not accepted", buf, 0x20u);
    }

    v7 = 0;
    if ((v9 & 1) == 0)
      goto LABEL_43;
  }
LABEL_36:
  -[CAMNebulaDaemon allowedProtocolForClientAccess:](self, "allowedProtocolForClientAccess:", v7);
  v23 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v24 = os_log_create("com.apple.camera", "Nebula");
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v25)
    {
      NSStringFromProtocol(v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v26;
      LOWORD(v43) = 2114;
      *(_QWORD *)((char *)&v43 + 2) = v7;
      _os_log_impl(&dword_1DB760000, v24, OS_LOG_TYPE_DEFAULT, "Accepting a new connection from %{public}@ (bundle identifier: %{public}@). Allowed protocol is %{public}@ (%{public}@)", buf, 0x2Au);

    }
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@[%@]"), v20, v7);
    v28 = -[CAMNebulaDaemonConnectionManager initWithConnection:name:bundleIdentifier:queue:clientAccess:allowedProtocol:]([CAMNebulaDaemonConnectionManager alloc], "initWithConnection:name:bundleIdentifier:queue:clientAccess:allowedProtocol:", v5, v27, v20, self->__queue, v7, v23);
    -[CAMNebulaDaemonConnectionManager setDelegate:](v28, "setDelegate:", self);
    -[CAMNebulaDaemonConnectionManager addTarget:forProtocol:](v28, "addTarget:forProtocol:", self->__timelapseBackendController, &unk_1F036EC58);
    -[CAMNebulaDaemonConnectionManager addTarget:forProtocol:](v28, "addTarget:forProtocol:", self->__irisBackendController, &unk_1F036ED50);
    -[NSMutableArray addObject:](self->__connections, "addObject:", v28);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__CAMNebulaDaemon_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_1EA328A40;
    v33 = v28;
    v34 = self;
    v29 = v28;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v30 = 1;
    goto LABEL_46;
  }
  if (v25)
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v20;
    _os_log_impl(&dword_1DB760000, v24, OS_LOG_TYPE_DEFAULT, "Unknown access type '%{public}@' from %{public}@ (%{public}@)", buf, 0x20u);
  }

LABEL_43:
  v23 = (Protocol *)os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    -[CAMNebulaDaemon listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v23);
  v30 = 0;
LABEL_46:

  return v30;
}

void __54__CAMNebulaDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "clientAccess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("camera"));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_timelapseBackendController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleClientConnection:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_irisBackendController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleClientConnection:", *(_QWORD *)(a1 + 32));

  }
}

- (void)daemonConnectionManagerHasBeenDisconnected:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  CAMNebulaDaemon *v11;

  v4 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __62__CAMNebulaDaemon_daemonConnectionManagerHasBeenDisconnected___block_invoke;
  v9 = &unk_1EA328A40;
  v10 = v4;
  v11 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], &v6);
  -[NSMutableArray removeObject:](self->__connections, "removeObject:", v5, v6, v7, v8, v9);

}

void __62__CAMNebulaDaemon_daemonConnectionManagerHasBeenDisconnected___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "clientAccess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("camera"));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_timelapseBackendController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleClientDisconnection");
    objc_msgSend(*(id *)(a1 + 40), "_irisBackendController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleClientDisconnection:", *(_QWORD *)(a1 + 32));

  }
}

- (void)persistenceController:(id)a3 didGenerateVideoLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  if (objc_msgSend(v10, "type") == 1)
    -[CAMNebulaDaemon _timelapseBackendController](self, "_timelapseBackendController");
  else
    -[CAMNebulaDaemon _irisBackendController](self, "_irisBackendController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "persistenceController:didGenerateVideoLocalPersistenceResult:forCaptureResult:fromRequest:", v13, v12, v11, v10);

}

- (CAMTimelapseBackendController)_timelapseBackendController
{
  return self->__timelapseBackendController;
}

- (CAMNebulaIrisBackendController)_irisBackendController
{
  return self->__irisBackendController;
}

- (CAMPersistenceController)_persistenceController
{
  return self->__persistenceController;
}

- (CAMNebulaKeepAliveController)_keepAliveController
{
  return self->__keepAliveController;
}

- (NSXPCListener)_listener
{
  return self->__listener;
}

- (OS_dispatch_queue)_queue
{
  return self->__queue;
}

- (NSMutableArray)_connections
{
  return self->__connections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__connections, 0);
  objc_storeStrong((id *)&self->__queue, 0);
  objc_storeStrong((id *)&self->__listener, 0);
  objc_storeStrong((id *)&self->__keepAliveController, 0);
  objc_storeStrong((id *)&self->__persistenceController, 0);
  objc_storeStrong((id *)&self->__irisBackendController, 0);
  objc_storeStrong((id *)&self->__timelapseBackendController, 0);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Refusing connection from %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
