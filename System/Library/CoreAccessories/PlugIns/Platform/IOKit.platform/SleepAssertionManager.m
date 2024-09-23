@implementation SleepAssertionManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SleepAssertionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, block);
  return (id)sharedManager_sharedInstance;
}

void __38__SleepAssertionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v1;

}

- (SleepAssertionManager)init
{
  SleepAssertionManager *v2;
  SleepAssertionManager *v3;
  NSMutableDictionary *assertions;
  dispatch_queue_t v5;
  OS_dispatch_queue *sleepAssertionsLock;
  dispatch_queue_t v7;
  OS_dispatch_queue *applePencilSleepAssertionTimerQueue;
  const dispatch_source_type_s *v9;
  dispatch_source_t v10;
  OS_dispatch_source *applePencilSleepAssertionTimer;
  dispatch_queue_t v12;
  OS_dispatch_queue *mfi4SleepAssertionTimerQueue;
  dispatch_source_t v14;
  OS_dispatch_source *mfi4SleepAssertionTimer;
  NSObject *v16;
  uint64_t v17;
  SleepAssertionManager *v18;
  NSObject *v19;
  _QWORD v21[4];
  SleepAssertionManager *v22;
  _QWORD handler[4];
  SleepAssertionManager *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SleepAssertionManager;
  v2 = -[SleepAssertionManager init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    assertions = v2->_assertions;
    v2->_assertions = 0;

    v5 = dispatch_queue_create("com.apple.accessoryd.platform-iokit.sleepAssertionQ", 0);
    sleepAssertionsLock = v3->_sleepAssertionsLock;
    v3->_sleepAssertionsLock = (OS_dispatch_queue *)v5;

    *(_WORD *)&v3->_eaSleepAssertionHeld = 0;
    v3->_mfi4SleepAssertionHeld = 0;
    v7 = dispatch_queue_create("com.apple.accessoryd.platform-iokit.applePencilSleepAssertionTimerQ", 0);
    applePencilSleepAssertionTimerQueue = v3->_applePencilSleepAssertionTimerQueue;
    v3->_applePencilSleepAssertionTimerQueue = (OS_dispatch_queue *)v7;

    v9 = (const dispatch_source_type_s *)MEMORY[0x24BDACA18];
    v10 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v3->_applePencilSleepAssertionTimerQueue);
    applePencilSleepAssertionTimer = v3->_applePencilSleepAssertionTimer;
    v3->_applePencilSleepAssertionTimer = (OS_dispatch_source *)v10;

    v12 = dispatch_queue_create("com.apple.accessoryd.platform-iokit.mfi4SleepAssertionTimerQ", 0);
    mfi4SleepAssertionTimerQueue = v3->_mfi4SleepAssertionTimerQueue;
    v3->_mfi4SleepAssertionTimerQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_source_create(v9, 0, 0, (dispatch_queue_t)v3->_mfi4SleepAssertionTimerQueue);
    mfi4SleepAssertionTimer = v3->_mfi4SleepAssertionTimer;
    v3->_mfi4SleepAssertionTimer = (OS_dispatch_source *)v14;

    v16 = v3->_applePencilSleepAssertionTimer;
    v17 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __29__SleepAssertionManager_init__block_invoke;
    handler[3] = &unk_24D70BBF8;
    v18 = v3;
    v24 = v18;
    dispatch_source_set_event_handler(v16, handler);
    dispatch_source_set_timer((dispatch_source_t)v3->_applePencilSleepAssertionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v3->_applePencilSleepAssertionTimer);
    v19 = v3->_mfi4SleepAssertionTimer;
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __29__SleepAssertionManager_init__block_invoke_4;
    v21[3] = &unk_24D70BBF8;
    v22 = v18;
    dispatch_source_set_event_handler(v19, v21);
    dispatch_source_set_timer((dispatch_source_t)v3->_mfi4SleepAssertionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v3->_mfi4SleepAssertionTimer);

  }
  return v3;
}

void __29__SleepAssertionManager_init__block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2171EA000, v4, OS_LOG_TYPE_DEFAULT, "Apple Pencil assertion timer expired!!", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeApplePencilSleepAssertion");
  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 40), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void __29__SleepAssertionManager_init__block_invoke_4(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2171EA000, v4, OS_LOG_TYPE_DEFAULT, "MFi4 assertion timer expired!!", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeMFi4SleepAssertion");
  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 56), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;

  -[SleepAssertionManager applePencilSleepAssertionTimer](self, "applePencilSleepAssertionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SleepAssertionManager applePencilSleepAssertionTimer](self, "applePencilSleepAssertionTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)SleepAssertionManager;
  -[SleepAssertionManager dealloc](&v5, sel_dealloc);
}

