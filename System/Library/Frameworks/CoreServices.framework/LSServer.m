@implementation LSServer

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  int inited;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  objc_class *v16;
  id v17;
  id v18;
  void *v19;
  const __CFURL *v20;
  CFDictionaryRef v21;
  CFDictionaryRef v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  NSObject *oslog;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
  void *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  const __CFURL *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  v25 = a3;
  v26 = a1;
  v5 = _LSUnregisterPluginsInDirectory(*(const __CFURL **)(a1 + 32));
  if (v5)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v5, (uint64_t)"_LSServer_RefreshContentInFrameworkAtURL_block_invoke", 466, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    _LSInstallLog();
    oslog = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_2();
  }
  else
  {
    oslog = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v39 = 0;
    v40 = 0;
    inited = _LSContextInitReturningError(&v40, &v39);
    v27 = v39;
    if (inited)
    {
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3254779904;
      v35 = ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_2;
      v36 = &unk_1E103E1C8;
      v38 = v40;
      v37 = oslog;
      _CSStoreEnumerateUnits();
      v7 = _LSExtensionPointUnregisterUnderFrameworkURL(v40, *(void **)(a1 + 32));
      if (v7)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v7, (uint64_t)"_LSServer_RefreshContentInFrameworkAtURL_block_invoke", 450, 0);
        v8 = objc_claimAutoreleasedReturnValue();

        v27 = (id)v8;
      }

      v9 = v38;
    }
    else
    {
      _LSInstallLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_1();
    }

    if (!v27)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v10 = *(id *)(a1 + 40);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v30 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v14, "objectForKey:", CFSTR("ApplicationType"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "isEqualToString:", CFSTR("Framework")))
            {
              v16 = (objc_class *)MEMORY[0x1E0C99E98];
              v17 = v14;
              v18 = [v16 alloc];
              objc_msgSend(v17, "objectForKey:", CFSTR("Path"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v20 = (const __CFURL *)objc_msgSend(v18, "initFileURLWithPath:isDirectory:", v19, 1);
              v21 = CFBundleCopyInfoDictionaryForURL(v20);
              v22 = v21;
              if (v21)
              {
                -[__CFDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("NSExtensionSDK"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v41[0] = MEMORY[0x1E0C809B0];
                v41[1] = 3221225472;
                v41[2] = ___registerExtensionPointsFromMIFrameworkDictionary_block_invoke;
                v41[3] = &unk_1E1041330;
                v42 = v20;
                objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v41);

              }
            }
            else if (objc_msgSend(v15, "isEqualToString:", CFSTR("PluginKitPlugin")))
            {
              _registerMIPluginDictionary(v14, oslog);
            }

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
        }
        while (v11);
      }

    }
  }

  (*(void (**)(void))(*(_QWORD *)(v26 + 48) + 16))();
}

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if ((*(_BYTE *)(a3 + 168) & 4) != 0)
  {
    v4 = (id)_CSStringCopyCFString();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
}

void ___LSServer_LSEnumerateAndRegisterAllCryptexContent_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  _LSServer_DatabaseExecutionContext();
  v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[LSDBExecutionContext assertNotActiveForThisThread](v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___LSServer_LSEnumerateAndRegisterAllCryptexContent_block_invoke_2;
  v8[3] = &unk_1E1040450;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v7 = v3;
  -[LSRebuildStatisticsGatherer performCryptexContentScan:](v6, v8);

}

void ___LSServer_LSEnumerateAndRegisterAllCryptexContent_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "calling into InstalledContentLibrary to register cryptex content", v3, 2u);
  }

  _LSServer_LSEnumerateAndRegisterAllCryptexContentWithContext(*(void **)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2;
  v5[3] = &unk_1E10410F8;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  +[LSDatabaseRebuildContext withStatsGatherer:runWithRebuildContext:]((uint64_t)LSDatabaseRebuildContext, v3, v5);

}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  uint8_t *v24;
  uint8_t v25[16];
  uint8_t v26[8];
  _QWORD v27[2];
  char v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  uint8_t v32[8];
  uint8_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[4];
  id v37;
  uint8_t *v38;
  uint8_t buf[8];
  _QWORD v40[2];
  char v41;

  v3 = a2;
  _LSServer_DatabaseExecutionContext();
  v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[LSDBExecutionContext assertNotActiveForThisThread](v4);

  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "calling into InstalledContentLibrary to register all content", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v40[0] = buf;
  v40[1] = 0x2020000000;
  v41 = 1;
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(_QWORD *)(a1 + 32);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_750;
  v36[3] = &unk_1E1040450;
  v38 = buf;
  v8 = v3;
  v37 = v8;
  -[LSRebuildStatisticsGatherer performSystemContentScan:](v7, v36);
  _LSInstallLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEFAULT, "finished enumerating system content.", v32, 2u);
  }

  *(_QWORD *)v32 = 0;
  v33 = v32;
  v34 = 0x2020000000;
  v35 = 0;
  v10 = *(_QWORD *)(a1 + 32);
  v31[0] = v6;
  v31[1] = 3221225472;
  v31[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_754;
  v31[3] = &unk_1E10408D8;
  v31[4] = v32;
  -[LSRebuildStatisticsGatherer performSystemContentSave:](v10, v31);
  v11 = *(_QWORD *)(a1 + 32);
  v29[0] = v6;
  v29[1] = 3221225472;
  v29[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_756;
  v29[3] = &unk_1E1040478;
  v12 = v8;
  v30 = v12;
  -[LSRebuildStatisticsGatherer performCryptexContentScan:](v11, v29);
  _LSInstallLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_DEFAULT, "Performing upcall to register containerized content.", v26, 2u);
  }

  *(_QWORD *)v26 = 0;
  v27[0] = v26;
  v27[1] = 0x2020000000;
  v28 = 1;
  _LSInstallLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "finished enumerating system content. Performing upcall to register containerized content", v25, 2u);
  }

  v15 = *(_QWORD *)(a1 + 32);
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_757;
  v22[3] = &unk_1E1040450;
  v24 = v26;
  v16 = v12;
  v23 = v16;
  -[LSRebuildStatisticsGatherer performContainerizedContentScan:](v15, v22);
  -[LSDatabaseRebuildContext finishAndArmSaveTimer]((id *)v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (*(_BYTE *)(v27[0] + 24) && *(_BYTE *)(v40[0] + 24))
  {
    v19 = 1;
  }
  else
  {
    if (v17)
    {
      _LSInstallLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_2();

    }
    _LSInstallLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_1((uint64_t)v40, (uint64_t)v27, v21);

    v19 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19;

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(buf, 8);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_750(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0D3AD40], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_752;
  v7[3] = &unk_1E1041120;
  v8 = *(id *)(a1 + 32);
  v6 = 0;
  v3 = objc_msgSend(v2, "enumerateBuiltInSystemContentWithBlock:error:", v7, &v6);
  v4 = v6;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    _LSInstallLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_750_cold_1();

    -[LSDatabaseRebuildContext noteRebuildError:](*(_QWORD *)(a1 + 32), v4);
  }

}

