@implementation CDMAssetsManager

- (id)processNLAsset:(id)a3 withAssetFolders:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NilAsset *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NilAsset *v16;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_16;
  objc_msgSend(v6, "getAssetPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "getAssetPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMAssetsUtils findExistFolderInAssetFolders:underBasePath:useFileManager:](CDMAssetsUtils, "findExistFolderInAssetFolders:underBasePath:useFileManager:", v7, v9, self->_fileManager);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "appendPathWithServiceAssetFolder:", v10);
LABEL_5:

      goto LABEL_6;
    }
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "getAssetPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315650;
      v19 = "-[CDMAssetsManager processNLAsset:withAssetFolders:]";
      v20 = 2112;
      v21 = 0;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: No valid asset folders exist for asset folder: %@ under asset path: %@.", (uint8_t *)&v18, 0x20u);

    }
    if (!v7 || !objc_msgSend(v7, "count"))
      goto LABEL_5;
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "-[CDMAssetsManager processNLAsset:withAssetFolders:]";
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Asset folders were provided but not found.Return Nil asset", (uint8_t *)&v18, 0xCu);
    }

LABEL_16:
    v12 = objc_alloc_init(NilAsset);
    goto LABEL_17;
  }
LABEL_6:
  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v18 = 136315394;
    v19 = "-[CDMAssetsManager processNLAsset:withAssetFolders:]";
    v20 = 2112;
    v21 = v6;
    _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s NL asset: %@ ", (uint8_t *)&v18, 0x16u);
  }

  v12 = (NilAsset *)v6;
LABEL_17:
  v16 = v12;

  return v16;
}

- (BOOL)isAssetAvailableForCDMAssetsFactorConfig:(id)a3 factorToAsset:(id)a4 withError:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "getFactorToFoldersMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[CDMAssetsManager isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:]";
    v42 = 2112;
    v43 = v9;
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Factors are: %@", buf, 0x16u);
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v16);
        if ((objc_msgSend(v6, "isFactorRequired:", v17) & 1) == 0)
        {
          CDMOSLoggerForCategory(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v41 = "-[CDMAssetsManager isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:]";
            v42 = 2112;
            v43 = v17;
            _os_log_debug_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_DEBUG, "%s Skip current factor as it is not required: %@.", buf, 0x16u);
          }
          goto LABEL_14;
        }
        objc_msgSend(v7, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "getAssetType");

        if (v19)
        {
          CDMOSLoggerForCategory(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v7, "objectForKey:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v41 = "-[CDMAssetsManager isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:]";
            v42 = 2112;
            v43 = v21;
            v44 = 2112;
            v45 = v17;
            _os_log_debug_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_DEBUG, "%s Asset: %@ is available for factor: %@.", buf, 0x20u);

          }
LABEL_14:

          goto LABEL_15;
        }
        objc_msgSend(v11, "addObject:", v17);
LABEL_15:
        ++v16;
      }
      while (v14 != v16);
      v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      v14 = v22;
    }
    while (v22);
  }

  v23 = objc_msgSend(v11, "count");
  if (v23)
  {
    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FD8];
    v38[0] = *MEMORY[0x24BDD0FC8];
    v38[1] = v25;
    v39[0] = CFSTR("Assets are missing");
    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Assets are missing for factors: [%@]."), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("CDMAssetsManager"), 0, v29);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = *a5;
      *(_DWORD *)buf = 136315394;
      v41 = "-[CDMAssetsManager isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:]";
      v42 = 2112;
      v43 = v31;
      _os_log_error_impl(&dword_21A2A0000, v30, OS_LOG_TYPE_ERROR, "%s [ERR]: Not all assets are available with error: %@. Return NO.", buf, 0x16u);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[CDMAssetsManager isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:]";
      _os_log_debug_impl(&dword_21A2A0000, v30, OS_LOG_TYPE_DEBUG, "%s All assets are available. Return YES.", buf, 0xCu);
    }
  }

  return v23 == 0;
}

