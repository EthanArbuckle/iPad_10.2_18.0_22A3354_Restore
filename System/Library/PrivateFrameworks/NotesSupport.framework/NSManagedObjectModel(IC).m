@implementation NSManagedObjectModel(IC)

- (id)ic_versionHash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityVersionHashesByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        objc_msgSend(a1, "entityVersionHashesByName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "ic_md5");
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), v11, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v15);

        }
        else
        {
          v14 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v11;
            _os_log_debug_impl(&dword_1DDAA5000, v14, OS_LOG_TYPE_DEBUG, "No hash for entity %@ while generating version hash", buf, 0xCu);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);
  }

  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("-"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_md5");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
