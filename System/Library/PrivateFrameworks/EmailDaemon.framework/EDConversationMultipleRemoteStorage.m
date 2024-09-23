@implementation EDConversationMultipleRemoteStorage

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__EDConversationMultipleRemoteStorage_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_23 != -1)
    dispatch_once(&log_onceToken_23, block);
  return (OS_os_log *)(id)log_log_23;
}

void __42__EDConversationMultipleRemoteStorage_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_23;
  log_log_23 = (uint64_t)v1;

}

- (EDConversationMultipleRemoteStorage)initWithDelegate:(id)a3
{
  id v4;
  EDConversationMultipleRemoteStorage *v5;
  EDConversationMultipleRemoteStorage *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *privateQueue;
  NSObject *v9;
  _QWORD block[4];
  EDConversationMultipleRemoteStorage *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EDConversationMultipleRemoteStorage;
  v5 = -[EDConversationMultipleRemoteStorage init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_create("com.apple.mail.EDConversationMultipleRemoteStorage", 0);
    privateQueue = v6->_privateQueue;
    v6->_privateQueue = (OS_dispatch_queue *)v7;

    v9 = v6->_privateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__EDConversationMultipleRemoteStorage_initWithDelegate___block_invoke;
    block[3] = &unk_1E949AEB8;
    v12 = v6;
    dispatch_sync(v9, block);

  }
  return v6;
}

void __56__EDConversationMultipleRemoteStorage_initWithDelegate___block_invoke(uint64_t a1)
{
  EDTransactionService *v2;
  objc_class *v3;
  EDTransactionService *v4;
  EDConversationRemoteKVSStorage *v5;
  EDConversationRemoteCloudKitStorage *v6;
  id v7;

  v5 = -[EDConversationRemoteKVSStorage initWithDelegate:]([EDConversationRemoteKVSStorage alloc], "initWithDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setKvsStorage:");

  v6 = -[EDConversationRemoteCloudKitStorage initWithDelegate:]([EDConversationRemoteCloudKitStorage alloc], "initWithDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setCloudKitStorage:");

  v2 = [EDTransactionService alloc];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[EDTransactionService initWithServiceName:](v2, "initWithServiceName:");
  objc_msgSend(*(id *)(a1 + 32), "setDataReplicationTransaction:", v4);

}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  NSObject *privateQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__EDConversationMultipleRemoteStorage_dictionaryForKey___block_invoke;
  block[3] = &unk_1E949BE18;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(privateQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __56__EDConversationMultipleRemoteStorage_dictionaryForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "cloudKitStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dictionaryRepresentation
{
  NSObject *privateQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__EDConversationMultipleRemoteStorage_dictionaryRepresentation__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __63__EDConversationMultipleRemoteStorage_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "cloudKitStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeDictionaryForKey:(id)a3
{
  id v4;
  NSObject *privateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__EDConversationMultipleRemoteStorage_removeDictionaryForKey___block_invoke;
  block[3] = &unk_1E949B6D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(privateQueue, block);

}

void __62__EDConversationMultipleRemoteStorage_removeDictionaryForKey___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "kvsStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeDictionaryForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "cloudKitStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDictionaryForKey:", *(_QWORD *)(a1 + 40));

}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *privateQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__EDConversationMultipleRemoteStorage_setDictionary_forKey___block_invoke;
  block[3] = &unk_1E949B390;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(privateQueue, block);

}

void __60__EDConversationMultipleRemoteStorage_setDictionary_forKey___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "kvsStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDictionary:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "cloudKitStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDictionary:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)synchronize
{
  NSObject *privateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -86;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__EDConversationMultipleRemoteStorage_synchronize__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __50__EDConversationMultipleRemoteStorage_synchronize__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "kvsStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "synchronize"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudKitStorage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "synchronize");

  }
}

- (void)refresh
{
  NSObject *privateQueue;
  _QWORD block[5];

  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EDConversationMultipleRemoteStorage_refresh__block_invoke;
  block[3] = &unk_1E949AEB8;
  block[4] = self;
  dispatch_sync(privateQueue, block);
}

