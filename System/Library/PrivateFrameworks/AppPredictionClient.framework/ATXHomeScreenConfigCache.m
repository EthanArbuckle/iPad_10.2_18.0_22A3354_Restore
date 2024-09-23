@implementation ATXHomeScreenConfigCache

uint64_t __82__ATXHomeScreenConfigCache_loadHomeScreenPageConfigurationsIncludingHidden_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (id)loadHomeScreenAndTodayPageConfigurationsWithError:(id *)a3
{
  return -[ATXHomeScreenConfigCache loadHomeScreenAndTodayPageConfigurationsIncludingHidden:error:](self, "loadHomeScreenAndTodayPageConfigurationsIncludingHidden:error:", 0, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
}

- (ATXHomeScreenConfigCache)init
{
  void *v3;
  ATXHomeScreenConfigCache *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("CachedHomeScreenConfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXHomeScreenConfigCache initWithPath:](self, "initWithPath:", v3);

  return v4;
}

- (ATXHomeScreenConfigCache)initWithPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXHomeScreenConfigCache;
  v5 = -[ATXHomeScreenConfigCache init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", *((_QWORD *)v5 + 1), 1, 0, 0);

    if ((v9 & 1) == 0)
    {
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXHomeScreenConfigCache initWithPath:].cold.1((uint64_t *)v5 + 1, v10);

    }
    v11 = v5;
  }

  return (ATXHomeScreenConfigCache *)v5;
}

- (id)loadHomeScreenAndTodayPageConfigurationsIncludingHidden:(BOOL)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;

  -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsIncludingHidden:error:](self, "loadHomeScreenPageConfigurationsIncludingHidden:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ATXHomeScreenConfigCache loadTodayStacksAndPanelsAsHomeScreenPageWithError:](self, "loadTodayStacksAndPanelsAsHomeScreenPageWithError:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v6);
      objc_msgSend(v8, "addObject:", v7);
    }
    else
    {
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ATXHomeScreenConfigCache loadHomeScreenAndTodayPageConfigurationsIncludingHidden:error:].cold.1();

      v8 = v6;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)loadTodayStacksAndPanelsAsHomeScreenPageWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v5 = objc_alloc(MEMORY[0x1E0CF94C0]);
  -[ATXHomeScreenConfigCache _filePathForTodayPage](self, "_filePathForTodayPage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithCacheFilePath:loggingHandle:debugName:", v6, v7, CFSTR("Today page"));

  v9 = (void *)MEMORY[0x1A85A4F90]();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v9);
  v14 = 0;
  objc_msgSend(v8, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v10, &v14, -1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;

  if (a3 && objc_msgSend(v12, "code") != 2)
    *a3 = objc_retainAutorelease(v12);

  return v11;
}

- (id)loadHomeScreenPageConfigurationsIncludingHidden:(BOOL)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v20;

  v7 = objc_alloc(MEMORY[0x1E0CF94C0]);
  -[ATXHomeScreenConfigCache _filePathForHomeScreenPageConfig](self, "_filePathForHomeScreenPageConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithCacheFilePath:loggingHandle:debugName:", v8, v9, CFSTR("Home Screens"));

  v11 = (void *)MEMORY[0x1A85A4F90]();
  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v11);
  v20 = 0;
  objc_msgSend(v10, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v14, &v20, -1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v20;

  if (a4 && objc_msgSend(v16, "code") != 2)
    *a4 = objc_retainAutorelease(v16);
  if (a3)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(v15, "_pas_filteredArrayWithTest:", &__block_literal_global_46);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  return v18;
}

- (id)_filePathForTodayPage
{
  return -[NSString stringByAppendingPathComponent:](self->_rootPath, "stringByAppendingPathComponent:", CFSTR("TodayPage"));
}

- (id)_filePathForHomeScreenPageConfig
{
  return -[NSString stringByAppendingPathComponent:](self->_rootPath, "stringByAppendingPathComponent:", CFSTR("HomeScreenPages"));
}

