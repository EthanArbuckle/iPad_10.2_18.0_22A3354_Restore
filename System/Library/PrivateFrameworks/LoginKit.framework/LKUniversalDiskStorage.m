@implementation LKUniversalDiskStorage

+ (id)sharedStorage
{
  if (sharedStorage_onceToken != -1)
    dispatch_once(&sharedStorage_onceToken, &__block_literal_global_4);
  return (id)sharedStorage__sharedInstance;
}

void __39__LKUniversalDiskStorage_sharedStorage__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedStorage__sharedInstance;
  sharedStorage__sharedInstance = v0;

}

- (LKUniversalDiskStorage)init
{
  LKUniversalDiskStorage *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *storageQueue;
  const char *v5;
  NSObject *v6;
  _QWORD handler[4];
  LKUniversalDiskStorage *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LKUniversalDiskStorage;
  v2 = -[LKUniversalDiskStorage init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("LDTemporaryLocalStorageQueue", 0);
    storageQueue = v2->_storageQueue;
    v2->_storageQueue = (OS_dispatch_queue *)v3;

    pthread_rwlock_init(&v2->_lock, 0);
    v2->_storageDictionaryModified = 1;
    v5 = (const char *)objc_msgSend(CFSTR("LKUStorageDictionaryModified"), "UTF8String");
    v6 = v2->_storageQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __30__LKUniversalDiskStorage_init__block_invoke;
    handler[3] = &unk_24D59B0D0;
    v9 = v2;
    notify_register_dispatch(v5, &init_notifyToken, v6, handler);

  }
  return v2;
}

