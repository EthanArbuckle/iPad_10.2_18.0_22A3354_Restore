@implementation CDMDynamicConfig

- (CDMDynamicConfig)initWithLanguageCode:(id)a3
{
  return -[CDMDynamicConfig initWithLanguageCode:graphName:sandboxId:assetPaths:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:](self, "initWithLanguageCode:graphName:sandboxId:assetPaths:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:", a3, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetPaths:(id)a6 assetDirPath:(id)a7 overrideSiriVocabSpans:(id)a8 overrideMentions:(id)a9 overrideContextualSpans:(id)a10 serviceStateDirectory:(id)a11
{
  return -[CDMDynamicConfig initWithLanguageCode:embeddingVersion:graphName:sandboxId:assetPaths:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:](self, "initWithLanguageCode:embeddingVersion:graphName:sandboxId:assetPaths:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:", a3, 0, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (CDMEmbeddingConfigs)embeddingConfigs
{
  return self->_embeddingConfigs;
}

- (id)assetPaths
{
  return -[CDMNLAssetCollection assetPaths](self->_assetCollection, "assetPaths");
}

- (void)setEmbeddingConfigs:(id)a3
{
  CDMEmbeddingConfigs *v4;
  NSObject *v5;
  CDMEmbeddingConfigs *embeddingConfigs;
  int v7;
  const char *v8;
  __int16 v9;
  CDMEmbeddingConfigs *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (CDMEmbeddingConfigs *)a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "-[CDMDynamicConfig setEmbeddingConfigs:]";
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Set embedding configs to be: %@.", (uint8_t *)&v7, 0x16u);
  }

  embeddingConfigs = self->_embeddingConfigs;
  self->_embeddingConfigs = v4;

}

- (CDMNLAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)graphName
{
  return self->_graphName;
}

- (NSString)embeddingVersion
{
  return self->_embeddingVersion;
}

- (NSString)assetDirPath
{
  return self->_assetDirPath;
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 embeddingVersion:(id)a4 graphName:(id)a5 sandboxId:(id)a6 assetPaths:(id)a7 assetDirPath:(id)a8 overrideSiriVocabSpans:(id)a9 overrideMentions:(id)a10 overrideContextualSpans:(id)a11 serviceStateDirectory:(id)a12
{
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  CDMDynamicConfig *v24;
  CDMDynamicConfig *v25;
  uint64_t v26;
  NSString *graphName;
  void *v28;
  NSObject *v29;
  id obj;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  CDMDynamicConfig *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  v36 = a4;
  v18 = a5;
  obj = a6;
  v19 = a6;
  v39 = a7;
  v20 = a8;
  v21 = v19;
  v38 = v20;
  v22 = a9;
  v35 = a10;
  v34 = a11;
  v33 = a12;
  if (v19 && v22)
  {
    CDMOSLoggerForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[CDMDynamicConfig initWithLanguageCode:embeddingVersion:graphName:sandboxId:assetPaths:assetDirPath:overrid"
            "eSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:]";
      _os_log_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_INFO, "%s [WARN]: Both sandboxId and overrideSiriVocabSpans are attempted to be set in the CDMDynamicConfig! Only one of these should be set. If both are set, sandboxId will be ignored and only overrideSiriVocabSpans will be used.", buf, 0xCu);
    }

    v21 = v19;
  }
  v40.receiver = self;
  v40.super_class = (Class)CDMDynamicConfig;
  v24 = -[CDMDynamicConfig init](&v40, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_languageCode, a3);
    objc_storeStrong((id *)&v25->_embeddingVersion, a4);
    +[CDMDynamicConfig resolveActiveGraph:](CDMDynamicConfig, "resolveActiveGraph:", v18);
    v26 = objc_claimAutoreleasedReturnValue();
    graphName = v25->_graphName;
    v25->_graphName = (NSString *)v26;

    objc_storeStrong((id *)&v25->_siriVocabularySandboxId, obj);
    -[CDMDynamicConfig setAssetPaths:](v25, "setAssetPaths:", v39);
    -[CDMDynamicConfig setAssetDirPath:](v25, "setAssetDirPath:", v38);
    objc_storeStrong((id *)&v25->_overrideSiriVocabSpans, a9);
    objc_storeStrong((id *)&v25->_overrideMentions, a10);
    objc_storeStrong((id *)&v25->_overrideContextualSpans, a11);
    objc_storeStrong((id *)&v25->_serviceStateDirectory, a12);
  }
  v28 = v18;
  CDMOSLoggerForCategory(0);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[CDMDynamicConfig initWithLanguageCode:embeddingVersion:graphName:sandboxId:assetPaths:assetDirPath:overrideS"
          "iriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:]";
    v43 = 2112;
    v44 = v25;
    _os_log_debug_impl(&dword_21A2A0000, v29, OS_LOG_TYPE_DEBUG, "%s Dynamic config: %@.", buf, 0x16u);
  }

  return v25;
}

- (void)setAssetPaths:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  CDMNLAssetCollection *v11;
  CDMNLAssetCollection *assetCollection;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CDMNLAssetCollection assetPaths](self->_assetCollection, "assetPaths");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CDMNLAssetCollection assetPaths](self->_assetCollection, "assetPaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToDictionary:", v4);

    if ((v8 & 1) == 0)
    {
      CDMOSLoggerForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[CDMNLAssetCollection assetPaths](self->_assetCollection, "assetPaths");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 136315650;
        v14 = "-[CDMDynamicConfig setAssetPaths:]";
        v15 = 2112;
        v16 = v10;
        v17 = 2112;
        v18 = v4;
        _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Asset paths: %@ are not nil. They will be overwritten by new asset paths: %@.", (uint8_t *)&v13, 0x20u);

      }
    }
  }
  +[CDMNLAssetCollection assetCollectionWithAssetPaths:withLanguageCode:](CDMNLAssetCollection, "assetCollectionWithAssetPaths:withLanguageCode:", v4, self->_languageCode);
  v11 = (CDMNLAssetCollection *)objc_claimAutoreleasedReturnValue();
  assetCollection = self->_assetCollection;
  self->_assetCollection = v11;

}

