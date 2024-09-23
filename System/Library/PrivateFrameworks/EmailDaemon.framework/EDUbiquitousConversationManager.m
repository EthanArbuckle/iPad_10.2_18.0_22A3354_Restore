@implementation EDUbiquitousConversationManager

void __61__EDUbiquitousConversationManager_hasSubscribedConversations__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "conversationIDsBySyncKey");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count") != 0;

}

- (BOOL)hasSubscribedConversations
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__EDUbiquitousConversationManager_hasSubscribedConversations__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSMutableDictionary)conversationIDsBySyncKey
{
  return self->_conversationIDsBySyncKey;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__EDUbiquitousConversationManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_94 != -1)
    dispatch_once(&log_onceToken_94, block);
  return (OS_os_log *)(id)log_log_94;
}

void __38__EDUbiquitousConversationManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_94;
  log_log_94 = (uint64_t)v1;

}

- (EDUbiquitousConversationManager)initWithDelegate:(id)a3
{
  id v4;
  EDUbiquitousConversationManager *v5;
  NSMutableSet *v6;
  NSMutableSet *unmatchedKeys;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDUbiquitousConversationManager;
  v5 = -[EDUbiquitousConversationManager init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    unmatchedKeys = v5->_unmatchedKeys;
    v5->_unmatchedKeys = v6;

    v8 = dispatch_queue_create("com.apple.mobilemail.UbiquitousConversationManager", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)performInitialSync
{
  EDConversationMultipleRemoteStorage *v3;
  EDConversationRemoteStorage *cloudStorage;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  _QWORD block[5];

  if (!-[EDUbiquitousConversationManager initialized](self, "initialized"))
  {
    v3 = -[EDConversationMultipleRemoteStorage initWithDelegate:]([EDConversationMultipleRemoteStorage alloc], "initWithDelegate:", self);
    cloudStorage = self->_cloudStorage;
    self->_cloudStorage = (EDConversationRemoteStorage *)v3;

    -[EDUbiquitousConversationManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncedConversationIDsBySyncKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    -[EDUbiquitousConversationManager setConversationIDsBySyncKey:](self, "setConversationIDsBySyncKey:", v7);

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__EDUbiquitousConversationManager_performInitialSync__block_invoke;
    block[3] = &unk_1E949AEB8;
    block[4] = self;
    dispatch_async(queue, block);
    -[EDUbiquitousConversationManager setInitialized:](self, "setInitialized:", 1);
  }
}

void __53__EDUbiquitousConversationManager_performInitialSync__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "cloudStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "conversationRemoteStorage:didChangeEntries:reason:");

}

- (id)syncKeyForUpdatedConversation:(int64_t)a3 flags:(unint64_t)a4
{
  NSObject *queue;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  __CFString *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__41;
  v12 = __Block_byref_object_dispose__41;
  v13 = &stru_1E94A4508;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__EDUbiquitousConversationManager_syncKeyForUpdatedConversation_flags___block_invoke;
  block[3] = &unk_1E94A33B0;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  dispatch_sync(queue, block);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __71__EDUbiquitousConversationManager_syncKeyForUpdatedConversation_flags___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_syncKeyForConversationID:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "conversationIDsBySyncKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
}

- (void)setFlags:(unint64_t)a3 forConversations:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  EDUbiquitousConversationManager *v12;
  unint64_t v13;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v15 = a3;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Setting conversation flags %llu for conversations: %@", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__EDUbiquitousConversationManager_setFlags_forConversations___block_invoke;
  block[3] = &unk_1E949BCB8;
  v11 = v6;
  v12 = self;
  v13 = a3;
  v9 = v6;
  dispatch_async(queue, block);

}

uint64_t __61__EDUbiquitousConversationManager_setFlags_forConversations___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__EDUbiquitousConversationManager_setFlags_forConversations___block_invoke_2;
  v5[3] = &unk_1E94A33D8;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v5[5] = v3;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);
  return objc_msgSend(*(id *)(a1 + 40), "_synchronize");
}

