@implementation ATXHistogramBundleIdTable

- (ATXHistogramBundleIdTable)initWithDatastore:(id)a3
{
  return -[ATXHistogramTable initWithDatastore:blobType:](self, "initWithDatastore:blobType:", a3, 0);
}

+ (ATXHistogramBundleIdTable)sharedInstance
{
  ATXHistogramBundleIdTable *v2;
  ATXHistogramBundleIdTable *v3;
  void *v4;

  pthread_mutex_lock(&sharedInstanceLock);
  v2 = (ATXHistogramBundleIdTable *)(id)sharedInstance;
  if (!v2)
  {
    v3 = [ATXHistogramBundleIdTable alloc];
    +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[ATXHistogramTable initWithDatastore:blobType:](v3, "initWithDatastore:blobType:", v4, 0);
    objc_storeStrong((id *)&sharedInstance, v2);

  }
  pthread_mutex_unlock(&sharedInstanceLock);
  return v2;
}

+ (void)useTemporarySharedInstance:(id)a3
{
  id v4;

  v4 = a3;
  pthread_mutex_lock(&sharedInstanceLock);
  objc_storeStrong((id *)&swappedOutSharedInstance, (id)sharedInstance);
  objc_storeStrong((id *)&sharedInstance, a3);
  pthread_mutex_unlock(&sharedInstanceLock);

}

+ (void)stopUsingTemporarySharedInstance
{
  void *v2;

  pthread_mutex_lock(&sharedInstanceLock);
  objc_storeStrong((id *)&sharedInstance, (id)swappedOutSharedInstance);
  v2 = (void *)swappedOutSharedInstance;
  swappedOutSharedInstance = 0;

  pthread_mutex_unlock(&sharedInstanceLock);
}

- (id)permutationFrom:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[7];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  __int16 v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke;
  v10[3] = &unk_1E82E4E20;
  v10[4] = &v11;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
  ++*((_WORD *)v12 + 12);
  v6 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v7 = objc_retainAutorelease((id)objc_msgSend(v6, "initWithLength:", 2 * *((unsigned __int16 *)v12 + 12)));
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke_2;
  v9[3] = &unk_1E82E4E48;
  v9[5] = &v11;
  v9[6] = objc_msgSend(v7, "mutableBytes");
  v9[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "unsignedShortValue");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 > *(unsigned __int16 *)(v5 + 24))
    *(_WORD *)(v5 + 24) = v4;

}

void __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "unsignedShortValue");
  v8 = a1 + 40;
  if (v7 >= *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke_2_cold_1(v8, v7, v9);

  }
  else
  {
    *(_WORD *)(*(_QWORD *)(a1 + 48) + 2 * v7) = objc_msgSend(*(id *)(a1 + 32), "intern:", v5);
  }

}

- (void)removeBundleIds:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[ATXHistogramTable remove:](self, "remove:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __45__ATXHistogramBundleIdTable_permutationFrom___block_invoke_2_cold_1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24);
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 1024;
  v6 = v3;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Event id %u greater than max %u", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_1_0();
}

@end
