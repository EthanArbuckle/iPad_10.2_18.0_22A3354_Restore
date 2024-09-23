@implementation AWServiceManager

- (AWServiceManager)init
{
  AWServiceManager *v2;
  uint64_t v3;
  NSMutableSet *serviceObservers;
  id *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id *v10;
  _QWORD v12[4];
  id *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AWServiceManager;
  v2 = -[AWServiceManager init](&v14, sel_init);
  if (v2)
  {
    if (schedulerQueue_onceToken != -1)
      dispatch_once(&schedulerQueue_onceToken, &__block_literal_global_63);
    objc_storeStrong((id *)&v2->_queue, (id)schedulerQueue_queue);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    serviceObservers = v2->_serviceObservers;
    v2->_serviceObservers = (NSMutableSet *)v3;

    v5 = v2;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.AttentionAwareness"), 0);
    v7 = v5[2];
    v5[2] = (id)v6;

    xpcInterfaceForScheduler();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5[2], "setRemoteObjectInterface:", v8);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __24__AWServiceManager_init__block_invoke;
    v12[3] = &unk_1E5F8EC18;
    v13 = v5;
    v9 = v5[2];
    v10 = v5;
    objc_msgSend(v9, "setInterruptionHandler:", v12);
    objc_msgSend(v5[2], "resume");

  }
  return v2;
}

- (id)invokeWithService:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *queue;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v12;
  double v13;
  _QWORD block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1073;
  v25 = __Block_byref_object_dispose__1074;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1073;
  v19 = __Block_byref_object_dispose__1074;
  v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AWServiceManager_invokeWithService___block_invoke;
  block[3] = &unk_1E5F8E3F0;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v21;
  dispatch_sync(queue, block);
  if (v16[5])
  {
    v4[2](v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = (void *)v22[5];
      if (v7)
        v6 = v7;
      else
        v6 = 0;
    }
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = absTimeNS();
        if (v12 == -1)
          v13 = INFINITY;
        else
          v13 = (double)v12 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v30 = v13;
        _os_log_error_impl(&dword_1AF589000, v8, OS_LOG_TYPE_ERROR, "%13.5f: couldn't fetch the scheduler", buf, 0xCu);
      }

    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR(" Unable to fetch scheduler");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, v10);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v6;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (!v4)
    __assert_rtn("-[AWServiceManager addObserver:]", "ClientHelpers.m", 121, "observer");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AWServiceManager_addObserver___block_invoke;
  block[3] = &unk_1E5F8EC40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (!v4)
    __assert_rtn("-[AWServiceManager removeObserver:]", "ClientHelpers.m", 134, "observer");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AWServiceManager_removeObserver___block_invoke;
  block[3] = &unk_1E5F8EC40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceObservers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __35__AWServiceManager_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __32__AWServiceManager_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

void __38__AWServiceManager_invokeWithService___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = *(void **)(a1[4] + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__AWServiceManager_invokeWithService___block_invoke_2;
  v6[3] = &unk_1E5F8E8A0;
  v6[4] = a1[6];
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __38__AWServiceManager_invokeWithService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  int v9;
  double v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (currentLogLevel >= 6)
  {
    _AALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = absTimeNS();
      if (v5 == -1)
        v6 = INFINITY;
      else
        v6 = (double)v5 / 1000000000.0;
      v9 = 134218242;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1AF589000, v4, OS_LOG_TYPE_DEFAULT, "%13.5f: IPC error %@", (uint8_t *)&v9, 0x16u);
    }

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __24__AWServiceManager_init__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  _QWORD block[4];
  _QWORD *v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[1];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__AWServiceManager_init__block_invoke_2;
  block[3] = &unk_1E5F8EC18;
  v4 = v1;
  dispatch_async(v2, block);

}

void __24__AWServiceManager_init__block_invoke_2(uint64_t a1)
{
  id v1;
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  double v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  if (currentLogLevel >= 3)
  {
    _AALog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v8 = absTimeNS();
      if (v8 == -1)
        v9 = INFINITY;
      else
        v9 = (double)v8 / 1000000000.0;
      *(_DWORD *)buf = 134218240;
      v16 = v9;
      v17 = 2048;
      v18 = objc_msgSend(v1, "count");
      _os_log_error_impl(&dword_1AF589000, v2, OS_LOG_TYPE_ERROR, "%13.5f: XPC interruption: notifying %lu observers", buf, 0x16u);
    }

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "serviceInterrupted", (_QWORD)v10);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

+ (id)sharedManager
{
  if (sharedManager_onceToken_1090 != -1)
    dispatch_once(&sharedManager_onceToken_1090, &__block_literal_global_1091);
  return (id)sharedManager_manager_1092;
}

+ (id)invokeWithService:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invokeWithService:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

+ (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

void __33__AWServiceManager_sharedManager__block_invoke()
{
  AWServiceManager *v0;
  void *v1;

  v0 = objc_alloc_init(AWServiceManager);
  v1 = (void *)sharedManager_manager_1092;
  sharedManager_manager_1092 = (uint64_t)v0;

}

@end
