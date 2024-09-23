@implementation IPGlobalInstallableStateSourceXPCBehavior

- (IPGlobalInstallableStateSourceXPCBehavior)initWithXPCConnectionProvider:(id)a3 stateStreamSource:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  IPGlobalInstallableStateSourceXPCBehavior *v11;
  IPGlobalInstallableStateSourceXPCBehavior *v12;
  uint64_t v13;
  id connectionProvider;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *calloutQueue;
  NSXPCConnection *currentConnection;
  NSMutableDictionary *v19;
  NSMutableDictionary *registeredStateSources;
  NSMutableDictionary *v21;
  NSMutableDictionary *registeredProgressSources;
  uint64_t v23;
  NSHashTable *stateUpdateObservers;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)IPGlobalInstallableStateSourceXPCBehavior;
  v11 = -[IPGlobalInstallableStateSourceXPCBehavior init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_stateStreamSource, a4);
    -[IPStateUpdateStreamSource setDelegate:](v12->_stateStreamSource, "setDelegate:", v12);
    v13 = objc_msgSend(v8, "copy");
    connectionProvider = v12->_connectionProvider;
    v12->_connectionProvider = (id)v13;

    objc_storeStrong((id *)&v12->_q, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.InstallProgress.GISSXPCB.callout", v15);
    calloutQueue = v12->_calloutQueue;
    v12->_calloutQueue = (OS_dispatch_queue *)v16;

    currentConnection = v12->_currentConnection;
    v12->_currentConnection = 0;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    registeredStateSources = v12->_registeredStateSources;
    v12->_registeredStateSources = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    registeredProgressSources = v12->_registeredProgressSources;
    v12->_registeredProgressSources = v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 1);
    stateUpdateObservers = v12->_stateUpdateObservers;
    v12->_stateUpdateObservers = (NSHashTable *)v23;

  }
  return v12;
}

- (void)registerStateSource:(id)a3
{
  id v4;
  NSObject *q;
  id v6;
  _QWORD block[4];
  id v8;
  IPGlobalInstallableStateSourceXPCBehavior *v9;

  v4 = a3;
  q = self->_q;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke;
  block[3] = &unk_250FA3B50;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(q, block);

}

void __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _IPDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_23F108000, v2, OS_LOG_TYPE_DEFAULT, "registering state source %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "collationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKey:", v5, v4);
  }
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_queue_resumeStateStreamSourceIfNecessary");
  v6 = *(void **)(a1 + 32);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 64);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke_7;
  block[3] = &unk_250FA3EA0;
  v9 = v6;
  dispatch_async(v7, block);

}

void __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  objc_msgSend(v2, "currentStateWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "notifyOfUpdate:", v3);
  }
  else
  {
    _IPClientLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke_7_cold_1();

  }
}

- (void)unregisterStateSource:(id)a3
{
  id v4;
  NSObject *q;
  id v6;
  _QWORD block[4];
  id v8;
  IPGlobalInstallableStateSourceXPCBehavior *v9;

  v4 = a3;
  q = self->_q;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__IPGlobalInstallableStateSourceXPCBehavior_unregisterStateSource___block_invoke;
  block[3] = &unk_250FA3B50;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(q, block);

}

void __67__IPGlobalInstallableStateSourceXPCBehavior_unregisterStateSource___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _IPDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_23F108000, v2, OS_LOG_TYPE_DEFAULT, "unregistering state source %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "collationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObjectForKey:", v4);

}

- (void)registerProgressSource:(id)a3
{
  id v4;
  NSObject *q;
  id v6;
  _QWORD block[4];
  id v8;
  IPGlobalInstallableStateSourceXPCBehavior *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  q = self->_q;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke;
  block[3] = &unk_250FA3D00;
  v8 = v4;
  v9 = self;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(q, block);
  dispatch_async((dispatch_queue_t)self->_calloutQueue, (dispatch_block_t)v12[5]);

  _Block_object_dispose(&v11, 8);
}

