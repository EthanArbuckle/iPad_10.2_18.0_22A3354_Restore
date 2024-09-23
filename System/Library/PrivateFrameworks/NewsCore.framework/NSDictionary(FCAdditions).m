@implementation NSDictionary(FCAdditions)

+ (id)fc_dictionaryFromArray:()FCAdditions keyBlock:valueBlock:
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dictionaryWithObjects:forKeys:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)fc_dictionaryByAddingEntriesFromDictionary:()FCAdditions toDictionary:
{
  void *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v6);

  objc_msgSend(v8, "addEntriesFromDictionary:", v7);
  return v8;
}

+ (id)fc_dictionary:()FCAdditions
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
    v3[2](v3, v4);
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = v5;
  if (!v5)
    v5 = (void *)MEMORY[0x1E0C9AA70];
  v7 = v5;

  return v7;
}

+ (id)fc_dictionaryFromJSON:()FCAdditions error:
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCCheckedDynamicCast(v6, (uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (uint64_t)fc_dictionaryFromJSON:()FCAdditions
{
  return objc_msgSend(a1, "fc_dictionaryFromJSON:error:", a3, 0);
}

- (id)fc_safeObjectForKey:()FCAdditions
{
  if (!a3)
    return 0;
  objc_msgSend(a1, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fc_dictionaryByTransformingKeysWithBlock:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "transformBlock");
    *(_DWORD *)buf = 136315906;
    v16 = "-[NSDictionary(FCAdditions) fc_dictionaryByTransformingKeysWithBlock:]";
    v17 = 2080;
    v18 = "NSDictionary+FCAdditions.m";
    v19 = 1024;
    v20 = 68;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__NSDictionary_FCAdditions__fc_dictionaryByTransformingKeysWithBlock___block_invoke;
  v12[3] = &unk_1E4648008;
  v14 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)fc_subdictionaryForKeys:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)nf_mutableObjectsForKeysWithoutMarker:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)fc_dictionaryWithKeys:()FCAdditions allowingNil:valueBlock:
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "valueBlock");
    *(_DWORD *)buf = 136315906;
    v28 = "+[NSDictionary(FCAdditions) fc_dictionaryWithKeys:allowingNil:valueBlock:]";
    v29 = 2080;
    v30 = "NSDictionary+FCAdditions.m";
    v31 = 1024;
    v32 = 161;
    v33 = 2114;
    v34 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    v14 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v8[2](v8, v16);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if ((a4 & 1) != 0 || v17)
        {
          if (v17)
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v16);
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "value");
          *(_DWORD *)buf = 136315906;
          v28 = "+[NSDictionary(FCAdditions) fc_dictionaryWithKeys:allowingNil:valueBlock:]";
          v29 = 2080;
          v30 = "NSDictionary+FCAdditions.m";
          v31 = 1024;
          v32 = 170;
          v33 = 2114;
          v34 = v19;
          _os_log_error_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)fc_dictionaryBySwappingValuesAndKeys
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)fc_dictionaryByTransformingKeysWithKeyAndValueBlock:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "transformBlock");
    *(_DWORD *)buf = 136315906;
    v16 = "-[NSDictionary(FCAdditions) fc_dictionaryByTransformingKeysWithKeyAndValueBlock:]";
    v17 = 2080;
    v18 = "NSDictionary+FCAdditions.m";
    v19 = 1024;
    v20 = 53;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__NSDictionary_FCAdditions__fc_dictionaryByTransformingKeysWithKeyAndValueBlock___block_invoke;
  v12[3] = &unk_1E4648008;
  v14 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)fc_sortedEntriesWithKeyBlock:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "transformBlock");
    *(_DWORD *)buf = 136315906;
    v16 = "-[NSDictionary(FCAdditions) fc_sortedEntriesWithKeyBlock:]";
    v17 = 2080;
    v18 = "NSDictionary+FCAdditions.m";
    v19 = 1024;
    v20 = 83;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__NSDictionary_FCAdditions__fc_sortedEntriesWithKeyBlock___block_invoke;
  v12[3] = &unk_1E4648008;
  v14 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)fc_dictionaryByTransformingValuesWithKeyAndValueBlock:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "transformBlock");
    *(_DWORD *)buf = 136315906;
    v16 = "-[NSDictionary(FCAdditions) fc_dictionaryByTransformingValuesWithKeyAndValueBlock:]";
    v17 = 2080;
    v18 = "NSDictionary+FCAdditions.m";
    v19 = 1024;
    v20 = 106;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__NSDictionary_FCAdditions__fc_dictionaryByTransformingValuesWithKeyAndValueBlock___block_invoke;
  v12[3] = &unk_1E4648008;
  v14 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)fc_dictionaryByTransformingValuesWithBlock:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "transformBlock");
    *(_DWORD *)buf = 136315906;
    v16 = "-[NSDictionary(FCAdditions) fc_dictionaryByTransformingValuesWithBlock:]";
    v17 = 2080;
    v18 = "NSDictionary+FCAdditions.m";
    v19 = 1024;
    v20 = 121;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__NSDictionary_FCAdditions__fc_dictionaryByTransformingValuesWithBlock___block_invoke;
  v12[3] = &unk_1E4648008;
  v14 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)fc_dictionaryByRemovingObjectForKey:()FCAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObjectForKey:", v4);

  return v5;
}

