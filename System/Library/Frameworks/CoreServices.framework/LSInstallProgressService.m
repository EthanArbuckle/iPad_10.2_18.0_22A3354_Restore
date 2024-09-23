@implementation LSInstallProgressService

void __41___LSInstallProgressService_addObserver___block_invoke_2(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x186DAE7A0]();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v3 = *(_BYTE **)(a1 + 32);
    if (v3[96])
      objc_msgSend(v3, "dispatchJournalledNotificationsToObserver:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_201_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationInstallsArePrioritized:arePaused:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_autoreleasePoolPop(v2);
}

uint64_t __41___LSInstallProgressService_addObserver___block_invoke(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]) ^ 1;
  return objc_msgSend(*(id *)(a1[4] + 8), "addObject:", a1[5]);
}

void __43___LSInstallProgressService_sharedInstance__block_invoke()
{
  _LSInstallProgressService *v0;
  void *v1;

  v0 = objc_alloc_init(_LSInstallProgressService);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

void __43___LSInstallProgressService_beginListening__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performJournalRecovery");
  objc_msgSend(v4, "loadProportions");
  v0 = objc_alloc(MEMORY[0x1E0CB3B58]);
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "serviceNameForConnectionType:", 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithMachServiceName:", v1);
  v3 = (void *)beginListening_listener_0;
  beginListening_listener_0 = v2;

  objc_msgSend((id)beginListening_listener_0, "setDelegate:", v4);
  objc_msgSend((id)beginListening_listener_0, "resume");

}

uint64_t __33___LSInstallProgressService_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "restoreInactiveInstalls");
}

void __33___LSInstallProgressService_init__block_invoke_2(uint64_t a1)
{
  dispatch_object_t *WeakRetained;

  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_suspend(WeakRetained[13]);
  -[dispatch_object_t saveProportions](WeakRetained, "saveProportions");

}

void __59___LSInstallProgressService__LSFindPlaceholderApplications__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  if (*(_DWORD *)(a3 + 168) == 2 && (*(_BYTE *)(a3 + 174) & 4) != 0 && (*(_DWORD *)(a3 + 332) - 7) >= 3)
  {
    v4 = _CSStringCopyCFString();
    if (v4)
    {
      v6 = (id)v4;
      +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", v4, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    }
  }
}

void __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_LSFindPlaceholderApplications");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_199(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _LSProgressLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_199_cold_1();

  }
}

void __64___LSInstallProgressService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _LSProgressLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "LSInstallProgress: Connection invalidated or interupted %@", (uint8_t *)&v5, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v4, "removeObserver:", *(_QWORD *)(a1 + 32));

}

void __41___LSInstallProgressService_addObserver___block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  _LSProgressLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_182882000, v0, OS_LOG_TYPE_DEFAULT, "Failed to send catchup callback after adding observer", v1, 2u);
  }

}

uint64_t __44___LSInstallProgressService_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __76___LSInstallProgressService_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", *(_QWORD *)(a1 + 32), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id location;

  v3 = a2;
  v4 = (void *)MEMORY[0x186DAE7A0]();
  objc_setAssociatedObject(v3, &_block_invoke_publishingStringKey, *(id *)(a1 + 32), (void *)0x301);
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("userInfo.installState"), 3, *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("fractionCompleted"), 3, *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("cancellable"), 3, *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("pausable"), 3, *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), CFSTR("prioritizable"), 3, *(_QWORD *)(a1 + 32));
  v5 = *(id *)(a1 + 40);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "progressForBundleID:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = objc_msgSend(v3, "installState");
    if (v7 != 5)
      objc_msgSend(v6, "setInstallState:", v7);
    objc_msgSend(v6, "setPausable:", objc_msgSend(v3, "isPausable", v7));
    objc_msgSend(v6, "setCancellable:", objc_msgSend(v3, "isCancellable"));
    objc_msgSend(v6, "setPrioritizable:", objc_msgSend(v3, "isPrioritizable"));
  }
  else
  {
    _LSProgressLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_cold_1();

  }
  objc_sync_exit(v5);

  objc_initWeak(&location, v3);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_234;
  v13[3] = &unk_1E10465B0;
  v14 = *(id *)(a1 + 32);
  objc_copyWeak(&v17, &location);
  v9 = *(void **)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = v9;
  v10 = (void *)objc_msgSend(v13, "copy");
  v11 = (void *)MEMORY[0x186DAE9BC]();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v4);

  return v11;
}