void __46__EDConversationMultipleRemoteStorage_refresh__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "kvsStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refresh");

  objc_msgSend(*(id *)(a1 + 32), "cloudKitStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refresh");

}

- (BOOL)isInitialized
{
  NSObject *privateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -86;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__EDConversationMultipleRemoteStorage_isInitialized__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__EDConversationMultipleRemoteStorage_isInitialized__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "kvsStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInitialized"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudKitStorage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isInitialized");

  }
}

- (EDConversationRemoteStorage)kvsStorage
{
  return self->_kvsStorage;
}

- (id)storageName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EDConversationMultipleRemoteStorage kvsStorage](self, "kvsStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDConversationMultipleRemoteStorage cloudKitStorage](self, "cloudKitStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Multiple Storages: [%@, %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)conversationRemoteStorage:(id)a3 didChangeEntries:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  EDConversationMultipleRemoteStorage *v19;
  id v20;
  id v21;
  int64_t v22;

  v8 = a3;
  v9 = a4;
  -[EDConversationMultipleRemoteStorage cloudKitStorage](self, "cloudKitStorage");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
  {
    -[EDConversationMultipleRemoteStorage dataReplicationTransaction](self, "dataReplicationTransaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startTransaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[EDConversationMultipleRemoteStorage privateQueue](self, "privateQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__EDConversationMultipleRemoteStorage_conversationRemoteStorage_didChangeEntries_reason___block_invoke;
  block[3] = &unk_1E949BE68;
  v18 = v8;
  v19 = self;
  v21 = v11;
  v22 = a5;
  v20 = v9;
  v14 = v11;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, block);

}

void __89__EDConversationMultipleRemoteStorage_conversationRemoteStorage_didChangeEntries_reason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "kvsStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v9, "kvsStorage");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "cloudKitStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_saveChanges:fromStorage:toStorage:synchronize:", v10, v11, v8, 1);
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "cloudKitStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v5)
      goto LABEL_6;
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "cloudKitStorage");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "kvsStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_saveChanges:fromStorage:toStorage:synchronize:", v7, v11, v8, 1);
  }

LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "conversationRemoteStorage:didChangeEntries:reason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "dataReplicationTransaction");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endTransaction:", *(_QWORD *)(a1 + 56));

  }
}

- (void)conversationRemoteStorageDidInitialize:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EDConversationMultipleRemoteStorage privateQueue](self, "privateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend(*(id *)(a1 + 32), "dataReplicationTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPendingTransactions");

  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(*(id *)(a1 + 32), "dataReplicationTransaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resetPendingTransactions");

    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "cloudKitStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "kvsStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_replicateAllContentFromStore:toStore:synchronize:", v14, v15, 1);

    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_handleStorageReady:", *(_QWORD *)(a1 + 40));
}

