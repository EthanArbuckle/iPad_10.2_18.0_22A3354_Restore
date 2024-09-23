@implementation BBLocalDataProvider

+ (id)dataProviderWithPrincipalClass:(Class)a3 serverQueue:(id)a4 initializationCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrincipalClass:serverQueue:initializationCompletion:", a3, v9, v8);

  return v10;
}

+ (id)dataProviderWithDataProvider:(id)a3 serverQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDataProvider:serverQueue:", v7, v6);

  return v8;
}

- (id)_initWithDataProvider:(id)a3 sectionID:(id)a4 serverQueue:(id)a5 initializationCompletion:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  BBLocalDataProvider *v16;
  BBLocalDataProvider *v17;
  id v18;
  const char *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *remoteQueue;
  uint64_t v23;
  BBLocalDataProvider *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  void *v31;
  _QWORD block[4];
  BBLocalDataProvider *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  BBLocalDataProvider *v37;
  id v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v14)
  {
    if (v13)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBDataProvider.m"), 544, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionID != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBDataProvider.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue != nil"));

  if (!v13)
    goto LABEL_11;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBDataProvider.m"), 545, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataProvider != nil"));

LABEL_4:
  v16 = -[BBLocalDataProvider init](self, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_localQueue, a5);
    objc_storeStrong((id *)&v17->_dataProvider, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BBDataProviderQueue:%@"), v13);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend(v18, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create(v19, v20);
    remoteQueue = v17->_remoteQueue;
    v17->_remoteQueue = (OS_dispatch_queue *)v21;

    v23 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke;
    v36[3] = &unk_24C562E50;
    v24 = v17;
    v37 = v24;
    v38 = v12;
    v25 = (void *)MEMORY[0x212B949C0](v36);
    v26 = v25;
    v27 = v17->_remoteQueue;
    if (v15)
    {
      block[0] = v23;
      block[1] = 3221225472;
      block[2] = __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke_2;
      block[3] = &unk_24C564928;
      v34 = v25;
      v33 = v24;
      v35 = v15;
      dispatch_async(v27, block);

    }
    else
    {
      dispatch_sync(v27, v25);
    }

  }
  return v17;
}

void __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  +[BBDataProviderIdentity identityForDataProvider:](BBDataProviderIdentity, "identityForDataProvider:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentity:", v2);

}

void __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke_3;
  block[3] = &unk_24C5632A8;
  v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

uint64_t __92__BBLocalDataProvider__initWithDataProvider_sectionID_serverQueue_initializationCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BBLocalDataProvider)initWithDataProvider:(id)a3 serverQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BBLocalDataProvider *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BBLocalDataProvider _initWithDataProvider:sectionID:serverQueue:initializationCompletion:](self, "_initWithDataProvider:sectionID:serverQueue:initializationCompletion:", v7, v8, v6, 0);

  return v9;
}

- (BBLocalDataProvider)initWithPrincipalClass:(Class)a3 serverQueue:(id)a4 initializationCompletion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  BBLocalDataProvider *v14;
  NSObject *v15;
  dispatch_time_t v16;
  __CFString *v17;
  NSObject *v18;
  uint64_t v19;
  double v20;
  id v21;
  BBLocalDataProvider *v22;
  void *v23;
  _QWORD block[4];
  BBLocalDataProvider *v26;
  id v27;
  NSObject *v28;
  id v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t *v32;
  Class v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  double v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    if (a3)
      goto LABEL_3;
LABEL_11:
    v17 = CFSTR("<null>");
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBDataProvider.m"), 576, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue != nil"));

  if (!a3)
    goto LABEL_11;
