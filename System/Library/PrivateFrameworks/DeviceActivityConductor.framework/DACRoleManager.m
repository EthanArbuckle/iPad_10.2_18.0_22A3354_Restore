@implementation DACRoleManager

- (DACRoleManager)initWithDelegate:(id)a3 lastLeaderAt:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  DACRoleManager *v11;
  DACRoleManager *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *delegateQueue;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  uint64_t v19;
  DACDeviceRole *role;
  OS_dispatch_source *fallbackTimer;
  NSObject *v22;
  _QWORD block[4];
  DACRoleManager *v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)DACRoleManager;
  v11 = -[DACRoleManager init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create_with_target_V2("com.apple.DeviceActivityConductor.DACRoleManager.delegate", v13, v10);
    delegateQueue = v12->_delegateQueue;
    v12->_delegateQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.DeviceActivityConductor.DACRoleManager", v16);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v12->_lastLeaderAt, a4);
    +[DACDeviceRole unknownRole](DACDeviceRole, "unknownRole");
    v19 = objc_claimAutoreleasedReturnValue();
    role = v12->_role;
    v12->_role = (DACDeviceRole *)v19;

    fallbackTimer = v12->_fallbackTimer;
    v12->_fallbackTimer = 0;

    *(_WORD *)&v12->_shouldAttemptReconnect = 0;
    v12->_resetNotifyToken = -1;
    v22 = v12->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__DACRoleManager_initWithDelegate_lastLeaderAt_queue___block_invoke;
    block[3] = &unk_24ED13508;
    v25 = v12;
    dispatch_async(v22, block);

  }
  return v12;
}

void __54__DACRoleManager_initWithDelegate_lastLeaderAt_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  -[DACRoleManager _notifyDelegate](*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 56));
  else
    WeakRetained = 0;

}

- (void)_notifyDelegate
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v3 = *(id *)(a1 + 48);
    v4 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__DACRoleManager__notifyDelegate__block_invoke;
    block[3] = &unk_24ED13468;
    v8 = WeakRetained;
    v9 = a1;
    v10 = v3;
    v5 = v3;
    v6 = WeakRetained;
    dispatch_async(v4, block);

  }
}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_resetNotifyToken))
    notify_cancel(self->_resetNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)DACRoleManager;
  -[DACRoleManager dealloc](&v3, sel_dealloc);
}

- (void)requestSpeakerGroupLeaderRole
{
  void *v3;
  NSObject *queue;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__DACRoleManager_requestSpeakerGroupLeaderRole__block_invoke;
  v6[3] = &unk_24ED13280;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(queue, v6);

}

void __47__DACRoleManager_requestSpeakerGroupLeaderRole__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  _QWORD *v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (objc_storeStrong((id *)(v2 + 40), *(id *)(a1 + 40)), (v3 = *(_QWORD *)(a1 + 32)) == 0))
  {
    v7 = 0;
    goto LABEL_9;
  }
  if (!*(_BYTE *)(v3 + 9) && !*(_BYTE *)(v3 + 8))
  {
    v7 = *(void **)(v3 + 48);
LABEL_9:
    v8 = -[DACDeviceRole _initWithRoleFlags:]([DACDeviceRole alloc], "_initWithRoleFlags:", objc_msgSend(v7, "flags") & 0xFFFFFFFFFFFFFFFCLL | 1);
    -[DACRoleManager _roleChanged:](*(_QWORD *)(a1 + 32), v8);

    return;
  }
  objc_initWeak(&location, (id)v3);
  v4 = *(id **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__DACRoleManager_requestSpeakerGroupLeaderRole__block_invoke_2;
  v9[3] = &unk_24ED13530;
  objc_copyWeak(&v10, &location);
  if (v4)
  {
    v5 = v9;
    WeakRetained = objc_loadWeakRetained(v4 + 7);
    objc_msgSend(WeakRetained, "remoteObjectProxyWithErrorHandler:", v5);
    v4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "requestLeaderRole:", *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_roleChanged:(uint64_t)a1
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    v5 = *(id *)(a1 + 48);
    objc_storeStrong((id *)(a1 + 48), a2);
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {
      DACLogForCategory(5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134218498;
        v8 = a1;
        v9 = 2114;
        v10 = v4;
        v11 = 2114;
        v12 = v5;
        _os_log_impl(&dword_224FBF000, v6, OS_LOG_TYPE_DEFAULT, "%p role changing to %{public}@ from %{public}@", (uint8_t *)&v7, 0x20u);
      }

      -[DACRoleManager _notifyDelegate](a1);
    }

  }
}

void __47__DACRoleManager_requestSpeakerGroupLeaderRole__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    DACLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218242;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_224FBF000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACRoleManager remote proxy for leader request: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)roleChanged:(id)a3
{
  OS_dispatch_source *v4;
  NSObject *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  NSObject *fallbackTimer;
  int v9;
  DACRoleManager *v10;
  __int16 v11;
  OS_dispatch_source *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (OS_dispatch_source *)a3;
  if (self && self->_fallbackTimer)
  {
    DACLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_224FBF000, v5, OS_LOG_TYPE_DEFAULT, "%p will cancel fallback due to role %@ from daemon", (uint8_t *)&v9, 0x16u);
    }

    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v6 = self->_fallbackTimer;
    DACLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    fallbackTimer = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134218240;
        v10 = self;
        v11 = 2048;
        v12 = v6;
        _os_log_impl(&dword_224FBF000, fallbackTimer, OS_LOG_TYPE_DEFAULT, "%p removing fallback timer %p", (uint8_t *)&v9, 0x16u);
      }

      dispatch_source_cancel((dispatch_source_t)v6);
      fallbackTimer = self->_fallbackTimer;
      self->_fallbackTimer = 0;
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = self;
      _os_log_error_impl(&dword_224FBF000, fallbackTimer, OS_LOG_TYPE_ERROR, "%p no fallback timer to cancel", (uint8_t *)&v9, 0xCu);
    }

  }
  -[DACRoleManager _roleChanged:]((uint64_t)self, v4);

}

uint64_t __33__DACRoleManager__notifyDelegate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "roleManager:roleChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTimer, 0);
  objc_destroyWeak((id *)&self->_currentConnection);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_lastLeaderAt, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
