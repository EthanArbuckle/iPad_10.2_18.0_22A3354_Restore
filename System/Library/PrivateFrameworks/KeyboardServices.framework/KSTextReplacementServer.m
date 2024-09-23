@implementation KSTextReplacementServer

void __62___KSTextReplacementServer_queryTextReplacementsWithCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!+[_KSTextReplacementHelper validateTextReplacement:](_KSTextReplacementHelper, "validateTextReplacement:", v10, (_QWORD)v16))objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v12 = v11;
  KSCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v21 = "-[_KSTextReplacementServer queryTextReplacementsWithCallback:]_block_invoke_2";
    v22 = 2112;
    v23 = v14;
    v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_21DFEB000, v13, OS_LOG_TYPE_INFO, "%s  time spent reading %@ entries is %@", buf, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62___KSTextReplacementServer_queryTextReplacementsWithCallback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "textReplacementManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textReplacementManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __62___KSTextReplacementServer_queryTextReplacementsWithCallback___block_invoke_2;
    v6[3] = &unk_24E204950;
    v7 = v3;
    v8 = *(id *)(a1 + 40);
    v5 = v3;
    objc_msgSend(v4, "queryTextReplacementsWithCallback:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __49___KSTextReplacementServer_textReplacementServer__block_invoke()
{
  _KSTextReplacementServer *v0;
  void *v1;

  v0 = objc_alloc_init(_KSTextReplacementServer);
  v1 = (void *)textReplacementServer_sharedInstance;
  textReplacementServer_sharedInstance = (uint64_t)v0;

}

uint64_t __58___KSTextReplacementServer_initWithDatabaseDirectoryPath___block_invoke(uint64_t a1)
{
  CFNotificationCenterRef DarwinNotifyCenter;
  __CFNotificationCenter *v3;
  const void *v4;
  __CFString *v5;

  objc_msgSend(*(id *)(a1 + 32), "registerForPushNotifications");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
  {
    v3 = DarwinNotifyCenter;
    v4 = *(const void **)(a1 + 32);
    getBYSetupAssistantExitedDarwinNotification();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v3, v4, (CFNotificationCallback)bySetupAssistantExited, v5, 0, CFNotificationSuspensionBehaviorDrop);

  }
  return objc_msgSend(*(id *)(a1 + 32), "scheduleSyncTask");
}

void __44___KSTextReplacementServer_scheduleSyncTask__block_invoke(uint64_t a1)
{
  _KSSystemTask *v2;
  _KSSystemTask *v3;
  void *v4;
  _QWORD v5[5];

  v2 = [_KSSystemTask alloc];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_2;
  v5[3] = &unk_24E205C10;
  v5[4] = *(_QWORD *)(a1 + 32);
  v3 = -[_KSSystemTask initWithName:isPeriodic:period:handler:](v2, "initWithName:isPeriodic:period:handler:", CFSTR("com.apple.KeyboardServices.TextReplacementCKSyncTask"), 1, 86400, v5);
  -[_KSSystemTask setMaxRunTime:](v3, "setMaxRunTime:", 60.0);
  +[_KSTaskScheduler sharedInstance](_KSTaskScheduler, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerTask:", v3);

}

void __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_3;
  v7[3] = &unk_24E204BB8;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_4;
  v2[3] = &unk_24E205BE8;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "requestSync:withCompletionBlock:", 4, v2);

}

void __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[_KSTextReplacementServer scheduleSyncTask]_block_invoke_4";
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  completed periodic sync task", buf, 0xCu);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 8);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_32;
  v6[3] = &unk_24E204BB8;
  v6[4] = v3;
  v7 = v4;
  dispatch_async(v5, v6);

}

uint64_t __44___KSTextReplacementServer_scheduleSyncTask__block_invoke_32(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "textReplacementManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordSyncStatus");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54___KSTextReplacementServer_setTextReplacementManager___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

void __35___KSTextReplacementServer_cleanup__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "textReplacementManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumUptimeRemaining");
  v4 = v3;

  if (v4 <= 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performCleanup");
  }
  else
  {
    KSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v12 = "-[_KSTextReplacementServer cleanup]_block_invoke";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_21DFEB000, v5, OS_LOG_TYPE_INFO, "%s  not cleanin up, waiting remaining minimum uptime: %@", buf, 0x16u);

    }
    v7 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35___KSTextReplacementServer_cleanup__block_invoke_38;
    block[3] = &unk_24E204790;
    block[4] = v8;
    dispatch_after(v7, v9, block);
  }
}

