@implementation CSOnDeviceCompilationHandler

- (CSOnDeviceCompilationHandler)init
{
  CSOnDeviceCompilationHandler *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSOnDeviceCompilationHandler;
  v2 = -[CSOnDeviceCompilationHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSOnDeviceCompilationHanlder", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)compileAndUpdateDeviceCachesWithAsset:(id)a3 assetType:(unint64_t)a4 endpointId:(id)a5 errOut:(id *)a6
{
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  id *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  void *v28;
  void *v29;
  __CFString *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v30 = (__CFString *)v10;
    +[CSUtils getSiriLanguageWithEndpointId:fallbackLanguage:](CSUtils, "getSiriLanguageWithEndpointId:fallbackLanguage:");
  }
  else
  {
    v30 = CFSTR("Hub");
    v12 = CFSTR("Hub");
    +[CSUtils getSiriLanguageWithFallback:](CSUtils, "getSiriLanguageWithFallback:", CFSTR("en-US"));
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getOnDeviceCompilationCacheDirectory");
  v14 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)v14;
  if (v14)
  {
    if (a4)
    {
      if (a4 != 6)
      {
        v19 = 0;
        goto LABEL_13;
      }
      v15 = (id *)&CSOnDeviceCompileSupportedMitigationModelTypes;
    }
    else
    {
      v15 = (id *)&CSOnDeviceCompileSupportedVoiceTriggerModelTypes;
    }
    v19 = *v15;
LABEL_13:
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v19;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v20)
    {
      v21 = v20;
      v17 = 0;
      v22 = *(_QWORD *)v34;
      do
      {
        v23 = 0;
        v24 = v17;
        do
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v23);
          +[CSOnDeviceCompilationUtils getModelCompiledDirWithModelType:basePath:](CSOnDeviceCompilationUtils, "getModelCompiledDirWithModelType:basePath:", (int)objc_msgSend(v25, "intValue"), v28);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v24;
          -[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:modelType:deviceId:currentLocale:compileDirectory:errOut:](self, "compileAndUpdateDeviceCachesWithAsset:assetType:modelType:deviceId:currentLocale:compileDirectory:errOut:", v31, a4, v25, v30, v29, v26, &v32);
          v17 = v32;

          ++v23;
          v24 = v17;
        }
        while (v21 != v23);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v21);
    }
    else
    {
      v17 = 0;
    }

    if (!a6)
      goto LABEL_25;
    v18 = objc_retainAutorelease(v17);
    v17 = v18;
LABEL_24:
    *a6 = v18;
LABEL_25:

    goto LABEL_26;
  }
  if (a6)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cached ir directory is nil"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v39[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2264);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_26:

}