void __61__EDUbiquitousConversationManager_setFlags_forConversations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "longLongValue");
  if (v5)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "cloudStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryForKey:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "mutableCopy");

    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("flags"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedLongLongValue");

      v14 = *(_QWORD *)(a1 + 40);
      if (v14 == v13)
      {
LABEL_19:

        goto LABEL_20;
      }
      if (v14)
      {
        +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(_QWORD *)(a1 + 40);
          v31 = 138412802;
          v32 = (uint64_t)v5;
          v33 = 2048;
          v34 = v8;
          v35 = 2048;
          v36 = v16;
          _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "modifying %@ (conversationID: %lld): flags = %llu", (uint8_t *)&v31, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "messageIDsForConversationID:limit:", v8, 25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_msgSend(v18, "count");
          v31 = 134217984;
          v32 = v20;
          _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "found %lu message ids for conversation", (uint8_t *)&v31, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("flags"));

        objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" "));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("message-ids"));

        objc_msgSend(*(id *)(a1 + 32), "_setCloudStorageValue:forKey:", v11, v5);
      }
      else
      {
        +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 138412546;
          v32 = (uint64_t)v5;
          v33 = 2048;
          v34 = v8;
          _os_log_impl(&dword_1D2F2C000, v30, OS_LOG_TYPE_DEFAULT, "delete %@ (conversationID: %lld)", (uint8_t *)&v31, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_setCloudStorageValue:forKey:", 0, v5);
        objc_msgSend(*(id *)(a1 + 32), "conversationIDsBySyncKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObjectForKey:", v5);
      }
    }
    else
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("flags"));

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "messageIDsForConversationID:limit:", v8, 25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 134217984;
        v32 = objc_msgSend(v18, "count");
        _os_log_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_DEFAULT, "found %lu message ids for conversation", (uint8_t *)&v31, 0xCu);
      }

      objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" "));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, CFSTR("message-ids"));

      +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 138412546;
        v32 = (uint64_t)v5;
        v33 = 2112;
        v34 = (uint64_t)v11;
        _os_log_impl(&dword_1D2F2C000, v27, OS_LOG_TYPE_DEFAULT, "creating new cloud entry %@: %@", (uint8_t *)&v31, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_setCloudStorageValue:forKey:", v11, v5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "conversationIDsBySyncKey");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v5);

    }
    goto LABEL_19;
  }
LABEL_20:

}

- (void)_setCloudStorageValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)CFAbsoluteTimeGetCurrent());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("last-modified"));

    -[EDUbiquitousConversationManager cloudStorage](self, "cloudStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDictionary:forKey:", v9, v6);
  }
  else
  {
    -[EDUbiquitousConversationManager cloudStorage](self, "cloudStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeDictionaryForKey:", v6);
  }

}

- (id)_syncKeyForConversationID:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[EDUbiquitousConversationManager conversationIDsBySyncKey](self, "conversationIDsBySyncKey", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        -[EDUbiquitousConversationManager conversationIDsBySyncKey](self, "conversationIDsBySyncKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "longLongValue") == a3;

        if (v13)
        {
          v14 = v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)_synchronize
{
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[EDUbiquitousConversationManager cloudStorage](self, "cloudStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "synchronize");

  +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[EDUbiquitousConversationManager cloudStorage](self, "cloudStorage");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("failed");
    if (v4)
      v8 = CFSTR("succeeded");
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Synchronizing with cloud store %@: %@", (uint8_t *)&v10, 0x16u);

  }
  return v4;
}

- (void)_mergeServerChanges:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  EDUbiquitousConversationManager *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Merging server changes: %@", buf, 0xCu);
  }

  -[EDUbiquitousConversationManager conversationIDsBySyncKey](self, "conversationIDsBySyncKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __55__EDUbiquitousConversationManager__mergeServerChanges___block_invoke;
  v13 = &unk_1E94A0158;
  v14 = self;
  v8 = v7;
  v15 = v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v10);
  +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log", v10, v11, v12, v13, v14);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Finished merging server changes", buf, 2u);
  }

}