void __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  _QWORD v28[5];
  _QWORD v29[6];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t v37[4];
  uint64_t v38;
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  _IPDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_23F108000, v2, OS_LOG_TYPE_DEFAULT, "registering progress source %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_queue_registerAsProgressObserverIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "installableStateSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "installableType") == 1;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "installableStateSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "launchServicesIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__8;
    v42 = __Block_byref_object_dispose__9;
    v43 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__8;
    v35 = __Block_byref_object_dispose__9;
    v36 = 0;
    v8 = MEMORY[0x24BDAC760];
    v9 = *(void **)(a1 + 40);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_10;
    v30[3] = &unk_250FA3EC8;
    v30[4] = &buf;
    objc_msgSend(v9, "_queue_syncProxyWithErrorHandler:", v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_2;
    v29[3] = &unk_250FA3EF0;
    v29[4] = &buf;
    v29[5] = &v31;
    objc_msgSend(v10, "getProgressForIdentity:completion:", v7, v29);

    v11 = (void *)v32[5];
    if (v11)
    {
      if (objc_msgSend(v11, "installPhase") != 6)
      {
        v25[0] = v8;
        v25[1] = 3221225472;
        v25[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_2_14;
        v25[3] = &unk_250FA3DC0;
        v26 = *(id *)(a1 + 32);
        v27 = &v31;
        v19 = MEMORY[0x242665E14](v25);
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

        _Block_object_dispose(&v31, 8);
        _Block_object_dispose(&buf, 8);

        _IPDefaultLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_23F108000, v22, OS_LOG_TYPE_DEFAULT, "really registering progress source", (uint8_t *)&buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "collationKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forKey:", v23, v7);
        }
        objc_msgSend(v23, "addObject:", *(_QWORD *)(a1 + 32));

        goto LABEL_18;
      }
      _IPClientLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v37 = 138412290;
        v38 = v13;
        _os_log_impl(&dword_23F108000, v12, OS_LOG_TYPE_DEFAULT, "current progress for %@ was complete on resumption; synthesizing end event and not registering",
          v37,
          0xCu);
      }

      v28[0] = v8;
      v28[1] = 3221225472;
      v28[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_13;
      v28[3] = &unk_250FA3EA0;
      v14 = v28;
      v28[4] = *(id *)(a1 + 32);
      v15 = MEMORY[0x242665E14](v28);
    }
    else
    {
      _IPClientLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_cold_1();

      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_15;
      v24[3] = &unk_250FA3EA0;
      v14 = v24;
      v24[4] = *(id *)(a1 + 32);
      v15 = MEMORY[0x242665E14](v24);
    }
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v15;

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&buf, 8);

LABEL_18:
  }
}

void __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_10(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithReason:", 1);
}

uint64_t __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_2_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyOfUpdate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithReason:", 2);
}

- (void)unregisterProgressSource:(id)a3
{
  id v4;
  NSObject *q;
  id v6;
  _QWORD block[4];
  id v8;
  IPGlobalInstallableStateSourceXPCBehavior *v9;

  v4 = a3;
  q = self->_q;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__IPGlobalInstallableStateSourceXPCBehavior_unregisterProgressSource___block_invoke;
  block[3] = &unk_250FA3B50;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(q, block);

}

void __70__IPGlobalInstallableStateSourceXPCBehavior_unregisterProgressSource___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _IPDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_23F108000, v2, OS_LOG_TYPE_DEFAULT, "unregistering progress source %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "collationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObjectForKey:", v4);

}

- (void)_queue_resumeStateStreamSourceIfNecessary
{
  NSObject *v3;
  IPStateUpdateStreamSource *stateStreamSource;
  int v5;
  IPStateUpdateStreamSource *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!self->_stateStreamSourceResumed)
  {
    _IPClientLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      stateStreamSource = self->_stateStreamSource;
      v5 = 138412290;
      v6 = stateStreamSource;
      _os_log_impl(&dword_23F108000, v3, OS_LOG_TYPE_DEFAULT, "resuming state stream source %@", (uint8_t *)&v5, 0xCu);
    }

    -[IPStateUpdateStreamSource resume](self->_stateStreamSource, "resume");
    self->_stateStreamSourceResumed = 1;
  }
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *q;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  q = self->_q;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__IPGlobalInstallableStateSourceXPCBehavior_addObserver___block_invoke;
  block[3] = &unk_250FA3B50;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(q, block);

}

uint64_t __57__IPGlobalInstallableStateSourceXPCBehavior_addObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resumeStateStreamSourceIfNecessary");
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *q;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  q = self->_q;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__IPGlobalInstallableStateSourceXPCBehavior_removeObserver___block_invoke;
  block[3] = &unk_250FA3B50;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(q, block);

}