LABEL_3:
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_2549A9EC8) & 1) == 0)
  {
    NSStringFromClass(a3);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    NSLog(CFSTR("BBDataProvider: Principal class \"%@\" does not conform."), v17);

    v22 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__11;
  v46 = __Block_byref_object_dispose__11;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__11;
  v40 = __Block_byref_object_dispose__11;
  v41 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__11;
  v34[4] = __Block_byref_object_dispose__11;
  v35 = 0;
  v12 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__BBLocalDataProvider_initWithPrincipalClass_serverQueue_initializationCompletion___block_invoke;
  block[3] = &unk_24C564950;
  v30 = v34;
  v31 = &v36;
  v32 = &v42;
  v33 = a3;
  v14 = self;
  v26 = v14;
  v27 = v9;
  v29 = v10;
  v15 = v12;
  v28 = v15;
  dispatch_async(v13, block);

  v16 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v15, v16))
    BBIsInternalDevice();
  v18 = (id)BBLogGeneral;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v37[5];
    objc_msgSend(v11, "timeIntervalSinceNow");
    *(_DWORD *)buf = 138543618;
    v49 = v19;
    v50 = 2048;
    v51 = -v20;
    _os_log_impl(&dword_20CCB9000, v18, OS_LOG_TYPE_DEFAULT, "BBDataProvider: provider <%{public}@> loaded in %.2f sec", buf, 0x16u);
  }

  v21 = (id)v43[5];
  v22 = (BBLocalDataProvider *)v21;

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
LABEL_13:

  return v22;
}

intptr_t __83__BBLocalDataProvider_initWithPrincipalClass_serverQueue_initializationCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = objc_alloc_init(*(Class *)(a1 + 88));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_msgSend(*(id *)(a1 + 32), "_initWithDataProvider:sectionID:serverQueue:initializationCompletion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __83__BBLocalDataProvider_initWithPrincipalClass_serverQueue_initializationCompletion___block_invoke_370(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 == 1)
  {
    NSLog(CFSTR("Exiting..."), v2, v3);
    exit(1);
  }
}

- (void)dealloc
{
  NSObject *watchdogTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    dispatch_source_cancel(watchdogTimer);
    v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)BBLocalDataProvider;
  -[BBLocalDataProvider dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  NSObject *watchdogTimer;
  OS_dispatch_source *v4;

  self->_invalidated = 1;
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    dispatch_source_cancel(watchdogTimer);
    v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0;

  }
}

- (void)_ping
{
  dispatch_semaphore_t v3;
  NSObject *remoteQueue;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *localQueue;
  _QWORD v9[5];
  _QWORD block[4];
  NSObject *v11;
  BBLocalDataProvider *v12;

  v3 = dispatch_semaphore_create(0);
  remoteQueue = self->_remoteQueue;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__BBLocalDataProvider__ping__block_invoke;
  block[3] = &unk_24C562E50;
  v6 = v3;
  v11 = v6;
  v12 = self;
  dispatch_async(remoteQueue, block);
  v7 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    localQueue = self->_localQueue;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __28__BBLocalDataProvider__ping__block_invoke_3;
    v9[3] = &unk_24C562E28;
    v9[4] = self;
    dispatch_async(localQueue, v9);
  }

}

void __28__BBLocalDataProvider__ping__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__BBLocalDataProvider__ping__block_invoke_2;
  block[3] = &unk_24C562E28;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __28__BBLocalDataProvider__ping__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 48))
  {
    *(_BYTE *)(v1 + 48) = 0;
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("BBServer: data provider \"%@\" is no longer unresponsive."), v2);

  }
}

uint64_t __28__BBLocalDataProvider__ping__block_invoke_3(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 48))
  {
    v1 = result;
    result = BSIsBeingDebugged();
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(v1 + 32) + 48) = 1;
      return objc_msgSend(*(id *)(v1 + 32), "_watchdogFired");
    }
  }
  return result;
}

- (void)_watchdogFired
{
  BBIsInternalDevice();
}

- (void)startWatchdog
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *watchdogTimer;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];

  if (!self->_watchdogTimer)
  {
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v3);
    watchdogTimer = self->_watchdogTimer;
    self->_watchdogTimer = v4;

    v6 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer((dispatch_source_t)self->_watchdogTimer, v6, 0x45D964B800uLL, 0x3B9ACA00uLL);
    v7 = self->_watchdogTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __36__BBLocalDataProvider_startWatchdog__block_invoke;
    handler[3] = &unk_24C562E28;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_watchdogTimer);
  }
}

uint64_t __36__BBLocalDataProvider_startWatchdog__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 48))
  {
    v1 = result;
    result = BSIsBeingDebugged();
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(v1 + 32), "_ping");
  }
  return result;
}

