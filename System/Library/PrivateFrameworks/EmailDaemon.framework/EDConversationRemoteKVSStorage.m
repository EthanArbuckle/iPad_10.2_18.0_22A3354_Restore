@implementation EDConversationRemoteKVSStorage

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EDConversationRemoteKVSStorage_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_27 != -1)
    dispatch_once(&log_onceToken_27, block);
  return (OS_os_log *)(id)log_log_27;
}

void __37__EDConversationRemoteKVSStorage_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_27;
  log_log_27 = (uint64_t)v1;

}

- (EDConversationRemoteKVSStorage)initWithDelegate:(id)a3
{
  id v4;
  EDConversationRemoteKVSStorage *v5;
  EDConversationRemoteKVSStorage *v6;
  NSObject *v7;
  uint64_t v8;
  NSUbiquitousKeyValueStore *kvStore;
  dispatch_queue_t v10;
  OS_dispatch_queue *privateQueue;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  EDConversationRemoteKVSStorage *v16;
  uint8_t buf[16];
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EDConversationRemoteKVSStorage;
  v5 = -[EDConversationRemoteKVSStorage init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Initializing Conversation KVS storage", buf, 2u);
    }

    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x1E0CB3A38], "additionalStoreWithIdentifier:", CFSTR("com.apple.mail.threadinfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    kvStore = v5->_kvStore;
    v5->_kvStore = (NSUbiquitousKeyValueStore *)v8;

    v10 = dispatch_queue_create("com.apple.mail.EDConversationRemoteKVSStorage", 0);
    privateQueue = v5->_privateQueue;
    v5->_privateQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__storeChangedExternally_, *MEMORY[0x1E0CB3368], v6->_kvStore);
    v13 = v6->_privateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__EDConversationRemoteKVSStorage_initWithDelegate___block_invoke;
    block[3] = &unk_1E949AEB8;
    v16 = v6;
    dispatch_async(v13, block);

  }
  return v6;
}

void __51__EDConversationRemoteKVSStorage_initWithDelegate___block_invoke(uint64_t a1)
{
  char v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setInitialized:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationRemoteStorageDidInitialize:", *(_QWORD *)(a1 + 32));

  }
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *privateQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  EDConversationRemoteKVSStorage *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__EDConversationRemoteKVSStorage_setDictionary_forKey___block_invoke;
  block[3] = &unk_1E949B390;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(privateQueue, block);

}

void __55__EDConversationRemoteKVSStorage_setDictionary_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("message-ids"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subsetOfMessageIDsToSyncFromMessageIDString:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("message-ids"));
    objc_msgSend(*(id *)(a1 + 40), "kvStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDictionary:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "kvStore");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  }

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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__EDConversationRemoteKVSStorage_dictionaryRepresentation__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__EDConversationRemoteKVSStorage_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "kvStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

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
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__EDConversationRemoteKVSStorage_dictionaryForKey___block_invoke;
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

void __51__EDConversationRemoteKVSStorage_dictionaryForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "kvStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
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
  block[2] = __57__EDConversationRemoteKVSStorage_removeDictionaryForKey___block_invoke;
  block[3] = &unk_1E949B6D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(privateQueue, block);

}

void __57__EDConversationRemoteKVSStorage_removeDictionaryForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "kvStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

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
  v9 = 0;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__EDConversationRemoteKVSStorage_synchronize__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __45__EDConversationRemoteKVSStorage_synchronize__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "kvStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "synchronize");

  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "kvStore");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("succeeded");
    if (!v4)
      v7 = CFSTR("failed");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Synchronizing with KVS store %@: %@", (uint8_t *)&v8, 0x16u);

  }
}

- (id)storageName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)initialized
{
  return 1;
}

- (id)subsetOfMessageIDsToSyncFromMessageIDString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__EDConversationRemoteKVSStorage_subsetOfMessageIDsToSyncFromMessageIDString___block_invoke;
  v9[3] = &unk_1E949C128;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __78__EDConversationRemoteKVSStorage_subsetOfMessageIDsToSyncFromMessageIDString___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  if (a3 >= 5)
    *a4 = 1;
  return result;
}

- (void)_storeChangedExternally:(id)a3
{
  id v4;
  NSObject *privateQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  EDConversationRemoteKVSStorage *v9;

  v4 = a3;
  privateQueue = self->_privateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__EDConversationRemoteKVSStorage__storeChangedExternally___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(privateQueue, v7);

}

void __58__EDConversationRemoteKVSStorage__storeChangedExternally___block_invoke(uint64_t a1)
{
  void *v1;
  id *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  void (**v10)(void *, uint64_t, void *, _QWORD);
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  unint64_t v28;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD aBlock[4];
  NSObject *v36;
  uint8_t v37[128];
  uint8_t buf[4];
  __CFString *v39;
  __int16 v40;
  NSObject *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "userInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3358]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3360]);
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  v28 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown change reason (%lu)"), v5);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E949C170[v5];
    }
    *(_DWORD *)buf = 138412546;
    v39 = v7;
    v40 = 2112;
    v41 = v30;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Received external KVS change event: %@, changed keys=%@", buf, 0x16u);

  }
  if (v5 != 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSObject count](v30, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__EDConversationRemoteKVSStorage__storeChangedExternally___block_invoke_24;
    aBlock[3] = &unk_1E949C150;
    v26 = v9;
    v36 = v26;
    v10 = (void (**)(void *, uint64_t, void *, _QWORD))_Block_copy(aBlock);
    if (-[NSObject count](v30, "count"))
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v11 = v30;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v32 != v13)
              objc_enumerationMutation(v11);
            v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v3, "dictionaryForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (!v16)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v1 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v1;
            }
            v10[2](v10, v15, v17, 0);
            if (!v16)

          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        }
        while (v12);
      }
    }
    else
    {
      objc_msgSend(v3, "dictionaryRepresentation");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v10);
    }

    if (v28 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown change reason (%lu)"), v28);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E949C170[v28];
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v39 = v18;
      v40 = 2112;
      v41 = v26;
      _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
    }

    if (v28)
    {
      v20 = a1;
      if (v28 == 1)
      {
        v21 = 1;
LABEL_37:
        v24 = v20;
        objc_msgSend(*(id *)(v20 + 40), "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "conversationRemoteStorage:didChangeEntries:reason:", *(_QWORD *)(v24 + 40), v26, v21);

        v8 = v26;
        goto LABEL_38;
      }
      objc_msgSend((id)objc_opt_class(), "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v18;
        _os_log_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEFAULT, "Unknown change reason: %@", buf, 0xCu);
      }

      v21 = 0;
    }
    else
    {
      v21 = 2;
    }
    v20 = a1;
    goto LABEL_37;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "iCloud Key Value Store Over-Quota…", buf, 2u);
  }
LABEL_38:

}

void __58__EDConversationRemoteKVSStorage__storeChangedExternally___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);
  }

}

- (EDConversationRemoteStorageDelegate)delegate
{
  return (EDConversationRemoteStorageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUbiquitousKeyValueStore)kvStore
{
  return self->_kvStore;
}

- (void)setKvStore:(id)a3
{
  objc_storeStrong((id *)&self->_kvStore, a3);
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_kvStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