uint64_t __60__IPGlobalInstallableStateSourceXPCBehavior_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_registerAsProgressObserverIfNecessary
{
  OUTLINED_FUNCTION_0_0(&dword_23F108000, a2, a3, "Could not register as progress observer! %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __89__IPGlobalInstallableStateSourceXPCBehavior__queue_registerAsProgressObserverIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_queue_connectedConnection
{
  NSXPCConnection *currentConnection;
  NSXPCConnection **p_currentConnection;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  p_currentConnection = &self->_currentConnection;
  currentConnection = self->_currentConnection;
  if (!currentConnection)
  {
    (*((void (**)(void))self->_connectionProvider + 2))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setQueue:", self->_q);
    IPClientExportedInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v6);

    objc_msgSend(v5, "setExportedObject:", self);
    IPServerExportedInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke;
    v13[3] = &unk_250FA3F18;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v5, "setInterruptionHandler:", v13);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_16;
    v11[3] = &unk_250FA3F18;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v5, "setInvalidationHandler:", v11);
    objc_storeStrong((id *)p_currentConnection, v5);
    -[NSXPCConnection resume](*p_currentConnection, "resume");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

    currentConnection = *p_currentConnection;
    if (!*p_currentConnection)
    {
      _IPClientLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[IPGlobalInstallableStateSourceXPCBehavior _queue_connectedConnection].cold.1(v9);

      currentConnection = *p_currentConnection;
    }
  }
  return currentConnection;
}

void __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *WeakRetained;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  _IPClientLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 72) = 0;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = WeakRetained[5];
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v11[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (v18)
          {
            _IPClientLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v20 = 0;
              _os_log_impl(&dword_23F108000, v19, OS_LOG_TYPE_DEFAULT, "someone is registered for progress, reconnecting...", v20, 2u);
            }

            objc_msgSend(v11, "_queue_registerAsProgressObserverIfNecessary");
            goto LABEL_16;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_16:

  }
}

void __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;

  _IPClientLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_16_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = 0;

  }
}

