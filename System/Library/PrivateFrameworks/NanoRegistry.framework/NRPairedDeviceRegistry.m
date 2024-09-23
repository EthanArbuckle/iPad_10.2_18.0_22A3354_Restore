@implementation NRPairedDeviceRegistry

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NRPairedDeviceRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE23828 != -1)
    dispatch_once(&qword_1ECE23828, block);
  return (id)qword_1ECE23820;
}

- (id)getAllDevicesWithArchivedDevicesMatching:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
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
  v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__NRPairedDeviceRegistry_getAllDevicesWithArchivedDevicesMatching___block_invoke;
  v8[3] = &unk_1E4496388;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NRPairedDeviceRegistry getDevicesWithBlock:](self, "getDevicesWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  unint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(a2, "copy");
  v7 = (void *)objc_msgSend(v5, "copy");

  v8 = (void *)a1[5];
  v9 = *(NSObject **)(a1[4] + 160);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke_3;
  v18[3] = &unk_1E44960A0;
  v22 = v8;
  v10 = v6;
  v19 = v10;
  v11 = v7;
  v12 = a1[4];
  v20 = v11;
  v21 = v12;
  v13 = a1[7];
  v23 = a1[6];
  v24 = v13;
  dispatch_sync(v9, v18);
  if (*(double *)(*(_QWORD *)(a1[6] + 8) + 24) > 9.0)
  {
    nr_daemon_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      nr_daemon_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (unint64_t)*(double *)(*(_QWORD *)(a1[6] + 8) + 24);
        *(_DWORD *)buf = 134217984;
        v26 = v17;
        _os_log_impl(&dword_1A0BDB000, v16, OS_LOG_TYPE_DEFAULT, "client was blocked on threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock for %lu milliseconds", buf, 0xCu);
      }

    }
  }

}

void __46__NRPairedDeviceRegistry_getDevicesWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "allValues");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "logCallFrequency");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke_2;
  v6[3] = &unk_1E44960C8;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  objc_msgSend(v7, "syncGrabRegistryWithReadBlock:", v6);

}

- (void)threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:(id)a3
{
  id v4;
  __uint64_t v5;
  NSObject *v6;
  NSObject *pairedRegistryGetDevicesQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  __uint64_t v12;
  _QWORD v13[4];

  v4 = a3;
  v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  -[NRRegistry managementQueue](self, "managementQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_pairedDeviceRegistryDeviceListQueue);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_pairedRegistryGetDevicesQueue);
  pairedRegistryGetDevicesQueue = self->_pairedRegistryGetDevicesQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke;
  v9[3] = &unk_1E44960F0;
  v9[4] = self;
  v10 = v4;
  v11 = v13;
  v12 = v5;
  v8 = v4;
  dispatch_sync(pairedRegistryGetDevicesQueue, v9);

  _Block_object_dispose(v13, 8);
}

- (void)logCallFrequency
{
  unint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = self->_callCount + 1;
  self->_callCount = v2;
  if (__ROR8__(0x1CAC083126E978D5 * v2, 1) <= 0x10624DD2F1A9FBEuLL)
  {
    nr_framework_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      nr_framework_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_error_impl(&dword_1A0BDB000, v5, OS_LOG_TYPE_ERROR, "NanoRegistry APIs called 250 times", v6, 2u);
      }

    }
  }
}

- (NRPairedDeviceRegistry)initWithBoost:(BOOL)a3 disconnected:(BOOL)a4
{
  id v5;
  NRCallbackArray *v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  dispatch_queue_t v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id buf[2];
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NRPairedDeviceRegistry;
  v5 = -[NRRegistry init](&v24, sel_init, a3);
  if (v5)
  {
    v6 = objc_alloc_init(NRCallbackArray);
    v7 = (void *)*((_QWORD *)v5 + 23);
    *((_QWORD *)v5 + 23) = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.nanoregistry.registry.deviceListQueue", v8);
    v10 = (void *)*((_QWORD *)v5 + 20);
    *((_QWORD *)v5 + 20) = v9;

    v11 = dispatch_queue_create("com.apple.nanoregistry.getDevicesQueue", v8);
    v12 = (void *)*((_QWORD *)v5 + 21);
    *((_QWORD *)v5 + 21) = v11;

    nr_framework_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      nr_framework_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A0BDB000, v15, OS_LOG_TYPE_DEFAULT, "Suspending registry operation queue.", (uint8_t *)buf, 2u);
      }

    }
    dispatch_suspend(*((dispatch_object_t *)v5 + 21));
    objc_initWeak(buf, v5);
    *((_BYTE *)v5 + 144) = a4;
    v16 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke;
    v21[3] = &unk_1E44961B0;
    objc_copyWeak(&v22, buf);
    v17 = (id)objc_msgSend(v5, "addDiffIndexObserverWithWriteBlock:", v21);
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_3;
    v19[3] = &unk_1E44961D8;
    v20 = v5;
    objc_msgSend(v20, "syncGrabRegistryWithReadBlock:", v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(buf);

  }
  return (NRPairedDeviceRegistry *)v5;
}

- (id)getPairedDevices
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "pairedDevicesSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry getDevicesMatching:](self, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)pairedDevicesSelectorBlock
{
  return &__block_literal_global_249;
}

- (void)pairingStorePathPairingID:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, void *, void *))a3;
  -[NRPairedDeviceRegistry getActivePairedDevice](self, "getActivePairedDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localPairingDataStorePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, v6);

}

- (id)getActivePairedDeviceExcludingAltAccount
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "activePairedDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry getDevicesMatching:](self, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)altAccountPairingStorePathPairingID:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void (**)(id, void *, void *))a3;
  +[NRPairedDeviceRegistry activeDeviceSelectorBlock](NRPairedDeviceRegistry, "activeDeviceSelectorBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry getAllDevicesWithArchivedAltAccountDevicesMatching:](self, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("localPairingDataStorePath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pairingID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7, v8);

}

+ (id)activeDeviceSelectorBlock
{
  return &__block_literal_global_248;
}

- (id)getDevicesMatching:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
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
  v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__NRPairedDeviceRegistry_getDevicesMatching___block_invoke;
  v8[3] = &unk_1E4496388;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NRPairedDeviceRegistry getDevicesWithBlock:](self, "getDevicesWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)getAllDevicesWithArchivedAltAccountDevicesMatching:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
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
  v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__NRPairedDeviceRegistry_getAllDevicesWithArchivedAltAccountDevicesMatching___block_invoke;
  v8[3] = &unk_1E4496388;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NRPairedDeviceRegistry getDevicesWithBlock:](self, "getDevicesWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)getDevicesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v4 = (void (**)(id, _QWORD))a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__NRPairedDeviceRegistry_getDevicesWithBlock___block_invoke;
  v5[3] = &unk_1E44962A0;
  v5[4] = &v6;
  -[NRPairedDeviceRegistry threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:](self, "threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:", v5);
  v4[2](v4, v7[5]);
  _Block_object_dispose(&v6, 8);

}

void __77__NRPairedDeviceRegistry_getAllDevicesWithArchivedAltAccountDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __45__NRPairedDeviceRegistry_getDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(v7, "valueForProperty:", CFSTR("isArchived"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "BOOLValue"))
          goto LABEL_9;
        objc_msgSend(v7, "valueForProperty:", CFSTR("isAltAccount"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "BOOLValue"))
        {

LABEL_9:
          goto LABEL_10;
        }
        v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        if (v10)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);
LABEL_10:
        ++v6;
      }
      while (v4 != v6);
      v11 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v4 = v11;
    }
    while (v11);
  }

}

+ (id)activePairedDeviceSelectorBlock
{
  return &__block_literal_global_250;
}

void __35__NRPairedDeviceRegistry_pairingID__block_invoke(uint64_t a1, void *a2, void *a3)
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

void __67__NRPairedDeviceRegistry_getAllDevicesWithArchivedDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
        {
          objc_msgSend(v8, "valueForProperty:", CFSTR("isAltAccount"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "BOOLValue");

          if ((v10 & 1) == 0)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __42__NRPairedDeviceRegistry_pairingStorePath__block_invoke(uint64_t a1, void *a2, void *a3)
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

+ (Class)proxyClass
{
  return (Class)objc_opt_class();
}

- (unsigned)compatibilityState
{
  unsigned __int16 v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  __int16 v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__NRPairedDeviceRegistry_compatibilityState__block_invoke;
    v5[3] = &unk_1E4496228;
    v5[4] = self;
    v5[5] = &v6;
    -[NRRegistryClient syncGrabRegistryWithReadBlock:](self, "syncGrabRegistryWithReadBlock:", v5);
  }
  v3 = *((_WORD *)v7 + 12);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)status
{
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (-[NRPairedDeviceRegistry supportsWatch](self, "supportsWatch"))
  {
    v7[3] = 2;
    if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __32__NRPairedDeviceRegistry_status__block_invoke;
      v5[3] = &unk_1E4496228;
      v5[4] = self;
      v5[5] = &v6;
      -[NRRegistryClient syncGrabRegistryWithReadBlock:](self, "syncGrabRegistryWithReadBlock:", v5);
    }
  }
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  _QWORD *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = objc_msgSend(v5, "_getStatusWithCollection:", v7);
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 146) = -[NRPairedDeviceRegistry _getCompatibilityStateWithCollection:](*(void **)(a1 + 32), v7);
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = (void *)objc_msgSend(v6, "copy");
  nr_framework_log();
  v10 = objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v7)
  {
    nr_framework_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(v12 + 176);
      LODWORD(v12) = *(unsigned __int16 *)(v12 + 146);
      *(_DWORD *)buf = 136446722;
      v23 = "-[NRPairedDeviceRegistry initWithBoost:disconnected:]_block_invoke_3";
      v24 = 2048;
      v25 = v13;
      v26 = 1024;
      v27 = v12;
      _os_log_impl(&dword_1A0BDB000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: status(%lu) compatibilityState (%u)", buf, 0x1Cu);
    }

  }
  v14 = *(_QWORD **)(a1 + 32);
  v15 = v14[20];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_234;
  block[3] = &unk_1E4495008;
  v19 = v14;
  v20 = v8;
  v21 = v9;
  v16 = v9;
  v17 = v8;
  dispatch_async(v15, block);

}

