@implementation DDSMobileAssetv2Provider

- (id)allContentItemsMatchingQuery:(id)a3 error:(id *)a4
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  -[DDSMobileAssetv2Provider assetsForQuery:errorPtr:](self, "assetsForQuery:errorPtr:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a4)
  {
    QueryLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DDSMobileAssetv2Provider allContentItemsMatchingQuery:error:].cold.1((uint64_t)a4, v7, v8, v9, v10, v11, v12, v13);

    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[DDSMobileAssetv2Provider contentItemsFromAssets:matchingFilter:](self, "contentItemsFromAssets:matchingFilter:", v6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)contentItemsFromAssets:(id)a3 matchingFilter:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "attributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Contents"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "filters");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[DDSContentItemMatcher assetContentItemsMatching:contentItems:parentAsset:](DDSContentItemMatcher, "assetContentItemsMatching:contentItems:parentAsset:", v15, v14, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObjectsFromArray:", v16);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)assetsForQuery:(id)a3 errorPtr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[DDSMobileAssetv2Provider assetQueryResultsCache](self, "assetQueryResultsCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedAssetsForQuery:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else if ((objc_msgSend(v6, "cachedOnly") & 1) != 0)
  {
    v9 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:](self, "assetsInCalalogForQuery:errorPtr:", v6, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[DDSMobileAssetv2Provider assetQueryResultsCache](self, "assetQueryResultsCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cacheAssets:forQuery:", v9, v6);

  }
  QueryLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    +[DDSAsset debuggingIDsForAssets:](DDSAsset, "debuggingIDsForAssets:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v6;
    v16 = 2114;
    v17 = v12;
    v18 = 1024;
    v19 = v8 != 0;
    v20 = 1024;
    v21 = objc_msgSend(v6, "cachedOnly");
    _os_log_impl(&dword_1DA990000, v11, OS_LOG_TYPE_DEFAULT, "assetsForQuery: %{public}@ final result: %{public}@ was cached: %d, cachedOnly: %d", (uint8_t *)&v14, 0x22u);

  }
  return v9;
}

- (DDSAssetQueryResultCache)assetQueryResultsCache
{
  return self->_assetQueryResultsCache;
}

- (id)assetsInCalalogForQuery:(id)a3 errorPtr:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  BOOL v37;
  NSObject *v38;
  DDSMAAsset *v39;
  id v40;
  void *v41;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  id obj;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  DDSMobileAssetv2Provider *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  int v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[DDSMobileAssetv2Provider dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DDSMobileAssetv2Provider compatabilityVersionForAssetType:](self, "compatabilityVersionForAssetType:", v7);
  v53 = self;
  objc_msgSend((id)objc_opt_class(), "platformVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maAssetQueryForDDSAssetQuery:compatabilityVersion:platformVersion:internalInstall:", v5, v8, v9, DDS_IS_INTERNAL_INSTALL());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "returnTypes:", 2);
  v43 = v10;
  if (objc_msgSend(v10, "queryMetaDataSync"))
  {
    QueryLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:].cold.5();

  }
  QueryLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:].cold.4();

  objc_msgSend(v5, "filter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  QueryLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:].cold.3();

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v43, "results");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v49)
  {
    v19 = *(_QWORD *)v60;
    v46 = v16;
    v47 = v5;
    v44 = *(_QWORD *)v60;
    v45 = v18;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v60 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:].cold.2();
          v50 = v21;
          v51 = i;
          objc_msgSend(v21, "attributes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("AssetRegion"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v52 = v16;
          v24 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
          if (v24)
          {
            v25 = v24;
            v26 = 0;
            v54 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v56 != v54)
                  objc_enumerationMutation(v52);
                v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:].cold.1();
                objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Country"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Country"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = -[DDSMobileAssetv2Provider shouldMatchAttributeValue:givenValue:](v53, "shouldMatchAttributeValue:givenValue:", v29, v30);

                objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Province"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Province"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = -[DDSMobileAssetv2Provider shouldMatchAttributeValue:givenValue:](v53, "shouldMatchAttributeValue:givenValue:", v32, v33);

                objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("City"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("City"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = -[DDSMobileAssetv2Provider shouldMatchAttributeValue:givenValue:](v53, "shouldMatchAttributeValue:givenValue:", v35, v36);

                if (!v26 && v31)
                  v26 = v34 && v37;
                QueryLog();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138478083;
                  v64 = v23;
                  v65 = 1024;
                  v66 = v26;
                  _os_log_debug_impl(&dword_1DA990000, v38, OS_LOG_TYPE_DEBUG, "Found asset region: %{private}@ didMatch: %d", buf, 0x12u);
                }

              }
              v25 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
            }
            while (v25);
          }
          else
          {
            v26 = 0;
          }

          v5 = v47;
          if ((objc_msgSend(v47, "installedOnly") & 1) == 0)
          {
            v18 = v45;
            v16 = v46;
            v19 = v44;
            v21 = v50;
            i = v51;
            if (!v26)
              continue;
LABEL_38:
            v39 = -[DDSMAAsset initWithMAAsset:]([DDSMAAsset alloc], "initWithMAAsset:", v21);
            objc_msgSend(v18, "addObject:", v39);

            continue;
          }
          v18 = v45;
          v16 = v46;
          v19 = v44;
          v21 = v50;
          i = v51;
          if (!v26)
            continue;
        }
        else if ((objc_msgSend(v5, "installedOnly") & 1) == 0)
        {
          goto LABEL_38;
        }
        if (objc_msgSend(v21, "state") == 2 || objc_msgSend(v21, "state") == 3)
          goto LABEL_38;
      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v49);
  }

  if (objc_msgSend(v5, "latestOnly"))
  {
    objc_msgSend((id)objc_opt_class(), "latestAssetsOnlyFromAssets:", v18);
    v40 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = v18;
  }
  v41 = v40;

  return v41;
}