void __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_234(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _LSProgressLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "unsubscribing from %@ as it was unpublished", (uint8_t *)&v10, 0xCu);
  }

  v4 = (void *)MEMORY[0x186DAE7A0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("userInfo.installState"));

  v6 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v6, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("fractionCompleted"));

  v7 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v7, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("cancellable"));

  v8 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v8, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("pausable"));

  v9 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v9, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("prioritizable"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeSubscriberForPublishingKey:andBundleID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v4);
}

void __62___LSInstallProgressService_installationFailedForApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", *(_QWORD *)(a1 + 32), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __77___LSInstallProgressService_sendNotification_forApplicationExtensionRecords___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  __CFNotificationCenter *DistributedCenter;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        addPluginDataToNotificationDict(v2, *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v5);
  }

  _LSInstallLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v2;
    _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "posting %@ with %@", buf, 0x16u);
  }

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotificationWithOptions(DistributedCenter, *(CFNotificationName *)(a1 + 40), 0, (CFDictionaryRef)v2, 2uLL);

}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke(uint64_t a1)
{
  LSProgressNotificationTimer *v1;
  void *v2;

  v1 = -[LSProgressNotificationTimer initWithQueue:]([LSProgressNotificationTimer alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v2 = (void *)sendNotification_forAppProxies_Plugins_completion__sProgressTimer;
  sendNotification_forAppProxies_Plugins_completion__sProgressTimer = (uint64_t)v1;

}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _LSStartupJournalledInstallNotification *v3;
  id *v4;
  const __CFString *v5;
  char v6;
  const __CFDictionary *v7;
  uint64_t v8;
  const __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  NSObject *v19;
  const __CFString *v20;
  const char *v21;
  const __CFString *v22;
  const char *v23;
  const __CFString *v24;
  NSObject *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  NSObject *v29;
  const __CFString *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  NSObject *v43;
  const __CFString *v44;
  uint64_t v45;
  NSObject *v46;
  const __CFString *v47;
  uint64_t v48;
  NSObject *v49;
  const __CFString *v50;
  uint64_t v51;
  void *v52;
  _QWORD *v53;
  _QWORD *v54;
  NSObject *v55;
  const __CFString *v56;
  uint64_t v57;
  const __CFString *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  __CFNotificationCenter *DistributedCenter;
  NSObject *v71;
  char v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  id v80;
  void *v81;
  BOOL v82;
  void *v83;
  void *v84;
  BOOL v85;
  NSObject *v86;
  __CFString *v87;
  __CFNotificationCenter *v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  const __CFString *v92;
  char v93;
  const __CFDictionary *v94;
  const __CFDictionary *v95;
  uint64_t v96;
  uint64_t v97;
  const __CFString *cf1;
  const char *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[5];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint8_t v114[128];
  uint8_t buf[4];
  const __CFString *v116;
  __int16 v117;
  const __CFDictionary *v118;
  _BYTE v119[128];
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[2];
  _QWORD v125[2];
  uint64_t v126;
  void *v127;
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _BYTE v134[128];
  uint64_t v135;

  v1 = a1;
  v135 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 96)
    && *(_QWORD *)(v2 + 88)
    && +[_LSInstallNotificationJournaller shouldJournalNotificationType:](_LSInstallNotificationJournaller, "shouldJournalNotificationType:", *(unsigned int *)(a1 + 80)))
  {
    v3 = -[_LSStartupJournalledInstallNotification initWithNotification:appProxies:plugins:]([_LSStartupJournalledInstallNotification alloc], "initWithNotification:appProxies:plugins:", *(unsigned int *)(v1 + 80), *(_QWORD *)(v1 + 40), *(unsigned __int8 *)(v1 + 84));
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 88), "addObject:", v3);

  }
  v99 = (const char *)objc_msgSend(*(id *)(v1 + 32), "observerSelectorForNotification:", *(unsigned int *)(v1 + 80));
  v4 = (id *)(v1 + 48);
  v100 = *(id *)(v1 + 48);
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  switch(*(_DWORD *)(v1 + 80))
  {
    case 0:
      _LSProgressLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_2();
      goto LABEL_60;
    case 1:
      _LSProgressLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v30;
        _os_log_impl(&dword_182882000, v29, OS_LOG_TYPE_DEFAULT, "Sending applicationInstallsDidStart: for %@", buf, 0xCu);
      }

      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v31 = *v4;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v110, v134, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v111;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v111 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
            if (objc_msgSend(v36, "installType") != 7
              && objc_msgSend(v36, "installType") != 8
              && objc_msgSend(v36, "installType") != 9)
            {
              objc_msgSend(*(id *)(v1 + 32), "parentProgressForApplication:andPhase:isActive:", v36, 3, 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setInstallState:", 5);

            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v110, v134, 16);
        }
        while (v33);
      }

      v38 = *(_QWORD *)(v1 + 56);
      v132[0] = CFSTR("bundleIDs");
      v132[1] = CFSTR("isPlaceholder");
      v133[0] = v38;
      v133[1] = MEMORY[0x1E0C9AAB0];
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v133;
      v18 = v132;
      goto LABEL_36;
    case 2:
      _LSProgressLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v12;
        _os_log_impl(&dword_182882000, v11, OS_LOG_TYPE_DEFAULT, "Sending applicationInstallsDidUpdateIcon: for %@", buf, 0xCu);
      }

      v13 = *(void **)(v1 + 32);
      objc_msgSend(*(id *)(v1 + 48), "objectAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_placeholderIconUpdatedForApp:", v14);

      v15 = *(_QWORD *)(v1 + 56);
      v130[0] = CFSTR("bundleIDs");
      v130[1] = CFSTR("isPlaceholder");
      v131[0] = v15;
      v131[1] = MEMORY[0x1E0C9AAB0];
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = v131;
      v18 = v130;