- (unint64_t)_getStatusWithCollection:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!-[NRPairedDeviceRegistry supportsWatch](self, "supportsWatch"))
  {
    v5 = 0;
    goto LABEL_14;
  }
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    objc_msgSend(v4, "activeDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((objc_msgSend(v6, "isArchived") & 1) == 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("statusCode"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v9, "integerValue");

LABEL_13:
        goto LABEL_14;
      }
    }
    else if (objc_msgSend(v4, "paired"))
    {
      if (objc_msgSend(v4, "allAltAccount"))
        v5 = 2;
      else
        v5 = 3;
      goto LABEL_13;
    }
    v5 = 2;
    goto LABEL_13;
  }
  v5 = 2;
LABEL_14:

  return v5;
}

- (uint64_t)_getCompatibilityStateWithCollection:(void *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int16 v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (a1
    && (objc_msgSend(a1, "daemonIdle") & 1) == 0
    && (objc_msgSend(v3, "activeDeviceID"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isArchived") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("compatibilityState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "integerValue");

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)supportsWatch
{
  objc_super v3;

  if (self->_disconnected)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)NRPairedDeviceRegistry;
  return -[NRRegistry supportsWatch](&v3, sel_supportsWatch);
}

void __40__NRPairedDeviceRegistry_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECE23820;
  qword_1ECE23820 = (uint64_t)v1;

}

- (NRPairedDeviceRegistry)init
{
  return -[NRPairedDeviceRegistry initWithBoost:](self, "initWithBoost:", objc_msgSend((id)objc_opt_class(), "shouldBoostProcess"));
}

- (NRPairedDeviceRegistry)initWithBoost:(BOOL)a3
{
  return -[NRPairedDeviceRegistry initWithBoost:disconnected:](self, "initWithBoost:disconnected:", a3, 0);
}

+ (BOOL)shouldBoostProcess
{
  pid_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _BYTE buffer[4096];
  uint64_t v19;

  MEMORY[0x1E0C80A78](a1, a2);
  v19 = *MEMORY[0x1E0C80C00];
  v2 = getpid();
  if (proc_pidpath(v2, buffer, 0x1000u) < 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v5 = CFSTR("(unknown)");
  if (v4)
    v5 = v4;
  v6 = v5;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(&unk_1E44A55D8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(&unk_1E44A55D8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isEqualToString:", v6) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_16;
        }
      }
      v8 = objc_msgSend(&unk_1E44A55D8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_16:

  return v11;
}

void __56__NRPairedDeviceRegistry_sendDevicesUpdatedNotification__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("NRPairedDeviceRegistryDevicesDidUpdateNotification"), *(_QWORD *)(a1 + 32), 0);

}

void __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[6];
  if (!v3)
    v3 = a1[7];
  v4 = v2;
  objc_msgSend(v2, "postNotificationName:object:userInfo:", a1[4], a1[5], v3);

}

- (id)getAllDevices
{
  return -[NRPairedDeviceRegistry getDevicesMatching:](self, "getDevicesMatching:", &__block_literal_global_246);
}

- (BOOL)isPaired
{
  void *v2;
  BOOL v3;

  -[NRPairedDeviceRegistry getPairedDevices](self, "getPairedDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)sendDevicesUpdatedNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__NRPairedDeviceRegistry_sendDevicesUpdatedNotification__block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_postNotification:(void *)a3 forDeviceID:(void *)a4 withUserInfo:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (v8)
    {
      v10 = *(NSObject **)(a1 + 168);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke;
      block[3] = &unk_1E4496250;
      block[4] = a1;
      v17 = v8;
      v18 = v9;
      v19 = v7;
      dispatch_async(v10, block);

      v11 = v17;
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke_3;
      v12[3] = &unk_1E4495008;
      v13 = v7;
      v14 = a1;
      v15 = v9;
      dispatch_async(MEMORY[0x1E0C80D38], v12);

      v11 = v13;
    }

  }
}

- (id)pairingStorePath
{
  id v2;
  _QWORD v4[6];
  _QWORD v5[5];
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__2;
  v5[4] = __Block_byref_object_dispose__2;
  v6 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__NRPairedDeviceRegistry_pairingStorePath__block_invoke;
  v4[3] = &unk_1E4496540;
  v4[4] = &v7;
  v4[5] = v5;
  -[NRPairedDeviceRegistry pairingStorePathPairingID:](self, "pairingStorePathPairingID:", v4);
  v2 = (id)v8[5];
  _Block_object_dispose(v5, 8);

  _Block_object_dispose(&v7, 8);
  return v2;
}

- (id)pairingID
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  _QWORD v11[5];
  id v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  v11[4] = __Block_byref_object_dispose__2;
  v12 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__NRPairedDeviceRegistry_pairingID__block_invoke;
  v4[3] = &unk_1E4496540;
  v4[4] = v11;
  v4[5] = &v5;
  -[NRPairedDeviceRegistry pairingStorePathPairingID:](self, "pairingStorePathPairingID:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(v11, 8);
  return v2;
}

- (BOOL)pairedDeviceCountIsLessThanMaxTinkerPairedDevices
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NRPairedDeviceRegistry _mostlyTinkerPairedDevices](self, "_mostlyTinkerPairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = -[NRPairedDeviceRegistry maxTinkerPairedDeviceCount](self, "maxTinkerPairedDeviceCount");
  nr_framework_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    nr_framework_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = v4;
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_1A0BDB000, v8, OS_LOG_TYPE_DEFAULT, "TinkerPairedDevices check: paired %lu vs. limit %ld", (uint8_t *)&v10, 0x16u);
    }

  }
  return v4 < v5;
}

- (int64_t)maxTinkerPairedDeviceCount
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  numberFromCFPrefs(CFSTR("maxTinkerPairedDeviceCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "integerValue");
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      nr_framework_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = v4;
        _os_log_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_DEFAULT, "Overriding maxTinkerPairedDeviceCount to %ld", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

- (void)retriggerUnpairInfoDialog
{
  void *v2;
  id v3;

  -[NRRegistryClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_264);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcRetriggerUnpairInfoDialogWithBlock:", &__block_literal_global_265);

}

double __97__NRPairedDeviceRegistry_threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock___block_invoke_3(_QWORD *a1)
{
  double result;

  (*(void (**)(void))(a1[7] + 16))();
  result = (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - a1[9]) / 1000000.0;
  *(double *)(*(_QWORD *)(a1[8] + 8) + 24) = result;
  return result;
}

- (int64_t)maxAllPairedDeviceCount
{
  void *v3;
  void *v4;
  int64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int64_t v9;
  int v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  numberFromCFPrefs(CFSTR("maxAllPairedDeviceCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    nr_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      nr_framework_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134217984;
        v12 = v5;
        _os_log_impl(&dword_1A0BDB000, v8, OS_LOG_TYPE_DEFAULT, "Overriding maxAllPairedDeviceCount to %ld", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  else
  {
    v9 = -[NRPairedDeviceRegistry maxClassicPairedDeviceCount](self, "maxClassicPairedDeviceCount");
    v5 = -[NRPairedDeviceRegistry maxTinkerPairedDeviceCount](self, "maxTinkerPairedDeviceCount") + v9;
  }

  return v5;
}

- (int64_t)maxClassicPairedDeviceCount
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  numberFromCFPrefs(CFSTR("maxClassicPairedDeviceCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "integerValue");
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      nr_framework_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = v4;
        _os_log_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_DEFAULT, "Overriding maxClassicPairedDeviceCount to %ld", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

- (BOOL)watchNeedsGraduation
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NRRegistryClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__NRPairedDeviceRegistry_watchNeedsGraduation__block_invoke;
  v5[3] = &unk_1E4496118;
  v5[4] = &v6;
  objc_msgSend(v3, "xpcWatchNeedsGraduation:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __46__NRPairedDeviceRegistry_watchNeedsGraduation__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)clearWatchNeedsGraduation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[NRRegistryClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__NRPairedDeviceRegistry_clearWatchNeedsGraduation___block_invoke;
  v8[3] = &unk_1E4494E08;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "xpcClearWatchNeedsGraduation:", v8);

}

uint64_t __52__NRPairedDeviceRegistry_clearWatchNeedsGraduation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setWatchNeedsGraduation:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  nr_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    nr_framework_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_DEFAULT, "setWatchNeedsGraduation", buf, 2u);
    }

  }
  -[NRRegistryClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__NRPairedDeviceRegistry_setWatchNeedsGraduation___block_invoke;
  v11[3] = &unk_1E4494E08;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "xpcSetWatchNeedsGraduation:", v11);

}

uint64_t __50__NRPairedDeviceRegistry_setWatchNeedsGraduation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_mostlyClassicPairedDevices
{
  void *v2;
  void *v3;

  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __53__NRPairedDeviceRegistry__mostlyClassicPairedDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "valueForProperty:", CFSTR("isArchived"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", CFSTR("isPaired"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", CFSTR("isAltAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "BOOLValue") && (objc_msgSend(v5, "BOOLValue") & 1) == 0)
    v6 = objc_msgSend(v3, "BOOLValue") ^ 1;
  else
    v6 = 0;

  return v6;
}

- (id)_mostlyTinkerPairedDevices
{
  void *v2;
  void *v3;

  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", &__block_literal_global_215);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __52__NRPairedDeviceRegistry__mostlyTinkerPairedDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "valueForProperty:", CFSTR("isArchived"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", CFSTR("isPaired"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", CFSTR("isAltAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "BOOLValue") && (objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v6 = 1;
  }
  else if (objc_msgSend(v3, "BOOLValue"))
  {
    v6 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)pairedDeviceCountIsLessThanMaxAllPairedDevices
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NRPairedDeviceRegistry _mostlyClassicPairedDevices](self, "_mostlyClassicPairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[NRPairedDeviceRegistry _mostlyTinkerPairedDevices](self, "_mostlyTinkerPairedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = -[NRPairedDeviceRegistry maxAllPairedDeviceCount](self, "maxAllPairedDeviceCount");
  nr_framework_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    nr_framework_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218496;
      v13 = v4;
      v14 = 2048;
      v15 = v6;
      v16 = 2048;
      v17 = v7;
      _os_log_impl(&dword_1A0BDB000, v10, OS_LOG_TYPE_DEFAULT, "AllPairedDevices check: Classic paired %lu + Tinker paired %lu vs. limit %ld", (uint8_t *)&v12, 0x20u);
    }

  }
  return v6 + v4 < v7;
}

- (BOOL)pairedDeviceCountIsLessThanMaxClassicPairedDevices
{
  void *v3;
  unint64_t v4;
  int64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v10;
  unint64_t v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NRPairedDeviceRegistry _mostlyClassicPairedDevices](self, "_mostlyClassicPairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = -[NRPairedDeviceRegistry maxClassicPairedDeviceCount](self, "maxClassicPairedDeviceCount");
  nr_framework_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    nr_framework_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = v4;
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_1A0BDB000, v8, OS_LOG_TYPE_DEFAULT, "ClassicPairedDevices check: paired %lu vs. limit %ld", (uint8_t *)&v10, 0x16u);
    }

  }
  return v4 < -[NRPairedDeviceRegistry maxClassicPairedDeviceCount](self, "maxClassicPairedDeviceCount");
}

