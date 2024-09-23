@implementation FCPersistentAssetKeyCache

- (id)interestTokenForWrappingKeyIDs:(id)a3
{
  id v4;
  NFUnfairLock *interestLock;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  if (self)
    interestLock = self->_interestLock;
  else
    interestLock = 0;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke;
  v13[3] = &unk_1E463AD10;
  v13[4] = self;
  v7 = v4;
  v14 = v7;
  -[NFUnfairLock performWithLockSync:](interestLock, "performWithLockSync:", v13);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke_2;
  v11[3] = &unk_1E463AD10;
  v11[4] = self;
  v12 = v7;
  v8 = v7;
  +[FCInterestToken interestTokenWithRemoveInterestBlock:](FCInterestToken, "interestTokenWithRemoveInterestBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (_QWORD)initWithCacheDirectory:(void *)a3 cacheName:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)FCPersistentAssetKeyCache;
    a1 = objc_msgSendSuper2(&v16, sel_init);
    if (a1)
    {
      objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)a1[2];
      a1[2] = v7;

      v9 = objc_alloc_init(MEMORY[0x1E0D60B18]);
      v10 = (void *)a1[4];
      a1[4] = v9;

      v11 = objc_alloc_init(MEMORY[0x1E0CB3550]);
      v12 = (void *)a1[5];
      a1[5] = v11;

      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
      v14 = (void *)a1[6];
      a1[6] = v13;

    }
  }

  return a1;
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  if (self)
    self->_flushingEnabled = 1;
}

