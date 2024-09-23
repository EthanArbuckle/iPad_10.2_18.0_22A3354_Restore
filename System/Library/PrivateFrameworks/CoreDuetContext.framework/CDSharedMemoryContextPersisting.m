@implementation CDSharedMemoryContextPersisting

void __57___CDSharedMemoryContextPersisting_saveValue_forKeyPath___block_invoke(uint64_t *a1)
{
  _CDContextualKeyPathAndValue *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (!objc_msgSend((id)a1[4], "isEphemeral")
    || objc_msgSend(*(id *)(a1[5] + 32), "countForObject:", a1[4]))
  {
    v2 = -[_CDContextualKeyPathAndValue initWithKeyPath:andValue:]([_CDContextualKeyPathAndValue alloc], "initWithKeyPath:andValue:", a1[4], a1[6]);
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __57___CDSharedMemoryContextPersisting_saveValue_forKeyPath___block_invoke_cold_1();
    }
    v5 = a1[4];
    v6 = *(void **)(a1[5] + 8);
    +[_CDSharedMemoryContextPersisting sharedMemoryKeyFromKeyPath:](_CDSharedMemoryContextPersisting, "sharedMemoryKeyFromKeyPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setData:forKey:", v3, v7);

  }
}

void __51___CDSharedMemoryContextPersisting_deleteKeyPaths___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEphemeral", (_QWORD)v12)
          && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "countForObject:", v8))
        {
          +[_CDSharedMemoryContextPersisting sharedMemoryKeyFromKeyPath:](_CDSharedMemoryContextPersisting, "sharedMemoryKeyFromKeyPath:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeDataForKeys:", v11);

}

void __53___CDSharedMemoryContextPersisting_saveRegistration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", v8);
        objc_msgSend(*(id *)(a1 + 32), "callback");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  v10 = *(_QWORD *)(a1 + 32);
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if (v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __53___CDSharedMemoryContextPersisting_saveRegistration___block_invoke_cold_1();
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  +[_CDSharedMemoryContextPersisting sharedMemoryKeyFromRegistration:](_CDSharedMemoryContextPersisting, "sharedMemoryKeyFromRegistration:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setData:forKey:", v11, v15);

}

void __55___CDSharedMemoryContextPersisting_deleteRegistration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  +[_CDSharedMemoryContextPersisting sharedMemoryKeyFromRegistration:](_CDSharedMemoryContextPersisting, "sharedMemoryKeyFromRegistration:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeDataForKey:", v3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 48);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v9, (_QWORD)v11);
        objc_msgSend(*(id *)(a1 + 40), "callback");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

void __58___CDSharedMemoryContextPersisting_allKeysForContextStore__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v7, "hasPrefix:", CFSTR("context.keyPath")) & 1) != 0
          || objc_msgSend(v7, "hasPrefix:", CFSTR("context.registration")))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __57___CDSharedMemoryContextPersisting_saveValue_forKeyPath___block_invoke_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_18DD73000, MEMORY[0x1E0C81028], v2, "%@: Error saving data to key value store: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

void __53___CDSharedMemoryContextPersisting_saveRegistration___block_invoke_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_18DD73000, MEMORY[0x1E0C81028], v2, "%@: Error saving registration data to key value store: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

@end
