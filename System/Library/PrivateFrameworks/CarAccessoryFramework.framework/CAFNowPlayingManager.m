@implementation CAFNowPlayingManager

- (CAFNowPlayingManager)initWithObserver:(id)a3
{
  id v4;
  CAFNowPlayingManager *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *workQueue;
  uint64_t v10;
  id snapshotObserver;
  uint8_t v13[16];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAFNowPlayingManager;
  v5 = -[CAFNowPlayingManager init](&v14, sel_init);
  if (v5)
  {
    CAFNowPlayingLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_237717000, v6, OS_LOG_TYPE_DEFAULT, "Initializing now playing manager", v13, 2u);
    }

    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSDispatchQueueCreate();
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v8;

    v10 = MEMORY[0x23B81B894](v4);
    snapshotObserver = v5->_snapshotObserver;
    v5->_snapshotObserver = (id)v10;

    -[CAFNowPlayingManager _setupConnection](v5, "_setupConnection");
  }

  return v5;
}

- (void)_setupConnection
{
  OUTLINED_FUNCTION_3_1(&dword_237717000, a1, a3, "Failed to create now playing connection!", a5, a6, a7, a8, 0);
}

void __40__CAFNowPlayingManager__setupConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE0FA38], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CAFNowPlayingServiceSpecification interface](CAFNowPlayingServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v6);

  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__CAFNowPlayingManager__setupConnection__block_invoke_2;
  v13[3] = &unk_2508FE9E8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  objc_msgSend(v3, "setActivationHandler:", v13);
  v8 = v7;
  v9 = 3221225472;
  v10 = __40__CAFNowPlayingManager__setupConnection__block_invoke_3;
  v11 = &unk_2508FE9E8;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  objc_msgSend(v3, "setInterruptionHandler:", &v8);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_12, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);

}

void __40__CAFNowPlayingManager__setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_connectionActivated");
    WeakRetained = v2;
  }

}

void __40__CAFNowPlayingManager__setupConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_connectionInterrupted");
    WeakRetained = v2;
  }

}

void __40__CAFNowPlayingManager__setupConnection__block_invoke_4()
{
  NSObject *v0;
  uint8_t v1[16];

  CAFNowPlayingLogging();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_237717000, v0, OS_LOG_TYPE_DEFAULT, "Now playing connection invalidated", v1, 2u);
  }

}

- (void)_connectionActivated
{
  NSObject *v3;
  uint8_t v4[16];

  CAFNowPlayingLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_237717000, v3, OS_LOG_TYPE_DEFAULT, "Now playing connection activated", v4, 2u);
  }

  -[CAFNowPlayingManager _fetchSnapshot](self, "_fetchSnapshot");
}

- (void)_connectionInterrupted
{
  NSObject *v3;
  uint8_t v4[16];

  CAFNowPlayingLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_237717000, v3, OS_LOG_TYPE_DEFAULT, "Now playing connection interrupted", v4, 2u);
  }

  -[CAFNowPlayingManager _setupConnection](self, "_setupConnection");
}

- (void)_fetchSnapshot
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  CAFNowPlayingLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237717000, v3, OS_LOG_TYPE_DEFAULT, "Fetching latest now playing snapshot", buf, 2u);
  }

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__CAFNowPlayingManager__fetchSnapshot__block_invoke;
  v5[3] = &unk_2508FEA78;
  v5[4] = self;
  objc_msgSend(v4, "fetchNowPlayingSnapshotWithReply:", v5);

}

void __38__CAFNowPlayingManager__fetchSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  CAFGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_237717000, v7, OS_LOG_TYPE_DEFAULT, "Last snapshot update error: %@", buf, 0xCu);
    }

  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_237717000, v7, OS_LOG_TYPE_DEFAULT, "Received updated now playing snapshot %@", buf, 0xCu);
    }

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__CAFNowPlayingManager__fetchSnapshot__block_invoke_7;
    v9[3] = &unk_2508FD240;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
}

void __38__CAFNowPlayingManager__fetchSnapshot__block_invoke_7(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "snapshotObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "snapshotObserver");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

- (void)refreshNowPlayingSnapshot
{
  NSObject *v3;
  uint8_t v4[16];

  CAFNowPlayingLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_237717000, v3, OS_LOG_TYPE_DEFAULT, "Refreshing snapshot", v4, 2u);
  }

  -[CAFNowPlayingManager _fetchSnapshot](self, "_fetchSnapshot");
}

- (void)invalidate
{
  NSObject *v3;
  BSServiceConnection *connection;
  uint8_t v5[16];

  CAFNowPlayingLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_237717000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating now playing", v5, 2u);
  }

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (CAFNowPlayingSnapshot)lastSnapshot
{
  return self->_lastSnapshot;
}

- (id)snapshotObserver
{
  return self->_snapshotObserver;
}

- (void)setSnapshotObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_snapshotObserver, 0);
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
}

@end
