@implementation MNClearStoredRoutesWithSubpathUsedBefore

void __MNClearStoredRoutesWithSubpathUsedBefore_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MNRouteStorageDirectory(*(void **)(a1 + 32));
  v21 = v2;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    v20 = *MEMORY[0x1E0CB2A88];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        +[MNFilePaths routeHandleExtension](MNFilePaths, "routeHandleExtension");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "hasSuffix:", v10);

        if (v11)
        {
          +[MNFilePaths navTempDirectoryPath](MNFilePaths, "navTempDirectoryPath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByAppendingPathComponent:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (*(_QWORD *)(a1 + 40))
          {
            objc_msgSend(v21, "attributesOfItemAtPath:error:", v13, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v20);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "compare:", *(_QWORD *)(a1 + 40)) == -1)
            {
              objc_msgSend(v21, "removeItemAtPath:error:", v13, 0);
              objc_msgSend(v19, "addObject:", v9);
            }

          }
          else
          {
            objc_msgSend(v21, "removeItemAtPath:error:", v13, 0);
            objc_msgSend(v19, "addObject:", v9);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v6);
  }

  GEOFindOrCreateLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 134218243;
    v27 = v17;
    v28 = 2113;
    v29 = v19;
    _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_DEFAULT, "Cleared %lu stored routes: %{private}@", buf, 0x16u);
  }

}

@end
