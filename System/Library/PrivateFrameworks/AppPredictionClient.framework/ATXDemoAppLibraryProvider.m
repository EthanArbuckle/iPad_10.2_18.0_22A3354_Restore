@implementation ATXDemoAppLibraryProvider

+ (BOOL)isAppLibraryDemoModeEnabled
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (!objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    return 0;
  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  if (objc_msgSend(v4, "BOOLForKey:", CFSTR("ATXAppLibraryDemoModeEnabled")))
  {
    objc_msgSend(a1, "demoAppLibraryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)demoAppLibraryPath
{
  return (id)objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("AppLibraryDemo.json"));
}

+ (id)loadCategoriesFromDisk
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  id v23;

  objc_msgSend(a1, "demoAppLibraryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v2, 0, &v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v23;
  if (v3)
  {
    v22 = v4;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v22);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v22;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v5;
      v7 = v5;
    }
    else
    {
      __atxlog_handle_app_library();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[ATXDemoAppLibraryProvider loadCategoriesFromDisk].cold.2((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);

      v7 = 0;
    }
  }
  else
  {
    __atxlog_handle_app_library();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ATXDemoAppLibraryProvider loadCategoriesFromDisk].cold.1((uint64_t)v4, v5, v8, v9, v10, v11, v12, v13);
    v7 = 0;
    v6 = v4;
  }

  return v7;
}

+ (id)bundleIdsForCategoryWithName:(id)a3 in:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"), (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v5);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("apps"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

+ (id)demoSuggestionsAndRecents
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  ATXAppDirectoryResponse *v6;
  ATXAppDirectoryResponse *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  __atxlog_handle_app_library();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_INFO, "[Demo] Demo suggestions and recents requested", v11, 2u);
  }

  if (!objc_msgSend(a1, "isAppLibraryDemoModeEnabled"))
    return 0;
  objc_msgSend(a1, "loadCategoriesFromDisk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    v8 = [ATXAppDirectoryResponse alloc];
    objc_msgSend(a1, "bundleIdsForCategoryWithName:in:", CFSTR("Recents"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bundleIdsForCategoryWithName:in:", CFSTR("Suggestions"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bundleIdsForCategoryWithName:in:", CFSTR("Hidden"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ATXAppDirectoryResponse initWithoutDedupingForRecents:predictedApps:hiddenApps:error:](v8, "initWithoutDedupingForRecents:predictedApps:hiddenApps:error:", v5, v9, v10, 0);

  }
  else
  {
    __atxlog_handle_app_library();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ATXDemoAppLibraryProvider demoSuggestionsAndRecents].cold.1(v5);
    v6 = 0;
  }

  return v6;
}

+ (id)_parseCategory:(id)a3 realCategories:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  ATXAppDirectoryCategory *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v32;
  ATXAppDirectoryCategory *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("apps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Suggestions")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("Recents")) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = 0x1E4D53000uLL;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Arcade")) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", CFSTR("Apple Arcade")))
    {
      v12 = -[ATXAppDirectoryCategory initWithCategoryID:appBundleIDs:]([ATXAppDirectoryCategory alloc], "initWithCategoryID:appBundleIDs:", 2, v8);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v13 = v6;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v14)
      {
        v15 = v14;
        v33 = v12;
        v16 = *(_QWORD *)v39;
LABEL_8:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v17);
          if (objc_msgSend(v18, "categoryID") == 2)
            break;
          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
            if (v15)
              goto LABEL_8;
            goto LABEL_24;
          }
        }
LABEL_26:
        v12 = v18;

        v11 = 0x1E4D53000uLL;
      }
    }
    else
    {
      v12 = -[ATXAppDirectoryCategory initWithCategoryID:appBundleIDs:localizedName:]([ATXAppDirectoryCategory alloc], "initWithCategoryID:appBundleIDs:localizedName:", 1, v8, v9);
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v19 = v6;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v20)
      {
        v21 = v20;
        v32 = v6;
        v33 = v12;
        v22 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v35 != v22)
              objc_enumerationMutation(v19);
            v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v18, "localizedStringForCategoryID:", objc_msgSend(v18, "categoryID", v32));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v9, "isEqualToString:", v24);

            if ((v25 & 1) != 0)
            {
              v6 = v32;
              goto LABEL_26;
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v21)
            continue;
          break;
        }
        v6 = v32;
LABEL_24:
        v11 = 0x1E4D53000;
        v12 = v33;
      }
    }

    -[ATXAppDirectoryCategory appBundleIDs](v12, "appBundleIDs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");

    objc_msgSend(v27, "removeObjectsInArray:", v8);
    objc_msgSend(v8, "addObjectsFromArray:", v27);
    v28 = objc_alloc(*(Class *)(v11 + 2000));
    v29 = -[ATXAppDirectoryCategory categoryID](v12, "categoryID");
    -[ATXAppDirectoryCategory localizedName](v12, "localizedName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v28, "initWithCategoryID:appBundleIDs:localizedName:", v29, v8, v30);

  }
  return v10;
}

+ (id)demoAppCategoriesForRealAppCategories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  if (objc_msgSend(a1, "isAppLibraryDemoModeEnabled"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(a1, "loadCategoriesFromDisk");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
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
          objc_msgSend(a1, "_parseCategory:realCategories:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), v4);
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

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)loadCategoriesFromDisk
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "[Demo] Could not parse demo app library: %@", a5, a6, a7, a8, 2u);
}

+ (void)demoSuggestionsAndRecents
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "[Demo] Not enough categories for special pods", v1, 2u);
}

@end
