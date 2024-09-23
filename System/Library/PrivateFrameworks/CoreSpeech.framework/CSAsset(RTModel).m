@implementation CSAsset(RTModel)

- (CSVoiceTriggerRTModel)createRTModelWithLocale:()RTModel
{
  __CFString *v4;
  uint64_t v5;
  os_log_t *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  int v16;
  __CFString *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  NSObject *v22;
  _BOOL4 v23;
  __CFString *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  __CFString *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  CSVoiceTriggerRTModel *v37;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  const char *v43;
  __int16 v44;
  __CFString *v45;
  __int16 v46;
  __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "resourcePath");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (os_log_t *)MEMORY[0x1E0D18F60];
  v7 = 0x1E0DC8000uLL;
  if (v5
    && (v8 = (void *)v5,
        objc_msgSend(a1, "path"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    objc_msgSend(a1, "resourcePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("config_rtv2.txt"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "resourcePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("config_rt.txt"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "resourcePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("config.txt"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v16 = CSHasAOP();
    v17 = v15;
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fileExistsAtPath:isDirectory:", v11, 0);

      v17 = v11;
      if ((v19 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v13, 0);

        v17 = v13;
        if ((v21 & 1) == 0)
        {
          v22 = *v6;
          v23 = os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT);
          v17 = v15;
          if (v23)
          {
            v42 = 136315650;
            v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
            v44 = 2114;
            v45 = 0;
            v46 = 2114;
            v47 = v15;
            _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s RT specific configuration %{public}@ does not exist, defaulting to unified configuration %{public}@", (uint8_t *)&v42, 0x20u);
            v17 = v15;
          }
        }
      }
    }
    v24 = v17;
    v25 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v42 = 136315394;
      v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      v44 = 2114;
      v45 = v24;
      _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_DEFAULT, "%s Creating RT blob using: %{public}@", (uint8_t *)&v42, 0x16u);
    }
    v26 = (void *)MEMORY[0x1E0DC8648];
    objc_msgSend(a1, "resourcePath");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "getBlobWithConfigFilename:rootDirectory:", v24, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = *v6;
    v30 = *v6;
    if (v28)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v42 = 136315394;
        v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        v44 = 2114;
        v45 = v24;
        _os_log_impl(&dword_1C2614000, v29, OS_LOG_TYPE_DEFAULT, "%s CorealisRT model creation done successfully : %{public}@", (uint8_t *)&v42, 0x16u);
      }
      objc_msgSend(a1, "assetHashInResourcePath:", v24);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v42 = 136315138;
        v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        _os_log_error_impl(&dword_1C2614000, v29, OS_LOG_TYPE_ERROR, "%s Failed to create CorealisRT model", (uint8_t *)&v42, 0xCu);
      }
      v31 = 0;
    }
    v7 = 0x1E0DC8000;

    if (v28)
    {
      objc_msgSend(a1, "resourcePath");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v40 = (void *)v39;
        objc_msgSend(a1, "path");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
          goto LABEL_21;
      }
    }
  }
  else
  {
    v31 = 0;
    v28 = 0;
  }
  v32 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v42 = 136315138;
    v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s Defaulting to en_US CorealisRT model", (uint8_t *)&v42, 0xCu);
  }
  objc_msgSend(*(id *)(v7 + 1608), "getDefaultBlob");
  v33 = objc_claimAutoreleasedReturnValue();

  v34 = *v6;
  v35 = *v6;
  if (v33)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v42 = 136315138;
      v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_DEFAULT, "%s Default CorealisRT model creation done successfully", (uint8_t *)&v42, 0xCu);
    }

    v31 = CFSTR("nohash");
    v28 = (void *)v33;
