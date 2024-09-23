@implementation NSMutableDictionary

void __64__NSMutableDictionary_ML3ArtworkAdditions__mergeWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  os_log_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = -[NSObject mutableCopy](v8, "mutableCopy");

        v8 = (os_log_t)v9;
      }
      -[NSObject mergeWithDictionary:](v8, "mergeWithDictionary:", v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v8 = v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = -[NSObject mutableCopy](v8, "mutableCopy");

          v8 = (os_log_t)v10;
        }
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v11 = v6;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
              if ((-[NSObject containsObject:](v8, "containsObject:", v16, (_QWORD)v17) & 1) == 0)
                -[NSObject addObject:](v8, "addObject:", v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
          }
          while (v13);
        }

      }
      else
      {
        v8 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v22 = v5;
          v23 = 2114;
          v24 = v7;
          v25 = 2114;
          v26 = v6;
          _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "Conflict merging items from dictionary for key %{public}@: %{public}@ => %{public}@", buf, 0x20u);
        }
      }
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }

}

@end
