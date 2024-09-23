@implementation FPAppRegistry

void __36__FPAppRegistry_listOfMonitoredApps__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setApps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  -[NSMutableDictionary allKeys](self->_appMetadataByBundleID, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "bundleID", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[FPAppRegistry _addApps:](self, "_addApps:", v7);
  -[FPAppRegistry _removeAppsWithBundleIDs:](self, "_removeAppsWithBundleIDs:", v6);

}

- (void)_removeAppsWithBundleIDs:(id)a3
{
  id v4;
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
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  NSMutableDictionary *appMetadataByDisplayName;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_appMetadataByBundleID, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "bundleID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v14);

            fp_default_log();
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

            if (v16)
            {
              fp_current_or_default_log();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v13;
                _os_log_debug_impl(&dword_1A0A34000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %@", buf, 0xCu);
              }

            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appMetadataByBundleID, "setObject:forKeyedSubscript:", 0, v11);
            -[FPAppRegistry _bundleIDForHomonymOfApp:](self, "_bundleIDForHomonymOfApp:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              appMetadataByDisplayName = self->_appMetadataByDisplayName;
              objc_msgSend(v13, "displayName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](appMetadataByDisplayName, "setObject:forKeyedSubscript:", 0, v20);

            }
          }
          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appMetadataByBundleID, "setObject:forKeyedSubscript:", 0, v11);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v8);
    }

    -[FPAppRegistry delegate](self, "delegate");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      v23 = objc_msgSend(v5, "count");

      if (v23)
      {
        -[FPAppRegistry delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "appRegistry:didRemoveAppsWithBundleIDs:", self, v5);

      }
    }

    v4 = v25;
  }

}

- (void)_addApps:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *appMetadataByBundleID;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSMutableDictionary *appMetadataByDisplayName;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  __CFString *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const __CFString *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v32;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
          appMetadataByBundleID = self->_appMetadataByBundleID;
          objc_msgSend(v10, "bundleID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](appMetadataByBundleID, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          fp_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          LODWORD(v12) = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

          if ((_DWORD)v12)
          {
            -[FPAppRegistry _bundleIDForHomonymOfApp:](self, "_bundleIDForHomonymOfApp:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            fp_current_or_default_log();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              if (v13)
                v23 = CFSTR("updated");
              else
                v23 = CFSTR("added");
              v24 = &stru_1E4450B40;
              if (v15)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" [override homonym %@]"), v15);
                v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v24 = v30;
              }
              *(_DWORD *)buf = 138412802;
              v36 = v23;
              v37 = 2112;
              v38 = v10;
              v39 = 2112;
              v40 = v24;
              _os_log_debug_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ %@%@", buf, 0x20u);
              if (v15)

            }
          }
          if (v13)
          {
            appMetadataByDisplayName = self->_appMetadataByDisplayName;
            objc_msgSend(v13, "displayName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](appMetadataByDisplayName, "setObject:forKeyedSubscript:", 0, v18);

          }
          v19 = self->_appMetadataByBundleID;
          objc_msgSend(v10, "bundleID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v10, v20);

          v21 = self->_appMetadataByDisplayName;
          objc_msgSend(v10, "displayName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v10, v22);

          ++v9;
        }
        while (v7 != v9);
        v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        v7 = v25;
      }
      while (v25);
    }

    -[FPAppRegistry delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v29;
    if (v26)
    {
      fp_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[FPAppRegistry _addApps:].cold.1(v5, v27);

      -[FPAppRegistry delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "appRegistry:didUpdateApps:", self, v5);

    }
  }

}

- (FPAppRegistryDelegate)delegate
{
  return (FPAppRegistryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)promoteItemToAppLibraryIfNeeded:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v11;
  char v12;

  v4 = a3;
  v12 = 0;
  v11 = 0;
  v5 = -[FPAppRegistry _isAppLibrary:appMetadata:userVisible:](self, "_isAppLibrary:appMetadata:userVisible:", v4, &v11, &v12);
  v6 = v11;
  if (v5)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[FPAppRegistry promoteItemToAppLibraryIfNeeded:].cold.1();

    objc_msgSend(v4, "setIsContainer:", 1);
    objc_msgSend(v4, "setCapabilities:", objc_msgSend(v4, "capabilities") & 0xFFFFFFFFFFFFFFF7);
    objc_msgSend(v4, "setCapabilities:", objc_msgSend(v4, "capabilities") & 0xFFFFFFFFFFFFFFFBLL);
    objc_msgSend(v4, "setCapabilities:", objc_msgSend(v4, "capabilities") & 0xFFFFFFFFFFFFFFEFLL);
    objc_msgSend(v4, "fp_appContainerBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v6, "bundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFp_appContainerBundleIdentifier:", v9);

    }
  }
  else
  {
    objc_msgSend(v4, "setIsContainer:", 0);
    objc_msgSend(v4, "setFp_appContainerBundleIdentifier:", 0);
  }

  return v4;
}