- (void)dataProviderDidLoad
{
  NSObject *remoteQueue;
  _QWORD block[5];

  remoteQueue = self->_remoteQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__BBLocalDataProvider_dataProviderDidLoad__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(remoteQueue, block);
}

void __42__BBLocalDataProvider_dataProviderDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_setDataProviderQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "traits");

  if ((v3 & 2) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "dataProviderDidLoad");
}

- (id)_doSynchronousRemoteRequest:(id)a3 conditionalOn:(id)a4
{
  id v6;
  unsigned int (**v7)(void);
  dispatch_semaphore_t v8;
  NSObject *remoteQueue;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[4];
  NSObject *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = (unsigned int (**)(void))a4;
  if (v7[2]())
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__11;
    v24 = __Block_byref_object_dispose__11;
    v25 = 0;
    v8 = dispatch_semaphore_create(0);
    remoteQueue = self->_remoteQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__BBLocalDataProvider__doSynchronousRemoteRequest_conditionalOn___block_invoke;
    block[3] = &unk_24C564978;
    v19 = &v20;
    v18 = v6;
    v10 = v8;
    v17 = v10;
    dispatch_async(remoteQueue, block);
    v11 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v10, v11))
    {
      -[BBDataProvider sectionIdentifier](self, "sectionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Synchronous request to <%@> timed out after %llu seconds."), v12, 5);

      v13 = 0;
    }
    else
    {
      v13 = (void *)v21[5];
    }
    v14 = v13;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

