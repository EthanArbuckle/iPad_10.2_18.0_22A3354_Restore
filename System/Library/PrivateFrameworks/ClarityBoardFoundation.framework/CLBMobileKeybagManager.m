@implementation CLBMobileKeybagManager

+ (CLBMobileKeybagManager)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1)
    dispatch_once(sharedInstance_onceToken, &__block_literal_global);
  return (CLBMobileKeybagManager *)(id)sharedInstance__keybagManager;
}

void __40__CLBMobileKeybagManager_sharedInstance__block_invoke()
{
  CLBMobileKeybagManager *v0;
  void *v1;

  v0 = objc_alloc_init(CLBMobileKeybagManager);
  v1 = (void *)sharedInstance__keybagManager;
  sharedInstance__keybagManager = (uint64_t)v0;

}

- (CLBMobileKeybagManager)init
{
  CLBMobileKeybagManager *v2;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  uint64_t v5;
  OS_dispatch_queue *callOutQueue;
  uint64_t v7;
  NSMutableDictionary *stateChangedCallbackBlocks;
  uint64_t v9;
  NSMutableDictionary *firstUnlockCallbackBlocks;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[4];
  CLBMobileKeybagManager *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CLBMobileKeybagManager;
  v2 = -[CLBMobileKeybagManager init](&v22, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    v5 = BSDispatchQueueCreateSerial();
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    stateChangedCallbackBlocks = v2->_stateChangedCallbackBlocks;
    v2->_stateChangedCallbackBlocks = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    firstUnlockCallbackBlocks = v2->_firstUnlockCallbackBlocks;
    v2->_firstUnlockCallbackBlocks = (NSMutableDictionary *)v9;

    objc_initWeak(&location, v2);
    v11 = MEMORY[0x24BDAC760];
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __30__CLBMobileKeybagManager_init__block_invoke;
    v19 = &unk_2509B0800;
    objc_copyWeak(&v20, &location);
    v2->_mkbEvent = (_MKBEvent *)MKBEventsRegister();
    v12 = v2->_queue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __30__CLBMobileKeybagManager_init__block_invoke_2;
    block[3] = &unk_2509B0828;
    v15 = v2;
    dispatch_sync(v12, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__CLBMobileKeybagManager_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v3;

  if (a2)
  {
    if (a2 == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_handleKeybagStatusChanged");

    }
  }
  else
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v3, "_handleFirstUnlock");

  }
}

uint64_t __30__CLBMobileKeybagManager_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateLockedState");
}

- (void)dealloc
{
  objc_super v3;

  MKBEventsUnregister();
  v3.receiver = self;
  v3.super_class = (Class)CLBMobileKeybagManager;
  -[CLBMobileKeybagManager dealloc](&v3, sel_dealloc);
}

- (BOOL)isLocked
{
  int64_t v2;

  v2 = -[CLBMobileKeybagManager currentState](self, "currentState");
  return v2 != 3 && v2 != 0;
}

- (int64_t)currentState
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__CLBMobileKeybagManager_currentState__block_invoke;
  v5[3] = &unk_2509B0850;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__CLBMobileKeybagManager_currentState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_lockStateFromDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)lock
{
  if (!-[CLBMobileKeybagManager currentState](self, "currentState"))
    MKBLockDevice();
}

- (double)backOffTime
{
  NSObject *queue;
  double v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__CLBMobileKeybagManager_backOffTime__block_invoke;
  v6[3] = &unk_2509B0850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  objc_msgSend((id)v8[5], "doubleValue");
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__CLBMobileKeybagManager_backOffTime__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *MEMORY[0x24BE67210]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)failedAttemptCount
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__CLBMobileKeybagManager_failedAttemptCount__block_invoke;
  v5[3] = &unk_2509B0850;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = objc_msgSend((id)v7[5], "unsignedIntegerValue");
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__CLBMobileKeybagManager_failedAttemptCount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *MEMORY[0x24BE67220]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasUnlockedSinceBoot
{
  return (int)MKBDeviceUnlockedSinceBoot() > 0;
}

