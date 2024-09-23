@implementation ATXAppIconState

void __45___ATXAppIconState_allAppsKnownToSpringBoard__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __34___ATXAppIconState_sharedInstance__block_invoke()
{
  void *v0;
  _ATXAppIconState *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = [_ATXAppIconState alloc];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DAAE90], "atx_sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_ATXAppIconState initWithHomeScreenConfigCache:sbsHomeScreenService:](v1, "initWithHomeScreenConfigCache:sbsHomeScreenService:", v2, v3);
  v5 = (void *)sharedInstance__pasExprOnceResult_23;
  sharedInstance__pasExprOnceResult_23 = v4;

  objc_autoreleasePoolPop(v0);
}

void __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_reload");
  }
  else
  {
    __atxlog_handle_gi();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_cold_1();

  }
}

void __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_35(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[14], "runAfterDelaySeconds:coalescingBehavior:", 0, 0.1);
  }
  else
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_cold_1();

  }
}

uint64_t __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __27___ATXAppIconState__reload__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _ATXIconLocation *v15;
  id v16;

  v16 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v16, "bundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B0]), "initWithIndex:", objc_msgSend(*(id *)(a1 + 32), "pageIndex"));
    objc_msgSend(v10, "indexPathByAddingIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "indexPathByAddingIndex:", a4);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

      v11 = (void *)v12;
    }
    v15 = -[_ATXIconLocation initWithIndexPath:isOnDock:existsInAppLibraryOnly:isInstalled:]([_ATXIconLocation alloc], "initWithIndexPath:isOnDock:existsInAppLibraryOnly:isInstalled:", v11, 0, 0, objc_msgSend(*(id *)(a1 + 56), "containsObject:", v9) ^ 1);
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v15, v9);

    v8 = v16;
  }

}

void __27___ATXAppIconState__reload__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v7 = a2;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "folderPages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __27___ATXAppIconState__reload__block_invoke_3;
    v8[3] = &unk_1E82E4058;
    v9 = *(id *)(a1 + 32);
    v10 = a3;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
  objc_autoreleasePoolPop(v5);

}

void __27___ATXAppIconState__reload__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
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
  objc_msgSend(a2, "contents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __54___ATXAppIconState_allInstalledAppsKnownToSpringBoard__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54___ATXAppIconState_allInstalledAppsKnownToSpringBoard__block_invoke_2;
  v3[3] = &unk_1E82E40A8;
  v4 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __54___ATXAppIconState_allInstalledAppsKnownToSpringBoard__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isInstalled"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __33___ATXAppIconState_allDockedApps__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33___ATXAppIconState_allDockedApps__block_invoke_2;
  v3[3] = &unk_1E82E40A8;
  v4 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __33___ATXAppIconState_allDockedApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isOnDock"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __33___ATXAppIconState_allFolderApps__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33___ATXAppIconState_allFolderApps__block_invoke_2;
  v3[3] = &unk_1E82E40A8;
  v4 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __33___ATXAppIconState_allFolderApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 == 3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __42___ATXAppIconState_appOnDockWithBundleId___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "isOnDock");

}

void __44___ATXAppIconState_appInFolderWithBundleId___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "length") == 3;

}

void __53___ATXAppIconState_springboardPageNumberForBundleId___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __55___ATXAppIconState_springboardPageLocationForBundleId___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __48___ATXAppIconState_folderPageNumberForBundleId___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __35___ATXAppIconState_numberOfFolders__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

uint64_t __33___ATXAppIconState_numberOfPages__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

void __42___ATXAppIconState_nonFolderAppSetOnPages__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __42___ATXAppIconState_nonFolderAppSetOnPages__block_invoke_2;
  v18[3] = &unk_1E82E40D0;
  v4 = v2;
  v19 = v4;
  v20 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v18);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, v10);

        }
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObjectsFromArray:", v4);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    }
    while (v7);
  }

}

void __42___ATXAppIconState_nonFolderAppSetOnPages__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isOnDock"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
  }
  else
  {
    objc_msgSend(v5, "indexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7 == 2)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "indexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "indexAtPosition:", 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v12 = (void *)objc_opt_new();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, v10);

      }
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

    }
  }

}

void __44___ATXAppIconState_getFirstVisiblePageIndex__block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "firstObject");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "unsignedIntegerValue");

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
  }
}

void __65___ATXAppIconState_springboardPageNumbersWithAppPredictionPanels__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __64___ATXAppIconState_springboardPageNumbersWithSuggestionsWidgets__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "_ATXAppIconState: couldn't perform reload operation because swelf is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