intptr_t __65__BBLocalDataProvider__doSynchronousRemoteRequest_conditionalOn___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_doAsynchronousRemoteRequest:(id)a3 conditionalOn:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  char v10;
  NSObject *remoteQueue;
  _QWORD block[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v10 = (*((uint64_t (**)(id))a4 + 2))(a4);
  if (v8 && (v10 & 1) != 0)
  {
    remoteQueue = self->_remoteQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__BBLocalDataProvider__doAsynchronousRemoteRequest_conditionalOn_completion___block_invoke;
    block[3] = &unk_24C5649C8;
    v13 = v8;
    v14 = v9;
    block[4] = self;
    dispatch_async(remoteQueue, block);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __77__BBLocalDataProvider__doAsynchronousRemoteRequest_conditionalOn_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  id v8;

  (*(void (**)(void))(a1[5] + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)a1[6];
  if (v3)
  {
    v4 = a1[4];
    v5 = *(NSObject **)(v4 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__BBLocalDataProvider__doAsynchronousRemoteRequest_conditionalOn_completion___block_invoke_2;
    block[3] = &unk_24C5649A0;
    block[4] = v4;
    v8 = v3;
    v7 = v2;
    dispatch_async(v5, block);

  }
}

_QWORD *__77__BBLocalDataProvider__doAsynchronousRemoteRequest_conditionalOn_completion___block_invoke_2(_QWORD *result)
{
  if (!*(_BYTE *)(result[4] + 49))
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(result[6] + 16))(result[6], result[5]);
  return result;
}

- (id)_bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BBDataProvider *dataProvider;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[BBDataProvider identity](self, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "traits") & 4) != 0)
  {
    -[BBDataProvider bulletinsWithRequestParameters:lastCleared:](self->_dataProvider, "bulletinsWithRequestParameters:lastCleared:", v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v10;
    goto LABEL_6;
  }
  if ((objc_msgSend(v6, "publisherDestination") & 2) != 0)
  {
    if ((objc_msgSend(v8, "traits") & 0x10) != 0)
    {
      dataProvider = self->_dataProvider;
      objc_msgSend(v6, "enabledSectionIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBDataProvider bulletinsFilteredBy:enabledSectionIDs:count:lastCleared:](dataProvider, "bulletinsFilteredBy:enabledSectionIDs:count:lastCleared:", 0, v13, objc_msgSend(v6, "maximumCount"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    if ((objc_msgSend(v8, "traits") & 8) != 0)
    {
      -[BBDataProvider bulletinsFilteredBy:count:lastCleared:](self->_dataProvider, "bulletinsFilteredBy:count:lastCleared:", 0, objc_msgSend(v6, "maximumCount"), v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (id)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared___block_invoke;
  v12[3] = &unk_24C5649F0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  -[BBLocalDataProvider _doSynchronousRemoteRequest:conditionalOn:](self, "_doSynchronousRemoteRequest:conditionalOn:", v12, &__block_literal_global_397);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __66__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bulletinsWithRequestParameters:lastCleared:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __66__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared___block_invoke_2()
{
  return 1;
}

- (void)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke;
  v12[3] = &unk_24C5649F0;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[BBLocalDataProvider _doAsynchronousRemoteRequest:conditionalOn:completion:](self, "_doAsynchronousRemoteRequest:conditionalOn:completion:", v12, &__block_literal_global_398, a5);

}

uint64_t __77__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bulletinsWithRequestParameters:lastCleared:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __77__BBLocalDataProvider_bulletinsWithRequestParameters_lastCleared_completion___block_invoke_2()
{
  return 1;
}

- (id)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  BBLocalDataProvider *v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[BBDataProvider identity](self, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo___block_invoke;
  v17[3] = &unk_24C564A78;
  v18 = v8;
  v19 = self;
  v20 = v6;
  v21 = v7;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __63__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo___block_invoke_2;
  v15[3] = &unk_24C564AA0;
  v16 = v18;
  v10 = v18;
  v11 = v7;
  v12 = v6;
  -[BBLocalDataProvider _doSynchronousRemoteRequest:conditionalOn:](self, "_doSynchronousRemoteRequest:conditionalOn:", v17, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __63__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo___block_invoke(uint64_t a1)
{
  void *v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "traits") & 0x20) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "clearedInfoForBulletins:lastClearedInfo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "traits") & 0x100) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "clearedInfoForBulletins:", *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __63__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo___block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "traits") & 0x20) != 0)
    return 1;
  else
    return (objc_msgSend(*(id *)(a1 + 32), "traits") >> 8) & 1;
}

- (void)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  BBLocalDataProvider *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BBDataProvider identity](self, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __74__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke;
  v18[3] = &unk_24C564A78;
  v19 = v11;
  v20 = self;
  v21 = v8;
  v22 = v9;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __74__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2;
  v16[3] = &unk_24C564AA0;
  v17 = v19;
  v13 = v19;
  v14 = v9;
  v15 = v8;
  -[BBLocalDataProvider _doAsynchronousRemoteRequest:conditionalOn:completion:](self, "_doAsynchronousRemoteRequest:conditionalOn:completion:", v18, v16, v10);

}

id __74__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "traits") & 0x20) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "clearedInfoForBulletins:lastClearedInfo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "traits") & 0x100) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "clearedInfoForBulletins:", *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __74__BBLocalDataProvider_clearedInfoForBulletins_lastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "traits") & 0x20) != 0)
    return 1;
  else
    return (objc_msgSend(*(id *)(a1 + 32), "traits") >> 8) & 1;
}

- (void)clearedInfoForClearingAllBulletinsWithLastClearedInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  -[BBDataProvider identity](self, "identity");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__BBLocalDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke;
  v12[3] = &unk_24C564AC8;
  v12[4] = self;
  v13 = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __88__BBLocalDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2;
  v10[3] = &unk_24C564AA0;
  v8 = v11;
  v9 = v6;
  -[BBLocalDataProvider _doAsynchronousRemoteRequest:conditionalOn:completion:](self, "_doAsynchronousRemoteRequest:conditionalOn:completion:", v12, v10, v7);

}

uint64_t __88__BBLocalDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "clearedInfoForClearingAllBulletinsWithLastClearedInfo:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__BBLocalDataProvider_clearedInfoForClearingAllBulletinsWithLastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  return (objc_msgSend(*(id *)(a1 + 32), "traits") >> 6) & 1;
}

- (void)clearedInfoForClearingBulletinsFromDate:(id)a3 toDate:(id)a4 lastClearedInfo:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[BBDataProvider identity](self, "identity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __97__BBLocalDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke;
  v21[3] = &unk_24C564A78;
  v21[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __97__BBLocalDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2;
  v19[3] = &unk_24C564AA0;
  v20 = v14;
  v15 = v14;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[BBLocalDataProvider _doAsynchronousRemoteRequest:conditionalOn:completion:](self, "_doAsynchronousRemoteRequest:conditionalOn:completion:", v21, v19, v13);

}

uint64_t __97__BBLocalDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "clearedInfoForClearingBulletinsFromDate:toDate:lastClearedInfo:", a1[5], a1[6], a1[7]);
}

