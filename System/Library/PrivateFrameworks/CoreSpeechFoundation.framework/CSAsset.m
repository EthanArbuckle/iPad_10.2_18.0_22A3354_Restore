@implementation CSAsset

- (CSAsset)initWithResourcePath:(id)a3 configFile:(id)a4 configVersion:(id)a5 assetProvderType:(unint64_t)a6 assetType:(unint64_t)a7
{
  return -[CSAsset initWithResourcePath:configFile:configVersion:assetProvderType:assetType:assetVariant:identity:assistantLanguageCode:](self, "initWithResourcePath:configFile:configVersion:assetProvderType:assetType:assetVariant:identity:assistantLanguageCode:", a3, a4, a5, a6, a7, 0, 0, 0);
}

- (CSAsset)initWithResourcePath:(id)a3 configFile:(id)a4 configVersion:(id)a5 assetProvderType:(unint64_t)a6 assetType:(unint64_t)a7 assetVariant:(unint64_t)a8 identity:(id)a9 assistantLanguageCode:(id)a10
{
  NSString *v14;
  id v15;
  id v16;
  id v17;
  CSAsset *v18;
  NSObject *v19;
  void *v20;
  NSString *v21;
  NSString *path;
  NSString *v23;
  CSAsset *v24;
  NSObject *v25;
  unint64_t v28;
  unint64_t v30;
  id v32;
  id v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  NSString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v14 = (NSString *)a3;
  v15 = a4;
  v16 = a5;
  v17 = a9;
  v34 = a10;
  v35.receiver = self;
  v35.super_class = (Class)CSAsset;
  v18 = -[CSAsset init](&v35, sel_init);
  if (!v18)
    goto LABEL_7;
  v32 = v17;
  v33 = v16;
  v19 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[CSAsset initWithResourcePath:configFile:configVersion:assetProvderType:assetType:assetVariant:identity:assis"
          "tantLanguageCode:]";
    v38 = 2114;
    v39 = v14;
    _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", a6, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](v14, "stringByAppendingPathComponent:", v15);
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "fileExistsAtPath:", v14)
    && (objc_msgSend(v20, "fileExistsAtPath:", v21) & 1) != 0)
  {
    objc_storeStrong((id *)&v18->_configVersion, a5);
    objc_storeStrong((id *)&v18->_resourcePath, a3);
    path = v18->_path;
    v18->_path = v21;
    v23 = v21;

    v18->_assetProvider = v28;
    v18->_assetType = v30;
    objc_storeStrong((id *)&v18->_identity, a9);
    objc_storeStrong((id *)&v18->_assistantLanguageCode, a10);

    v18->_assetVariant = a8;
    -[CSAsset _updateAssetVariantIfNeeded](v18, "_updateAssetVariantIfNeeded");

    v17 = v32;
    v16 = v33;
LABEL_7:
    v24 = v18;
    goto LABEL_11;
  }
  v25 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[CSAsset initWithResourcePath:configFile:configVersion:assetProvderType:assetType:assetVariant:identity:assis"
          "tantLanguageCode:]";
    v38 = 2114;
    v39 = v21;
    _os_log_impl(&dword_1B502E000, v25, OS_LOG_TYPE_DEFAULT, "%s Cannot find corespeech asset from resourcePath : %{public}@", buf, 0x16u);
  }

  v24 = 0;
  v16 = v33;
LABEL_11:

  return v24;
}

- (NSDictionary)dictionary
{
  NSDictionary *decodedInfo;
  NSDictionary *v4;
  NSDictionary *v5;

  decodedInfo = self->_decodedInfo;
  if (!decodedInfo)
  {
    +[CSAsset decodeJson:](CSAsset, "decodeJson:", self->_path);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_decodedInfo;
    self->_decodedInfo = v4;

    decodedInfo = self->_decodedInfo;
  }
  return decodedInfo;
}