- (BOOL)canPairAnotherClassic
{
  _BOOL4 v3;

  v3 = -[NRPairedDeviceRegistry pairedDeviceCountIsLessThanMaxClassicPairedDevices](self, "pairedDeviceCountIsLessThanMaxClassicPairedDevices");
  if (v3)
    LOBYTE(v3) = -[NRPairedDeviceRegistry pairedDeviceCountIsLessThanMaxAllPairedDevices](self, "pairedDeviceCountIsLessThanMaxAllPairedDevices");
  return v3;
}

- (BOOL)canPairAnotherTinker
{
  _BOOL4 v3;

  v3 = -[NRPairedDeviceRegistry pairedDeviceCountIsLessThanMaxTinkerPairedDevices](self, "pairedDeviceCountIsLessThanMaxTinkerPairedDevices");
  if (v3)
    LOBYTE(v3) = -[NRPairedDeviceRegistry pairedDeviceCountIsLessThanMaxAllPairedDevices](self, "pairedDeviceCountIsLessThanMaxAllPairedDevices");
  return v3;
}

- (BOOL)pairedDeviceSupportQuickSwitch
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[NRPairedDeviceRegistry getPairedDevices](self, "getPairedDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "valueForProperty:", CFSTR("maxPairingCompatibilityVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");
    objc_msgSend(v3, "valueForProperty:", CFSTR("chipID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NRPairingCompatibilityVersionInfo systemVersions](NRPairingCompatibilityVersionInfo, "systemVersions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5 >= objc_msgSend(v7, "minQuickSwitchPairingCompatibilityVersionForChipID:", v6);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)setActivePairedDevice:(id)a3 operationHasCompleted:(id)a4
{
  -[NRPairedDeviceRegistry setActivePairedDevice:isMagicSwitch:operationHasCompleted:](self, "setActivePairedDevice:isMagicSwitch:operationHasCompleted:", a3, 0, a4);
}

- (void)setActivePairedDevice:(id)a3 isMagicSwitch:(BOOL)a4 operationHasCompleted:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NRRegistryClient connection](self, "connection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke;
      v21[3] = &unk_1E4494E08;
      v13 = &v22;
      v14 = v9;
      v22 = v14;
      objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pairingID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_3;
      v19[3] = &unk_1E4494E08;
      v20 = v14;
      objc_msgSend(v15, "xpcSwitchActiveDeviceWithDeviceID:isMagicSwitch:operationHasCompleted:", v16, v6, v19);

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v9)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v13 = &v18;
    v18 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_6;
  }
LABEL_7:

}

void __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_4;
    v5[3] = &unk_1E4494DE0;
    v7 = v4;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __84__NRPairedDeviceRegistry_setActivePairedDevice_isMagicSwitch_operationHasCompleted___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)setActivePairedDevice:(id)a3 withActiveDeviceAssertionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NRRegistryClient connection](self, "connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke;
      v20[3] = &unk_1E4494E08;
      v11 = &v21;
      v12 = v7;
      v21 = v12;
      objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pairingID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_3;
      v17[3] = &unk_1E4496160;
      v19 = v12;
      v18 = v6;
      objc_msgSend(v13, "xpcSwitchActiveDeviceWithDeviceID:withAssertionHandler:", v14, v17);

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v7)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_5;
    v15[3] = &unk_1E4494F90;
    v11 = &v16;
    v16 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v15);
    goto LABEL_6;
  }
LABEL_7:

}

void __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_4;
    v7[3] = &unk_1E44955C8;
    v8 = v5;
    v9 = *(id *)(a1 + 32);
    v10 = v6;
    v11 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_4(uint64_t a1)
{
  id *v2;
  id *v3;

  if (*(_QWORD *)(a1 + 32))
    v2 = 0;
  else
    v2 = -[NRActiveDeviceAssertion initWithDevice:identifier:]((id *)[NRActiveDeviceAssertion alloc], *(void **)(a1 + 40), *(void **)(a1 + 48));
  v3 = v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __81__NRPairedDeviceRegistry_setActivePairedDevice_withActiveDeviceAssertionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v10;
  id v11;
  id v12;
  _QWORD *WeakRetained;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  _QWORD *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v14 = (void *)objc_msgSend(v11, "copy");
    v15 = (void *)objc_msgSend(v12, "copy");
    v16 = WeakRetained[20];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_2;
    v19[3] = &unk_1E4496188;
    v20 = WeakRetained;
    v21 = v10;
    v22 = v14;
    v23 = v15;
    v25 = a6;
    v24 = v11;
    v17 = v15;
    v18 = v14;
    dispatch_async(v16, v19);

  }
}

void __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NRDevice *v14;
  uint64_t v15;
  id v16;
  __int16 v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t block;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  uint64_t v36;
  id v37;
  __int16 v38;
  _BYTE v39[128];
  uint64_t v40;

  v1 = a1;
  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = v3;
  v6 = v5;
  if (v2)
  {
    v24 = v1;
    v25 = v5;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 160));
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v12, v24);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "changeType"))
          {
            if (objc_msgSend(v13, "changeType") == 2)
              objc_msgSend(*(id *)(v2 + 152), "removeObjectForKey:", v12);
          }
          else
          {
            v14 = -[NRDevice initWithRegistry:diff:pairingID:notify:]([NRDevice alloc], "initWithRegistry:diff:pairingID:notify:", v2, v7, v12, 1);
            objc_msgSend(*(id *)(v2 + 152), "setObject:forKeyedSubscript:", v14, v12);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      }
      while (v9);
    }

    v15 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __99__NRPairedDeviceRegistry__fireChangeNotificationsForDiff_collection_secureProperties_index_notify___block_invoke;
    v27[3] = &unk_1E4496278;
    v27[4] = v2;
    +[NRMutableDeviceCollection parseDiff:forPropertyChange:withBlock:](NRMutableDeviceCollection, "parseDiff:forPropertyChange:withBlock:", v7, CFSTR("lastPairingError"), v27);
    v6 = v25;
    v16 = v25;
    v17 = -[NRPairedDeviceRegistry _getCompatibilityStateWithCollection:]((void *)v2, v16);
    if ((objc_msgSend((id)v2, "daemonIdle") & 1) != 0)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(v16, "activeDeviceID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v1 = v24;
    objc_msgSend((id)v2, "managementQueue", v24);
    v19 = objc_claimAutoreleasedReturnValue();
    block = v15;
    v33 = 3221225472;
    v34 = __83__NRPairedDeviceRegistry__fireCompatibilityStateChangedNotificationWithCollection___block_invoke;
    v35 = &unk_1E44956B8;
    v38 = v17;
    v36 = v2;
    v37 = v18;
    v20 = v18;
    dispatch_async(v19, &block);

    v21 = (void *)objc_msgSend((id)v2, "_getStatusWithCollection:", v16);
    objc_msgSend((id)v2, "managementQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block = v15;
    v33 = 3221225472;
    v34 = __71__NRPairedDeviceRegistry__fireStatusChangedNotificationWithCollection___block_invoke;
    v35 = &unk_1E4495898;
    v36 = v2;
    v37 = v21;
    dispatch_async(v22, &block);

    objc_msgSend((id)v2, "sendDevicesUpdatedNotification");
    v4 = v26;
  }

  v23 = *(_QWORD *)(v1 + 32);
  if (v23)
    objc_msgSend(*(id *)(v23 + 184), "sweepWithCollection:", *(_QWORD *)(v1 + 64));
}