+ (id)fc_dictionaryWithObjects:()FCAdditions keyBlock:
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "keyBlock");
    *(_DWORD *)buf = 136315906;
    v25 = "+[NSDictionary(FCAdditions) fc_dictionaryWithObjects:keyBlock:]";
    v26 = 2080;
    v27 = "NSDictionary+FCAdditions.m";
    v28 = 1024;
    v29 = 143;
    v30 = 2114;
    v31 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    v12 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v6[2](v6, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "key");
          *(_DWORD *)buf = 136315906;
          v25 = "+[NSDictionary(FCAdditions) fc_dictionaryWithObjects:keyBlock:]";
          v26 = 2080;
          v27 = "NSDictionary+FCAdditions.m";
          v28 = 1024;
          v29 = 149;
          v30 = 2114;
          v31 = v16;
          _os_log_error_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v7;
}

+ (uint64_t)fc_dictionaryWithKeys:()FCAdditions valueBlock:
{
  return objc_msgSend(a1, "fc_dictionaryWithKeys:allowingNil:valueBlock:", a3, 0, a4);
}

+ (id)fc_dictionaryWithKeys:()FCAdditions valueWithIndexBlock:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "valueWithIndexBlock");
    *(_DWORD *)buf = 136315906;
    v18 = "+[NSDictionary(FCAdditions) fc_dictionaryWithKeys:valueWithIndexBlock:]";
    v19 = 2080;
    v20 = "NSDictionary+FCAdditions.m";
    v21 = 1024;
    v22 = 190;
    v23 = 2114;
    v24 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__NSDictionary_FCAdditions__fc_dictionaryWithKeys_valueWithIndexBlock___block_invoke;
  v14[3] = &unk_1E4647450;
  v16 = v6;
  v8 = v7;
  v15 = v8;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
  v10 = v15;
  v11 = v8;

  return v11;
}

- (id)fc_subdictionaryWithCopiesForKeys:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");

        if (v13)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)fc_deepCopy
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_subdictionaryWithCopiesForKeys:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fr_descriptionWithKeyComparator:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  void *v17;

  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = a3;
  objc_msgSend(v4, "stringWithString:", CFSTR("{\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __61__NSDictionary_FCAdditions__fr_descriptionWithKeyComparator___block_invoke;
  v15 = &unk_1E4643D70;
  v16 = v6;
  v17 = a1;
  v9 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v12);

  objc_msgSend(v9, "appendString:", CFSTR("}"), v12, v13, v14, v15);
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

- (id)fc_jsonStringWithOmittedUnsupportedDataTypes
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_opt_class();
  fc_JSONEncodableObjectWithObjectHandlers(a1, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  objc_msgSend(v4, "fc_jsonString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fc_jsonEncodableDictionaryWithObjectHandler:()FCAdditions arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_opt_class();
  fc_JSONEncodableObjectWithObjectHandlers(a1, v13, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  return v16;
}

- (uint64_t)fc_jsonEncodableDictionary
{
  return objc_msgSend(a1, "fc_jsonEncodableDictionaryWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:", 0, 0, 0, 0);
}

- (id)fc_jsonStringWithObjectHandler:()FCAdditions arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fc_jsonEncodableDictionaryWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_jsonString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)fc_jsonString
{
  void *v1;
  void *v2;
  uint64_t v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a1, 0, &v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v1, 4);
  else
    v2 = 0;

  return v2;
}

- (id)fc_dictionaryByMergingDictionary:()FCAdditions withValueCombiner:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__NSDictionary_FCAdditions__fc_dictionaryByMergingDictionary_withValueCombiner___block_invoke;
  v13[3] = &unk_1E4648058;
  v13[4] = a1;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "fc_dictionary:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fc_arrayByTransformingWithKeyAndValueBlock:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__NSDictionary_FCAdditions__fc_arrayByTransformingWithKeyAndValueBlock___block_invoke;
  v11[3] = &unk_1E4648080;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

@end