- (id)getNumberForKey:(id)a3 category:(id)a4 default:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CSAsset dictionary](self, "dictionary");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[CSAsset dictionary](self, "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[CSAsset dictionary](self, "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[CSAsset dictionary](self, "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  v22 = CSLogContextFacilityCoreSpeech;
  v21 = v10;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    v24 = 136315906;
    v25 = "-[CSAsset getNumberForKey:category:default:]";
    v26 = 2114;
    v27 = v9;
    v28 = 2114;
    v29 = v8;
    v30 = 2114;
    v31 = v10;
    _os_log_debug_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEBUG, "%s Cannot access to %{public}@ %{public}@ using default value=%{public}@", (uint8_t *)&v24, 0x2Au);
    v21 = v10;
  }
LABEL_8:

  return v21;
}

- (BOOL)getBoolForKey:(id)a3 category:(id)a4 default:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v11) = objc_msgSend(v12, "BOOLValue");
  return (char)v11;
}

- (id)getStringForKey:(id)a3 category:(id)a4 default:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CSAsset dictionary](self, "dictionary");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[CSAsset dictionary](self, "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[CSAsset dictionary](self, "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[CSAsset dictionary](self, "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  v22 = CSLogContextFacilityCoreSpeech;
  v21 = v10;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    v24 = 136315906;
    v25 = "-[CSAsset getStringForKey:category:default:]";
    v26 = 2114;
    v27 = v9;
    v28 = 2114;
    v29 = v8;
    v30 = 2114;
    v31 = v10;
    _os_log_debug_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEBUG, "%s Cannot access to %{public}@ %{public}@ using default value=%{public}@", (uint8_t *)&v24, 0x2Au);
    v21 = v10;
  }
LABEL_8:

  return v21;
}

- (id)getValueForKey:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CSAsset dictionary](self, "dictionary");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CSAsset dictionary](self, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[CSAsset dictionary](self, "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[CSAsset dictionary](self, "dictionary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  v19 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    v21 = 136315650;
    v22 = "-[CSAsset getValueForKey:category:]";
    v23 = 2114;
    v24 = v7;
    v25 = 2114;
    v26 = v6;
    _os_log_debug_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEBUG, "%s Cannot access to %{public}@ %{public}@", (uint8_t *)&v21, 0x20u);
  }
  v18 = 0;
LABEL_9:

  return v18;
}

- (BOOL)containsKey:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  -[CSAsset dictionary](self, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CSAsset dictionary](self, "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[CSAsset dictionary](self, "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 != 0;

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)containsCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[CSAsset dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CSAsset dictionary](self, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)hashFromResourcePath
{
  void *v3;
  void *v4;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset assetHashInResourcePath:](self, "assetHashInResourcePath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("configVersion:%@ resourcePath:%@ path:%@"), self->_configVersion, self->_resourcePath, self->_path);
}

- (BOOL)isEqualAsset:(id)a3
{
  NSString *path;
  void *v4;

  path = self->_path;
  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(path) = -[NSString isEqualToString:](path, "isEqualToString:", v4);

  return (char)path;
}

- (id)stringForCurrentAssetProviderType
{
  unint64_t assetProvider;

  assetProvider = self->_assetProvider;
  if (assetProvider > 2)
    return CFSTR("Unknown");
  else
    return off_1E687E410[assetProvider];
}

