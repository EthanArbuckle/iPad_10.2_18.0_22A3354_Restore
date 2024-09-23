@implementation _CDSharedMemoryKeyValueStore

- (BOOL)setData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke;
  v12[3] = &unk_1E26E3AC0;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v15 = &v16;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, v12);
  LOBYTE(v6) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

- (void)schedulePersistToShMem
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (!*(_QWORD *)(a1 + 24))
    {
      v2 = os_transaction_create();
      v3 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v2;

      v4 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54___CDSharedMemoryKeyValueStore_schedulePersistToShMem__block_invoke;
      block[3] = &unk_1E26E2F20;
      block[4] = a1;
      dispatch_async(v4, block);
    }
  }
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___CDSharedMemoryKeyValueStore_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_theStore;
}

- (uint64_t)_persistToShMem
{
  uint64_t v1;
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id obj;
  _QWORD v17[9];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  BOOL v35;
  char v36[32];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 16));
    kdebug_trace();
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__4;
    v33 = __Block_byref_object_dispose__4;
    v34 = 0;
    if (os_log_type_enabled(*(os_log_t *)(v1 + 40), OS_LOG_TYPE_DEBUG))
      -[_CDSharedMemoryKeyValueStore _persistToShMem].cold.3();
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__4;
    v27 = __Block_byref_object_dispose__4;
    v28 = 0;
    v2 = *(NSObject **)(v1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47___CDSharedMemoryKeyValueStore__persistToShMem__block_invoke;
    block[3] = &unk_1E26E3A70;
    block[4] = v1;
    block[5] = &v29;
    block[6] = &v23;
    dispatch_sync(v2, block);
    if (v30[5])
    {
      if ((unint64_t)objc_msgSend((id)v1, "size") > 0xF)
      {
        **(_BYTE **)(v1 + 56) = 0;
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        obj = (id)v24[5];
        v5 = 0;
        v4 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v37, 16);
        if (v6)
        {
          v7 = 16;
          v8 = *(_QWORD *)v19;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v19 != v8)
                objc_enumerationMutation(obj);
              v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
              v36[0] = 0;
              v11 = -[_CDSerializableKeyedData serializeTo:maxSize:success:](v10, *(_QWORD *)(v1 + 56) + v7, *(_QWORD *)(v1 + 64) - v7, v36);
              v12 = v11;
              if (v36[0])
              {
                ++v5;
                v7 += v11;
              }
              else
              {
                -[_CDSharedMemoryKeyValueStore errorForExceedingSizeLimits](v1);
                v13 = objc_claimAutoreleasedReturnValue();

                v17[0] = MEMORY[0x1E0C809B0];
                v17[1] = 3221225472;
                v17[2] = __47___CDSharedMemoryKeyValueStore__persistToShMem__block_invoke_17;
                v17[3] = &unk_1E26E3A98;
                v17[6] = &v23;
                v17[7] = v12;
                v17[8] = v7;
                v17[4] = v10;
                v17[5] = v1;
                if (_persistToShMem_onceToken != -1)
                  dispatch_once(&_persistToShMem_onceToken, v17);
                v4 = (void *)v13;
              }
              ++v9;
            }
            while (v6 != v9);
            v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v37, 16);
          }
          while (v6);
        }
        else
        {
          v7 = 16;
        }

        v14 = *(_QWORD *)(v1 + 56);
        *(_QWORD *)(v14 + 8) = v5;
        *(_BYTE *)v14 = 1;
        +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[_CDSharedMemoryKeyValueStore _persistToShMem].cold.2((uint64_t)v36, v7, objc_msgSend((id)v1, "size"), v15);

        goto LABEL_28;
      }
      -[_CDSharedMemoryKeyValueStore errorForExceedingSizeLimits](v1);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(v1 + 40), OS_LOG_TYPE_DEBUG))
        -[_CDSharedMemoryKeyValueStore _persistToShMem].cold.1();
      v3 = *(id *)(v1 + 32);
    }
    v4 = v3;
LABEL_28:
    _Block_object_dispose(&v23, 8);

    objc_storeStrong((id *)(v1 + 32), v4);
    objc_msgSend(v4, "code");
    kdebug_trace();
    v35 = v4 == 0;
    _Block_object_dispose(&v29, 8);

    return v35;
  }
  return result;
}

- (id)errorForExceedingSizeLimits
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D68];
  v6[0] = CFSTR("Serialized size exceeds shared memory capacity");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.sharedmemorykeyvaluestore"), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)size
{
  return self->_size;
}

+ (unint64_t)defaultSize
{
  return 0x40000;
}

+ (id)defaultName
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v4 = v6;
    else
      v4 = CFSTR("/CDSharedMemoryKeyValueStore");

  }
  return v4;
}

