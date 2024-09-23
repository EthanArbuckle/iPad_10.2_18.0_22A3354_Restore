@implementation CAMNebulaDaemonProxyManager

- (CAMNebulaDaemonProxyManager)init
{
  CAMNebulaDaemonProxyManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMNebulaDaemonProxyManager;
  v2 = -[CAMNebulaDaemonProxyManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.camera.nebulad.proxy", 0);
    queue = v2->__queue;
    v2->__queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)setIrisClientDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_irisClientDelegate, a3);
}

- (void)setTimelapseClientDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_timelapseClientDelegate, a3);
}

- (void)performCrashRecoveryIfNeededForceEndLastTimelapseSession:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (+[CAMTimelapseDiskUtilities hasPendingWork](CAMTimelapseDiskUtilities, "hasPendingWork"))
    -[CAMNebulaDaemonProxyManager updatePendingWorkFromDiskForceEndLastSession:](self, "updatePendingWorkFromDiskForceEndLastSession:", v3);
  if (+[CAMIrisDiskUtilities hasPendingWork](CAMIrisDiskUtilities, "hasPendingWork"))
    -[CAMNebulaDaemonProxyManager performIrisCrashRecovery](self, "performIrisCrashRecovery");
}

- (void)ensureConnectionToDaemon
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->__queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CAMNebulaDaemonProxyManager_ensureConnectionToDaemon__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__CAMNebulaDaemonProxyManager_ensureConnectionToDaemon__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ensureConnectionToDaemon");
}

- (void)closeConnectionToDaemon
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->__queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CAMNebulaDaemonProxyManager_closeConnectionToDaemon__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__CAMNebulaDaemonProxyManager_closeConnectionToDaemon__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeConnectionToDaemon");
}

- (void)_ensureConnectionToDaemon
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->__queue);
  connection = self->__connection;
  ++self->__connectionCount;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.assetsd.nebulad"), 4096);
    v5 = self->__connection;
    self->__connection = v4;

    objc_msgSend((id)objc_opt_class(), "_daemonProtocolInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->__connection, "setRemoteObjectInterface:", v6);
    objc_msgSend((id)objc_opt_class(), "_clientProtocolInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->__connection, "setExportedInterface:", v7);
    -[NSXPCConnection setExportedObject:](self->__connection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __56__CAMNebulaDaemonProxyManager__ensureConnectionToDaemon__block_invoke;
    v12 = &unk_1EA329490;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInterruptionHandler:](self->__connection, "setInterruptionHandler:", &v9);
    -[NSXPCConnection setInvalidationHandler:](self->__connection, "setInvalidationHandler:", &__block_literal_global_33, v9, v10, v11, v12);
    -[NSXPCConnection _setQueue:](self->__connection, "_setQueue:", self->__queue);
    -[NSXPCConnection resume](self->__connection, "resume");
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = CFSTR("com.apple.assetsd.nebulad");
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Opening new connection to %{public}@", buf, 0xCu);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __56__CAMNebulaDaemonProxyManager__ensureConnectionToDaemon__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = CFSTR("com.apple.assetsd.nebulad");
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "Connection with %{public}@ was interrupted", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pingAfterInterruption");

}

void __56__CAMNebulaDaemonProxyManager__ensureConnectionToDaemon__block_invoke_3()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138543362;
    v2 = CFSTR("com.apple.assetsd.nebulad");
    _os_log_impl(&dword_1DB760000, v0, OS_LOG_TYPE_DEFAULT, "Connection with %{public}@ was invalidated. System is likely trying to shut down", (uint8_t *)&v1, 0xCu);
  }

}

