@implementation NSDictionary(FMAdditions)

+ (id)fm_dictionaryWithContentsOfData:()FMAdditions
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, &v8, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {

    LogCategory_Unspecified();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[NSDictionary(FMAdditions) fm_dictionaryWithContentsOfData:].cold.1((uint64_t)v4, v5);

    v3 = 0;
  }

  return v3;
}

- (id)fm_dictionaryWithLowercaseKeys
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(a1, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

+ (id)fm_dictionaryWithContentsOfURL:()FMAdditions error:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;
  id v11;

  if (!a3)
    return 0;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 0, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v6 = v10;
LABEL_8:
    *a4 = objc_retainAutorelease(v6);
  }
LABEL_9:

  return v8;
}

- (id)fm_filter:()FMAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __39__NSDictionary_FMAdditions__fm_filter___block_invoke;
    v12 = &unk_1E5E0E668;
    v13 = v5;
    v14 = v4;
    v6 = v5;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v9);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v6, v9, v10, v11, v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = a1;
  }

  return v7;
}

- (id)fm_dictionaryByMappingValues:()FMAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__NSDictionary_FMAdditions__fm_dictionaryByMappingValues___block_invoke;
    v10[3] = &unk_1E5E0E690;
    v12 = v4;
    v6 = v5;
    v11 = v6;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = v11;
    v8 = v6;

  }
  else
  {
    v8 = a1;
  }

  return v8;
}

+ (void)fm_dictionaryWithContentsOfData:()FMAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AEA5C000, a2, OS_LOG_TYPE_ERROR, "Error parsing property list: %@", (uint8_t *)&v2, 0xCu);
}

@end
