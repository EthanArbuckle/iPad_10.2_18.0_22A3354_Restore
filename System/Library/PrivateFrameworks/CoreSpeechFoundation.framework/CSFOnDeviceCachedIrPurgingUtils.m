@implementation CSFOnDeviceCachedIrPurgingUtils

+ (void)purgeCachedIrExceptActiveCachedIrs:(id)a3 cachedIrDir:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  id v56;
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
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  id v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
    v76 = 2112;
    v77 = (uint64_t)v5;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Current active Irs: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v6, &v73);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v73;

  if (v10)
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
      v76 = 2112;
      v77 = (uint64_t)v10;
      _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s Can't fetch files within bnns cached ir folder with error: %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self ENDSWITH '.bnnsir'"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && objc_msgSend(v13, "count"))
    {
      v50 = v9;
      v52 = v5;
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v51 = v13;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v70 != v18)
              objc_enumerationMutation(v15);
            if (*(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i))
            {
              objc_msgSend(v6, "stringByAppendingPathComponent:");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stringByStandardizingPath");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v21);

            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
        }
        while (v17);
      }

      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v23 = v52;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v66 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "stringByStandardizingPath");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v28);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
        }
        while (v25);
      }

      v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v30 = v14;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v62;
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v62 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k);
            if ((objc_msgSend(v22, "containsObject:", v35) & 1) == 0)
              objc_msgSend(v29, "addObject:", v35);
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
        }
        while (v32);
      }

      +[CSOnDeviceCompilationUtils sortCachedIrsByLastAccessTimeStamp:](CSOnDeviceCompilationUtils, "sortCachedIrsByLastAccessTimeStamp:", v29);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
        v76 = 2112;
        v77 = (uint64_t)v36;
        _os_log_impl(&dword_1B502E000, v37, OS_LOG_TYPE_DEFAULT, "%s All cached Irs sorted by modification timestamps: %@", buf, 0x16u);
      }
      v13 = v51;
      if ((unint64_t)objc_msgSend(v36, "count") > 1)
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v49 = v36;
        obj = v36;
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v80, 16);
        if (v40)
        {
          v41 = 0;
          v10 = 0;
          v54 = *(_QWORD *)v58;
LABEL_44:
          v42 = 0;
          v43 = ~v41;
          v48 = v41 + v40;
          v44 = v10;
          v53 = v40;
          while (1)
          {
            if (*(_QWORD *)v58 != v54)
              objc_enumerationMutation(obj);
            v45 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v42);
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v44;
            objc_msgSend(v46, "removeItemAtPath:error:", v45, &v56);
            v10 = v56;

            v47 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
              v76 = 2112;
              v77 = v45;
              v78 = 2112;
              v79 = v10;
              _os_log_impl(&dword_1B502E000, v47, OS_LOG_TYPE_DEFAULT, "%s removing cachedIr: %@ with error: %@", buf, 0x20u);
            }
            if ((unint64_t)(objc_msgSend(obj, "count") + v43) < 2)
              break;
            ++v42;
            --v43;
            v44 = v10;
            if (v53 == v42)
            {
              v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v80, 16);
              v41 = v48;
              if (v40)
                goto LABEL_44;
              break;
            }
          }
        }
        else
        {
          v10 = 0;
        }

        v13 = v51;
        v5 = v52;
        v36 = v49;
      }
      else
      {
        v38 = CSLogContextFacilityCoreSpeech;
        v5 = v52;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
          v76 = 2048;
          v77 = 1;
          _os_log_impl(&dword_1B502E000, v38, OS_LOG_TYPE_DEFAULT, "%s No need to purge as all cached Irs count less than %lu", buf, 0x16u);
        }
        v10 = 0;
      }

      v9 = v50;
    }
    else
    {
      v39 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:]";
        v76 = 2112;
        v77 = (uint64_t)v6;
        _os_log_impl(&dword_1B502E000, v39, OS_LOG_TYPE_DEFAULT, "%s No Cached Irs found in directory: %@", buf, 0x16u);
      }
      v10 = 0;
    }

  }
}

