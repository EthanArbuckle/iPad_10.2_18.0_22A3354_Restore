@implementation HMDHAP2Storage

- (HMDHAP2Storage)initWithAccessoryBrowser:(id)a3
{
  id v4;
  HMDHAP2Storage *v5;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  uint64_t v10;
  HAPSystemKeychainStore *storage;
  uint64_t v12;
  NSMutableSet *registeredIdentifiers;
  HMDHAP2Storage *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDHAP2Storage;
  v5 = -[HMDHAP2Storage init](&v16, sel_init);
  if (v5)
  {
    v6 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(v6, v7);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
    v10 = objc_claimAutoreleasedReturnValue();
    storage = v5->_storage;
    v5->_storage = (HAPSystemKeychainStore *)v10;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    registeredIdentifiers = v5->_registeredIdentifiers;
    v5->_registeredIdentifiers = (NSMutableSet *)v12;

    objc_storeWeak((id *)&v5->_accessoryBrowser, v4);
    v14 = v5;
  }

  return v5;
}

- (void)resetPairedAccessoryIdentifiers
{
  NSObject *workQueue;
  _QWORD block[5];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HMDHAP2Storage_resetPairedAccessoryIdentifiers__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)registerPairedAccessoryWithIdentifier:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDHAP2Storage *v9;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HMDHAP2Storage_registerPairedAccessoryWithIdentifier___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)deregisterPairedAccessoryWithIdentifier:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDHAP2Storage *v9;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__HMDHAP2Storage_deregisterPairedAccessoryWithIdentifier___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__HMDHAP2Storage_setDelegate___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)hasKeysForIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDHAP2Storage *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMDHAP2Storage_hasKeysForIdentifiers_completion___block_invoke;
  block[3] = &unk_24E79B440;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)fetchControllerKeyForDeviceId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMDHAP2Storage_fetchControllerKeyForDeviceId_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)fetchKeysForIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDHAP2Storage *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HMDHAP2Storage_fetchKeysForIdentifiers_completion___block_invoke;
  block[3] = &unk_24E79B440;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)removeControllerKeyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)removeKeysForIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HMDHAP2Storage_removeKeysForIdentifiers_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)_removeKeysForIdentifiers:(id)a3 completion:(id)a4
{
  NSObject *workQueue;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;

  v12 = a3;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2(workQueue);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__HMDHAP2Storage__removeKeysForIdentifiers_completion___block_invoke;
  v15[3] = &unk_24E773438;
  v15[4] = self;
  v10 = v8;
  v16 = v10;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);
  if (!objc_msgSend(v10, "count"))
  {

    v10 = 0;
  }
  v11 = (void *)objc_msgSend(v10, "copy", v12);
  v7[2](v7, v11);

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __55__HMDHAP2Storage__removeKeysForIdentifiers_completion___block_invoke_2;
  v14[3] = &unk_24E773488;
  v14[4] = self;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);

}

- (void)saveControllerIdentity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is unavailable"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)fetchCacheForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HMDHAP2Storage_fetchCacheForIdentifier_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)saveCacheForIdentifier:(id)a3 data:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *workQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __57__HMDHAP2Storage_saveCacheForIdentifier_data_completion___block_invoke;
  v16[3] = &unk_24E79B3F0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v11;
  v15 = v8;
  dispatch_async(workQueue, v16);

}

- (void)removeCacheForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HMDHAP2Storage_removeCacheForIdentifier_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)saveKeysForIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDHAP2Storage *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke;
  block[3] = &unk_24E79B440;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (HAP2StorageDelegate)delegate
{
  return (HAP2StorageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessoryBrowser);
  objc_storeStrong((id *)&self->_registeredIdentifiers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke_2;
  v16[3] = &unk_24E7734D8;
  v4 = *(void **)(a1 + 32);
  v16[4] = *(_QWORD *)(a1 + 40);
  v11 = v2;
  v17 = v11;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v16);
  v5 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(v11, "count"))
  {
    v6 = (void *)objc_msgSend(v11, "copy");
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke_3;
    v12[3] = &unk_24E773500;
    v13 = v11;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 40);
    v14 = v9;
    v15 = v10;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
}

void __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a2;
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[3];
  v7 = v6;
  v8 = a3;
  objc_msgSend(v5, "deviceIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = objc_msgSend(v7, "savePublicKey:forAccessoryName:error:", v8, v9, &v14);

  v11 = v14;
  if ((v10 & 1) != 0)
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v13 = *(void **)(v12 + 32);
    else
      v13 = 0;
    objc_msgSend(v13, "addObject:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v5);
  }

}

void __52__HMDHAP2Storage_saveKeysForIdentifiers_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "storage:didSaveKeyWithIdentifier:", *(_QWORD *)(a1 + 48), v4);

}

void __54__HMDHAP2Storage_removeCacheForIdentifier_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  if (v2 && (WeakRetained = objc_loadWeakRetained((id *)(v2 + 40))) != 0)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "removeAccessoryCacheForIdentifier:", a1[5]);
    (*(void (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], 0);
  }
  else
  {
    hap2LogInitialize();
    v5 = *MEMORY[0x24BE1BC88];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE1BC88], OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "Storage: Unable to remove cache for %@", (uint8_t *)&v8, 0xCu);
    }
    v6 = a1[6];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
  }

}

