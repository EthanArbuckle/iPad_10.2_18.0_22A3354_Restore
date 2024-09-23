@implementation _CDSharedMemoryContextPersisting

- (void)saveValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *queue;
  id v13;
  _QWORD block[4];
  id v15;
  _CDSharedMemoryContextPersisting *v16;
  id v17;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v6, "deviceID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v6, "deviceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", self->_localDeviceID);

      if (!v11)
        goto LABEL_8;
    }
    else
    {

    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57___CDSharedMemoryContextPersisting_saveValue_forKeyPath___block_invoke;
    block[3] = &unk_1E26D4680;
    v15 = v6;
    v16 = self;
    v17 = v13;
    dispatch_sync(queue, block);

    v7 = v15;
  }

LABEL_8:
}

+ (id)sharedMemoryKeyFromKeyPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "isUserCentric");

  objc_msgSend(v6, "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("context.keyPath"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (_CDSharedMemoryContextPersisting)initWithSharedMemoryKeyValueStore:(id)a3
{
  id v5;
  _CDSharedMemoryContextPersisting *v6;
  _CDSharedMemoryContextPersisting *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  void *v11;
  uint64_t v12;
  NSString *localDeviceID;
  uint64_t v14;
  NSCountedSet *keyPathRegistrationCount;
  uint64_t v16;
  NSCountedSet *legacyKeyPathRegistrationCount;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_CDSharedMemoryContextPersisting;
  v6 = -[_CDSharedMemoryContextPersisting init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.coreduetcontext.service.sharedmemorypersistence", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    +[_CDDevice localDevice](_CDDevice, "localDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceID");
    v12 = objc_claimAutoreleasedReturnValue();
    localDeviceID = v7->_localDeviceID;
    v7->_localDeviceID = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    keyPathRegistrationCount = v7->_keyPathRegistrationCount;
    v7->_keyPathRegistrationCount = (NSCountedSet *)v14;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    legacyKeyPathRegistrationCount = v7->_legacyKeyPathRegistrationCount;
    v7->_legacyKeyPathRegistrationCount = (NSCountedSet *)v16;

  }
  return v7;
}

+ (id)persistenceWithSharedMemoryKeyValueStore:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSharedMemoryKeyValueStore:", v4);

  return v5;
}

+ (id)sharedMemoryKeyFromRegistration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("context.registration"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)deleteKeyPaths:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  _CDSharedMemoryContextPersisting *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___CDSharedMemoryContextPersisting_deleteKeyPaths___block_invoke;
  block[3] = &unk_1E26D46A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)saveRegistration:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  _CDSharedMemoryContextPersisting *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___CDSharedMemoryContextPersisting_saveRegistration___block_invoke;
  block[3] = &unk_1E26D46A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)deleteRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___CDSharedMemoryContextPersisting_deleteRegistration___block_invoke;
  block[3] = &unk_1E26D4680;
  block[4] = self;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  dispatch_sync(queue, block);
  -[_CDSharedMemoryContextPersisting deleteKeyPaths:](self, "deleteKeyPaths:", v8);

}

- (id)allKeysForContextStore
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58___CDSharedMemoryContextPersisting_allKeysForContextStore__block_invoke;
  v9[3] = &unk_1E26D46A8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)loadValues
{
  _CDSharedMemoryContextPersisting *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  id v21;
  _CDSharedMemoryContextPersisting *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v2 = self;
  v40 = *MEMORY[0x1E0C80C00];
  -[_CDSharedMemoryContextPersisting allKeysForContextStore](self, "allKeysForContextStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v5)
  {
    v7 = v5;
    v8 = CFSTR("context.keyPath");
    v9 = *(_QWORD *)v32;
    *(_QWORD *)&v6 = 138412546;
    v27 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
        if (objc_msgSend(v11, "hasPrefix:", v8, v27))
        {
          -[_CDSharedMemoryKeyValueStore dataForKey:](v2->_store, "dataForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)MEMORY[0x1E0CB3710];
            v14 = objc_opt_class();
            v30 = 0;
            objc_msgSend(v13, "unarchivedObjectOfClass:fromData:error:", v14, v12, &v30);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v30;
            if (v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              v36 = v11;
              v37 = 2112;
              v38 = v16;
              _os_log_error_impl(&dword_18DD73000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error unarchiving contextual keypath and value for %@: %@", buf, 0x16u);
              if (v15)
              {
LABEL_11:
                objc_msgSend(v15, "value");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "keyPath");
                v29 = v16;
                v18 = v7;
                v19 = v9;
                v20 = v8;
                v21 = v4;
                v22 = v2;
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v17, v23);

                v2 = v22;
                v4 = v21;
                v8 = v20;
                v9 = v19;
                v7 = v18;
                v16 = v29;

              }
            }
            else if (v15)
            {
              goto LABEL_11;
            }

          }
        }
        ++v10;
      }
      while (v7 != v10);
      v24 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      v7 = v24;
    }
    while (v24);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)loadRegistrations
{
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[_CDSharedMemoryContextPersisting allKeysForContextStore](self, "allKeysForContextStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v23;
    *(_QWORD *)&v6 = 138412546;
    v19 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("context.registration"), v19))
        {
          -[_CDSharedMemoryKeyValueStore dataForKey:](self->_store, "dataForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)MEMORY[0x1E0CB3710];
            v13 = objc_opt_class();
            v21 = 0;
            objc_msgSend(v12, "unarchivedObjectOfClass:fromData:error:", v13, v11, &v21);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v21;
            if (v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              v27 = v10;
              v28 = 2112;
              v29 = v15;
              _os_log_error_impl(&dword_18DD73000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error unarchiving contextual keypath registration for %@: %@", buf, 0x16u);
              if (v14)
LABEL_11:
                objc_msgSend(v20, "addObject:", v14);
            }
            else if (v14)
            {
              goto LABEL_11;
            }

          }
        }
        ++v9;
      }
      while (v7 != v9);
      v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      v7 = v16;
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)deleteAllData
{
  _CDSharedMemoryKeyValueStore *store;
  void *v4;
  id v5;

  -[_CDSharedMemoryContextPersisting allKeysForContextStore](self, "allKeysForContextStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  store = self->_store;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSharedMemoryKeyValueStore removeDataForKeys:](store, "removeDataForKeys:", v4);

}

- (_CDSharedMemoryKeyValueStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSCountedSet)keyPathRegistrationCount
{
  return self->_keyPathRegistrationCount;
}

- (void)setKeyPathRegistrationCount:(id)a3
{
  objc_storeStrong((id *)&self->_keyPathRegistrationCount, a3);
}

- (NSCountedSet)legacyKeyPathRegistrationCount
{
  return self->_legacyKeyPathRegistrationCount;
}

- (void)setLegacyKeyPathRegistrationCount:(id)a3
{
  objc_storeStrong((id *)&self->_legacyKeyPathRegistrationCount, a3);
}

- (NSString)localDeviceID
{
  return self->_localDeviceID;
}

- (void)setLocalDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceID, 0);
  objc_storeStrong((id *)&self->_legacyKeyPathRegistrationCount, 0);
  objc_storeStrong((id *)&self->_keyPathRegistrationCount, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