- (id)_queue_syncProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IPGlobalInstallableStateSourceXPCBehavior _queue_connectedConnection](self, "_queue_connectedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_queue_asyncProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IPGlobalInstallableStateSourceXPCBehavior _queue_connectedConnection](self, "_queue_connectedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_installableStateSourcesForStates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  IPAppStateSource *v12;
  void *v13;
  IPAppStateSource *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = [IPAppStateSource alloc];
        objc_msgSend(v11, "identity", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[IPAppStateSource initWithApplicationIdentity:forStateSourceRegistry:](v12, "initWithApplicationIdentity:forStateSourceRegistry:", v13, self);
        objc_msgSend(v5, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  return v15;
}

- (id)_queue_makeExtantStateSourcesForGlobalSource:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
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
  v23 = __Block_byref_object_copy__8;
  v24 = __Block_byref_object_dispose__9;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__9;
  v7 = MEMORY[0x24BDAC760];
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke;
  v13[3] = &unk_250FA3EC8;
  v13[4] = &v14;
  -[IPGlobalInstallableStateSourceXPCBehavior _queue_syncProxyWithErrorHandler:](self, "_queue_syncProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_19;
  v12[3] = &unk_250FA3F40;
  v12[5] = &v14;
  v12[6] = &v20;
  v12[4] = self;
  objc_msgSend(v8, "getAllInstallableStates:", v12);

  v9 = (void *)v21[5];
  if (a4 && !v9)
  {
    *a4 = objc_retainAutorelease((id)v15[5]);
    v9 = (void *)v21[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _IPClientLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_installableStateSourcesForStates:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    _IPClientLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_19_cold_1();

  }
}

- (id)_queue_makeInstallingStateSourcesForGlobalSource:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
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
  v23 = __Block_byref_object_copy__8;
  v24 = __Block_byref_object_dispose__9;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__9;
  v7 = MEMORY[0x24BDAC760];
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke;
  v13[3] = &unk_250FA3EC8;
  v13[4] = &v20;
  -[IPGlobalInstallableStateSourceXPCBehavior _queue_syncProxyWithErrorHandler:](self, "_queue_syncProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_21;
  v12[3] = &unk_250FA3F68;
  v12[4] = self;
  v12[5] = &v20;
  v12[6] = &v14;
  objc_msgSend(v8, "getActiveInstallations:", v12);

  v9 = (void *)v15[5];
  if (a4 && !v9)
  {
    *a4 = objc_retainAutorelease((id)v21[5]);
    v9 = (void *)v15[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _IPClientLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_21(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  IPAppStateSource *v15;
  void *v16;
  IPAppStateSource *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v24 = v6;
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v14, "isInstalling"))
          {
            v15 = [IPAppStateSource alloc];
            objc_msgSend(v14, "identity");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[IPAppStateSource initWithApplicationIdentity:forStateSourceRegistry:](v15, "initWithApplicationIdentity:forStateSourceRegistry:", v16, a1[4]);

            objc_msgSend(v8, "addObject:", v17);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

    v18 = objc_msgSend(v8, "copy");
    v19 = *(_QWORD *)(a1[6] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    v7 = v24;
  }
  else
  {
    _IPClientLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_21_cold_1();

    v22 = *(_QWORD *)(a1[5] + 8);
    v23 = v7;
    v8 = *(id *)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v23;
  }

}

- (void)makeInstallingStateSourcesForGlobalSource:(id)a3 andEnumerate:(id)a4
{
  id v6;
  id v7;
  NSObject *q;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__9;
  v23 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_q);
  q = self->_q;
  v9 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__IPGlobalInstallableStateSourceXPCBehavior_makeInstallingStateSourcesForGlobalSource_andEnumerate___block_invoke;
  block[3] = &unk_250FA3F90;
  v17 = &v18;
  block[4] = self;
  v10 = v6;
  v16 = v10;
  dispatch_sync(q, block);
  v11 = (void *)v19[5];
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __100__IPGlobalInstallableStateSourceXPCBehavior_makeInstallingStateSourcesForGlobalSource_andEnumerate___block_invoke_2;
  v13[3] = &unk_250FA3FB8;
  v12 = v7;
  v14 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

  _Block_object_dispose(&v18, 8);
}

void __100__IPGlobalInstallableStateSourceXPCBehavior_makeInstallingStateSourcesForGlobalSource_andEnumerate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_makeInstallingStateSourcesForGlobalSource:error:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __100__IPGlobalInstallableStateSourceXPCBehavior_makeInstallingStateSourcesForGlobalSource_andEnumerate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)makeExtantStateSourcesForGlobalSource:(id)a3 andEnumerate:(id)a4
{
  id v6;
  id v7;
  NSObject *q;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__9;
  v23 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_q);
  q = self->_q;
  v9 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__IPGlobalInstallableStateSourceXPCBehavior_makeExtantStateSourcesForGlobalSource_andEnumerate___block_invoke;
  block[3] = &unk_250FA3F90;
  v17 = &v18;
  block[4] = self;
  v10 = v6;
  v16 = v10;
  dispatch_sync(q, block);
  v11 = (void *)v19[5];
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __96__IPGlobalInstallableStateSourceXPCBehavior_makeExtantStateSourcesForGlobalSource_andEnumerate___block_invoke_2;
  v13[3] = &unk_250FA3FB8;
  v12 = v7;
  v14 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

  _Block_object_dispose(&v18, 8);
}

void __96__IPGlobalInstallableStateSourceXPCBehavior_makeExtantStateSourcesForGlobalSource_andEnumerate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_makeExtantStateSourcesForGlobalSource:error:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __96__IPGlobalInstallableStateSourceXPCBehavior_makeExtantStateSourcesForGlobalSource_andEnumerate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)currentProgressForIdentity:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *q;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
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
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__8;
  v31 = __Block_byref_object_dispose__9;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__8;
  v25 = __Block_byref_object_dispose__9;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  q = self->_q;
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke;
  block[3] = &unk_250FA3FE0;
  block[4] = self;
  block[5] = &v27;
  block[6] = &v21;
  dispatch_sync(q, block);
  v9 = (void *)v28[5];
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke_3;
  v13[3] = &unk_250FA3EF0;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v9, "getProgressForIdentity:completion:", v6, v13);
  v10 = (void *)v16[5];
  if (a4 && !v10)
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v10 = (void *)v16[5];
  }
  v11 = v10;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke_2;
  v6[3] = &unk_250FA3EC8;
  v6[4] = a1[6];
  objc_msgSend(v2, "_queue_syncProxyWithErrorHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)serverActionBarrierForTesting
{
  NSObject *q;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_q);
  q = self->_q;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__IPGlobalInstallableStateSourceXPCBehavior_serverActionBarrierForTesting__block_invoke;
  block[3] = &unk_250FA3EA0;
  block[4] = self;
  dispatch_sync(q, block);
}

