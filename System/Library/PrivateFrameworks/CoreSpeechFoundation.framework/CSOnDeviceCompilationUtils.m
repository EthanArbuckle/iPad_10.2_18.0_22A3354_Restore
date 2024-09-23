@implementation CSOnDeviceCompilationUtils

+ (BOOL)shouldCompileForAssetType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  return a3 != 6 || !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS", v3, v4);
}

+ (id)readMilFilePathFromConfig:(id)a3 modelType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a3;
  if (v5)
  {
    switch(a4)
    {
      case 1:
      case 4:
      case 5:
        +[CSUtils readValuesFromJsonFile:keyword:](CSUtils, "readValuesFromJsonFile:keyword:", v5, CFSTR("model-file"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v5, "stringByDeletingLastPathComponent");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        v10 = 0;
        break;
      case 2:
        +[CSFModelConfigDecoder decodeJsonFromFile:](CSFModelConfigDecoder, "decodeJsonFromFile:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringByDeletingLastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSFModelConfigDecoder getOdldModelFileFromConfigDict:resourcePath:](CSFModelConfigDecoder, "getOdldModelFileFromConfigDict:resourcePath:", v7, v8);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        +[CSFModelConfigDecoder decodeJsonFromFile:](CSFModelConfigDecoder, "decodeJsonFromFile:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringByDeletingLastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSFModelConfigDecoder getNCModelFileFromConfigDict:resourcePath:](CSFModelConfigDecoder, "getNCModelFileFromConfigDict:resourcePath:", v7, v8);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v10 = (id)v9;

        if (!v10 || !objc_msgSend(v10, "hasSuffix:", CFSTR("mil")))
          goto LABEL_13;
        v10 = v10;
        v7 = v10;
        break;
      default:
        v10 = 0;
LABEL_13:
        v7 = 0;
        break;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)getModelNameFromMilFilePath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "pathComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count") - 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".mlmodelc"), &stru_1E6885088);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)getMilConfigFromMilFilePath:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingPathExtension:", CFSTR("config"));
}

+ (id)getIrNameFromModelNameForCompile:(id)a3 locale:(id)a4 assetVersion:(id)a5 hashToUse:(id)a6
{
  void *v6;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = 0;
  if (a5 && a4 && a3 && a6)
  {
    v11 = a4;
    objc_msgSend(a1, "_getBaseNamingWithHashToUse:milName:configVersion:", a6, a3, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%@"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "stringByAppendingString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "stringByAppendingPathExtension:", CFSTR("bnnsir"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (int64_t)getBackendTypeFromModelFile:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR(".bnns.mil")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "hasSuffix:", CFSTR(".mil")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)getCachedIrsFromCSAsset:(id)a3 cachedIrDir:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[CSOnDeviceCompilationModelListDecoder decodeConfigFrom:](CSOnDeviceCompilationModelListDecoder, "decodeConfigFrom:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __66__CSOnDeviceCompilationUtils_getCachedIrsFromCSAsset_cachedIrDir___block_invoke;
    v29[3] = &unk_1E68803C0;
    v14 = v11;
    v30 = v14;
    v15 = v6;
    v31 = v15;
    v34 = a1;
    v16 = v12;
    v32 = v16;
    v17 = v10;
    v33 = v17;
    v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E468D0](v29);
    ((void (**)(_QWORD, void *))v18)[2](v18, CSOnDeviceCompileSupportedVoiceTriggerModelTypes);
    if (!+[CSUtils isDarwinOS](CSUtils, "isDarwinOS")
      && !+[CSUtils isBridgeOS](CSUtils, "isBridgeOS"))
    {
      v18[2](v18, CSOnDeviceCompileSupportedMitigationModelTypes);
    }
    v21 = v13;
    v22 = 3221225472;
    v23 = __66__CSOnDeviceCompilationUtils_getCachedIrsFromCSAsset_cachedIrDir___block_invoke_2;
    v24 = &unk_1E68803E8;
    v28 = a1;
    v25 = v15;
    v26 = v8;
    v27 = v16;
    v19 = v16;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", &v21);
    v9 = (void *)objc_msgSend(v19, "copy", v21, v22, v23, v24);

  }
  return v9;
}

+ (id)getCachedIrFromConfigPath:(id)a3 modelTye:(int64_t)a4 asset:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  +[CSOnDeviceCompilationUtils readMilFilePathFromConfig:modelType:](CSOnDeviceCompilationUtils, "readMilFilePathFromConfig:modelType:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSOnDeviceCompilationUtils getCachedIrFromMilFilePath:modelTye:asset:](CSOnDeviceCompilationUtils, "getCachedIrFromMilFilePath:modelTye:asset:", v8, a4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)getCachedIrFromMilFilePath:(id)a3 modelTye:(int64_t)a4 asset:(id)a5 cachedIrHomePath:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (v9 && objc_msgSend(v9, "hasSuffix:", CFSTR("mil")))
  {
    +[CSOnDeviceCompilationUtils getModelNameFromMilFilePath:](CSOnDeviceCompilationUtils, "getModelNameFromMilFilePath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSOnDeviceCompilationUtils getModelCompiledDirWithModelType:basePath:](CSOnDeviceCompilationUtils, "getModelCompiledDirWithModelType:basePath:", a4, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSUtils getSiriLanguageWithFallback:](CSUtils, "getSiriLanguageWithFallback:", CFSTR("en-US"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hashFromResourcePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSOnDeviceCompilationUtils getIrNameFromModelNameForCompile:locale:assetVersion:hashToUse:](CSOnDeviceCompilationUtils, "getIrNameFromModelNameForCompile:locale:assetVersion:hashToUse:", v12, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)getCachedIrFromMilFilePath:(id)a3 modelTye:(int64_t)a4 asset:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a3;
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getOnDeviceCompilationCacheDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getCachedIrFromMilFilePath:modelTye:asset:cachedIrHomePath:", v9, a4, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)sortCachedIrsByLastAccessTimeStamp:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  void *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = v3;
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v37;
      v9 = *MEMORY[0x1E0CB2A88];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v37 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (v11)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

            if (v13)
            {
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "attributesOfItemAtPath:error:", v11, 0);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                objc_msgSend(v15, "objectForKey:", v9);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16)
                {
                  objc_msgSend(v15, "objectForKey:", v9);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v46[0] = CFSTR("path");
                  v46[1] = CFSTR("lastModificationTime");
                  v47[0] = v11;
                  v47[1] = v17;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "addObject:", v18);

                }
              }

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      }
      while (v7);
    }

    v19 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "+[CSOnDeviceCompilationUtils sortCachedIrsByLastAccessTimeStamp:]";
      v44 = 2112;
      v45 = v31;
      _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s cachedIrs info sorted by timestamps: %@", buf, 0x16u);
    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("lastModificationTime"), 1);
    v41 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sortedArrayUsingDescriptors:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "objectForKey:", CFSTR("path"), v30);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v25);
    }

    v3 = v30;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isBnnsIrNameForCurrentBuild:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = (void *)MGGetStringAnswer();
  v5 = objc_msgSend(v3, "hasPrefix:", v4);

  return v5;
}

