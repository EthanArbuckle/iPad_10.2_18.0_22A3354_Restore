@implementation MSNPillDataSourceServer

- (MSNPillDataSourceServer)initWithQueue:(id)a3
{
  id v5;
  MSNPillDataSourceServer *v6;
  uint64_t v7;
  NSMutableArray *activeDataSources;
  NSObject *queue;
  _QWORD block[4];
  MSNPillDataSourceServer *v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSNPillDataSourceServer;
  v6 = -[MSNPillDataSourceServer init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    activeDataSources = v6->_activeDataSources;
    v6->_activeDataSources = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_queue, a3);
    queue = v6->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__MSNPillDataSourceServer_initWithQueue___block_invoke;
    block[3] = &unk_1E9775FF8;
    v12 = v6;
    dispatch_sync(queue, block);

  }
  return v6;
}

void __41__MSNPillDataSourceServer_initWithQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v2 = (void *)getSTDynamicActivityAttributionMonitorClass_softClass;
  v30 = getSTDynamicActivityAttributionMonitorClass_softClass;
  v3 = MEMORY[0x1E0C809B0];
  if (!getSTDynamicActivityAttributionMonitorClass_softClass)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __getSTDynamicActivityAttributionMonitorClass_block_invoke;
    v25 = &unk_1E9776098;
    v26 = &v27;
    __getSTDynamicActivityAttributionMonitorClass_block_invoke((uint64_t)&v22);
    v2 = (void *)v28[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v27, 8);
  v5 = objc_alloc_init(v4);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "activate");
  objc_initWeak(&location, *(id *)(a1 + 32));
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v8 = (void *)getSTCallingStatusDomainClass_softClass;
  v30 = getSTCallingStatusDomainClass_softClass;
  if (!getSTCallingStatusDomainClass_softClass)
  {
    v22 = v3;
    v23 = 3221225472;
    v24 = __getSTCallingStatusDomainClass_block_invoke;
    v25 = &unk_1E9776098;
    v26 = &v27;
    __getSTCallingStatusDomainClass_block_invoke((uint64_t)&v22);
    v8 = (void *)v28[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v27, 8);
  v10 = objc_alloc_init(v9);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __41__MSNPillDataSourceServer_initWithQueue___block_invoke_2;
  v19[3] = &unk_1E9775FD0;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v13, "observeDataWithBlock:", v19);
  v14 = *(id **)(a1 + 32);
  objc_msgSend(v14[5], "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_callingDataUpdatedWithData:", v15);

  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.mediasafetynet.pill"));
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 24);
  *(_QWORD *)(v17 + 24) = v16;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resume");
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __41__MSNPillDataSourceServer_initWithQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__MSNPillDataSourceServer_initWithQueue___block_invoke_3;
  v8[3] = &unk_1E9775FA8;
  v9 = WeakRetained;
  v10 = v3;
  v6 = v3;
  v7 = WeakRetained;
  dispatch_async(v5, v8);

}

uint64_t __41__MSNPillDataSourceServer_initWithQueue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callingDataUpdatedWithData:", *(_QWORD *)(a1 + 40));
}

- (void)_callingDataUpdatedWithData:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[MSNPillDataSourceServer queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[MSNPillDataSourceServer setCallingData:](self, "setCallingData:", v5);
}

