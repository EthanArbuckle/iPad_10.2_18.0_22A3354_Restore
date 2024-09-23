@implementation CDSharedMemoryKeyValueStore

void __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _CDSerializableKeyedData *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id Property;
  id v26;

  v2 = a1 + 40;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (id *)v3;
    -[_CDSerializableKeyedData setData:](v3, *(void **)(a1 + 48));
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke_cold_2(v2, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    v12 = [_CDSerializableKeyedData alloc];
    v13 = *(void **)(a1 + 40);
    v14 = *(void **)(a1 + 48);
    v26 = 0;
    v4 = -[_CDSerializableKeyedData initWithKey:data:error:]((id *)&v12->super.isa, v13, v14, &v26);
    v15 = v26;
    if (v15)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

      goto LABEL_7;
    }
    v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke_cold_1(v2, v16, v18, v19, v20, v21, v22, v23);
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    if (v4)
      Property = objc_getProperty(v4, v17, 24, 1);
    else
      Property = 0;
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v4, Property);
  }
  -[_CDSharedMemoryKeyValueStore schedulePersistToShMem](*(_QWORD *)(a1 + 32));
LABEL_7:

}

void __47___CDSharedMemoryKeyValueStore__persistToShMem__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v2 = a1[4];
    v3 = *(void **)(v2 + 24);
    *(_QWORD *)(v2 + 24) = 0;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1[4] + 48), "count"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = *(id *)(a1[4] + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
          objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v12, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

uint64_t __54___CDSharedMemoryKeyValueStore_schedulePersistToShMem__block_invoke(uint64_t a1)
{
  return -[_CDSharedMemoryKeyValueStore _persistToShMem](*(_QWORD *)(a1 + 32));
}

void __46___CDSharedMemoryKeyValueStore_sharedInstance__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  id v5;

  v2 = objc_alloc(*(Class *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "defaultName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[_CDSharedMemoryKeyValueStore initWithName:size:](v2, v5, objc_msgSend(*(id *)(a1 + 32), "defaultSize"));
  v4 = (void *)sharedInstance_theStore;
  sharedInstance_theStore = (uint64_t)v3;

}

void __35___CDSharedMemoryKeyValueStore_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreduet", "SharedMemoryKeyValueStore");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

void __47___CDSharedMemoryKeyValueStore__persistToShMem__block_invoke_17(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  id *v9;
  uint64_t v10;
  const char *v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  id Property;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v43, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v2);
        v9 = *(id **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (v9)
        {
          v10 = objc_msgSend(v9[1], "length", (_QWORD)v25);
          v12 = v10 + objc_msgSend(v9[4], "length") + 18;
          if (v12 > v5)
          {
            v13 = objc_getProperty(v9, v11, 24, 1);

            v5 = v12;
            v6 = v13;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v43, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  +[_CDSharedMemoryKeyValueStore log]();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    v16 = (void *)a1[4];
    if (v16)
      Property = objc_getProperty(v16, v15, 24, 1);
    else
      Property = 0;
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = a1[7];
    v20 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v21 = Property;
    objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = a1[8];
    v24 = *(_QWORD *)(a1[5] + 64);

    *(_DWORD *)buf = 138544898;
    v30 = Property;
    v31 = 2048;
    v32 = v19;
    v33 = 2112;
    v34 = v22;
    v35 = 2114;
    v36 = v6;
    v37 = 2048;
    v38 = v5;
    v39 = 2048;
    v40 = v23;
    v41 = 2048;
    v42 = v24;
    _os_log_fault_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_FAULT, "Shared memory exhausted trying to write %{public}@ (%zuB) - %@ entries (largest %{public}@ (%zuB), %zu/%zuB full", buf, 0x48u);

  }
}

void __50___CDSharedMemoryKeyValueStore_syncPersistToShMem__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x193FEE914]();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[_CDSharedMemoryKeyValueStore _persistToShMem](*(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void __50___CDSharedMemoryKeyValueStore_removeDataForKeys___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
  -[_CDSharedMemoryKeyValueStore schedulePersistToShMem](*(_QWORD *)(a1 + 32));
}

void __43___CDSharedMemoryKeyValueStore_dataForKey___block_invoke(_QWORD *a1)
{
  uint64_t *v2;
  void *v3;
  const char *v4;
  void *v5;
  id Property;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  v2 = a1 + 5;
  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
    Property = objc_getProperty(v3, v4, 32, 1);
  else
    Property = 0;
  v8 = a1[6];
  v7 = (uint64_t)(a1 + 6);
  objc_storeStrong((id *)(*(_QWORD *)(v8 + 8) + 40), Property);

  v9 = *(NSObject **)(*(_QWORD *)(v7 - 16) + 40);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __43___CDSharedMemoryKeyValueStore_dataForKey___block_invoke_cold_1(v2, v7, v9);
}

void __39___CDSharedMemoryKeyValueStore_allKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, a2, a3, "Set value for key %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, a2, a3, "Updated value for key %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __43___CDSharedMemoryKeyValueStore_dataForKey___block_invoke_cold_1(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40) != 0;
  v6 = a3;
  objc_msgSend(v4, "numberWithInt:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v3;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_2(&dword_18DDBE000, v6, v8, "Attempt to retrieve data for key %{public}@ (was present = %@)", (uint8_t *)&v9);

  OUTLINED_FUNCTION_7();
}

@end