uint64_t __35___KSTextReplacementServer_cleanup__block_invoke_38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performCleanup");
}

uint64_t __36___KSTextReplacementServer_shutdown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performCleanup");
}

void __85___KSTextReplacementServer_addEntries_removeEntries_forClient_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  ArraySlicer *v3;
  ArraySlicer *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int64_t v26;
  int64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  ArraySlicer *v59;
  ArraySlicer *v60;
  void *v61;
  void *v62;
  id obj;
  void *v64;
  _QWORD v65[4];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2207A8B6C]();
  v3 = -[ArraySlicer initWithArray:sliceSize:]([ArraySlicer alloc], "initWithArray:sliceSize:", *(_QWORD *)(a1 + 32), 100);
  v4 = -[ArraySlicer initWithArray:sliceSize:]([ArraySlicer alloc], "initWithArray:sliceSize:", *(_QWORD *)(a1 + 40), 100);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v3;
  -[ArraySlicer nextSlice](v3, "nextSlice");
  v6 = objc_claimAutoreleasedReturnValue();
  v59 = v4;
  -[ArraySlicer nextSlice](v4, "nextSlice");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 | v7)
  {
    v8 = v7;
    v55 = v2;
    v58 = a1;
    while (1)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v10 = (id)v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v72;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v72 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
            objc_msgSend(v15, "cloudID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
        }
        while (v12);
      }
      v61 = v10;

      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      obj = (id)v6;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v68;
        v64 = v9;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v68 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
            objc_msgSend(v21, "priorValue");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEquivalentTo:", v21);

            if (v23)
            {
              objc_msgSend(v21, "priorValue");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "cloudID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "removeObjectForKey:", v25);

            }
            else
            {
              v26 = +[_KSTextReplacementHelper validateTextReplacement:](_KSTextReplacementHelper, "validateTextReplacement:", v21);
              if (v26)
              {
                v27 = v26;
                objc_msgSend(v21, "priorValue");
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                {
                  KSCategory();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v21, "priorValue");
                    v30 = v5;
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "cloudID");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "objectForKeyedSubscript:", v32);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315394;
                    v76 = "-[_KSTextReplacementServer addEntries:removeEntries:forClient:withCompletionHandler:]_block_invoke";
                    v77 = 2112;
                    v78 = v33;
                    _os_log_impl(&dword_21DFEB000, v29, OS_LOG_TYPE_INFO, "%s  >>> Not removing entry: %@, as the replacement entry is not valid", buf, 0x16u);

                    v9 = v64;
                    v5 = v30;
                  }

                  objc_msgSend(v21, "priorValue");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "cloudID");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "removeObjectForKey:", v35);

                }
                +[_KSTextReplacementHelper errorWithCode:forEntry:](_KSTextReplacementHelper, "errorWithCode:forEntry:", v27, v21);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addObject:", v36);

              }
              else
              {
                objc_msgSend(v62, "addObject:", v21);
              }
              objc_msgSend(v21, "cloudID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "priorValue");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "cloudID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v37, "isEqualToString:", v39);

              if (v40)
              {
                KSCategory();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v76 = "-[_KSTextReplacementServer addEntries:removeEntries:forClient:withCompletionHandler:]_block_invoke";
                  _os_log_impl(&dword_21DFEB000, v41, OS_LOG_TYPE_INFO, "%s  >>> the modified entry's unique ID should not be the same as prior, changing", buf, 0xCu);
                }

                objc_msgSend(v21, "uniqueID");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setCloudID:", v42);

              }
              +[_KSTextReplacementHelper extractAggdMetricsForTextReplacement:](_KSTextReplacementHelper, "extractAggdMetricsForTextReplacement:", v21);
              v9 = v64;
            }
          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
        }
        while (v18);
      }

      a1 = v58;
      if (objc_msgSend(*(id *)(v58 + 48), "generation") != *(_QWORD *)(v58 + 72))
        break;
      objc_msgSend(*(id *)(v58 + 56), "textReplacementManager");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
        break;
      KSCategory();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "allValues");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v76 = "-[_KSTextReplacementServer addEntries:removeEntries:forClient:withCompletionHandler:]_block_invoke";
        v77 = 2112;
        v78 = v62;
        v79 = 2112;
        v80 = v45;
        _os_log_impl(&dword_21DFEB000, v44, OS_LOG_TYPE_INFO, "%s  >>> adding entries: %@, removing entries %@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(v58 + 56), "textReplacementManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allValues");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __85___KSTextReplacementServer_addEntries_removeEntries_forClient_withCompletionHandler___block_invoke_43;
      v65[3] = &unk_24E204E88;
      v66 = v5;
      objc_msgSend(v46, "addEntries:removeEntries:withCompletionHandler:", v62, v47, v65);

      -[ArraySlicer nextSlice](v60, "nextSlice");
      v6 = objc_claimAutoreleasedReturnValue();

      -[ArraySlicer nextSlice](v59, "nextSlice");
      v8 = objc_claimAutoreleasedReturnValue();

      if (!(v6 | v8))
      {
        v48 = 0;
        v2 = v55;
        goto LABEL_38;
      }
    }
    -[ArraySlicer unconsumed](v60, "unconsumed");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ArraySlicer unconsumed](v59, "unconsumed");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v56;
    if (objc_msgSend(v50, "count"))
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v50, CFSTR("_KSTextReplacementUpdateDidFailEntriesKey"));
    if (objc_msgSend(v51, "count"))
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v51, CFSTR("_KSTextReplacementDeleteDidFailEntriesKey"));

    v48 = 11;
    v2 = v55;
  }
  else
  {
    v48 = 0;
LABEL_38:
    v49 = v56;
  }
  if (objc_msgSend(v5, "count") || objc_msgSend(v57, "count"))
  {
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v5, CFSTR("_KSTextReplacementUpdateDidFailErrorsKey"));
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v57, CFSTR("_KSTextReplacementDeleteDidFailErrorsKey"));
    v48 = 11;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("KSTextReplacementErrorDomain"), v48, v49);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 56), "textReplacementManager");
  v53 = v49;
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "requestSync:withCompletionBlock:", 0, &__block_literal_global_46_0);

  objc_autoreleasePoolPop(v2);
}