uint64_t __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[5];
  return objc_msgSend(v1, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

- (void)_saveToDisk
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  int v6;
  id v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__62;
  v13 = __Block_byref_object_dispose__62;
  v14 = 0;
  v2 = *(id *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke;
  v8[3] = &unk_1E463DF90;
  v8[4] = a1;
  v8[5] = &v9;
  objc_msgSend(v2, "performWithLockSync:", v8);

  +[FCPersistentAssetKeyCache _persistenceCoder]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPersistenceCoder encodeData:](v3, (void *)v10[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(id *)(a1 + 16);
  v6 = objc_msgSend(v4, "writeToFile:atomically:", v5, 1);

  if (v6)
  {
    v7 = objc_retainAutorelease(*(id *)(a1 + 16));
    setxattr((const char *)objc_msgSend(v7, "fileSystemRepresentation"), "com.apple.newscore.storeVersion", &FCPersistentAssetKeyCacheVersion, 2uLL, 0, 0);

  }
  _Block_object_dispose(&v9, 8);

}

- (id)wrappingKeyForWrappingKeyID:(id)a3
{
  id v4;
  NFUnfairLock *cacheEntriesLock;
  NFUnfairLock *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__62;
  v17 = __Block_byref_object_dispose__62;
  v18 = 0;
  if (self)
    cacheEntriesLock = self->_cacheEntriesLock;
  else
    cacheEntriesLock = 0;
  v6 = cacheEntriesLock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__FCPersistentAssetKeyCache_wrappingKeyForWrappingKeyID___block_invoke;
  v10[3] = &unk_1E463AFC0;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  -[NFUnfairLock performWithLockSync:](v6, "performWithLockSync:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __57__FCPersistentAssetKeyCache_wrappingKeyForWrappingKeyID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = a1[4];
  if (!v2)
    goto LABEL_6;
  v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    -[FCPersistentAssetKeyCache _loadFromDisk](v2);
    v4 = a1[4];
    if (v4)
    {
      v3 = *(void **)(v4 + 24);
      goto LABEL_5;
    }
LABEL_6:
    v3 = 0;
  }
LABEL_5:
  objc_msgSend(v3, "objectForKey:", a1[5]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLastAccessed:", objc_msgSend(v5, "fc_millisecondTimeIntervalSince1970"));

  objc_msgSend(v9, "value");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 48);
  else
    v2 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke_3;
  v3[3] = &unk_1E463AD10;
  v3[4] = v1;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performWithLockSync:", v3);

}

uint64_t __60__FCPersistentAssetKeyCache_interestTokenForWrappingKeyIDs___block_invoke_3(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[5];
  return objc_msgSend(v1, "fc_removeObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

- (void)setWrappingKey:(id)a3 forWrappingKeyID:(id)a4
{
  id v6;
  id v7;
  NFUnfairLock *cacheEntriesLock;
  uint64_t v9;
  id v10;
  id v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (self)
    cacheEntriesLock = self->_cacheEntriesLock;
  else
    cacheEntriesLock = 0;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__FCPersistentAssetKeyCache_setWrappingKey_forWrappingKeyID___block_invoke;
  v15[3] = &unk_1E463B228;
  v15[4] = self;
  v10 = v7;
  v16 = v10;
  v11 = v6;
  v17 = v11;
  -[NFUnfairLock performWithLockSync:](cacheEntriesLock, "performWithLockSync:", v15);
  if (self)
    self->_needsSave = 1;
  v12 = dispatch_time(0, 5000000000);
  FCPersistenceQueue();
  v13 = objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __61__FCPersistentAssetKeyCache_setWrappingKey_forWrappingKeyID___block_invoke_2;
  v14[3] = &unk_1E463AB18;
  v14[4] = self;
  dispatch_after(v12, v13, v14);

}

void __61__FCPersistentAssetKeyCache_setWrappingKey_forWrappingKeyID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = a1[4];
  if (!v2)
    goto LABEL_10;
  v3 = *(void **)(v2 + 24);
  if (v3)
    goto LABEL_5;
  -[FCPersistentAssetKeyCache _loadFromDisk](v2);
  v4 = a1[4];
  if (v4)
    v3 = *(void **)(v4 + 24);
  else
LABEL_10:
    v3 = 0;
LABEL_5:
  objc_msgSend(v3, "objectForKey:", a1[5]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D62718]);
    objc_msgSend(v8, "setKey:", a1[5]);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastAccessed:", objc_msgSend(v5, "fc_millisecondTimeIntervalSince1970"));

  objc_msgSend(v8, "setValue:", a1[6]);
  v6 = a1[4];
  if (v6)
    v7 = *(void **)(v6 + 24);
  else
    v7 = 0;
  objc_msgSend(v7, "setObject:forKey:", v8, a1[5]);

}

void __61__FCPersistentAssetKeyCache_setWrappingKey_forWrappingKeyID___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if ((*(_BYTE *)(v1 + 9) & 1) != 0)
    {
      -[FCPersistentAssetKeyCache _saveToDisk](*(_QWORD *)(a1 + 32));
      *(_BYTE *)(v1 + 9) = 0;
    }
  }
}

- (void)removeAllWrappingKeys
{
  FCPersistentAssetKeyCache *v2;
  _QWORD v3[5];

  v2 = self;
  if (self)
    self = (FCPersistentAssetKeyCache *)self->_cacheEntriesLock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__FCPersistentAssetKeyCache_removeAllWrappingKeys__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = v2;
  -[FCPersistentAssetKeyCache performWithLockSync:](self, "performWithLockSync:", v3);
  if (v2)
    v2->_needsSave = 1;
}

uint64_t __50__FCPersistentAssetKeyCache_removeAllWrappingKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    goto LABEL_6;
  v3 = *(void **)(v1 + 24);
  if (!v3)
  {
    -[FCPersistentAssetKeyCache _loadFromDisk](v1);
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v3 = *(void **)(v4 + 24);
      return objc_msgSend(v3, "removeAllObjects");
    }
LABEL_6:
    v3 = 0;
  }
  return objc_msgSend(v3, "removeAllObjects");
}

- (void)activityObservingApplicationDidEnterBackground
{
  NSObject *v3;
  _QWORD block[5];

  FCPersistenceQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__FCPersistentAssetKeyCache_activityObservingApplicationDidEnterBackground__block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __75__FCPersistentAssetKeyCache_activityObservingApplicationDidEnterBackground__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if ((*(_BYTE *)(v1 + 9) & 1) != 0)
    {
      -[FCPersistentAssetKeyCache _saveToDisk](*(_QWORD *)(a1 + 32));
      *(_BYTE *)(v1 + 9) = 0;
    }
  }
}