- (BOOL)areAssetsAvailableForCDMAssetsInfo:(id)a3 factorToAsset:(id)a4 withError:(id *)a5 withSelfMetadata:(id)a6 withSelfContextId:(id)a7 withDataDispatcherContext:(id)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  BOOL v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint8_t v64[128];
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v52 = a4;
  v50 = a6;
  v49 = a7;
  v48 = a8;
  v14 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v13, "getAllAssetSets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v16 = v13;
  objc_msgSend(v13, "getAllAssetSets");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v59 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v16, "getCDMAssetsFactorConfigCDMAssetSet:", objc_msgSend(v22, "integerValue"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        v24 = -[CDMAssetsManager isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:](self, "isAssetAvailableForCDMAssetsFactorConfig:factorToAsset:withError:", v23, v52, &v57);
        v25 = v57;

        if (!v24)
          objc_msgSend(v51, "setObject:forKey:", v25, v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    }
    while (v19);
  }

  v26 = v51;
  v27 = objc_msgSend(v51, "count");
  if (v27)
  {
    objc_msgSend(v51, "allKeys");
    v28 = objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      -[NSObject componentsJoinedByString:](v28, "componentsJoinedByString:", CFSTR(","));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v66 = "-[CDMAssetsManager areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:withSelfMetadata:withSelfConte"
            "xtId:withDataDispatcherContext:]";
      v67 = 2112;
      v68 = v46;
      _os_log_error_impl(&dword_21A2A0000, v29, OS_LOG_TYPE_ERROR, "%s [ERR]: Assets for assetSets: [%@] are not available. Return NO.", buf, 0x16u);

    }
    v30 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v51, "allValues");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v54 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "localizedFailureReason");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "appendString:", v36);

          objc_msgSend(v30, "appendString:", CFSTR("\n"));
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      }
      while (v33);
    }

    v37 = (void *)MEMORY[0x24BDD1540];
    v62[0] = *MEMORY[0x24BDD0FC8];
    v38 = (void *)MEMORY[0x24BDD17C8];
    -[NSObject componentsJoinedByString:](v28, "componentsJoinedByString:", CFSTR(","));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("Assets are missing for services: [%@]."), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = *MEMORY[0x24BDD0FD8];
    v63[0] = v40;
    v63[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("CDMAssetsManager"), 0, v41);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v43 = v49;
    v42 = v50;
    v44 = v48;
    +[CDMSELFLogUtil cdmSetupMissingAssetsDetected:contextId:serviceNames:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmSetupMissingAssetsDetected:contextId:serviceNames:logMessage:dataDispatcherContext:", v50, v49, 0, CFSTR("SELF setup missing assets detected message emitted"), v48);

    v26 = v51;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v66 = "-[CDMAssetsManager areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:withSelfMetadata:withSelfConte"
            "xtId:withDataDispatcherContext:]";
      _os_log_debug_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_DEBUG, "%s All required assets are available. Return YES.", buf, 0xCu);
    }
    v43 = v49;
    v42 = v50;
    v44 = v48;
  }

  return v27 == 0;
}

- (id)initManager
{
  CDMAssetsManager *v2;
  NSObject *v3;
  CDMDefaultAssetsManager *v4;
  CDMDefaultAssetsManager *cdmDefaultAssetsManager;
  CDMUAFAssetsManager *v6;
  CDMUAFAssetsManager *cdmUAFAssetsManager;
  NSFileManager *v8;
  NSFileManager *fileManager;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)CDMAssetsManager;
  v2 = -[CDMAssetsManager init](&v11, sel_init);
  if (v2)
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CDMAssetsManager initManager]";
      _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s Initialize CDMAssetsManager", buf, 0xCu);
    }

    v4 = -[CDMDefaultAssetsManager initManager]([CDMDefaultAssetsManager alloc], "initManager");
    cdmDefaultAssetsManager = v2->_cdmDefaultAssetsManager;
    v2->_cdmDefaultAssetsManager = v4;

    v6 = -[CDMUAFAssetsManager initManager]([CDMUAFAssetsManager alloc], "initManager");
    cdmUAFAssetsManager = v2->_cdmUAFAssetsManager;
    v2->_cdmUAFAssetsManager = v6;

    v8 = (NSFileManager *)objc_alloc_init(MEMORY[0x24BDD1580]);
    fileManager = v2->_fileManager;
    v2->_fileManager = v8;

  }
  return v2;
}

- (id)getCDMDefaultAssetsManager
{
  return self->_cdmDefaultAssetsManager;
}

- (id)getCDMUAFAssetsManager
{
  return self->_cdmUAFAssetsManager;
}

- (id)getNSFileManager
{
  return self->_fileManager;
}