- (DDSMobileAssetv2ProviderDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setCompatabilityVersion:(int64_t)a3 forAssetType:(id)a4
{
  void *v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[DDSMobileAssetv2Provider compatabilityVersionByAssetType](self, "compatabilityVersionByAssetType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v7);

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)compatabilityVersionForAssetType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  int64_t v9;
  NSObject *v11;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileAsset.LinguisticData")))
  {
    -[DDSMobileAssetv2Provider dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "linguisticAssetCompatabilityVersion");
LABEL_7:
    v9 = v6;
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileAsset.MecabraDictionaryRapidUpdates")))
  {
    -[DDSMobileAssetv2Provider dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mecabraDictionaryRapidUpdatesAssetCompatabilityVersion");
    goto LABEL_7;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[DDSMobileAssetv2Provider compatabilityVersionByAssetType](self, "compatabilityVersionByAssetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (v5)
  {
    v6 = objc_msgSend(v5, "integerValue");
    goto LABEL_7;
  }
  QueryLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[DDSMobileAssetv2Provider compatabilityVersionForAssetType:].cold.1();

  v9 = -1;
LABEL_8:

  return v9;
}

- (NSMutableDictionary)compatabilityVersionByAssetType
{
  return self->_compatabilityVersionByAssetType;
}

+ (id)platformVersion
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;

  v2 = (void *)MGCopyAnswer();
  v3 = objc_msgSend(v2, "intValue");
  if (v2)
    CFRelease(v2);
  v4 = v3 - 1;
  if ((v3 - 1) < 0xB && ((0x52Fu >> v4) & 1) != 0)
    return off_1EA141B78[v4];
  DefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[DDSMobileAssetv2Provider platformVersion].cold.1(v3, v5);

  return 0;
}

+ (id)latestAssetsOnlyFromAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "uniqueIdentifier", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "latestBetweenAssetA:AssetB:", v13, v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v11);

        }
        else
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (DDSMobileAssetv2Provider)init
{
  DDSMobileAssetv2ProviderDataSource *v3;
  DDSMobileAssetv2Provider *v4;

  v3 = objc_alloc_init(DDSMobileAssetv2ProviderDataSource);
  v4 = -[DDSMobileAssetv2Provider initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (DDSMobileAssetv2Provider)initWithDataSource:(id)a3
{
  id v5;
  DDSMobileAssetv2Provider *v6;
  DDSAssetQueryResultCache *v7;
  DDSAssetQueryResultCache *assetQueryResultsCache;
  uint64_t v9;
  NSMutableDictionary *downloadStateByAssetID;
  uint64_t v11;
  NSMutableDictionary *compatabilityVersionByAssetType;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DDSMobileAssetv2Provider;
  v6 = -[DDSMobileAssetv2Provider init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(DDSAssetQueryResultCache);
    assetQueryResultsCache = v6->_assetQueryResultsCache;
    v6->_assetQueryResultsCache = v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    downloadStateByAssetID = v6->_downloadStateByAssetID;
    v6->_downloadStateByAssetID = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    compatabilityVersionByAssetType = v6->_compatabilityVersionByAssetType;
    v6->_compatabilityVersionByAssetType = (NSMutableDictionary *)v11;

    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v6;
}

- (BOOL)shouldMatchAttributeValue:(id)a3 givenValue:(id)a4
{
  id v5;
  char v6;
  char v7;
  char v8;

  v5 = a3;
  v6 = DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)a4);
  v7 = objc_msgSend(v5, "isEqualToString:", &stru_1EA1420B0);

  if (v5)
    v8 = 1;
  else
    v8 = v7;
  if (a4)
    v8 = 0;
  return v8 | v6;
}

- (void)beginDownloadForAssertions:(id)a3 discretionaryDownload:(BOOL)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  _QWORD v17[5];
  id v18;
  __int128 *p_buf;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v16 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  DefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1DA990000, v6, OS_LOG_TYPE_DEFAULT, "Begin download for %lu assertions", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke;
        v17[3] = &unk_1EA141A18;
        v17[4] = self;
        p_buf = &buf;
        v20 = v25;
        v18 = v7;
        -[DDSMobileAssetv2Provider beginDownloadForAssertion:discretionaryDownload:handler:](self, "beginDownloadForAssertion:discretionaryDownload:handler:", v15, v16, v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v12);
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&buf, 8);

}

void __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    DefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke_cold_2();

  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeObject:", v5);
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
  if (v6)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (!*(_BYTE *)(v9 + 24))
      *(_BYTE *)(v9 + 24) = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  UpdateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke_cold_1();

  if (!v8)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error updating assertions"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = ErrorDomainv2;
      v17 = CFSTR("message");
      v18[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didCompleteDownloadForAssertions:error:", *(_QWORD *)(a1 + 40), v15);

  }
}

