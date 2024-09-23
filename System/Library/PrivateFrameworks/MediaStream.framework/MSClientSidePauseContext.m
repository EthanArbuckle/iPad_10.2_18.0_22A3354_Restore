@implementation MSClientSidePauseContext

- (MSClientSidePauseContext)initWithServer:(id)a3
{
  id v5;
  MSClientSidePauseContext *v6;
  uint64_t v7;
  NSString *UUID;
  dispatch_queue_t v9;
  OS_dispatch_queue *timerQueue;
  MSTimerGate *v11;
  MSTimerGate *gate;
  NSObject *v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  uint64_t v17;
  MSClientSidePauseContext *v18;
  NSObject *v19;
  _QWORD v21[4];
  MSClientSidePauseContext *v22;
  _QWORD block[4];
  MSClientSidePauseContext *v24;
  objc_super v25;
  uint8_t buf[4];
  MSClientSidePauseContext *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MSClientSidePauseContext;
  v6 = -[MSClientSidePauseContext init](&v25, sel_init);
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v6;
      _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Pause context %p started.", buf, 0xCu);
    }
    objc_storeStrong((id *)&v6->_server, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSString *)v7;

    v9 = dispatch_queue_create("MSClientSidePauseContext timer queue", 0);
    timerQueue = v6->_timerQueue;
    v6->_timerQueue = (OS_dispatch_queue *)v9;

    v11 = (MSTimerGate *)objc_alloc_init(MEMORY[0x1E0D16C80]);
    gate = v6->_gate;
    v6->_gate = v11;

    v13 = v6->_timerQueue;
    dispatch_get_global_queue(-2, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v13, v14);

    v15 = dispatch_time(0, 5000000000);
    v16 = v6->_timerQueue;
    v17 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__MSClientSidePauseContext_initWithServer___block_invoke;
    block[3] = &unk_1E994DA10;
    v18 = v6;
    v24 = v18;
    dispatch_after(v15, v16, block);
    v19 = v6->_timerQueue;
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __43__MSClientSidePauseContext_initWithServer___block_invoke_2;
    v21[3] = &unk_1E994DA10;
    v22 = v18;
    dispatch_async(v19, v21);

  }
  return v6;
}

- (void)resume
{
  NSObject *timerQueue;
  _QWORD block[5];
  uint8_t buf[4];
  MSClientSidePauseContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Pause context %p ended.", buf, 0xCu);
  }
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MSClientSidePauseContext_resume__block_invoke;
  block[3] = &unk_1E994DA10;
  block[4] = self;
  dispatch_async(timerQueue, block);
}

- (void)timerQueueTimerFired
{
  void *v3;
  int v4;
  dispatch_time_t v5;
  NSObject *timerQueue;
  _QWORD block[5];

  -[MSClientSidePauseContext gate](self, "gate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enabled");

  if (v4)
  {
    -[MSClientSidePauseContext timerQueuePing](self, "timerQueuePing");
    v5 = dispatch_time(0, 5000000000);
    timerQueue = self->_timerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MSClientSidePauseContext_timerQueueTimerFired__block_invoke;
    block[3] = &unk_1E994DA10;
    block[4] = self;
    dispatch_after(v5, timerQueue, block);
  }
}

- (void)timerQueuePing
{
  void *v3;
  void *v4;
  int v5;
  MSClientSidePauseContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Pause context %p pinging server.", (uint8_t *)&v5, 0xCu);
  }
  -[MSClientSidePauseContext server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseForUUID:", self->_UUID);

}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_timerQueue, a3);
}

- (NSXPCConnection)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (MSTimerGate)gate
{
  return self->_gate;
}

- (void)setGate:(id)a3
{
  objc_storeStrong((id *)&self->_gate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gate, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

void __48__MSClientSidePauseContext_timerQueueTimerFired__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D826FD88]();
  objc_msgSend(*(id *)(a1 + 32), "timerQueueTimerFired");
  objc_autoreleasePoolPop(v2);
}

void __34__MSClientSidePauseContext_resume__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "disable");
  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unpauseForUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

void __43__MSClientSidePauseContext_initWithServer___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D826FD88]();
  objc_msgSend(*(id *)(a1 + 32), "timerQueueTimerFired");
  objc_autoreleasePoolPop(v2);
}

void __43__MSClientSidePauseContext_initWithServer___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D826FD88]();
  objc_msgSend(*(id *)(a1 + 32), "timerQueuePing");
  objc_autoreleasePoolPop(v2);
}

@end