uint64_t __30__LKUniversalDiskStorage_init__block_invoke(uint64_t a1)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412546;
    v4 = CFSTR("LKUStorageDictionaryModified");
    v5 = 1024;
    v6 = init_notifyToken;
    _os_log_impl(&dword_2167FC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Notified with %@, token: %d", (uint8_t *)&v3, 0x12u);
  }
  pthread_rwlock_wrlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return pthread_rwlock_unlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (BOOL)saveKeyValuePairs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v25;
  id v26;

  v6 = a3;
  pthread_rwlock_wrlock(&self->_lock);
  -[LKUniversalDiskStorage _refreshStorageCacheIfNeeded](self, "_refreshStorageCacheIfNeeded");
  -[LKUniversalDiskStorage storageDictionary](self, "storageDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[LKUniversalDiskStorage storageDictionary](self, "storageDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "addEntriesFromDictionary:", v6);
    v10 = (void *)objc_msgSend(v9, "copy");
    -[LKUniversalDiskStorage setStorageDictionary:](self, "setStorageDictionary:", v10);

  }
  else
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    -[LKUniversalDiskStorage setStorageDictionary:](self, "setStorageDictionary:", v9);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[LKUniversalDiskStorage localDirectoryPath](LKUniversalDiskStorage, "localDirectoryPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if ((v13 & 1) != 0)
  {
    v14 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[LKUniversalDiskStorage localDirectoryPath](LKUniversalDiskStorage, "localDirectoryPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v17 = objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v26);
  v14 = v26;

  if ((v17 & 1) == 0)
  {
    pthread_rwlock_unlock(&self->_lock);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[LKUniversalDiskStorage saveKeyValuePairs:error:].cold.2();
      if (a4)
        goto LABEL_15;
    }
    else if (a4)
    {
LABEL_15:
      v14 = objc_retainAutorelease(v14);
      v23 = 0;
      *a4 = v14;
      goto LABEL_12;
    }
    v23 = 0;
    goto LABEL_12;
  }
LABEL_7:
  v18 = v14;
  -[LKUniversalDiskStorage storageDictionary](self, "storageDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDBCF48];
  +[LKUniversalDiskStorage localDictionaryPath](LKUniversalDiskStorage, "localDictionaryPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fileURLWithPath:isDirectory:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v18;
  v23 = objc_msgSend(v19, "writeToURL:error:", v22, &v25);
  v14 = v25;

  if ((v23 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[LKUniversalDiskStorage saveKeyValuePairs:error:].cold.1();
      if (!a4)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (a4)
LABEL_10:
      *a4 = objc_retainAutorelease(v14);
  }
LABEL_11:
  -[LKUniversalDiskStorage setStorageDictionaryModified:](self, "setStorageDictionaryModified:", 1);
  pthread_rwlock_unlock(&self->_lock);
LABEL_12:

  return v23;
}

- (void)saveKeyValuePairs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[LKUniversalDiskStorage storageQueue](self, "storageQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__LKUniversalDiskStorage_saveKeyValuePairs_completionHandler___block_invoke;
  block[3] = &unk_24D59B028;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __62__LKUniversalDiskStorage_saveKeyValuePairs_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  v4 = objc_msgSend(v2, "saveKeyValuePairs:error:", v3, &v7);
  v5 = v7;
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v5);

}

- (id)retrieveValueForKey:(id)a3
{
  _opaque_pthread_rwlock_t *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_rwlock_rdlock(p_lock);
  -[LKUniversalDiskStorage _refreshStorageCacheIfNeeded](self, "_refreshStorageCacheIfNeeded");
  -[LKUniversalDiskStorage storageDictionary](self, "storageDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_rwlock_unlock(p_lock);
  return v7;
}

- (BOOL)clearKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pthread_rwlock_wrlock(&self->_lock);
  -[LKUniversalDiskStorage _refreshStorageCacheIfNeeded](self, "_refreshStorageCacheIfNeeded");
  -[LKUniversalDiskStorage storageDictionary](self, "storageDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LKUniversalDiskStorage storageDictionary](self, "storageDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v10);
    }

    v13 = (void *)objc_msgSend(v7, "copy");
    -[LKUniversalDiskStorage setStorageDictionary:](self, "setStorageDictionary:", v13);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[LKUniversalDiskStorage storageDictionary](self, "storageDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_impl(&dword_2167FC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Storing storage dictionary to disk... %{public}@", buf, 0xCu);

    }
    -[LKUniversalDiskStorage storageDictionary](self, "storageDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDBCF48];
    +[LKUniversalDiskStorage localDictionaryPath](LKUniversalDiskStorage, "localDictionaryPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPath:isDirectory:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v19 = objc_msgSend(v15, "writeToURL:error:", v18, &v22);
    v20 = v22;

    if ((v19 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[LKUniversalDiskStorage clearKeys:].cold.1();
    -[LKUniversalDiskStorage setStorageDictionaryModified:](self, "setStorageDictionaryModified:", 1);
    pthread_rwlock_unlock(&self->_lock);

  }
  else
  {
    pthread_rwlock_unlock(&self->_lock);
    v19 = 1;
  }

  return v19;
}

- (void)clearKeys:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[LKUniversalDiskStorage storageQueue](self, "storageQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__LKUniversalDiskStorage_clearKeys_completionHandler___block_invoke;
  block[3] = &unk_24D59B028;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __54__LKUniversalDiskStorage_clearKeys_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "clearKeys:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (void)clearAllKeyValueStorage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[LKUniversalDiskStorage storageQueue](self, "storageQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__LKUniversalDiskStorage_clearAllKeyValueStorage___block_invoke;
  v7[3] = &unk_24D59AE88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__LKUniversalDiskStorage_clearAllKeyValueStorage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  pthread_rwlock_wrlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[LKUniversalDiskStorage localDictionaryPath](LKUniversalDiskStorage, "localDictionaryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v2, "removeItemAtPath:error:", v3, &v6);
  v4 = v6;

  objc_msgSend(*(id *)(a1 + 32), "setStorageDictionary:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setStorageDictionaryModified:", 1);
  pthread_rwlock_unlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 32));
  if (v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __50__LKUniversalDiskStorage_clearAllKeyValueStorage___block_invoke_cold_1();
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);

}

- (void)setStorageDictionaryModified:(BOOL)a3
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  self->_storageDictionaryModified = a3;
  if (a3)
  {
    notify_register_check((const char *)objc_msgSend(CFSTR("LKUStorageDictionaryModified"), "UTF8String"), &setStorageDictionaryModified__token);
    if (setStorageDictionaryModified__token != -1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v3 = 138412546;
        v4 = CFSTR("StorageDictionaryModified");
        v5 = 1024;
        v6 = setStorageDictionaryModified__token;
        _os_log_impl(&dword_2167FC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Post %@ notification with token: %d", (uint8_t *)&v3, 0x12u);
      }
      notify_set_state(setStorageDictionaryModified__token, 1uLL);
      notify_post((const char *)objc_msgSend(CFSTR("LKUStorageDictionaryModified"), "UTF8String"));
    }
  }
}

- (void)_refreshStorageCacheIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (-[LKUniversalDiskStorage isStorageDictionaryModified](self, "isStorageDictionaryModified"))
  {
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = (void *)MEMORY[0x24BDBCF48];
    +[LKUniversalDiskStorage localDictionaryPath](LKUniversalDiskStorage, "localDictionaryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v3, "dictionaryWithContentsOfURL:error:", v6, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (char *)v15;

    if (!v8)
      goto LABEL_6;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_impl(&dword_2167FC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to read storage dictionary. Error: %{public}@", buf, 0xCu);
    }
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (void *)MEMORY[0x24BDBCF48];
    +[LKUniversalDiskStorage localDictionaryPath](LKUniversalDiskStorage, "localDictionaryPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:isDirectory:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithContentsOfURL:error:", v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
    if (v13)
    {
LABEL_6:
      v14 = (void *)objc_msgSend(v7, "copy");
      -[LKUniversalDiskStorage setStorageDictionary:](self, "setStorageDictionary:", v14);

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[LKUniversalDiskStorage _refreshStorageCacheIfNeeded]";
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_2167FC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
      }
      -[LKUniversalDiskStorage setStorageDictionaryModified:](self, "setStorageDictionaryModified:", 0);

    }
  }
}

+ (id)localDirectoryPath
{
  if (localDirectoryPath_onceToken != -1)
    dispatch_once(&localDirectoryPath_onceToken, &__block_literal_global_13);
  return (id)localDirectoryPath_path;
}

void __44__LKUniversalDiskStorage_localDirectoryPath__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = 1;
  v0 = (void *)container_create_or_lookup_system_group_paths();
  if (v0)
  {
    v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("systemgroup.com.apple.userimagecache"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("LocalStorage"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)localDirectoryPath_path;
    localDirectoryPath_path = v3;

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __44__LKUniversalDiskStorage_localDirectoryPath__block_invoke_cold_1((uint64_t)&v12, v5, v6, v7, v8, v9, v10, v11);
  }

}

+ (id)localDictionaryPath
{
  if (localDictionaryPath_onceToken != -1)
    dispatch_once(&localDictionaryPath_onceToken, &__block_literal_global_16);
  return (id)localDictionaryPath_path;
}

void __45__LKUniversalDiskStorage_localDictionaryPath__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[LKUniversalDiskStorage localDirectoryPath](LKUniversalDiskStorage, "localDirectoryPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("LDTemporaryLocalStorageDict.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)localDictionaryPath_path;
  localDictionaryPath_path = v0;

}

- (OS_dispatch_queue)storageQueue
{
  return self->_storageQueue;
}

- (void)setStorageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_storageQueue, a3);
}