+ (id)getModelCompiledDirWithModelType:(int64_t)a3 basePath:(id)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 0:
      v7 = CFSTR("CSTempModel");
      goto LABEL_11;
    case 1:
      v7 = CFSTR("secondPassChecker");
      goto LABEL_11;
    case 2:
      v7 = CFSTR("odld");
      goto LABEL_11;
    case 3:
      v7 = CFSTR("neuralCombiner");
      goto LABEL_11;
    case 4:
      v7 = CFSTR("aftm");
      goto LABEL_11;
    case 5:
      v7 = CFSTR("speakerRecognition");
LABEL_11:
      objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315394;
        v12 = "+[CSOnDeviceCompilationUtils getModelCompiledDirWithModelType:basePath:]";
        v13 = 2048;
        v14 = a3;
        _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Does not support model type: %lu", (uint8_t *)&v11, 0x16u);
      }
      v9 = 0;
      break;
  }

  return v9;
}

+ (id)getModelConfigsWithAsset:(id)a3 modelType:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 1:
      +[CSVoiceTriggerSecondPassConfigDecoder fetchAllVoiceTriggerSecondPassRecognizer:](CSVoiceTriggerSecondPassConfigDecoder, "fetchAllVoiceTriggerSecondPassRecognizer:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      objc_msgSend(v5, "getAllNldaConfigFiles");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      objc_msgSend(v5, "getAllMitigationConfigFiles");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v8 = (void *)v7;
      goto LABEL_22;
    case 4:
      v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v6, "progCheckerRecognizerConfigFiles");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contConvRecognizerConfigFiles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v9, "addObjectsFromArray:", v10);
      if (v11)
        objc_msgSend(v9, "addObjectsFromArray:", v11);
      objc_msgSend(v9, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    case 5:
      objc_msgSend(v5, "resourcePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_22;
      if (CSIsHorseman_onceToken != -1)
        dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
      v12 = CSIsHorseman_isHorseman;
      objc_msgSend(v6, "resourcePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12)
        v15 = CFSTR("spid/spid.json");
      else
        v15 = CFSTR("sr/sr.json");
      objc_msgSend(v13, "stringByAppendingPathComponent:", v15);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v17[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
LABEL_21:

LABEL_22:
      return v8;
    default:
      v8 = 0;
      goto LABEL_22;
  }
}

+ (id)_getBaseNamingWithHashToUse:(id)a3 milName:(id)a4 configVersion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)MGGetStringAnswer();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@-%@"), v10, v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_getCachedIrsFromConfigFile:(id)a3 modelType:(int64_t)a4 CSAsset:(id)a5 cachedIrDir:(id)a6
{
  id v9;
  void *v10;
  void *v11;

  v9 = a5;
  +[CSOnDeviceCompilationUtils readMilFilePathFromConfig:modelType:](CSOnDeviceCompilationUtils, "readMilFilePathFromConfig:modelType:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "getCachedIrFromMilFilePath:modelTye:asset:", v10, a4, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)validateSecondPassCheckerCompilation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  __CFString *v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:forFirstPassSource:](CSVoiceTriggerSecondPassConfigDecoder, "decodeConfigFrom:forFirstPassSource:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configPathRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "fileExistsAtPath:", v7),
          v8,
          (v9 & 1) != 0))
    {
      +[CSOnDeviceCompilationUtils readMilFilePathFromConfig:modelType:](CSOnDeviceCompilationUtils, "readMilFilePathFromConfig:modelType:", v7, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

        if ((v12 & 1) != 0)
        {
          +[CSOnDeviceCompilationUtils getMilConfigFromMilFilePath:](CSOnDeviceCompilationUtils, "getMilConfigFromMilFilePath:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v5, "identity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@.temp.bnnsir"), v15);

          NSTemporaryDirectory();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)v16;
          objc_msgSend(v17, "stringByAppendingPathComponent:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = 0;
          objc_msgSend(MEMORY[0x1E0D1F1A0], "compileWithModelMilPath:bnnsIrOutPath:milConfigPath:errorOut:", v10, v18, v13, &v45);
          v19 = v45;
          v20 = v19;
          if (a4 && v19)
          {
            objc_msgSend(v19, "localizedDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)MEMORY[0x1E0CB35C8];
            v43 = *MEMORY[0x1E0D1F0C8];
            v46 = *MEMORY[0x1E0CB2D50];
            v22 = v21;
            v41 = v18;
            if (objc_msgSend(v22, "containsString:", CFSTR("bnns error message: "))
              && (v23 = objc_msgSend(v22, "rangeOfString:", CFSTR("bnns error message: ")), v23 != 0x7FFFFFFFFFFFFFFFLL))
            {
              objc_msgSend(v22, "substringFromIndex:", v23 + v24);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "componentsSeparatedByString:", CFSTR("[stack trace: ]"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "firstObject");
              v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v25 = CFSTR("Unkown error");
            }

            v47 = v25;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
            v40 = v22;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "errorWithDomain:code:userInfo:", v43, 3, v33);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

            v18 = v41;
          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "fileExistsAtPath:", v18);

          if (v35)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "removeItemAtPath:error:", v18, 0);

          }
          v28 = v20 == 0;

          goto LABEL_25;
        }
      }
      if (a4)
      {
        v31 = (void *)MEMORY[0x1E0CB35C8];
        v32 = *MEMORY[0x1E0D1F0C8];
        v48 = *MEMORY[0x1E0CB2D50];
        v49 = CFSTR("mil file path is not found");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 3, v13);
        v28 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

        goto LABEL_26;
      }
      v28 = 0;
    }
    else
    {
      if (!a4)
      {
        v28 = 0;
LABEL_27:

        goto LABEL_28;
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0D1F0C8];
      v50 = *MEMORY[0x1E0CB2D50];
      v51 = CFSTR("configfile for secondpass checker is not found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 3, v10);
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_26:

    goto LABEL_27;
  }
  if (a4)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0D1F0C8];
    v52 = *MEMORY[0x1E0CB2D50];
    v53[0] = CFSTR("asset is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 3, v6);
    v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

    goto LABEL_29;
  }
  v28 = 0;
LABEL_29:

  return v28;
}

void __66__CSOnDeviceCompilationUtils_getCachedIrsFromCSAsset_cachedIrDir___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 40), "resourcePath");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 64), "getCachedIrFromMilFilePath:modelTye:asset:", v12, (int)objc_msgSend(v8, "intValue"), *(_QWORD *)(a1 + 40));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v15 = *(void **)(a1 + 48);
            objc_msgSend(v13, "stringByStandardizingPath");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v16);

          }
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 64), "getModelConfigsWithAsset:modelType:", *(_QWORD *)(a1 + 40), (int)objc_msgSend(v8, "intValue"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v12, v8);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

}

void __66__CSOnDeviceCompilationUtils_getCachedIrsFromCSAsset_cachedIrDir___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 56), "_getCachedIrsFromConfigFile:modelType:CSAsset:cachedIrDir:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (int)objc_msgSend(v5, "intValue"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

@end
