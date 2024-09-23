@implementation CDMUAFAssetsManager

+ (id)getNLAssetFromUAFAssetPostValidation:(id)a3 asset:(id)a4 locale:(id)a5 assetSetName:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  +[CDMUAFAssetsManager getNLAssetFromUAFAsset:withFactor:withAssetSetName:](CDMUAFAssetsManager, "getNLAssetFromUAFAsset:withFactor:withAssetSetName:", a4, v9, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315906;
    v17 = "+[CDMUAFAssetsManager getNLAssetFromUAFAssetPostValidation:asset:locale:assetSetName:]";
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Validating UAF asset: %@ for factorName: %@ and locale: %@", (uint8_t *)&v16, 0x2Au);
  }

  if (+[CDMAssetsUtils isNLAssetValid:forLocale:](CDMAssetsUtils, "isNLAssetValid:forLocale:", v11, v10))
  {
    v13 = v11;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315906;
      v17 = "+[CDMUAFAssetsManager getNLAssetFromUAFAssetPostValidation:asset:locale:assetSetName:]";
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: UAF asset: %@ for factorName: %@ is invalid for locale: %@. Return nil.", (uint8_t *)&v16, 0x2Au);
    }

    v13 = 0;
  }

  return v13;
}

+ (id)getNLAssetFromUAFAsset:(id)a3 withFactor:(id)a4 withAssetSetName:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  const char *v21;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    CDMOSLoggerForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v23 = 136315394;
      v24 = "+[CDMUAFAssetsManager getNLAssetFromUAFAsset:withFactor:withAssetSetName:]";
      v25 = 2112;
      v26 = v8;
      v21 = "%s [WARN]: Can't find valid asset for factorName: %@.";
      goto LABEL_12;
    }
LABEL_13:

    v19 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v7, "location");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_8;
  v11 = (void *)v10;
  objc_msgSend(v7, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (!v14)
  {
LABEL_8:
    CDMOSLoggerForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v23 = 136315394;
      v24 = "+[CDMUAFAssetsManager getNLAssetFromUAFAsset:withFactor:withAssetSetName:]";
      v25 = 2112;
      v26 = v8;
      v21 = "%s [WARN]: Directory value of factor %@ doesn't have path.";
LABEL_12:
      _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v23, 0x16u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  objc_msgSend(v7, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 && objc_msgSend(v17, "count"))
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_256);
  v19 = -[UAFNLAsset initForFactor:withPath:withAssetSetName:withUAFMetadata:]([UAFNLAsset alloc], "initForFactor:withPath:withAssetSetName:withUAFMetadata:", v8, v16, v9, v18);

LABEL_14:
  return v19;
}

+ (id)getUAFClientManagersForLocale:(id)a3 withCDMAssetsInfo:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CDMUAFClientManager *v22;
  void *v23;
  CDMUAFClientManager *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  void *v39;
  id v40;
  NSObject *oslog;
  id obj;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v43 = a4;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v43, "getGraphName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v56 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
    v57 = 2112;
    v58 = v44;
    v59 = 2112;
    v60 = v6;
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Initializing UAFClientManagers with locale: %@ and graph name: %@", buf, 0x20u);

  }
  objc_msgSend(v43, "getGraphName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    CDMOSLoggerForCategory(0);
    oslog = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v56 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
      _os_log_error_impl(&dword_21A2A0000, oslog, OS_LOG_TYPE_ERROR, "%s [ERR]: Graph name is nil", buf, 0xCu);
    }
    v40 = 0;
  }
  else
  {
    +[CDMUAFAssetsManager getNLUAFClientManagers](CDMUAFAssetsManager, "getNLUAFClientManagers");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v9);
    oslog = v9;
    objc_msgSend(v43, "getGraphName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = v11 == 0;

    if ((_DWORD)v9)
    {
      objc_msgSend(v43, "getAllAssetSets");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)getUAFClientManagersForLocale_withCDMAssetsInfo__uafClientManagers;
      getUAFClientManagersForLocale_withCDMAssetsInfo__uafClientManagers = v13;

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      obj = v12;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v50 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", objc_msgSend(v18, "integerValue"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "getCDMAssetsUsagesForCDMAssetSet:", objc_msgSend(v18, "integerValue"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)getUAFClientManagersForLocale_withCDMAssetsInfo__uafClientManagers;
            v22 = [CDMUAFClientManager alloc];
            objc_msgSend(v20, "getUsages");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[CDMUAFClientManager initWithAssetSet:usages:](v22, "initWithAssetSet:usages:", v19, v23);
            objc_msgSend(v21, "addObject:", v24);

          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        }
        while (v15);
      }

      v25 = getUAFClientManagersForLocale_withCDMAssetsInfo__uafClientManagers;
      objc_msgSend(v43, "getGraphName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](oslog, "setObject:forKey:", v25, v26);

    }
    objc_msgSend(v43, "getGraphName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](oslog, "objectForKey:", v27);
    v40 = (id)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v28 = v40;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v46 != v30)
              objc_enumerationMutation(v28);
            v32 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
            CDMOSLoggerForCategory(0);
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v56 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
              v57 = 2112;
              v58 = v44;
              v59 = 2112;
              v60 = v32;
              _os_log_debug_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_DEBUG, "%s Setting locale to %@ for CDMUAFClientManager: %@", buf, 0x20u);
            }

            objc_msgSend(v32, "setLocale:", v44);
            CDMOSLoggerForCategory(0);
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v56 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
              v57 = 2112;
              v58 = v32;
              _os_log_debug_impl(&dword_21A2A0000, v34, OS_LOG_TYPE_DEBUG, "%s Finished changing usage for CDMUAFClientManager: %@", buf, 0x16u);
            }

          }
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v29);
      }

      CDMOSLoggerForCategory(0);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v56 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
        v57 = 2112;
        v58 = v44;
        v59 = 2112;
        v60 = v28;
        _os_log_debug_impl(&dword_21A2A0000, v35, OS_LOG_TYPE_DEBUG, "%s UAFClientManagers generated for locale: %@ :%@", buf, 0x20u);
      }

      v36 = v28;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v43, "getGraphName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v56 = "+[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:]";
        v57 = 2112;
        v58 = v44;
        v59 = 2112;
        v60 = v39;
        _os_log_error_impl(&dword_21A2A0000, v37, OS_LOG_TYPE_ERROR, "%s [ERR]: No UAFClientManagers generated for locale: %@! & graph: %@", buf, 0x20u);

      }
    }

    objc_sync_exit(oslog);
  }

  return v40;
}