+ (id)resolveActiveGraph:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v4 = v3;
  if (!v3 || !-[__CFString length](v3, "length"))
  {

    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "+[CDMDynamicConfig resolveActiveGraph:]";
      v9 = 2112;
      v10 = CFSTR("CDMNLUServiceGraph");
      _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: No value for active graph provided to CDMDynamicConfig, using the active service graph default of %@", (uint8_t *)&v7, 0x16u);
    }

    v4 = CFSTR("CDMNLUServiceGraph");
  }
  return v4;
}

- (void)setAssetDirPath:(id)a3
{
  id v5;
  NSString *v6;
  id *p_assetDirPath;
  NSString *assetDirPath;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  assetDirPath = self->_assetDirPath;
  p_assetDirPath = (id *)&self->_assetDirPath;
  v6 = assetDirPath;
  if (assetDirPath && !-[NSString isEqualToString:](v6, "isEqualToString:", v5))
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *p_assetDirPath;
      v13 = 136315650;
      v14 = "-[CDMDynamicConfig setAssetDirPath:]";
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Asset dir path: %@ is not nil. It will be overwritten by new asset dir path: %@.", (uint8_t *)&v13, 0x20u);
    }

  }
  objc_storeStrong(p_assetDirPath, a3);
  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = *p_assetDirPath;
    v13 = 136315394;
    v14 = "-[CDMDynamicConfig setAssetDirPath:]";
    v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Set asset dir path to be: %@.", (uint8_t *)&v13, 0x16u);
  }

}

- (NSString)siriVocabularySandboxId
{
  return self->_siriVocabularySandboxId;
}

- (void)setGraphName:(id)a3
{
  objc_storeStrong((id *)&self->_graphName, a3);
}

- (void)setEmbeddingVersion:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingVersion, a3);
}

- (NSString)serviceStateDirectory
{
  return self->_serviceStateDirectory;
}

