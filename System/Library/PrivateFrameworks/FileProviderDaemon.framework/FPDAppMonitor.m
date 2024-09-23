@implementation FPDAppMonitor

- (void)startMonitoring
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] %@ start monitoring app updates", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (FPAppRegistry)appRegistry
{
  return self->_appRegistry;
}

- (FPDAppMonitor)initWithServer:(id)a3
{
  id v4;
  FPDAppMonitor *v5;
  FPDAppMonitor *v6;
  FPDAppRegistry *v7;
  FPAppRegistry *appRegistry;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *notificationQueue;
  FPDAppMonitor *v13;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)FPDAppMonitor;
    v5 = -[FPDAppMonitor init](&v15, sel_init);
    v6 = v5;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_server, v4);
      v7 = objc_alloc_init(FPDAppRegistry);
      appRegistry = v6->_appRegistry;
      v6->_appRegistry = &v7->super;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = dispatch_queue_create("com.apple.FileProvider.app-monitor", v10);
      notificationQueue = v6->_notificationQueue;
      v6->_notificationQueue = (OS_dispatch_queue *)v11;

      *(_QWORD *)&v6->_didChangeProvidersToken = -1;
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __32__FPDAppMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didChangeListOfProviders");
}

uint64_t __32__FPDAppMonitor_startMonitoring__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didChangeDefaultSaveLocationInUserDefaults");
}

- (void)stopMonitoring
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] %@ stop monitoring app updates", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

- (void)dumpStateTo:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "write:", CFSTR("apps monitor "));
  v5 = -[FPDAppMonitor isMonitoring](self, "isMonitoring");
  if (v5)
    v6 = 2;
  else
    v6 = 0;
  if (v5)
    v7 = CFSTR("active");
  else
    v7 = CFSTR("not-active");
  objc_msgSend(v4, "startFgColor:attr:", v6, 2);
  objc_msgSend(v4, "write:", v7);
  objc_msgSend(v4, "reset");
  objc_msgSend(v4, "write:", CFSTR("\n"));
  objc_msgSend(v4, "write:", CFSTR("-----------------------------------------------------\n"));
  -[FPDAppMonitor appRegistry](self, "appRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "listOfMonitoredApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "startFgColor:attr:", 7, 2);
  objc_msgSend(v4, "write:", CFSTR("%lu"), objc_msgSend(v9, "count"));
  objc_msgSend(v4, "reset");
  objc_msgSend(v4, "write:", CFSTR(" apps monitored"));
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v4, "write:", CFSTR(":\n"));
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("bundleID"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingDescriptors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v4, "write:", CFSTR(" - %@:\n"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }

    objc_msgSend(v4, "write:", CFSTR("\n"));
  }
  else
  {
    objc_msgSend(v4, "write:", CFSTR(".\n\n"));
  }

}

- (id)listOfPlaceholderApps
{
  NSObject *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t section;

  section = __fp_create_section();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[FPDAppMonitor listOfPlaceholderApps].cold.1();

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  v12 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__FPDAppMonitor_listOfPlaceholderApps__block_invoke;
  v6[3] = &unk_1E8C77108;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateBundlesOfType:block:", 3, v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  __fp_leave_section_Debug();
  return v4;
}

void __38__FPDAppMonitor_listOfPlaceholderApps__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "bundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_populateListOfMonitoredApps
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx populate list of monitored apps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __45__FPDAppMonitor__populateListOfMonitoredApps__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1D17D1B04]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_appMetadataIfMonitoringIsNeeded:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
  else
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __45__FPDAppMonitor__populateListOfMonitoredApps__block_invoke_cold_1((uint64_t)v3, v7);

  }
  objc_autoreleasePoolPop(v4);

}

- (id)_appMetadataIfMonitoringIsNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSDictionary *defaultProviderByAppBundleID;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "supportsOpenInPlace") && (objc_msgSend(v5, "fileSharingEnabled") & 1) != 0
     || (objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("UISupportsDocumentBrowser")),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v5, "objectForInfoDictionaryKey:ofClass:", CFSTR("UISupportsDocumentBrowser"), objc_opt_class()),
         v7 = (void *)objc_claimAutoreleasedReturnValue(),
         v8 = objc_msgSend(v7, "BOOLValue"),
         v7,
         v6,
         v8)))
  {
    defaultProviderByAppBundleID = self->_defaultProviderByAppBundleID;
    objc_msgSend(v5, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](defaultProviderByAppBundleID, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAABF8]), "initWithAppProxy:providerDomainID:", v5, v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int)_registerForNotification:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  int out_token;

  out_token = -1;
  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  LODWORD(self) = notify_register_dispatch((const char *)objc_msgSend(v6, "UTF8String"), &out_token, (dispatch_queue_t)self->_notificationQueue, v7);

  if ((_DWORD)self)
    return -1;
  else
    return out_token;
}