+ (id)getNLUAFClientManagers
{
  NSObject *v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "+[CDMUAFAssetsManager getNLUAFClientManagers]";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Fetching NL UAFClientManager dictionary", (uint8_t *)&v5, 0xCu);
  }

  if (getNLUAFClientManagers_once != -1)
    dispatch_once(&getNLUAFClientManagers_once, &__block_literal_global_7643);
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "+[CDMUAFAssetsManager getNLUAFClientManagers]";
    v7 = 2112;
    v8 = getNLUAFClientManagers_nlUAFClientManagers;
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s All UAFClientManagers: %@", (uint8_t *)&v5, 0x16u);
  }

  return (id)getNLUAFClientManagers_nlUAFClientManagers;
}

+ (id)getFactorsForClientManager:(id)a3
{
  return (id)objc_msgSend(a3, "getFactors");
}

- (id)initManager
{
  CDMUAFAssetsManager *v2;
  NSObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *assetSetNameToObserver;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)CDMUAFAssetsManager;
  v2 = -[CDMUAFAssetsManager init](&v7, sel_init);
  if (v2)
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CDMUAFAssetsManager initManager]";
      _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Initialize CDMUAFAssetsManager", buf, 0xCu);
    }

    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetSetNameToObserver = v2->_assetSetNameToObserver;
    v2->_assetSetNameToObserver = v4;

  }
  return v2;
}

- (void)setupForLocale:(id)a3 cdmAssetsInfo:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315138;
    v18 = "-[CDMUAFAssetsManager setupForLocale:cdmAssetsInfo:error:]";
    _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s Setup CDMUAFAssetsManager.", (uint8_t *)&v17, 0xCu);
  }

  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "localeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getGraphName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315650;
    v18 = "-[CDMUAFAssetsManager setupForLocale:cdmAssetsInfo:error:]";
    v19 = 2112;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Setting up assets for locale: %@ and graph: %@.", (uint8_t *)&v17, 0x20u);

  }
  +[CDMLogging CDMLogInitIfNeeded](CDMLogging, "CDMLogInitIfNeeded");
  objc_msgSend(v7, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:](CDMUAFAssetsManager, "getUAFClientManagersForLocale:withCDMAssetsInfo:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[CDMUAFAssetsManager getNLUAFClientManagers](CDMUAFAssetsManager, "getNLUAFClientManagers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  objc_msgSend(v7, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMUAFAssetsManager initUAFClientManagers:locale:error:](CDMUAFAssetsManager, "initUAFClientManagers:locale:error:", v12, v14, a5);

  objc_sync_exit(v13);
}

- (void)registerForFactors:(id)a3 inAssetSetName:(id)a4 withAssetsDelegate:(id)a5 withLocale:(id)a6 withFactorAndFolders:(id)a7 useFileManager:(id)a8 withAssetAvailabilityType:(int64_t)a9
{
  id v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void (**v30)(_QWORD);
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  _QWORD aBlock[4];
  uint64_t (*v40)(uint64_t, uint64_t);
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _BYTE *v46;
  int64_t v47;
  id v48;
  uint8_t v49[4];
  const char *v50;
  __int16 v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  __int16 v53;
  void *v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  CDMOSLoggerForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFacto"
                         "rAndFolders:useFileManager:withAssetAvailabilityType:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v56 = v15;
    LOWORD(v57) = 2112;
    *(_QWORD *)((char *)&v57 + 2) = v18;
    _os_log_debug_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_DEBUG, "%s Register factors: %@ in assetSetName: %@ with assets delegate with factorAndFolders :%@.", buf, 0x2Au);
  }

  +[CDMUAFAssetsManager getNLUAFClientManagers](CDMUAFAssetsManager, "getNLUAFClientManagers");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMAssetsUtils getGraphNameForAssetAvailabilityType:](CDMAssetsUtils, "getGraphNameForAssetAvailabilityType:", a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKey:", v21);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0;
  +[CDMUAFAssetsManager getAssetSetNameToUafClientManager:withError:](CDMUAFAssetsManager, "getAssetSetNameToUafClientManager:withError:", v37, &v48);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v48;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v56 = __Block_byref_object_copy__7509;
  *(_QWORD *)&v57 = __Block_byref_object_dispose__7510;
  objc_msgSend(v22, "objectForKeyedSubscript:", v15);
  *((_QWORD *)&v57 + 1) = objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "assetSet");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v49 = 136315650;
    v50 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:use"
          "FileManager:withAssetAvailabilityType:]";
    v51 = 2112;
    v52 = v15;
    v53 = 2112;
    v54 = v34;
    _os_log_debug_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_DEBUG, "%s Retrieved assetSet outside update block for assetSetName: %@ with assetSet: %@", v49, 0x20u);

  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __149__CDMUAFAssetsManager_registerForFactors_inAssetSetName_withAssetsDelegate_withLocale_withFactorAndFolders_useFileManager_withAssetAvailabilityType___block_invoke;
  aBlock[3] = &unk_24DCACBC0;
  v46 = buf;
  v24 = v15;
  v40 = v24;
  v25 = v14;
  v41 = v25;
  v26 = v17;
  v42 = v26;
  v27 = v16;
  v43 = v27;
  v28 = v18;
  v44 = v28;
  v29 = v19;
  v45 = v29;
  v47 = a9;
  v30 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BEBEE70], "sharedManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "observeAssetSet:queue:handler:", v24, 0, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    CDMOSLoggerForCategory(0);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v49 = 136315394;
      v50 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:u"
            "seFileManager:withAssetAvailabilityType:]";
      v51 = 2112;
      v52 = v24;
      _os_log_debug_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_DEBUG, "%s Observer added for assetSetName: %@", v49, 0x16u);
    }

    -[NSMutableDictionary setObject:forKey:](self->_assetSetNameToObserver, "setObject:forKey:", v32, v24);
  }
  v30[2](v30);

  _Block_object_dispose(buf, 8);
}