void __53__NRPairedDeviceRegistry_initWithBoost_disconnected___block_invoke_234(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NRDevice *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  const __CFString *v28;
  void *v29;
  uint8_t buf[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v22 = v2;
  if (v1)
  {
    v3 = v2;
    v21 = (void *)objc_opt_new();
    +[NRMutableDeviceCollection diffFrom:to:](NRMutableDeviceCollection, "diffFrom:to:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, buf, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v12 = -[NRDevice initWithRegistry:diff:pairingID:notify:]([NRDevice alloc], "initWithRegistry:diff:pairingID:notify:", v1, v4, v11, 0);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, buf, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 152);
  *(_QWORD *)(v13 + 152) = v5;

  objc_msgSend(*(id *)(a1 + 32), "sendDevicesUpdatedNotification");
  nr_framework_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    nr_framework_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0BDB000, v17, OS_LOG_TYPE_DEFAULT, "Resuming registry operation queue.", buf, 2u);
    }

  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 168));
  v18 = *(_QWORD *)(a1 + 32);
  v28 = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v18 + 176));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:](v18, CFSTR("NRPairedDeviceRegistryStatusDidChange"), 0, v20);

}

- (id)_
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[NRRegistryClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__NRPairedDeviceRegistry____block_invoke;
  v6[3] = &unk_1E4496200;
  v6[4] = &v7;
  objc_msgSend(v3, "xpcClientInfo:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __27__NRPairedDeviceRegistry____block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __71__NRPairedDeviceRegistry__fireStatusChangedNotificationWithCollection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v1 + 176) != v2)
  {
    *(_QWORD *)(v1 + 176) = v2;
    v6 = CFSTR("status");
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:](v3, CFSTR("NRPairedDeviceRegistryStatusDidChange"), 0, v5);

  }
}

uint64_t __32__NRPairedDeviceRegistry_status__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_getStatusWithCollection:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __83__NRPairedDeviceRegistry__fireCompatibilityStateChangedNotificationWithCollection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int16 *)(a1 + 48);
  if (*(unsigned __int16 *)(v1 + 146) != v2)
  {
    *(_WORD *)(v1 + 146) = v2;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v7 = CFSTR("compatibilityState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:](v3, CFSTR("NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification"), v4, v6);

  }
}

uint64_t __44__NRPairedDeviceRegistry_compatibilityState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = -[NRPairedDeviceRegistry _getCompatibilityStateWithCollection:](*(void **)(a1 + 32), a2);
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("device"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("pairingID"));
  }
  else
  {
    v3 = 0;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke_2;
  v7[3] = &unk_1E4496250;
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __69__NRPairedDeviceRegistry__postNotification_forDeviceID_withUserInfo___block_invoke_3(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", a1[4], a1[5], a1[6]);

}

void __99__NRPairedDeviceRegistry__fireChangeNotificationsForDiff_collection_secureProperties_index_notify___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v15 = CFSTR("error");
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (objc_msgSend(v8, "code") == 1)
    {
      objc_msgSend(v8, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("previousDeviceID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
      if (v13)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("previousDevice"));

      }
    }
    -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:](*(_QWORD *)(a1 + 32), CFSTR("NRPairedDeviceRegistryDeviceDidFailToPairNotification"), v6, v10);

  }
}

- (id)getDevices
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "activePairedDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry getDevicesMatching:](self, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getActivePairedDeviceIncludingAltAccount
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "activePairedDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry getAllDevicesWithArchivedAltAccountDevicesMatching:](self, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getSetupCompletedDevices
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "setupCompletedDevicesSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry getDevicesMatching:](self, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __39__NRPairedDeviceRegistry_getAllDevices__block_invoke()
{
  return 1;
}

- (id)getAllDevicesWithArchivedDevices
{
  return -[NRPairedDeviceRegistry getAllDevicesWithArchivedDevicesMatching:](self, "getAllDevicesWithArchivedDevicesMatching:", &__block_literal_global_247);
}

uint64_t __58__NRPairedDeviceRegistry_getAllDevicesWithArchivedDevices__block_invoke()
{
  return 1;
}

uint64_t __51__NRPairedDeviceRegistry_activeDeviceSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "valueForProperty:", CFSTR("isActive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

uint64_t __52__NRPairedDeviceRegistry_pairedDevicesSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "valueForProperty:", CFSTR("isPaired"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

uint64_t __57__NRPairedDeviceRegistry_activePairedDeviceSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "valueForProperty:", CFSTR("isPaired"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(v2, "valueForProperty:", CFSTR("isActive"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)setupCompletedDevicesSelectorBlock
{
  return &__block_literal_global_251;
}

uint64_t __60__NRPairedDeviceRegistry_setupCompletedDevicesSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "valueForProperty:", CFSTR("isPaired"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(v2, "valueForProperty:", CFSTR("isSetup"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)companionOOBDiscoverAndPairWithName:(id)a3 withOutOfBandPairingKey:(id)a4 withOptions:(id)a5 operationHasBegun:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[NRRegistryClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NRRegistryClient connection](self, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke;
    v26[3] = &unk_1E4494E08;
    v17 = &v27;
    v18 = v13;
    v27 = v18;
    objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_3;
    v24[3] = &unk_1E4494E08;
    v25 = v18;
    v20 = v18;
    objc_msgSend(v19, "xpcCompanionOOBDiscoverAndPairWithName:withOutOfBandPairingKey:withOptions:operationHasBegun:", v10, v11, v12, v24);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v17 = &v23;
    v23 = v13;
    v21 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_4;
  v6[3] = &unk_1E4494DE0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __116__NRPairedDeviceRegistry_companionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)companionPasscodePairWithDevice:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NRRegistryClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NRRegistryClient connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke;
    v24[3] = &unk_1E4494E08;
    v14 = &v25;
    v15 = v10;
    v25 = v15;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairingID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_3;
    v22[3] = &unk_1E4494E08;
    v23 = v15;
    v18 = v15;
    objc_msgSend(v16, "xpcCompanionPasscodePairWithDeviceID:withOptions:operationHasBegun:", v17, v9, v22);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v14 = &v21;
    v21 = v10;
    v19 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_4;
  v6[3] = &unk_1E4494DE0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __88__NRPairedDeviceRegistry_companionPasscodePairWithDevice_withOptions_operationHasBegun___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)gizmoOOBAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  -[NRRegistryClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NRRegistryClient connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke;
    v20[3] = &unk_1E4494E08;
    v11 = &v21;
    v12 = v7;
    v21 = v12;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_3;
    v18[3] = &unk_1E4494E08;
    v19 = v12;
    v14 = v12;
    objc_msgSend(v13, "xpcGizmoOOBAdvertiseAndPairWithName:operationHasBegun:", v6, v18);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v11 = &v17;
    v17 = v7;
    v15 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_4;
  v6[3] = &unk_1E4494DE0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __77__NRPairedDeviceRegistry_gizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)gizmoPasscodeAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  -[NRRegistryClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NRRegistryClient connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke;
    v20[3] = &unk_1E4494E08;
    v11 = &v21;
    v12 = v7;
    v21 = v12;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_3;
    v18[3] = &unk_1E4494E08;
    v19 = v12;
    v14 = v12;
    objc_msgSend(v13, "xpcGizmoOOBAdvertiseAndPairWithName:operationHasBegun:", v6, v18);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v11 = &v17;
    v17 = v7;
    v15 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_4;
  v6[3] = &unk_1E4494DE0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __82__NRPairedDeviceRegistry_gizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)notifyActivationCompleted:(id)a3 withSuccess:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[NRRegistryClient connection](self, "connection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "xpcNotifyActivationCompleted:withSuccess:", v8, v4);
}

- (void)notifyPasscode:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[NRRegistryClient connection](self, "connection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "xpcNotifyPasscode:withDeviceID:", v7, v9);
}

- (void)notifyPairingShouldContinue
{
  void *v2;
  id v3;

  -[NRRegistryClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcPairingShouldContinue");

}

- (void)unpairWithDevice:(id)a3 shouldObliterate:(BOOL)a4 operationHasBegun:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v5 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("obliterate");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry unpairWithDevice:withOptions:operationHasBegun:](self, "unpairWithDevice:withOptions:operationHasBegun:", v10, v12, v9);

}

- (void)unpairWithDevice:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NRRegistryClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NRRegistryClient connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke;
    v22[3] = &unk_1E4494E08;
    v14 = &v23;
    v15 = v10;
    v23 = v15;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairingID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_3;
    v20[3] = &unk_1E4494E08;
    v21 = v15;
    objc_msgSend(v16, "xpcUnpairWithDeviceID:withOptions:operationHasBegun:", v17, v9, v20);

LABEL_5:
    goto LABEL_6;
  }
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v14 = &v19;
    v19 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_5;
  }
LABEL_6:

}

void __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_4;
    v5[3] = &unk_1E4494DE0;
    v7 = v4;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __73__NRPairedDeviceRegistry_unpairWithDevice_withOptions_operationHasBegun___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)pairWithSimulator:(id)a3 withQueue:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a3;
  v8 = a5;
  -[NRRegistryClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NRRegistryClient connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke;
    v21[3] = &unk_1E4494E08;
    v12 = &v22;
    v13 = v8;
    v22 = v13;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_3;
    v19[3] = &unk_1E4494E08;
    v20 = v13;
    v15 = v13;
    objc_msgSend(v14, "xpcPairWithSimulator:withCompletion:", v7, v19);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v12 = &v18;
    v18 = v8;
    v16 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_4;
  v6[3] = &unk_1E4494DE0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __69__NRPairedDeviceRegistry_pairWithSimulator_withQueue_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)unpairWithSimulator:(id)a3 withQueue:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a3;
  v8 = a5;
  -[NRRegistryClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NRRegistryClient connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke;
    v21[3] = &unk_1E4494E08;
    v12 = &v22;
    v13 = v8;
    v22 = v13;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_3;
    v19[3] = &unk_1E4494E08;
    v20 = v13;
    v15 = v13;
    objc_msgSend(v14, "xpcUnpairWithSimulator:withCompletion:", v7, v19);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v12 = &v18;
    v18 = v8;
    v16 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_4;
  v6[3] = &unk_1E4494DE0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__NRPairedDeviceRegistry_unpairWithSimulator_withQueue_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)switchToSimulator:(id)a3 withQueue:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a3;
  v8 = a5;
  -[NRRegistryClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NRRegistryClient connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke;
    v21[3] = &unk_1E4494E08;
    v12 = &v22;
    v13 = v8;
    v22 = v13;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_3;
    v19[3] = &unk_1E4494E08;
    v20 = v13;
    v15 = v13;
    objc_msgSend(v14, "xpcSwitchToSimulator:withCompletion:", v7, v19);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v12 = &v18;
    v18 = v8;
    v16 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_4;
  v6[3] = &unk_1E4494DE0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __69__NRPairedDeviceRegistry_switchToSimulator_withQueue_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)fakePairedSyncIsCompleteWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  -[NRRegistryClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NRRegistryClient connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke;
    v17[3] = &unk_1E4494E08;
    v8 = &v18;
    v9 = v4;
    v18 = v9;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_3;
    v15[3] = &unk_1E4494E08;
    v16 = v9;
    v11 = v9;
    objc_msgSend(v10, "xpcFakePairedSyncIsCompleteWithCompletion:", v15);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v8 = &v14;
    v14 = v4;
    v12 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_4;
  v6[3] = &unk_1E4494DE0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __65__NRPairedDeviceRegistry_fakePairedSyncIsCompleteWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)triggerTailspinFrom:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[NRRegistryClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NRRegistryClient connection](self, "connection");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_253);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "xpcTriggerTailspinFrom:forApp:", a3, 0);

  }
}

