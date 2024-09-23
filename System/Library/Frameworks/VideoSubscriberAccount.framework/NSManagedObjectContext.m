@implementation NSManagedObjectContext

void __67__NSManagedObjectContext_VSAdditions__vs_removeAllPersistentStores__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  NSObject *v11;
  __int128 v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v1, "persistentStores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v15;
    *(_QWORD *)&v4 = 138412290;
    v12 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v13 = 0;
        v9 = objc_msgSend(v1, "removePersistentStore:error:", v8, &v13, v12);
        v10 = v13;
        if ((v9 & 1) == 0)
        {
          VSErrorLogObject();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v12;
            v19 = v10;
            _os_log_error_impl(&dword_1D2419000, v11, OS_LOG_TYPE_ERROR, "Unable to remove persistent store: %@", buf, 0xCu);
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }

}

@end