- (BOOL)unlockWithPasscode:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  CLBMobileKeybagManager *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__CLBMobileKeybagManager_unlockWithPasscode_error___block_invoke;
  v11[3] = &unk_2509B0878;
  v8 = v6;
  v14 = &v16;
  v15 = &v20;
  v12 = v8;
  v13 = self;
  dispatch_sync(queue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v9 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v9;
}

uint64_t __51__CLBMobileKeybagManager_unlockWithPasscode_error___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
  v2 = MKBUnlockDevice();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.clarityboard.mkb"), v2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return objc_msgSend(*(id *)(a1 + 40), "_queue_updateLockedState");
}

- (id)registerLockStateChangedBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CLBMobileKeybagManager_registerLockStateChangedBlock___block_invoke;
  block[3] = &unk_2509B08A0;
  block[4] = self;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  dispatch_sync(queue, block);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __56__CLBMobileKeybagManager_registerLockStateChangedBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  v2 = _Block_copy(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (void)unregisterLockStateChangedBlockWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__CLBMobileKeybagManager_unregisterLockStateChangedBlockWithIdentifier___block_invoke;
  block[3] = &unk_2509B08C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __72__CLBMobileKeybagManager_unregisterLockStateChangedBlockWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (id)registerFirstUnlockBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__CLBMobileKeybagManager_registerFirstUnlockBlock___block_invoke;
  block[3] = &unk_2509B08A0;
  block[4] = self;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  dispatch_sync(queue, block);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __51__CLBMobileKeybagManager_registerFirstUnlockBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  v2 = _Block_copy(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (void)unregisterFirstUnlockBlockWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__CLBMobileKeybagManager_unregisterFirstUnlockBlockWithIdentifier___block_invoke;
  block[3] = &unk_2509B08C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __67__CLBMobileKeybagManager_unregisterFirstUnlockBlockWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (void)_handleKeybagStatusChanged
{
  NSObject *v3;
  NSObject *queue;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE16DF8], "commonLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237D8D000, v3, OS_LOG_TYPE_DEFAULT, "Handle keybag status changed", buf, 2u);
  }

  BSDispatchQueueAssert();
  *(_QWORD *)buf = 0;
  v15 = buf;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CLBMobileKeybagManager__handleKeybagStatusChanged__block_invoke;
  block[3] = &unk_2509B0850;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(queue, block);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = *((id *)v15 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
    }
    while (v6);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __52__CLBMobileKeybagManager__handleKeybagStatusChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateLockedState");
}

- (void)_handleFirstUnlock
{
  NSObject *v3;
  NSObject *queue;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE16DF8], "commonLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237D8D000, v3, OS_LOG_TYPE_DEFAULT, "Handle first unlock", buf, 2u);
  }

  BSDispatchQueueAssert();
  *(_QWORD *)buf = 0;
  v15 = buf;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CLBMobileKeybagManager__handleFirstUnlock__block_invoke;
  block[3] = &unk_2509B0850;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(queue, block);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = *((id *)v15 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
    }
    while (v6);
  }

  _Block_object_dispose(buf, 8);
}

void __44__CLBMobileKeybagManager__handleFirstUnlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_queue_updateLockedState
{
  NSDictionary *v3;
  NSDictionary *lockedState;
  NSObject *v5;
  unint64_t v6;
  __CFString *v7;
  uint8_t buf[4];
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  v3 = (NSDictionary *)MKBGetDeviceLockStateInfo();
  lockedState = self->_lockedState;
  self->_lockedState = v3;

  objc_msgSend(MEMORY[0x24BE16DF8], "commonLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CLBMobileKeybagManager _lockStateFromDictionary:](self, "_lockStateFromDictionary:", self->_lockedState);
    if (v6 >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown: %ld"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_2509B08E8[v6];
    }
    *(_DWORD *)buf = 138412290;
    v9 = v7;
    _os_log_impl(&dword_237D8D000, v5, OS_LOG_TYPE_DEFAULT, "Locked state: %@", buf, 0xCu);

  }
}

- (int64_t)_lockStateFromDictionary:(id)a3
{
  void *v3;
  unint64_t v4;
  int64_t v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE67228]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  v5 = v4;
  if (v4 <= 7)
    v5 = qword_237D99B58[v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUnlockCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_stateChangedCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lockedState, 0);
}

@end