- (void)beginDownloadForAssertion:(id)a3 discretionaryDownload:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  __int128 *p_buf;
  id v28;
  _QWORD v29[5];
  id v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  DefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1DA990000, v10, OS_LOG_TYPE_DEFAULT, "Begin download for assertion: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v8, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "installedOnly"))
  {

  }
  else
  {
    objc_msgSend(v8, "query");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "localOnly");

    if (!v13)
      goto LABEL_9;
  }
  DefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[DDSMobileAssetv2Provider beginDownloadForAssertion:discretionaryDownload:handler:].cold.1(v8, v14);

LABEL_9:
  v15 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke;
  v29[3] = &unk_1EA141A40;
  v29[4] = self;
  v16 = v9;
  v30 = v16;
  v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1DF0A321C](v29);
  objc_msgSend(v8, "query");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:](self, "assetsInCalalogForQuery:errorPtr:", v18, &v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v28;

  if (v20 || !objc_msgSend(v19, "count"))
  {
    ((void (**)(_QWORD, id, id))v17)[2](v17, v8, v20);
  }
  else
  {
    DefaultLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      +[DDSAsset debuggingIDsForAssets:](DDSAsset, "debuggingIDsForAssets:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_1DA990000, v21, OS_LOG_TYPE_DEFAULT, "Downloading assets %{public}@", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__2;
    v34 = __Block_byref_object_dispose__2;
    v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v19);
    objc_msgSend(v8, "policy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_202;
    v24[3] = &unk_1EA141A68;
    p_buf = &buf;
    v26 = v17;
    v25 = v8;
    -[DDSMobileAssetv2Provider beginDownloadForAssets:withPolicy:discretionaryDownload:error:handler:](self, "beginDownloadForAssets:withPolicy:discretionaryDownload:error:handler:", v19, v23, v6, 0, v24);

    _Block_object_dispose(&buf, 8);
  }

}

void __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "didCompleteDownloadForAssertion:error:", v7, v5);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

