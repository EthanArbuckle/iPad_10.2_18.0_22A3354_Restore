@implementation FPExtensionDataSource

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id WeakRetained;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  _BYTE v74[10];
  uint64_t v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 16) == *(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(v1 + 27) = 0;
    v69 = *(_QWORD *)(a1 + 80);
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_4();

    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v44 = objc_msgSend(*(id *)(a1 + 48), "count");
      v45 = objc_msgSend(*(id *)(a1 + 56), "count");
      v46 = *(unsigned __int8 *)(a1 + 96);
      v47 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 72), "fp_prettyDescription");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v48;
      v50 = " (more coming)";
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)v74 = v44;
      *(_WORD *)&v74[8] = 2048;
      if (!v46)
        v50 = "";
      v75 = v45;
      v76 = 2080;
      v77 = v50;
      v78 = 2112;
      v79 = v47;
      v80 = 2112;
      v81 = v48;
      _os_log_debug_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] updates: %lld, deletion: %lld%s, changeToken: %@, error: %@\n", buf, 0x34u);

    }
    v5 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(v5, "_invalidateWithError:");
LABEL_66:
      __fp_leave_section_Debug((uint64_t)&v69);
      return;
    }
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v6, "lastForcedUpdate");
    v54 = *(_QWORD *)(a1 + 88);

    if (v55 != v54)
    {
      fp_current_or_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_3();

    }
    if (*(_BYTE *)(a1 + 96))
      v8 = 0;
    else
      v8 = v55 == v54;
    v9 = !v8;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = v9;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 64));
    if (!*(_QWORD *)(a1 + 64) && !*(_QWORD *)(a1 + 72))
    {
      fp_current_or_default_log();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "_gatherInitialItems");
      goto LABEL_66;
    }
    if (v55 == v54 && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
      goto LABEL_69;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v10 = *(id *)(a1 + 48);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v66 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          v15 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
          objc_msgSend(v14, "itemID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      }
      while (v11);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v17 = *(id *)(a1 + 56);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v62 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v22, v21);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      }
      while (v18);
    }

    if (v55 == v54)
    {
LABEL_69:
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
      {
        fp_current_or_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_2();

        v56 = (void *)objc_opt_new();
        v25 = (void *)objc_opt_new();
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v26 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v58;
          do
          {
            for (k = 0; k != v27; ++k)
            {
              if (*(_QWORD *)v58 != v28)
                objc_enumerationMutation(v26);
              v30 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v30);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "addObject:", v33);

              }
              else
              {
                objc_msgSend(v25, "addObject:", v30);
              }
            }
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
          }
          while (v27);
        }

        v34 = objc_opt_new();
        v35 = *(_QWORD *)(a1 + 32);
        v36 = *(void **)(v35 + 64);
        *(_QWORD *)(v35 + 64) = v34;

        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
        objc_msgSend(WeakRetained, "dataSource:receivedUpdatedItems:deletedItems:hasMoreChanges:", *(_QWORD *)(a1 + 32), v56, v25, 0);

        v38 = objc_msgSend(v56, "count");
        v39 = objc_msgSend(v25, "count");

        v40 = v39 + v38;
      }
      else
      {
        v41 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
        objc_msgSend(v41, "dataSource:receivedUpdatedItems:deletedItems:hasMoreChanges:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);

        v42 = objc_msgSend(*(id *)(a1 + 48), "count");
        v40 = objc_msgSend(*(id *)(a1 + 56), "count") + v42;
      }
      if (!*(_BYTE *)(a1 + 96) && v55 == v54 && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26))
        goto LABEL_66;
      v23 = v40 + 1;
      if ((unint64_t)(v40 + 1) >= 0x3E9)
      {
        objc_msgSend(*(id *)(a1 + 32), "_gatherInitialItems");
        goto LABEL_66;
      }
    }
    else
    {
      v23 = 0;
    }
    fp_current_or_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      v52 = *(unsigned __int8 *)(a1 + 96);
      v53 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 26);
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v74 = v52;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = v55 != v54;
      LOWORD(v75) = 1024;
      *(_DWORD *)((char *)&v75 + 2) = v53;
      _os_log_debug_impl(&dword_1A0A34000, v43, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching more changes [moreChanges: %d, concurrentChanges: %d, shouldUpdate: %d]", buf, 0x14u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updateItemsWithUpdatesCount:section:", v23, *(_QWORD *)(a1 + 80));
    goto LABEL_66;
  }
}

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5, uint64_t a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  char v30;

  v12 = a2;
  v13 = a3;
  v14 = a5;
  v15 = a7;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(a1 + 40);
  v18 = *(NSObject **)(v16 + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2;
  block[3] = &unk_1E444E1E8;
  block[4] = v16;
  v24 = v17;
  v25 = v12;
  v30 = a4;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = *(_OWORD *)(a1 + 48);
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v18, block);

}