- (BOOL)_isAppLibrary:(id)a3 appMetadata:(id *)a4 userVisible:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  BOOL v28;

  v8 = a3;
  v9 = v8;
  if (v8 && objc_msgSend(v8, "isFolder"))
  {
    objc_msgSend(v9, "itemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier"));

    objc_msgSend(v9, "parentItemIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier"));

    LOBYTE(v13) = 0;
    if ((v11 & 1) == 0 && v12)
    {
      objc_msgSend(v9, "providerID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "fp_isiCloudDriveOrCloudDocsIdentifier");

      if (v15)
      {
        objc_msgSend(v9, "cloudContainerIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v17 = 0;
          goto LABEL_24;
        }
        objc_msgSend(v9, "fp_appContainerBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPAppRegistry appForBundleID:](self, "appForBundleID:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v9, "displayName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPAppRegistry appForDisplayName:](self, "appForDisplayName:", v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          LOBYTE(v13) = 0;
          goto LABEL_24;
        }
      }
      if (a4)
        *a4 = objc_retainAutorelease(v17);
      if (!a5)
        goto LABEL_18;
      if (objc_msgSend(v9, "isContainerPristine"))
      {
        *a5 = 0;
        fp_current_or_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[FPAppRegistry _isAppLibrary:appMetadata:userVisible:].cold.1();
      }
      else
      {
        objc_msgSend(v17, "providerDomainID");
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
          goto LABEL_21;
        v22 = (void *)v21;
        objc_msgSend(v17, "providerDomainID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "providerDomainID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqualToString:", v24);

        if ((v25 & 1) != 0)
        {
LABEL_21:
          LOBYTE(v13) = 1;
          *a5 = 1;
          goto LABEL_24;
        }
        objc_msgSend(v9, "childItemCount");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v9, "childItemCount");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "integerValue") > 0
             || objc_msgSend(v9, "folderType") == 2
             || objc_msgSend(v9, "folderType") == 3;
          *a5 = v28;

        }
        else
        {
          *a5 = 1;
        }

        if (*a5)
        {
LABEL_18:
          LOBYTE(v13) = 1;
LABEL_24:

          goto LABEL_9;
        }
        fp_current_or_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[FPAppRegistry _isAppLibrary:appMetadata:userVisible:].cold.2();
      }

      goto LABEL_18;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }
LABEL_9:

  return (char)v13;
}

- (id)appForBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *syncQueue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__27;
    v16 = __Block_byref_object_dispose__27;
    v17 = 0;
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__FPAppRegistry_appForBundleID___block_invoke;
    block[3] = &unk_1E444AB70;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(syncQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateAppList
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] can't fetch list of monitored apps; %@",
    v4,
    0xCu);

  OUTLINED_FUNCTION_6_1();
}

- (FPAppRegistry)init
{
  FPAppRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *appMetadataByBundleID;
  uint64_t v5;
  NSMutableDictionary *appMetadataByDisplayName;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *syncQueue;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  FPAppRegistry *v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FPAppRegistry;
  v2 = -[FPAppRegistry init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    appMetadataByBundleID = v2->_appMetadataByBundleID;
    v2->_appMetadataByBundleID = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    appMetadataByDisplayName = v2->_appMetadataByDisplayName;
    v2->_appMetadataByDisplayName = (NSMutableDictionary *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.FileProvider.app-registry-sync-queue", v7);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v8;

    if (objc_msgSend((id)objc_opt_class(), "keepInSync"))
    {
      location = 0;
      objc_initWeak(&location, v2);
      objc_msgSend((id)FPAppRegistryDidUpdateAppsNotification, "fp_libnotifyPerUserNotificationName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __21__FPAppRegistry_init__block_invoke;
      v17[3] = &unk_1E4449998;
      objc_copyWeak(&v18, &location);
      v2->_updateAppsNotification = -[FPAppRegistry _registerForNotification:handler:](v2, "_registerForNotification:handler:", v10, v17);
      v12 = v2->_syncQueue;
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __21__FPAppRegistry_init__block_invoke_2;
      block[3] = &unk_1E444A308;
      v16 = v2;
      dispatch_async(v12, block);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      v2->_updateAppsNotification = -1;
    }
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[FPAppRegistry init].cold.1();

  }
  return v2;
}

- (int)_registerForNotification:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  int out_token;

  out_token = -1;
  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  LODWORD(self) = notify_register_dispatch((const char *)objc_msgSend(v6, "UTF8String"), &out_token, (dispatch_queue_t)self->_syncQueue, v7);

  if ((_DWORD)self)
    return -1;
  else
    return out_token;
}

+ (BOOL)keepInSync
{
  return 1;
}

+ (FPAppRegistry)sharedRegistry
{
  id v2;
  void *v3;
  FPAppRegistry *v4;
  void *v5;
  id v6;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)_sharedRegistry;
  if (!_sharedRegistry)
  {
    v4 = objc_alloc_init(FPAppRegistry);
    v5 = (void *)_sharedRegistry;
    _sharedRegistry = (uint64_t)v4;

    v3 = (void *)_sharedRegistry;
  }
  v6 = v3;
  objc_sync_exit(v2);

  return (FPAppRegistry *)v6;
}