LABEL_21:
    v36 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v42 = 136315650;
      v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      v44 = 2114;
      v45 = v4;
      v46 = 2114;
      v47 = v31;
      _os_log_impl(&dword_1C2614000, v36, OS_LOG_TYPE_DEFAULT, "%s RT Model queried - %{public}@ %{public}@", (uint8_t *)&v42, 0x20u);
    }
    v37 = -[CSVoiceTriggerRTModel initWithData:hash:locale:]([CSVoiceTriggerRTModel alloc], "initWithData:hash:locale:", v28, v31, v4);

    goto LABEL_27;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v42 = 136315138;
    v43 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_error_impl(&dword_1C2614000, v34, OS_LOG_TYPE_ERROR, "%s Failed to create default CorealisRT model", (uint8_t *)&v42, 0xCu);
  }
  v37 = 0;
LABEL_27:

  return v37;
}

- (id)RTModelWithFallbackLanguage:()RTModel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createRTModelWithLocale:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)latestHearstRTModelWithRequestOptions:()RTModel
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  id v24;
  void *v25;
  NSObject *v26;
  CSVoiceTriggerRTModelRequestOptions *v27;
  CSVoiceTriggerRTModelRequestOptions *v28;
  void *v30;
  id v31;
  id obj;
  unint64_t v33;
  _QWORD v34[6];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_18;
  v6 = (void *)v5;
  objc_msgSend(a1, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rtblobs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_18:
    v25 = 0;
    goto LABEL_23;
  }
  objc_msgSend(a1, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rtblobs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = a1;
  v31 = v4;
  objc_msgSend(a1, "_getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:", v4, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (!v12)
  {
    v14 = 0;
    v33 = 0;
    v15 = 0;
    goto LABEL_20;
  }
  v13 = v12;
  v14 = 0;
  v33 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v36 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("majorVersion"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntValue");

      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("minorVersion"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unsignedIntValue");

      if (v14 < v20)
      {
        v14 = v20;
LABEL_14:
        v24 = v18;

        v33 = v22;
        v15 = v24;
        continue;
      }
      if (v14 == v20 && v33 < v22)
        goto LABEL_14;
    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  }
  while (v13);
LABEL_20:

  v26 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v40 = "-[CSAsset(RTModel) latestHearstRTModelWithRequestOptions:]";
    v41 = 1024;
    v42 = v14;
    v43 = 1024;
    v44 = v33;
    v45 = 2113;
    v46 = v15;
    _os_log_impl(&dword_1C2614000, v26, OS_LOG_TYPE_DEFAULT, "%s latestMajorVersion = %d, LatestMinorVersion = %d rtBlob = %{private}@", buf, 0x22u);
  }
  v27 = [CSVoiceTriggerRTModelRequestOptions alloc];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __58__CSAsset_RTModel__latestHearstRTModelWithRequestOptions___block_invoke;
  v34[3] = &__block_descriptor_48_e56_v16__0___CSVoiceTriggerRTModelRequestOptionsMutablity__8l;
  v34[4] = v14;
  v34[5] = v33;
  v4 = v31;
  v28 = -[CSVoiceTriggerRTModelRequestOptions initWithCSRTModelRequestOptions:builder:](v27, "initWithCSRTModelRequestOptions:builder:", v31, v34);
  objc_msgSend(v30, "_buildRTModelWithBlobConfig:requestOptions:", v15, v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  return v25;
}

- (id)rtModelWithRequestOptions:()RTModel
{
  id v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accessoryModelType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6)
    v7 = CFSTR("adkblobs");
  else
    v7 = CFSTR("rtblobs");
  objc_msgSend(a1, "dictionary");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_7;
  v9 = (void *)v8;
  objc_msgSend(a1, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_rtModelWithRequestOptions:accessoryBlobs:", v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v15 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = "-[CSAsset(RTModel) rtModelWithRequestOptions:]";
      _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s corespeech.json doesn't contains rtblobs", (uint8_t *)&v17, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (uint64_t)hearstRTModelLocaleMap
{
  return objc_msgSend(a1, "localeMapWithName:", CFSTR("rtlocalemap"));
}

- (uint64_t)jarvisRTModelLocaleMap
{
  return objc_msgSend(a1, "localeMapWithName:", CFSTR("jarvislocalemap"));
}

- (uint64_t)remoraRTModelLocaleMap
{
  return objc_msgSend(a1, "localeMapWithName:", CFSTR("adklocalemap"));
}

- (id)rtModelLocaleMapWithModelType:()RTModel
{
  if (a3 == 1)
    objc_msgSend(a1, "remoraRTModelLocaleMap");
  else
    objc_msgSend(a1, "hearstRTModelLocaleMap");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localeMapWithName:()RTModel
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(a1, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(a1, "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(a1, "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  v15 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v17 = 136315394;
    v18 = "-[CSAsset(RTModel) localeMapWithName:]";
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s Locale map for %{public}@ is not available on asset", (uint8_t *)&v17, 0x16u);
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (id)_sha1:()RTModel
{
  id v3;
  void *v4;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  CC_SHA1((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);

  return v4;
}

- (id)_sha256:()RTModel
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  const void *v7;
  CC_LONG v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v4 = a3;
  objc_msgSend(v3, "dataWithLength:", 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  v7 = (const void *)objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  v9 = objc_retainAutorelease(v5);
  CC_SHA256(v7, v8, (unsigned __int8 *)objc_msgSend(v9, "mutableBytes"));
  return v9;
}

- (CSVoiceTriggerRTModel)_buildRTModelWithBlobConfig:()RTModel requestOptions:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  os_log_t *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  CSVoiceTriggerRTModel *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  CSVoiceTriggerRTModel *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("blob"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "resourcePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

    v13 = (os_log_t *)MEMORY[0x1E0D18F60];
    v14 = *MEMORY[0x1E0D18F60];
    v15 = *MEMORY[0x1E0D18F60];
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        v44 = 2114;
        v45 = v10;
        _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Reading blob from : %{public}@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(a1, "_sha1:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "substringWithRange:", 0, 20);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "_sha256:", v16);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("signature"));
        v18 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v18;
        if (v18)
        {
          v19 = v18;
          objc_msgSend(a1, "resourcePath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByAppendingPathComponent:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "fileExistsAtPath:", v21);

          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v21);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v38 = 0;
          }

        }
        else
        {
          v38 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cert"));
        v27 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v27;
        if (v27)
        {
          v28 = v27;
          objc_msgSend(a1, "resourcePath", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringByAppendingPathComponent:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "fileExistsAtPath:", v30);

          if (v32)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v30);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v33 = 0;
          }

        }
        else
        {
          v33 = 0;
        }
        v34 = [CSVoiceTriggerRTModel alloc];
        objc_msgSend(v7, "siriLocale");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[CSVoiceTriggerRTModel initWithData:hash:locale:digest:signature:certificate:](v34, "initWithData:hash:locale:digest:signature:certificate:", v16, v41, v35, v40, v38, v33);

      }
      else
      {
        v26 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
          v44 = 2114;
          v45 = v10;
          _os_log_error_impl(&dword_1C2614000, v26, OS_LOG_TYPE_ERROR, "%s Blob is nil : %{public}@", buf, 0x16u);
        }
        v25 = 0;
      }

    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        v44 = 2114;
        v45 = v10;
        _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s blob file is not exists at %{public}@", buf, 0x16u);
      }
      v25 = 0;
    }

  }
  else
  {
    v24 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
      _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s blob file name is not exists", buf, 0xCu);
    }
    v25 = 0;
  }

  return v25;
}