void __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  int v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD *v18;
  uint64_t v19;
  uint8_t buf[40];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) == *(_QWORD *)(a1 + 40))
  {
    v19 = *(_QWORD *)(a1 + 88);
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_3();

    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_2(a1, buf, objc_msgSend(*(id *)(a1 + 48), "count"), v3);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 56));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) = 0;
    v4 = *(void **)(a1 + 72);
    if (v4 && (objc_msgSend(v4, "isEqual:", &_NSFileProviderInitialPageSortedByName) & 1) == 0)
      v5 = objc_msgSend(*(id *)(a1 + 72), "isEqual:", &_NSFileProviderInitialPageSortedByDate);
    else
      v5 = 1;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8)
      objc_storeStrong(v7, *(id *)(a1 + 64));
    if (*(_QWORD *)(a1 + 80))
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateWithError:");
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) += objc_msgSend(*(id *)(a1 + 48), "count");
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (*(_QWORD *)(v9 + 48) >> 4 < 0x271uLL || objc_msgSend(*(id *)(v9 + 8), "isUnbounded"))
         && *(_QWORD *)(a1 + 56) != 0;
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "dataSourceShouldAlwaysReplaceContents:", *(_QWORD *)(a1 + 32));

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
      v14 = WeakRetained;
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 48);
      if (v5 | v12)
        objc_msgSend(WeakRetained, "dataSource:replaceContentsWithItems:hasMoreChanges:", v15, v16, v10);
      else
        objc_msgSend(WeakRetained, "dataSource:receivedUpdatedItems:deletedItems:hasMoreChanges:", v15, v16, MEMORY[0x1E0C9AA60], v10);

      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "_gatherMoreItemsAfterPage:section:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88));
      }
      else
      {
        if (*(_QWORD *)(a1 + 56))
        {
          fp_current_or_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_1();

        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
        }
        v18 = *(_QWORD **)(a1 + 32);
        if (v18[5])
          objc_msgSend(v18, "_updateItems");
      }
    }
    __fp_leave_section_Debug((uint64_t)&v19);
  }
}

void __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a1[4];
  v15 = (void *)a1[5];
  v16 = *(NSObject **)(v14 + 88);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2;
  v23[3] = &unk_1E444E238;
  v23[4] = v14;
  v17 = v15;
  v18 = (void *)a1[6];
  v30 = a1[7];
  v24 = v17;
  v25 = v10;
  v26 = v11;
  v27 = v12;
  v28 = v18;
  v29 = v13;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  v22 = v10;
  dispatch_async(v16, v23);

}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  _BOOL4 v8;
  void *v9;

  v2 = a1 + 32;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v1 + 24);
  v4 = *(unsigned __int8 *)(v1 + 25);
  if (!v3)
  {
    if (!v4)
    {
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_1();
      goto LABEL_9;
    }
LABEL_7:
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_2();
LABEL_9:

    return;
  }
  if (v4)
    goto LABEL_7;
  if (+[FPItemCollection isEnumerationSuspended](FPItemCollection, "isEnumerationSuspended"))
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_3();
LABEL_15:

    *(_BYTE *)(*(_QWORD *)v2 + 26) = 1;
    return;
  }
  v7 = *(unsigned __int8 *)(*(_QWORD *)v2 + 27);
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v8)
      __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_5();
    goto LABEL_15;
  }
  if (v8)
    __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_4();

  v9 = *(void **)v2;
  if (*(_QWORD *)(*(_QWORD *)v2 + 40))
    objc_msgSend(v9, "_updateItems");
  else
    objc_msgSend(v9, "_gatherInitialItems");
}

uint64_t __45__FPExtensionDataSource_invalidateWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __35__FPExtensionDataSource_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __30__FPExtensionDataSource_start__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __30__FPExtensionDataSource_start__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1002, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateWithError:", v2);

}

void __30__FPExtensionDataSource_start__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 25))
  {
    if (*(_BYTE *)(v1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("FPExtensionDataSource.m"), 113, CFSTR("can't start twice"));

      v1 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v1 + 25))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("FPExtensionDataSource.m"), 114, CFSTR("can't restart"));

        v1 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_BYTE *)(v1 + 24) = 1;
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v5);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 56));
      v6 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __30__FPExtensionDataSource_start__block_invoke_3;
      v13[3] = &unk_1E444A598;
      v7 = *(void **)(a1 + 40);
      v13[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __30__FPExtensionDataSource_start__block_invoke_4;
      v12[3] = &unk_1E444A308;
      v12[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "keepAliveConnectionForRegisteredObserver:", v12);

      objc_msgSend(*(id *)(a1 + 32), "_gatherInitialItems");
    }
    else
    {
      v9 = *(void **)(a1 + 48);
      if (v9)
      {
        v10 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
      objc_msgSend(*(id *)(a1 + 32), "invalidateWithError:", v10);

    }
  }
}