void __74__IPGlobalInstallableStateSourceXPCBehavior_serverActionBarrierForTesting__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_queue_syncProxyWithErrorHandler:", &__block_literal_global_23);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "actionBarrier:", &__block_literal_global_23);

}

void __74__IPGlobalInstallableStateSourceXPCBehavior_serverActionBarrierForTesting__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _IPClientLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __74__IPGlobalInstallableStateSourceXPCBehavior_serverActionBarrierForTesting__block_invoke_2_cold_1();

  }
}

- (void)installableForIdentity:(id)a3 progressChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *calloutQueue;
  NSObject *v13;
  _QWORD block[4];
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  _IPClientLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_23F108000, v8, OS_LOG_TYPE_DEFAULT, "Installable for identity %@ progress changed to %@", buf, 0x16u);
  }

  -[NSMutableDictionary objectForKey:](self->_registeredProgressSources, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  if (objc_msgSend(v11, "count"))
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__IPGlobalInstallableStateSourceXPCBehavior_installableForIdentity_progressChanged___block_invoke;
    block[3] = &unk_250FA4048;
    v15 = v11;
    v16 = v7;
    v17 = v6;
    dispatch_async(calloutQueue, block);

    v13 = v15;
  }
  else
  {
    _IPClientLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_23F108000, v13, OS_LOG_TYPE_DEFAULT, "No observers to notify of progress to %@", buf, 0xCu);
    }
  }

}

void __84__IPGlobalInstallableStateSourceXPCBehavior_installableForIdentity_progressChanged___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "notifyOfUpdate:", *(_QWORD *)(a1 + 40), (_QWORD)v9);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v4);
  }

  _IPClientLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_23F108000, v7, OS_LOG_TYPE_DEFAULT, "Notified observers of update to %@", buf, 0xCu);
  }

}

- (void)installableForIdentity:(id)a3 progressEndedForReason:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *calloutQueue;
  NSObject *v11;
  _QWORD block[4];
  NSObject *v13;
  id v14;
  unint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  _IPClientLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2048;
    v19 = a4;
    _os_log_impl(&dword_23F108000, v7, OS_LOG_TYPE_DEFAULT, "Installable for identity %@ progress ended with reason %llu", buf, 0x16u);
  }

  -[NSMutableDictionary objectForKey:](self->_registeredProgressSources, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](self->_registeredProgressSources, "removeObjectForKey:", v6);
  if (objc_msgSend(v9, "count"))
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __91__IPGlobalInstallableStateSourceXPCBehavior_installableForIdentity_progressEndedForReason___block_invoke;
    block[3] = &unk_250FA4070;
    v13 = v9;
    v15 = a4;
    v14 = v6;
    dispatch_async(calloutQueue, block);

    v11 = v13;
  }
  else
  {
    _IPClientLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_23F108000, v11, OS_LOG_TYPE_DEFAULT, "No observers to notify of finish of %@", buf, 0xCu);
    }
  }

}

void __91__IPGlobalInstallableStateSourceXPCBehavior_installableForIdentity_progressEndedForReason___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "finishWithReason:", *(_QWORD *)(a1 + 48), (_QWORD)v9);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v4);
  }

  _IPClientLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_23F108000, v7, OS_LOG_TYPE_DEFAULT, "Notified observers of finish of %@", buf, 0xCu);
  }

}

- (void)_queue_noteInstallBeganForIdentity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *calloutQueue;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  _IPClientLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_23F108000, v5, OS_LOG_TYPE_DEFAULT, "Install began for %@", buf, 0xCu);
  }

  -[NSMutableDictionary objectForKey:](self->_registeredStateSources, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__IPGlobalInstallableStateSourceXPCBehavior__queue_noteInstallBeganForIdentity___block_invoke;
    block[3] = &unk_250FA3EA0;
    v10 = v7;
    dispatch_async(calloutQueue, block);

  }
}