uint64_t __85___KSTextReplacementServer_addEntries_removeEntries_forClient_withCompletionHandler___block_invoke_43(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

void __44___KSTextReplacementServer_removeAllEntries__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x2207A8B6C]();
  objc_msgSend(*(id *)(a1 + 32), "textReplacementManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllEntries");

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "textReplacementManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestSync:withCompletionBlock:", 0, &__block_literal_global_48);

  objc_autoreleasePoolPop(v2);
}

void __44___KSTextReplacementServer_removeAllEntries__block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[_KSTextReplacementServer removeAllEntries]_block_invoke_2";
    _os_log_impl(&dword_21DFEB000, v0, OS_LOG_TYPE_INFO, "%s  >>> completed remove all TR entries", (uint8_t *)&v1, 0xCu);
  }

}

void __60___KSTextReplacementServer_requestSync_withCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "textReplacementManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestSync:withCompletionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __60___KSTextReplacementServer_textReplacementEntriesForClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "textReplacementManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textReplacementEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (!+[_KSTextReplacementHelper validateTextReplacement:](_KSTextReplacementHelper, "validateTextReplacement:", v9, (_QWORD)v10))objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __72___KSTextReplacementServer_queryTextReplacementsWithPredicate_callback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "textReplacementManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textReplacementManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __72___KSTextReplacementServer_queryTextReplacementsWithPredicate_callback___block_invoke_2;
    v7[3] = &unk_24E204950;
    v8 = v3;
    v5 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v6 = v3;
    objc_msgSend(v4, "queryTextReplacementsWithPredicate:callback:", v5, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __72___KSTextReplacementServer_queryTextReplacementsWithPredicate_callback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!+[_KSTextReplacementHelper validateTextReplacement:](_KSTextReplacementHelper, "validateTextReplacement:", v10, (_QWORD)v16))objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v12 = v11;
  KSCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v21 = "-[_KSTextReplacementServer queryTextReplacementsWithPredicate:callback:]_block_invoke_2";
    v22 = 2112;
    v23 = v14;
    v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_21DFEB000, v13, OS_LOG_TYPE_INFO, "%s  time spent reading %@ entries is %@", buf, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63___KSTextReplacementServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExportedObject:", 0);

}

void __65___KSTextReplacementServer_connection_didReceiveIncomingMessage___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[_KSTextReplacementServer connection:didReceiveIncomingMessage:]_block_invoke";
    _os_log_impl(&dword_21DFEB000, v0, OS_LOG_TYPE_INFO, "%s  >>> PUSH notif received, completed pulling TR entries", (uint8_t *)&v1, 0xCu);
  }

}

@end