LABEL_36:
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 2);
      v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      v5 = 0;
      v8 = 1;
      v9 = CFSTR("com.apple.LaunchServices.applicationRegistered");
      goto LABEL_62;
    case 3:
      _LSProgressLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_1();

      v40 = (void *)sendNotification_forAppProxies_Plugins_completion__sProgressTimer;
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "allObjects");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "notifyObservers:withApplications:", v41, *(_QWORD *)(v1 + 48));

      goto LABEL_61;
    case 4:
      _LSProgressLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      v42 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v42;
      v21 = "Sending applicationsWillInstall: for %@";
      goto LABEL_42;
    case 5:
      _LSProgressLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      v20 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v20;
      v21 = "Sending applicationsWillUninstall: for %@";
LABEL_42:
      _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
LABEL_43:

      v7 = 0;
      v8 = 0;
      v9 = 0;
      v6 = 1;
      v5 = CFSTR("com.apple.LaunchServices.pluginswillberemoved");
      goto LABEL_62;
    case 6:
      goto LABEL_62;
    case 7:
      _LSProgressLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v44;
        _os_log_impl(&dword_182882000, v43, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidInstall: for %@", buf, 0xCu);
      }

      v45 = *(_QWORD *)(v1 + 56);
      v128[0] = CFSTR("bundleIDs");
      v128[1] = CFSTR("isPlaceholder");
      v129[0] = v45;
      v129[1] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v129, v128, 2);
      v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("com.apple.LaunchServices.applicationRegistered");
      v6 = 1;
      v8 = 1;
      v5 = CFSTR("com.apple.LaunchServices.pluginsregistered");
      goto LABEL_62;
    case 8:
      _LSProgressLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v47;
        _os_log_impl(&dword_182882000, v46, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidUninstall: for %@", buf, 0xCu);
      }

      v48 = *(_QWORD *)(v1 + 56);
      v124[0] = CFSTR("bundleIDs");
      v124[1] = CFSTR("isPlaceholder");
      v125[0] = v48;
      v125[1] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 2);
      v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("com.apple.LaunchServices.applicationUnregistered");
      v6 = 1;
      v8 = 1;
      v5 = CFSTR("com.apple.LaunchServices.pluginsunregistered");
      goto LABEL_62;
    case 9:
      _LSProgressLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v50;
        _os_log_impl(&dword_182882000, v49, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidUninstall: for %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(v1 + 32), "_placeholdersUninstalled:", *(_QWORD *)(v1 + 48));
      v51 = *(_QWORD *)(v1 + 56);
      v122[0] = CFSTR("bundleIDs");
      v122[1] = CFSTR("isPlaceholder");
      v123[0] = v51;
      v123[1] = MEMORY[0x1E0C9AAB0];
      v52 = (void *)MEMORY[0x1E0C99D80];
      v53 = v123;
      v54 = v122;
      goto LABEL_56;
    case 0xA:
      _LSProgressLog();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v56;
        _os_log_impl(&dword_182882000, v55, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidInstall: for %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(v1 + 32), "_placeholdersUninstalled:", *(_QWORD *)(v1 + 48));
      v57 = *(_QWORD *)(v1 + 56);
      v120[0] = CFSTR("bundleIDs");
      v120[1] = CFSTR("isPlaceholder");
      v121[0] = v57;
      v121[1] = MEMORY[0x1E0C9AAB0];
      v52 = (void *)MEMORY[0x1E0C99D80];
      v53 = v121;
      v54 = v120;