void __80__IPGlobalInstallableStateSourceXPCBehavior__queue_noteInstallBeganForIdentity___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "noteInstallStarted", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_queue_sendStateSourceAvailableForIdentity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *calloutQueue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  IPGlobalInstallableStateSourceXPCBehavior *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  IPGlobalInstallableStateSourceXPCBehavior *v20;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  -[NSHashTable allObjects](self->_stateUpdateObservers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __88__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceAvailableForIdentity___block_invoke;
  v18[3] = &unk_250FA4098;
  v7 = v4;
  v19 = v7;
  v20 = self;
  v8 = (void *)MEMORY[0x242665E14](v18);
  calloutQueue = self->_calloutQueue;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __88__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceAvailableForIdentity___block_invoke_2;
  v13[3] = &unk_250FA40C0;
  v14 = v5;
  v15 = self;
  v16 = v7;
  v17 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v5;
  dispatch_async(calloutQueue, v13);

}

IPAppStateSource *__88__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceAvailableForIdentity___block_invoke(uint64_t a1)
{
  return -[IPAppStateSource initWithApplicationIdentity:forStateSourceRegistry:]([IPAppStateSource alloc], "initWithApplicationIdentity:forStateSourceRegistry:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __88__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceAvailableForIdentity___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "globalStateSourceBehavior:stateSourceAvailableForIdentity:withGenerator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_queue_sendStateSourceUnavailableForIdentity:(id)a3
{
  NSObject *q;
  id v5;
  void *v6;
  void *v7;
  NSObject *calloutQueue;
  id v9;
  _QWORD block[4];
  id v11;

  q = self->_q;
  v5 = a3;
  dispatch_assert_queue_V2(q);
  -[NSMutableDictionary objectForKey:](self->_registeredStateSources, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](self->_registeredStateSources, "removeObjectForKey:", v5);
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceUnavailableForIdentity___block_invoke;
  block[3] = &unk_250FA3EA0;
  v11 = v7;
  v9 = v7;
  dispatch_async(calloutQueue, block);

}

void __90__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceUnavailableForIdentity___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "noteRemoved", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)stateUpdateStreamSource:(id)a3 updateMessageReceived:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _IPClientLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_23F108000, v6, OS_LOG_TYPE_DEFAULT, "received update message %@", (uint8_t *)&v11, 0xCu);
  }

  v7 = objc_msgSend(v5, "type");
  switch(v7)
  {
    case 4:
      objc_msgSend(v5, "identity");
      v9 = objc_claimAutoreleasedReturnValue();
      -[IPGlobalInstallableStateSourceXPCBehavior _queue_sendStateSourceUnavailableForIdentity:](self, "_queue_sendStateSourceUnavailableForIdentity:", v9);
      goto LABEL_11;
    case 3:
      goto LABEL_7;
    case 1:
      objc_msgSend(v5, "identity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPGlobalInstallableStateSourceXPCBehavior _queue_noteInstallBeganForIdentity:](self, "_queue_noteInstallBeganForIdentity:", v8);

LABEL_7:
      objc_msgSend(v5, "identity");
      v9 = objc_claimAutoreleasedReturnValue();
      -[IPGlobalInstallableStateSourceXPCBehavior _queue_sendStateSourceAvailableForIdentity:](self, "_queue_sendStateSourceAvailableForIdentity:", v9);
      goto LABEL_11;
  }
  _IPClientLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v5, "type");
    v11 = 67109120;
    LODWORD(v12) = v10;
    _os_log_impl(&dword_23F108000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring update message of type %u for now", (uint8_t *)&v11, 8u);
  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_stateUpdateObservers, 0);
  objc_storeStrong((id *)&self->_registeredProgressSources, 0);
  objc_storeStrong((id *)&self->_registeredStateSources, 0);
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong(&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_stateStreamSource, 0);
}

void __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_23F108000, v0, v1, "Could not fetch installable state source current state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_23F108000, v1, OS_LOG_TYPE_ERROR, "could not fetch progress data for %@, synthesizing cancel event: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_connectedConnection
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_23F108000, log, OS_LOG_TYPE_FAULT, "connection provider returned nil!", v1, 2u);
  OUTLINED_FUNCTION_2();
}

void __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23F108000, a1, a3, "connection to InstallProgress server interrupted.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_16_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_23F108000, a1, a3, "connection to InstallProgress server invalidated!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_23F108000, v0, v1, "could not fetch all state sources: connection error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_23F108000, v0, v1, "couldn't get installable states: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_23F108000, v0, v1, "could not fetch state sources: connection error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_23F108000, v0, v1, "could not get state sources: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __74__IPGlobalInstallableStateSourceXPCBehavior_serverActionBarrierForTesting__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_23F108000, v0, v1, "server action barrier failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