- (id)loadHomeScreenPageConfigurationsWithError:(id *)a3
{
  return -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsIncludingHidden:error:](self, "loadHomeScreenPageConfigurationsIncludingHidden:error:", 0, a3);
}

- (BOOL)writeHomeScreenPageConfigurations:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t v15[16];

  v6 = a3;
  -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsIncludingHidden:error:](self, "loadHomeScreenPageConfigurationsIncludingHidden:error:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(v6, "isEqualToArray:", v7))
  {
    __atxlog_handle_home_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "Avoiding unnecessary write of home screen pages", v15, 2u);
    }
    LOBYTE(v9) = 0;
  }
  else
  {
    __atxlog_handle_home_screen();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ATXHomeScreenConfigCache writeHomeScreenPageConfigurations:error:].cold.1();

    v11 = objc_alloc(MEMORY[0x1E0CF94C0]);
    -[ATXHomeScreenConfigCache _filePathForHomeScreenPageConfig](self, "_filePathForHomeScreenPageConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_home_screen();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "initWithCacheFilePath:loggingHandle:debugName:", v12, v13, CFSTR("Home Screens"));

    v9 = -[NSObject storeSecureCodedObject:error:](v8, "storeSecureCodedObject:error:", v6, a4);
    if (v9)
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.homeScreenPageConfigCacheUpdate"), "UTF8String"));
  }

  return v9;
}

- (id)homeScreenWidgetPersonalities
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  ATXWidgetPersonality *v14;
  void *v15;
  void *v16;
  ATXWidgetPersonality *v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsIncludingHidden:error:](self, "loadHomeScreenPageConfigurationsIncludingHidden:error:", 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v2;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v35;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(obj);
        v22 = v4;
        v5 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v4);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v5, "stacks");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v25)
        {
          v24 = *(_QWORD *)v31;
          do
          {
            v6 = 0;
            do
            {
              if (*(_QWORD *)v31 != v24)
                objc_enumerationMutation(v23);
              v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
              v26 = 0u;
              v27 = 0u;
              v28 = 0u;
              v29 = 0u;
              objc_msgSend(v7, "widgets");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
              if (v9)
              {
                v10 = v9;
                v11 = *(_QWORD *)v27;
                do
                {
                  v12 = 0;
                  do
                  {
                    if (*(_QWORD *)v27 != v11)
                      objc_enumerationMutation(v8);
                    v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
                    v14 = [ATXWidgetPersonality alloc];
                    objc_msgSend(v13, "extensionBundleId");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "widgetKind");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:](v14, "initWithExtensionBundleId:kind:", v15, v16);
                    objc_msgSend(v3, "addObject:", v17);

                    ++v12;
                  }
                  while (v10 != v12);
                  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
                }
                while (v10);
              }

              ++v6;
            }
            while (v6 != v25);
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          }
          while (v25);
        }

        v4 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v21);
  }

  return v3;
}

- (BOOL)hasWidgetsOnTheHomeScreen
{
  void *v2;
  char v3;

  -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsWithError:](self, "loadHomeScreenPageConfigurationsWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "hasWidgetsOnTheHomeScreenWithHomeScreenPages:", v2);

  return v3;
}

+ (BOOL)hasWidgetsOnTheHomeScreenWithHomeScreenPages:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "stacks", (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (!v10)
        {
          objc_msgSend(v8, "panels");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (!v12)
            continue;
        }
        v13 = 1;
        goto LABEL_13;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (int64_t)numOnboardingStacksOnTheHomeScreen
{
  int64_t v2;
  uint64_t i;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
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
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsWithError:](self, "loadHomeScreenPageConfigurationsWithError:", 0);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  v2 = 0;
  if (v19)
  {
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v4, "stacks");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v25 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
              v20 = 0u;
              v21 = 0u;
              v22 = 0u;
              v23 = 0u;
              objc_msgSend(v10, "widgets");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v21;
                while (2)
                {
                  for (k = 0; k != v13; ++k)
                  {
                    if (*(_QWORD *)v21 != v14)
                      objc_enumerationMutation(v11);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * k), "isOnboardingWidget"))
                    {
                      ++v2;
                      goto LABEL_21;
                    }
                  }
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
                  if (v13)
                    continue;
                  break;
                }
              }