LABEL_56:
      objc_msgSend(v52, "dictionaryWithObjects:forKeys:count:", v53, v54, 2);
      v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      v5 = 0;
      v8 = 1;
      v9 = CFSTR("com.apple.LaunchServices.applicationUnregistered");
      goto LABEL_62;
    case 0xB:
      _LSProgressLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_60;
      v22 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v22;
      v23 = "Sending applicationsDidFailToInstall: for %@";
      break;
    case 0xC:
      _LSProgressLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_60;
      v24 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v24;
      v23 = "Sending applicationsDidFailToUninstall: for %@";
      break;
    case 0xD:
      _LSProgressLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v26;
        _os_log_impl(&dword_182882000, v25, OS_LOG_TYPE_DEFAULT, "Sending applicationIconDidChange: for %@", buf, 0xCu);
      }

      v126 = *MEMORY[0x1E0C9AE78];
      objc_msgSend(*(id *)(v1 + 56), "objectAtIndex:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v27;
      v8 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
      v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      v6 = 0;
      v5 = 0;
      v9 = CFSTR("com.apple.LaunchServices.applicationIconChanged");
      goto LABEL_62;
    case 0xE:
      _LSProgressLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_60;
      v28 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v28;
      v23 = "Sending applicationsDidChangePersonas: for %@";
      break;
    case 0xF:
      _LSProgressLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_60;
      v58 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v58;
      v23 = "Sending applicationInstallsDidChange: due to postprocessing ready for %@";
      break;
    default:
      v7 = 0;
      v8 = 0;
      v9 = 0;
      goto LABEL_62;
  }
  _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
LABEL_60:

LABEL_61:
  v6 = 0;
  v5 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