- (void)_saveChanges:(id)a3 fromStorage:(id)a4 toStorage:(id)a5 synchronize:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v6 = a6;
  v41 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v25 = a4;
  v9 = a5;
  objc_msgSend((id)objc_opt_class(), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v33 = objc_msgSend(v27, "count");
    v34 = 2114;
    v35 = v25;
    v36 = 2114;
    v37 = v9;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_INFO, "Replicating %lu changes from %{public}@ to %{public}@", buf, 0x20u);
  }
  v24 = v6;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v27, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v11)
  {
    v12 = 0;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v27, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dictionaryForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "removeDictionaryForKey:", v15);
          v12 = 1;
        }
        else
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("last-modified"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("last-modified"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v18 > v19;

          if (v20)
          {
            v21 = (void *)objc_msgSend(v16, "mutableCopy");
            objc_msgSend(v9, "setDictionary:forKey:", v21, v15);

            objc_msgSend((id)objc_opt_class(), "log");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138544130;
              v33 = v15;
              v34 = 2114;
              v35 = v25;
              v36 = 2114;
              v37 = v9;
              v38 = 2114;
              v39 = v9;
              _os_log_debug_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEBUG, "Change %{public}@ replicated from %{public}@ to %{public}@, because %{public}@ entry is more recent.", buf, 0x2Au);
            }
            v12 = 1;
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "log");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138544130;
              v33 = v15;
              v34 = 2114;
              v35 = v25;
              v36 = 2114;
              v37 = v9;
              v38 = 2114;
              v39 = v9;
              _os_log_debug_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEBUG, "Ignoring change with Key %{public}@ from %{public}@ to %{public}@, because %{public}@ entry is more recent.", buf, 0x2Au);
            }
          }

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v11);

    if ((v12 & v24) == 1)
      objc_msgSend(v9, "synchronize");
  }
  else
  {

  }
  objc_msgSend((id)objc_opt_class(), "log");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v33 = (uint64_t)v25;
    v34 = 2114;
    v35 = v9;
    _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_INFO, "Finished replicating changes from %{public}@ to %{public}@", buf, 0x16u);
  }

}

- (void)_handleStorageReady:(id)a3
{
  EDConversationRemoteCloudKitStorage *v4;
  EDConversationRemoteCloudKitStorage *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = (EDConversationRemoteCloudKitStorage *)a3;
  v5 = v4;
  if (self->_cloudKitStorage == v4
    && !-[EDConversationRemoteCloudKitStorage isMigratedFromKVSStorage](v4, "isMigratedFromKVSStorage"))
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_INFO, "CloudKitStorage finished initializing. Starting migrating content from KVS to CloudKit", buf, 2u);
    }

    -[EDConversationMultipleRemoteStorage _replicateAllContentFromStore:toStore:synchronize:](self, "_replicateAllContentFromStore:toStore:synchronize:", self->_kvsStorage, self->_cloudKitStorage, 0);
    -[EDConversationRemoteCloudKitStorage setMigratedFromKVSStorage:](self->_cloudKitStorage, "setMigratedFromKVSStorage:", 1);
    -[EDConversationRemoteCloudKitStorage synchronize](self->_cloudKitStorage, "synchronize");
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "Finished migrating content from KVS to CloudKit", v11, 2u);
    }

  }
  if (-[EDConversationRemoteCloudKitStorage isInitialized](self->_cloudKitStorage, "isInitialized"))
  {
    if (-[EDConversationRemoteStorage isInitialized](self->_kvsStorage, "isInitialized"))
    {
      -[EDConversationMultipleRemoteStorage delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[EDConversationMultipleRemoteStorage delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "conversationRemoteStorageDidInitialize:", self);

      }
    }
  }

}

- (void)_replicateAllContentFromStore:(id)a3 toStore:(id)a4 synchronize:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  objc_msgSend(v10, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDConversationMultipleRemoteStorage _saveChanges:fromStorage:toStorage:synchronize:](self, "_saveChanges:fromStorage:toStorage:synchronize:", v9, v10, v8, v5);

}

- (EDConversationRemoteStorageDelegate)delegate
{
  return (EDConversationRemoteStorageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void)setKvsStorage:(id)a3
{
  objc_storeStrong((id *)&self->_kvsStorage, a3);
}

- (EDConversationRemoteCloudKitStorage)cloudKitStorage
{
  return self->_cloudKitStorage;
}

- (void)setCloudKitStorage:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitStorage, a3);
}

- (EDTransactionService)dataReplicationTransaction
{
  return self->_dataReplicationTransaction;
}

- (void)setDataReplicationTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_dataReplicationTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataReplicationTransaction, 0);
  objc_storeStrong((id *)&self->_cloudKitStorage, 0);
  objc_storeStrong((id *)&self->_kvsStorage, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Finished replicating data from cloudKit to KVS", a5, a6, a7, a8, 0);
}

void __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Found pending data replication transaction. Retrying replication from cloudKit to KVS", a5, a6, a7, a8, 0);
}

@end