- (void)compileAndUpdateDeviceCachesWithAsset:(id)a3 assetType:(unint64_t)a4 modelType:(id)a5 deviceId:(id)a6 currentLocale:(id)a7 compileDirectory:(id)a8 errOut:(id *)a9
{
  id v15;
  id v16;
  __CFString *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  OS_dispatch_queue *v25;
  id v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  int v31;
  char v32;
  void *v33;
  id *v34;
  id *v35;
  id *v36;
  id *v37;
  id v38;
  id *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *queue;
  NSObject *queuea;
  id *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[5];
  void *v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[3];
  _QWORD v58[5];
  void *v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[2];
  _QWORD block[5];
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  void *v77;
  uint64_t v78;
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = (__CFString *)a6;
  v18 = a7;
  v19 = a8;
  if (v17)
  {
    if (+[CSOnDeviceCompilationUtils shouldCompileForAssetType:](CSOnDeviceCompilationUtils, "shouldCompileForAssetType:", a4))
    {
      v71 = 0;
      v72 = &v71;
      v73 = 0x3032000000;
      v74 = __Block_byref_object_copy__9851;
      v75 = __Block_byref_object_dispose__9852;
      v76 = 0;
      v50 = v16;
      v51 = v18;
      if (a4 == 6
        && ((objc_msgSend(v16, "isEqual:", &unk_1E68A1990) & 1) != 0
         || objc_msgSend(v16, "isEqual:", &unk_1E68A19A8)))
      {
        v20 = v19;
        v21 = 2;
      }
      else
      {
        v20 = v19;
        v21 = 1;
      }
      v25 = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke;
      block[3] = &unk_1E68809E8;
      v69 = &v71;
      block[4] = self;
      v26 = v15;
      v65 = v26;
      v27 = v50;
      v66 = v27;
      v48 = v20;
      v67 = v48;
      v49 = v51;
      v68 = v49;
      v28 = v21;
      v70 = v21;
      v29 = v25;
      v19 = v20;
      dispatch_sync(v29, block);
      if (v72[5])
      {
        if (a4)
        {
          v30 = v26;
          v31 = !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
          if (a4 == 5)
            LOBYTE(a4) = v31;
          else
            LOBYTE(a4) = 1;
        }
        else
        {
          v30 = v26;
        }
        if (objc_msgSend(v27, "intValue") == 1)
          v32 = a4;
        else
          v32 = 1;
        if ((v32 & 1) != 0)
        {
          +[CSOnDeviceCompilationUtils getModelConfigsWithAsset:modelType:](CSOnDeviceCompilationUtils, "getModelConfigsWithAsset:modelType:", v30, (int)objc_msgSend(v27, "intValue"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          queue = self->_queue;
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke_18;
          v52[3] = &unk_1E6880A38;
          v57[1] = &v71;
          v34 = &v53;
          v47 = &v54;
          v52[4] = self;
          v53 = v33;
          v54 = v48;
          v35 = &v55;
          v55 = v49;
          v36 = &v56;
          v56 = v30;
          v37 = (id *)v57;
          v57[0] = v27;
          v57[2] = v28;
          v38 = v33;
          dispatch_sync(queue, v52);
          v39 = a9;
        }
        else
        {
          if (v17 == CFSTR("Hub"))
          {
            +[CSVoiceTriggerSecondPassConfigDecoder fetchAllVoiceTriggerSecondPassRecognizer:](CSVoiceTriggerSecondPassConfigDecoder, "fetchAllVoiceTriggerSecondPassRecognizer:", v30);
            v39 = a9;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:forFirstPassSource:](CSVoiceTriggerSecondPassConfigDecoder, "decodeConfigFrom:forFirstPassSource:", v30, 7);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = a9;
            v41 = v40;
            if (v40)
            {
              objc_msgSend(v40, "configPathRecognizer");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = v42;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v43 = 0;
            }

          }
          queuea = self->_queue;
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke_17;
          v58[3] = &unk_1E6880A10;
          v63[1] = &v71;
          v47 = &v60;
          v58[4] = self;
          v59 = v43;
          v60 = v48;
          v35 = &v61;
          v61 = v49;
          v36 = &v62;
          v62 = v30;
          v37 = (id *)v63;
          v63[0] = v27;
          v44 = v43;
          v34 = &v59;
          v38 = v44;
          dispatch_sync(queuea, v58);
        }

        if (v39)
          *v39 = objc_retainAutorelease((id)v72[5]);
      }

      v16 = v50;
      v18 = v51;

      _Block_object_dispose(&v71, 8);
    }
  }
  else if (a9)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v78 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceId specified as nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2254, v24);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (void)compileUsingConfig:(id)a3 locale:(id)a4 compileDirectory:(id)a5 modelType:(int64_t)a6 errOut:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *queue;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__9851;
  v29 = __Block_byref_object_dispose__9852;
  v30 = 0;
  if (v12)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__CSOnDeviceCompilationHandler_compileUsingConfig_locale_compileDirectory_modelType_errOut___block_invoke;
    block[3] = &unk_1E6880A60;
    v23 = &v25;
    v24 = a6;
    block[4] = self;
    v20 = v12;
    v21 = v14;
    v22 = v13;
    dispatch_sync(queue, block);
    if (a7)
      *a7 = objc_retainAutorelease((id)v26[5]);

  }
  else if (a7)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("configfileNil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2255, v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v25, 8);

}

