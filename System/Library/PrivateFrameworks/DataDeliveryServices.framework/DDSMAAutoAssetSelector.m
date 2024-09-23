@implementation DDSMAAutoAssetSelector

- (DDSMAAutoAssetSelector)initWithAssetType:(id)a3 assetSpecifier:(id)a4
{
  id v6;
  id v7;
  DDSMAAutoAssetSelector *v8;
  uint64_t v9;
  MAAutoAssetSelector *assetSelector;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DDSMAAutoAssetSelector;
  v8 = -[DDSMAAutoAssetSelector init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4E078]), "initForAssetType:withAssetSpecifier:", v6, v7);
    assetSelector = v8->_assetSelector;
    v8->_assetSelector = (MAAutoAssetSelector *)v9;

  }
  return v8;
}

+ (id)allSupportedLinguisticAssetTypeForAssetType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.LinguisticDataAuto")))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v9[0] = CFSTR("Priority");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AutoAssetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[DDSMAAutoAssetSelector allSupportedLinguisticAssetTypeForAssetType:].cold.1();

    v6 = (void *)objc_opt_new();
  }

  return v6;
}

+ (id)createWithQuery:(id)a3 supportedAssetSpecifiers:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  const __CFString *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  __CFString *v28;
  void *v29;
  DDSMAAutoAssetSelector *v30;
  unint64_t v31;
  unint64_t v32;
  const __CFString *v33;
  NSObject *v34;
  id v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v41;
  void *v42;
  void *v43;
  id obj;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
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
  uint8_t buf[4];
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "assetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DDSMAAutoAssetSelector allSupportedLinguisticAssetTypeForAssetType:](DDSMAAutoAssetSelector, "allSupportedLinguisticAssetTypeForAssetType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v5;
  objc_msgSend(v5, "filter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allowedValuesForKey:", CFSTR("LinguisticAssetType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v64 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsObject:", v17))
          objc_msgSend(v7, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v12, "count") && !objc_msgSend(v7, "count"))
  {
    AutoAssetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[DDSMAAutoAssetSelector createWithQuery:supportedAssetSpecifiers:].cold.3();
    v39 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    if (!objc_msgSend(v7, "count"))
    {
      AutoAssetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        +[DDSMAAutoAssetSelector createWithQuery:supportedAssetSpecifiers:].cold.2();

      objc_msgSend(v9, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v19);

    }
    v41 = v12;
    v42 = v9;
    v20 = objc_opt_new();
    objc_msgSend(v49, "filter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allowedValuesForKey:", CFSTR("AssetLocale"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v43 = v7;
    obj = v7;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v47)
    {
      v45 = *(_QWORD *)v60;
      v22 = CFSTR("fil");
      v23 = 0x1E0C99000uLL;
      v24 = 0x1E0CB3000uLL;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v60 != v45)
            objc_enumerationMutation(obj);
          v48 = v25;
          v52 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v25);
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v50 = v46;
          v53 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
          if (v53)
          {
            v51 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v53; ++j)
              {
                if (*(_QWORD *)v56 != v51)
                  objc_enumerationMutation(v50);
                objc_msgSend(*(id *)(v23 + 3528), "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "languageCode");
                v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v54 = v27;
                if (-[__CFString isEqualToString:](v28, "isEqualToString:", v22))
                {

                  v28 = CFSTR("tl");
                }
                objc_msgSend(*(id *)(v24 + 2368), "stringWithFormat:", CFSTR("%@_%@"), v52, v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v6, "containsObject:", v29) & 1) != 0)
                {
                  v30 = [DDSMAAutoAssetSelector alloc];
                  objc_msgSend(v49, "assetType");
                  v31 = v24;
                  v32 = v23;
                  v33 = v22;
                  v34 = v20;
                  v35 = v6;
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = -[DDSMAAutoAssetSelector initWithAssetType:assetSpecifier:](v30, "initWithAssetType:assetSpecifier:", v36, v29);

                  v6 = v35;
                  v20 = v34;
                  v22 = v33;
                  v23 = v32;
                  v24 = v31;
                  -[NSObject addObject:](v20, "addObject:", v37);
                }
                else
                {
                  DefaultLog();
                  v37 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v68 = v29;
                    _os_log_impl(&dword_1DA990000, v37, OS_LOG_TYPE_DEFAULT, "Auto asset specifier: %@ is not supported", buf, 0xCu);
                  }
                }

              }
              v53 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
            }
            while (v53);
          }

          v25 = v48 + 1;
        }
        while (v48 + 1 != v47);
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v47);
    }

    AutoAssetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      +[DDSMAAutoAssetSelector createWithQuery:supportedAssetSpecifiers:].cold.1();

    -[NSObject allObjects](v20, "allObjects");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v42;
    v7 = v43;
    v12 = v41;
  }

  return v39;
}

- (id)description
{
  void *v2;
  void *v3;

  -[DDSMAAutoAssetSelector assetSelector](self, "assetSelector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DDSMAAutoAssetSelector assetSelector](self, "assetSelector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[DDSMAAutoAssetSelector assetSelector](self, "assetSelector");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSelector, 0);
}

+ (void)allSupportedLinguisticAssetTypeForAssetType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DA990000, v0, v1, "Supported linguistic asset types are not provided for asset type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)createWithQuery:supportedAssetSpecifiers:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1DA990000, v1, OS_LOG_TYPE_DEBUG, "Created DDSMAAutoAssetSelectors: %@ for query: %@", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

+ (void)createWithQuery:supportedAssetSpecifiers:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DA990000, v0, v1, "LinguisticAssetType is not provided in the query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)createWithQuery:supportedAssetSpecifiers:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DA990000, v0, v1, "LinguisticAssetType is provided in the query does not support auto asset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