- (id)assetHashForTrial:(id)a3
{
  void *v4;
  void *v5;

  -[CSAsset _sha1ForString:](self, "_sha1ForString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v4, self->_configVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)assetHashInResourcePath:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[CSAsset assetProvider](self, "assetProvider") == 1 || -[CSAsset assetProvider](self, "assetProvider") == 2)
    {
      -[CSAsset assetHashForTrial:](self, "assetHashForTrial:", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("((?:[a-z]|[0-9])*)\\.asset"), 0, &v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v16;
      if (v7)
      {
        v8 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v14 = v8;
          objc_msgSend(v7, "localizedDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v18 = "-[CSAsset assetHashInResourcePath:]";
          v19 = 2114;
          v20 = v15;
          _os_log_error_impl(&dword_1B502E000, v14, OS_LOG_TYPE_ERROR, "%s Failed to create regular expression : %{public}@", buf, 0x16u);

        }
        v5 = CFSTR("nohash");
      }
      else
      {
        objc_msgSend(v6, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && (unint64_t)objc_msgSend(v9, "numberOfRanges") >= 2)
        {
          v11 = objc_msgSend(v10, "rangeAtIndex:", 1);
          objc_msgSend(v4, "substringWithRange:", v11, v12);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = CFSTR("nohash");
        }

      }
    }
  }
  else
  {
    v5 = CFSTR("nohash");
  }

  return v5;
}

- (id)_sha1ForString:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA1((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);

  return v4;
}

- (void)_updateAssetVariantIfNeeded
{
  if (!self->_assetVariant && self->_assetProvider - 1 <= 1)
    self->_assetVariant = 2;
}

- (void)logAssetVersionForInsight
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[CSAsset assetType](self, "assetType")
    || -[CSAsset assetType](self, "assetType") == 5
    || -[CSAsset assetType](self, "assetType") == 7
    || -[CSAsset assetType](self, "assetType") == 8)
  {
    v3 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      return;
    v4 = v3;
    -[CSAsset configVersion](self, "configVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[CSAsset logAssetVersionForInsight]";
    v9 = 2114;
    v10 = (unint64_t)v5;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s [Asset Version Used]: VTAssetVersion: %{public}@", (uint8_t *)&v7, 0x16u);

    goto LABEL_7;
  }
  v6 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v6;
    v7 = 136315394;
    v8 = "-[CSAsset logAssetVersionForInsight]";
    v9 = 2048;
    v10 = -[CSAsset assetType](self, "assetType");
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s logAssetVersionForInsight for assetType: %lu", (uint8_t *)&v7, 0x16u);
LABEL_7:

  }
}

- (NSString)path
{
  return self->_path;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (unint64_t)assetProvider
{
  return self->_assetProvider;
}

- (unint64_t)assetVariant
{
  return self->_assetVariant;
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (NSString)identity
{
  return self->_identity;
}

- (NSString)assistantLanguageCode
{
  return self->_assistantLanguageCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantLanguageCode, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_decodedInfo, 0);
}

+ (id)hybridEndpointerAssetFilename
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    return CFSTR("hybridendpointer_marsh.json");
  else
    return CFSTR("hybridendpointer.json");
}

+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5
{
  return +[CSAsset assetForAssetType:resourcePath:configVersion:assetProvider:](CSAsset, "assetForAssetType:resourcePath:configVersion:assetProvider:", a3, a4, a5, 0);
}