- (_QWORD)initWithName:(uint64_t)a3 size:
{
  id v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  NSObject *v29;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a1 || !objc_msgSend(v5, "length"))
    goto LABEL_18;
  v31.receiver = a1;
  v31.super_class = (Class)_CDSharedMemoryKeyValueStore;
  v7 = objc_msgSendSuper2(&v31, sel_init);
  a1 = v7;
  if (v7)
  {
    v7[7] = 0;
    if (!a3)
      a3 = objc_msgSend((id)objc_opt_class(), "defaultSize");
    a1[8] = a3;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.CoreDuet.SharedMemoryKeyValueStore", v8);
    v10 = (void *)a1[1];
    a1[1] = v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.CoreDuet.SharedMemoryKeyValueStore.Persistence", v12);
    v14 = (void *)a1[2];
    a1[2] = v13;

    +[_CDSharedMemoryKeyValueStore log]();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)a1[5];
    a1[5] = v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)a1[6];
    a1[6] = v17;

    v19 = +[_CDSharedMemoryKeyValueStore openOrCreateSharedMemoryWithName:size:]((uint64_t)_CDSharedMemoryKeyValueStore, v6, a1[8]);
    a1[7] = v19;
    if (v19)
    {
      +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:]((uint64_t)_CDSharedMemoryKeyValueStore, (uint64_t)v19, a1[8]);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)a1[6];
      a1[6] = v20;

      if (!a1[6])
      {
        v22 = a1[5];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[_CDSharedMemoryKeyValueStore initWithName:size:].cold.2(v6, v22);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)a1[6];
        a1[6] = v23;

      }
      v25 = a1[5];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v27 = a1[7];
        v26 = a1[8];
        *(_DWORD *)buf = 138412802;
        v33 = v6;
        v34 = 1024;
        v35 = v26;
        v36 = 2048;
        v37 = v27;
        _os_log_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_DEFAULT, "Created store with name %@, size %d, address %p", buf, 0x1Cu);
      }

      goto LABEL_14;
    }
    v29 = a1[5];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[_CDSharedMemoryKeyValueStore initWithName:size:].cold.1(v6, v29);

LABEL_18:
    v28 = 0;
    goto LABEL_19;
  }
LABEL_14:
  a1 = a1;
  v28 = a1;
LABEL_19:

  return v28;
}

+ (id)keyValueStoreWithName:(id)a3 size:(unint64_t)a4
{
  id v6;
  _QWORD *v7;

  v6 = a3;
  v7 = -[_CDSharedMemoryKeyValueStore initWithName:size:](objc_alloc((Class)a1), v6, a4);

  return v7;
}

+ (id)log
{
  objc_opt_self();
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_11);
  return (id)log_log;
}

+ (void)openOrCreateSharedMemoryWithName:(size_t)a3 size:
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  int v12;
  int v13;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_self();
  +[_CDSharedMemoryKeyValueStore log]();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v4;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to open %{public}@ in shared memory", buf, 0xCu);
  }

  v6 = objc_retainAutorelease(v4);
  v7 = shm_open((const char *)objc_msgSend(v6, "UTF8String"), 2, 384);
  +[_CDSharedMemoryKeyValueStore log]();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == -1)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_DEFAULT, "Shared memory is not present. Creating it.", buf, 2u);
    }

    v12 = shm_open((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), 514, 384);
    if (v12 == -1)
    {
      +[_CDSharedMemoryKeyValueStore log]();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[_CDSharedMemoryKeyValueStore openOrCreateSharedMemoryWithName:size:].cold.1();
      goto LABEL_17;
    }
    v13 = v12;
    if (ftruncate(v12, a3))
    {
      +[_CDSharedMemoryKeyValueStore log]();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[_CDSharedMemoryKeyValueStore openOrCreateSharedMemoryWithName:size:].cold.3();
      goto LABEL_17;
    }
    v10 = mmap(0, a3, 3, 1, v13, 0);
    close(v13);
    if (v10 != (void *)-1)
      goto LABEL_18;
    +[_CDSharedMemoryKeyValueStore log]();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    goto LABEL_8;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_DEFAULT, "Opened shared memory", buf, 2u);
  }

  v10 = mmap(0, a3, 3, 1, v7, 0);
  close(v7);
  if (v10 == (void *)-1)
  {
    +[_CDSharedMemoryKeyValueStore log]();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      v10 = 0;
      goto LABEL_18;
    }
LABEL_8:
    +[_CDSharedMemoryKeyValueStore openOrCreateSharedMemoryWithName:size:].cold.2();
    goto LABEL_17;
  }
LABEL_18:

  return v10;
}

+ (NSObject)readKeyedDataDictionaryFromMemory:(unint64_t)a3 size:
{
  uint64_t v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  id *v11;
  const char *v12;
  id *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;

  objc_opt_self();
  v5 = *(_QWORD *)(a2 + 8);
  if ((*(_BYTE *)a2 & 1) == 0)
  {
    v6 = readKeyedDataDictionaryFromMemory_size__invalidHeaderCount++;
    if (v6 == 1)
    {
      +[_CDSharedMemoryKeyValueStore log]();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:].cold.2();

    }
    +[_CDSharedMemoryKeyValueStore log]();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:].cold.1();
LABEL_22:
    v9 = 0;
