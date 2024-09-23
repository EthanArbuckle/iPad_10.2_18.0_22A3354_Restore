@implementation DUDictionaryManager

- (id)_allAvailableDefinitionDictionaries
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  DUDefinitionDictionary *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  -[DUDictionaryManager _availableDictionaryAssets](self, "_availableDictionaryAssets");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v3 = v26;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v44 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v8 = objc_msgSend(v7, "_formatVersion");
          if (v8 == MEMORY[0x22768EF4C]())
          {
            v9 = -[DUDefinitionDictionary initWithAsset:]([DUDefinitionDictionary alloc], "initWithAsset:", v7);
            if (v9)
            {
              if (objc_msgSend(v7, "state") != 1)
                -[DUDefinitionDictionary setActivated:](v9, "setActivated:", 1);
              objc_msgSend(v7, "attributes");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[DUDefinitionDictionary setPreferredOrder:](v9, "setPreferredOrder:", MEMORY[0x22768EF70](v10, v27));

              objc_msgSend(v2, "addObject:", v9);
            }

          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v4);
    }

    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __58__DUDictionaryManager__allAvailableDefinitionDictionaries__block_invoke;
    v42[3] = &unk_24ED10068;
    v42[4] = self;
    objc_msgSend(v2, "sortUsingComparator:", v42);
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(v2, "_filteredArrayOfObjectsPassingTest:", &__block_literal_global_343);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __58__DUDictionaryManager__allAvailableDefinitionDictionaries__block_invoke_3;
        v33[3] = &unk_24ED100D0;
        v33[4] = v14;
        v33[5] = &v38;
        objc_msgSend(v2, "_filteredArrayOfObjectsPassingTest:", v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v30;
          do
          {
            for (k = 0; k != v17; ++k)
            {
              if (*(_QWORD *)v30 != v18)
                objc_enumerationMutation(v16);
              objc_msgSend(v2, "removeObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
          }
          while (v17);
        }

        objc_msgSend(v14, "rawAsset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "count") && objc_msgSend(v20, "state") == 3)
        {
          objc_msgSend(v2, "removeObject:", v14);
          v21 = objc_msgSend(v20, "purgeSync");
          *((_BYTE *)v39 + 24) = 1;
          objc_msgSend(v20, "attributes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("DictionaryIdentifier"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("DictionaryUI: _allAvailableDefinitionDictionaries purged out-dated dictionary(%@) with error(%ld)"), v23, v21);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    }
    while (v11);
  }

  if (self->_initiallyEmptyAssets && objc_msgSend(v2, "count") && !objc_msgSend(obj, "count"))
  {
    -[DUDictionaryManager _migrateInstalledStateForNewDictionaries:](self, "_migrateInstalledStateForNewDictionaries:", v2);
    self->_initiallyEmptyAssets = 0;
  }
  objc_storeStrong((id *)&self->_availableDefinitionDictionaries, v2);
  _Block_object_dispose(&v38, 8);

  return v2;
}

- (id)_availableDictionaryAssets
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BE66BB0]);
  -[DUDictionaryManager _dictionaryAssetType](self, "_dictionaryAssetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithType:", v4);

  objc_msgSend(v5, "returnTypes:", 2);
  objc_msgSend(v5, "setDoNotBlockBeforeFirstUnlock:", 1);
  v6 = objc_msgSend(v5, "queryMetaDataSync");
  if (v6)
  {
    NSLog(CFSTR("DictionaryUI: [DUDictionaryManager _availableDictionaryAssets] returned nil. Error(%ld)"), v6);
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (DUDictionaryManager)init
{
  DUDictionaryManager *v2;
  DUDictionaryManager *v3;
  uint64_t v4;
  NSArray *availableDefinitionDictionaries;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUDictionaryManager;
  v2 = -[DUDictionaryManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DUDictionaryManager _allAvailableDefinitionDictionaries](v2, "_allAvailableDefinitionDictionaries");
    v4 = objc_claimAutoreleasedReturnValue();
    availableDefinitionDictionaries = v3->_availableDefinitionDictionaries;
    v3->_availableDefinitionDictionaries = (NSArray *)v4;

    v3->_initiallyEmptyAssets = -[NSArray count](v3->_availableDefinitionDictionaries, "count") == 0;
  }
  return v3;
}

+ (id)assetManager
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)_hasDefinitionForTerm:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_availableDefinitionDictionaries;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_hasDefinitionForTerm:", v5, (_QWORD)v11) & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_14;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)_definitionValuesForTerm:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_availableDefinitionDictionaries;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "activated", (_QWORD)v15))
        {
          objc_msgSend(v11, "_definitionValueForTerm:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12 && objc_msgSend(v12, "foundRecordRefs"))
            objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v5, "count"))
  {

    v5 = 0;
  }

  return v5;
}

