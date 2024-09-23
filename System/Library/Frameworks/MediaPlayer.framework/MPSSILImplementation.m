@implementation MPSSILImplementation

BOOL __80___MPSSILImplementation__enumerator_didEncounterEntry_withExclusiveAccessToken___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "entryType") == 3;
}

uint64_t __34___MPSSILImplementation_itemCount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 8);
  result = objc_msgSend(*(id *)(v2 + 104), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result + v3;
  return result;
}

void __57___MPSSILImplementation_dataSourceReloadItems_inSection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 48);
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v27;
    *(_QWORD *)&v6 = 138543618;
    v21 = v6;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = objc_msgSend(v5, "section:shouldShuffleExcludeItem:", *(_QWORD *)(a1 + 40), v8);
        else
          v9 = 0;
        objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v25, v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifiersItemEntryMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if (v9)
          {
            objc_msgSend(v13, "previousEntry");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v13, "latestUserClone");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isRemoved");

              if ((v16 & 1) == 0)
                --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
              objc_msgSend(v13, "setUserRemoved");
              v17 = os_log_create("com.apple.amp.mediaplayer", "SIL");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v13, "sectionIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "itemIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v21;
                v31 = v18;
                v32 = 2114;
                v33 = v19;
                _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "[SPROX:%{public}@] dataSourceReloadItem:%{public}@ inSection:… | setUserRemoved [applying exclude from shuffle]", buf, 0x16u);

              }
            }
            else
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObject:", v13);
            }
          }
        }
        else if ((v9 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "_createShuffleCloneForItem:inSection:withExclusiveAccessToken:", v8, *(_QWORD *)(a1 + 40), v25);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addObject:", v20);

        }
        ++v7;
      }
      while (v24 != v7);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v24);
  }

}

void __59___MPSSILImplementation_dataSourceRemoveItems_fromSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "_sectionHeadEntryMapWithExclusiveAccessToken:", v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifiersItemEntryMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "previousEntry");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
        }
        else
        {
          objc_msgSend(v12, "latestUserClone");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isRemoved");

          if ((v15 & 1) == 0)
            --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          objc_msgSend(v12, "setDataSourceRemoved");
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

}

uint64_t __63___MPSSILImplementation_dataSourceInsertItemsAtTail_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isSequentialSection:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), v3);
  if ((v4 & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = *(id *)(a1 + 48);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "_createShuffleCloneForItem:inSection:withExclusiveAccessToken:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), *(_QWORD *)(a1 + 40), v3, (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v4;
}

uint64_t __67___MPSSILImplementation_dataSourceInsertItems_afterItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isSequentialSection:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), v3);
  if ((v4 & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = *(id *)(a1 + 48);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "_createShuffleCloneForItem:inSection:withExclusiveAccessToken:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), *(_QWORD *)(a1 + 40), v3, (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v4;
}

uint64_t __63___MPSSILImplementation_dataSourceInsertItemsAtHead_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isSequentialSection:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), v3);
  if ((v4 & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = *(id *)(a1 + 48);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "_createShuffleCloneForItem:inSection:withExclusiveAccessToken:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), *(_QWORD *)(a1 + 40), v3, (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v4;
}

void __65___MPSSILImplementation_addDataSourceAtEnd_section_sequentially___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = a2;
    objc_msgSend(v2, "_endEntryWithExclusiveAccessToken:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_insertDataSource:forSection:afterEntry:withExclusiveAccessToken:", v3, v4);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = a2;
    objc_msgSend(v2, "_addShuffleSection:dataSource:withExclusiveAccessToken:", v6, v7);
  }

}

void __80___MPSSILImplementation_addDataSource_section_sequentially_beforeTailOfSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (*(_BYTE *)(a1 + 64)
    && (v4 = objc_msgSend(*(id *)(a1 + 32), "_isSequentialSection:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), v3),
        v3 = v12,
        v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "tailEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "previousEntry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_insertDataSource:forSection:afterEntry:withExclusiveAccessToken:", v9, v8, v11, v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_addShuffleSection:dataSource:withExclusiveAccessToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v3);
  }

}

void __79___MPSSILImplementation_addDataSource_section_sequentially_afterTailOfSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  v11 = v3;
  if (*(_BYTE *)(a1 + 64)
    && (v4 = objc_msgSend(*(id *)(a1 + 32), "_isSequentialSection:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), v3),
        v3 = v11,
        v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "tailEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_insertDataSource:forSection:afterEntry:withExclusiveAccessToken:", v9, v8, v10, v11);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_addShuffleSection:dataSource:withExclusiveAccessToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v3);
  }

}

void __80___MPSSILImplementation_addDataSource_section_sequentially_afterItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (!*(_BYTE *)(a1 + 72))
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifiersItemEntryMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestUserClone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "previousEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {

LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "_addShuffleSection:dataSource:withExclusiveAccessToken:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), v10);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "_insertDataSource:forSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v8, v10);

LABEL_6:
}

uint64_t __67___MPSSILImplementation_addDataSourceAtStart_section_sequentially___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  void *v4;

  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  if (v3)
    return objc_msgSend(v4, "_insertDataSource:forSection:afterEntry:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, a2);
  else
    return objc_msgSend(v4, "_addShuffleSection:dataSource:withExclusiveAccessToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), a2);
}

void __60___MPSSILImplementation_safelyReshuffleAfterItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  const char *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_sectionHeadEntryMapWithExclusiveAccessToken:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("🔀"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastItemEntry");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v24 = v4;
    v7 = 0x1EE2C0000uLL;
    v8 = "com.apple.amp.mediaplayer";
    v9 = "SIL";
    do
    {
      objc_msgSend(v6, "sectionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40)))
      {
        objc_msgSend(v6, "itemIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 48));

      }
      else
      {
        v12 = 0;
      }

      objc_msgSend(v6, "nextEntries");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14 > 1 || (v12 & 1) != 0)
        break;
      if ((objc_msgSend(v6, "isRemoved") & 1) == 0)
      {
        v15 = (void *)objc_msgSend(v6, "newClonedEntry");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + *(int *)(v7 + 4044)), "addObject:", v15);
        --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        objc_msgSend(v6, "setUserRemoved");
        v16 = os_log_create(v8, v9);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sectionIdentifier");
          v18 = v9;
          v19 = v8;
          v20 = v7;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "itemIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v26 = v17;
          v27 = 2114;
          v28 = v21;
          v29 = 2114;
          v30 = v22;
          _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEFAULT, "[SIL:%{public}@] safelyReshuffleAfterItem:%{public}@ inSection:%{public}@ | setUserRemoved [applying exclude from shuffle]", buf, 0x20u);

          v7 = v20;
          v8 = v19;
          v9 = v18;

        }
      }
      objc_msgSend(v6, "previousEntry");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        break;
      }

      v6 = v23;
    }
    while (v23);

    v4 = v24;
  }

}

uint64_t __52___MPSSILImplementation_dequeueCandidatesWithQuota___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dequeueCandidatesWithQuota:withExclusiveAccessToken:", *(_QWORD *)(a1 + 40), a2);
}

void __66___MPSSILImplementation_encodeWithCoder_withExclusiveAccessToken___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isSequentialSection:withExclusiveAccessToken:", a2, *(_QWORD *)(a1 + 40)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

}

void __113___MPSSILImplementation_initWithSectionedIdentifierList_randomSource_startingItemEntry_withExclusiveAccessToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addShuffleSection:dataSource:withExclusiveAccessToken:", v6, v7, *(_QWORD *)(a1 + 40));

}

@end