- (BOOL)registerForCDMAssetsInfo:(id)a3 withLocale:(id)a4 withAssetsDelegate:(id)a5 useFileManager:(id)a6 withSelfContextId:(id)a7 withSelfMetadata:(id)a8 withDataDispatcherContext:(id)a9 withAssetAvailabilityType:(int64_t)a10 withError:(id *)a11
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
  id v56;
  id v57;
  id v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  CDMAssetsDelegateHandler *v62;
  id v64;
  void *v65;
  id v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  void *v89;
  _QWORD v90[4];
  _QWORD v91[4];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v66 = a4;
  v58 = a5;
  v64 = a6;
  v57 = a7;
  v56 = a8;
  v55 = a9;
  v17 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v16, "getAllAssetSets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v65 = v16;
  objc_msgSend(v16, "getAllAssetSets");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v77 != v23)
          objc_enumerationMutation(v20);
        +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "integerValue"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
    }
    while (v22);
  }

  if (v19 && objc_msgSend(v19, "count"))
  {
    v62 = -[CDMAssetsDelegateHandler initWithAssetsDelegate:forAssetSets:withAssetAvailabilityType:]([CDMAssetsDelegateHandler alloc], "initWithAssetsDelegate:forAssetSets:withAssetAvailabilityType:", v58, v19, a10);
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    objc_msgSend(v16, "getAllAssetSets");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
    if (v61)
    {
      v60 = *(_QWORD *)v73;
      while (2)
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v73 != v60)
            objc_enumerationMutation(obj);
          v67 = v26;
          v27 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v26);
          objc_msgSend(v65, "getCDMAssetsFactorConfigCDMAssetSet:", objc_msgSend(v27, "integerValue"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_alloc(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v28, "getAllFactors");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v29, "initWithCapacity:", objc_msgSend(v30, "count"));

          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          objc_msgSend(v28, "getAllFactors");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v69;
            do
            {
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v69 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
                if (objc_msgSend(v28, "isFactorRequired:", v37))
                {
                  objc_msgSend(v31, "addObject:", v37);
                }
                else
                {
                  CDMOSLoggerForCategory(0);
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315650;
                    v81 = "-[CDMUAFAssetsManager registerForCDMAssetsInfo:withLocale:withAssetsDelegate:useFileManager:wi"
                          "thSelfContextId:withSelfMetadata:withDataDispatcherContext:withAssetAvailabilityType:withError:]";
                    v82 = 2112;
                    v83 = v37;
                    v84 = 2112;
                    v85 = v27;
                    _os_log_debug_impl(&dword_21A2A0000, v38, OS_LOG_TYPE_DEBUG, "%s Factor %@ is not required for assetSet: %@", buf, 0x20u);
                  }

                }
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
            }
            while (v34);
          }

          if (!objc_msgSend(v31, "count"))
          {
            v47 = (void *)MEMORY[0x24BDD1540];
            v90[0] = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required Factor names is empty for assetSetName: %@ for locale: %@"), v27, v66);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v91[0] = v48;
            v90[1] = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required Factor names is empty for assetSetName: %@ for locale: %@"), v27, v66);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = *MEMORY[0x24BDD0FF0];
            v91[1] = v49;
            v91[2] = CFSTR("Required Factor names is empty");
            v90[2] = v50;
            v90[3] = CFSTR("CDMAssetSetupErrorDomain");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v91[3] = v51;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 4);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("CDMUAFRegistrationErrorDomain"), 0, v52);
            *a11 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required Factor names is empty for assetSetName: %@ for locale: %@"), v27, v66);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v56;
            v44 = v57;
            v46 = v55;
            +[CDMSELFLogUtil cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:", v56, v57, 8, 0, v53, v55);

            v43 = 0;
            goto LABEL_35;
          }
          CDMOSLoggerForCategory(0);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v28, "getFactorToFoldersMapping");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316162;
            v81 = "-[CDMUAFAssetsManager registerForCDMAssetsInfo:withLocale:withAssetsDelegate:useFileManager:withSelfCo"
                  "ntextId:withSelfMetadata:withDataDispatcherContext:withAssetAvailabilityType:withError:]";
            v82 = 2112;
            v83 = v31;
            v84 = 2112;
            v85 = v27;
            v86 = 2112;
            v87 = v66;
            v88 = 2112;
            v89 = v42;
            _os_log_debug_impl(&dword_21A2A0000, v39, OS_LOG_TYPE_DEBUG, "%s Register required factors: %@ in assetSetName: %@ with assets delegate for %@ with factorAndFolders %@.", buf, 0x34u);

          }
          +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", objc_msgSend(v27, "integerValue"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "getFactorToFoldersMapping");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:](self, "registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:", v31, v40, v62, v66, v41, v64, a10);

          v26 = v67 + 1;
        }
        while (v67 + 1 != v61);
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
        if (v61)
          continue;
        break;
      }
    }
    v43 = 1;
    v45 = v56;
    v44 = v57;
    v46 = v55;