- (void)_closeConnectionToDaemon
{
  int64_t connectionCount;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSObject *v7;
  NSXPCConnection *v8;
  __int16 v9;
  _QWORD v10[4];
  NSXPCConnection *v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->__queue);
  connectionCount = self->__connectionCount;
  self->__connectionCount = connectionCount - 1;
  if (connectionCount <= 1)
  {
    connection = self->__connection;
    if (connection)
    {
      v5 = connection;
      v6 = self->__connection;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __55__CAMNebulaDaemonProxyManager__closeConnectionToDaemon__block_invoke;
      v10[3] = &unk_1EA328868;
      v11 = v5;
      v7 = v5;
      -[NSXPCConnection addBarrierBlock:](v6, "addBarrierBlock:", v10);
      v8 = self->__connection;
      self->__connection = 0;

    }
    else
    {
      v7 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 0;
        _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Trying to close a nil connection", (uint8_t *)&v9, 2u);
      }
    }

  }
}

uint64_t __55__CAMNebulaDaemonProxyManager__closeConnectionToDaemon__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = CFSTR("com.apple.assetsd.nebulad");
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "Closing connection to %{public}@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

+ (id)_daemonProtocolInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F036EDB0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_enqueueIrisVideoJobs_, 0, 0);

  return v2;
}

+ (id)_clientProtocolInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0350A90);
}

- (void)_getProxyForExecutingBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->__queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke;
  v7[3] = &unk_1EA328F80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnectionToDaemon");
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__13;
  v14 = __Block_byref_object_dispose__13;
  v15 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke_75;
  v9[3] = &unk_1EA32B1A0;
  v9[4] = &v10;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v4, v11[5]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 24);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke_77;
  v8[3] = &unk_1EA328868;
  v8[4] = v6;
  dispatch_async(v7, v8);

  _Block_object_dispose(&v10, 8);
}

void __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Error getting proxy object %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

uint64_t __58__CAMNebulaDaemonProxyManager__getProxyForExecutingBlock___block_invoke_77(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeConnectionToDaemon");
}

- (void)pingAfterInterruption
{
  -[CAMNebulaDaemonProxyManager _getProxyForExecutingBlock:](self, "_getProxyForExecutingBlock:", &__block_literal_global_79);
}

uint64_t __52__CAMNebulaDaemonProxyManager_pingAfterInterruption__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pingAfterInterruption");
}

- (void)startTimelapseWithUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__CAMNebulaDaemonProxyManager_startTimelapseWithUUID___block_invoke;
  v6[3] = &unk_1EA32CD20;
  v7 = v4;
  v5 = v4;
  -[CAMNebulaDaemonProxyManager _getProxyForExecutingBlock:](self, "_getProxyForExecutingBlock:", v6);

}

uint64_t __54__CAMNebulaDaemonProxyManager_startTimelapseWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startTimelapseWithUUID:", *(_QWORD *)(a1 + 32));
}

- (void)resumeTimelapseWithUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__CAMNebulaDaemonProxyManager_resumeTimelapseWithUUID___block_invoke;
  v6[3] = &unk_1EA32CD20;
  v7 = v4;
  v5 = v4;
  -[CAMNebulaDaemonProxyManager _getProxyForExecutingBlock:](self, "_getProxyForExecutingBlock:", v6);

}

uint64_t __55__CAMNebulaDaemonProxyManager_resumeTimelapseWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resumeTimelapseWithUUID:", *(_QWORD *)(a1 + 32));
}

- (void)updateTimelapseWithUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__CAMNebulaDaemonProxyManager_updateTimelapseWithUUID___block_invoke;
  v6[3] = &unk_1EA32CD20;
  v7 = v4;
  v5 = v4;
  -[CAMNebulaDaemonProxyManager _getProxyForExecutingBlock:](self, "_getProxyForExecutingBlock:", v6);

}

uint64_t __55__CAMNebulaDaemonProxyManager_updateTimelapseWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTimelapseWithUUID:", *(_QWORD *)(a1 + 32));
}

- (void)finishCaptureForTimelapseWithUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__CAMNebulaDaemonProxyManager_finishCaptureForTimelapseWithUUID___block_invoke;
  v6[3] = &unk_1EA32CD20;
  v7 = v4;
  v5 = v4;
  -[CAMNebulaDaemonProxyManager _getProxyForExecutingBlock:](self, "_getProxyForExecutingBlock:", v6);

}