- (_opaque_pthread_rwlock_t)lock
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)self[1].__opaque;
  *(_OWORD *)&retstr->__opaque[152] = *(_OWORD *)&self->__opaque[184];
  *(_OWORD *)&retstr->__opaque[168] = v3;
  *(_QWORD *)&retstr->__opaque[184] = *(_QWORD *)&self[1].__opaque[16];
  v4 = *(_OWORD *)&self->__opaque[136];
  *(_OWORD *)&retstr->__opaque[88] = *(_OWORD *)&self->__opaque[120];
  *(_OWORD *)&retstr->__opaque[104] = v4;
  v5 = *(_OWORD *)&self->__opaque[168];
  *(_OWORD *)&retstr->__opaque[120] = *(_OWORD *)&self->__opaque[152];
  *(_OWORD *)&retstr->__opaque[136] = v5;
  v6 = *(_OWORD *)&self->__opaque[72];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self->__opaque[56];
  *(_OWORD *)&retstr->__opaque[40] = v6;
  v7 = *(_OWORD *)&self->__opaque[104];
  *(_OWORD *)&retstr->__opaque[56] = *(_OWORD *)&self->__opaque[88];
  *(_OWORD *)&retstr->__opaque[72] = v7;
  v8 = *(_OWORD *)&self->__opaque[40];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[24];
  *(_OWORD *)&retstr->__opaque[8] = v8;
  return self;
}