- (void)createSleepAssertionForUUID:(id)a3
{
  id v4;
  NSObject *sleepAssertionsLock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sleepAssertionsLock = self->_sleepAssertionsLock;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SleepAssertionManager_createSleepAssertionForUUID___block_invoke;
  block[3] = &unk_24D70BC20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sleepAssertionsLock, block);

}

void __53__SleepAssertionManager_createSleepAssertionForUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const __CFDictionary *v8;
  IOReturn v9;
  int v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  uint64_t v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(*(id *)(a1 + 32), "setAssertions:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v6 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_2171EA000, v6, OS_LOG_TYPE_INFO, "UUID: %@ has already taken a sleep assertion!!", buf, 0xCu);
    }
  }
  else
  {
    AssertionID = 0;
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("com.apple.accessoryd.acc-connected."));
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject appendString:](v6, "appendString:", *(_QWORD *)(a1 + 40));
    v22[0] = CFSTR("AssertType");
    v22[1] = CFSTR("AssertLevel");
    v23[0] = CFSTR("NoIdleSleepAssertion");
    v23[1] = &unk_24D70FAD0;
    v22[2] = CFSTR("AssertName");
    v22[3] = CFSTR("AllowsDeviceRestart");
    v7 = *MEMORY[0x24BDBD270];
    v23[2] = v6;
    v23[3] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = IOPMAssertionCreateWithProperties(v8, &AssertionID);
    if (v9)
    {
      v10 = v9;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v11 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __53__SleepAssertionManager_createSleepAssertionForUUID___block_invoke_cold_2(v10, v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "assertions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", AssertionID);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v15, *(_QWORD *)(a1 + 40));

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v11 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v21 = v18;
        _os_log_impl(&dword_2171EA000, v11, OS_LOG_TYPE_DEFAULT, "UUID:%@ has taken a sleep assertion!!", buf, 0xCu);
      }
    }

  }
}

- (void)destroySleepAssertionForUUID:(id)a3
{
  id v4;
  NSObject *sleepAssertionsLock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sleepAssertionsLock = self->_sleepAssertionsLock;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SleepAssertionManager_destroySleepAssertionForUUID___block_invoke;
  block[3] = &unk_24D70BC20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sleepAssertionsLock, block);

}

void __54__SleepAssertionManager_destroySleepAssertionForUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    IOPMAssertionRelease(objc_msgSend(v3, "unsignedIntValue"));
    objc_msgSend(*(id *)(a1 + 32), "assertions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      v5 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_2171EA000, v5, OS_LOG_TYPE_DEFAULT, "UUID: %@ released sleep assertion!!", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)createEASleepAssertion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2171EA000, v0, v1, "ERROR - couldn't take ea sleep assertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)removeEASleepAssertion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2171EA000, v0, v1, "ERROR -  couldn't release ea sleep assertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)createApplePencilSleepAssertion
{
  NSObject *v3;
  _QWORD block[5];

  -[SleepAssertionManager applePencilSleepAssertionTimerQueue](self, "applePencilSleepAssertionTimerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SleepAssertionManager_createApplePencilSleepAssertion__block_invoke;
  block[3] = &unk_24D70BBF8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __56__SleepAssertionManager_createApplePencilSleepAssertion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFDictionary *v3;
  IOReturn v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  id v14;
  uint8_t v15[8];
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "applePencilSleepAssertionHeld") & 1) == 0)
  {
    v16[0] = CFSTR("AssertType");
    v16[1] = CFSTR("AssertLevel");
    v17[0] = CFSTR("NoIdleSleepAssertion");
    v17[1] = &unk_24D70FAD0;
    v16[2] = CFSTR("AssertName");
    v16[3] = CFSTR("AllowsDeviceRestart");
    v2 = *MEMORY[0x24BDBD270];
    v17[2] = CFSTR("com.apple.accessoryd.applePencilAssertion");
    v17[3] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
    v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v4 = IOPMAssertionCreateWithProperties(v3, (IOPMAssertionID *)(*(_QWORD *)(a1 + 32) + 16));
    if (gLogObjects)
      v5 = gNumLogObjects <= 0;
    else
      v5 = 1;
    v6 = !v5;
    if (v4)
    {
      if (v6)
      {
        v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v7 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __56__SleepAssertionManager_createApplePencilSleepAssertion__block_invoke_cold_3();

    }
    else
    {
      if (v6)
      {
        v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v8 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_2171EA000, v8, OS_LOG_TYPE_DEFAULT, "Apple Pencil sleep assertion taken", v15, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "applePencilSleepAssertionTimer");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_walltime(0, 3600000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0);

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v13 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_2171EA000, v13, OS_LOG_TYPE_DEFAULT, "createApplePencilSleepAssertion starting assertion timer", v15, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setApplePencilSleepAssertionHeld:", 1);
    }

  }
}