void __30__FPExtensionDataSource_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(NSObject **)(v10 + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__FPExtensionDataSource_start__block_invoke_2;
  block[3] = &unk_1E444E170;
  v19 = v8;
  v20 = v11;
  block[4] = v10;
  v17 = v7;
  v18 = v9;
  v13 = v8;
  v14 = v9;
  v15 = v7;
  dispatch_sync(v12, block);

}

- (void)start
{
  void *v4;
  void *v5;
  FPExtensionEnumerationSettings *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *oobBuffer;
  uint64_t v11;
  void *v12;
  void *v13;
  FPExtensionEnumerationSettings *enumerationSettings;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[6];

  if (self->_started)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPExtensionDataSource.m"), 95, CFSTR("can't start twice"));

  }
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPExtensionDataSource.m"), 96, CFSTR("can't restart"));

  }
  v6 = self->_enumerationSettings;
  -[FPExtensionEnumerationSettings enumeratedItemID](v6, "enumeratedItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "providerDomainID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  self->_hasMoreIncoming = 1;
  v9 = (NSMutableDictionary *)objc_opt_new();
  oobBuffer = self->_oobBuffer;
  self->_oobBuffer = v9;

  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __30__FPExtensionDataSource_start__block_invoke;
  v18[3] = &unk_1E444E198;
  v18[4] = self;
  v18[5] = a2;
  v12 = (void *)MEMORY[0x1A1B00850](v18);
  +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  enumerationSettings = self->_enumerationSettings;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __30__FPExtensionDataSource_start__block_invoke_5;
  v16[3] = &unk_1E444E1C0;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v13, "fetchAndStartEnumeratingWithSettings:observer:completionHandler:", enumerationSettings, self, v16);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__FPExtensionDataSource_invalidate__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)invalidateWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__FPExtensionDataSource_invalidateWithError___block_invoke;
  v7[3] = &unk_1E4449A40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (FPExtensionDataSource)initWithEnumerationSettings:(id)a3
{
  id v5;
  FPExtensionDataSource *v6;
  FPExtensionDataSource *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPExtensionDataSource;
  v6 = -[FPExtensionDataSource init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_enumerationSettings, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.FileProvider.ExtensionDataSource.queue (%p)"), v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    FPDataSourceBaseQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create_with_target_V2(v9, v10, v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

  }
  return v7;
}

- (void)enumerationResultsDidChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(queue, block);
}

- (FPCollectionDataSourceDelegate)delegate
{
  return (FPCollectionDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_updateItems
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 134218242;
  v5 = a2;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx fetching changes from token: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)_updateItemsWithUpdatesCount:(unint64_t)a3 section:(unint64_t)a4
{
  void *v7;
  NSObject *v8;
  FPXEnumerator *v9;
  void *v10;
  uint64_t v11;
  NSData *changeToken;
  uint64_t v13;
  FPXEnumerator *v14;
  _QWORD v15[5];
  FPXEnumerator *v16;
  unint64_t v17;
  uint64_t v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_enumeratingExtensionResults)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPExtensionDataSource.m"), 295, CFSTR("update: already enumerating changes or items"));

  }
  if (+[FPItemCollection isEnumerationSuspended](FPItemCollection, "isEnumerationSuspended"))
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[FPExtensionDataSource _updateItemsWithUpdatesCount:section:].cold.1();

    self->_shouldUpdate = 1;
  }
  else if (self->_changeToken)
  {
    *(_WORD *)&self->_shouldUpdate = 256;
    v9 = self->_enumerator;
    -[FPExtensionDataSource delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "lastForcedUpdate");

    changeToken = self->_changeToken;
    v13 = _FPExtensionDataSourceBatchSize;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke;
    v15[3] = &unk_1E444E210;
    v15[4] = self;
    v16 = v9;
    v17 = a4;
    v18 = v11;
    v14 = v9;
    -[FPXEnumerator enumerateChangesFromToken:suggestedBatchSize:reply:](v14, "enumerateChangesFromToken:suggestedBatchSize:reply:", changeToken, v13, v15);

  }
  else
  {
    -[FPExtensionDataSource _gatherInitialItems](self, "_gatherInitialItems");
  }
}