LABEL_21:

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          }
          while (v7);
        }

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v19);
  }

  return v2;
}

- (int64_t)pageIndexOfAppPredictionPanelWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  char v16;
  int64_t v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  -[ATXHomeScreenConfigCache loadHomeScreenAndTodayPageConfigurationsIncludingHidden:error:](self, "loadHomeScreenAndTodayPageConfigurationsIncludingHidden:error:", 1, 0);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v7 = *(_QWORD *)v27;
    v19 = *(_QWORD *)v27;
    v20 = v5;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v9, "panels");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v4);

              if ((v16 & 1) != 0)
              {
                v17 = objc_msgSend(v9, "pageIndex");

                v5 = v20;
                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v12)
              continue;
            break;
          }
        }

        v7 = v19;
      }
      v17 = 0x7FFFFFFFFFFFFFFFLL;
      v5 = v20;
      v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }
  else
  {
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_19:

  objc_autoreleasePoolPop(v5);
  return v17;
}

- (id)_filePathForDockConfig
{
  return -[NSString stringByAppendingPathComponent:](self->_rootPath, "stringByAppendingPathComponent:", CFSTR("DockApps"));
}

- (id)loadDockAppListWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v16;

  v5 = objc_alloc(MEMORY[0x1E0CF94C0]);
  -[ATXHomeScreenConfigCache _filePathForDockConfig](self, "_filePathForDockConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithCacheFilePath:loggingHandle:debugName:", v6, v7, CFSTR("Dock apps"));

  v9 = (void *)MEMORY[0x1A85A4F90]();
  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v9);
  v16 = 0;
  objc_msgSend(v8, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v12, &v16, -1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v16;

  if (a3 && objc_msgSend(v14, "code") != 2)
    *a3 = objc_retainAutorelease(v14);

  return v13;
}

- (BOOL)writeDockAppList:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t v15[16];

  v6 = a3;
  -[ATXHomeScreenConfigCache loadDockAppListWithError:](self, "loadDockAppListWithError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(v6, "isEqualToSet:", v7))
  {
    __atxlog_handle_home_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "Avoiding unnecessary write of dock apps", v15, 2u);
    }
    LOBYTE(v9) = 0;
  }
  else
  {
    __atxlog_handle_home_screen();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ATXHomeScreenConfigCache writeDockAppList:error:].cold.1();

    v11 = objc_alloc(MEMORY[0x1E0CF94C0]);
    -[ATXHomeScreenConfigCache _filePathForDockConfig](self, "_filePathForDockConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_home_screen();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "initWithCacheFilePath:loggingHandle:debugName:", v12, v13, CFSTR("Dock apps"));

    v9 = -[NSObject storeSecureCodedObject:error:](v8, "storeSecureCodedObject:error:", v6, a4);
    if (v9)
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.dockAppListCacheUpdate"), "UTF8String"));
  }

  return v9;
}

- (BOOL)writeTodayPageStacks:(id)a3 appPredictionPanels:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t v19[16];

  v8 = a4;
  v9 = a3;
  -[ATXHomeScreenConfigCache loadTodayStacksAndPanelsAsHomeScreenPageWithError:](self, "loadTodayStacksAndPanelsAsHomeScreenPageWithError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setPageIndex:", 20000);
  objc_msgSend(v11, "setStacks:", v9);

  objc_msgSend(v11, "setPanels:", v8);
  LODWORD(v9) = objc_msgSend(v10, "isEqual:", v11);
  __atxlog_handle_home_screen();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((_DWORD)v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "Avoiding unnecessary write of today page", v19, 2u);
    }
    LOBYTE(v14) = 0;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ATXHomeScreenConfigCache writeTodayPageStacks:appPredictionPanels:error:].cold.1();

    v15 = objc_alloc(MEMORY[0x1E0CF94C0]);
    -[ATXHomeScreenConfigCache _filePathForTodayPage](self, "_filePathForTodayPage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_home_screen();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "initWithCacheFilePath:loggingHandle:debugName:", v16, v17, CFSTR("Today page"));

    v14 = -[NSObject storeSecureCodedObject:error:](v13, "storeSecureCodedObject:error:", v11, a5);
    if (v14)
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.todayPageConfigCacheUpdate"), "UTF8String"));
  }

  return v14;
}