uint64_t ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_752(uint64_t a1, void *a2)
{
  _LSServer_LSRegisterICLItem(a2, *(void **)(a1 + 32));
  return 1;
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_754(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__4;
  v7[4] = __Block_byref_object_dispose__4;
  v8 = 0;
  _LSServer_DatabaseExecutionContext();
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_755;
  v6[3] = &unk_1E1041148;
  v3 = *(_QWORD *)(a1 + 32);
  v6[4] = v7;
  v6[5] = v3;
  -[LSDBExecutionContext syncRead:](v2, v6);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _LSInstallLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)__LSDefaultsGetSharedInstance(), "systemContentDatabaseStoreFileURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Saved system content database to %@", buf, 0xCu);

    }
  }
  else
  {
    _LSInstallLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_754_cold_1();
  }

  _Block_object_dispose(v7, 8);
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_755(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int inited;
  uint64_t v9;
  BOOL v10;
  id v11;
  id obj;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v7 + 40);
  v13 = 0;
  inited = _LSContextInitReturningError(&v13, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (inited)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(id *)(v9 + 40);
    v10 = _LSDatabaseSaveSystemContentDatabase(v13, &v11);
    objc_storeStrong((id *)(v9 + 40), v11);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
  }

}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_756(uint64_t a1)
{
  _LSServer_LSEnumerateAndRegisterAllCryptexContentWithContext(*(void **)(a1 + 32));
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_757(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  dispatch_semaphore_t v9;
  uint64_t v10;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3AD30]), "initWithTargetUID:", _CFGetEUID());
  objc_msgSend(MEMORY[0x1E0D3AD40], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_759;
  v7[3] = &unk_1E1041170;
  v5 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v2;
  v6 = v2;
  objc_msgSend(v4, "triggerRegistrationForContainerizedContentWithOptions:completion:", v3, v7);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_759(uint64_t a1, void *a2)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    -[LSDatabaseRebuildContext noteRebuildError:](*(_QWORD *)(a1 + 32), a2);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void ___LSServer_RebuildApplicationDatabases_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  _LSDatabaseGetSeedingGroup();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v2);

  v3 = _LSServer_CopyLocalDatabase(0);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_BYTE *)(a1 + 56)
    || (v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) == 0
    || (-[_LSDatabase isSeeded](v6) & 1) == 0)
  {
    v7 = MEMORY[0x1E0C809B0];
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = ___LSServer_RebuildApplicationDatabases_block_invoke_2;
    v13[3] = &unk_1E10411C0;
    v14 = *(id *)(a1 + 32);
    enumeratePlaceholderAndInstalledApplicationRecords(v13);
    +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    allAppexRecords();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendNotification:forApplicationExtensionRecords:", CFSTR("com.apple.LaunchServices.pluginswillberemoved"), v9);

    _LSResetServer();
    v10 = _LSServer_CopyLocalDatabase(0);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    _LSDatabaseSessionSetSeedingInProgress(1);
    _LSDatabaseSessionSetSeedingDueToManualRebuild(*(_BYTE *)(a1 + 57) != 0);

  }
}

void ___LSServer_RebuildApplicationDatabases_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "compatibilityObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[_LSBundleIdentifierAndType createRepresentingProxy:](_LSBundleIdentifierAndType, "createRepresentingProxy:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, v3);

}

void ___LSServer_RebuildApplicationDatabases_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *context;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  v34 = a3;
  _LSDatabaseSessionSetSeedingDueToManualRebuild(0);
  _LSDatabaseSessionSetSeedingInProgress(0);
  -[_LSDatabase setSeeded:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), 1);
  -[_LSDatabase setSeedingComplete:](*(_LSDatabase **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_BYTE *)(a1 + 80) != 0);
  _LSSaveImmediately(1);
  context = (void *)MEMORY[0x186DAE7A0]();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  allAppexRecords();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendNotification:forApplicationExtensionRecords:", CFSTR("com.apple.LaunchServices.pluginsregistered"), v7);

  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = ___LSServer_RebuildApplicationDatabases_block_invoke_4;
  v48[3] = &unk_1E1041210;
  v8 = v5;
  v49 = v8;
  v50 = *(id *)(a1 + 32);
  v51 = *(id *)(a1 + 40);
  v52 = *(id *)(a1 + 48);
  enumeratePlaceholderAndInstalledApplicationRecords(v48);
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v9 = *(id *)(a1 + 40);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v45;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v45 != v12)
            objc_enumerationMutation(v9);
          v14 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v13++), "plugInKitPlugins");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      }
      while (v11);
    }

    +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendNotification:forAppProxies:Plugins:completion:", 7, *(_QWORD *)(a1 + 40), 0, 0);

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = *(id *)(a1 + 32);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v41;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v20);
        if (v21 && (objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v20)) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v22);
          v23 = *(void **)(a1 + 64);
          objc_msgSend(v22, "bundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v24);

        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v18);
  }

  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v25 = *(id *)(a1 + 56);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v37;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          v30 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v29++), "plugInKitPlugins");
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
      }
      while (v27);
    }

    +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sendNotification:forAppProxies:Plugins:completion:", 8, *(_QWORD *)(a1 + 56), 0, 0);

  }
  objc_autoreleasePoolPop(context);
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sendDatabaseRebuiltNotification");

}