- (void)enterCompatibilityState:(unsigned __int16)a3 forDevice:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v6 = a4;
  -[NRRegistryClient connection](self, "connection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "xpcEnterCompatibilityState:withDeviceID:", v4, v8);
}

- (void)waitForPairingStorePathPairingID:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  NRPairedDeviceRegistry *v12;
  dispatch_semaphore_t v13;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  -[NRRegistry managementQueue](self, "managementQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke;
  v11 = &unk_1E4495030;
  v12 = self;
  v13 = v5;
  v7 = v5;
  dispatch_async(v6, &v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  -[NRPairedDeviceRegistry pairingStorePathPairingID:](self, "pairingStorePathPairingID:", v4, v8, v9, v10, v11, v12);

}

void __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  id v8;

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_2;
  v7[3] = &unk_1E44963D0;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v4 = (void *)MEMORY[0x1A1B01DE4](v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "addObject:", v4);
  v5 = *(void **)(a1 + 32);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_4;
  v6[3] = &unk_1E44961D8;
  v6[4] = v5;
  objc_msgSend(v5, "_grabRegistryWithReadBlock:", v6);

}

uint64_t __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[4];
  id v8;

  objc_msgSend(a2, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPaired") && (objc_msgSend(v3, "isAltAccount") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "managementQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_3;
    block[3] = &unk_1E4494FB8;
    v8 = *(id *)(a1 + 40);
    dispatch_async(v5, block);

    v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

intptr_t __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __59__NRPairedDeviceRegistry_waitForPairingStorePathPairingID___block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(*(id *)(v2 + 184), "sweepWithCollection:", a2);
  return result;
}

- (void)waitForAltAccountPairingStorePathPairingID:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  dispatch_semaphore_t v12;
  NRPairedDeviceRegistry *v13;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  -[NRRegistry managementQueue](self, "managementQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke;
  v11 = &unk_1E4495030;
  v12 = v5;
  v13 = self;
  v7 = v5;
  dispatch_async(v6, &v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  -[NRPairedDeviceRegistry altAccountPairingStorePathPairingID:](self, "altAccountPairingStorePathPairingID:", v4, v8, v9, v10, v11);

}

void __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke_2;
  v6[3] = &unk_1E44963F8;
  v7 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x1A1B01DE4](v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "addObject:", v3);
  v4 = *(void **)(a1 + 40);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke_3;
  v5[3] = &unk_1E44961D8;
  v5[4] = v4;
  objc_msgSend(v4, "_grabRegistryWithReadBlock:", v5);

}

uint64_t __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPaired");
  if ((_DWORD)v4)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  return v4;
}

uint64_t __69__NRPairedDeviceRegistry_waitForAltAccountPairingStorePathPairingID___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(*(id *)(v2 + 184), "sweepWithCollection:", a2);
  return result;
}

- (id)waitForActivePairedDevice
{
  -[NRPairedDeviceRegistry waitForPairingStorePathPairingID:](self, "waitForPairingStorePathPairingID:", &__block_literal_global_256);
  return -[NRPairedDeviceRegistry getActivePairedDevice](self, "getActivePairedDevice");
}

- (id)waitForActivePairedOrAltAccountDevice
{
  -[NRPairedDeviceRegistry waitForAltAccountPairingStorePathPairingID:](self, "waitForAltAccountPairingStorePathPairingID:", &__block_literal_global_257);
  return -[NRPairedDeviceRegistry getActivePairedDevice](self, "getActivePairedDevice");
}

- (id)waitForActiveOrAltAccountDevice
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  dispatch_semaphore_t v14;
  NRPairedDeviceRegistry *v15;

  v3 = dispatch_semaphore_create(0);
  -[NRRegistry managementQueue](self, "managementQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke;
  v13 = &unk_1E4495030;
  v14 = v3;
  v15 = self;
  v5 = v3;
  dispatch_async(v4, &v10);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)objc_opt_class(), "activeDeviceSelectorBlock", v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry getAllDevicesWithArchivedAltAccountDevicesMatching:](self, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke_2;
  v6[3] = &unk_1E44963F8;
  v7 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x1A1B01DE4](v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "addObject:", v3);
  v4 = *(void **)(a1 + 40);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke_3;
  v5[3] = &unk_1E44961D8;
  v5[4] = v4;
  objc_msgSend(v4, "_grabRegistryWithReadBlock:", v5);

}

BOOL __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  return v3 != 0;
}

uint64_t __57__NRPairedDeviceRegistry_waitForActiveOrAltAccountDevice__block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(*(id *)(v2 + 184), "sweepWithCollection:", a2);
  return result;
}

- (id)waitForActiveDevice
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  dispatch_semaphore_t v14;
  NRPairedDeviceRegistry *v15;

  v3 = dispatch_semaphore_create(0);
  -[NRRegistry managementQueue](self, "managementQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke;
  v13 = &unk_1E4495030;
  v14 = v3;
  v15 = self;
  v5 = v3;
  dispatch_async(v4, &v10);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)objc_opt_class(), "activeDeviceSelectorBlock", v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry getAllDevicesWithArchivedAltAccountDevicesMatching:](self, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke_2;
  v6[3] = &unk_1E44963F8;
  v7 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x1A1B01DE4](v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "addObject:", v3);
  v4 = *(void **)(a1 + 40);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke_3;
  v5[3] = &unk_1E44961D8;
  v5[4] = v4;
  objc_msgSend(v4, "_grabRegistryWithReadBlock:", v5);

}

uint64_t __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isAltAccount") & 1) == 0)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __45__NRPairedDeviceRegistry_waitForActiveDevice__block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(*(id *)(v2 + 184), "sweepWithCollection:", a2);
  return result;
}

- (void)abortPairing
{
  -[NRPairedDeviceRegistry abortPairingWithReason:](self, "abortPairingWithReason:", 0);
}

- (void)abortPairingWithReason:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_258);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcAbortPairingReason:withBlock:", v6, &__block_literal_global_259);

  }
}

- (void)suspendPairingClientCrashMonitoring
{
  void *v2;
  id v3;

  -[NRRegistryClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_260);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcSuspendPairingClientCrashMonitoring:", &__block_literal_global_261);

}

- (void)resumePairingClientCrashMonitoring
{
  void *v2;
  id v3;

  -[NRRegistryClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_262);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcResumePairingClientCrashMonitoring:", &__block_literal_global_263);

}

- (id)blockAndQueryVersions
{
  NSObject *v2;
  id v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  -[NRRegistry managementQueue](self, "managementQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NRPairedDeviceRegistry_blockAndQueryVersions__block_invoke;
  block[3] = &unk_1E4496568;
  block[4] = &v6;
  dispatch_sync(v2, block);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__NRPairedDeviceRegistry_blockAndQueryVersions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[NRPairingCompatibilityVersionInfo systemVersions](NRPairingCompatibilityVersionInfo, "systemVersions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)userIsCheckingForUpdate
{
  void *v2;
  id v3;

  -[NRRegistryClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcTriggerVersion4Workaround");

}

- (int64_t)pairingCompatibilityVersion
{
  void *v2;
  int64_t v3;

  +[NRPairingCompatibilityVersionInfo systemVersions](NRPairingCompatibilityVersionInfo, "systemVersions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pairingCompatibilityVersion");

  return v3;
}

- (int64_t)maxPairingCompatibilityVersion
{
  void *v2;
  int64_t v3;

  +[NRPairingCompatibilityVersionInfo systemVersions](NRPairingCompatibilityVersionInfo, "systemVersions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxPairingCompatibilityVersion");

  return v3;
}

- (int64_t)minPairingCompatibilityVersion
{
  void *v2;
  int64_t v3;

  +[NRPairingCompatibilityVersionInfo systemVersions](NRPairingCompatibilityVersionInfo, "systemVersions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minPairingCompatibilityVersion");

  return v3;
}

- (int64_t)minQuickSwitchCompatibilityVersion
{
  void *v2;
  int64_t v3;

  +[NRPairingCompatibilityVersionInfo systemVersions](NRPairingCompatibilityVersionInfo, "systemVersions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minQuickSwitchCompatibilityVersion");

  return v3;
}

- (void)beginDiscovery
{
  void *v2;
  id v3;

  -[NRRegistryClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_266);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcBeginDiscoveryWithBlock:", &__block_literal_global_267);

}

- (void)endDiscovery
{
  void *v2;
  id v3;

  -[NRRegistryClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_268);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcEndDiscoveryWithBlock:", &__block_literal_global_269);

}

- (void)overrideSignalStrengthLimit:(int64_t)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  nr_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    nr_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl(&dword_1A0BDB000, v6, OS_LOG_TYPE_DEFAULT, "overrideSignalStrengthLimit:%ld not implemented", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)xpcDeviceID:(id)a3 needsPasscode:(id)a4
{
  id v6;
  void *v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    v9 = CFSTR("passcode");
    v10[0] = a4;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = a4;
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:]((uint64_t)self, CFSTR("NRPairedDeviceRegistryDeviceNeedsPasscode"), v6, a4);

}

- (void)xpcHasNewOOBKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = CFSTR("OOBKey");
    v8[0] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[NRPairedDeviceRegistry _postNotification:forDeviceID:withUserInfo:]((uint64_t)self, CFSTR("NRPairedDeviceRegistryDeviceOOBKeyDidChange"), 0, v6);

}

- (void)completeRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  -[NRRegistryClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NRRegistryClient connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke;
    v16[3] = &unk_1E4494E08;
    v10 = &v17;
    v17 = v7;
    v11 = v7;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "xpcSubmitRTCPairingMetricForMetricID:withSuccess:", v6, v11);

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke_3;
    v14[3] = &unk_1E4494F90;
    v10 = &v15;
    v15 = v7;
    v13 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v14);
  }

}