- (void)_invalidate
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] invalidating extension data source: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_invalidateWithError:(id)a3
{
  NSObject *queue;
  id v5;
  id WeakRetained;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  self->_hasMoreIncoming = 0;
  self->_enumeratingExtensionResults = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dataSource:wasInvalidatedWithError:", self, v5);

  -[FPExtensionDataSource _invalidate](self, "_invalidate");
}

- (id)_initialPageFromSortDescriptors:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id *v9;
  id v10;

  v3 = a3;
  if (!objc_msgSend(v3, "count"))
    goto LABEL_6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_displayName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ascending");

  if ((v8 & 1) == 0)
  {
LABEL_6:
    v9 = (id *)&NSFileProviderInitialPageSortedByDate;
    goto LABEL_7;
  }
  v9 = (id *)&NSFileProviderInitialPageSortedByName;
LABEL_7:
  v10 = *v9;

  return v10;
}

- (void)_gatherMoreItemsAfterPage:(id)a3 section:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  FPXEnumerator *v11;
  uint64_t v12;
  id v13;
  FPXEnumerator *v14;
  _QWORD v15[5];
  FPXEnumerator *v16;
  id v17;
  unint64_t v18;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_started)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPExtensionDataSource.m"), 416, CFSTR("not started yet"));

  }
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPExtensionDataSource.m"), 417, CFSTR("was invalidated"));

  }
  if (self->_enumeratingExtensionResults)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPExtensionDataSource.m"), 418, CFSTR("gather: already enumerating changes or items"));

  }
  self->_enumeratingExtensionResults = 1;
  v11 = self->_enumerator;
  v12 = _FPExtensionDataSourcePageSize;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke;
  v15[3] = &unk_1E444E260;
  v15[4] = self;
  v16 = v11;
  v17 = v7;
  v18 = a4;
  v13 = v7;
  v14 = v11;
  -[FPXEnumerator enumerateItemsFromPage:suggestedPageSize:reply:](v14, "enumerateItemsFromPage:suggestedPageSize:reply:", v13, v12, v15);

}

- (void)_gatherInitialItems
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] ┣%llx gathering items from first page", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_oobBuffer, 0);
  objc_storeStrong((id *)&self->_lifetimeExtender, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_nextPageToken, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_enumerationSettings, 0);
}

+ (void)setSuggestedPageSize:(int64_t)a3
{
  _FPExtensionDataSourcePageSize = a3;
}

+ (int64_t)suggestedPageSize
{
  return _FPExtensionDataSourcePageSize;
}

+ (void)setSuggestedBatchSize:(int64_t)a3
{
  _FPExtensionDataSourceBatchSize = a3;
}

+ (int64_t)suggestedBatchSize
{
  return _FPExtensionDataSourceBatchSize;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPExtensionEnumerationSettings enumeratedItemID](self->_enumerationSettings, "enumeratedItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p id:%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

uint64_t __30__FPExtensionDataSource_start__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateWithError:", a2);
}

- (void)didUpdateItem:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __39__FPExtensionDataSource_didUpdateItem___block_invoke;
    block[3] = &unk_1E4449A40;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

void __39__FPExtensionDataSource_didUpdateItem___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "dataSource:receivedUpdatedItems:deletedItems:hasMoreChanges:", v3, v4, MEMORY[0x1E0C9AA60], *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 72));

}

- (BOOL)hasMoreIncoming
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__FPExtensionDataSource_hasMoreIncoming__block_invoke;
  v5[3] = &unk_1E444B600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__FPExtensionDataSource_hasMoreIncoming__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@ notification ignored on not started enumerator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@ notification ignored on invalidated enumerator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@ notifications are suspended, not doing anything", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@ received notification that the enumeration changed, refreshing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__FPExtensionDataSource_enumerationResultsDidChange__block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@ received notification that the enumeration changed, mark for future refresh", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_updateItemsWithUpdatesCount:section:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] skipping enumeration because it's suspended", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] change token is out of date, enumerating from scratch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] pushing changes from OOB buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] the collection has received OOB changes during the enumeration, buffering and forcing next enumeration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __62__FPExtensionDataSource__updateItemsWithUpdatesCount_section___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] ┳%llx received changes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] not gathering further because we have too many items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_2(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  *(_DWORD *)buf = 134218498;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = v4;
  *((_WORD *)buf + 11) = 2112;
  *((_QWORD *)buf + 3) = v5;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] items: %lld, next page: %@, change token: %@\n", buf, 0x20u);
}

void __59__FPExtensionDataSource__gatherMoreItemsAfterPage_section___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] ┳%llx received pages", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