uint64_t __97__BBLocalDataProvider_clearedInfoForClearingBulletinsFromDate_toDate_lastClearedInfo_completion___block_invoke_2(uint64_t a1)
{
  return (objc_msgSend(*(id *)(a1 + 32), "traits") >> 6) & 1;
}

- (void)updateClearedInfoWithClearedInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__BBLocalDataProvider_updateClearedInfoWithClearedInfo_handler_completion___block_invoke;
  v15[3] = &unk_24C564AF0;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __75__BBLocalDataProvider_updateClearedInfoWithClearedInfo_handler_completion___block_invoke_2;
  v13[3] = &unk_24C564B18;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[BBLocalDataProvider _doAsynchronousRemoteRequest:conditionalOn:completion:](self, "_doAsynchronousRemoteRequest:conditionalOn:completion:", v15, v13, a5);

}

uint64_t __75__BBLocalDataProvider_updateClearedInfoWithClearedInfo_handler_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

BOOL __75__BBLocalDataProvider_updateClearedInfoWithClearedInfo_handler_completion___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32) != 0;
}

- (void)updateSectionInfoWithSectionInfo:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__BBLocalDataProvider_updateSectionInfoWithSectionInfo_handler_completion___block_invoke;
  v15[3] = &unk_24C564AF0;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __75__BBLocalDataProvider_updateSectionInfoWithSectionInfo_handler_completion___block_invoke_2;
  v13[3] = &unk_24C564B18;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[BBLocalDataProvider _doAsynchronousRemoteRequest:conditionalOn:completion:](self, "_doAsynchronousRemoteRequest:conditionalOn:completion:", v15, v13, a5);

}

uint64_t __75__BBLocalDataProvider_updateSectionInfoWithSectionInfo_handler_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

BOOL __75__BBLocalDataProvider_updateSectionInfoWithSectionInfo_handler_completion___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32) != 0;
}

- (void)deliverResponse:(id)a3 forBulletinRequest:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  NSObject *remoteQueue;
  id v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  BBLocalDataProvider *v26;
  void (**v27)(id, _QWORD);
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  unsigned int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v9, "actionForResponse:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBDataProvider identity](self, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "internalBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || (objc_msgSend(v12, "traits") & 0x100000) != 0)
    v14 = 1;
  else
    v14 = (objc_msgSend(v12, "traits") >> 21) & 1;

  if (!v11 || !v14)
  {
    v16 = (void *)BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
    {
      v19 = v16;
      *(_DWORD *)buf = 138543874;
      v29 = (id)objc_opt_class();
      v30 = 2114;
      v31 = v11;
      v32 = 1024;
      v33 = v14;
      v20 = v29;
      _os_log_error_impl(&dword_20CCB9000, v19, OS_LOG_TYPE_ERROR, "%{public}@ could not deliver response for action %{public}@\tcanDeliver=%d", buf, 0x1Cu);

      if (!v10)
        goto LABEL_15;
    }
    else if (!v10)
    {
      goto LABEL_15;
    }
    v10[2](v10, 0);
    goto LABEL_15;
  }
  if ((objc_msgSend(v12, "traits") & 0x100000) != 0 || (objc_msgSend(v12, "traits") & 0x200000) != 0)
  {
    +[BBActionResponse actionResponseForResponse:bulletinRequest:](BBActionResponse, "actionResponseForResponse:bulletinRequest:", v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  remoteQueue = self->_remoteQueue;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __73__BBLocalDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke;
  v21[3] = &unk_24C564B40;
  v22 = v11;
  v23 = v8;
  v24 = v15;
  v25 = v12;
  v26 = self;
  v27 = v10;
  v18 = v15;
  dispatch_async(remoteQueue, v21);

LABEL_15:
}

uint64_t __73__BBLocalDataProvider_deliverResponse_forBulletinRequest_withCompletion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t result;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "deliverResponse:", *(_QWORD *)(a1 + 40));
  if ((v2 & 1) != 0)
    goto LABEL_2;
  if (*(_QWORD *)(a1 + 48))
  {
    if ((objc_msgSend(*(id *)(a1 + 56), "traits") & 0x200000) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 32), "handleBulletinActionResponse:withCompletion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
    }
    else if ((objc_msgSend(*(id *)(a1 + 56), "traits") & 0x100000) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 32), "handleBulletinActionResponse:", *(_QWORD *)(a1 + 48));