void __55__EDUbiquitousConversationManager__mergeServerChanges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "conversationIDsBySyncKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v41 = 134217984;
      v42 = v9;
      _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_DEFAULT, "Server change. Clearing conversation flags for conversation: %lld", (uint8_t *)&v41, 0xCu);
    }

    v24 = *(void **)(a1 + 32);
    if (v9 == *MEMORY[0x1E0D1DC08])
    {
      objc_msgSend(v24, "unmatchedKeys");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObject:](v11, "removeObject:", v5);
    }
    else
    {
      objc_msgSend(v24, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setPersistenceConversationFlags:syncKey:forConversationID:reason:", 0, 0, v9, 1);

      objc_msgSend(*(id *)(a1 + 32), "conversationIDsBySyncKey");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v11, "removeObjectForKey:", v5);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v6;
      -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("message-ids"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _stringToMessageIDs(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("flags"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedLongLongValue");

      v16 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5);
      v17 = *(void **)(a1 + 32);
      v18 = (_QWORD *)MEMORY[0x1E0D1DC08];
      if (v16)
      {
        objc_msgSend(v17, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "persistenceConversationFlagsForConversationID:", v9);

        +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v41 = 134218496;
          v42 = v9;
          v43 = 2048;
          v44 = v15;
          v45 = 2048;
          v46 = v20;
          _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "Server change. Updating conversation flags for conversation: %lld. Old flags %llu new flags %llu", (uint8_t *)&v41, 0x20u);
        }

        if (v15 == v20)
          goto LABEL_25;
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setPersistenceConversationFlags:syncKey:forConversationID:reason:", v15, v5, v9, 1);
      }
      else
      {
        objc_msgSend(v17, "delegate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v33, "conversationIDForMessageIDs:", v13);

        +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v41 = 134217984;
          v42 = v9;
          _os_log_impl(&dword_1D2F2C000, v34, OS_LOG_TYPE_DEFAULT, "Server change. Setting conversation flags for conversation: %lld", (uint8_t *)&v41, 0xCu);
        }

        if (v9 == *v18)
        {
          +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v41) = 0;
            _os_log_impl(&dword_1D2F2C000, v35, OS_LOG_TYPE_DEFAULT, "could not find a conversation that matched those message ids", (uint8_t *)&v41, 2u);
          }

          objc_msgSend(*(id *)(a1 + 32), "unmatchedKeys");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v5);
        }
        else
        {
          +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v41 = 134217984;
            v42 = v9;
            _os_log_impl(&dword_1D2F2C000, v36, OS_LOG_TYPE_DEFAULT, "found conversation %lld", (uint8_t *)&v41, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setPersistenceConversationFlags:syncKey:forConversationID:reason:", v15, v5, v9, 1);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "conversationIDsBySyncKey");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v22, v5);

        }
      }

LABEL_25:
      if (v9 != *v18)
      {
        +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v41 = 134217984;
          v42 = v9;
          _os_log_impl(&dword_1D2F2C000, v39, OS_LOG_TYPE_DEFAULT, "Updating message ids for conversation %lld", (uint8_t *)&v41, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "remoteMessageIDsAdded:forConversationID:", v13, v9);

      }
      goto LABEL_30;
    }
    +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __55__EDUbiquitousConversationManager__mergeServerChanges___block_invoke_cold_1(v11, v25, v26, v27, v28, v29, v30, v31);
  }
LABEL_30:

}

- (void)pruneDatabasePurgingOldestEntries:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v3;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Pruning database. Purging oldest entries %d", buf, 8u);
  }

  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke;
  v7[3] = &unk_1E94A0780;
  v7[4] = self;
  v8 = v3;
  dispatch_async(queue, v7);
}

void __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  _QWORD block[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "cloudStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_2;
  v35[3] = &unk_1E949C150;
  v4 = v26;
  v36 = v4;
  v27 = v3;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v35);
  objc_msgSend(v3, "keysOfEntriesPassingTest:", &__block_literal_global_82);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_30;
    v33[3] = &unk_1E949F220;
    v8 = v7;
    v34 = v8;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v33);
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_36_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    if (v10 >= 0xA)
      v11 = 10;
    else
      v11 = v10;
    objc_msgSend(v9, "subarrayWithRange:", 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKey:", CFSTR("key"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v13);

  }
  objc_msgSend(*(id *)(a1 + 32), "unmatchedKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ef_removeObjectsInArray:", v4);

  if (objc_msgSend(v4, "count"))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v4;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "conversationIDsBySyncKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v15, "addObject:", v22);
            objc_msgSend(*(id *)(a1 + 32), "conversationIDsBySyncKey");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "removeObjectForKey:", v20);

          }
          objc_msgSend(*(id *)(a1 + 32), "_setCloudStorageValue:forKey:", 0, v20);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v17);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "clearConversationFlagsAndSyncKeyForConversationIDs:", v15);

    objc_msgSend(*(id *)(a1 + 32), "_synchronize");
  }
  dispatch_get_global_queue(0, 0);
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_3;
  block[3] = &unk_1E949AEB8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v25, block);

}

void __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  if (!v8)
  {
    +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "deleting entry with flag value of zero: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

BOOL __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("flags"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedLongLongValue") == 0;

  }
  else
  {
    +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __55__EDUbiquitousConversationManager__mergeServerChanges___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

    v5 = 0;
  }

  return v5;
}