void __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__NRPairedDeviceRegistry_completeRTCPairingMetricForMetricID_withSuccess___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateWatchBuddyStage:(unsigned int)a3 forPairingID:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (-[NRRegistryClient daemonIdle](self, "daemonIdle")
    || (-[NRRegistryClient connection](self, "connection"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    nr_framework_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      nr_framework_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_1A0BDB000, v12, OS_LOG_TYPE_ERROR, "xpc error updating buddy stage", v13, 2u);
      }

    }
  }
  else
  {
    -[NRRegistryClient connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_270);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "xpcUpdateWatchBuddyStage:forPairingID:", v4, v6);

  }
}

void __61__NRPairedDeviceRegistry_updateWatchBuddyStage_forPairingID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  nr_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v2;
      _os_log_error_impl(&dword_1A0BDB000, v5, OS_LOG_TYPE_ERROR, "connection error updating buddy stage: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (id)deviceForPairingID:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
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
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__NRPairedDeviceRegistry_deviceForPairingID___block_invoke;
  v8[3] = &unk_1E4496670;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[NRPairedDeviceRegistry threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:](self, "threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __45__NRPairedDeviceRegistry_deviceForPairingID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)deviceForBTDeviceID:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  -[NRPairedDeviceRegistry deviceForBluetoothID:](self, "deviceForBluetoothID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)deviceForBluetoothID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__NRPairedDeviceRegistry_deviceForBluetoothID___block_invoke;
  v9[3] = &unk_1E4496698;
  v10 = v4;
  v5 = v4;
  -[NRPairedDeviceRegistry getAllDevicesWithArchivedAltAccountDevicesMatching:](self, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __47__NRPairedDeviceRegistry_deviceForBluetoothID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isPaired"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isActive"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0 || objc_msgSend(v5, "BOOLValue"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_bluetoothIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v6);

    if ((v7 & 1) != 0)
      v8 = 1;
  }

  return v8;
}

- (id)nonActiveDeviceForBTDeviceID:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  -[NRPairedDeviceRegistry nonActiveDeviceForBluetoothID:](self, "nonActiveDeviceForBluetoothID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nonActiveDeviceForBluetoothID:(id)a3
{
  void *v3;
  void *v4;

  -[NRPairedDeviceRegistry getAllDevicesWithArchivedAltAccountDevicesMatching:](self, "getAllDevicesWithArchivedAltAccountDevicesMatching:", &__block_literal_global_271);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __56__NRPairedDeviceRegistry_nonActiveDeviceForBluetoothID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "valueForProperty:", CFSTR("isArchived"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue") ^ 1;
  else
    v4 = 1;

  return v4;
}

- (id)deviceForIDSDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NRPairedDeviceRegistry deviceIDForIDSDevice:](self, "deviceIDForIDSDevice:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry deviceForBTDeviceID:](self, "deviceForBTDeviceID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nonActiveDeviceForIDSDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NRPairedDeviceRegistry deviceIDForIDSDevice:](self, "deviceIDForIDSDevice:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry nonActiveDeviceForBTDeviceID:](self, "nonActiveDeviceForBTDeviceID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)deviceForNRDevice:(id)a3 fromIDSDevices:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[NRPairedDeviceRegistry deviceIDForNRDevice:](self, "deviceIDForNRDevice:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NRPairedDeviceRegistry deviceIDForIDSDevice:](self, "deviceIDForIDSDevice:", v13, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "isEqual:", v14);

        if (v15)
        {
          v16 = v13;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)deviceIDForNRDevice:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("_bluetoothIdentifier"));
}

- (id)deviceIDForIDSDevice:(id)a3
{
  return (id)objc_msgSend(a3, "nsuuid");
}

- (void)pairingClientDidEnterPhase:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_272);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcPairingClientDidEnterPhase:withBlock:", v6, &__block_literal_global_273);

  }
}

- (void)pairingClientSetAltAccountName:(id)a3 forDevice:(id)a4 completion:(id)a5
{
  -[NRPairedDeviceRegistry pairingClientSetAltAccountName:altDSID:forDevice:completion:](self, "pairingClientSetAltAccountName:altDSID:forDevice:completion:", a3, 0, a4, a5);
}

- (void)pairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forDevice:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[NRRegistryClient connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke;
      v24[3] = &unk_1E4494E08;
      v16 = &v25;
      v17 = v13;
      v25 = v17;
      objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pairingID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_3;
      v22[3] = &unk_1E4494E08;
      v23 = v17;
      objc_msgSend(v18, "xpcPairingClientSetAltAccountName:altDSID:forPairingID:completion:", v10, v11, v19, v22);

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v13)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v16 = &v21;
    v21 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_6;
  }
LABEL_7:

}

void __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_4;
    v5[3] = &unk_1E4494DE0;
    v7 = v4;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __86__NRPairedDeviceRegistry_pairingClientSetAltAccountName_altDSID_forDevice_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)pairingClientSetPairingParentName:(id)a3 pairingParentAltDSID:(id)a4 forDevice:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[NRRegistryClient connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke;
      v24[3] = &unk_1E4494E08;
      v16 = &v25;
      v17 = v13;
      v25 = v17;
      objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pairingID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_3;
      v22[3] = &unk_1E4494E08;
      v23 = v17;
      objc_msgSend(v18, "xpcPairingClientSetPairingParentName:pairingParentAltDSID:forPairingID:completion:", v10, v11, v19, v22);

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v13)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v16 = &v21;
    v21 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_6;
  }
LABEL_7:

}

void __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_4;
    v5[3] = &unk_1E4494DE0;
    v7 = v4;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __102__NRPairedDeviceRegistry_pairingClientSetPairingParentName_pairingParentAltDSID_forDevice_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)setWatchBuddyPushedSyncTrapUI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NRRegistryClient connection](self, "connection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke;
      v15[3] = &unk_1E4494E08;
      v8 = &v16;
      v9 = v4;
      v16 = v9;
      objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_3;
      v13[3] = &unk_1E4494E08;
      v14 = v9;
      objc_msgSend(v10, "xpcWatchBuddyCompletedSetupSteps:", v13);

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v8 = &v12;
    v12 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_6;
  }
LABEL_7:

}

void __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_4;
    v5[3] = &unk_1E4494DE0;
    v7 = v4;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __56__NRPairedDeviceRegistry_setWatchBuddyPushedSyncTrapUI___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)setWatchBuddyCompletedSetupSteps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NRRegistryClient connection](self, "connection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke;
      v15[3] = &unk_1E4494E08;
      v8 = &v16;
      v9 = v4;
      v16 = v9;
      objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_3;
      v13[3] = &unk_1E4494E08;
      v14 = v9;
      objc_msgSend(v10, "xpcWatchBuddyCompletedSetupSteps:", v13);

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v8 = &v12;
    v12 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_6;
  }
LABEL_7:

}

void __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_4;
    v5[3] = &unk_1E4494DE0;
    v7 = v4;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __59__NRPairedDeviceRegistry_setWatchBuddyCompletedSetupSteps___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (unsigned)switchIndex
{
  void *v3;
  void *v4;
  unsigned int v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_274);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__NRPairedDeviceRegistry_switchIndex__block_invoke_2;
    v7[3] = &unk_1E4496740;
    v7[4] = &v8;
    objc_msgSend(v4, "xpcSwitchIndex:", v7);

  }
  v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __37__NRPairedDeviceRegistry_switchIndex__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)getSwitchEventsFromIndex:(unsigned int)a3 inlineCallback:(id)a4
{
  id v6;
  uint64_t v7;
  unsigned int v8;
  __int128 v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  __int128 v16;
  id v17;
  uint8_t buf[8];
  __int16 v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3 + 1;
  v8 = -[NRPairedDeviceRegistry switchIndex](self, "switchIndex");
  *(_QWORD *)&v9 = 67109376;
  v16 = v9;
  do
  {
    v17 = v6;
    if (self)
    {
      nr_framework_log();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (v11)
      {
        nr_framework_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          *(_DWORD *)&buf[4] = v7;
          v19 = 1024;
          v20 = v8;
          _os_log_impl(&dword_1A0BDB000, v12, OS_LOG_TYPE_DEFAULT, "%u %u", buf, 0xEu);
        }

      }
      for (; v7 <= v8; v7 = (v7 + 1))
      {
        *(_QWORD *)buf = 0;
        -[NRPairedDeviceRegistry _deviceIDAtSwitchIndex:date:](self, "_deviceIDAtSwitchIndex:date:", v7, buf, v16);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (*(_QWORD *)buf)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (!v15)
          (*((void (**)(id, uint64_t))v6 + 2))(v17, v7);

      }
    }

    v7 = v8 + 1;
    v8 = -[NRPairedDeviceRegistry switchIndex](self, "switchIndex");
  }
  while (v8 >= v7);

}