void __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_202(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  DefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_202_cold_2();

  if ((unint64_t)(a3 - 9) > 1)
  {
    if (a3 == 11)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "debuggingID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Error downloading asset: %@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = ErrorDomainv2;
      v15 = CFSTR("message");
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 1, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeObject:", v5);
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
    {
      DefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_202_cold_1(a1 + 48);

    }
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_12:

}

- (void)startDownloadForAsset:(id)a3 withOptions:(id)a4 progress:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  objc_msgSend(a3, "maAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__DDSMobileAssetv2Provider_startDownloadForAsset_withOptions_progress_handler___block_invoke;
  v18[3] = &unk_1EA141A90;
  v19 = v9;
  v14 = v9;
  objc_msgSend(v12, "attachProgressCallBack:", v18);
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __79__DDSMobileAssetv2Provider_startDownloadForAsset_withOptions_progress_handler___block_invoke_2;
  v16[3] = &unk_1EA141AB8;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v12, "startDownload:then:", v11, v16);

}

uint64_t __79__DDSMobileAssetv2Provider_startDownloadForAsset_withOptions_progress_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __79__DDSMobileAssetv2Provider_startDownloadForAsset_withOptions_progress_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)beginDownloadForAssets:(id)a3 withPolicy:(id)a4 discretionaryDownload:(BOOL)a5 error:(id *)a6 handler:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id obj;
  _QWORD v22[6];
  id v23;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v8 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v11;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18);
        -[DDSMobileAssetv2Provider downloadOptionsForPolicy:discretionaryDownload:](self, "downloadOptionsForPolicy:discretionaryDownload:", v12, v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v17;
        v24[1] = 3221225472;
        v24[2] = __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke;
        v24[3] = &unk_1EA141AE0;
        v24[4] = self;
        v24[5] = v19;
        v22[0] = v17;
        v22[1] = 3221225472;
        v22[2] = __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke_2;
        v22[3] = &unk_1EA141B08;
        v22[4] = v19;
        v22[5] = self;
        v23 = v13;
        -[DDSMobileAssetv2Provider startDownloadForAsset:withOptions:progress:handler:](self, "startDownloadForAsset:withOptions:progress:handler:", v19, v20, v24, v22);
        -[DDSMobileAssetv2Provider didChangeDownloadState:forAsset:](self, "didChangeDownloadState:forAsset:", 1, v19);

        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

}

void __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isStalled") & 1) != 0)
  {
    v3 = 4;
  }
  else if (objc_msgSend(v5, "totalWritten") < 1)
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_msgSend(v5, "totalWritten");
    if (v4 >= objc_msgSend(v5, "totalExpected"))
      v3 = 0;
    else
      v3 = 3;
  }
  objc_msgSend(*(id *)(a1 + 32), "didChangeDownloadState:forAsset:", v3, *(_QWORD *)(a1 + 40));

}

uint64_t __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v4;
  uint64_t result;

  v2 = a2;
  if (a2 > 22)
  {
    if (a2 == 23 || a2 == 36)
    {
      v2 = 10;
      goto LABEL_12;
    }
  }
  else
  {
    if (!a2)
    {
      v2 = 9;
      goto LABEL_12;
    }
    if (a2 == 10)
      goto LABEL_12;
  }
  DefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke_2_cold_1(a1, v2, v4);

  v2 = 11;
LABEL_12:
  objc_msgSend(*(id *)(a1 + 40), "didChangeDownloadState:forAsset:", v2, *(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 32), v2);
  return result;
}