LABEL_62:
  cf1 = v5;
  if (v99)
  {
    v91 = v8;
    v92 = v9;
    v93 = v6;
    v94 = v7;
    v96 = v1;
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v59 = *(id *)(*(_QWORD *)(v1 + 32) + 8);
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v107;
      v63 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v61; ++j)
        {
          if (*(_QWORD *)v107 != v62)
            objc_enumerationMutation(v59);
          v65 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * j);
          v66 = (void *)MEMORY[0x186DAE7A0]();
          objc_msgSend(v65, "connection");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v105[0] = v63;
          v105[1] = 3221225472;
          v105[2] = __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_277;
          v105[3] = &unk_1E1040A90;
          v105[4] = v65;
          objc_msgSend(v67, "remoteObjectProxyWithErrorHandler:", v105);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v68, v99, v100);
          objc_autoreleasePoolPop(v66);
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
      }
      while (v61);
    }

    v7 = v94;
    v1 = v96;
    v6 = v93;
    LODWORD(v8) = v91;
    v9 = v92;
  }
  if (v7)
    v69 = v8;
  else
    v69 = 0;
  if (v69 == 1)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotificationWithOptions(DistributedCenter, v9, 0, v7, 1uLL);
    _LSProgressLog();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v116 = v9;
      v117 = 2112;
      v118 = v7;
      _os_log_impl(&dword_182882000, v71, OS_LOG_TYPE_DEFAULT, "Sent distributed notification %@ with payload %@", buf, 0x16u);
    }

  }
  v72 = v6 ^ 1;
  if (!*(_BYTE *)(v1 + 84))
    v72 = 1;
  if ((v72 & 1) == 0)
  {
    v73 = *(void **)(v1 + 64);
    if (v73)
    {
      if (objc_msgSend(v73, "count"))
      {
        v95 = v7;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(v1 + 64), "count"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = 0u;
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v97 = v1;
        v75 = *(id *)(v1 + 64);
        v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
        if (!v76)
          goto LABEL_97;
        v77 = v76;
        v78 = *(_QWORD *)v102;
        while (1)
        {
          for (k = 0; k != v77; ++k)
          {
            if (*(_QWORD *)v102 != v78)
              objc_enumerationMutation(v75);
            v80 = *(id *)(*((_QWORD *)&v101 + 1) + 8 * k);
            if (!CFEqual(cf1, CFSTR("com.apple.LaunchServices.pluginsregistered"))
              || (objc_msgSend(v80, "bundleIdentifier"),
                  v81 = (void *)objc_claimAutoreleasedReturnValue(),
                  v82 = _LSIsNewsWidgetBundleIdentifier(v81),
                  v81,
                  !v82))
            {

LABEL_94:
              objc_msgSend(v80, "correspondingApplicationExtensionRecord", v91, v92);
              v86 = objc_claimAutoreleasedReturnValue();
              addPluginDataToNotificationDict(v74, v86);
              goto LABEL_95;
            }
            +[LSApplicationRestrictionsManager sharedInstance]();
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "bundleIdentifier");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = -[LSApplicationRestrictionsManager isAppExtensionRestricted:]((_BOOL8)v83, v84);

            if (!v85)
              goto LABEL_94;
            _LSProgressLog();
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v80, "bundleIdentifier");
              v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v116 = v87;
              _os_log_impl(&dword_182882000, v86, OS_LOG_TYPE_DEFAULT, "notification for restricted plugin %@ not being sent", buf, 0xCu);

            }
LABEL_95:

          }
          v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
          if (!v77)
          {
LABEL_97:

            v88 = CFNotificationCenterGetDistributedCenter();
            CFNotificationCenterPostNotificationWithOptions(v88, cf1, 0, (CFDictionaryRef)v74, 2uLL);
            _LSProgressLog();
            v89 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v116 = cf1;
              v117 = 2112;
              v118 = (const __CFDictionary *)v74;
              _os_log_impl(&dword_182882000, v89, OS_LOG_TYPE_DEFAULT, "Sent plugin notification %@ with payload %@", buf, 0x16u);
            }

            v7 = v95;
            v1 = v97;
            break;
          }
        }
      }
    }
  }
  v90 = *(_QWORD *)(v1 + 72);
  if (v90)
    v90 = (*(uint64_t (**)(void))(v90 + 16))();
  MEMORY[0x186DAF214](v90);

}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_277(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _LSProgressLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }

}

void __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _LSProgressLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke_cold_1();

}

void __60___LSInstallProgressService_sendDatabaseRebuiltNotification__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 96))
  {
    v3 = *(void **)(v2 + 88);
    if (v3)
    {
      +[_LSStartupJournalledDatabaseRebuiltNotification sharedNotification](_LSStartupJournalledDatabaseRebuiltNotification, "sharedNotification");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);

      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(v2 + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "sendDatabaseRebuiltNotificationToObserver:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void __95___LSInstallProgressService__prepareApplicationProxiesForNotification_identifiers_withPlugins___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (*(_BYTE *)(a1 + 48))
          +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", v7, 1);
        else
          +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v7, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
          if (*(_BYTE *)(a1 + 49))
            v9 = (id)objc_msgSend(v8, "plugInKitPlugins");
          objc_msgSend(v8, "detach", (_QWORD)v10);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __44___LSInstallProgressService_loadProportions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  LSApplicationRecord *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  __int128 v16;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v20;
    *(_QWORD *)&v3 = 138412290;
    v16 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7, v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_opt_class();
        v10 = (void *)objc_opt_class();
        if (_LSIsDictionaryWithKeysAndValuesOfClass(v8, v9, v10))
        {
          v11 = [LSApplicationRecord alloc];
          v18 = 0;
          v12 = -[LSApplicationRecord initForInstallMachineryWithBundleIdentifier:placeholder:error:](v11, "initForInstallMachineryWithBundleIdentifier:placeholder:error:", v7, 1, &v18);
          v13 = v18;
          _LSProgressLog();
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          if (v12)
          {
            if (v15)
            {
              *(_DWORD *)buf = v16;
              v24 = v7;
              _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "Found placeholder for %@, loading progress proportions", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "setObject:forKeyedSubscript:", v14, v7);
          }
          else if (v15)
          {
            *(_DWORD *)buf = v16;
            v24 = v7;
            _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "No placeholder for %@, not loading progress proportions", buf, 0xCu);
          }

        }
        else
        {
          _LSProgressLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v24 = v7;
            _os_log_error_impl(&dword_182882000, v13, OS_LOG_TYPE_ERROR, "Invalid progress proportion entry for %@!", buf, 0xCu);
          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v4);
  }

}