LABEL_35:

  }
  else
  {
    v45 = v56;
    v44 = v57;
    v46 = v55;
    +[CDMSELFLogUtil cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:", v56, v57, 8, 0, CFSTR("cdmAssetSetStrings is empty."), v55);
    v43 = 0;
  }

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetNameToObserver, 0);
}

void __149__CDMUAFAssetsManager_registerForFactors_inAssetSetName_withAssetsDelegate_withLocale_withFactorAndFolders_useFileManager_withAssetAvailabilityType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _BOOL4 v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  os_signpost_id_t spid;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "assetSetName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "assetSet");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v52 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:use"
          "FileManager:withAssetAvailabilityType:]_block_invoke";
    v53 = 2112;
    v54 = (unint64_t)v44;
    v55 = 2112;
    v56 = (uint64_t)v45;
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s AssetSet being observed for assetSetName %@ is %@", buf, 0x20u);

  }
  v3 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v4 = (id)CDMLogContext;
  v5 = v4;
  v6 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v52 = v7;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CDMUAFAssetsManager", "assetSet refresh %@", buf, 0xCu);
  }
  spid = v3;

  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "assetSetName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "usages");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v52 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:use"
          "FileManager:withAssetAvailabilityType:]_block_invoke";
    v53 = 2112;
    v54 = (unint64_t)v46;
    v55 = 2112;
    v56 = (uint64_t)v47;
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Initing new assetSet for validation with assetSetName %@, usages: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BEBEE70], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "assetSetName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "usages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "retrieveAssetSet:usages:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "assetSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = os_signpost_id_generate((os_log_t)CDMLogContext);
    v16 = (id)CDMLogContext;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CDMUAFAssetsManager", "assets in registerForFactors (current)", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "assetSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "assets");
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (id)CDMLogContext;
    v21 = v20;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v21, OS_SIGNPOST_INTERVAL_END, v15, "CDMUAFAssetsManager", " enableTelemetry=YES ", buf, 2u);
    }

    v13 = (id)v19;
  }
  v22 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  if (v12)
  {
    v23 = os_signpost_id_generate((os_log_t)CDMLogContext);
    v24 = (id)CDMLogContext;
    v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "CDMUAFAssetsManager", "assets in registerForFactors (refreshed)", buf, 2u);
    }

    objc_msgSend(v12, "assets");
    v26 = objc_claimAutoreleasedReturnValue();

    v27 = (id)CDMLogContext;
    v28 = v27;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v28, OS_SIGNPOST_INTERVAL_END, v23, "CDMUAFAssetsManager", " enableTelemetry=YES ", buf, 2u);
    }

    v22 = (id)v26;
  }
  v29 = *(_QWORD *)(a1 + 40);
  v30 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "assetSetName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = +[CDMUAFAssetsManager validateFactors:inAssetSet:forLocale:withAssetSetName:](CDMUAFAssetsManager, "validateFactors:inAssetSet:forLocale:withAssetSetName:", v29, v12, v30, v31);

  CDMOSLoggerForCategory(0);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v52 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:use"
          "FileManager:withAssetAvailabilityType:]_block_invoke";
    v53 = 2048;
    v54 = v32;
    v55 = 2048;
    v56 = 1;
    _os_log_debug_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_DEBUG, "%s newAssetSetValid: %ld; forceUpdateAssetSetInCache %ld",
      buf,
      0x20u);
  }

  CDMOSLoggerForCategory(0);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "assetSetName");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v52 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:use"
          "FileManager:withAssetAvailabilityType:]_block_invoke";
    v53 = 2112;
    v54 = (unint64_t)v48;
    v55 = 2112;
    v56 = (uint64_t)v13;
    v57 = 2112;
    v58 = v22;
    _os_log_debug_impl(&dword_21A2A0000, v34, OS_LOG_TYPE_DEBUG, "%s Refreshed assetSet for %@ is valid OR the platform is IOS or OSX. Replacing cached assetSet %@ with %@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setAssetSet:", v12);
  v35 = v22;

  v36 = (id)CDMLogContext;
  v37 = v36;
  if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v37, OS_SIGNPOST_INTERVAL_END, spid, "CDMUAFAssetsManager", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "assetSet");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38 && (v39 = (void *)v38, v40 = objc_msgSend(v35, "count"), v39, v40))
  {
    v41 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "assetSet");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMUAFAssetsManager setAssetsAvailabilityForFactors:withAssetSet:forAssetSetName:withDelegateHandler:withLocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:](CDMUAFAssetsManager, "setAssetsAvailabilityForFactors:withAssetSet:forAssetSetName:withDelegateHandler:withLocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:", v41, v42, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88));

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      v49 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v52 = "-[CDMUAFAssetsManager registerForFactors:inAssetSetName:withAssetsDelegate:withLocale:withFactorAndFolders:u"
            "seFileManager:withAssetAvailabilityType:]_block_invoke";
      v53 = 2112;
      v54 = v49;
      _os_log_debug_impl(&dword_21A2A0000, v43, OS_LOG_TYPE_DEBUG, "%s AssetSet being observed for assetSetName %@ is empty!", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "assetsUnavailableForAssetSet:", *(_QWORD *)(a1 + 32));
  }

}

+ (void)reInitCDMUAFAssetsCache
{
  NSObject *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "+[CDMUAFAssetsManager reInitCDMUAFAssetsCache]";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Re Initializing CDMUAFClientManager's cache", buf, 0xCu);
  }

  +[CDMUAFAssetsManager getNLUAFClientManagers](CDMUAFAssetsManager, "getNLUAFClientManagers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "initUAFAssetSet");
            }
            while (v10 != v12);
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  objc_sync_exit(v4);
}