- (void)_loadFromDisk
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  int value;
  const char *v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(a1 + 16));

  if (v3)
  {
    LOWORD(value) = 0;
    getxattr((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 16)), "fileSystemRepresentation"), "com.apple.newscore.storeVersion", &value, 2uLL, 0, 0);
    if ((unsigned __int16)value != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeItemAtPath:error:", *(_QWORD *)(a1 + 16), 0);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", *(_QWORD *)(a1 + 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPersistentAssetKeyCache _persistenceCoder]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v5;
  -[FCPersistenceCoder encodeData:](v6, v5);
  v7 = objc_claimAutoreleasedReturnValue();

  v25 = (void *)v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62710]), "initWithData:", v7);
  v9 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "entries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));
  v12 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v11;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = v8;
  objc_msgSend(v8, "entries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = MEMORY[0x1E0C81028];
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v19, "key");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WARNING: the persisted asset key cache should never contain an entry without a key"));
          value = 136315906;
          v32 = "-[FCPersistentAssetKeyCache _loadFromDisk]";
          v33 = 2080;
          v34 = "FCAssetKeyCache.m";
          v35 = 1024;
          v36 = 193;
          v37 = 2114;
          v38 = v23;
          _os_log_error_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&value, 0x26u);

        }
        v21 = *(id *)(a1 + 24);
        objc_msgSend(v19, "key");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "fc_safelySetObject:forKey:", v19, v22);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v15);
  }

}

+ (id)_persistenceCoder
{
  objc_opt_self();
  if (qword_1ED0F86B0 != -1)
    dispatch_once(&qword_1ED0F86B0, &__block_literal_global_17_2);
  return (id)_MergedGlobals_196;
}

void __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (*(_BYTE *)(v2 + 8) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fc_millisecondTimeIntervalSince1970");
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(void **)(v5 + 48);
    else
      v6 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke_2;
    v14[3] = &unk_1E4640A20;
    v14[4] = v5;
    v14[5] = v4;
    objc_msgSend(v6, "performWithLockSync:", v14);

  }
  v7 = objc_alloc_init(MEMORY[0x1E0D62710]);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 24);
  else
    v9 = 0;
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEntries:", v10);

  objc_msgSend(v7, "data");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

uint64_t __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[6];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 24);
  else
    v2 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke_3;
  v5[3] = &unk_1E4648758;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = v1;
  v5[5] = v3;
  return objc_msgSend(v2, "fc_removeObjectsForKeysPassingTest:", v5);
}

BOOL __40__FCPersistentAssetKeyCache__saveToDisk__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 40);
  else
    v7 = 0;
  v8 = (objc_msgSend(v7, "containsObject:", a2) & 1) == 0
    && (unint64_t)objc_msgSend(v5, "lastAccessed") < *(_QWORD *)(a1 + 40);

  return v8;
}

void __46__FCPersistentAssetKeyCache__persistenceCoder__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  _QWORD *v3;
  void *v4;
  _QWORD v5[2];
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = xmmword_1A1E83360;
  v7 = xmmword_1A1E83350;
  v5[0] = 0;
  v5[1] = 0;
  FCDeviceUUIDForVendor();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getUUIDBytes:", v5);

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 64);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  ccsha512_di();
  objc_msgSend(v1, "length");
  v2 = objc_retainAutorelease(v1);
  objc_msgSend(v2, "mutableBytes");
  cchkdf();
  v3 = -[FCPersistenceCoder initWithKey:]([FCPersistenceCoder alloc], v2);
  v4 = (void *)_MergedGlobals_196;
  _MergedGlobals_196 = (uint64_t)v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestLock, 0);
  objc_storeStrong((id *)&self->_interestedKeys, 0);
  objc_storeStrong((id *)&self->_cacheEntriesLock, 0);
  objc_storeStrong((id *)&self->_cacheEntries, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
}

@end