+ (void)cleanUpPreviousBuildBnnsIrInCachedIrDir:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (!+[CSOnDeviceCompilationUtils isBnnsIrNameForCurrentBuild:](CSOnDeviceCompilationUtils, "isBnnsIrNameForCurrentBuild:", v11))
          {
            objc_msgSend(v3, "stringByAppendingPathComponent:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringByStandardizingPath");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v22 = 0;
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v13, &v22);

            if (v15)
            {
              if (v22)
              {
                objc_msgSend(a1, "cleanUpPreviousBuildBnnsIrInCachedIrDir:", v13);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = 0;
                objc_msgSend(v16, "removeItemAtPath:error:", v13, &v21);
                v17 = v21;

                v18 = CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v28 = "+[CSFOnDeviceCachedIrPurgingUtils cleanUpPreviousBuildBnnsIrInCachedIrDir:]";
                  v29 = 2112;
                  v30 = v13;
                  v31 = 2112;
                  v32 = v17;
                  _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_DEFAULT, "%s remove folders or file for daemon start cleanup: %@ with error: %@", buf, 0x20u);
                }

              }
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      }
      while (v8);
    }

    v5 = v19;
  }

}

+ (void)cleanUpLegacyCachedIrDir:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v6, "removeItemAtPath:error:", v3, &v9);
    v7 = v9;

    if (v7)
    {
      v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "+[CSFOnDeviceCachedIrPurgingUtils cleanUpLegacyCachedIrDir:]";
        v12 = 2112;
        v13 = v7;
        _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s removing legacy path with error: %@", buf, 0x16u);
      }
    }

  }
}

+ (void)removeOnDeviceCachedPath
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getOnDeviceCompilationCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v4, "removeItemAtPath:error:", v3, &v7);
  v5 = v7;

  if (v5)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "+[CSFOnDeviceCachedIrPurgingUtils removeOnDeviceCachedPath]";
      v10 = 2112;
      v11 = v5;
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s cleanUpOnDeviceCompilationPath cleanup has error: %@", buf, 0x16u);
    }
  }

}

+ (void)purgeCachedIrForTrialAssetExcludingCurrentAsset:(id)a3 baseCachedIrDir:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    +[CSOnDeviceCompilationUtils getCachedIrsFromCSAsset:cachedIrDir:](CSOnDeviceCompilationUtils, "getCachedIrsFromCSAsset:cachedIrDir:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __99__CSFOnDeviceCachedIrPurgingUtils_purgeCachedIrForTrialAssetExcludingCurrentAsset_baseCachedIrDir___block_invoke;
    v14 = &unk_1E6880840;
    v15 = v6;
    v8 = v7;
    v16 = v8;
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E468D0](&v11);
    if (!objc_msgSend(v5, "assetType", v11, v12, v13, v14))
      ((void (**)(_QWORD, void *))v9)[2](v9, CSOnDeviceCompileSupportedVoiceTriggerModelTypes);
    if (objc_msgSend(v5, "assetType") == 6)
      v9[2](v9, CSOnDeviceCompileSupportedMitigationModelTypes);

  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "+[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrForTrialAssetExcludingCurrentAsset:baseCachedIrDir:]";
      _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s cachedIrDir specified as nil for purging", buf, 0xCu);
    }
  }

}

void __99__CSFOnDeviceCachedIrPurgingUtils_purgeCachedIrForTrialAssetExcludingCurrentAsset_baseCachedIrDir___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        +[CSOnDeviceCompilationUtils getModelCompiledDirWithModelType:basePath:](CSOnDeviceCompilationUtils, "getModelCompiledDirWithModelType:basePath:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "intValue"), *(_QWORD *)(a1 + 32));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSFOnDeviceCachedIrPurgingUtils purgeCachedIrExceptActiveCachedIrs:cachedIrDir:](CSFOnDeviceCachedIrPurgingUtils, "purgeCachedIrExceptActiveCachedIrs:cachedIrDir:", *(_QWORD *)(a1 + 40), v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

@end