void __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("last-modified"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v10[0] = CFSTR("key");
  v10[1] = CFSTR("last-modified");
  v11[0] = v5;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

uint64_t __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_2_34(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("last-modified"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("last-modified"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

void __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -7776000.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v3 = v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pruneConversationTables:", v3);

}

- (void)conversationRemoteStorage:(id)a3 didChangeEntries:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Conversation Remote Storage %{public}@ did change entries %@", buf, 0x16u);
  }

  if ((unint64_t)a5 >= 3)
  {
    if (a5 == 3)
    {
      +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "over quota: pruning database", buf, 2u);
      }

      -[EDUbiquitousConversationManager pruneDatabasePurgingOldestEntries:](self, "pruneDatabasePurgingOldestEntries:", 1);
    }
  }
  else
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__EDUbiquitousConversationManager_conversationRemoteStorage_didChangeEntries_reason___block_invoke;
    v13[3] = &unk_1E949B6D0;
    v13[4] = self;
    v14 = v9;
    dispatch_async(queue, v13);

  }
}

uint64_t __85__EDUbiquitousConversationManager_conversationRemoteStorage_didChangeEntries_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mergeServerChanges:", *(_QWORD *)(a1 + 40));
}

- (void)performDailyExportForChangedConversations:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  EDUbiquitousConversationManager *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Perform daily export for changed conversations: %@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__EDUbiquitousConversationManager_performDailyExportForChangedConversations___block_invoke;
  v8[3] = &unk_1E949B6D0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(queue, v8);

}

void __77__EDUbiquitousConversationManager_performDailyExportForChangedConversations___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  id v35;
  char v36;
  uint64_t v37;
  id obj;
  id obja;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v2)
  {
    v36 = 0;
    v3 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v45 != v3)
          objc_enumerationMutation(obj);
        v5 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "longLongValue");
        objc_msgSend(*(id *)(a1 + 40), "_syncKeyForConversationID:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(*(id *)(a1 + 40), "cloudStorage");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "dictionaryForKey:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_msgSend(v8, "mutableCopy");

          objc_msgSend(*(id *)(a1 + 40), "delegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "messageIDsForConversationID:limit:", v5, 25);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "componentsJoinedByString:", CFSTR(" "));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("message-ids"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqualToString:", v12) & 1) == 0)
          {
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("message-ids"));
            objc_msgSend(*(id *)(a1 + 40), "_setCloudStorageValue:forKey:", v9, v6);
            v36 = 1;
          }

        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v2);

    if ((v36 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "_synchronize");
  }
  else
  {

  }
  obja = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "unmatchedKeys");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v14)
  {
    v16 = *(_QWORD *)v41;
    v37 = *MEMORY[0x1E0D1DC08];
    *(_QWORD *)&v15 = 134217984;
    v34 = v15;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v35);
        v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 40), "cloudStorage", v34);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dictionaryForKey:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("message-ids"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          _stringToMessageIDs(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "delegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "conversationIDForMessageIDs:", v22);

          if (v24 == v37)
          {
            +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_DEFAULT, "could not find a conversation that matched those message ids", buf, 2u);
            }

          }
          else
          {
            +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v34;
              v49 = v24;
              _os_log_impl(&dword_1D2F2C000, v27, OS_LOG_TYPE_DEFAULT, "found conversation %lld", buf, 0xCu);
            }

            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("flags"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "unsignedLongLongValue");

            objc_msgSend(*(id *)(a1 + 40), "delegate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setPersistenceConversationFlags:syncKey:forConversationID:reason:", v29, v18, v24, 1);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "conversationIDsBySyncKey");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v18);

            objc_msgSend(obja, "addObject:", v18);
          }

        }
        else
        {
          +[EDUbiquitousConversationManager log](EDUbiquitousConversationManager, "log");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v18;
            _os_log_impl(&dword_1D2F2C000, v26, OS_LOG_TYPE_DEFAULT, "Removing orphaned entry from unknwown leys set: %@", buf, 0xCu);
          }

          objc_msgSend(obja, "addObject:", v18);
        }

      }
      v14 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 40), "unmatchedKeys");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "ef_removeObjectsInArray:", obja);

}

- (EDUbiquitousConversationManagerDelegate)delegate
{
  return (EDUbiquitousConversationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EDConversationRemoteStorage)cloudStorage
{
  return self->_cloudStorage;
}

- (void)setCloudStorage:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStorage, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setConversationIDsBySyncKey:(id)a3
{
  objc_storeStrong((id *)&self->_conversationIDsBySyncKey, a3);
}

- (NSMutableSet)unmatchedKeys
{
  return self->_unmatchedKeys;
}

- (void)setUnmatchedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_unmatchedKeys, a3);
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmatchedKeys, 0);
  objc_storeStrong((id *)&self->_conversationIDsBySyncKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudStorage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__EDUbiquitousConversationManager__mergeServerChanges___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Synced conversation object is not a dictionary", a5, a6, a7, a8, 0);
}

@end