- (void)setupForLocale:(id)a3 cdmAssetsInfo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "localeIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getGraphName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 136315650;
    v25 = "-[CDMAssetsManager setupForLocale:cdmAssetsInfo:error:]";
    v26 = 2112;
    v27 = v22;
    v28 = 2112;
    v29 = v23;
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Setup CDMAssetsManager for locale: %@ and graph: %@", (uint8_t *)&v24, 0x20u);

  }
  v11 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v12 = (id)CDMLogContext;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CDMAssetsManager", "CDMAssetsManager setup", (uint8_t *)&v24, 2u);
  }

  CDMOSLoggerForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v24 = 136315138;
    v25 = "-[CDMAssetsManager setupForLocale:cdmAssetsInfo:error:]";
    _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s Starting setup of CDMUAFAssetsManager.", (uint8_t *)&v24, 0xCu);
  }

  v15 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v16 = (id)CDMLogContext;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CDMAssetsManager", "UAFAssetsManager setup", (uint8_t *)&v24, 2u);
  }

  -[CDMAssetsManager _setupUafAssetManagerForLocale:cdmAssetsInfo:error:](self, "_setupUafAssetManagerForLocale:cdmAssetsInfo:error:", v8, v9, a5);
  v18 = (id)CDMLogContext;
  v19 = v18;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v19, OS_SIGNPOST_INTERVAL_END, v15, "CDMAssetsManager", " enableTelemetry=YES ", (uint8_t *)&v24, 2u);
  }

  v20 = (id)CDMLogContext;
  v21 = v20;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v21, OS_SIGNPOST_INTERVAL_END, v11, "CDMAssetsManager", " enableTelemetry=YES ", (uint8_t *)&v24, 2u);
  }

}

- (BOOL)shouldReSetupForLocale:(id)a3 cdmAssetsInfo:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  NSObject *v19;
  void *v21;
  id v22;
  void *v23;
  id obj;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v26 = a4;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[CDMAssetsManager shouldReSetupForLocale:cdmAssetsInfo:]";
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Checking if asset manager needs to be resetup.", buf, 0xCu);
  }

  +[CDMUAFAssetsManager getNLUAFClientManagers](CDMUAFAssetsManager, "getNLUAFClientManagers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  +[CDMUAFAssetsManager getNLUAFClientManagers](CDMUAFAssetsManager, "getNLUAFClientManagers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "getGraphName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v6;

  v32 = 0;
  +[CDMUAFAssetsManager getAssetSetNameToUafClientManager:withError:](CDMUAFAssetsManager, "getAssetSetNameToUafClientManager:withError:", v25, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v32;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v26, "getAllAssetSets");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v29;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v11)
        objc_enumerationMutation(v9);
      +[CDMAssetsUtils cdmAssetSetToStr:](CDMAssetsUtils, "cdmAssetSetToStr:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "integerValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
        break;
      objc_msgSend(v14, "getLocale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v27);

      if ((v17 & 1) == 0)
      {
        CDMOSLoggerForCategory(0);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v15, "getLocale");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v34 = "-[CDMAssetsManager shouldReSetupForLocale:cdmAssetsInfo:]";
          v35 = 2112;
          v36 = v21;
          v37 = 2112;
          v38 = v27;
          v39 = 2112;
          v40 = v13;
          _os_log_debug_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_DEBUG, "%s UAFClientManager's existing locale is :%@ but the new locale is: %@ for asset set: %@. Return Yes", buf, 0x2Au);

        }
LABEL_20:

        v18 = 1;
        goto LABEL_21;
      }

      if (v10 == ++v12)
      {
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
        if (v10)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[CDMAssetsManager shouldReSetupForLocale:cdmAssetsInfo:]";
      v35 = 2112;
      v36 = v13;
      _os_log_debug_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_DEBUG, "%s UAFClientManager not found for asset set: %@. Return Yes", buf, 0x16u);
    }
    v15 = 0;
    goto LABEL_20;
  }
LABEL_12:

  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[CDMAssetsManager shouldReSetupForLocale:cdmAssetsInfo:]";
    v35 = 2112;
    v36 = v25;
    _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s Found UAFClientManagers: %@. No need to resetup", buf, 0x16u);
  }
  v18 = 0;
LABEL_21:

  objc_sync_exit(obj);
  return v18;
}