- (id)downloadOptionsForPolicy:(id)a3 discretionaryDownload:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v5;
  id v6;
  id v7;
  int v8;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0D4E088];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setAllowsCellularAccess:", 1);
  objc_msgSend(v7, "setAllowsExpensiveAccess:", 0);
  v8 = objc_msgSend(v6, "downloadWithoutPower");

  objc_msgSend(v7, "setRequiresPowerPluggedIn:", v8 ^ 1u);
  objc_msgSend(v7, "setDiscretionary:", v4);
  return v7;
}

- (id)downloadOptionsForCatalogWithType:(id)a3 discretionaryDownload:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0D4E088]);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "setAllowsExpensiveAccess:", 0);
  objc_msgSend(v5, "setRequiresPowerPluggedIn:", 0);
  objc_msgSend(v5, "setDiscretionary:", v4);
  return v5;
}

- (void)startCatalogDownloadForAssetType:(id)a3 withDownloadOptions:(id)a4 withCompletion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0D4E038];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__DDSMobileAssetv2Provider_startCatalogDownloadForAssetType_withDownloadOptions_withCompletion___block_invoke;
  v10[3] = &unk_1EA141AB8;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "startCatalogDownload:options:then:", a3, a4, v10);

}

uint64_t __96__DDSMobileAssetv2Provider_startCatalogDownloadForAssetType_withDownloadOptions_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateCatalogForAssetType:(id)a3 discretionaryDownload:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  DDSMobileAssetv2Provider *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  UpdateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_1DA990000, v10, OS_LOG_TYPE_DEFAULT, "Updating catalog for asset type %{public}@", buf, 0xCu);
  }

  -[DDSMobileAssetv2Provider downloadOptionsForCatalogWithType:discretionaryDownload:](self, "downloadOptionsForCatalogWithType:discretionaryDownload:", v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__DDSMobileAssetv2Provider_updateCatalogForAssetType_discretionaryDownload_withCompletion___block_invoke;
  v15[3] = &unk_1EA141B08;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  -[DDSMobileAssetv2Provider startCatalogDownloadForAssetType:withDownloadOptions:withCompletion:](self, "startCatalogDownloadForAssetType:withDownloadOptions:withCompletion:", v13, v11, v15);
  -[DDSMobileAssetv2Provider delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didBeginUpdateCatalog");

}

void __91__DDSMobileAssetv2Provider_updateCatalogForAssetType_discretionaryDownload_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  UpdateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("Fail");
    if (!a2)
      v5 = CFSTR("Success");
    *(_DWORD *)buf = 138543618;
    v16 = v5;
    v17 = 2048;
    v18 = a2;
    _os_log_impl(&dword_1DA990000, v4, OS_LOG_TYPE_DEFAULT, "Updated catalog result %{public}@ (result: %lu)", buf, 0x16u);
  }

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error updating catalog for %@: %lu"), *(_QWORD *)(a1 + 32), a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = ErrorDomainv2;
    v13 = CFSTR("message");
    v14 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    UpdateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __91__DDSMobileAssetv2Provider_updateCatalogForAssetType_discretionaryDownload_withCompletion___block_invoke_cold_1();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "didUpdateCatalogWithAssetType:error:", *(_QWORD *)(a1 + 32), v10);
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v10);

}

+ (id)latestBetweenAssetA:(id)a3 AssetB:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "compatibilityVersion");
  v8 = objc_msgSend(v6, "compatibilityVersion");
  v9 = v5;
  if (v7 <= v8)
  {
    v9 = v6;
    if (v8 <= v7)
    {
      v10 = objc_msgSend(v5, "contentVersion");
      v11 = objc_msgSend(v6, "contentVersion");
      if (v11 <= v10)
        v12 = v5;
      else
        v12 = v6;
      if (v10 <= v11)
        v9 = v12;
      else
        v9 = v5;
    }
  }
  v13 = v9;

  return v13;
}

- (void)removeAssetsForAssertions:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__DDSMobileAssetv2Provider_removeAssetsForAssertions___block_invoke;
  v3[3] = &unk_1EA141B30;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