- (void)removeApplePencilSleepAssertion
{
  NSObject *v3;
  _QWORD block[5];

  -[SleepAssertionManager applePencilSleepAssertionTimerQueue](self, "applePencilSleepAssertionTimerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SleepAssertionManager_removeApplePencilSleepAssertion__block_invoke;
  block[3] = &unk_24D70BBF8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __56__SleepAssertionManager_removeApplePencilSleepAssertion__block_invoke(uint64_t a1)
{
  IOReturn v2;
  BOOL v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t v12[16];
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "applePencilSleepAssertionHeld"))
  {
    v2 = IOPMAssertionRelease(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16));
    if (gLogObjects)
      v3 = gNumLogObjects <= 0;
    else
      v3 = 1;
    v4 = !v3;
    if (v2)
    {
      if (v4)
      {
        v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v5 = MEMORY[0x24BDACB70];
        v7 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __56__SleepAssertionManager_removeApplePencilSleepAssertion__block_invoke_cold_3();

    }
    else
    {
      if (v4)
      {
        v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v6 = MEMORY[0x24BDACB70];
        v8 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2171EA000, v6, OS_LOG_TYPE_DEFAULT, "Apple Pencil sleep assertion released", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "applePencilSleepAssertionTimer");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_source_set_timer(v9, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v10 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_2171EA000, v10, OS_LOG_TYPE_DEFAULT, "removeApplePencilSleepAssertion stopping assertion timer", v12, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setApplePencilSleepAssertionHeld:", 0);
    }
  }
}

- (void)createMFi4SleepAssertion
{
  NSObject *v3;
  _QWORD block[5];

  -[SleepAssertionManager mfi4SleepAssertionTimerQueue](self, "mfi4SleepAssertionTimerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SleepAssertionManager_createMFi4SleepAssertion__block_invoke;
  block[3] = &unk_24D70BBF8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __49__SleepAssertionManager_createMFi4SleepAssertion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFDictionary *v3;
  IOReturn v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  id v14;
  uint8_t v15[8];
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "mfi4SleepAssertionHeld") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeMFi4SleepAssertion");
    objc_msgSend(*(id *)(a1 + 32), "createMFi4SleepAssertion");
  }
  else
  {
    v16[0] = CFSTR("AssertType");
    v16[1] = CFSTR("AssertLevel");
    v17[0] = CFSTR("NoIdleSleepAssertion");
    v17[1] = &unk_24D70FAD0;
    v16[2] = CFSTR("AssertName");
    v16[3] = CFSTR("AllowsDeviceRestart");
    v2 = *MEMORY[0x24BDBD270];
    v17[2] = CFSTR("com.apple.accessoryd.mfi4Assertion");
    v17[3] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
    v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v4 = IOPMAssertionCreateWithProperties(v3, (IOPMAssertionID *)(*(_QWORD *)(a1 + 32) + 20));
    if (gLogObjects)
      v5 = gNumLogObjects <= 0;
    else
      v5 = 1;
    v6 = !v5;
    if (v4)
    {
      if (v6)
      {
        v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v7 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __49__SleepAssertionManager_createMFi4SleepAssertion__block_invoke_cold_3();

    }
    else
    {
      if (v6)
      {
        v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v8 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_2171EA000, v8, OS_LOG_TYPE_DEFAULT, "MFi4 sleep assertion taken", v15, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "mfi4SleepAssertionTimer");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_walltime(0, 10000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0);

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v13 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_2171EA000, v13, OS_LOG_TYPE_DEFAULT, "createMFi4SleepAssertion starting assertion timer", v15, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setMfi4SleepAssertionHeld:", 1);
    }

  }
}

- (void)removeMFi4SleepAssertion
{
  NSObject *v3;
  _QWORD block[5];

  -[SleepAssertionManager mfi4SleepAssertionTimerQueue](self, "mfi4SleepAssertionTimerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SleepAssertionManager_removeMFi4SleepAssertion__block_invoke;
  block[3] = &unk_24D70BBF8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __49__SleepAssertionManager_removeMFi4SleepAssertion__block_invoke(uint64_t a1)
{
  IOReturn v2;
  BOOL v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t v12[16];
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "mfi4SleepAssertionHeld"))
  {
    v2 = IOPMAssertionRelease(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 20));
    if (gLogObjects)
      v3 = gNumLogObjects <= 0;
    else
      v3 = 1;
    v4 = !v3;
    if (v2)
    {
      if (v4)
      {
        v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v5 = MEMORY[0x24BDACB70];
        v7 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __49__SleepAssertionManager_removeMFi4SleepAssertion__block_invoke_cold_3();

    }
    else
    {
      if (v4)
      {
        v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v6 = MEMORY[0x24BDACB70];
        v8 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2171EA000, v6, OS_LOG_TYPE_DEFAULT, "MFi4 sleep assertion released", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "mfi4SleepAssertionTimer");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_source_set_timer(v9, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        v10 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_2171EA000, v10, OS_LOG_TYPE_DEFAULT, "createMFi4SleepAssertion stopping assertion timer", v12, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setMfi4SleepAssertionHeld:", 0);
    }
  }
}

- (NSMutableDictionary)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_assertions, a3);
}

