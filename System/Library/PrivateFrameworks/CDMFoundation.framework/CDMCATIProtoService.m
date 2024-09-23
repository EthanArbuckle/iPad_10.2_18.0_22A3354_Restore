@implementation CDMCATIProtoService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMCATIProtoRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isEnabled
{
  return +[CDMFeatureFlags isCATIEnabled](CDMFeatureFlags, "isCATIEnabled");
}

+ (id)getCDMServiceAssetConfig
{
  CDMServiceAssetConfig *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v6 = CFSTR("cati_models");
  v7 = CFSTR("com.apple.siri.nl.cati");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  return v2;
}

- (id)setup:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSBundle *v8;
  NSBundle *catiBundle;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *childServices;
  void *v14;
  void *v15;
  CDMCATIChildService *v16;
  __CFString *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  CDMCATIChildService *v32;
  __CFString *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CDMCATIChildService *v47;
  NSObject *v48;
  void *v50;
  void *v51;
  __CFString *v52;
  id v53;
  id v54;
  CDMCATIProtoService *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  char v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  const __CFString *v75;
  __int16 v76;
  const __CFString *v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v55 = self;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v73 = "-[CDMCATIProtoService setup:]";
    _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Begin CATI setup", buf, 0xCu);
  }

  objc_msgSend(v54, "dynamicConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getAssetForFactorName:", CFSTR("com.apple.siri.nl.cati"));
  v52 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v52 && -[__CFString getAssetType](v52, "getAssetType"))
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v73 = "-[CDMCATIProtoService setup:]";
      v74 = 2112;
      v75 = v52;
      v76 = 2112;
      v77 = CFSTR("com.apple.siri.nl.cati");
      _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s Asset is: [%@] for factor: %@.", buf, 0x20u);
    }

    objc_msgSend(v54, "dynamicConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.cati"));
    v8 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    catiBundle = self->_catiBundle;
    self->_catiBundle = v8;

    -[__CFString getAssetVersion](v52, "getAssetVersion");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "componentsSeparatedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_assetVersion = objc_msgSend(v11, "integerValue");

    if (!self->_catiBundle)
    {
      -[CDMCATIProtoService setupErrorResponse:serviceState:](self, "setupErrorResponse:serviceState:", CFSTR("Not able to find/load CATI model bundle directory"), 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_70:

      goto LABEL_71;
    }
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    childServices = self->_childServices;
    self->_childServices = v12;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSBundle resourcePath](self->_catiBundle, "resourcePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentsOfDirectoryAtPath:error:", v15, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (self->_assetVersion > 3103)
    {
      if (!objc_msgSend(v50, "count"))
      {
        CDMOSLoggerForCategory(0);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[CDMCATIProtoService setup:]";
          v74 = 2112;
          v75 = CFSTR("The cati_models directory is empty");
          _os_log_debug_impl(&dword_21A2A0000, v35, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
        }

        -[CDMCATIProtoService setupErrorResponse:serviceState:](self, "setupErrorResponse:serviceState:", CFSTR("The cati_models directory is empty"), 3);
        v36 = objc_claimAutoreleasedReturnValue();
        goto LABEL_65;
      }
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v16 = v50;
      v20 = -[CDMCATIChildService countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v66 != v21)
              objc_enumerationMutation(v16);
            v23 = *(const __CFString **)(*((_QWORD *)&v65 + 1) + 8 * i);
            v24 = (void *)MEMORY[0x24BDD1488];
            -[NSBundle resourcePath](v55->_catiBundle, "resourcePath");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringByAppendingPathComponent:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "bundleWithPath:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v64 = 0;
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "resourcePath");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v28, "fileExistsAtPath:isDirectory:", v29, &v64);
            if (v64)
              v31 = v30;
            else
              v31 = 0;

            if ((v31 & 1) != 0)
            {
              v32 = -[CDMCATIChildService initWithAssetBundle:]([CDMCATIChildService alloc], "initWithAssetBundle:", v27);
              -[CDMCATIChildService setup:assetVersion:](v32, "setup:assetVersion:", v54, v55->_assetVersion);
              v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v33)
              {
                CDMOSLoggerForCategory(0);
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315394;
                  v73 = "-[CDMCATIProtoService setup:]";
                  v74 = 2112;
                  v75 = v33;
                  _os_log_debug_impl(&dword_21A2A0000, v34, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
                }

                objc_msgSend(v53, "addObject:", v33);
              }
              else
              {
                -[NSMutableArray addObject:](v55->_childServices, "addObject:", v32);
              }

            }
            else
            {
              CDMOSLoggerForCategory(0);
              v32 = (CDMCATIChildService *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v32->super, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v73 = "-[CDMCATIProtoService setup:]";
                v74 = 2112;
                v75 = v23;
                _os_log_debug_impl(&dword_21A2A0000, &v32->super, OS_LOG_TYPE_DEBUG, "%s %@ is not a valid directory", buf, 0x16u);
              }
            }

          }
          v20 = -[CDMCATIChildService countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
        }
        while (v20);
      }
    }
    else
    {
      v16 = -[CDMCATIChildService initWithAssetBundle:]([CDMCATIChildService alloc], "initWithAssetBundle:", self->_catiBundle);
      -[CDMCATIChildService setup:assetVersion:](v16, "setup:assetVersion:", v54, self->_assetVersion);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        CDMOSLoggerForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[CDMCATIProtoService setup:]";
          v74 = 2112;
          v75 = v17;
          _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
        }

        -[CDMCATIProtoService setupErrorResponse:serviceState:](self, "setupErrorResponse:serviceState:", v17, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_68:
        goto LABEL_69;
      }
      -[NSMutableArray addObject:](self->_childServices, "addObject:", v16);
    }

    if (!-[NSMutableArray count](v55->_childServices, "count"))
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v43 = v53;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v61;
        v16 = (CDMCATIChildService *)CFSTR("No CATI child services were made, the following errors occurred:");
        do
        {
          v46 = 0;
          v47 = v16;
          do
          {
            if (*(_QWORD *)v61 != v45)
              objc_enumerationMutation(v43);
            -[CDMCATIChildService stringByAppendingFormat:](v47, "stringByAppendingFormat:", CFSTR(" %@, "), *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v46));
            v16 = (CDMCATIChildService *)objc_claimAutoreleasedReturnValue();

            ++v46;
            v47 = v16;
          }
          while (v44 != v46);
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        }
        while (v44);
      }
      else
      {
        v16 = (CDMCATIChildService *)CFSTR("No CATI child services were made, the following errors occurred:");
      }

      -[CDMCATIProtoService setupErrorResponse:serviceState:](v55, "setupErrorResponse:serviceState:", v16, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_68;
    }
    if (objc_msgSend(v53, "count"))
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v37 = v53;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v57;
        v40 = CFSTR("Some CATI child services did not set up correctly, the following errors occurred:");
        do
        {
          v41 = 0;
          v42 = v40;
          do
          {
            if (*(_QWORD *)v57 != v39)
              objc_enumerationMutation(v37);
            -[NSObject stringByAppendingFormat:](v42, "stringByAppendingFormat:", CFSTR(" %@, "), *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v41));
            v40 = objc_claimAutoreleasedReturnValue();

            ++v41;
            v42 = v40;
          }
          while (v38 != v41);
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
        }
        while (v38);
      }
      else
      {
        v40 = CFSTR("Some CATI child services did not set up correctly, the following errors occurred:");
      }

      CDMOSLoggerForCategory(0);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v73 = "-[CDMCATIProtoService setup:]";
        v74 = 2112;
        v75 = (const __CFString *)v40;
        _os_log_impl(&dword_21A2A0000, v48, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
      }

    }
    else
    {
      CDMOSLoggerForCategory(0);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[CDMCATIProtoService setup:]";
        _os_log_debug_impl(&dword_21A2A0000, v40, OS_LOG_TYPE_DEBUG, "%s All child services set up successfully", buf, 0xCu);
      }
    }

    v55->super.super._serviceState = 2;
    -[CDMBaseService createSetupResponseCommand](v55, "createSetupResponseCommand");
    v36 = objc_claimAutoreleasedReturnValue();