void __54__DDSMobileAssetv2Provider_removeAssetsForAssertions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;

  objc_msgSend(a2, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setInstalledOnly:", 1);
  objc_msgSend(v4, "setLocalOnly:", 1);
  objc_msgSend(v4, "setLatestOnly:", 0);
  v5 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v5, "assetsForQuery:errorPtr:", v4, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (v7)
  {
    UpdateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __54__DDSMobileAssetv2Provider_removeAssetsForAssertions___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAssets:", v6);
  }

}

- (void)removeOldAssetsForAssertions:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UpdateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Removing old assets for assertions: %{public}@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__DDSMobileAssetv2Provider_removeOldAssetsForAssertions___block_invoke;
  v6[3] = &unk_1EA141B30;
  v6[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __57__DDSMobileAssetv2Provider_removeOldAssetsForAssertions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setInstalledOnly:", 1);
  objc_msgSend(v4, "setLocalOnly:", 1);
  objc_msgSend(v4, "setLatestOnly:", 0);
  v5 = *(void **)(a1 + 32);
  v19 = 0;
  objc_msgSend(v5, "assetsInCalalogForQuery:errorPtr:", v4, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UpdateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    +[DDSAsset debuggingIDsForAssets:](DDSAsset, "debuggingIDsForAssets:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v10;
    _os_log_impl(&dword_1DA990000, v9, OS_LOG_TYPE_DEFAULT, "All assets being evaluated for removal: %{public}@", buf, 0xCu);

  }
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)objc_opt_class(), "latestAssetsOnlyFromAssets:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  UpdateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[DDSAsset debuggingIDsForAssets:](DDSAsset, "debuggingIDsForAssets:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v16;
    _os_log_impl(&dword_1DA990000, v14, OS_LOG_TYPE_DEFAULT, "Latest assets not eligible for removal: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v8, "minusSet:", v13);
  v17 = *(void **)(a1 + 32);
  objc_msgSend(v8, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeAssets:", v18);

}

- (void)removeAssets:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  UpdateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    +[DDSAsset debuggingIDsForAssets:](DDSAsset, "debuggingIDsForAssets:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_impl(&dword_1DA990000, v4, OS_LOG_TYPE_DEFAULT, "Removing assets: %{public}@", buf, 0xCu);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "maAsset");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __41__DDSMobileAssetv2Provider_removeAssets___block_invoke;
        v14[3] = &unk_1EA141B58;
        v14[4] = v12;
        objc_msgSend(v13, "purge:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

void __41__DDSMobileAssetv2Provider_removeAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __41__DDSMobileAssetv2Provider_removeAssets___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "debuggingID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Purged asset (%{public}@) successfully", (uint8_t *)&v7, 0xCu);

  }
}

- (void)serverDidUpdateAssetsWithType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDSMobileAssetv2Provider assetQueryResultsCache](self, "assetQueryResultsCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCacheForAssetType:", v4);

}

- (void)didChangeDownloadState:(unint64_t)a3 forAsset:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  -[DDSMobileAssetv2Provider downloadStateByAssetID](self, "downloadStateByAssetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v9 != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSMobileAssetv2Provider downloadStateByAssetID](self, "downloadStateByAssetID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    if (a3 - 9 <= 2)
    {
      -[DDSMobileAssetv2Provider downloadStateByAssetID](self, "downloadStateByAssetID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", v14);

    }
    -[DDSMobileAssetv2Provider delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didChangeDownloadState:forAsset:", a3, v16);

  }
}

- (void)didCompleteDownloadForAssertion:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  DefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DDSMobileAssetv2Provider didCompleteDownloadForAssertion:error:].cold.1();

  -[DDSMobileAssetv2Provider delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didCompleteDownloadForAssertion:error:", v6, v7);

}

- (void)didUpdateCatalogWithAssetType:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  DefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DDSMobileAssetv2Provider didUpdateCatalogWithAssetType:error:].cold.1((uint64_t)v6, (uint64_t)v7, v8);

  -[DDSMobileAssetv2Provider delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didUpdateCatalogWithAssetType:error:", v6, v7);

}