- (void)setLock:(_opaque_pthread_rwlock_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  *(_OWORD *)&self->_lock.__sig = *(_OWORD *)&a3->__sig;
  v3 = *(_OWORD *)&a3->__opaque[8];
  v4 = *(_OWORD *)&a3->__opaque[24];
  v5 = *(_OWORD *)&a3->__opaque[56];
  *(_OWORD *)&self->_lock.__opaque[40] = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[56] = v5;
  *(_OWORD *)&self->_lock.__opaque[8] = v3;
  *(_OWORD *)&self->_lock.__opaque[24] = v4;
  v6 = *(_OWORD *)&a3->__opaque[72];
  v7 = *(_OWORD *)&a3->__opaque[88];
  v8 = *(_OWORD *)&a3->__opaque[120];
  *(_OWORD *)&self->_lock.__opaque[104] = *(_OWORD *)&a3->__opaque[104];
  *(_OWORD *)&self->_lock.__opaque[120] = v8;
  *(_OWORD *)&self->_lock.__opaque[72] = v6;
  *(_OWORD *)&self->_lock.__opaque[88] = v7;
  v9 = *(_OWORD *)&a3->__opaque[136];
  v10 = *(_OWORD *)&a3->__opaque[152];
  v11 = *(_OWORD *)&a3->__opaque[168];
  *(_QWORD *)&self->_lock.__opaque[184] = *(_QWORD *)&a3->__opaque[184];
  *(_OWORD *)&self->_lock.__opaque[152] = v10;
  *(_OWORD *)&self->_lock.__opaque[168] = v11;
  *(_OWORD *)&self->_lock.__opaque[136] = v9;
}

- (NSDictionary)storageDictionary
{
  return self->_storageDictionary;
}

- (void)setStorageDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_storageDictionary, a3);
}

- (BOOL)isStorageDictionaryModified
{
  return self->_storageDictionaryModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageDictionary, 0);
  objc_storeStrong((id *)&self->_storageQueue, 0);
}

- (void)saveKeyValuePairs:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_2167FC000, MEMORY[0x24BDACB70], v0, "Failed to save storage file with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_2();
}

- (void)saveKeyValuePairs:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_2167FC000, MEMORY[0x24BDACB70], v0, "Can not create storage folder, error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_2();
}

- (void)clearKeys:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_2167FC000, MEMORY[0x24BDACB70], v0, "Failed to save storage file, error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_2();
}

void __50__LKUniversalDiskStorage_clearAllKeyValueStorage___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_2167FC000, MEMORY[0x24BDACB70], v0, "Failed to remove the stored file, error: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_2();
}

void __44__LKUniversalDiskStorage_localDirectoryPath__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2167FC000, MEMORY[0x24BDACB70], a3, "container_create_or_lookup_system_group_paths failed with error: %llu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

@end