LABEL_23:

    return v9;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = 16;
    while (a3 > v10)
    {
      +[_CDSerializableKeyedData keyedDataDeserializedFrom:maxSize:]((uint64_t)_CDSerializableKeyedData, a2 + v10, a3 - v10);
      v11 = (id *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      if (!v11)
      {
        +[_CDSharedMemoryKeyValueStore log]();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:].cold.3();
        goto LABEL_21;
      }
      if (!objc_getProperty(v11, v12, 24, 1))
      {
        +[_CDSharedMemoryKeyValueStore log]();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:].cold.4();
LABEL_21:

        v8 = v9;
        goto LABEL_22;
      }
      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, objc_getProperty(v13, v14, 24, 1));
      v15 = objc_msgSend(v13[1], "length");
      v10 += v15 + objc_msgSend(v13[4], "length") + 18;

      if (!--v5)
        return v9;
    }
    +[_CDSharedMemoryKeyValueStore log]();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:].cold.5();
    goto LABEL_23;
  }
  return v9;
}

- (void)memoryPointer
{
  return self->_mappedMem;
}

- (BOOL)syncPersistToShMem
{
  _CDSharedMemoryKeyValueStore *v2;
  NSObject *persistQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  persistQueue = v2->_persistQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50___CDSharedMemoryKeyValueStore_syncPersistToShMem__block_invoke;
  v5[3] = &unk_1E26E2E78;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(persistQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)removeDataForKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[_CDSharedMemoryKeyValueStore removeDataForKeys:](self, "removeDataForKeys:", v6, v8, v9);
  return (char)self;
}

- (BOOL)removeDataForKeys:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50___CDSharedMemoryKeyValueStore_removeDataForKeys___block_invoke;
    v7[3] = &unk_1E26E3250;
    v7[4] = self;
    v8 = v4;
    dispatch_sync(queue, v7);

  }
  return 1;
}

- (id)dataForKey:(id)a3
{
  id v4;
  NSObject *queue;
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
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___CDSharedMemoryKeyValueStore_dataForKey___block_invoke;
  block[3] = &unk_1E26E2CA8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)allKeys
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = (id)MEMORY[0x1E0C9AA60];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39___CDSharedMemoryKeyValueStore_allKeys__block_invoke;
  v5[3] = &unk_1E26E2E78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[_CDSharedMemoryKeyValueStore setData:forKey:](self, "setData:forKey:", v7, v6);

}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_dictionary;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (id *)v10;
        if (v10)
        {
          v12 = objc_msgSend(*(id *)(v10 + 8), "length");
          v13 = v12 + objc_msgSend(v11[4], "length") + 18;
        }
        else
        {
          v13 = 0;
        }
        v6 += v13;
        objc_msgSend(v3, "appendFormat:", CFSTR("%@: %zu\n"), v9, v13);

        ++v8;
      }
      while (v5 != v8);
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v5 = v14;
    }
    while (v14);
  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("totalSize: %zu\n"), v6);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lastPersistError, 0);
  objc_storeStrong((id *)&self->_persistTransaction, 0);
  objc_storeStrong((id *)&self->_persistQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithName:(void *)a1 size:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint8_t v6[12];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  objc_msgSend(v3, "UTF8String");
  OUTLINED_FUNCTION_3();
  v7 = 1024;
  v8 = v5;
  _os_log_error_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_ERROR, "Failed to create store with name %s, size %d", v6, 0x12u);

  OUTLINED_FUNCTION_7();
}

- (void)initWithName:(void *)a1 size:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  objc_msgSend(v3, "UTF8String");
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_ERROR, "Failed to read/load store with name %s", v5, 0xCu);

  OUTLINED_FUNCTION_1();
}

+ (void)openOrCreateSharedMemoryWithName:size:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_30();
  v0 = OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_10_1(v0);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "Failed to open shared memory with name: %{public}@ Error: %{public}s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

+ (void)openOrCreateSharedMemoryWithName:size:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_30();
  v0 = OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_10_1(v0);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "mmap failed for name %{public}@ Error: %{public}s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

+ (void)openOrCreateSharedMemoryWithName:size:.cold.3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_30();
  v0 = OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_10_1(v0);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "Failed to truncate shared memory with name %{public}@ Error: %{public}s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

+ (void)readKeyedDataDictionaryFromMemory:size:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Encountered an invalid header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)readKeyedDataDictionaryFromMemory:size:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_FAULT, "Encountered invalid header: {isValid=0; size=%zu}",
    v1,
    0xCu);
  OUTLINED_FUNCTION_5();
}

+ (void)readKeyedDataDictionaryFromMemory:size:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Failed to read keyed data from memory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)readKeyedDataDictionaryFromMemory:size:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Keyed data is missing a valid key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)readKeyedDataDictionaryFromMemory:size:.cold.5()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_18DDBE000, v1, OS_LOG_TYPE_ERROR, "Attempt to read offset %lu > %lu", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)_persistToShMem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Starting persist to shared memory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