void __57__HMDHAP2Storage_saveCacheForIdentifier_data_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  if (v2 && (WeakRetained = objc_loadWeakRetained((id *)(v2 + 40))) != 0)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "saveAccessoryCache:forIdentifier:", a1[6], a1[5]);
    (*(void (**)(_QWORD, _QWORD))(a1[7] + 16))(a1[7], 0);
  }
  else
  {
    hap2LogInitialize();
    v5 = *MEMORY[0x24BE1BC88];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE1BC88], OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "Storage: Unable to save cache for %@", (uint8_t *)&v8, 0xCu);
    }
    v6 = a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
  }

}

void __53__HMDHAP2Storage_fetchCacheForIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (WeakRetained = objc_loadWeakRetained((id *)(v2 + 40))) != 0)
  {
    v4 = WeakRetained;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__HMDHAP2Storage_fetchCacheForIdentifier_completion___block_invoke_15;
    v9[3] = &unk_24E7734B0;
    v5 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v4, "fetchAccessoryCacheForIdentifier:completion:", v5, v9);

  }
  else
  {
    hap2LogInitialize();
    v6 = *MEMORY[0x24BE1BC88];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE1BC88], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_error_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "Storage: Unable to retrieve cache for %@", buf, 0xCu);
    }
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v4);
  }

}

void __53__HMDHAP2Storage_fetchCacheForIdentifier_completion___block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __55__HMDHAP2Storage__removeKeysForIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[3];
  v5 = v4;
  objc_msgSend(v3, "deviceIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v5, "removeAccessoryKeyForName:error:", v6, &v11);
  v8 = v11;

  if ((v7 & 1) != 0)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(void **)(v9 + 32);
    else
      v10 = 0;
    objc_msgSend(v10, "removeObject:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v3);
  }

}

void __55__HMDHAP2Storage__removeKeysForIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage:didRemoveKeyWithIdentifier:", *(_QWORD *)(a1 + 32), v4);

}

uint64_t __54__HMDHAP2Storage_removeKeysForIdentifiers_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeKeysForIdentifiers:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __53__HMDHAP2Storage_fetchKeysForIdentifiers_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __53__HMDHAP2Storage_fetchKeysForIdentifiers_completion___block_invoke_2;
  v14 = &unk_24E773460;
  v4 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v16 = v9;
  v17 = v2;
  v5 = v2;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v11);
  if (!objc_msgSend(v9, "count"))
  {

    v9 = 0;
  }
  v6 = *(_QWORD *)(a1 + 48);
  v7 = (void *)objc_msgSend(v5, "copy", v9, v11, v12, v13, v14, v15);
  v8 = (void *)objc_msgSend(v10, "copy");
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

}

void __53__HMDHAP2Storage_fetchKeysForIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  char v13;

  v3 = a2;
  v13 = 0;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[3];
  v5 = v4;
  objc_msgSend(v3, "deviceIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "readPublicKeyForAccessoryName:registeredWithHomeKit:error:", v6, &v13, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (v7)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v3);

      goto LABEL_9;
    }
    v9 = *(void **)(a1 + 48);
    v10 = v7;
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    v10 = v8;
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v3);
LABEL_9:

}

void __59__HMDHAP2Storage_fetchControllerKeyForDeviceId_completion___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = (void *)a1[5];
  v4 = v2;
  objc_msgSend(v3, "deviceIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "readControllerPairingKeyForAccessory:error:", v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v6)
  {
    v8 = v6;
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v9 = v7;
  }
  (*(void (**)(_QWORD, void *, id))(a1[6] + 16))(a1[6], v8, v9);

}

void __51__HMDHAP2Storage_hasKeysForIdentifiers_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__HMDHAP2Storage_hasKeysForIdentifiers_completion___block_invoke_2;
  v8[3] = &unk_24E773438;
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v9 = v2;
  v10 = v3;
  v7 = v2;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = (void *)objc_msgSend(v7, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

}

void __51__HMDHAP2Storage_hasKeysForIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = *(_QWORD **)(a1 + 40);
  if (v5)
    v5 = (_QWORD *)v5[4];
  v6 = v5;
  v7 = a2;
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "containsObject:", v7));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

}

id __30__HMDHAP2Storage_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

void __58__HMDHAP2Storage_deregisterPairedAccessoryWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BAD8]), "initWithDeviceIDString:", *(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      v4 = *(void **)(v3 + 32);
    else
      v4 = 0;
    objc_msgSend(v4, "removeObject:", v2);
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_removeKeysForIdentifiers:completion:", v6, &__block_literal_global_647);

  }
  else
  {
    hap2LogInitialize();
    v7 = *MEMORY[0x24BE1BC90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE1BC90], OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "Ignoring invalid deregistered device ID: %@", (uint8_t *)&v9, 0xCu);
    }
  }

}

uint64_t __58__HMDHAP2Storage_deregisterPairedAccessoryWithIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_7);
}

void __58__HMDHAP2Storage_deregisterPairedAccessoryWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  hap2LogInitialize();
  v6 = *MEMORY[0x24BE1BC90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE1BC90], OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_debug_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "remove key id=%@ error=%@", (uint8_t *)&v7, 0x16u);
  }

}

void __56__HMDHAP2Storage_registerPairedAccessoryWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BAD8]), "initWithDeviceIDString:", *(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      v4 = *(void **)(v3 + 32);
    else
      v4 = 0;
    objc_msgSend(v4, "addObject:", v2);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storage:didSaveKeyWithIdentifier:", *(_QWORD *)(a1 + 40), v2);

  }
  else
  {
    hap2LogInitialize();
    v6 = *MEMORY[0x24BE1BC90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE1BC90], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_debug_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "Ignoring invalid registered device ID: %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

uint64_t __49__HMDHAP2Storage_resetPairedAccessoryIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 32);
  else
    v2 = 0;
  return objc_msgSend(v2, "removeAllObjects");
}

@end