- (void)_downloadDictionaryAssetCatalogWithTimeout:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setAllowsCellularAccess:", 1);
  objc_msgSend(v7, "setDiscretionary:", 0);
  objc_msgSend(v7, "setTimeoutIntervalForResource:", a3);
  v8 = (void *)MEMORY[0x24BE66B90];
  -[DUDictionaryManager _dictionaryAssetType](self, "_dictionaryAssetType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__DUDictionaryManager__downloadDictionaryAssetCatalogWithTimeout_completion___block_invoke;
  v11[3] = &unk_24ED10040;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "startCatalogDownload:options:then:", v9, v7, v11);

}

uint64_t __77__DUDictionaryManager__downloadDictionaryAssetCatalogWithTimeout_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__DUDictionaryManager__allAvailableDefinitionDictionaries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x22768F000]();
  v8 = objc_msgSend(*(id *)(a1 + 32), "_compareOrderOfDictionary:withDictionary:", v5, v6);
  objc_autoreleasePoolPop(v7);

  return v8;
}

uint64_t __58__DUDictionaryManager__allAvailableDefinitionDictionaries__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "rawAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wasLocal");

  return v3;
}

uint64_t __58__DUDictionaryManager__allAvailableDefinitionDictionaries__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "localizedDictionaryName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDictionaryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v3, "rawAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "wasLocal");

  if ((v7 & 1) != 0)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v3, "rawAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAssetToUpgrade:", v9);

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = 1;
  *(_BYTE *)(v10 + 24) = 1;
LABEL_6:

  return v11;
}

- (int64_t)_compareOrderOfDictionary:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int64_t v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "preferredOrder");
  v8 = objc_msgSend(v6, "preferredOrder");
  if (v7 == -1 && v8 == -1)
  {
    objc_msgSend(v5, "localizedSortName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedSortName");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = &stru_24ED102A8;
    v13 = objc_msgSend(v9, "localizedStandardCompare:", v12);

  }
  else if (v7 == -1 || v8 == -1)
  {
    if (v7 == -1)
      v13 = 1;
    else
      v13 = -1;
  }
  else if (v7 > v8)
  {
    v13 = 1;
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

- (void)_migrateInstalledStateForNewDictionaries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  id obj;
  void *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v4 = objc_alloc(MEMORY[0x24BE66B88]);
  -[DUDictionaryManager _dictionaryAssetType](self, "_dictionaryAssetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAssetType:", v5);

  objc_msgSend(v6, "setQueriesLocalAssetInformationOnly:", 1);
  v27 = v6;
  objc_msgSend(v6, "runQueryAndReturnError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v42;
      v28 = *(_QWORD *)v42;
      v29 = v7;
      do
      {
        v11 = 0;
        v31 = v9;
        do
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
          if (objc_msgSend(v12, "state") == 1)
          {
            v33 = v12;
            v34 = v11;
            objc_msgSend(v12, "attributes");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DictionaryIdentifier"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            NSLog(CFSTR("DictionaryUI: V1 dictionary (%@) was installed"), v14);
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v15 = v30;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v38;
              while (2)
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v38 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                  objc_msgSend(v20, "rawAsset");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "attributes");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("DictionaryIdentifier"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "isEqualToString:", v14);

                  if (v24)
                  {
                    objc_msgSend(v20, "rawAsset");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "setAssetToUpgrade:", v25);

                    goto LABEL_18;
                  }
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                if (v17)
                  continue;
                break;
              }
            }
LABEL_18:

            v35[0] = MEMORY[0x24BDAC760];
            v35[1] = 3221225472;
            v35[2] = __64__DUDictionaryManager__migrateInstalledStateForNewDictionaries___block_invoke;
            v35[3] = &unk_24ED100F8;
            v36 = v14;
            v26 = v14;
            objc_msgSend(v33, "purge:", v35);

            v10 = v28;
            v7 = v29;
            v9 = v31;
            v11 = v34;
          }
          ++v11;
        }
        while (v11 != v9);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v9);
    }

  }
}

void __64__DUDictionaryManager__migrateInstalledStateForNewDictionaries___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("DictionaryUI: Purge V1 dictionary (%@) was failed: %@"), *(_QWORD *)(a1 + 32), a2);
}

- (NSArray)availableDefinitionDictionaries
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableDefinitionDictionaries, 0);
}

@end