- (void)getMigrationPairingCharacteristicReadDataWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v8 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C80D38];
  }
  nr_framework_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    nr_framework_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0BDB000, v12, OS_LOG_TYPE_DEFAULT, "Received request for characteristic read data", buf, 2u);
    }

  }
  if (-[NRRegistryClient daemonIdle](self, "daemonIdle")
    || (-[NRRegistryClient connection](self, "connection"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v16 = &v23;
    v23 = v7;
    v21 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    -[NRRegistryClient connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke;
    v27[3] = &unk_1E4494E30;
    v16 = (id *)&v28;
    v17 = v8;
    v28 = v17;
    v18 = v7;
    v29 = v18;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_3;
    v24[3] = &unk_1E44957A8;
    v25 = v17;
    v26 = v18;
    v20 = v18;
    objc_msgSend(v19, "xpcGetMigrationPairingCharacteristicReadDataWithCompletion:", v24);

  }
}

void __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_2;
  block[3] = &unk_1E4494F90;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_4;
  v7[3] = &unk_1E4494DE0;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __88__NRPairedDeviceRegistry_getMigrationPairingCharacteristicReadDataWithQueue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)putMigrationChallengeCharacteristicWriteData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v11 = (id)MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
  }
  if (-[NRRegistryClient daemonIdle](self, "daemonIdle")
    || (-[NRRegistryClient connection](self, "connection"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_5;
    v22[3] = &unk_1E4494F90;
    v16 = &v23;
    v23 = v10;
    v21 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v22);
  }
  else
  {
    -[NRRegistryClient connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke;
    v27[3] = &unk_1E4494E30;
    v16 = &v28;
    v17 = v11;
    v28 = v17;
    v18 = v10;
    v29 = v18;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_3;
    v24[3] = &unk_1E4495640;
    v25 = v17;
    v26 = v18;
    v20 = v18;
    objc_msgSend(v19, "xpcPutMigrationChallengeCharacteristicWriteData:completion:", v8, v24);

  }
}

void __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_2;
  block[3] = &unk_1E4494F90;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_4;
  v4[3] = &unk_1E4495618;
  v3 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = a2;
  dispatch_async(v3, v4);

}

uint64_t __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __88__NRPairedDeviceRegistry_putMigrationChallengeCharacteristicWriteData_queue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startWatchSetupPush
{
  void *v2;
  id v3;

  -[NRRegistryClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_277);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcStartWatchSetupPushWithBlock:", &__block_literal_global_278);

}

- (BOOL)isWatchSetupPushActive
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v6[16];

  nr_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    nr_framework_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1A0BDB000, v4, OS_LOG_TYPE_ERROR, "isWatchSetupPushActive not implemented", v6, 2u);
    }

  }
  return 0;
}

- (void)stopWatchSetupPush
{
  void *v2;
  id v3;

  -[NRRegistryClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_279);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcStopWatchSetupPushWithBlock:", &__block_literal_global_280);

}

- (void)waitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[NRRegistryClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke;
  v15[3] = &unk_1E4494E08;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_3;
  v13[3] = &unk_1E44967E8;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:completion:", v7, v13);

}

void __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_2;
  block[3] = &unk_1E4494F90;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_4;
  block[3] = &unk_1E4495758;
  v6 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __90__NRPairedDeviceRegistry_waitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)setMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id *v13;
  id v14;
  void *v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NRRegistryClient connection](self, "connection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke;
      v20[3] = &unk_1E4494E08;
      v13 = &v21;
      v14 = v9;
      v21 = v14;
      objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_3;
      v18[3] = &unk_1E4494F90;
      v19 = v14;
      objc_msgSend(v15, "xpcSetMigrationConsented:forDeviceID:withBlock:", v6, v8, v18);

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v9)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v13 = &v17;
    v17 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_6;
  }
LABEL_7:

}

void __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_4;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__NRPairedDeviceRegistry_setMigrationConsented_forDeviceID_withBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)setMigrationConsented:(BOOL)a3 forDevice:(id)a4 withBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a3;
  v8 = a5;
  objc_msgSend(a4, "pairingID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry setMigrationConsented:forDeviceID:withBlock:](self, "setMigrationConsented:forDeviceID:withBlock:", v6, v9, v8);

}

- (void)beginMigrationWithDevice:(id)a3 passcode:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[NRRegistryClient connection](self, "connection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke;
      v22[3] = &unk_1E4494E08;
      v14 = &v23;
      v15 = v10;
      v23 = v15;
      objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pairingID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_3;
      v20[3] = &unk_1E4494F90;
      v21 = v15;
      objc_msgSend(v16, "xpcBeginMigrationWithDeviceID:passcode:withBlock:", v17, v9, v20);

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v14 = &v19;
    v19 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_6;
  }
LABEL_7:

}

void __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_4;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__NRPairedDeviceRegistry_beginMigrationWithDevice_passcode_withBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)beginMigrationWithDevice:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NRRegistryClient connection](self, "connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke;
      v19[3] = &unk_1E4494E08;
      v11 = &v20;
      v12 = v7;
      v20 = v12;
      objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pairingID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_3;
      v17[3] = &unk_1E4494E08;
      v18 = v12;
      objc_msgSend(v13, "xpcBeginMigrationWithDeviceID:completion:", v14, v17);

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v11 = &v16;
    v16 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_6;
  }
LABEL_7:

}

void __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_4;
    v5[3] = &unk_1E4494DE0;
    v7 = v4;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__NRPairedDeviceRegistry_beginMigrationWithDevice_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)lastMigrationRequestPhoneName
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[NRRegistryClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_282);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__NRPairedDeviceRegistry_lastMigrationRequestPhoneName__block_invoke_2;
  v6[3] = &unk_1E4496830;
  v6[4] = &v7;
  objc_msgSend(v3, "xpcGetLastMigrationRequestPhoneNameWithCompletion:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__NRPairedDeviceRegistry_lastMigrationRequestPhoneName__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)migrationConsentRequestData
{
  void *v2;
  void *v3;

  +[NRMigrator sharedMigrator](NRMigrator, "sharedMigrator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "migrationConsentRequestData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)devicesFromMigrationConsentRequestData:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[NRMigrator sharedMigrator](NRMigrator, "sharedMigrator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devicesFromMigrationConsentRequestData:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)keepPhoneUnlockedInternalTestSPI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[NRRegistryClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__NRPairedDeviceRegistry_keepPhoneUnlockedInternalTestSPI___block_invoke;
  v8[3] = &unk_1E4494F90;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "xpcKeepPhoneUnlockedInternalTestSPI:", v8);

}

uint64_t __59__NRPairedDeviceRegistry_keepPhoneUnlockedInternalTestSPI___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)lastSyncSwitchIndex
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int64_t v10;
  uint64_t v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

    if (!v4)
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy__2;
      v18 = __Block_byref_object_dispose__2;
      v19 = 0;
      -[NRRegistryClient connection](self, "connection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_285);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __45__NRPairedDeviceRegistry_lastSyncSwitchIndex__block_invoke_2;
      v13[3] = &unk_1E4496878;
      v13[4] = &v20;
      v13[5] = &v14;
      objc_msgSend(v6, "xpcGetLastSwitchIndex:", v13);

      if (v15[5])
      {
        nr_framework_log();
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

        if (v8)
        {
          nr_framework_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v12 = v15[5];
            *(_DWORD *)buf = 138412290;
            v25 = v12;
            _os_log_error_impl(&dword_1A0BDB000, v9, OS_LOG_TYPE_ERROR, "NanoRegistry client: Failed to get switchIndex value from CFPrefs- error %@", buf, 0xCu);
          }

        }
      }
      _Block_object_dispose(&v14, 8);

    }
  }
  v10 = v21[3];
  _Block_object_dispose(&v20, 8);
  return v10;
}