- (id)_splitBlobsByPhraseType:()RTModel
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("phraseType"));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = (__CFString *)v11;
        else
          v13 = CFSTR("HSOnly");
        v14 = v13;

        objc_msgSend(v4, "objectForKey:", v14);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v4, "setObject:forKey:", v15, v14);
        }
        objc_msgSend(v15, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(v4, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(v22, "sortedArrayUsingComparator:", &__block_literal_global_49_8388);

        if (v23)
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

  return v4;
}

- (id)_getFilteredAccessoryRTBlobListForRequestOptions:()RTModel accessoryBlobs:forceSkipEngineVersionCheck:
{
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  char v12;
  NSObject **v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  _BYTE v21[18];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "_splitBlobsByPhraseType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userSelectedPhraseType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_userSelectedPhraseTypeToRTModelPhraseType:", v10);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(a1, "_allowMultiPhrase:forceSkipEngineVersionCheck:", v8, a5);
  v13 = (NSObject **)MEMORY[0x1E0D18F60];
  if ((v12 & 1) != 0)
  {
    if (!v11)
    {
      v14 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v15 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315650;
      v19 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
      v20 = 1024;
      *(_DWORD *)v21 = 0;
      *(_WORD *)&v21[4] = 2112;
      *(_QWORD *)&v21[6] = v8;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Falling back to HSOnly phrase - Multi-phrase allowed: %d, request options: %@", (uint8_t *)&v18, 0x1Cu);
    }

    v11 = CFSTR("HSOnly");
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v16 = *v13;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = 136315651;
    v19 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
    v20 = 2113;
    *(_QWORD *)v21 = v11;
    *(_WORD *)&v21[8] = 2113;
    *(_QWORD *)&v21[10] = v14;
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_INFO, "%s Selected phrase type: %{private}@ accessory RTBlobs: %{private}@", (uint8_t *)&v18, 0x20u);
  }

  return v14;
}