+ (void)initUAFClientManagers:(id)a3 locale:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id *v48;
  id v49;
  NSObject *obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  _QWORD v56[4];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  _QWORD v66[4];
  _QWORD v67[7];

  v67[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v7;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    if (v9)
    {
      v10 = v9;
      v48 = a5;
      v49 = v7;
      v11 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v52 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v13, "shouldInitUAFAssetSetInSetupForLocale:", v8))
          {
            CDMOSLoggerForCategory(0);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v58 = "+[CDMUAFAssetsManager initUAFClientManagers:locale:error:]";
              v59 = 2112;
              v60 = v13;
              _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s Initialize UAFAssetSet for cdmClientManager: %@", buf, 0x16u);
            }

            v15 = os_signpost_id_generate((os_log_t)CDMLogContext);
            v16 = (id)CDMLogContext;
            v17 = v16;
            if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
            {
              objc_msgSend(v13, "assetSetName");
              v18 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v58 = v18;
              _os_signpost_emit_with_name_impl(&dword_21A2A0000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CDMUAFAssetsManager", "initUAFAssetSet %@", buf, 0xCu);

            }
            objc_msgSend(v13, "initUAFAssetSet");
            v19 = (id)CDMLogContext;
            v20 = v19;
            if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_21A2A0000, v20, OS_SIGNPOST_INTERVAL_END, v15, "CDMUAFAssetsManager", " enableTelemetry=YES ", buf, 2u);
            }

          }
          CDMOSLoggerForCategory(0);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "assetSetName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "assetSet");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "usages");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v58 = "+[CDMUAFAssetsManager initUAFClientManagers:locale:error:]";
            v59 = 2112;
            v60 = v30;
            v61 = 2112;
            v62 = v31;
            v63 = 2112;
            v64 = v32;
            _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s uafClientManager.assetSetName %@ has assetSet %@ has usages %@", buf, 0x2Au);

          }
          objc_msgSend(v13, "getAssetSet");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_alloc_init(MEMORY[0x24BDBCE70]);
          if (!v22)
          {
            v33 = (void *)MEMORY[0x24BDD1540];
            v55[0] = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No assets found for UAFClientManagers: %@."), v13);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v56[0] = v34;
            v55[1] = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No assets found for UAFClientManagers: %@."), v13);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = *MEMORY[0x24BDD0FF0];
            v56[1] = v35;
            v56[2] = CFSTR("Check assetSet name / presence of assets configured under the assetSet.");
            v55[2] = v36;
            v55[3] = CFSTR("CDMAssetSetupErrorDomain");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v56[3] = v37;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("CDMUAFAssetsNotFoundErrorDomain"), 0, v38);
            *v48 = (id)objc_claimAutoreleasedReturnValue();

            CDMOSLoggerForCategory(0);
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v46 = *v48;
              *(_DWORD *)buf = 136315394;
              v58 = "+[CDMUAFAssetsManager initUAFClientManagers:locale:error:]";
              v59 = 2112;
              v60 = v46;
              _os_log_error_impl(&dword_21A2A0000, v39, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@.", buf, 0x16u);
            }

            +[CDMUAFAssetsManager reInitCDMUAFAssetsCache](CDMUAFAssetsManager, "reInitCDMUAFAssetsCache");
            goto LABEL_32;
          }
          v24 = os_signpost_id_generate((os_log_t)CDMLogContext);
          v25 = (id)CDMLogContext;
          v26 = v25;
          if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21A2A0000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "CDMUAFAssetsManager", "getAssets in initUAFClientManagers", buf, 2u);
          }

          objc_msgSend(v22, "assets");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = (id)CDMLogContext;
          v29 = v28;
          if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21A2A0000, v29, OS_SIGNPOST_INTERVAL_END, v24, "CDMUAFAssetsManager", " enableTelemetry=YES ", buf, 2u);
          }

        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
        if (v10)
          continue;
        break;
      }
LABEL_32:
      v7 = v49;
    }
  }
  else
  {
    v40 = (void *)MEMORY[0x24BDD1540];
    v66[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No UAFClientManagers found for locale: %@"), v8);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v41;
    v66[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No UAFClientManagers found for locale: %@"), v8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = *MEMORY[0x24BDD0FF0];
    v67[1] = v42;
    v67[2] = CFSTR("Check locale / graphName provided.");
    v66[2] = v43;
    v66[3] = CFSTR("CDMAssetSetupErrorDomain");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v67[3] = v44;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("CDMUAFAssetsManager"), 2, v45);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      v47 = *a5;
      *(_DWORD *)buf = 136315394;
      v58 = "+[CDMUAFAssetsManager initUAFClientManagers:locale:error:]";
      v59 = 2112;
      v60 = v47;
      _os_log_error_impl(&dword_21A2A0000, obj, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@.", buf, 0x16u);
    }
  }

}

+ (id)getAssetSetNameToUafClientManager:(id)a3 withError:(id *)a4
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  _QWORD v34[4];
  _QWORD v35[4];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "assetSetName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v17 = (void *)MEMORY[0x24BDD1540];
          v34[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Duplicate AssetSet name encountered in UAFClientManagers: %@."), v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = v18;
          v34[1] = *MEMORY[0x24BDD0FD8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Duplicate AssetSet name encountered in UAFClientManagers: %@."), v7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *MEMORY[0x24BDD0FF0];
          v35[1] = v19;
          v35[2] = CFSTR("Check for presence of duplicate AssetSet names across UAFClientManagers");
          v34[2] = v20;
          v34[3] = CFSTR("CDMAssetSetupErrorDomain");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v35[3] = v21;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("CDMUAFAssetsManager"), 1, v22);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          CDMOSLoggerForCategory(0);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v25 = *a4;
            *(_DWORD *)buf = 136315394;
            v31 = "+[CDMUAFAssetsManager getAssetSetNameToUafClientManager:withError:]";
            v32 = 2112;
            v33 = v25;
            _os_log_error_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@.", buf, 0x16u);
          }

          v16 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v12, "assetSetName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v12, v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = v6;