+ (id)getConfigFileNameForAssetType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  id result;

  switch(a3)
  {
    case 0uLL:
    case 5uLL:
    case 7uLL:
      v5 = CFSTR("corespeech.json");
      goto LABEL_3;
    case 1uLL:
      +[CSAsset hybridEndpointerAssetFilename](CSAsset, "hybridEndpointerAssetFilename", v3, v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      result = v5;
      break;
    case 2uLL:
      result = CFSTR("assets.json");
      break;
    case 3uLL:
      result = CFSTR("speakerRecognition.json");
      break;
    case 4uLL:
      result = CFSTR("adBlockerPayload.bin");
      break;
    case 6uLL:
      result = CFSTR("mitigation.json");
      break;
    case 8uLL:
      result = CFSTR("repromptMetadata.json");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)getAssetFileForAssetType:(unint64_t)a3 resourcePath:(id)a4 assetProvider:(unint64_t)a5
{
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v7 = a4;
  switch(a3)
  {
    case 0uLL:
    case 5uLL:
    case 7uLL:
      v8 = CFSTR("corespeech.json");
      break;
    case 1uLL:
      +[CSAsset hybridEndpointerAssetFilename](CSAsset, "hybridEndpointerAssetFilename");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      v8 = CFSTR("assets.json");
      break;
    case 3uLL:
      v8 = CFSTR("speakerRecognition.json");
      break;
    case 4uLL:
      if (a5 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v7, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 && objc_msgSend(v10, "count"))
        {
          objc_msgSend(v10, "firstObject");
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = CFSTR("adBlockerPayload.bin");
      }
      break;
    case 6uLL:
      v8 = CFSTR("mitigation.json");
      break;
    case 8uLL:
      v8 = CFSTR("repromptMetadata.json");
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5 assetProvider:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  CSAsset *v12;

  v9 = a5;
  v10 = a4;
  +[CSAsset getAssetFileForAssetType:resourcePath:assetProvider:](CSAsset, "getAssetFileForAssetType:resourcePath:assetProvider:", a3, v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CSAsset initWithResourcePath:configFile:configVersion:assetProvderType:assetType:assetVariant:identity:assistantLanguageCode:]([CSAsset alloc], "initWithResourcePath:configFile:configVersion:assetProvderType:assetType:assetVariant:identity:assistantLanguageCode:", v10, v11, v9, a6, a3, 0, 0, 0);

  return v12;
}

+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5 assetProvider:(unint64_t)a6 identity:(id)a7 assistantLanguageCode:(id)a8
{
  return (id)objc_msgSend(a1, "assetForAssetType:resourcePath:configVersion:assetProvider:assetVariant:identity:assistantLanguageCode:", a3, a4, a5, a6, 0, a7, a8);
}

+ (id)assetForAssetType:(unint64_t)a3 resourcePath:(id)a4 configVersion:(id)a5 assetProvider:(unint64_t)a6 assetVariant:(unint64_t)a7 identity:(id)a8 assistantLanguageCode:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  CSAsset *v20;

  v15 = a9;
  v16 = a8;
  v17 = a5;
  v18 = a4;
  +[CSAsset getAssetFileForAssetType:resourcePath:assetProvider:](CSAsset, "getAssetFileForAssetType:resourcePath:assetProvider:", a3, v18, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[CSAsset initWithResourcePath:configFile:configVersion:assetProvderType:assetType:assetVariant:identity:assistantLanguageCode:]([CSAsset alloc], "initWithResourcePath:configFile:configVersion:assetProvderType:assetType:assetVariant:identity:assistantLanguageCode:", v18, v19, v17, a6, a3, a7, v16, v15);

  return v20;
}

+ (id)fallBackAssetResourcePath
{
  __CFString *v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v2 = CFSTR("/System/Library/PrivateFrameworks/CoreSpeechDarwin.framework");
  }
  else
  {
    +[CSUtils getResourcePathInSystemDomainMaskFromRootPathByAppending:](CSUtils, "getResourcePathInSystemDomainMaskFromRootPathByAppending:", CFSTR("PrivateFrameworks/CoreSpeech.framework"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[CSAsset fallBackAssetResourcePath]";
    v7 = 2114;
    v8 = v2;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Fallback asset resource path : %{public}@", (uint8_t *)&v5, 0x16u);
  }
  return v2;
}

+ (id)defaultFallBackAssetForHearst
{
  CSAsset *v3;
  void *v4;
  CSAsset *v5;

  v3 = [CSAsset alloc];
  objc_msgSend(a1, "fallBackAssetResourcePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CSAsset initWithResourcePath:configFile:configVersion:assetProvderType:assetType:](v3, "initWithResourcePath:configFile:configVersion:assetProvderType:assetType:", v4, CFSTR("corespeech.json"), CFSTR("defaultFallbackHearst"), 0, 0);

  return v5;
}

+ (id)defaultFallBackAssetForAdBlocker
{
  CSAsset *v3;
  void *v4;
  CSAsset *v5;

  v3 = [CSAsset alloc];
  objc_msgSend(a1, "fallBackAssetResourcePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CSAsset initWithResourcePath:configFile:configVersion:assetProvderType:assetType:](v3, "initWithResourcePath:configFile:configVersion:assetProvderType:assetType:", v4, CFSTR("adBlockerPayload.bin"), CFSTR("defaultFallbackAdBlocker"), 0, 4);

  return v5;
}

+ (id)defaultFallBackAssetForVoiceTrigger
{
  void *v2;
  CSAsset *v3;
  void *v4;
  CSAsset *v5;

  objc_msgSend(a1, "fallBackAssetResourcePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [CSAsset alloc];
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("iOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CSAsset initWithResourcePath:configFile:configVersion:assetProvderType:assetType:](v3, "initWithResourcePath:configFile:configVersion:assetProvderType:assetType:", v4, CFSTR("corespeech.json"), CFSTR("defaultFallback"), 0, 0);

  return v5;
}

+ (id)overrideAssetForVoiceTrigger
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fakeVoiceTriggerAssetPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v3);

  if (v6)
  {
    +[CSAsset assetForAssetType:resourcePath:configVersion:assetProvider:](CSAsset, "assetForAssetType:resourcePath:configVersion:assetProvider:", 0, v4, CFSTR("override-asset"), 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CSLogCategoryAsset;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "+[CSAsset overrideAssetForVoiceTrigger]";
      _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Returning Overriding Asset", buf, 0xCu);
    }
    if (v7)
    {
      +[CSOnDeviceCompilationHandler sharedHandler](CSOnDeviceCompilationHandler, "sharedHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        +[CSOnDeviceCompilationHandler sharedHandler](CSOnDeviceCompilationHandler, "sharedHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        objc_msgSend(v10, "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:", v7, 0, 0, &v14);
        v11 = v14;

        v12 = CSLogCategoryAsset;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v16 = "+[CSAsset overrideAssetForVoiceTrigger]";
          v17 = 2112;
          v18 = v11;
          _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Compile cached asset to onDevice CacheIr with error: %@", buf, 0x16u);
        }

      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)parseCompatibilityFromConfigVersion:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)decodeJson:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "+[CSAsset decodeJson:]";
        v20 = 2114;
        v21 = v3;
        _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s Cannot read configuration file : %{public}@", buf, 0x16u);
      }
      v13 = 0;
      goto LABEL_18;
    }
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (v8)
    {
      v9 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        objc_msgSend(v8, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v19 = "+[CSAsset decodeJson:]";
        v20 = 2114;
        v21 = v11;
        _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Cannot decode configuration json file : %{public}@", buf, 0x16u);

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v7;
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "+[CSAsset decodeJson:]";
        _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s Configuration json file is not expected format", buf, 0xCu);
      }
    }
    v13 = 0;
    goto LABEL_17;
  }
  v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "+[CSAsset decodeJson:]";
    v20 = 2114;
    v21 = v3;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Configuration file is not exists : %{public}@", buf, 0x16u);
  }
  v13 = 0;
LABEL_19:

  return v13;
}

+ (BOOL)isLeftConfigVersion:(id)a3 newerThanRightConfigVersion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "+[CSAsset isLeftConfigVersion:newerThanRightConfigVersion:]";
    v26 = 2114;
    v27 = v5;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Comparing %{public}@ with %{public}@", buf, 0x20u);
  }
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") > 2)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v11, "count") > 2)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", v14) & 1) != 0)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");
        if (v17 == objc_msgSend(v15, "integerValue"))
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v18;
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("Premium")) & 1) != 0)
            v10 = 0;
          else
            v10 = objc_msgSend(v18, "isEqualToString:", CFSTR("Premium"));

        }
        else
        {
          v21 = objc_msgSend(v16, "integerValue");
          v10 = v21 > objc_msgSend(v15, "integerValue");
        }

      }
      else
      {
        v20 = CSLogContextFacilityCoreSpeech;
        v10 = 0;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v25 = "+[CSAsset isLeftConfigVersion:newerThanRightConfigVersion:]";
          v26 = 2114;
          v27 = v13;
          _os_log_impl(&dword_1B502E000, v20, OS_LOG_TYPE_DEFAULT, "%s Not comparable with %{public}@, ignore", buf, 0x16u);
          v10 = 0;
        }
      }

    }
    else
    {
      v12 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "+[CSAsset isLeftConfigVersion:newerThanRightConfigVersion:]";
        v26 = 2114;
        v27 = v5;
        _os_log_error_impl(&dword_1B502E000, v12, OS_LOG_TYPE_ERROR, "%s Invalid leftConfig syntax : %{public}@", buf, 0x16u);
      }
      v10 = 0;
    }

  }
  else
  {
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[CSAsset isLeftConfigVersion:newerThanRightConfigVersion:]";
      v26 = 2114;
      v27 = v6;
      _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s Invalid rightConfig syntax : %{public}@", buf, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

- (NSString)mimVotingConfigFile
{
  void *v3;
  void *v4;
  void *v5;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("mimVotingConfigFile"), CFSTR("AttSiri"), CFSTR("mimConfig.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)gazeDetectionModelFile
{
  void *v3;
  void *v4;
  void *v5;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("gazeDetectionModelFile"), CFSTR("AttSiri"), CFSTR("gazeModel.mlmodelc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)lipMovementVADModelFile
{
  void *v3;
  void *v4;
  void *v5;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("visualActivityDetectorModelFile"), CFSTR("AttSiri"), CFSTR("vvad.mlmodelc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (float)startOfSpeechThresholdDuration
{
  void *v2;
  float v3;
  float v4;

  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", CFSTR("startOfSpeechThresholdDuration"), CFSTR("AttSiri"), &unk_1E68A1A38);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (float)startOfSpeechPrependAudioDuration
{
  void *v2;
  float v3;
  float v4;

  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", CFSTR("prependingAudioDurationInMs"), CFSTR("AttSiri"), &unk_1E68A1A48);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (BOOL)useGazeSignal
{
  return -[CSAsset getBoolForKey:category:default:](self, "getBoolForKey:category:default:", CFSTR("useGazeSignal"), CFSTR("AttSiri"), 0);
}

- (int64_t)numOfConsecutiveBoronActivationThreshold
{
  void *v2;
  int64_t v3;

  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", CFSTR("numOfConsecutiveBoronActivationThreshold"), CFSTR("AttSiri"), &unk_1E68A17C8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (float)attendingTimeoutValueInSecs
{
  void *v2;
  float v3;
  float v4;

  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", CFSTR("attendingTimeoutInSecs"), CFSTR("AttSiri"), &unk_1E68A1A58);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (id)mitigatonConfigFile
{
  void *v3;
  void *v4;
  void *v5;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("mitigationModelConfigFile"), CFSTR("AttSiri"), CFSTR("ouresConfig.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (float)mitigationModelDefaultAFTMScore
{
  void *v2;
  float v3;
  float v4;

  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", CFSTR("defaultAFTMValue"), CFSTR("AttSiri"), &unk_1E68A1A58);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (float)mitigationModelDefaultELFusionScore
{
  void *v2;
  float v3;
  float v4;

  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", CFSTR("defaultELScoreValue"), CFSTR("AttSiri"), &unk_1E68A1A58);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (float)mitigationModelDefaultNLDAScore
{
  void *v2;
  float v3;
  float v4;

  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", CFSTR("defaultNLDAValue"), CFSTR("AttSiri"), &unk_1E68A1A58);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (id)nldaConfigFile
{
  void *v3;
  void *v4;
  void *v5;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("nldaConfigFile"), CFSTR("AttSiri"), CFSTR("nldaConfig.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)allowKeywordsFile
{
  void *v3;
  void *v4;
  void *v5;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("allowKeywordFile"), CFSTR("AttSiriCC"), CFSTR("allowList.txt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)allowListWordCountThreshold
{
  void *v2;
  float v3;
  unint64_t v4;

  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", CFSTR("allowKeywordCount"), CFSTR("AttSiriCC"), &unk_1E68A17E0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = (unint64_t)v3;

  return v4;
}

- (id)mitigationConfigFileForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CSAsset resourcePath](self, "resourcePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("mitigationModelConfigFile"), v4, CFSTR("ouresConfig.json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nldaConfigFileForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CSAsset resourcePath](self, "resourcePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("nldaConfigFile"), v4, CFSTR("nldaConfig.json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)uesConfigFileForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CSAsset resourcePath](self, "resourcePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("uesConfigFile"), v4, CFSTR("uesConfig.json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldRunSpkrIdForCategory:(id)a3
{
  return -[CSAsset getBoolForKey:category:default:](self, "getBoolForKey:category:default:", CFSTR("useSpkrId"), a3, 1);
}

- (id)getCategoryKeyWithRecordCtx:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;

  v4 = a3;
  objc_msgSend(v4, "activationMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CSAsset isHSVoiceTrigger:](self, "isHSVoiceTrigger:", v5))
  {
    v6 = CFSTR("AttSiriHS");
  }
  else if (-[CSAsset isJSVoiceTrigger:](self, "isJSVoiceTrigger:", v5))
  {
    v6 = CFSTR("AttSiriJS");
  }
  else if (objc_msgSend(v4, "isContinuousConversation"))
  {
    v6 = CFSTR("AttSiriCC");
  }
  else
  {
    v6 = CFSTR("AttSiri");
  }

  return (id)v6;
}

- (BOOL)isJSVoiceTrigger:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("triggeredPhrase"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggeredPhrase"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", CFSTR("Siri"));

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (BOOL)isHSVoiceTrigger:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("triggeredPhrase"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggeredPhrase"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", CFSTR("HS"));

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (BOOL)isMagusSupported
{
  return -[CSAsset getBoolForKey:category:default:](self, "getBoolForKey:category:default:", CFSTR("supportMagus"), CFSTR("AttSiri"), 0);
}

- (BOOL)isJSSupported
{
  return -[CSAsset getBoolForKey:category:default:](self, "getBoolForKey:category:default:", CFSTR("supportJS"), CFSTR("AttSiri"), 0);
}

- (float)eagerMitigationDurationThreshold
{
  void *v2;
  float v3;
  float v4;

  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", CFSTR("defaultEagerMitigationDurationThreshold"), CFSTR("AttSiri"), &unk_1E68A1A68);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (id)getAllMitigationConfigFiles
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[CSAsset mitigatonConfigFile](self, "mitigatonConfigFile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    -[CSAsset mitigationConfigFileForCategory:](self, "mitigationConfigFileForCategory:", CFSTR("AttSiriCC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

    -[CSAsset mitigationConfigFileForCategory:](self, "mitigationConfigFileForCategory:", CFSTR("AttSiriHS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    -[CSAsset mitigationConfigFileForCategory:](self, "mitigationConfigFileForCategory:", CFSTR("AttSiriJS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    objc_msgSend(v4, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)getAllNldaConfigFiles
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[CSAsset nldaConfigFile](self, "nldaConfigFile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    -[CSAsset nldaConfigFileForCategory:](self, "nldaConfigFileForCategory:", CFSTR("AttSiriCC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

    -[CSAsset nldaConfigFileForCategory:](self, "nldaConfigFileForCategory:", CFSTR("AttSiriHS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    -[CSAsset nldaConfigFileForCategory:](self, "nldaConfigFileForCategory:", CFSTR("AttSiriJS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    objc_msgSend(v4, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSString)progCheckerConfigFile
{
  void *v3;
  void *v4;
  void *v5;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("progressiveCheckerConfigFile"), CFSTR("Liminal"), CFSTR("progChecker.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSArray)progCheckerRecognizerConfigFiles
{
  void *v3;
  void *v4;

  -[CSAsset progCheckerConfigFile](self, "progCheckerConfigFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getRecognizerConfigsFrom:](self, "getRecognizerConfigsFrom:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (unint64_t)supportedInputOrigins
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  -[CSAsset progCheckerConfigFile](self, "progCheckerConfigFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSAsset decodeJson:](CSAsset, "decodeJson:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("checkerConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("validInputOrigins")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("validInputOrigins"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

    v10 = -[CSAsset _mapInputOriginFromAssetToCSAudioRecordType:](self, "_mapInputOriginFromAssetToCSAudioRecordType:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)checkerThresholds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[CSAsset progCheckerConfigFile](self, "progCheckerConfigFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSAsset decodeJson:](CSAsset, "decodeJson:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("checkerConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thresholds"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thresholds"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v6, "initWithArray:", v7);

    }
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (BOOL)progCheckerShadowMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[CSAsset progCheckerConfigFile](self, "progCheckerConfigFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSAsset decodeJson:](CSAsset, "decodeJson:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("checkerConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shadowMode")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shadowMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (NSString)contConvConfigFile
{
  void *v3;
  void *v4;
  void *v5;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("contionusConversationConfigFile"), CFSTR("Liminal"), CFSTR("progChecker.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSArray)contConvRecognizerConfigFiles
{
  void *v3;
  void *v4;

  -[CSAsset contConvConfigFile](self, "contConvConfigFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getRecognizerConfigsFrom:](self, "getRecognizerConfigsFrom:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)contConvThresholds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[CSAsset contConvConfigFile](self, "contConvConfigFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSAsset decodeJson:](CSAsset, "decodeJson:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("checkerConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thresholds"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thresholds"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v6, "initWithArray:", v7);

    }
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (id)getRecognizerConfigsFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    +[CSAsset decodeJson:](CSAsset, "decodeJson:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSFModelConfigDecoder getAftmRecognizerRelativeConfigFromConfigDict:](CSFModelConfigDecoder, "getAftmRecognizerRelativeConfigFromConfigDict:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v3, "stringByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(v7, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)_mapInputOriginFromAssetToCSAudioRecordType:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v17[0] = &unk_1E68A1840;
  v18[0] = CFSTR("Unspecified");
  v18[1] = CFSTR("VoiceTrigger");
  v17[1] = &unk_1E68A1858;
  v17[2] = &unk_1E68A1870;
  v17[3] = &unk_1E68A1888;
  v18[2] = CFSTR("VoiceTrigger");
  v18[3] = CFSTR("ButtonPress");
  v17[4] = &unk_1E68A18A0;
  v17[5] = &unk_1E68A18B8;
  v18[4] = CFSTR("ButtonPress");
  v18[5] = CFSTR("VoiceTrigger");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__CSAsset_Liminal___mapInputOriginFromAssetToCSAudioRecordType___block_invoke;
  v11[3] = &unk_1E687EF68;
  v6 = v3;
  v12 = v6;
  objc_msgSend(v4, "keysOfEntriesPassingTest:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __64__CSAsset_Liminal___mapInputOriginFromAssetToCSAudioRecordType___block_invoke_2;
  v10[3] = &unk_1E687EF90;
  v10[4] = &v13;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __64__CSAsset_Liminal___mapInputOriginFromAssetToCSAudioRecordType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:");
}

uint64_t __64__CSAsset_Liminal___mapInputOriginFromAssetToCSAudioRecordType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedIntValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= 1 << result;
  return result;
}

- (float)keywordDetectorThreshold
{
  void *v2;
  float v3;
  float v4;

  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", CFSTR("threshold"), CFSTR("keywordDetector"), &unk_1E68A1AB8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (NSString)keywordDetectorConfigPathRecognizer
{
  void *v3;
  void *v4;
  void *v5;

  -[CSAsset resourcePath](self, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset getStringForKey:category:default:](self, "getStringForKey:category:default:", CFSTR("configFileRecognizer"), CFSTR("keywordDetector"), CFSTR("keyword_detector.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (float)keywordDetectorWaitTimeSinceVT
{
  void *v2;
  float v3;
  float v4;

  -[CSAsset getNumberForKey:category:default:](self, "getNumberForKey:category:default:", CFSTR("waitTimeSinceVT"), CFSTR("keywordDetector"), &unk_1E68A1AC8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

@end