- (id)_rtModelWithRequestOptions:()RTModel accessoryBlobs:
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  unsigned int v20;
  void *v22;
  void *v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:", v6, a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "engineMajorVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  objc_msgSend(v6, "engineMinorVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    v24 = a1;
    v25 = v6;
    v14 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("majorVersion"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "unsignedIntValue");

        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("minorVersion"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "unsignedIntValue");

        if (v18 == v9 && v11 >= v20)
        {
          v6 = v25;
          objc_msgSend(v24, "_buildRTModelWithBlobConfig:requestOptions:", v16, v25);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v13)
        continue;
      break;
    }
    v22 = 0;
    v6 = v25;
  }
  else
  {
    v22 = 0;
  }
LABEL_15:

  return v22;
}

- (uint64_t)_allowMultiPhrase:()RTModel forceSkipEngineVersionCheck:
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  BOOL v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v5 = a3;
  objc_msgSend(v5, "accessoryInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsJustSiri");

  objc_msgSend(v5, "engineMajorVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  objc_msgSend(v5, "engineMinorVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (v9)
    v12 = v11 == 0;
  else
    v12 = 1;
  v13 = !v12;
  if ((a4 & 1) != 0)
    v14 = 1;
  else
    v14 = v13;
  v15 = objc_msgSend(v5, "allowMph");

  v16 = v7 & v14 & v15;
  v17 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136316162;
    v20 = "-[CSAsset(RTModel) _allowMultiPhrase:forceSkipEngineVersionCheck:]";
    v21 = 1024;
    v22 = v7 & v14 & v15;
    v23 = 1024;
    v24 = v7;
    v25 = 1024;
    v26 = v14;
    v27 = 1024;
    v28 = v15;
    _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Multi-phrase keyword detection (%d): Accessory supports multi-phrase: %d, engine support multi-phrase: %d, device allows multi-phrase: %d", (uint8_t *)&v19, 0x24u);
  }
  return v16;
}

- (const)_userSelectedPhraseTypeToRTModelPhraseType:()RTModel
{
  if (objc_msgSend(a3, "unsignedIntegerValue") == 1)
    return CFSTR("HSJS");
  else
    return CFSTR("HSOnly");
}

+ (uint64_t)supportsMultiPhraseVoiceTriggerForEngineVersion:()RTModel engineMinorVersion:accessoryRTModelType:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  BOOL v14;
  unsigned int v15;
  uint64_t v16;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "unsignedIntegerValue");
  v11 = objc_msgSend(v8, "unsignedIntegerValue");
  v12 = objc_msgSend(v9, "unsignedIntegerValue");

  v13 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315650;
    v19 = "+[CSAsset(RTModel) supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:]";
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Incoming Major version:%@, Incoming Minor version:%@", (uint8_t *)&v18, 0x20u);
  }
  if (v10)
    v14 = v11 == 0;
  else
    v14 = 1;
  v15 = !v14;
  if (v12 <= 1)
    v16 = v15;
  else
    v16 = 0;

  return v16;
}

@end