LABEL_13:

  return v16;
}

+ (id)getAssetSetNameToFactors:(id)a3 withError:(id *)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  _QWORD v41[4];
  _QWORD v42[4];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v30 = v4;
  objc_msgSend(v4, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        +[CDMUAFAssetsManager getFactorsForClientManager:](CDMUAFAssetsManager, "getFactorsForClientManager:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v20 = (void *)MEMORY[0x24BDD1540];
          v41[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No factors found for UAFClientManager: %@."), v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = v21;
          v41[1] = *MEMORY[0x24BDD0FD8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No factors found for UAFClientManager: %@."), v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = *MEMORY[0x24BDD0FF0];
          v42[1] = v22;
          v42[2] = CFSTR("Check for UAF Config files for no factors in asset set name");
          v41[2] = v23;
          v41[3] = CFSTR("CDMAssetSetupErrorDomain");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v42[3] = v24;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("CDMUAFAssetsManager"), 3, v25);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          CDMOSLoggerForCategory(0);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v28 = *a4;
            *(_DWORD *)buf = 136315394;
            v36 = "+[CDMUAFAssetsManager getAssetSetNameToFactors:withError:]";
            v37 = 2112;
            v38 = v28;
            _os_log_error_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@.", buf, 0x16u);
          }

          v19 = 0;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        CDMOSLoggerForCategory(0);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v13, "assetSetName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v36 = "+[CDMUAFAssetsManager getAssetSetNameToFactors:withError:]";
          v37 = 2112;
          v38 = v18;
          v39 = 2112;
          v40 = v15;
          _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Writing to assetSetNameToFactors: key = %@ and value = %@.", buf, 0x20u);

        }
        objc_msgSend(v13, "assetSetName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v15, v17);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      if (v10)
        continue;
      break;
    }
  }

  v19 = v7;
LABEL_15:

  return v19;
}

+ (id)getFactorToAssetSetName:(id)a3 uafClientManagers:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v33;
  uint64_t v34;
  id *v35;
  id v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  id v50;
  _QWORD v51[4];
  _QWORD v52[4];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v10 = v7;
  v37 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v37)
  {
    v11 = *(_QWORD *)v44;
    v35 = a5;
    v36 = v8;
    v34 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(v10);
        v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v40;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v40 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
              objc_msgSend(v9, "objectForKey:", v20);
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = (void *)v21;
              if (v21)
                v23 = v21 == v13;
              else
                v23 = 1;
              if (!v23)
              {
                v38 = (void *)MEMORY[0x24BDD1540];
                v51[0] = *MEMORY[0x24BDD0FC8];
                v8 = v36;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Duplicate factor name encountered %@ under assetSet: %@ in UAFClientManagers: %@."), v20, v13, v36);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v52[0] = v25;
                v51[1] = *MEMORY[0x24BDD0FD8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Duplicate factor name encountered %@ under assetSet: %@ in UAFClientManagers: %@."), v20, v13, v36);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = *MEMORY[0x24BDD0FF0];
                v52[1] = v26;
                v52[2] = CFSTR("Check for presence of duplicate factor names across UAFClientManagers");
                v51[2] = v27;
                v51[3] = CFSTR("CDMAssetSetupErrorDomain");
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v52[3] = v28;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 4);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("CDMUAFDuplicateFactorErrorDomain"), 0, v29);
                *v35 = (id)objc_claimAutoreleasedReturnValue();

                CDMOSLoggerForCategory(0);
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  v33 = *v35;
                  *(_DWORD *)buf = 136315394;
                  v48 = "+[CDMUAFAssetsManager getFactorToAssetSetName:uafClientManagers:withError:]";
                  v49 = 2112;
                  v50 = v33;
                  _os_log_error_impl(&dword_21A2A0000, v30, OS_LOG_TYPE_ERROR, "%s [ERR]: Error: %@.", buf, 0x16u);
                }

                v24 = 0;
                goto LABEL_24;
              }
              objc_msgSend(v9, "setObject:forKey:", v13, v20);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
            if (v17)
              continue;
            break;
          }
        }

        v11 = v34;
      }
      v8 = v36;
      v37 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v37);
  }

  v24 = v9;
LABEL_24:

  return v24;
}