- (id)loadHomeScreenAndTodayPageConfigurationsFromJSONAtPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  ATXHomeScreenPage *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 0, a4);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Page configurations"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            v16 = [ATXHomeScreenPage alloc];
            v17 = -[ATXHomeScreenPage initFromDictionaryRepresentation:](v16, "initFromDictionaryRepresentation:", v15, (_QWORD)v19);
            if (v17)
              objc_msgSend(v9, "addObject:", v17);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)prettyPrintedJSON
{
  ATXHomeScreenConfigCache *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(ATXHomeScreenConfigCache);
  -[ATXHomeScreenConfigCache loadDockAppListWithError:](v2, "loadDockAppListWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXHomeScreenConfigCache loadHomeScreenAndTodayPageConfigurationsIncludingHidden:error:](v2, "loadHomeScreenAndTodayPageConfigurationsIncludingHidden:error:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentationForIntrospection", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("Page configurations"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, CFSTR("Dock apps"));
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);
  else
    v15 = CFSTR("{ \"error\": \"Error formatting json\" }");

  return v15;
}

+ (BOOL)appPredictionPanelExistsInPage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v3, "panels");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v24)
    {
      v6 = *(_QWORD *)v31;
      v7 = *MEMORY[0x1E0CF9388];
      v22 = *(_QWORD *)v31;
      v23 = v4;
      v25 = v5;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v31 != v6)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v9, "widgets", v22);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v27 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                objc_msgSend(v15, "extensionBundleId");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v16, "isEqualToString:", v7) & 1) != 0)
                {
                  objc_msgSend(v15, "widgetKind");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  ATXSpecialWidgetKindAppPredictions();
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v17, "isEqualToString:", v18);

                  if ((v19 & 1) != 0)
                  {

                    v20 = 1;
                    v4 = v23;
                    v5 = v25;
                    goto LABEL_23;
                  }
                }
                else
                {

                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v12);
          }

          v5 = v25;
          v6 = v22;
        }
        v20 = 0;
        v4 = v23;
        v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v24);
    }
    else
    {
      v20 = 0;
    }
LABEL_23:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)suggestionsWidgetExistsInPage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v3, "stacks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v24)
    {
      v6 = *(_QWORD *)v31;
      v7 = *MEMORY[0x1E0CF9480];
      v22 = *(_QWORD *)v31;
      v23 = v4;
      v25 = v5;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v31 != v6)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v9, "widgets", v22);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v27 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                objc_msgSend(v15, "extensionBundleId");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v16, "isEqualToString:", v7) & 1) != 0)
                {
                  objc_msgSend(v15, "widgetKind");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  ATXSpecialWidgetKindSiriSuggestions();
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v17, "isEqualToString:", v18);

                  if ((v19 & 1) != 0)
                  {

                    v20 = 1;
                    v4 = v23;
                    v5 = v25;
                    goto LABEL_23;
                  }
                }
                else
                {

                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v12);
          }

          v5 = v25;
          v6 = v22;
        }
        v20 = 0;
        v4 = v23;
        v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v24);
    }
    else
    {
      v20 = 0;
    }
LABEL_23:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)initWithPath:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Couldn't create directory %@", (uint8_t *)&v3, 0xCu);
}

- (void)loadHomeScreenAndTodayPageConfigurationsIncludingHidden:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_ERROR, "Missing today page config when trying to load home screen and today page configs", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeHomeScreenPageConfigurations:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "Will write home screen pages", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeDockAppList:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "Will write dock apps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeTodayPageStacks:appPredictionPanels:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "Will write today page", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
