@implementation LSApplicationWorkspacePluginsChangedCallback

void __LSApplicationWorkspacePluginsChangedCallback_block_invoke(id *a1)
{
  unint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  int v27;
  char **v28;
  const char *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  id v52;
  void *context;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
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
  __int128 v73;
  id v74;
  _BYTE v75[5];
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  _LSContextInvalidate();
  v2 = 0x1E0C99000uLL;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(a1[4], "isEqualToString:", CFSTR("com.apple.LaunchServices.pluginsregistered")))
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(a1[5], "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v63 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
          objc_msgSend(v3, "addObject:", v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
      }
      while (v6);
    }

    v61 = 0;
    v10 = v3;
    if (_LSCurrentProcessMayMapDatabase())
    {
      v74 = 0;
      +[LSApplicationExtensionRecord applicationExtensionRecordsForUUIDs:outContainingBundleRecords:error:](LSApplicationExtensionRecord, "applicationExtensionRecordsForUUIDs:outContainingBundleRecords:error:", v10, &v61, &v74);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v74;
      v13 = v12;
      if (v11)
      {
        v51 = v12;
        v52 = v10;
        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v15 = v11;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v71;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v71 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
              objc_msgSend(v20, "compatibilityObject");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_msgSend(v14, "addObject:", v21);
              }
              else
              {
                _LSInstallLog();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v20;
                  _os_log_error_impl(&dword_182882000, v22, OS_LOG_TYPE_ERROR, "Could not get a proxy for appex record %@; did it go away?",
                    buf,
                    0xCu);
                }

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
          }
          while (v17);
        }

        v10 = v52;
        v2 = 0x1E0C99000;
        if (v14)
        {
LABEL_47:

          v30 = (void *)objc_msgSend(v61, "mutableCopy");
          v29 = sel_pluginsDidInstall_;

          if (!sel_pluginsDidInstall_)
            goto LABEL_51;
          goto LABEL_48;
        }
      }
      else
      {
        _LSInstallLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          __LSApplicationWorkspacePluginsChangedCallback_block_invoke_cold_2();

      }
    }
    _LSInstallLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      __LSApplicationWorkspacePluginsChangedCallback_block_invoke_cold_1();

    v14 = objc_alloc_init(*(Class *)(v2 + 3560));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v33 = v10;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, buf, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v67;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v67 != v36)
            objc_enumerationMutation(v33);
          +[LSPlugInKitProxy pluginKitProxyForUUID:](LSPlugInKitProxy, "pluginKitProxyForUUID:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            objc_msgSend(v14, "addObject:", v38);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, buf, 16);
      }
      while (v35);
    }

    goto LABEL_47;
  }
  if ((objc_msgSend(a1[4], "isEqualToString:", CFSTR("com.apple.LaunchServices.pluginsunregistered")) & 1) == 0
    && !objc_msgSend(a1[4], "isEqualToString:", CFSTR("com.apple.LaunchServices.pluginswillberemoved")))
  {
    v14 = 0;
    v30 = 0;
    goto LABEL_51;
  }
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = a1[5];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __LSApplicationWorkspacePluginsChangedCallback_block_invoke_2;
  v58[3] = &unk_1E10413C0;
  v59 = v3;
  v25 = v23;
  v60 = v25;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v58);
  v26 = a1[4];
  v14 = v25;
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.LaunchServices.pluginsunregistered"));
  v28 = &selRef_pluginsDidUninstall_;
  if (!v27)
    v28 = &selRef_pluginsWillUninstall_;
  v29 = *v28;

  v30 = 0;
  if (v29)
  {
LABEL_48:
    if (objc_msgSend(v14, "count") && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(a1[6], v29, v14);
  }
LABEL_51:
  if (objc_msgSend(v30, "count"))
  {
    do
    {
      v39 = MEMORY[0x186DAE7A0]();
      objc_msgSend(v30, "lastObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      context = (void *)v39;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v40, "applicationExtensionRecords");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v41 = 0;
      }
      objc_msgSend(v40, "_resolveAllProperties");
      objc_msgSend(v40, "detach");
      v42 = v30;
      objc_msgSend(v30, "removeLastObject");

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v43 = v41;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v55;
        do
        {
          for (m = 0; m != v45; ++m)
          {
            if (*(_QWORD *)v55 != v46)
              objc_enumerationMutation(v43);
            v48 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * m);
            objc_msgSend(v48, "uniqueIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v3, "containsObject:", v49);

            if (v50)
            {
              objc_msgSend(v48, "_resolveAllProperties");
              objc_msgSend(v48, "detach");
            }
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
        }
        while (v45);
      }

      objc_autoreleasePoolPop(context);
      v30 = v42;
    }
    while (objc_msgSend(v42, "count"));
  }

}

void __LSApplicationWorkspacePluginsChangedCallback_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;
  id v19;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0CB3A28];
  v7 = a2;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithUUIDString:", v7);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  v19 = v5;
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("NSExtensionIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("LSEffectiveIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("_LSBundlePath"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v8 && v13)
  {
    v15 = !v9 || v10 == 0;
    if (!v15 && v12 != 0)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v13, 1);
      +[LSPlugInKitProxy plugInKitProxyForUUID:bundleIdentifier:pluginIdentifier:effectiveIdentifier:version:bundleURL:](LSPlugInKitProxy, "plugInKitProxyForUUID:bundleIdentifier:pluginIdentifier:effectiveIdentifier:version:bundleURL:", v8, v9, v10, v11, v12, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v18);

    }
  }

}

void __LSApplicationWorkspacePluginsChangedCallback_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "Using expensive fallback path for obtaining plugin proxies from install notifications. This process should be entitled to use the LS database.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void __LSApplicationWorkspacePluginsChangedCallback_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "could not make proxies from uuids in optimized path! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