void __108___LSInstallProgressService_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_completion___block_invoke(uint64_t a1)
{
  LSApplicationRecord *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = [LSApplicationRecord alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v4 = -[LSApplicationRecord initForInstallMachineryWithBundleIdentifier:placeholder:error:](v2, "initForInstallMachineryWithBundleIdentifier:placeholder:error:", v3, 1, &v7);
  v5 = v7;
  v6 = v7;
  if (!v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);

}

void __64___LSInstallProgressService_sendNetworkUsageChangedNotification__block_invoke(uint64_t a1)
{
  void *v1;
  const __CFDictionary *v2;
  __CFNotificationCenter *DistributedCenter;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("usingNetwork");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 128));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotification(DistributedCenter, CFSTR("com.lsinstallprogress.networkusagechanged"), 0, v2, 1u);

}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;

  v2 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1[4] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    v5 = *(NSObject **)(*(_QWORD *)(a1[5] + 8) + 40);
    if (v5)
    {
      dispatch_source_cancel(v5);
      v6 = *(_QWORD *)(a1[5] + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = 0;

    }
    v9 = a1[6];
    v8 = (uint64_t)(a1 + 6);
    if (objc_msgSend(*(id *)(*(_QWORD *)(v9 + 8) + 40), "count"))
    {
      _LSInstallLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_cold_1(v8, v10);

    }
    v11 = *(_QWORD *)(*(_QWORD *)v8 + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_290(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id obj;
  _QWORD v14[5];
  NSObject *v15;
  uint64_t v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "pid");
        v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

        dispatch_group_enter(v2);
        objc_msgSend(v7, "connection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_2;
        v14[3] = &unk_1E10466C8;
        v12 = *(_QWORD *)(a1 + 48);
        v14[4] = *(_QWORD *)(a1 + 32);
        v16 = v12;
        v17 = v8;
        v15 = v2;
        objc_msgSend(v11, "addBarrierBlock:", v14);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  dispatch_group_notify(v2, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 72), *(dispatch_block_t *)(a1 + 40));
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[5];
  int v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_3;
  v3[3] = &unk_1E10466A0;
  v3[4] = *(_QWORD *)(a1 + 48);
  v4 = *(_DWORD *)(a1 + 56);
  dispatch_sync(v2, v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObject:", v2);

}

uint64_t __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v9[16];

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CB2FE0]))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 2)
    {
      _LSInstallLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "install journal directory does not exist.", v9, 2u);
      }
      v7 = 0;
      goto LABEL_10;
    }
  }
  else
  {

  }
  _LSInstallLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke_cold_1();
  v7 = 1;
LABEL_10:

  return v7;
}

uint64_t __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke_294(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "timestamp");
  v7 = v6;
  objc_msgSend(v5, "timestamp");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "timestamp");
    v11 = v10;
    objc_msgSend(v5, "timestamp");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

uint64_t __51___LSInstallProgressService_performJournalRecovery__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "loadJournalledNotificationsFromDisk");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  result = objc_msgSend(*(id *)(a1 + 32), "dispatchJournalledNotificationsToConnectedClients");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
  return result;
}

void __51___LSInstallProgressService_performJournalRecovery__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = dispatch_time(0, 10000000000);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___LSInstallProgressService_performJournalRecovery__block_invoke_3;
  block[3] = &unk_1E1040478;
  block[4] = v3;
  dispatch_after(v2, v4, block);
}

void __51___LSInstallProgressService_performJournalRecovery__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "jettisoning notification journal", v7, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = 0;

}

void __77___LSInstallProgressService_directlySendNotification_withProxies_toObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _LSProgressLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }

}

void __71___LSInstallProgressService_dispatchJournalledNotificationsToObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _LSProgressLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }

}

void __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_199_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "failure restoring install progress for %@: %@");
  OUTLINED_FUNCTION_1();
}

void __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Parent progress for %@ is invalid, cannot add children to it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_4_3(&dword_182882000, v0, v1, "Sending applicationInstallsDidChange: for %@", v2);
  OUTLINED_FUNCTION_1();
}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Skipping notifications for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Error %@ connecting to observer %@ for database rebuilt notification");
  OUTLINED_FUNCTION_1();
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Clients tardy on draining notifications: %@", v4, 0xCu);

  OUTLINED_FUNCTION_5_1();
}

void __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "error enumerating saved journals: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
