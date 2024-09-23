@implementation CDMMDSUaaPNLService

+ (BOOL)isEnabled
{
  return 1;
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
  v6 = CFSTR("uaap/mds");
  v7 = CFSTR("com.apple.siri.nl.uaap.mds");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  -[CDMServiceAssetConfig setIsAssetRequiredForSetup:](v2, "setIsAssetRequiredForSetup:", 0);
  return v2;
}

- (int)getOverrideNamespace
{
  return 3;
}

- (id)setup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSSet *v16;
  NSSet *appModelBundles;
  NSUInteger v18;
  NSObject *v19;
  NSObject *v20;
  NSUInteger v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  __CFString *v27;
  NSSet *v28;
  NSSet *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->super.super.super._serviceState = 2;
  if ((objc_msgSend((id)objc_opt_class(), "isEnabled") & 1) != 0)
  {
    objc_msgSend(v4, "dynamicConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getAssetBundlePathForFactorName:", CFSTR("com.apple.siri.nl.uaap.mds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[CDMMDSUaaPNLService setup:]";
        _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Fetching app model configurations", buf, 0xCu);
      }

      objc_msgSend(v6, "bundleURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("customLU"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0;
      objc_msgSend(MEMORY[0x24BE9E410], "configurationFromDirectoryUrl:error:", v10, &v35);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v35;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", v11, 0);
      v14 = v13;
      if (v13 && objc_msgSend(v13, "count"))
      {
        CDMOSLoggerForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[CDMMDSUaaPNLService setup:]";
          _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Loading MDS model bundle", buf, 0xCu);
        }

        +[CDMUaaPNLProtoService loadAppModelBundles:](CDMUaaPNLProtoService, "loadAppModelBundles:", v14);
        v16 = (NSSet *)objc_claimAutoreleasedReturnValue();
        appModelBundles = self->super.__appModelBundles;
        self->super.__appModelBundles = v16;

        v18 = -[NSSet count](self->super.__appModelBundles, "count");
        CDMOSLoggerForCategory(0);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v18)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v21 = -[NSSet count](self->super.__appModelBundles, "count");
            *(_DWORD *)buf = 136315394;
            v37 = "-[CDMMDSUaaPNLService setup:]";
            v38 = 2048;
            v39 = (const __CFString *)v21;
            _os_log_debug_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_DEBUG, "%s Loaded %lu app model bundles", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[CDMMDSUaaPNLService setup:]";
          _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Failed to load MDS model bundle (despite having configurations)", buf, 0xCu);
        }

        -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = v11;
        v23 = v10;
        v24 = (void *)MEMORY[0x24BDD17C8];
        v25 = v12;
        objc_msgSend(v12, "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("Failed to find MDS configuration: %@"), v26);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v28 = (NSSet *)objc_claimAutoreleasedReturnValue();
        v29 = self->super.__appModelBundles;
        self->super.__appModelBundles = v28;

        self->super.super.super._serviceState = 4;
        -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        CDMOSLoggerForCategory(0);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v37 = "-[CDMMDSUaaPNLService setup:]";
          v38 = 2112;
          v39 = v27;
          _os_log_error_impl(&dword_21A2A0000, v30, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
        }

        -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 0, v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setCmdError:", v31);

        v12 = v25;
        v10 = v23;
        v11 = v34;
      }

    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[CDMMDSUaaPNLService setup:]";
        v38 = 2112;
        v39 = CFSTR("Failed to find an asset for service");
        _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
      }

      self->super.super.super._serviceState = 4;
      -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 0, CFSTR("Failed to find an asset for service"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCmdError:", v32);

    }
  }
  else
  {
    self->super.super.super._serviceState = 4;
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

@end