- (void)_setupUafAssetManagerForLocale:(id)a3 cdmAssetsInfo:(id)a4 error:(id *)a5
{
  id v8;
  CDMUAFAssetsManager *cdmUAFAssetsManager;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  cdmUAFAssetsManager = self->_cdmUAFAssetsManager;
  v14 = 0;
  -[CDMUAFAssetsManager setupForLocale:cdmAssetsInfo:error:](cdmUAFAssetsManager, "setupForLocale:cdmAssetsInfo:error:", v8, a4, &v14);
  v10 = v14;
  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "localeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[CDMAssetsManager _setupUafAssetManagerForLocale:cdmAssetsInfo:error:]";
      v17 = 2112;
      v18 = v13;
      _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Error occurred while setting up CDMUAFAssetsManager with locale: %@.", buf, 0x16u);

    }
    *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CDMAssetsManager _setupUafAssetManagerForLocale:cdmAssetsInfo:error:]";
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s CDMUAFAssetsManager setup successfully.", buf, 0xCu);
    }

  }
}

- (id)processSideLoadedAssetForNLAsset:(id)a3 withAssetFolders:(id)a4 assetDirPath:(id)a5 locale:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  -[CDMDefaultAssetsManager getAbsolutePathForServiceAssetFolders:assetDirPath:locale:](self->_cdmDefaultAssetsManager, "getAbsolutePathForServiceAssetFolders:assetDirPath:locale:", a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v10;
  if (v11)
  {
    objc_msgSend(v11, "getAssetPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v10;
    if (v14)
    {
      CDMOSLoggerForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v18 = 136315650;
        v19 = "-[CDMAssetsManager processSideLoadedAssetForNLAsset:withAssetFolders:assetDirPath:locale:]";
        v20 = 2112;
        v21 = v12;
        v22 = 2112;
        v23 = v10;
        _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Found valid custom asset: [%@] for NLAsset: %@. Return custom asset.", (uint8_t *)&v18, 0x20u);
      }

      v13 = v12;
    }
  }
  v16 = v13;

  return v16;
}

- (id)getAssetsByFactorNamesForCDMAssetsInfo:(id)a3 assetDirPath:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  id v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  NilAsset *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  int v41;
  id v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v40 = a5;
  v42 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v7, "getAllAssetSets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall");
  v39 = v8;
  v48 = 0u;
  v49 = 0u;
  if (v8)
    v11 = 1;
  else
    v11 = v10;
  v41 = v11;
  v50 = 0uLL;
  v51 = 0uLL;
  v12 = v9;
  v36 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v49;
    v33 = v12;
    v34 = v7;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v49 != v35)
          objc_enumerationMutation(v12);
        objc_msgSend(v7, "getCDMAssetsFactorConfigCDMAssetSet:", objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "integerValue", v33, v34));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v37 = v14;
          v38 = i;
          objc_msgSend(v14, "getFactorToFoldersMapping");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "localeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[CDMAssetsManager getFactorToUnprocessedNLAsset:cdmAssetsInfo:locale:](CDMAssetsManager, "getFactorToUnprocessedNLAsset:cdmAssetsInfo:locale:", v15, v7, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v18 = v15;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
          if (!v19)
            goto LABEL_24;
          v20 = v19;
          v21 = *(_QWORD *)v45;
          while (1)
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v45 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
              v24 = objc_alloc_init(NilAsset);
              objc_msgSend(v18, "objectForKey:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", v23);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[CDMAssetsManager processNLAsset:withAssetFolders:](self, "processNLAsset:withAssetFolders:", v26, v25);
              v27 = objc_claimAutoreleasedReturnValue();

              if (v25 && objc_msgSend(v25, "count"))
              {
                if (!v41)
                  goto LABEL_22;
                -[CDMAssetsManager processSideLoadedAssetForNLAsset:withAssetFolders:assetDirPath:locale:](self, "processSideLoadedAssetForNLAsset:withAssetFolders:assetDirPath:locale:", v27, v25, v39, v40);
                v28 = v27;
                v27 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                CDMOSLoggerForCategory(0);
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v53 = "-[CDMAssetsManager getAssetsByFactorNamesForCDMAssetsInfo:assetDirPath:locale:]";
                  _os_log_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_INFO, "%s [WARN]: Asset folder names are nil/empty", buf, 0xCu);
                }
              }