void ___LSServer_RebuildApplicationDatabases_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_LSBundleIdentifierAndType createRepresentingRecord:](_LSBundleIdentifierAndType, "createRepresentingRecord:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_5:
    v8 = *(void **)(a1 + 48);
    objc_msgSend(v3, "compatibilityObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    v10 = *(void **)(a1 + 56);
    objc_msgSend(v3, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "bundleModTime");
  if (v7 != objc_msgSend(v3, "_bundleModTime"))
  {
    if (objc_msgSend(v3, "isPlaceholder") && (objc_msgSend(v6, "isPlaceholder") & 1) == 0)
    {
      +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "compatibilityObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendNotification:forAppProxies:Plugins:completion:", 1, v14, 0, 0);

      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:

}

void ___LSServer_SyncWithMobileInstallation_block_invoke(uint64_t a1)
{
  id *v1;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[4];
  _QWORD v16[3];
  uint8_t buf[16];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[5];
  id v23;

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__4;
  v22[4] = __Block_byref_object_dispose__4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "dbRecoveryFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDatabaseCreateRecoveryFile(v3);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Will begin MobileInstallation item enumeration now", buf, 2u);
  }

  v5 = MEMORY[0x1E0C809B0];
  if (!MobileInstallationLibrary_frameworkLibrary)
  {
    MobileInstallationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MobileInstallation.framework/MobileInstallation", 2);
    if (!MobileInstallationLibrary_frameworkLibrary)
    {
      _LSInstallLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        ___LSServer_SyncWithMobileInstallation_block_invoke_cold_1();

      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 78, (uint64_t)"_LSServer_SyncWithMobileInstallation_block_invoke", 5919, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = 0;
        goto LABEL_7;
      }
    }
  }
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_2;
  v15[3] = &unk_1E10412D8;
  v16[1] = &v18;
  v16[2] = v22;
  v16[0] = *(id *)(a1 + 32);
  v1 = (id *)v16;
  v6 = (id)((uint64_t (*)(void *, void *))softLinkMobileInstallationEnumerateAllInstalledItemDictionaries[0])(0, v15);
  if (v6)
  {
    v7 = v6;
    v8 = 1;
LABEL_7:
    *((_BYTE *)v19 + 24) = 0;
    goto LABEL_11;
  }
  if (*((_BYTE *)v19 + 24))
  {
    _LSServer_DatabaseExecutionContext();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_5;
    v14[3] = &unk_1E10412B0;
    v14[4] = v22;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v9, v14);

  }
  v7 = 0;
  v8 = 1;
LABEL_11:
  _LSServer_DatabaseExecutionContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_6;
  v13[3] = &unk_1E10412B0;
  v13[4] = &v18;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v10, v13);

  _LSDatabaseClearSyncInterrupted();
  MEMORY[0x186DAF214]();
  do
    v11 = __ldaxr((unsigned __int8 *)&sMISyncFlag);
  while (__stlxr(v11 & 0x7F, (unsigned __int8 *)&sMISyncFlag));
  if (v8)

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);

}