uint64_t __21__FPAppRegistry_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAppList");
}

- (NSArray)listOfMonitoredApps
{
  NSObject *syncQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__27;
  v10 = __Block_byref_object_dispose__27;
  v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__FPAppRegistry_listOfMonitoredApps__block_invoke;
  v5[3] = &unk_1E444B600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __32__FPAppRegistry_appForBundleID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __21__FPAppRegistry_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAppList");

}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] dealloc %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)setSharedRegistry:(id)a3
{
  id v4;
  void *v5;
  id obj;

  v4 = a3;
  obj = a1;
  objc_sync_enter(obj);
  v5 = (void *)_sharedRegistry;
  _sharedRegistry = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (FPAppRegistryDaemonConnectionOverride)daemonConnectionOverride
{
  return (FPAppRegistryDaemonConnectionOverride *)(id)_daemonConnectionOverride;
}

+ (void)setDaemonConnectionOverride:(id)a3
{
  id v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)&_daemonConnectionOverride, a3);
  v4 = a3;
  objc_msgSend((id)FPAppRegistryDidUpdateAppsNotification, "fp_libnotifyPerUserNotificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  notify_post((const char *)objc_msgSend(v6, "UTF8String"));

}

- (BOOL)isAppLibrary:(id)a3
{
  return -[FPAppRegistry _isAppLibrary:appMetadata:userVisible:](self, "_isAppLibrary:appMetadata:userVisible:", a3, 0, 0);
}

- (id)appForDisplayName:(id)a3
{
  id v4;
  void *v5;
  NSObject *syncQueue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__27;
    v16 = __Block_byref_object_dispose__27;
    v17 = 0;
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__FPAppRegistry_appForDisplayName___block_invoke;
    block[3] = &unk_1E444AB70;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(syncQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __35__FPAppRegistry_appForDisplayName___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addApps:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__FPAppRegistry_addApps___block_invoke;
  block[3] = &unk_1E4449A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(syncQueue, block);

}

uint64_t __25__FPAppRegistry_addApps___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addApps:", *(_QWORD *)(a1 + 40));
}

- (void)removeAppsWithBundleIDs:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__FPAppRegistry_removeAppsWithBundleIDs___block_invoke;
  block[3] = &unk_1E4449A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(syncQueue, block);

}

uint64_t __41__FPAppRegistry_removeAppsWithBundleIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAppsWithBundleIDs:", *(_QWORD *)(a1 + 40));
}

- (id)_bundleIDForHomonymOfApp:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *appMetadataByDisplayName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    appMetadataByDisplayName = self->_appMetadataByDisplayName;
    objc_msgSend(v4, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](appMetadataByDisplayName, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && (objc_msgSend(v5, "bundleID"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "bundleID"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v9, "isEqualToString:", v10),
          v10,
          v9,
          (v11 & 1) == 0))
    {
      objc_msgSend(v8, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_appMetadataByDisplayName, 0);
  objc_storeStrong((id *)&self->_appMetadataByBundleID, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] init %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)promoteItemToAppLibraryIfNeeded:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 2080;
  v4 = v0;
  _os_log_debug_impl(&dword_1A0A34000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] promoting %@ to%s app-library", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)_addApps:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] informing delegate of %lu new apps", v3, 0xCu);
  OUTLINED_FUNCTION_6_1();
}

- (void)_isAppLibrary:appMetadata:userVisible:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] hidding pristine container for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_isAppLibrary:appMetadata:userVisible:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] hidding empty non-default container for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