LABEL_65:
    v19 = (void *)v36;
LABEL_69:

    goto LABEL_70;
  }
  -[CDMCATIProtoService setupErrorResponse:serviceState:](self, "setupErrorResponse:serviceState:", CFSTR("Not able to find/load CATI assets"), 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_71:

  return v19;
}

- (id)setupErrorResponse:(id)a3 serviceState:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  self->super.super._serviceState = a4;
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315394;
    v12 = "-[CDMCATIProtoService setupErrorResponse:serviceState:]";
    v13 = 2112;
    v14 = v6;
    _os_log_error_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v11, 0x16u);
  }

  -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCmdError:", v9);

  return v7;
}

- (id)handle:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  CDMCATIProtoResponseCommand *v15;
  NSObject *v16;
  int64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[CDMCATIProtoService handle:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Calling CATI ", buf, 0xCu);
  }

  if (-[CDMCATIProtoService getServiceState](self, "getServiceState") == 2)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[CDMCATIProtoService getChildServices](self, "getChildServices", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "handle:assetVersion:", v4, self->_assetVersion);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v6, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      }
      while (v8);
    }

    v12 = objc_alloc_init(MEMORY[0x24BE9E1A8]);
    objc_msgSend(v12, "setHypotheses:", v6);
    if (!objc_msgSend(v6, "count"))
    {
      CDMOSLoggerForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[CDMCATIProtoService handle:]";
        _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s No child service produced a hypothesis", buf, 0xCu);
      }

    }
    v14 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[CDMCATIProtoService handle:]";
      v25 = 2112;
      v26 = CFSTR("cati");
      v27 = 2112;
      v28 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nCATIResponse: %@", buf, 0x20u);
    }
    v15 = objc_alloc_init(CDMCATIProtoResponseCommand);
    -[CDMCATIProtoResponseCommand setResponse:](v15, "setResponse:", v12);

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = -[CDMCATIProtoService getServiceState](self, "getServiceState");
      *(_DWORD *)buf = 136315394;
      v24 = "-[CDMCATIProtoService handle:]";
      v25 = 2048;
      v26 = (const __CFString *)v17;
      _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s Not Ready! State: %tu", buf, 0x16u);
    }

    v15 = objc_alloc_init(CDMCATIProtoResponseCommand);
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, &stru_24DCAE158);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CDMBaseCommand setCmdError:](v15, "setCmdError:", v6);
  }

  return v15;
}

- (int64_t)getServiceState
{
  return self->super.super._serviceState;
}

- (id)getChildServices
{
  return (id)-[NSMutableArray copy](self->_childServices, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childServices, 0);
  objc_storeStrong((id *)&self->_catiBundle, 0);
}

@end
