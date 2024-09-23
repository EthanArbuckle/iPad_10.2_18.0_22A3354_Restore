@implementation GCControllerMBDelegate

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "[GCControllerMBDelegate dealloc]", buf, 2u);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)GCControllerMBDelegate;
  -[GCControllerMBDelegate dealloc](&v4, sel_dealloc);
}

- (void)fireCompletionHandler
{
  void *v3;
  id completionHandler;
  _QWORD block[4];
  id v6;

  v3 = (void *)MEMORY[0x2199DEBB0](self->_completionHandler, a2);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__GCControllerMBDelegate_fireCompletionHandler__block_invoke;
    block[3] = &unk_24D2B4AA8;
    v6 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __47__GCControllerMBDelegate_fireCompletionHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)scanTimeout:(id)a3
{
  NSTimer *timer;

  -[GCControllerMBDelegate stopScan](self, "stopScan", a3);
  timer = self->_timer;
  self->_timer = 0;

}

- (void)startScan
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__GCControllerMBDelegate_startScan__block_invoke;
  block[3] = &unk_24D2B2B20;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __35__GCControllerMBDelegate_startScan__block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9[2])(uint64_t, int, int, void *);
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "BT session attach", (uint8_t *)v9, 2u);
    }

  }
  v9[0] = GCControllerMBDelegateBTSessionEventCallback;
  v2 = BTSessionAttachWithQueue();
  if (v2)
  {
    v3 = v2;
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v11 = v3;
        _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "failed to attach BTSession (error %x)", buf, 8u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "fireCompletionHandler");
  }
  else
  {
    +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](&off_254DF2B68, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_scanTimeout_, 0, 0, 10.0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

  }
}

- (void)stopScan
{
  uint64_t v3;
  dispatch_time_t v4;
  dispatch_time_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  void *discoveryAgent;

  v3 = MEMORY[0x24BDAC760];
  if (self->_discoveryAgent)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "BT discovery stop", buf, 2u);
      }

    }
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x2020000000;
    discoveryAgent = self->_discoveryAgent;
    self->_discoveryAgent = 0;
    BTDiscoveryAgentStopScan();
    v4 = dispatch_time(0, 3000000000);
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __34__GCControllerMBDelegate_stopScan__block_invoke;
    block[3] = &unk_24D2B4C40;
    block[4] = buf;
    dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
    _Block_object_dispose(buf, 8);
  }
  if (self->_pairingAgent)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "BT pairing stop", buf, 2u);
      }

    }
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x2020000000;
    discoveryAgent = self->_pairingAgent;
    self->_pairingAgent = 0;
    BTPairingAgentStop();
    v5 = dispatch_time(0, 3000000000);
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __34__GCControllerMBDelegate_stopScan__block_invoke_59;
    v11[3] = &unk_24D2B4C40;
    v11[4] = buf;
    dispatch_after(v5, MEMORY[0x24BDAC9B8], v11);
    _Block_object_dispose(buf, 8);
  }
  if (self->_session)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "BT session detach", buf, 2u);
      }

    }
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x2020000000;
    discoveryAgent = self->_session;
    self->_session = 0;
    v6 = dispatch_time(0, 4000000000);
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __34__GCControllerMBDelegate_stopScan__block_invoke_60;
    v10[3] = &unk_24D2B4C40;
    v10[4] = buf;
    dispatch_after(v6, MEMORY[0x24BDAC9B8], v10);
    _Block_object_dispose(buf, 8);
  }
  -[GCControllerMBDelegate fireCompletionHandler](self, "fireCompletionHandler");
}

uint64_t __34__GCControllerMBDelegate_stopScan__block_invoke()
{
  NSObject *v1;
  uint8_t v2[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_215181000, v1, OS_LOG_TYPE_DEFAULT, "BT discovery destroy", v2, 2u);
    }

  }
  return BTDiscoveryAgentDestroy();
}

uint64_t __34__GCControllerMBDelegate_stopScan__block_invoke_59()
{
  NSObject *v1;
  uint8_t v2[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_215181000, v1, OS_LOG_TYPE_DEFAULT, "BT pairing destroy", v2, 2u);
    }

  }
  return BTPairingAgentDestroy();
}

void __34__GCControllerMBDelegate_stopScan__block_invoke_60()
{
  NSObject *v0;
  uint8_t v1[16];

  BTSessionDetachWithQueue();
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_215181000, v0, OS_LOG_TYPE_DEFAULT, "BT session detached", v1, 2u);
    }

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