void __45__NRPairedDeviceRegistry_lastSyncSwitchIndex__block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (int64_t)migrationCountForPairingID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int64_t v13;
  uint64_t v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !v4 || v5 == 0;
    v7 = !v6;

    if (v7)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__2;
      v21 = __Block_byref_object_dispose__2;
      v22 = 0;
      -[NRRegistryClient connection](self, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_287);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __53__NRPairedDeviceRegistry_migrationCountForPairingID___block_invoke_2;
      v16[3] = &unk_1E4496878;
      v16[4] = &v23;
      v16[5] = &v17;
      objc_msgSend(v9, "xpcGetMigrationCountForPairingID:completion:", v4, v16);

      if (v18[5])
      {
        nr_framework_log();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

        if (v11)
        {
          nr_framework_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v15 = v18[5];
            *(_DWORD *)buf = 138412546;
            v28 = v4;
            v29 = 2112;
            v30 = v15;
            _os_log_error_impl(&dword_1A0BDB000, v12, OS_LOG_TYPE_ERROR, "NanoRegistry client: Failed to get migrationCount value for pairingID %@ from CFPrefs- error %@", buf, 0x16u);
          }

        }
      }
      _Block_object_dispose(&v17, 8);

    }
  }
  v13 = v24[3];
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __53__NRPairedDeviceRegistry_migrationCountForPairingID___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)hasCompletedInitialSyncForPairingID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  BOOL v13;
  uint64_t v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !v4 || v5 == 0;
    v7 = !v6;

    if (v7)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__2;
      v21 = __Block_byref_object_dispose__2;
      v22 = 0;
      -[NRRegistryClient connection](self, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_288);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __62__NRPairedDeviceRegistry_hasCompletedInitialSyncForPairingID___block_invoke_2;
      v16[3] = &unk_1E44968E0;
      v16[4] = &v23;
      v16[5] = &v17;
      objc_msgSend(v9, "xpcGetInitialSyncCompletedForPairingID:completion:", v4, v16);

      if (v18[5])
      {
        nr_framework_log();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

        if (v11)
        {
          nr_framework_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v15 = v18[5];
            *(_DWORD *)buf = 138412546;
            v28 = v4;
            v29 = 2112;
            v30 = v15;
            _os_log_error_impl(&dword_1A0BDB000, v12, OS_LOG_TYPE_ERROR, "NanoRegistry client: Failed to get initialsynccompleted value for pairingID %@ from CFPrefs- error %@", buf, 0x16u);
          }

        }
      }
      _Block_object_dispose(&v17, 8);

    }
  }
  v13 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __62__NRPairedDeviceRegistry_hasCompletedInitialSyncForPairingID___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)isAssertionActive:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  BOOL v13;
  uint64_t v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !v4 || v5 == 0;
    v7 = !v6;

    if (v7)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__2;
      v21 = __Block_byref_object_dispose__2;
      v22 = 0;
      -[NRRegistryClient connection](self, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_290);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __44__NRPairedDeviceRegistry_isAssertionActive___block_invoke_2;
      v16[3] = &unk_1E44968E0;
      v16[4] = &v23;
      v16[5] = &v17;
      objc_msgSend(v9, "xpcIsAssertionActive:withCompletion:", v4, v16);

      if (v18[5])
      {
        nr_framework_log();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

        if (v11)
        {
          nr_framework_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v15 = v18[5];
            *(_DWORD *)buf = 138412546;
            v28 = v4;
            v29 = 2112;
            v30 = v15;
            _os_log_error_impl(&dword_1A0BDB000, v12, OS_LOG_TYPE_ERROR, "NanoRegistry client: Failed to get isAssertionActive value for assertion %@- error %@", buf, 0x16u);
          }

        }
      }
      _Block_object_dispose(&v17, 8);

    }
  }
  v13 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __44__NRPairedDeviceRegistry_isAssertionActive___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NRRegistryClient connection](self, "connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke;
      v19[3] = &unk_1E4494E08;
      v11 = &v20;
      v12 = v7;
      v20 = v12;
      objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pairingID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_3;
      v17[3] = &unk_1E4496928;
      v18 = v12;
      objc_msgSend(v13, "xpcIsPhoneReadyToMigrateDevice:withCompletion:", v14, v17);

LABEL_6:
      goto LABEL_7;
    }
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v11 = &v16;
    v16 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_6;
  }
LABEL_7:

}

void __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_2;
    block[3] = &unk_1E4494F90;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, 3, v2);

}

void __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_4;
    block[3] = &unk_1E44958C0;
    v9 = v6;
    v10 = a2;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __69__NRPairedDeviceRegistry_isPhoneReadyToMigrateDevice_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForRegistryUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_pairedRegistryGetDevicesQueue, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistryDeviceListQueue, 0);
  objc_storeStrong((id *)&self->_legacyDevices, 0);
}

- (void)_submitAlbertPairingReport
{
  void *v3;
  id v4;

  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_14);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "xpcSubmitAlbertPairingReport:", &__block_literal_global_7);

  }
}

- (id)_getLocalDeviceCollection
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__10;
  v9 = __Block_byref_object_dispose__10;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__NRPairedDeviceRegistry_Internal___getLocalDeviceCollection__block_invoke;
  v4[3] = &unk_1E4496FA0;
  v4[4] = &v5;
  -[NRRegistryClient syncGrabRegistryWithReadBlock:](self, "syncGrabRegistryWithReadBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __61__NRPairedDeviceRegistry_Internal___getLocalDeviceCollection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copyWithZone:", 0);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_getChangeHistory
{
  void *v2;
  void *v3;
  void *v4;
  NRDeviceCollectionHistory *v5;
  NRDeviceCollectionHistory *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  v14 = 0;
  -[NRRegistryClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NRPairedDeviceRegistry_Internal___getChangeHistory__block_invoke;
  v8[3] = &unk_1E4496FC8;
  v8[4] = &v9;
  objc_msgSend(v3, "xpcGetChangeHistoryWithBlock:", v8);

  v4 = (void *)v10[5];
  if (v4)
    v5 = v4;
  else
    v5 = objc_alloc_init(NRDeviceCollectionHistory);
  v6 = v5;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __53__NRPairedDeviceRegistry_Internal___getChangeHistory__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_getSecureProperties:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
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
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__NRPairedDeviceRegistry_Internal___getSecureProperties___block_invoke;
  v8[3] = &unk_1E4496228;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[NRRegistryClient syncGrabRegistryWithReadBlock:](self, "syncGrabRegistryWithReadBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __57__NRPairedDeviceRegistry_Internal___getSecureProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = *(id *)(a1 + 32);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v15, (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v16, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (id)_deviceIDAtSwitchIndex:(unsigned int)a3 date:(id *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = *(_QWORD *)&a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__NRPairedDeviceRegistry_Internal___deviceIDAtSwitchIndex_date___block_invoke_2;
    v11[3] = &unk_1E4496FF0;
    v11[4] = &v12;
    v11[5] = a4;
    objc_msgSend(v8, "xpcDeviceIDAtSwitchIndex:withBlock:", v5, v11);

  }
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __64__NRPairedDeviceRegistry_Internal___deviceIDAtSwitchIndex_date___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id *v7;
  id v8;

  v8 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v7 = *(id **)(a1 + 40);
  if (v7)
    objc_storeStrong(v7, a3);

}

- (void)_invalidateActiveDeviceAssertionWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcInvalidateSwitchAssertionWithIdentifier:block:", v6, &__block_literal_global_14);

  }
}

- (void)_getActiveDeviceAssertionsWithInlineBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = (void (**)(id, _QWORD))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  v13 = 0;
  if (!-[NRRegistryClient daemonIdle](self, "daemonIdle"))
  {
    -[NRRegistryClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__NRPairedDeviceRegistry_Internal___getActiveDeviceAssertionsWithInlineBlock___block_invoke_2;
    v7[3] = &unk_1E4497038;
    v7[4] = &v8;
    objc_msgSend(v6, "xpcActiveDeviceAssertions:", v7);

  }
  v4[2](v4, v9[5]);
  _Block_object_dispose(&v8, 8);

}

void __78__NRPairedDeviceRegistry_Internal___getActiveDeviceAssertionsWithInlineBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_pingActiveGizmoWithPriority:(int64_t)a3 withMessageSize:(int64_t)a4 withBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v8 = a5;
  if (-[NRRegistryClient daemonIdle](self, "daemonIdle")
    || (-[NRRegistryClient connection](self, "connection"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_5;
    block[3] = &unk_1E4494F90;
    v12 = &v18;
    v18 = v8;
    v16 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[NRRegistryClient connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke;
    v21[3] = &unk_1E4494E08;
    v12 = &v22;
    v13 = v8;
    v22 = v13;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_3;
    v19[3] = &unk_1E4497088;
    v20 = v13;
    v15 = v13;
    objc_msgSend(v14, "xpcPingActiveGizmoWithPriority:withMessageSize:withBlock:", a3, a4, v19);

  }
}

void __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_2;
  block[3] = &unk_1E4494F90;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
}

void __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_3(uint64_t a1, double a2, double a3)
{
  _QWORD block[4];
  id v6;
  double v7;
  double v8;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_4;
  block[3] = &unk_1E4497060;
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  v8 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __91__NRPairedDeviceRegistry_Internal___pingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
}

- (id)_getClientInfo
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  v12 = (id)MEMORY[0x1E0C9AA60];
  -[NRRegistryClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__NRPairedDeviceRegistry_Internal___getClientInfo__block_invoke;
  v6[3] = &unk_1E4496200;
  v6[4] = &v7;
  objc_msgSend(v3, "xpcClientInfo:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__NRPairedDeviceRegistry_Internal___getClientInfo__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)applyDiff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NRRegistryClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__10;
    v19 = __Block_byref_object_dispose__10;
    v20 = 0;
    -[NRRegistryClient connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__NRPairedDeviceRegistry_Internal__applyDiff___block_invoke_2;
    v14[3] = &unk_1E44970B0;
    v14[4] = &v15;
    objc_msgSend(v7, "xpcApplyDiff:withSecureProperties:block:", v4, 0, v14);

    if (v16[5])
    {
      nr_framework_log();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

      if (v9)
      {
        nr_framework_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v13 = v16[5];
          *(_DWORD *)buf = 138412290;
          v22 = v13;
          _os_log_error_impl(&dword_1A0BDB000, v10, OS_LOG_TYPE_ERROR, "NanoRegistry client: Failed to apply diff to registry because %@", buf, 0xCu);
        }

      }
    }
    v11 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __46__NRPairedDeviceRegistry_Internal__applyDiff___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)isKeychainEnabled
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)objc_opt_class(), "pairedDevicesSelectorBlock", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPairedDeviceRegistry getDevicesMatching:](self, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "valueForProperty:", CFSTR("_keychainOff"));
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  v11 = objc_msgSend(v10, "BOOLValue");
  return v11 ^ 1;
}

- (void)checkIfFlaggedForRecoveryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NRRegistryClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcCheckIfFlaggedForRecoveryWithCompletion:", v4);

}

- (void)clearRecoveryFlagWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NRRegistryClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcClearRecoveryFlagWithCompletion:", v4);

}

@end