- (void)_didRegisterApps:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  FPDAppMonitor *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t section;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FPDAppMonitor isMonitoring](self, "isMonitoring"))
  {
    section = __fp_create_section();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[FPDAppMonitor _didRegisterApps:].cold.1();

    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPDAppMonitor _appMetadataIfMonitoringIsNeeded:](self, "_appMetadataIfMonitoringIsNeeded:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    v15 = self;
    objc_sync_enter(v15);
    -[FPAppRegistry addApps:](v15->_appRegistry, "addApps:", v8);
    objc_sync_exit(v15);

    __fp_leave_section_Debug();
  }

}

- (void)_didUnregisterApps:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  FPDAppMonitor *v8;

  v4 = a3;
  if (-[FPDAppMonitor isMonitoring](self, "isMonitoring"))
  {
    __fp_create_section();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[FPDAppMonitor _didUnregisterApps:].cold.1();

    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = self;
    objc_sync_enter(v8);
    -[FPAppRegistry removeAppsWithBundleIDs:](v8->_appRegistry, "removeAppsWithBundleIDs:", v7);
    objc_sync_exit(v8);

    __fp_leave_section_Debug();
  }

}

- (void)_didChangeLocale:(id)a3
{
  id v4;
  NSObject *v5;
  FPDAppMonitor *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  id *obj;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t section;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FPDAppMonitor isMonitoring](self, "isMonitoring"))
  {
    v18 = v4;
    section = __fp_create_section();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[FPDAppMonitor _didChangeLocale:].cold.1();

    v6 = self;
    objc_sync_enter(v6);
    obj = (id *)&v6->super.isa;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[FPAppRegistry listOfMonitoredApps](v6->_appRegistry, "listOfMonitoredApps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v11, "bundleID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v11, "displayName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v14);

            if ((v16 & 1) == 0)
            {
              v17 = (void *)objc_msgSend(v11, "copy");
              objc_msgSend(v17, "setDisplayName:", v14);
              objc_msgSend(v20, "addObject:", v17);

            }
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

    objc_msgSend(obj[5], "addApps:", v20);
    objc_sync_exit(obj);

    __fp_leave_section_Debug();
    v4 = v18;
  }

}

- (void)_didChangeListOfProviders
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx did change list of providers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)_didChangeDefaultSaveLocationInUserDefaults
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx did change default save location", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (id)_updateDefaultProviderDomainID
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (_updateDefaultProviderDomainID_onceToken != -1)
    dispatch_once(&_updateDefaultProviderDomainID_onceToken, &__block_literal_global_14);
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  objc_msgSend(WeakRetained, "extensionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerDomainsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)_updateDefaultProviderDomainID_defaultProviderIDs;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12 && (objc_msgSend(v12, "isEnabled") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "setFp_defaultProviderDomainID:", v11);
          v14 = v11;

          goto LABEL_14;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend((id)_updateDefaultProviderDomainID_defaultProviderIDs, "lastObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "setFp_defaultProviderDomainID:", v14);
LABEL_14:

  return v14;
}

void __47__FPDAppMonitor__updateDefaultProviderDomainID__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CAAB38];
  objc_msgSend(MEMORY[0x1E0CB3940], "fp_providerDomainIDFromProviderID:domainIdentifier:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"), *MEMORY[0x1E0CAAB38]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "fp_providerDomainIDFromProviderID:domainIdentifier:", CFSTR("com.apple.FileProvider.LocalStorage"), v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  v5[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_updateDefaultProviderDomainID_defaultProviderIDs;
  _updateDefaultProviderDomainID_defaultProviderIDs = v3;

}

- (void)_updateDefaultProviderByAppBundleID
{
  void *v3;
  FPDAppMonitor *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.DocumentManager.defaults"));
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("DOCDefaultFileProviderIdentifierKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = self;
    objc_sync_enter(v4);
    objc_storeStrong((id *)&v4->_defaultProviderByAppBundleID, v3);
    objc_sync_exit(v4);

  }
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (FPDServer)server
{
  return (FPDServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_appRegistry, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_defaultProviderByAppBundleID, 0);
}

- (void)listOfPlaceholderApps
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx check for app placeholders", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __45__FPDAppMonitor__populateListOfMonitoredApps__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_ERROR, "[ERROR] LaunchService provided proxy %@ for an app enumeration", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_8_0();
}

- (void)_didRegisterApps:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx did register apps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)_didUnregisterApps:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx did unregister apps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)_didChangeLocale:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx did change locale", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

@end