void ___LSServer_SyncWithMobileInstallation_block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _LSEnumeratedBundleInfo *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _LSEnumeratedBundleInfo *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  os_unfair_lock_s *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  _QWORD v46[6];
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;

  v5 = a2;
  v6 = a3;
  if (v6)
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  objc_msgSend(v5, "objectForKey:", CFSTR("ApplicationType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C9AE78]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("User")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("System")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("VPNPlugin")))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("IsPlaceholder"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v12 = -[_LSEnumeratedBundleInfo initWithBundleID:isPlaceholder:]([_LSEnumeratedBundleInfo alloc], "initWithBundleID:isPlaceholder:", v8, v10);
    objc_msgSend(v11, "addObject:", v12);

    v13 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v5, "objectForKey:", CFSTR("Path"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initFileURLWithPath:isDirectory:", v14, 1);

    objc_msgSend(v5, "objectForKey:", CFSTR("ParallelPlaceholderPath"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v16, 1);
    else
      v17 = 0;
    v18 = a1[4];
    if (v18)
    {
      if (v15)
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v15);
      if (v17)
        (*(void (**)(void))(a1[4] + 16))();
    }
    v39 = v8;
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__807;
    v64 = __Block_byref_object_dispose__808;
    v65 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__807;
    v58 = __Block_byref_object_dispose__808;
    v59 = 0;
    _LSServer_DatabaseExecutionContext();
    v19 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_809;
    v47[3] = &unk_1E1041260;
    v48 = v5;
    v51 = &v60;
    v21 = v15;
    v49 = v21;
    v22 = v17;
    v23 = a1[6];
    v50 = v22;
    v52 = v23;
    v53 = &v54;
    -[LSDBExecutionContext syncRead:](v19, v47);

    if (v61[5] || v55[5])
    {
      _LSServer_DatabaseExecutionContext();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v20;
      v46[1] = 3221225472;
      v46[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_2_810;
      v46[3] = &unk_1E1041148;
      v46[4] = &v60;
      v46[5] = &v54;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v24, v46);

    }
    _Block_object_dispose(&v54, 8);

    _Block_object_dispose(&v60, 8);
    v8 = v39;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CoreServices")) & 1) != 0
         || objc_msgSend(v7, "isEqualToString:", CFSTR("Internal")))
  {
    v25 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v26 = -[_LSEnumeratedBundleInfo initWithBundleID:isPlaceholder:]([_LSEnumeratedBundleInfo alloc], "initWithBundleID:isPlaceholder:", v8, 0);
    objc_msgSend(v25, "addObject:", v26);

    v27 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v5, "objectForKey:", CFSTR("Path"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initFileURLWithPath:isDirectory:", v28, 1);

    v30 = a1[4];
    if (v30 && v29)
      (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v29);

  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("PluginKitPlugin")))
  {
    v31 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v5, "objectForKey:", CFSTR("Path"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initFileURLWithPath:isDirectory:", v32, 1);

    v34 = a1[4];
    if (v34 && v33)
      (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v33);
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__807;
    v64 = __Block_byref_object_dispose__808;
    v65 = 0;
    _LSServer_DatabaseExecutionContext();
    v35 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v36 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_3;
    v41[3] = &unk_1E1041288;
    v45 = &v60;
    v42 = v8;
    v37 = v33;
    v43 = v37;
    v44 = v5;
    -[LSDBExecutionContext syncRead:](v35, v41);

    if (v61[5])
    {
      _LSServer_DatabaseExecutionContext();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v36;
      v40[1] = 3221225472;
      v40[2] = ___LSServer_SyncWithMobileInstallation_block_invoke_4;
      v40[3] = &unk_1E10412B0;
      v40[4] = &v60;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v38, v40);

    }
    _Block_object_dispose(&v60, 8);

  }
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_809(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _LSEnumeratedBundleInfo *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v5 = a2;
  v6 = a3;
  v19 = 0;
  if (!_LSContextInit(&v19))
  {
    v7 = (void *)MEMORY[0x186DAE7A0]();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0C9AE78]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _getBlockToUpdateBundleRecordFromMIAndNotifyIfChanged((uint64_t *)&v19, v8, *(void **)(a1 + 40), *(void **)(a1 + 32));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (*(_QWORD *)(a1 + 48))
    {
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v13 = -[_LSEnumeratedBundleInfo initWithBundleID:isPlaceholder:]([_LSEnumeratedBundleInfo alloc], "initWithBundleID:isPlaceholder:", v8, 1);
      objc_msgSend(v12, "addObject:", v13);

      v14 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsPlaceholder"));
      objc_msgSend(*(id *)(a1 + 48), "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("Path"));

      objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsParallelPlaceholder"));
      _getBlockToUpdateBundleRecordFromMIAndNotifyIfChanged((uint64_t *)&v19, v8, *(void **)(a1 + 48), v14);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
    objc_autoreleasePoolPop(v7);
    _LSContextDestroy(&v19);
  }

}

void ___LSServer_SyncWithMobileInstallation_block_invoke_2_810(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

void ___LSServer_SyncWithMobileInstallation_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  FSNode *v13;
  uint64_t v14;
  BOOL v15;
  id v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *context;
  void *v27;
  id v28;
  int v29;
  _BYTE buf[24];
  const __CFString *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v27 = 0;
  if (!_LSContextInit(&v27))
  {
    context = (void *)MEMORY[0x186DAE7A0]();
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v9 = *(id *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    _LSDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "Checking if %@ needs to be registered at %@", buf, 0x16u);
    }

    v29 = 0;
    v13 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v10, 0, 0);
    if (v13)
    {
      v14 = _LSPluginFindWithInfo(v27, 0, 0, 0, v13, &v29, 0);
      if (v14)
      {
        *(_QWORD *)buf = 0;
        v28 = 0;
        v15 = -[FSNode getContentModificationDate:error:](v13, "getContentModificationDate:error:", buf, &v28, context);
        v16 = v28;
        if (v15)
        {
          if (*(_DWORD *)(v14 + 24) >= (int)*(double *)buf)
          {
            v22 = 0;
LABEL_21:
            v23 = MEMORY[0x186DAE9BC](v22);

            v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v25 = *(void **)(v24 + 40);
            *(_QWORD *)(v24 + 40) = v23;

            objc_autoreleasePoolPop(context);
            _LSContextDestroy(&v27);
            goto LABEL_22;
          }
          v17 = 1;
        }
        else
        {
          _LSDefaultLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            ___LSServer_SyncWithMobileInstallation_block_invoke_3_cold_2((uint64_t)v9);

          v17 = 0;
        }
LABEL_16:
        _LSDefaultLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = CFSTR("missing");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          if (v17)
            v21 = CFSTR("stale");
          *(_QWORD *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2112;
          v31 = v21;
          _os_log_impl(&dword_182882000, v20, OS_LOG_TYPE_DEFAULT, "Registering %@ (%@) because its record is %@", buf, 0x20u);
        }

        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = ___getBlockToUpdatePluginRecordFromMIAndNotifyIfChanged_block_invoke;
        v31 = (const __CFString *)&unk_1E1041398;
        v32 = v10;
        v33 = v9;
        v34 = v11;
        v22 = (void *)MEMORY[0x186DAE9BC](buf);

        goto LABEL_21;
      }
    }
    else
    {
      _LSDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        ___LSServer_SyncWithMobileInstallation_block_invoke_3_cold_1();

    }
    v17 = 0;
    v16 = 0;
    goto LABEL_16;
  }
LABEL_22:

}

uint64_t ___LSServer_SyncWithMobileInstallation_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  unsigned int v16;
  _BOOL4 v17;
  NSObject *v18;
  id v19;
  id v20;
  const __CFString *v21;
  id v22;
  id v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id obj;
  unsigned int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  void *v43;
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  void **v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  uint64_t v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  const __CFString *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v31 = a2;
  v32 = a3;
  v33 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v48 = (void **)&v47;
  v49 = 0x3812000000;
  v50 = __Block_byref_object_copy__935;
  v51 = __Block_byref_object_dispose__936;
  v52 = 256;
  v53 = 0;
  if (!_LSContextInit(&v53))
  {
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = ___uninstallMIBundlesNotInSet_block_invoke;
    v43 = &unk_1E1041590;
    v46 = &v47;
    v44 = v33;
    v45 = v5;
    _CSStoreEnumerateUnits();
    _LSContextDestroy(v48 + 6);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v59, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v37;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v12);
        v35 = 0;
        if (v13)
        {
          v14 = *(unsigned __int8 *)(v13 + 24);
          v15 = *(id *)(v13 + 16);
          if (v14)
            v16 = 1;
          else
            v16 = 2;
        }
        else
        {
          v15 = 0;
          v16 = 2;
        }
        v17 = _LSUnregisterAppWithBundleID(0, v15, v16, (int *)&v35, v6, v7, v8, v9) == 0;

        if (v17)
        {
          _LSDefaultLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            if (v13)
            {
              v22 = *(id *)(v13 + 16);
              v23 = v22;
              if (*(_BYTE *)(v13 + 24))
                v24 = CFSTR(" (placeholder)");
              else
                v24 = &stru_1E10473A0;

            }
            else
            {
              v23 = 0;
              v24 = &stru_1E10473A0;
            }
            *(_DWORD *)buf = 138412546;
            v56 = v23;
            v57 = 2112;
            v58 = v24;
            _os_log_impl(&dword_182882000, v18, OS_LOG_TYPE_DEFAULT, "Unregistered %@%@", buf, 0x16u);
          }
        }
        else
        {
          _LSDefaultLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            if (v13)
            {
              v19 = *(id *)(v13 + 16);
              v20 = v19;
              if (*(_BYTE *)(v13 + 24))
                v21 = CFSTR(" (placeholder)");
              else
                v21 = &stru_1E10473A0;

            }
            else
            {
              v20 = 0;
              v21 = &stru_1E10473A0;
            }
            *(_DWORD *)buf = 138412546;
            v56 = v20;
            v57 = 2112;
            v58 = v21;
            _os_log_error_impl(&dword_182882000, v18, OS_LOG_TYPE_ERROR, "Failed to unregister %@%@", buf, 0x16u);
          }
        }

        +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v26 = *(void **)(v13 + 8);
        else
          v26 = 0;
        v27 = v35;
        v28 = v26;
        v54 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sendNotification:forAppProxies:Plugins:completion:", v27, v29, 0, 0);

        ++v12;
      }
      while (v10 != v12);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v59, 16);
      v10 = v30;
    }
    while (v30);
  }

  _Block_object_dispose(&v47, 8);
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _LSDatabase *v9;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "MobileInstallation reported PartialResultsReturned = YES, setting incomplete seed flag", buf, 2u);
    }

    v9 = 0;
    if (!_LSContextInit((id *)&v9))
      -[_LSDatabase setSeedingComplete:](v9, *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 0);

  }
  _LSSaveImmediately(1);
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "dbRecoveryFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDatabaseDeleteRecoveryFile(v8);

}