- (void)dealloc
{
  objc_super v3;

  -[STDynamicActivityAttributionMonitor invalidate](self->_systemStatusDynamicAttributionMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MSNPillDataSourceServer;
  -[MSNPillDataSourceServer dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldQueryPillDataSource
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[MSNPillDataSourceServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MSNPillDataSourceServer systemStatusDynamicAttributionMonitor](self, "systemStatusDynamicAttributionMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAttributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[MSNPillDataSourceServer activeDataSources](self, "activeDataSources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)fetchPillRegistrationForProcess:(id)a3 withCompletion:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  __int128 v31;
  id v32;
  void (**v33)(id, _QWORD);
  MSNPillDataSourceServer *v34;
  _QWORD block[4];
  void (**v36)(id, _QWORD);
  uint64_t *v37;
  _QWORD v38[5];
  NSObject *v39;
  uint64_t *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  int v52;
  uint8_t buf[4];
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v33 = (void (**)(id, _QWORD))a4;
  v34 = self;
  -[MSNPillDataSourceServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  -[MSNPillDataSourceServer activeDataSources](self, "activeDataSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v7, "count") == 0;

  if ((_DWORD)self)
  {
    MSNLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[MSNPillDataSourceServer fetchPillRegistrationForProcess:withCompletion:].cold.1(v30);

    v33[2](v33, *((unsigned int *)v50 + 6));
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[MSNPillDataSourceServer systemStatusDynamicAttributionMonitor](v34, "systemStatusDynamicAttributionMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentAttributions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v46;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v12);
        objc_msgSend(v13, "clientExecutablePath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v32);

        if ((v16 & 1) != 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v17 = v13;

      if (!v17)
        goto LABEL_25;
      v18 = dispatch_group_create();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[MSNPillDataSourceServer activeDataSources](v34, "activeDataSources");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      if (v20)
      {
        v22 = *(_QWORD *)v42;
        *(_QWORD *)&v21 = 138412290;
        v31 = v21;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v42 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "connection", v31);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "remoteObjectProxy");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              dispatch_group_enter(v18);
              objc_msgSend(v17, "bundleIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v38[0] = MEMORY[0x1E0C809B0];
              v38[1] = 3221225472;
              v38[2] = __74__MSNPillDataSourceServer_fetchPillRegistrationForProcess_withCompletion___block_invoke;
              v38[3] = &unk_1E9776020;
              v38[4] = v34;
              v40 = &v49;
              v39 = v18;
              objc_msgSend(v25, "currentStatusDescriptorForIdentifier:reply:", v26, v38);

            }
            else
            {
              *((_DWORD *)v50 + 6) = 1;
              MSNLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v31;
                v54 = v32;
                _os_log_debug_impl(&dword_1D416F000, v27, OS_LOG_TYPE_DEBUG, "Dont have data source tracking the attribution for client: %@", buf, 0xCu);
              }

              v33[2](v33, *((unsigned int *)v50 + 6));
            }

          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
        }
        while (v20);
      }

      -[MSNPillDataSourceServer queue](v34, "queue");
      v28 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__MSNPillDataSourceServer_fetchPillRegistrationForProcess_withCompletion___block_invoke_26;
      block[3] = &unk_1E9776048;
      v36 = v33;
      v37 = &v49;
      dispatch_group_notify(v18, v28, block);

    }
    else
    {
LABEL_10:

LABEL_25:
      MSNLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[MSNPillDataSourceServer fetchPillRegistrationForProcess:withCompletion:].cold.2((uint64_t)v32, v29);

      v33[2](v33, *((unsigned int *)v50 + 6));
    }
  }
  _Block_object_dispose(&v49, 8);

}

void __74__MSNPillDataSourceServer_fetchPillRegistrationForProcess_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "callingData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "callDescriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (v7)
      v8 = 2;
    else
      v8 = 3;

  }
  else
  {
    v8 = 3;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __74__MSNPillDataSourceServer_fetchPillRegistrationForProcess_withCompletion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  MSNPillDataSourceServer *v18;
  id v19;

  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.mediasafetynet.pilldatasource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFE39808);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFE3A498);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v9);

    objc_msgSend(v5, "setExportedObject:", self);
    -[MSNPillDataSourceServer queue](self, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setQueue:", v10);

    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __62__MSNPillDataSourceServer_listener_shouldAcceptNewConnection___block_invoke;
    v17 = &unk_1E9775FA8;
    v18 = self;
    v11 = v5;
    v19 = v11;
    v12 = (void *)MEMORY[0x1D8258FB0](&v14);
    objc_msgSend(v11, "setInterruptionHandler:", v12, v14, v15, v16, v17, v18);
    objc_msgSend(v11, "setInvalidationHandler:", v12);
    objc_msgSend(v11, "resume");

  }
  return v7;
}

void __62__MSNPillDataSourceServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  MSNLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D416F000, v2, OS_LOG_TYPE_DEFAULT, "Connection gone.", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__MSNPillDataSourceServer_listener_shouldAcceptNewConnection___block_invoke_37;
  v6[3] = &unk_1E9775FA8;
  v6[4] = v3;
  v7 = v4;
  dispatch_async(v5, v6);

}

void __62__MSNPillDataSourceServer_listener_shouldAcceptNewConnection___block_invoke_37(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "connection", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);

        if (v9 == v10)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v12 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v11, "removeObjectsInArray:", v12);

}

- (void)registerPillDataSourceForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  MSNPillDataSourceServer *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSNPillDataSourceServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MSNPillDataSourceServer_registerPillDataSourceForIdentifiers___block_invoke;
  block[3] = &unk_1E9776070;
  v10 = v5;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __64__MSNPillDataSourceServer_registerPillDataSourceForIdentifiers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  MSNPillDataSource *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MSNLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D416F000, v2, OS_LOG_TYPE_DEFAULT, "Current connection (%@) registering with identifiers: %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "activeDataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MSNPillDataSource initWithConnection:identifiers:]([MSNPillDataSource alloc], "initWithConnection:identifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "addObject:", v6);

}

- (NSMutableArray)activeDataSources
{
  return self->_activeDataSources;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (STDynamicActivityAttributionMonitor)systemStatusDynamicAttributionMonitor
{
  return self->_systemStatusDynamicAttributionMonitor;
}

- (STCallingStatusDomain)callingDomain
{
  return self->_callingDomain;
}

- (void)setCallingDomain:(id)a3
{
  objc_storeStrong((id *)&self->_callingDomain, a3);
}

- (STCallingStatusDomainData)callingData
{
  return self->_callingData;
}

- (void)setCallingData:(id)a3
{
  objc_storeStrong((id *)&self->_callingData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callingData, 0);
  objc_storeStrong((id *)&self->_callingDomain, 0);
  objc_storeStrong((id *)&self->_systemStatusDynamicAttributionMonitor, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeDataSources, 0);
}

- (void)fetchPillRegistrationForProcess:(os_log_t)log withCompletion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D416F000, log, OS_LOG_TYPE_DEBUG, "Dont have any data sources registered", v1, 2u);
}

- (void)fetchPillRegistrationForProcess:(uint64_t)a1 withCompletion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D416F000, a2, OS_LOG_TYPE_DEBUG, "Dont have matching attribution for client: %@", (uint8_t *)&v2, 0xCu);
}

@end
