@implementation DESDeviceIdentifierStore

- (DESDeviceIdentifierStore)init
{
  void *v3;
  DESDeviceIdentifierStore *v4;

  DESDeviceIdentifierStoreURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DESDeviceIdentifierStore initWithStoreURL:](self, "initWithStoreURL:", v3);

  return v4;
}

- (DESDeviceIdentifierStore)initWithStoreURL:(id)a3
{
  id v5;
  DESDeviceIdentifierStore *v6;
  DESDeviceIdentifierStore *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSObject *v10;
  _QWORD block[4];
  DESDeviceIdentifierStore *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DESDeviceIdentifierStore;
  v6 = -[DESDeviceIdentifierStore init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeURL, a3);
    v8 = dispatch_queue_create("com.apple.distributed-evaluation.identifier-store", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = v7->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__DESDeviceIdentifierStore_initWithStoreURL___block_invoke;
    block[3] = &unk_1E706E9B0;
    v13 = v7;
    dispatch_async(v10, block);

  }
  return v7;
}

uint64_t __45__DESDeviceIdentifierStore_initWithStoreURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readIdentifierStore");
}

- (id)identifierForBundleId:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  DESDeviceIdentifierStore *v18;
  id v19;
  uint64_t *v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dodML_%@_identifier"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__DESDeviceIdentifierStore_identifierForBundleId___block_invoke;
  block[3] = &unk_1E706E9D8;
  v23 = &v24;
  block[4] = self;
  v8 = v5;
  v22 = v8;
  dispatch_sync(queue, block);
  v9 = (void *)v25[5];
  if (v9)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v25[5];
    v25[5] = v12;

    v14 = self->_queue;
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __50__DESDeviceIdentifierStore_identifierForBundleId___block_invoke_2;
    v16[3] = &unk_1E706EA00;
    v17 = v4;
    v18 = self;
    v20 = &v24;
    v19 = v8;
    dispatch_async(v14, v16);
    v10 = (id)v25[5];

  }
  _Block_object_dispose(&v24, 8);

  return v10;
}

void __50__DESDeviceIdentifierStore_identifierForBundleId___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __50__DESDeviceIdentifierStore_identifierForBundleId___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B96E5000, v2, OS_LOG_TYPE_INFO, "Saving new DES identifier for: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "_writeIdentifierStore");
}

- (void)_readIdentifierStore
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B96E5000, a2, OS_LOG_TYPE_ERROR, "Failed to read DES identifier data because %@", (uint8_t *)&v2, 0xCu);
}

- (void)_writeIdentifierStore
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSURL *storeURL;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_deviceIdentifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v5;
  if (v4)
  {
    storeURL = self->_storeURL;
    v9 = v5;
    objc_msgSend(v4, "writeToURL:options:error:", storeURL, 0x40000000, &v9);
    v8 = v6;
    v6 = v9;
  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1B96E5000, v8, OS_LOG_TYPE_DEFAULT, "Could not write new DES identifier file because %@", buf, 0xCu);
    }
  }

}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_storeURL, a3);
}

- (NSMutableDictionary)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (void)setDeviceIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