+ (id)filterFactors:(id)a3 forAssetSetNameToFactors:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMAssetsUtils filterFactors:forAssetSets:withAssetSetNameToFactors:](CDMAssetsUtils, "filterFactors:forAssetSets:withAssetSetNameToFactors:", v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)getUAFAssetsForFactors:(id)a3 withCDMAssetsInfo:(id)a4 locale:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *log;
  uint64_t v36;
  void *v37;
  id v38;
  NSObject *oslog;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  id v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v28 = a4;
  v40 = a5;
  +[CDMUAFAssetsManager getNLUAFClientManagers](CDMUAFAssetsManager, "getNLUAFClientManagers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "getGraphName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKey:", v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0;
  +[CDMUAFAssetsManager getAssetSetNameToUafClientManager:withError:](CDMUAFAssetsManager, "getAssetSetNameToUafClientManager:withError:", v31, &v51);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v51;
  v50 = v8;
  +[CDMUAFAssetsManager getAssetSetNameToFactors:withError:](CDMUAFAssetsManager, "getAssetSetNameToFactors:withError:", v34, &v50);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v50;

  if (v30)
  {
    CDMOSLoggerForCategory(0);
    oslog = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "+[CDMUAFAssetsManager getUAFAssetsForFactors:withCDMAssetsInfo:locale:]";
      v55 = 2112;
      v56 = v30;
      _os_log_error_impl(&dword_21A2A0000, oslog, OS_LOG_TYPE_ERROR, "%s [ERR]: Error generating assetSetNameToFactors: %@.", buf, 0x16u);
    }
    v38 = 0;
  }
  else
  {
    v49 = 0;
    +[CDMUAFAssetsManager getFactorToAssetSetName:uafClientManagers:withError:](CDMUAFAssetsManager, "getFactorToAssetSetName:uafClientManagers:withError:", v27, v31, &v49);
    oslog = objc_claimAutoreleasedReturnValue();
    v30 = v49;
    if (v30)
    {
      CDMOSLoggerForCategory(0);
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "+[CDMUAFAssetsManager getUAFAssetsForFactors:withCDMAssetsInfo:locale:]";
        v55 = 2112;
        v56 = v30;
        _os_log_error_impl(&dword_21A2A0000, log, OS_LOG_TYPE_ERROR, "%s [ERR]: Error generating factorToAssetSetName: %@.", buf, 0x16u);
      }
      v38 = 0;
    }
    else
    {
      +[CDMUAFAssetsManager filterFactors:forAssetSetNameToFactors:](CDMUAFAssetsManager, "filterFactors:forAssetSetNameToFactors:", v26, v27);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v26, "count"));
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      log = v9;
      v33 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
      if (v33)
      {
        v32 = *(_QWORD *)v46;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v46 != v32)
            {
              v11 = v10;
              objc_enumerationMutation(log);
              v10 = v11;
            }
            v36 = v10;
            v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v10);
            objc_msgSend(v34, "objectForKeyedSubscript:", v12, v26);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              -[NSObject objectForKey:](log, "objectForKey:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v37;
              objc_sync_enter(v14);
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v15 = v13;
              v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
              if (v16)
              {
                v17 = *(_QWORD *)v42;
                do
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v42 != v17)
                      objc_enumerationMutation(v15);
                    v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
                    objc_msgSend(v14, "assetSet");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "assetNamed:", v19);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();

                    -[NSObject objectForKey:](oslog, "objectForKey:", v19);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    +[CDMUAFAssetsManager getNLAssetFromUAFAssetPostValidation:asset:locale:assetSetName:](CDMUAFAssetsManager, "getNLAssetFromUAFAssetPostValidation:asset:locale:assetSetName:", v19, v21, v40, v22);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v23)
                    {
                      objc_msgSend(v38, "setObject:forKey:", v23, v19);
                    }
                    else
                    {
                      CDMOSLoggerForCategory(0);
                      v24 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315650;
                        v54 = "+[CDMUAFAssetsManager getUAFAssetsForFactors:withCDMAssetsInfo:locale:]";
                        v55 = 2112;
                        v56 = v19;
                        v57 = 2112;
                        v58 = v40;
                        _os_log_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_INFO, "%s [WARN]: UAF asset for factorName: %@ is nil for locale: %@.", buf, 0x20u);
                      }

                    }
                  }
                  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
                }
                while (v16);
              }

              objc_sync_exit(v14);
            }
            else
            {
              CDMOSLoggerForCategory(0);
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v54 = "+[CDMUAFAssetsManager getUAFAssetsForFactors:withCDMAssetsInfo:locale:]";
                v55 = 2112;
                v56 = v12;
                v57 = 2112;
                v58 = v31;
                _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Can't find CDMUAFClientManager for assetSet: %@. Please make sure the input assetSet exists in: %@.", buf, 0x20u);
              }
            }

            v10 = v36 + 1;
          }
          while (v36 + 1 != v33);
          v33 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
        }
        while (v33);
      }

    }
  }

  return v38;
}

+ (void)setAssetsAvailabilityForFactors:(id)a3 withAssetSet:(id)a4 forAssetSetName:(id)a5 withDelegateHandler:(id)a6 withLocale:(id)a7 withFactorAndFolders:(id)a8 useFileManager:(id)a9 withAssetAvailabilityType:(int64_t)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  NSObject *v34;
  __int128 v35;
  id v36;
  id obj;
  void *v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v41 = a4;
  v16 = a5;
  v36 = a6;
  v17 = a7;
  v40 = a8;
  v39 = a9;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v43;
    *(_QWORD *)&v20 = 136315394;
    v35 = v20;
    obj = v18;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v41, "assetNamed:", v24, v35);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v16;
        +[CDMUAFAssetsManager getNLAssetFromUAFAssetPostValidation:asset:locale:assetSetName:](CDMUAFAssetsManager, "getNLAssetFromUAFAssetPostValidation:asset:locale:assetSetName:", v24, v25, v17, v16);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKey:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = +[CDMAssetsUtils isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:](CDMAssetsUtils, "isNLAssetValid:forLocale:withFolders:useFileManager:withAssetAvailabilityType:", v27, v17, v28, v39, a10);

        if (!v29)
        {
          CDMOSLoggerForCategory(0);
          v34 = objc_claimAutoreleasedReturnValue();
          v16 = v26;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v47 = "+[CDMUAFAssetsManager setAssetsAvailabilityForFactors:withAssetSet:forAssetSetName:withDelegateHandler"
                  ":withLocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:]";
            v48 = 2112;
            v49 = v27;
            v50 = 2112;
            v51 = v17;
            v52 = 2112;
            v53 = v26;
            _os_log_error_impl(&dword_21A2A0000, v34, OS_LOG_TYPE_ERROR, "%s [ERR]: UAF asset: [%@] is invalid for locale: %@. Call assets delegate handler's assetsUnavailable for assetSetName: %@.", buf, 0x2Au);
          }

          v33 = v36;
          objc_msgSend(v36, "assetsUnavailableForAssetSet:", v26);

          v18 = obj;
          goto LABEL_18;
        }
        objc_msgSend(v38, "addObject:", v27);
        CDMOSLoggerForCategory(0);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v35;
          v47 = "+[CDMUAFAssetsManager setAssetsAvailabilityForFactors:withAssetSet:forAssetSetName:withDelegateHandler:w"
                "ithLocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:]";
          v48 = 2112;
          v49 = v27;
          _os_log_debug_impl(&dword_21A2A0000, v30, OS_LOG_TYPE_DEBUG, "%s UAF asset: [%@] has a valid asset path.", buf, 0x16u);
        }

        v16 = v26;
      }
      v18 = obj;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
      if (v21)
        continue;
      break;
    }
  }

  CDMOSLoggerForCategory(0);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
  if (v17)
  {
    v33 = v36;
    if (v32)
    {
      *(_DWORD *)buf = 136316162;
      v47 = "+[CDMUAFAssetsManager setAssetsAvailabilityForFactors:withAssetSet:forAssetSetName:withDelegateHandler:withL"
            "ocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:]";
      v48 = 2112;
      v49 = v18;
      v50 = 2112;
      v51 = v16;
      v52 = 2112;
      v53 = v38;
      v54 = 2112;
      v55 = v16;
      _os_log_debug_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_DEBUG, "%s All factors: %@ in assetSetName: %@ found with valid UAF assets: %@. Call assets delegate handler's assetsAvailable for assetSetName: %@.", buf, 0x34u);
    }

    objc_msgSend(v36, "assetsAvailableForAssetSet:forLocale:", v16, v17);
  }
  else
  {
    v33 = v36;
    if (v32)
    {
      *(_DWORD *)buf = 136315394;
      v47 = "+[CDMUAFAssetsManager setAssetsAvailabilityForFactors:withAssetSet:forAssetSetName:withDelegateHandler:withL"
            "ocale:withFactorAndFolders:useFileManager:withAssetAvailabilityType:]";
      v48 = 2112;
      v49 = v16;
      _os_log_debug_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_DEBUG, "%s Asset available locale is nil. Call assets delegate handler's assetsUnavailable for assetSetName: %@.", buf, 0x16u);
    }

    objc_msgSend(v36, "assetsUnavailableForAssetSet:", v16);
  }