LABEL_2:
      v3 = 1;
      goto LABEL_9;
    }
  }
  v3 = 0;
LABEL_9:
  v4 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (void *)objc_opt_class();
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 138544130;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 1024;
    v15 = v3;
    v16 = 1024;
    v17 = v2;
    v8 = v6;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ delivered response for action %{public}@ with success=%d; delivered=%d",
      (uint8_t *)&v10,
      0x22u);

  }
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

- (BOOL)canPerformMigration
{
  void *v2;
  unsigned int v3;

  -[BBDataProvider identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "traits") >> 13) & 1;

  return v3;
}

- (BOOL)migrateSectionInfo:(id)a3 oldSectionInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *remoteQueue;
  char v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  -[BBDataProvider identity](self, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if ((objc_msgSend(v8, "traits") & 0x2000) != 0)
  {
    remoteQueue = self->_remoteQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__BBLocalDataProvider_migrateSectionInfo_oldSectionInfo___block_invoke;
    v12[3] = &unk_24C564B68;
    v15 = &v16;
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    dispatch_sync(remoteQueue, v12);

  }
  v10 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __57__BBLocalDataProvider_migrateSectionInfo_oldSectionInfo___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 32), "migrateSectionInfo:oldSectionInfo:", a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (void)reloadIdentityWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];

  v6 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__BBLocalDataProvider_reloadIdentityWithCompletion___block_invoke;
  v7[3] = &unk_24C564B90;
  v7[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__BBLocalDataProvider_reloadIdentityWithCompletion___block_invoke_3;
  v5[3] = &unk_24C564BD8;
  v5[4] = self;
  v4 = v6;
  -[BBLocalDataProvider _doAsynchronousRemoteRequest:conditionalOn:completion:](self, "_doAsynchronousRemoteRequest:conditionalOn:completion:", v7, &__block_literal_global_400, v5);

}

id __52__BBLocalDataProvider_reloadIdentityWithCompletion___block_invoke(uint64_t a1)
{
  return +[BBDataProviderIdentity identityForDataProvider:](BBDataProviderIdentity, "identityForDataProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __52__BBLocalDataProvider_reloadIdentityWithCompletion___block_invoke_2()
{
  return 1;
}

void __52__BBLocalDataProvider_reloadIdentityWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v4, "setIdentity:", v3);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
  else
  {
    NSLog(CFSTR("BBDataProvider: unable to load new identity for %@"), v4, 0);
  }

}

- (void)noteSectionInfoDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *remoteQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BBDataProvider identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "traits") & 0x40000) != 0)
  {
    remoteQueue = self->_remoteQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __48__BBLocalDataProvider_noteSectionInfoDidChange___block_invoke;
    v7[3] = &unk_24C562E50;
    v7[4] = self;
    v8 = v4;
    dispatch_async(remoteQueue, v7);

  }
}

uint64_t __48__BBLocalDataProvider_noteSectionInfoDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "noteSectionInfoDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)deliverMessageWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *remoteQueue;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[BBDataProvider identity](self, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "traits") & 0x20000) != 0)
  {
    remoteQueue = self->_remoteQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__BBLocalDataProvider_deliverMessageWithName_userInfo___block_invoke;
    block[3] = &unk_24C563438;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(remoteQueue, block);

  }
  else
  {
    -[BBDataProvider sectionIdentifier](self, "sectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("BBDataProvider: unable to deliver message to section <%@> because it is not implemented by the data provider"), v9);

  }
}

uint64_t __55__BBLocalDataProvider_deliverMessageWithName_userInfo___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "receiveMessageWithName:userInfo:", a1[5], a1[6]);
}

- (BBDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_remoteQueue, 0);
  objc_storeStrong((id *)&self->_localQueue, 0);
}

@end