void ___LSServer_ExecuteSyncWithQuiescedInstallationActivity_block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  _LSDatabaseGetInstallingGroup();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  v3 = (void *)MEMORY[0x186DAE7A0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v3);
}

uint64_t ___LSServer_LSEnumerateAndRegisterAllCryptexContentWithContext_block_invoke(uint64_t a1, void *a2)
{
  _LSServer_LSRegisterICLItem(a2, *(void **)(a1 + 32));
  return 1;
}

void ___LSServer_DisplayRemovedAppPrompt_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CFOptionFlags v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CFUserNotificationRef v22;
  CFUserNotificationRef v23;
  uint64_t v24;
  void *v25;
  id v26;
  __CFUserNotification *v27;
  char v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void (**v33)(id, _QWORD, id);
  os_unfair_lock_s *v34;
  SInt32 v35;
  id v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  os_unfair_lock_s *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  SInt32 error;
  uint64_t v48;
  const __CFString *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  CFOptionFlags responseFlags[4];
  __int128 buf;
  void (*v54)(uint64_t);
  void *v55;
  id v56;
  void (**v57)(id, _QWORD, id);
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v44 = v5;
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v7 = *(id *)(a1 + 32);
    v45 = v7;
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "Showing removed app prompt for %@", (uint8_t *)&buf, 0xCu);
    }

    _LSGetAppRemovalPromptStringForKey(CFSTR("Restore “%@”?"), CFSTR("APP_REMOVAL_PROMPT_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSGetAppRemovalPromptStringForKey(CFSTR("To continue, download “%@” from the App Store."), CFSTR("APP_REMOVAL_PROMPT_DETAIL_Default"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0C9B810];
    responseFlags[0] = *MEMORY[0x1E0C9B800];
    responseFlags[1] = v13;
    *(_QWORD *)&buf = v10;
    *((_QWORD *)&buf + 1) = v12;
    responseFlags[2] = *MEMORY[0x1E0C9B820];
    responseFlags[3] = (CFOptionFlags)CFSTR("SBUserNotificationDontDismissOnUnlock");
    v54 = (void (*)(uint64_t))MEMORY[0x1E0C9AAA0];
    v55 = (void *)MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, responseFlags, 4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v6)
    {
      v16 = (void *)v14;
    }
    else
    {
      _LSGetAppRemovalPromptStringForKey(CFSTR("Cancel"), CFSTR("CANCEL_BUTTON"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _LSGetAppRemovalPromptStringForKey(CFSTR("Show in App Store"), CFSTR("SHOW_IN_STORE_BUTTON"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      v20 = *MEMORY[0x1E0C9B830];
      v50[0] = *MEMORY[0x1E0C9B838];
      v50[1] = v20;
      v51[0] = v19;
      v51[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addEntriesFromDictionary:", v21);

    }
    error = -1;
    v22 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, &error, (CFDictionaryRef)v16);
    v23 = v22;
    if (v22)
    {
      if (!error)
      {
        v27 = (__CFUserNotification *)CFRetain(v22);
        v26 = 0;
        v28 = 0;
LABEL_13:

        if ((v28 & 1) == 0)
          CFRelease(v23);

        v29 = v26;
        if (!v27)
        {
          v38 = v29;
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_26:

          v17 = v44;
          goto LABEL_27;
        }
        v46 = v29;
        v30 = *(void **)(a1 + 56);
        v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        v32 = *(id *)(a1 + 40);
        v33 = v30;
        responseFlags[0] = 0;
        _LSServer_DatabaseExecutionContext();
        v34 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
        -[LSDBExecutionContext assertNotActiveForThisThread](v34);

        v35 = CFUserNotificationReceiveResponse(v27, 0.0, responseFlags);
        if (v35)
        {
          v51[0] = *MEMORY[0x1E0CB2938];
          *(_QWORD *)&buf = CFSTR("CFUserNotificationReceiveResponse() failed.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, v51, 1);
          v36 = (id)objc_claimAutoreleasedReturnValue();
          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2D98], v35, (uint64_t)"_LSDisplayRemovedAppPrompt", 229, v36);
          v37 = (id)objc_claimAutoreleasedReturnValue();
          v33[2](v33, 0, v37);
        }
        else
        {
          if (v31 || (responseFlags[0] & 3) != 0)
          {
            _LSDefaultLog();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138477827;
              *(_QWORD *)((char *)&buf + 4) = v32;
              _os_log_impl(&dword_182882000, v39, OS_LOG_TYPE_DEFAULT, "User cancelled restoring system app %{private}@", (uint8_t *)&buf, 0xCu);
            }

            v33[2](v33, 1, 0);
            goto LABEL_25;
          }
          v36 = objc_alloc_init(MEMORY[0x1E0CB3998]);
          objc_msgSend(v36, "setScheme:", CFSTR("itms-apps"));
          objc_msgSend(v36, "setHost:", &stru_1E10473A0);
          v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("bundleIdentifier"), v32);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v40);

          objc_msgSend(v36, "setQueryItems:", v37);
          objc_msgSend(v36, "URL");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          _LSServer_DatabaseExecutionContext();
          v42 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v54 = ___ZL26_LSDisplayRemovedAppPromptP20__CFUserNotificationP8NSStringP5NSURL18LSAppRestoreSourceU13block_pointerFvbP7NSErrorE_block_invoke;
          v55 = &unk_1E10417E0;
          v43 = v41;
          v56 = v43;
          v57 = v33;
          -[LSDBExecutionContext syncRead:](v42, &buf);

        }
LABEL_25:

        CFRelease(v27);
        v38 = v46;
        goto LABEL_26;
      }
      CFRelease(v22);
    }
    v24 = error;
    v48 = *MEMORY[0x1E0CB2938];
    v49 = CFSTR("CFUserNotificationCreate() failed.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2D98], v24, (uint64_t)"_LSCreateRemovedAppPrompt", 174, v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v27 = 0;
    v28 = 1;
    goto LABEL_13;
  }
  v17 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_27:

}