LABEL_18:

}

+ (BOOL)validateFactors:(id)a3 inAssetSet:(id)a4 forLocale:(id)a5 withAssetSetName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  BOOL v23;
  __int128 v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v28;
    *(_QWORD *)&v14 = 136315650;
    v25 = v14;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "assetNamed:", v18, v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[CDMUAFAssetsManager getNLAssetFromUAFAssetPostValidation:asset:locale:assetSetName:](CDMUAFAssetsManager, "getNLAssetFromUAFAssetPostValidation:asset:locale:assetSetName:", v18, v19, v11, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        CDMOSLoggerForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (!v20)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v25;
            v32 = "+[CDMUAFAssetsManager validateFactors:inAssetSet:forLocale:withAssetSetName:]";
            v33 = 2112;
            v34 = v18;
            v35 = 2112;
            v36 = v11;
            _os_log_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_INFO, "%s [WARN]: UAF asset for factorName: %@ is nil for locale: %@.", buf, 0x20u);
          }

          v23 = 0;
          goto LABEL_15;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v25;
          v32 = "+[CDMUAFAssetsManager validateFactors:inAssetSet:forLocale:withAssetSetName:]";
          v33 = 2112;
          v34 = v19;
          v35 = 2112;
          v36 = v18;
          _os_log_debug_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_DEBUG, "%s UAF asset is: [%@] for factorName: %@.", buf, 0x20u);
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v15)
        continue;
      break;
    }
  }
  v23 = 1;
LABEL_15:

  return v23;
}

+ (void)subscribeToSsuAssetsForLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("inference.%@"), v3);
  +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  +[CDMAssetsUtils getSsuUsages:](CDMAssetsUtils, "getSsuUsages:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getUsages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 2592000.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBEE80]), "initWithName:assetSets:usageAliases:expires:", v4, v8, 0, v9);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BEBEE70], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __53__CDMUAFAssetsManager_subscribeToSsuAssetsForLocale___block_invoke;
    v14[3] = &unk_24DCACBE8;
    v15 = v3;
    objc_msgSend(v11, "subscribe:subscriptions:queue:completion:", CFSTR("com.apple.siri.ssu"), v12, 0, v14);

    v13 = v15;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[CDMUAFAssetsManager subscribeToSsuAssetsForLocale:]";
      v19 = 2112;
      v20 = v3;
      _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: Unable to initialize UAFAssetSetSubscription subscription; aborting SSU asset subscription for locale %@",
        buf,
        0x16u);
    }
  }

}

+ (void)subscribeToAssetsForAssetSet:(int64_t)a3 withCDMAssetsUsages:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "getUsages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMAssetsUsages cdmAssetsUsageKeyToString:](CDMAssetsUsages, "cdmAssetsUsageKeyToString:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("inference.%@"), v8);
  +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  objc_msgSend(v5, "getUsages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 2592000.0);
}

void __53__CDMUAFAssetsManager_subscribeToSsuAssetsForLocale___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315650;
      v7 = "+[CDMUAFAssetsManager subscribeToSsuAssetsForLocale:]_block_invoke";
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_error_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: Creating subscription to SSU inference assets for locale %@ failed: %@", (uint8_t *)&v6, 0x20u);
    }

  }
}

void __45__CDMUAFAssetsManager_getNLUAFClientManagers__block_invoke()
{
  NSObject *v0;
  id v1;
  void *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315138;
    v4 = "+[CDMUAFAssetsManager getNLUAFClientManagers]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v0, OS_LOG_TYPE_DEBUG, "%s Initializing NL UAFClientManager singleton dictionary", (uint8_t *)&v3, 0xCu);
  }

  v1 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v2 = (void *)getNLUAFClientManagers_nlUAFClientManagers;
  getNLUAFClientManagers_nlUAFClientManagers = (uint64_t)v1;

}

@end
