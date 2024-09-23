@implementation MDMManagedMediaReader

+ (id)attributesByAppIDExcludeDDMApps:(BOOL)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v16;
  id v18;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_metadataByBundleIDExcludeDDMApps:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "length", v18))
        {
          objc_msgSend(v4, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", CFSTR("Attributes"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", CFSTR("state"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "intValue");

          if ((v13 > 0x12 || ((1 << v13) & 0x60C00) == 0) && v11 != 0)
            objc_msgSend(v18, "setObject:forKey:", v11, v9);

        }
        else
        {
          v16 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D4BF7000, v16, OS_LOG_TYPE_ERROR, "MDMManagedMediaReader skipping app with blank bundleID", buf, 2u);
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return v18;
}

+ (id)_metadataByBundleIDExcludeDDMApps:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MDMAppManagementFilePath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (!v6)
    return MEMORY[0x1E0C9AA70];
  v7 = (void *)MEMORY[0x1E0CB38B0];
  v8 = (void *)MEMORY[0x1E0C99D50];
  MDMAppManagementFilePath();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataWithContentsOfFile:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v7, "DMCSafePropertyListWithData:options:format:error:", v10, 1, 0, &v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v30;

  if (v12)
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v12;
      _os_log_impl(&dword_1D4BF7000, v13, OS_LOG_TYPE_ERROR, "MDMManagedMediaReader cannot read manifest with error: %{public}@", buf, 0xCu);
    }
  }

  if (!v11)
    return MEMORY[0x1E0C9AA70];
  objc_msgSend(v11, "objectForKey:", CFSTR("metadataByBundleID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (v3)
  {
    objc_msgSend(v15, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v15, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", CFSTR("source"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v18);
    }

  }
  v24 = (void *)objc_msgSend(v15, "copy");

  return v24;
}

+ (id)attributesByAppID
{
  return +[MDMManagedMediaReader attributesByAppIDExcludeDDMApps:](MDMManagedMediaReader, "attributesByAppIDExcludeDDMApps:", 0);
}

+ (id)managedBooks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MDMBook *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  MDMBook *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0C99D80];
  MDMManagedStoreBooksManifestPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Books"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v29;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v29 != v10)
              objc_enumerationMutation(v7);
            v12 = -[MDMBook initWithManifestDictionary:]([MDMBook alloc], "initWithManifestDictionary:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11));
            objc_msgSend(v2, "addObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v9);
      }
    }

  }
  v13 = (void *)MEMORY[0x1E0C99D80];
  MDMManagedNonStoreBooksManifestPath();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryWithContentsOfFile:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Books"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v25;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v17);
            v22 = -[MDMBook initWithManifestDictionary:]([MDMBook alloc], "initWithManifestDictionary:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v21));
            objc_msgSend(v2, "addObject:", v22);

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v19);
      }
    }

  }
  return v2;
}

+ (id)managedAppIDs
{
  return +[MDMManagedMediaReader managedAppIDsExcludeDDMApps:](MDMManagedMediaReader, "managedAppIDsExcludeDDMApps:", 0);
}

+ (id)managedAppIDsExcludeDDMApps:(BOOL)a3
{
  void *v3;
  void *v4;

  +[MDMManagedMediaReader attributesByAppIDExcludeDDMApps:](MDMManagedMediaReader, "attributesByAppIDExcludeDDMApps:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)managedAppIDsWithFlags:(unint64_t)a3
{
  return +[MDMManagedMediaReader managedAppIDsWithFlags:excludeDDMApps:](MDMManagedMediaReader, "managedAppIDsWithFlags:excludeDDMApps:", a3, 0);
}

+ (id)managedAppIDsWithFlags:(unint64_t)a3 excludeDDMApps:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  id v18;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v18 = (id)objc_opt_new();
  +[MDMManagedMediaReader _metadataByBundleIDExcludeDDMApps:](MDMManagedMediaReader, "_metadataByBundleIDExcludeDDMApps:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v12, "length"))
          {
            objc_msgSend(v7, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", CFSTR("flags"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (int)objc_msgSend(v14, "intValue") & a3;

            if (v15)
              objc_msgSend(v18, "addObject:", v12);

          }
          else
          {
            v16 = *(NSObject **)DMCLogObjects();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D4BF7000, v16, OS_LOG_TYPE_ERROR, "MDMManagedMediaReader skipping app with blank appID", buf, 2u);
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }
  }

  return v18;
}

@end