- (BOOL)sleepAssertionHeld
{
  return self->_sleepAssertionHeld;
}

- (void)setSleepAssertionHeld:(BOOL)a3
{
  self->_sleepAssertionHeld = a3;
}

- (OS_dispatch_queue)sleepAssertionsLock
{
  return self->_sleepAssertionsLock;
}

- (void)setSleepAssertionsLock:(id)a3
{
  objc_storeStrong((id *)&self->_sleepAssertionsLock, a3);
}

- (BOOL)eaSleepAssertionHeld
{
  return self->_eaSleepAssertionHeld;
}

- (void)setEaSleepAssertionHeld:(BOOL)a3
{
  self->_eaSleepAssertionHeld = a3;
}

- (unsigned)eaSleepAssertionID
{
  return self->_eaSleepAssertionID;
}

- (void)setEaSleepAssertionID:(unsigned int)a3
{
  self->_eaSleepAssertionID = a3;
}

- (BOOL)applePencilSleepAssertionHeld
{
  return self->_applePencilSleepAssertionHeld;
}

- (void)setApplePencilSleepAssertionHeld:(BOOL)a3
{
  self->_applePencilSleepAssertionHeld = a3;
}

- (unsigned)applePencilSleepAssertionID
{
  return self->_applePencilSleepAssertionID;
}

- (void)setApplePencilSleepAssertionID:(unsigned int)a3
{
  self->_applePencilSleepAssertionID = a3;
}

- (OS_dispatch_source)applePencilSleepAssertionTimer
{
  return self->_applePencilSleepAssertionTimer;
}

- (void)setApplePencilSleepAssertionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_applePencilSleepAssertionTimer, a3);
}

- (OS_dispatch_queue)applePencilSleepAssertionTimerQueue
{
  return self->_applePencilSleepAssertionTimerQueue;
}

- (void)setApplePencilSleepAssertionTimerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_applePencilSleepAssertionTimerQueue, a3);
}

- (BOOL)mfi4SleepAssertionHeld
{
  return self->_mfi4SleepAssertionHeld;
}

- (void)setMfi4SleepAssertionHeld:(BOOL)a3
{
  self->_mfi4SleepAssertionHeld = a3;
}

- (unsigned)mfi4SleepAssertionID
{
  return self->_mfi4SleepAssertionID;
}

- (void)setMfi4SleepAssertionID:(unsigned int)a3
{
  self->_mfi4SleepAssertionID = a3;
}

- (OS_dispatch_source)mfi4SleepAssertionTimer
{
  return self->_mfi4SleepAssertionTimer;
}

- (void)setMfi4SleepAssertionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_mfi4SleepAssertionTimer, a3);
}

- (OS_dispatch_queue)mfi4SleepAssertionTimerQueue
{
  return self->_mfi4SleepAssertionTimerQueue;
}

- (void)setMfi4SleepAssertionTimerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mfi4SleepAssertionTimerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mfi4SleepAssertionTimerQueue, 0);
  objc_storeStrong((id *)&self->_mfi4SleepAssertionTimer, 0);
  objc_storeStrong((id *)&self->_applePencilSleepAssertionTimerQueue, 0);
  objc_storeStrong((id *)&self->_applePencilSleepAssertionTimer, 0);
  objc_storeStrong((id *)&self->_sleepAssertionsLock, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

void __29__SleepAssertionManager_init__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2171EA000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __53__SleepAssertionManager_createSleepAssertionForUUID___block_invoke_cold_2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2171EA000, a2, OS_LOG_TYPE_ERROR, "ERROR - IOPMAssertionCreateWithProperties returned error: 0x%08x!!", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

void __56__SleepAssertionManager_createApplePencilSleepAssertion__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2171EA000, v0, v1, "ERROR - couldn't take Apple Pencil sleep assertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __56__SleepAssertionManager_removeApplePencilSleepAssertion__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2171EA000, v0, v1, "ERROR -  couldn't release Apple Pencil sleep assertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__SleepAssertionManager_createMFi4SleepAssertion__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2171EA000, v0, v1, "ERROR - couldn't take MFi4 sleep assertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__SleepAssertionManager_removeMFi4SleepAssertion__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2171EA000, v0, v1, "ERROR -  couldn't release MFi4 sleep assertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