void ___LSServer_BeginProvidingVisualizationArchives_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.lsd.internal.store-visualizations", v2);
  v1 = (void *)_LSServer_BeginProvidingVisualizationArchives::visualizationQueue;
  _LSServer_BeginProvidingVisualizationArchives::visualizationQueue = (uint64_t)v0;

}

id ___LSServer_BeginProvidingVisualizationArchives_block_invoke_2()
{
  os_unfair_lock_s *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__39;
  v8 = __Block_byref_object_dispose__40;
  v9 = 0;
  _LSServer_DatabaseExecutionContext();
  v0 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___LSServer_BeginProvidingVisualizationArchives_block_invoke_41;
  v3[3] = &unk_1E1042DD8;
  v3[4] = &v4;
  -[LSDBExecutionContext syncRead:](v0, v3);

  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void ___LSServer_BeginProvidingVisualizationArchives_block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _LSDServiceDomain *v7;
  uint64_t *v8;
  const void *MutableCopy;
  void *v10;
  void *SessionKey;
  id *v12;
  id *v13;
  void *Visualizer;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id *v19;
  void **v20;
  id v21;
  char v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v20, v7, 0);

  if (v8)
  {
    MutableCopy = (const void *)CSStoreCreateMutableCopy();
    if (MutableCopy)
    {
      _LSDatabaseGetNode(*v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SessionKey = (void *)_LSDatabaseGetSessionKey(*v8);
      v12 = _LSDatabaseCreateWithAccessContext(v10, SessionKey, MutableCopy, 0, 0);

      if (v12)
      {
        v13 = v12;
        v19 = v13;
        Visualizer = _LSContextCreateVisualizer((id *)&v19);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = Visualizer;

      }
      CFRelease(MutableCopy);
    }
  }
  if (v20 && v22)
    _LSContextDestroy(v20);
  v17 = v21;
  v20 = 0;
  v21 = 0;

  v22 = 0;
  v18 = v23;
  v23 = 0;

}

void ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  _LSDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_cold_1(v2);

  _LSServer_RebuildApplicationDatabases(1, 1, 1, 1, 0);
  _LSServer_DatabaseExecutionContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_2;
  v4[3] = &unk_1E103FC48;
  v5 = *(id *)(a1 + 32);
  -[LSDBExecutionContext syncWrite:]((uint64_t)v3, v4);

}

void ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_2()
{
  _LSArmSaveTimer(5);
}

void ___LSServer_PerformOpenOperation_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "LaunchServices: [Perform] not launching application - result = %{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  MEMORY[0x186DAF214](v7);

}