- (id)_compileModelWithModelListInAsset:(id)a3 modelType:(id)a4 compileDirectoryPath:(id)a5 locale:(id)a6 compilationFramework:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  int64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    +[CSOnDeviceCompilationModelListDecoder decodeConfigFrom:](CSOnDeviceCompilationModelListDecoder, "decodeConfigFrom:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = a7;
      v18 = v13;
      +[CSOnDeviceCompilationUtils getModelNameFromMilFilePath:](CSOnDeviceCompilationUtils, "getModelNameFromMilFilePath:", v17);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hashFromResourcePath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSOnDeviceCompilationUtils getIrNameFromModelNameForCompile:locale:assetVersion:hashToUse:](CSOnDeviceCompilationUtils, "getIrNameFromModelNameForCompile:locale:assetVersion:hashToUse:", v30, v14, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingPathComponent:", v21);
      v22 = v12;
      v23 = v14;
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v18;
      +[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:](CSMil2BnnsUtils, "compileModelWithMilFile:bnnsIrCachePath:compilationFramework:", v17, v24, v31);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v23;
      v12 = v22;

    }
    else
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("model type not found in compilation list"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2262, v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("asset being nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2263, v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (id)_compileModelAndAddToCacheWithConfigFiles:(id)a3 compileDirectoryPath:(id)a4 locale:(id)a5 assetVersion:(id)a6 hashToUse:(id)a7 modelType:(int64_t)a8 compilationFramework:(int64_t)a9
{
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  _BOOL4 v37;
  NSObject *v38;
  const char *v39;
  uint32_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v51 = a4;
  v50 = a5;
  v49 = a6;
  v48 = a7;
  if (v14)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v15)
    {
      v17 = v15;
      v18 = 0;
      v19 = 0x1E687C000uLL;
      v53 = *(_QWORD *)v55;
      v47 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)&v16 = 136315138;
      v46 = v16;
      while (1)
      {
        v20 = 0;
        v52 = v17;
        do
        {
          if (*(_QWORD *)v55 != v53)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v20);
          objc_msgSend(*(id *)(v19 + 2696), "readMilFilePathFromConfig:modelType:", v21, a8, v46);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v19 + 2696), "getModelNameFromMilFilePath:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(*(id *)(v19 + 2696), "getBackendTypeFromModelFile:", v22);
          if (v24 == 2)
          {
            v28 = a8;
            v29 = v14;
            v30 = (void *)MEMORY[0x1E0CB35C8];
            v66 = v47;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not avaiable for E5ML"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v31;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2254, v32);
            v33 = objc_claimAutoreleasedReturnValue();

            v34 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v46;
              v59 = "-[CSOnDeviceCompilationHandler _compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale"
                    ":assetVersion:hashToUse:modelType:compilationFramework:]";
              _os_log_fault_impl(&dword_1B502E000, v34, OS_LOG_TYPE_FAULT, "%s Not implemented", buf, 0xCu);
            }
            v26 = 0;
            v18 = (void *)v33;
            v14 = v29;
            a8 = v28;
            v17 = v52;
            v19 = 0x1E687C000;
          }
          else if (v24 == 1)
          {
            objc_msgSend(*(id *)(v19 + 2696), "getIrNameFromModelNameForCompile:locale:assetVersion:hashToUse:", v23, v50, v49, v48);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "stringByAppendingPathComponent:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            +[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:](CSMil2BnnsUtils, "compileModelWithMilFile:bnnsIrCachePath:compilationFramework:", v22, v26, a9);
            v27 = objc_claimAutoreleasedReturnValue();

            v18 = (void *)v27;
          }
          else
          {
            v35 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v59 = "-[CSOnDeviceCompilationHandler _compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale"
                    ":assetVersion:hashToUse:modelType:compilationFramework:]";
              v60 = 2112;
              v61 = v22;
              v62 = 2112;
              v63 = v21;
              _os_log_impl(&dword_1B502E000, v35, OS_LOG_TYPE_DEFAULT, "%s No Valid backend for compilation is found for model file: %@ from config: %@", buf, 0x20u);
            }
            v26 = 0;
          }
          v36 = CSLogContextFacilityCoreSpeech;
          v37 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
          if (v18)
          {
            if (!v37)
              goto LABEL_22;
            *(_DWORD *)buf = 136315650;
            v59 = "-[CSOnDeviceCompilationHandler _compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale:a"
                  "ssetVersion:hashToUse:modelType:compilationFramework:]";
            v60 = 2112;
            v61 = v22;
            v62 = 2112;
            v63 = v18;
            v38 = v36;
            v39 = "%s mil2Bnns compilation failed for modelFile: %@ with error: %@";
            v40 = 32;
          }
          else
          {
            if (!v37)
              goto LABEL_22;
            *(_DWORD *)buf = 136315906;
            v59 = "-[CSOnDeviceCompilationHandler _compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale:a"
                  "ssetVersion:hashToUse:modelType:compilationFramework:]";
            v60 = 2112;
            v61 = v22;
            v62 = 2112;
            v63 = v26;
            v64 = 2112;
            v65 = 0;
            v38 = v36;
            v39 = "%s Compilation done for modelFile: %@, output cacheIrPath: %@ with error: %@";
            v40 = 42;
          }
          _os_log_impl(&dword_1B502E000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, v40);