- (id)updatableAssetsForAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  -[DDSMobileAssetv2Provider assetsForQuery:errorPtr:](self, "assetsForQuery:errorPtr:", v5, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  objc_msgSend(v4, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v9, "setInstalledOnly:", 1);
  objc_msgSend(v9, "setLocalOnly:", 1);
  objc_msgSend(v9, "setLatestOnly:", 0);
  v14 = 0;
  -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:](self, "assetsInCalalogForQuery:errorPtr:", v9, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  return v11;
}

- (DDSAssetProvidingDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->delegate, a3);
}

- (NSMutableDictionary)downloadStateByAssetID
{
  return self->_downloadStateByAssetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_compatabilityVersionByAssetType, 0);
  objc_storeStrong((id *)&self->_downloadStateByAssetID, 0);
  objc_storeStrong((id *)&self->_assetQueryResultsCache, 0);
  objc_storeStrong((id *)&self->delegate, 0);
}

- (void)compatabilityVersionForAssetType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, v0, v1, "Missing compatability version for asset type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)allContentItemsMatchingQuery:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, a2, a3, "assets query: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)assetsInCalalogForQuery:errorPtr:.cold.1()
{
  __assert_rtn("-[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:]", "DDSMobileAssetv2Provider.m", 188, "[allowedRegion isKindOfClass:NSDictionary.class]");
}

- (void)assetsInCalalogForQuery:errorPtr:.cold.2()
{
  __assert_rtn("-[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:]", "DDSMobileAssetv2Provider.m", 182, "[allowedRegions isKindOfClass:NSArray.class]");
}

- (void)assetsInCalalogForQuery:errorPtr:.cold.3()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v0, "filter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "filters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1DA990000, v3, v4, "Searching for regions in filters: %@, found allowed regions: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)assetsInCalalogForQuery:errorPtr:.cold.4()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v0, "results");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1DA990000, v2, v3, "assetsForQuery raw results: %{public}@, result value: %{public}lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)assetsInCalalogForQuery:errorPtr:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, v0, v1, "Error for queryMetaDataSync: %{public}lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DA990000, v0, v1, "Downloading assertions remaining: %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, v0, v1, "Encountered error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)beginDownloadForAssertion:(void *)a1 discretionaryDownload:(NSObject *)a2 handler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1DA990000, a2, OS_LOG_TYPE_ERROR, "Unexpected installedOnly/localOnly YES value on assertion's query: %@.  Are you really, really sure you meant that?", v4, 0xCu);

  OUTLINED_FUNCTION_3();
}

void __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_202_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1DA990000, v1, v2, "Remaining: %ld in set: %{public}@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

void __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_202_cold_2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v0, "debuggingID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1DA990000, v2, v3, "handling asset: %{public}@, state: %ld", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

void __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  OUTLINED_FUNCTION_5(&dword_1DA990000, a3, (uint64_t)a3, "Unexpected error downloading asset %{public}@, result: %ld", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

void __91__DDSMobileAssetv2Provider_updateCatalogForAssetType_discretionaryDownload_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __54__DDSMobileAssetv2Provider_removeAssetsForAssertions___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8();
  v6 = *MEMORY[0x1E0C80C00];
  +[DDSAsset debuggingIDsForAssets:](DDSAsset, "debuggingIDsForAssets:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543618;
  v5 = v2;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1DA990000, v0, v3, "Error removing assets (%{public}@) for query: %{public}@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_2_0();
}

void __41__DDSMobileAssetv2Provider_removeAssets___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8();
  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 32), "debuggingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543618;
  v5 = v2;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1DA990000, v0, v3, "Failed to purged asset (%{public}@) with result: %lu", (uint8_t *)&v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)didCompleteDownloadForAssertion:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DA990000, v0, v1, "didCompleteDownloadForAssertion: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)didUpdateCatalogWithAssetType:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_1DA990000, log, OS_LOG_TYPE_DEBUG, "didUpdateCatalogWithAssetType for asset type: %{public}@ error: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_4();
}

+ (void)platformVersion
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DA990000, a2, OS_LOG_TYPE_ERROR, "Unrecognized device class: %d", (uint8_t *)v2, 8u);
}

@end