void ___LSServer_PerformOpenOperation_block_invoke_72(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  __int128 v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  char v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  _QWORD v60[2];
  void (*v61)(uint64_t, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, void *);
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  char v72;
  BOOL v73;
  id v74;
  id v75;
  __int128 buf;
  __int128 v77;
  id v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v59 = *(id *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  objc_msgSend(v4, "objectForKeyedSubscript:", getFBSOpenApplicationOptionKeyPayloadURL());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isEqual:", v3))
    {
      v58 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v58, "removeObjectForKey:", getFBSOpenApplicationOptionKeyPayloadURL());

      v7 = 0;
      v8 = 0;
      goto LABEL_9;
    }
    _LSDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      ___LSServer_PerformOpenOperation_block_invoke_72_cold_1();

    v75 = (id)*MEMORY[0x1E0CB2938];
    *(_QWORD *)&buf = CFSTR("FBSOpenApplicationOptionKeyPayloadURL did not match input URL, making the open request ambiguous");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, &v75, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"_LSOpenOperationMassageOpenOptionsOrFail", 219, v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v7 = 1;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v58 = v4;
LABEL_9:

  v11 = v8;
  if ((v7 & 1) != 0)
  {
    v12 = v11;
    goto LABEL_54;
  }
  v56 = v11;
  v13 = *(void **)(a1 + 40);
  v14 = *(unsigned __int8 *)(a1 + 136);
  v15 = *(id *)(a1 + 56);
  v16 = v13;
  v17 = *(_OWORD *)(a1 + 120);
  buf = *(_OWORD *)(a1 + 104);
  v77 = v17;
  v57 = v16;
  if (!objc_msgSend(v16, "isFileURL"))
  {
    v21 = 0;
    v19 = 0;
    v23 = 1;
    v55 = v59;
LABEL_48:
    v36 = v56;
    goto LABEL_50;
  }
  objc_msgSend(v57, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[LSDocumentProxy documentProxyForURL:isContentManaged:sourceAuditToken:](LSDocumentProxy, "documentProxyForURL:isContentManaged:sourceAuditToken:", v57, v14 != 0, &buf);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  v53 = v20;
  objc_msgSend(v20, "applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:", 2, -1, v15, &v75);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v75;
  if (v59 && objc_msgSend(v59, "length"))
  {
    +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v59);
    v55 = v59;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v54 || !objc_msgSend(v54, "count"))
    {
      v22 = 0;
      v55 = v59;
      goto LABEL_24;
    }
    objc_msgSend(v54, "objectAtIndex:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bundleIdentifier");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v24;
  }
  if (v54 && v22 && (objc_msgSend(v54, "containsObject:", v22) & 1) != 0)
  {
    v25 = 1;
    goto LABEL_41;
  }
LABEL_24:
  objc_msgSend(v19, "pathExtension");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v26;
  if (v26 && (objc_msgSend(v26, "isEqualToString:", CFSTR("zip"), v26) & 1) != 0)
  {
    objc_msgSend(v19, "stringByDeletingPathExtension");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pathExtension");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length") == 0;

    if (!v29)
    {
      v30 = v27;

      v19 = v30;
      +[LSDocumentProxy documentProxyForName:type:MIMEType:isContentManaged:sourceAuditToken:](LSDocumentProxy, "documentProxyForName:type:MIMEType:isContentManaged:sourceAuditToken:", v30, 0, 0, v14 != 0, &buf);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = v21;
      v53 = v31;
      objc_msgSend(v31, "applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:", 2, -1, v15, &v74);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v74;

      v21 = v33;
      v54 = v32;
      if (v22 || !v32)
      {
        if (!v32)
          goto LABEL_38;
      }
      else if (objc_msgSend(v32, "count"))
      {
        objc_msgSend(v32, "objectAtIndex:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "bundleIdentifier");
        v55 = (id)objc_claimAutoreleasedReturnValue();
        v22 = v34;
      }
      else
      {
        v22 = 0;
      }
      if ((objc_msgSend(v54, "containsObject:", v22) & 1) != 0)
      {
        v25 = 1;
LABEL_39:
        v27 = v19;
        goto LABEL_40;
      }
LABEL_38:
      v25 = 0;
      goto LABEL_39;
    }
    v25 = 0;
  }
  else
  {
    v25 = 0;
    v27 = 0;
  }
LABEL_40:

LABEL_41:
  if (v21)
    v35 = 1;
  else
    v35 = v25;
  if ((v35 & 1) == 0)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"_LSIsRequestValid", 742, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((v25 & 1) != 0)
  {
    v23 = 1;
    goto LABEL_48;
  }
  v36 = objc_retainAutorelease(v21);
  v23 = 0;
  v21 = v36;
LABEL_50:

  v37 = v55;
  v12 = v36;

  if (v23)
  {
    v38 = *(void **)(a1 + 40);
    v39 = MEMORY[0x1E0C809B0];
    v40 = *(void **)(a1 + 56);
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3321888768;
    v61 = ___LSServer_PerformOpenOperation_block_invoke_2;
    v62 = &unk_1E103E0C0;
    v70 = *(id *)(a1 + 96);
    v63 = *(id *)(a1 + 40);
    v64 = *(id *)(a1 + 64);
    v41 = v37;
    v65 = v41;
    v73 = v59 != 0;
    v66 = *(id *)(a1 + 72);
    v67 = *(id *)(a1 + 80);
    v71 = v58;
    v72 = 1;
    v68 = *(id *)(a1 + 88);
    v69 = *(id *)(a1 + 56);
    v42 = v38;
    v43 = v71;
    v44 = v40;
    v45 = v60;
    v46 = v45;
    v59 = v41;
    if (v41)
    {
      ((void (*)(_QWORD *, _QWORD))v61)(v45, 0);
LABEL_67:

      if (v72)
      goto LABEL_70;
    }
    v48 = objc_opt_class();
    objc_msgSend(v43, "objectForKey:", CFSTR("NoOverrides"));
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)v49;
    if (v48 && v49)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v50 = 0;
        goto LABEL_65;
      }
    }
    else if (!v49)
    {
      goto LABEL_65;
    }
    if (objc_msgSend(v50, "BOOLValue", v52))
    {
      ((void (*)(void *, _QWORD))v61)(v46, 0);
LABEL_66:

      goto LABEL_67;
    }
LABEL_65:
    +[LSAppLink _dispatchQueue](LSAppLink, "_dispatchQueue", v52);
    v51 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v39;
    *((_QWORD *)&buf + 1) = 3221225472;
    *(_QWORD *)&v77 = ___ZL19_LSTryUniversalLinkP5NSURLP8NSStringP12NSDictionaryIS2_P11objc_objectEP15NSXPCConnectionU13block_pointerFvbE_block_invoke;
    *((_QWORD *)&v77 + 1) = &unk_1E10447A0;
    v78 = v42;
    v79 = v44;
    v80 = v43;
    v81 = v46;
    dispatch_async(v51, &buf);

    goto LABEL_66;
  }
  v59 = v37;