- (NSArray)overrideSiriVocabSpans
{
  return self->_overrideSiriVocabSpans;
}

- (NSArray)overrideMentions
{
  return self->_overrideMentions;
}

- (NSArray)overrideContextualSpans
{
  return self->_overrideContextualSpans;
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetPaths:(id)a6
{
  return -[CDMDynamicConfig initWithLanguageCode:graphName:sandboxId:assetPaths:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:](self, "initWithLanguageCode:graphName:sandboxId:assetPaths:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:", a3, a4, a5, a6, 0, 0, 0);
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetDirPath:(id)a6
{
  return -[CDMDynamicConfig initWithLanguageCode:graphName:sandboxId:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:](self, "initWithLanguageCode:graphName:sandboxId:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:", a3, a4, a5, a6, 0, 0, 0);
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetPaths:(id)a6 overrideSiriVocabSpans:(id)a7 overrideMentions:(id)a8 overrideContextualSpans:(id)a9
{
  return -[CDMDynamicConfig initWithLanguageCode:graphName:sandboxId:assetPaths:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:](self, "initWithLanguageCode:graphName:sandboxId:assetPaths:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:", a3, a4, a5, a6, 0, a7, a8, a9, 0);
}

- (CDMDynamicConfig)initWithLanguageCode:(id)a3 graphName:(id)a4 sandboxId:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 overrideMentions:(id)a8 overrideContextualSpans:(id)a9
{
  return -[CDMDynamicConfig initWithLanguageCode:graphName:sandboxId:assetPaths:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:](self, "initWithLanguageCode:graphName:sandboxId:assetPaths:assetDirPath:overrideSiriVocabSpans:overrideMentions:overrideContextualSpans:serviceStateDirectory:", a3, a4, a5, 0, a6, a7, a8, a9, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = -[NSString copy](self->_languageCode, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

    v7 = -[NSString copy](self->_embeddingVersion, "copy");
    v8 = (void *)v4[2];
    v4[2] = v7;

    v9 = -[NSString copy](self->_graphName, "copy");
    v10 = (void *)v4[3];
    v4[3] = v9;

    v11 = -[NSString copy](self->_siriVocabularySandboxId, "copy");
    v12 = (void *)v4[4];
    v4[4] = v11;

    -[CDMDynamicConfig assetPaths](self, "assetPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v4, "setAssetPaths:", v14);

    v15 = -[NSString copy](self->_serviceStateDirectory, "copy");
    v16 = (void *)v4[11];
    v4[11] = v15;

  }
  return v4;
}

- (id)getAssetForFactorName:(id)a3
{
  return -[CDMNLAssetCollection getAssetForFactorName:](self->_assetCollection, "getAssetForFactorName:", a3);
}

- (id)getAssetBundlePathForFactorName:(id)a3
{
  return -[CDMNLAssetCollection getAssetBundlePathForFactorName:](self->_assetCollection, "getAssetBundlePathForFactorName:", a3);
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (void)setSiriVocabularySandboxId:(id)a3
{
  objc_storeStrong((id *)&self->_siriVocabularySandboxId, a3);
}

- (void)setAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollection, a3);
}

- (void)setOverrideSiriVocabSpans:(id)a3
{
  objc_storeStrong((id *)&self->_overrideSiriVocabSpans, a3);
}

- (void)setOverrideMentions:(id)a3
{
  objc_storeStrong((id *)&self->_overrideMentions, a3);
}

- (void)setOverrideContextualSpans:(id)a3
{
  objc_storeStrong((id *)&self->_overrideContextualSpans, a3);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSString hash](self->_languageCode, "hash");
  v4 = -[NSString hash](self->_embeddingVersion, "hash") + 89 * v3;
  v5 = -[NSString hash](self->_graphName, "hash") + 89 * v4;
  v6 = -[NSString hash](self->_siriVocabularySandboxId, "hash") + 89 * v5 + 62742241;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CDMNLAssetCollection assetPaths](self->_assetCollection, "assetPaths", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "hash") + 89 * v6;
        -[CDMNLAssetCollection assetPaths](self->_assetCollection, "assetPaths");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v14 + objc_msgSend(v16, "hash");

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v17 = -[NSString hash](self->_assetDirPath, "hash");
  return -[NSString hash](self->_serviceStateDirectory, "hash") + 89 * (v17 + 89 * v6);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  NSString *siriVocabularySandboxId;
  NSString *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  const char *v15;
  __int16 v16;
  CDMDynamicConfig *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[CDMDynamicConfig isEqualWithoutSandboxId:](self, "isEqualWithoutSandboxId:", v5))
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    goto LABEL_16;
  }
  siriVocabularySandboxId = self->_siriVocabularySandboxId;
  v7 = siriVocabularySandboxId;
  if (siriVocabularySandboxId)
  {
LABEL_5:
    objc_msgSend(v5, "siriVocabularySandboxId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v9);

    if (siriVocabularySandboxId)
    {
      if (v10)
        goto LABEL_7;
    }
    else
    {

      if (v10)
        goto LABEL_7;
    }
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
LABEL_14:
      v12 = 0;
      goto LABEL_15;
    }
LABEL_16:
    v14 = 136315650;
    v15 = "-[CDMDynamicConfig isEqual:]";
    v16 = 2112;
    v17 = self;
    v18 = 2112;
    v19 = v5;
    _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Dynamic config: %@ doesn't equal to dynamic config: %@.", (uint8_t *)&v14, 0x20u);
    goto LABEL_14;
  }
  objc_msgSend(v5, "siriVocabularySandboxId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v3 = (void *)v8;
    v7 = self->_siriVocabularySandboxId;
    goto LABEL_5;
  }
LABEL_7:
  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315650;
    v15 = "-[CDMDynamicConfig isEqual:]";
    v16 = 2112;
    v17 = self;
    v18 = 2112;
    v19 = v5;
    _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s Dynamic config: %@ equals to dynamic config: %@.", (uint8_t *)&v14, 0x20u);
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (BOOL)isEqualWithoutSandboxId:(id)a3
{
  void *v3;
  CDMDynamicConfig *v5;
  CDMDynamicConfig *v6;
  NSString *languageCode;
  NSString *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  char v12;
  NSString *embeddingVersion;
  NSString *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  NSString *graphName;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSString *assetDirPath;
  NSString *v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  NSString *serviceStateDirectory;
  NSString *v32;
  void *v33;
  int v34;

  v5 = (CDMDynamicConfig *)a3;
  v6 = v5;
  if (v5 != self)
  {
    if (!v5)
      goto LABEL_43;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
    languageCode = self->_languageCode;
    v8 = languageCode;
    if (!languageCode)
    {
      -[CDMDynamicConfig languageCode](v6, "languageCode");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_12;
      v3 = (void *)v9;
      v8 = self->_languageCode;
    }
    -[CDMDynamicConfig languageCode](v6, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v10);

    if (languageCode)
    {
      if (!v11)
        goto LABEL_43;
    }
    else
    {

      if (!v11)
        goto LABEL_43;
    }
LABEL_12:
    embeddingVersion = self->_embeddingVersion;
    v14 = embeddingVersion;
    if (!embeddingVersion)
    {
      -[CDMDynamicConfig embeddingVersion](v6, "embeddingVersion");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_19;
      v3 = (void *)v15;
      v14 = self->_embeddingVersion;
    }
    -[CDMDynamicConfig embeddingVersion](v6, "embeddingVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqualToString:](v14, "isEqualToString:", v16);

    if (embeddingVersion)
    {
      if (!v17)
        goto LABEL_43;
    }
    else
    {

      if (!v17)
        goto LABEL_43;
    }
LABEL_19:
    graphName = self->_graphName;
    v19 = (uint64_t)graphName;
    if (!graphName)
    {
      -[CDMDynamicConfig graphName](v6, "graphName");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
LABEL_26:
        -[CDMNLAssetCollection assetPaths](self->_assetCollection, "assetPaths");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 || (-[CDMDynamicConfig assetPaths](v6, "assetPaths"), (v19 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[CDMNLAssetCollection assetPaths](self->_assetCollection, "assetPaths");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[CDMDynamicConfig assetPaths](v6, "assetPaths");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqualToDictionary:", v24);

          if (v22)
          {

            if (!v25)
              goto LABEL_43;
          }
          else
          {

            if ((v25 & 1) == 0)
              goto LABEL_43;
          }
        }
        assetDirPath = self->_assetDirPath;
        v27 = assetDirPath;
        if (!assetDirPath)
        {
          -[CDMDynamicConfig assetDirPath](v6, "assetDirPath");
          v28 = objc_claimAutoreleasedReturnValue();
          if (!v28)
            goto LABEL_37;
          v22 = (void *)v28;
          v27 = self->_assetDirPath;
        }
        -[CDMDynamicConfig assetDirPath](v6, "assetDirPath");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[NSString isEqualToString:](v27, "isEqualToString:", v29);

        if (assetDirPath)
        {
          if (v30)
            goto LABEL_37;
        }
        else
        {

          if (v30)
          {
LABEL_37:
            serviceStateDirectory = self->_serviceStateDirectory;
            v32 = serviceStateDirectory;
            if (!serviceStateDirectory)
            {
              -[CDMDynamicConfig serviceStateDirectory](v6, "serviceStateDirectory");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v22)
              {
                LOBYTE(v34) = 0;
                goto LABEL_46;
              }
              v32 = self->_serviceStateDirectory;
            }
            -[CDMDynamicConfig serviceStateDirectory](v6, "serviceStateDirectory");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = !-[NSString isEqualToString:](v32, "isEqualToString:", v33);

            if (serviceStateDirectory)
            {
LABEL_47:
              v12 = v34 ^ 1;
              goto LABEL_44;
            }
LABEL_46:

            goto LABEL_47;
          }
        }
LABEL_43:
        v12 = 0;
        goto LABEL_44;
      }
      v3 = (void *)v20;
      v19 = (uint64_t)self->_graphName;
    }
    -[CDMDynamicConfig graphName](v6, "graphName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend((id)v19, "isEqualToString:", v21);

    if (graphName)
    {
      if (!(_DWORD)v19)
        goto LABEL_43;
    }
    else
    {

      if ((v19 & 1) == 0)
        goto LABEL_43;
    }
    goto LABEL_26;
  }
  v12 = 1;
LABEL_44:

  return v12;
}

- (id)description
{
  void *v3;
  NSString *languageCode;
  NSString *graphName;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  languageCode = self->_languageCode;
  graphName = self->_graphName;
  -[CDMNLAssetCollection assetPaths](self->_assetCollection, "assetPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CDMDynamicConfig] - Language Code: %@, Graph Name: %@, Asset Paths: %@, Asset Dir Path: %@, Siri Vocabulary Sandbox ID: %@, Service State Directory: %@"), languageCode, graphName, v6, self->_assetDirPath, self->_siriVocabularySandboxId, self->_serviceStateDirectory);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setServiceStateDirectory:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSString *serviceStateDirectory;
  int v7;
  const char *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "-[CDMDynamicConfig setServiceStateDirectory:]";
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Set serviceStateDirectory to be: %@.", (uint8_t *)&v7, 0x16u);
  }

  serviceStateDirectory = self->_serviceStateDirectory;
  self->_serviceStateDirectory = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceStateDirectory, 0);
  objc_storeStrong((id *)&self->_embeddingConfigs, 0);
  objc_storeStrong((id *)&self->_overrideContextualSpans, 0);
  objc_storeStrong((id *)&self->_overrideMentions, 0);
  objc_storeStrong((id *)&self->_overrideSiriVocabSpans, 0);
  objc_storeStrong((id *)&self->_assetDirPath, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_siriVocabularySandboxId, 0);
  objc_storeStrong((id *)&self->_graphName, 0);
  objc_storeStrong((id *)&self->_embeddingVersion, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end