LABEL_22:

          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        if (!v17)
          goto LABEL_27;
      }
    }
    v18 = 0;
  }
  else
  {
    v41 = (void *)MEMORY[0x1E0CB35C8];
    v69 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("config files passed in for compilation is nil"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2255, v43);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_27:
  v44 = v18;

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __92__CSOnDeviceCompilationHandler_compileUsingConfig_locale_compileDirectory_modelType_errOut___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if ((a1[9] & 0xFFFFFFFFFFFFFFFELL) == 2)
    v2 = 2;
  else
    v2 = 1;
  v3 = (void *)a1[4];
  v14[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale:assetVersion:hashToUse:modelType:compilationFramework:", v4, a1[6], a1[7], CFSTR("override"), CFSTR("defaultHash"), a1[9], v2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[8] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSOnDeviceCompilationHandler compileUsingConfig:locale:compileDirectory:modelType:errOut:]_block_invoke";
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s model compilation finished with error %@: ", buf, 0x16u);
  }
}

void __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_compileModelWithModelListInAsset:modelType:compileDirectoryPath:locale:compilationFramework:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 136315650;
    v9 = "-[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:modelType:deviceId:currentLocale"
         ":compileDirectory:errOut:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s compilation with onDeviceCompilation list finished with error: %@ with modelType: %@", (uint8_t *)&v8, 0x20u);
  }
}

void __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke_17(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "configVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "hashFromResourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale:assetVersion:hashToUse:modelType:compilationFramework:", v3, v4, v5, v6, v7, (int)objc_msgSend(*(id *)(a1 + 72), "intValue"), 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:modelType:deviceId:currentLocal"
          "e:compileDirectory:errOut:]_block_invoke";
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s second pass model compilation finished with error %@: ", buf, 0x16u);
  }
}

void __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke_18(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "configVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "hashFromResourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale:assetVersion:hashToUse:modelType:compilationFramework:", v3, v4, v5, v6, v7, (int)objc_msgSend(*(id *)(a1 + 72), "intValue"), *(_QWORD *)(a1 + 88));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:modelType:deviceId:currentLocal"
          "e:compileDirectory:errOut:]_block_invoke";
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s second pass model compilation finished with error %@: ", buf, 0x16u);
  }
}

+ (id)sharedHandler
{
  if (sharedHandler_onceToken != -1)
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_9881);
  return (id)sharedHandler_sharedHandler;
}

void __45__CSOnDeviceCompilationHandler_sharedHandler__block_invoke()
{
  CSOnDeviceCompilationHandler *v0;
  void *v1;

  v0 = objc_alloc_init(CSOnDeviceCompilationHandler);
  v1 = (void *)sharedHandler_sharedHandler;
  sharedHandler_sharedHandler = (uint64_t)v0;

}

@end