LABEL_54:
  _LSDefaultLog();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_182882000, v47, OS_LOG_TYPE_DEFAULT, "Invalid LSOpenOperation request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  if ((v7 & 1) == 0)
LABEL_70:

}

void ___LSServer_PerformOpenOperation_block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
  else if (*(_BYTE *)(a1 + 104))
  {
    _LSOpenOperationPerform(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 112), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 96), *(void **)(a1 + 72), *(void **)(a1 + 80), *(void **)(a1 + 88));
  }
  else
  {
    std::__throw_bad_optional_access[abi:nn180100]();
    _LSOpenOperationPerform(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
  }
}

void ___LSServer_OpenUserActivity_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2 || *(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 48);
    if (v3)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        v4 = *(void **)(a1 + 40);
        v5 = v2;
        v6 = v4;
        v7 = v3;
        if (UIKitLibrary(void)::frameworkLibrary
          || (UIKitLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2)) != 0)
        {
          if (!(v5 | v6))
          {
            v23 = *MEMORY[0x1E0CB2938];
            v24[0] = CFSTR("invalid input parameters");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"_LSGetBSActionForUserActivity", 1296, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_21;
          }
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (v8)
          {
            if (v6)
            {
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, &unk_1E1075780);
            }
            else
            {
              objc_msgSend((id)v5, "UUIDString");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, &unk_1E1075798);

            }
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, &unk_1E10757B0);
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, &unk_1E10757C8);
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, &unk_1E10757E0);

            v12 = (void *)objc_msgSend(objc_alloc((Class)getUIActivityContinuationActionClass()), "initWithSettings:", v9);
            if (v12)
            {

              v18 = 0;
              v19 = 0;
              goto LABEL_22;
            }
            _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10810, (uint64_t)"_LSGetBSActionForUserActivity", 1288, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
            v19 = objc_retainAutorelease(v14);

            v12 = 0;
            v18 = 1;
LABEL_22:

            v11 = v19;
            if ((v18 & 1) != 0)
            {
              v20 = *(_QWORD *)(a1 + 96);
              if (v20)
                (*(void (**)(uint64_t, _QWORD, id))(v20 + 16))(v20, 0, v11);
            }
            else
            {
              _LSServer_OpenApplicationCommon(*(void **)(a1 + 56), v12, *(unsigned __int8 *)(a1 + 104), *(void **)(a1 + 64), *(void **)(a1 + 72), *(void **)(a1 + 80), 5uLL, *(void **)(a1 + 88), *(void **)(a1 + 96));
            }
            goto LABEL_26;
          }
          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -41, (uint64_t)"_LSGetBSActionForUserActivity", 1292, 0);
          v15 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"_LSGetBSActionForUserActivity", 1300, 0);
          v15 = objc_claimAutoreleasedReturnValue();
        }
        v14 = (void *)v15;
        goto LABEL_21;
      }
    }
  }
  v10 = *(_QWORD *)(a1 + 96);
  if (!v10)
    return;
  v21 = *MEMORY[0x1E0CB2938];
  v22 = CFSTR("invalid input parameters");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"_LSServer_OpenUserActivity_block_invoke", 326, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v12);
LABEL_26:

}

void ___LSServer_GetIOQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.lsd.registrationIO", v2);
  v1 = (void *)_LSServer_GetIOQueue::result;
  _LSServer_GetIOQueue::result = (uint64_t)v0;

}

void ___LSServer_GetAsyncWorkQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2 = objc_claimAutoreleasedReturnValue();
    v0 = dispatch_queue_create("com.apple.lsd.server.asyncwork", v2);
    v1 = (void *)_LSServer_GetAsyncWorkQueue::result;
    _LSServer_GetAsyncWorkQueue::result = (uint64_t)v0;

  }
}

void ___LSServer_RegisterItemInfo_block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DistributedCenter;
  const __CFDictionary *v3;
  __CFString *name;

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  objc_msgSend(*(id *)(a1 + 32), "name");
  name = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterPostNotification(DistributedCenter, name, 0, v3, 1u);

}

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "couldn't connect to database when refreshing plugins: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___LSServer_RefreshContentInFrameworkAtURL_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "couldn't remove stale framework bundles: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  _BOOL4 v3;
  _BOOL4 v4;
  _DWORD v5[2];
  __int16 v6;
  _BOOL4 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_BYTE *)(*(_QWORD *)a1 + 24) == 0;
  v4 = *(_BYTE *)(*(_QWORD *)a2 + 24) == 0;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "ICL error, enumerating system (%d) or other (%d) content", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_1();
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "failed to enumerate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_750_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "error enumerating system content! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___LSServer_LSEnumerateAndRegisterAllBundles_block_invoke_754_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_4_1(&dword_182882000, v0, v1, "could not write out system content database! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "MobileInstallation framework is not available! Enumeration will fail.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_3_cold_1()
{
  os_log_t v0;
  uint8_t v1[22];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_12_0();
  v2 = 2114;
  v3 = 0;
  _os_log_error_impl(&dword_182882000, v0, OS_LOG_TYPE_ERROR, "Couldn't determine if record for %{private}@ needed to be updated, failed to create FSNode for %{private}@: %{public}@", v1, 0x20u);
  OUTLINED_FUNCTION_16();
}

void ___LSServer_SyncWithMobileInstallation_block_invoke_3_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138478083;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v1, v2, "Couldn't get mod date for bundle %{private}@, so forcing update: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void ___LSServer_GetServerStoreForConnectionWithCompletionHandler_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Local database is invalid, rebuilding.", v1, 2u);
}

void ___LSServer_PerformOpenOperation_block_invoke_72_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Caller specified open of URL %@ but also specified URL %@ in launch options, which are not the same URL!");
  OUTLINED_FUNCTION_1();
}

@end