uint64_t __65__CAMNebulaDaemonProxyManager_finishCaptureForTimelapseWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finishCaptureForTimelapseWithUUID:", *(_QWORD *)(a1 + 32));
}

- (void)stopTimelapseWithUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__CAMNebulaDaemonProxyManager_stopTimelapseWithUUID___block_invoke;
  v6[3] = &unk_1EA32CD20;
  v7 = v4;
  v5 = v4;
  -[CAMNebulaDaemonProxyManager _getProxyForExecutingBlock:](self, "_getProxyForExecutingBlock:", v6);

}

uint64_t __53__CAMNebulaDaemonProxyManager_stopTimelapseWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopTimelapseWithUUID:", *(_QWORD *)(a1 + 32));
}

- (void)updatePendingWorkFromDiskForceEndLastSession:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__CAMNebulaDaemonProxyManager_updatePendingWorkFromDiskForceEndLastSession___block_invoke;
  v3[3] = &__block_descriptor_33_e47_v24__0___CAMNebulaDaemonProtocol__8__NSError_16l;
  v4 = a3;
  -[CAMNebulaDaemonProxyManager _getProxyForExecutingBlock:](self, "_getProxyForExecutingBlock:", v3);
}

uint64_t __76__CAMNebulaDaemonProxyManager_updatePendingWorkFromDiskForceEndLastSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updatePendingWorkFromDiskForceEndLastSession:", *(unsigned __int8 *)(a1 + 32));
}

- (void)forceStopTimelapseCaptureWithReasons:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__CAMNebulaDaemonProxyManager_forceStopTimelapseCaptureWithReasons___block_invoke;
  v3[3] = &unk_1EA328B18;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __68__CAMNebulaDaemonProxyManager_forceStopTimelapseCaptureWithReasons___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "forceStopTimelapseCaptureWithReasons:", *(_QWORD *)(a1 + 40));

}

- (void)enqueueIrisVideoJobs:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__CAMNebulaDaemonProxyManager_enqueueIrisVideoJobs___block_invoke;
  v6[3] = &unk_1EA32CD20;
  v7 = v4;
  v5 = v4;
  -[CAMNebulaDaemonProxyManager _getProxyForExecutingBlock:](self, "_getProxyForExecutingBlock:", v6);

}

uint64_t __52__CAMNebulaDaemonProxyManager_enqueueIrisVideoJobs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enqueueIrisVideoJobs:", *(_QWORD *)(a1 + 32));
}

- (void)performIrisCrashRecovery
{
  -[CAMNebulaDaemonProxyManager _getProxyForExecutingBlock:](self, "_getProxyForExecutingBlock:", &__block_literal_global_81);
}

uint64_t __55__CAMNebulaDaemonProxyManager_performIrisCrashRecovery__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performIrisCrashRecovery");
}

- (void)nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__CAMNebulaDaemonProxyManager_nebulaDaemonDidCompleteLocalVideoPersistenceWithResult___block_invoke;
  v6[3] = &unk_1EA328A40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __86__CAMNebulaDaemonProxyManager_nebulaDaemonDidCompleteLocalVideoPersistenceWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:", *(_QWORD *)(a1 + 40));

}

- (CAMNebulaDaemonTimelapseClientProtocol)timelapseClientDelegate
{
  return (CAMNebulaDaemonTimelapseClientProtocol *)objc_loadWeakRetained((id *)&self->_timelapseClientDelegate);
}

- (CAMNebulaDaemonIrisClientProtocol)irisClientDelegate
{
  return (CAMNebulaDaemonIrisClientProtocol *)objc_loadWeakRetained((id *)&self->_irisClientDelegate);
}

- (OS_dispatch_queue)_queue
{
  return self->__queue;
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (int64_t)_connectionCount
{
  return self->__connectionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__connection, 0);
  objc_storeStrong((id *)&self->__queue, 0);
  objc_destroyWeak((id *)&self->_irisClientDelegate);
  objc_destroyWeak((id *)&self->_timelapseClientDelegate);
}

@end