LABEL_22:
              objc_msgSend(v42, "setObject:forKey:", v27, v23);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
            if (!v20)
            {
LABEL_24:

              v12 = v33;
              v7 = v34;
              v14 = v37;
              i = v38;
              break;
            }
          }
        }

      }
      v36 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v36);
  }

  CDMOSLoggerForCategory(0);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "getGraphName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "descriptionInStringsFileFormat");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v53 = "-[CDMAssetsManager getAssetsByFactorNamesForCDMAssetsInfo:assetDirPath:locale:]";
    v54 = 2112;
    v55 = v31;
    v56 = 2112;
    v57 = v32;
    _os_log_debug_impl(&dword_21A2A0000, v29, OS_LOG_TYPE_DEBUG, "%s Assets paths for %@: %@", buf, 0x20u);

  }
  return v42;
}

- (BOOL)areAssetsAvailableForCDMAssetsInfo:(id)a3 factorToAsset:(id)a4 withError:(id *)a5
{
  return -[CDMAssetsManager areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:withSelfMetadata:withSelfContextId:withDataDispatcherContext:](self, "areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:withSelfMetadata:withSelfContextId:withDataDispatcherContext:", a3, a4, a5, 0, 0, 0);
}

- (BOOL)registerForCDMAssetsInfo:(id)a3 withLocale:(id)a4 withAssetsDelegate:(id)a5 selfContextId:(id)a6 selfMetadata:(id)a7 dataDispatcherContext:(id)a8 withAssetAvailabilityType:(int64_t)a9 withError:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  +[CDMUAFAssetsManager getNLUAFClientManagers](CDMUAFAssetsManager, "getNLUAFClientManagers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v22);
  LOBYTE(self) = -[CDMUAFAssetsManager registerForCDMAssetsInfo:withLocale:withAssetsDelegate:useFileManager:withSelfContextId:withSelfMetadata:withDataDispatcherContext:withAssetAvailabilityType:withError:](self->_cdmUAFAssetsManager, "registerForCDMAssetsInfo:withLocale:withAssetsDelegate:useFileManager:withSelfContextId:withSelfMetadata:withDataDispatcherContext:withAssetAvailabilityType:withError:", v16, v17, v18, self->_fileManager, v19, v20, v21, a9, a10);
  objc_sync_exit(v22);

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_cdmUAFAssetsManager, 0);
  objc_storeStrong((id *)&self->_cdmDefaultAssetsManager, 0);
}

+ (id)getSingletonCDMAssetsManager
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "+[CDMAssetsManager getSingletonCDMAssetsManager]";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Fetching CDMAssetsManager", (uint8_t *)&v4, 0xCu);
  }

  if (getSingletonCDMAssetsManager_once[0] != -1)
    dispatch_once(getSingletonCDMAssetsManager_once, &__block_literal_global_631);
  return (id)getSingletonCDMAssetsManager_singletonCdmAssetsManager;
}

+ (id)getFactorNamesForService:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[objc_class getCDMServiceAssetConfig](NSClassFromString((NSString *)a3), "getCDMServiceAssetConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getCDMAssetSetToFactorsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "getAllFactors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)getFactorToUnprocessedNLAsset:(id)a3 cdmAssetsInfo:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v15 = 136315138;
    v16 = "+[CDMAssetsManager getFactorToUnprocessedNLAsset:cdmAssetsInfo:locale:]";
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Using UAF to get unprocessed NLAssets.", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(v9, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[CDMUAFAssetsManager getUAFAssetsForFactors:withCDMAssetsInfo:locale:](CDMUAFAssetsManager, "getUAFAssetsForFactors:withCDMAssetsInfo:locale:", v11, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CDMOSLoggerForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = 136315394;
    v16 = "+[CDMAssetsManager getFactorToUnprocessedNLAsset:cdmAssetsInfo:locale:]";
    v17 = 2112;
    v18 = v12;
    _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s factorToUnprocessedNLAsset: %@.", (uint8_t *)&v15, 0x16u);
  }

  return v12;
}

void __48__CDMAssetsManager_getSingletonCDMAssetsManager__block_invoke()
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
    v4 = "+[CDMAssetsManager getSingletonCDMAssetsManager]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v0, OS_LOG_TYPE_DEBUG, "%s Singleton CDMAssetsManager has not been initialized yet. Initializing...", (uint8_t *)&v3, 0xCu);
  }

  v1 = -[CDMAssetsManager initManager]([CDMAssetsManager alloc], "initManager");
  v2 = (void *)getSingletonCDMAssetsManager_singletonCdmAssetsManager;
  getSingletonCDMAssetsManager_singletonCdmAssetsManager = (uint64_t)v1;

}

@end
