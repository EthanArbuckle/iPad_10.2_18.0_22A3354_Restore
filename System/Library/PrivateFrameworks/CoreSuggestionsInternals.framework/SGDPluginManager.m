@implementation SGDPluginManager

- (SGDPluginManager)init
{
  SGDPluginManager *v2;
  SGDPluginManager *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSDictionary *plugins;
  SGDPluginManager *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)SGDPluginManager;
  v2 = -[SGDPluginManager init](&v31, sel_init);
  v3 = v2;
  if (v2)
  {
    v26 = v2;
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_opt_new();
    v37[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (!v8)
      goto LABEL_17;
    v9 = v8;
    v10 = *(_QWORD *)v28;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          objc_msgSend(v12, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v14);
          goto LABEL_15;
        }
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGDPowerLog pluginStartSetup:](SGDPowerLog, "pluginStartSetup:", v13);

        objc_msgSend(v12, "setup");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGDPowerLog pluginEndSetup:](SGDPowerLog, "pluginEndSetup:", v15);

        objc_msgSend(v14, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          sgLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "error");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v33 = v18;
            v34 = 2112;
            v35 = v19;
            _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "Error during %@ setup: %@", buf, 0x16u);

          }
        }
        else
        {
          objc_msgSend(v12, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v20);

          objc_msgSend(v14, "historicalDataRequests");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          if (!v22)
            goto LABEL_15;
          objc_msgSend(v12, "identifier");
          v17 = objc_claimAutoreleasedReturnValue();
          +[SGDPluginManager _processHistoricalDataRequestsForPluginIdentifier:result:](SGDPluginManager, "_processHistoricalDataRequestsForPluginIdentifier:result:", v17, v14);
        }

LABEL_15:
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (!v9)
      {
LABEL_17:

        v23 = objc_msgSend(v4, "copy");
        v3 = v26;
        plugins = v26->_plugins;
        v26->_plugins = (NSDictionary *)v23;

        return v3;
      }
    }
  }
  return v3;
}

- (id)processSearchableItem:(id)a3 harvestMetrics:(id)a4
{
  return -[SGDPluginManager _processSearchableItem:harvestMetrics:userAction:](self, "_processSearchableItem:harvestMetrics:userAction:", a3, a4, 0);
}

- (id)processUserAction:(id)a3 searchableItem:(id)a4
{
  return -[SGDPluginManager _processSearchableItem:harvestMetrics:userAction:](self, "_processSearchableItem:harvestMetrics:userAction:", a4, 0, a3);
}

- (id)_processSearchableItem:(id)a3 harvestMetrics:(id)a4 userAction:(id)a5
{
  id v8;
  id v9;
  char **v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  char *v21;
  SGDPluginManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __int128 v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id obj;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  const __CFString *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  const __CFString *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v8 = a4;
  v9 = a5;
  v10 = &selRef_processUserAction_searchableItem_;
  if (!v9)
    v10 = &selRef_processSearchableItem_;
  v11 = *v10;
  v46 = v8;
  objc_msgSend(v8, "startTimer:", kHarvestMetricsPluginsTimer);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[NSDictionary allKeys](self->_plugins, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  v41 = v9;
  if (v12)
  {
    v14 = v12;
    v45 = 0;
    v15 = *(_QWORD *)v48;
    v16 = CFSTR("NSUA");
    if (!v9)
      v16 = CFSTR("CSSI");
    v39 = v16;
    *(_QWORD *)&v13 = 138412546;
    v38 = v13;
    do
    {
      v17 = 0;
      v42 = v14;
      do
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(obj);
        v18 = *(const __CFString **)(*((_QWORD *)&v47 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x1C3BD4F6C]();
        -[NSDictionary objectForKeyedSubscript:](self->_plugins, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v21 = v11;
          v22 = self;
          sgLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v43, "uniqueIdentifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "bundleID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v52 = v39;
            v53 = 2112;
            v54 = v40;
            v55 = 2112;
            v56 = v35;
            v57 = 2112;
            v58 = v18;
            _os_log_debug_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEBUG, "Sending processing of %@ %@ from %@ to plugin %@", buf, 0x2Au);

          }
          objc_msgSend(v20, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "startTimer:", v24);

          objc_msgSend(v20, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginStartProcessingSearchableItem:](SGDPowerLog, "pluginStartProcessingSearchableItem:", v25);

          if (v41)
            objc_msgSend(v20, "processUserAction:searchableItem:", v41, v43);
          else
            objc_msgSend(v20, "processSearchableItem:", v43);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier", v38);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginEndProcessingSearchableItem:](SGDPowerLog, "pluginEndProcessingSearchableItem:", v27);

          objc_msgSend(v20, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "endTimer:significantWork:", v28, 1);

          objc_msgSend(v26, "error");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            sgLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v26, "error");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v38;
              v52 = v18;
              v53 = 2112;
              v54 = v36;
              _os_log_error_impl(&dword_1C3607000, v30, OS_LOG_TYPE_ERROR, "Plugin reported error: %@: %@", buf, 0x16u);

            }
            v31 = v45;
            if (!v45)
              v31 = (void *)objc_opt_new();
            objc_msgSend(v26, "error");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v31;
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, v18);

          }
          objc_msgSend(v26, "historicalDataRequests");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "count");

          if (v34)
            +[SGDPluginManager _processHistoricalDataRequestsForPluginIdentifier:result:](SGDPluginManager, "_processHistoricalDataRequestsForPluginIdentifier:result:", v18, v26);

          self = v22;
          v11 = v21;
          v14 = v42;
        }

        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    }
    while (v14);
  }
  else
  {
    v45 = 0;
  }

  objc_msgSend(v46, "endTimer:significantWork:", kHarvestMetricsPluginsTimer, 1);
  return v45;
}

- (void)processInteraction:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[SGXpcTransaction transactionWithName:](SGXpcTransaction, "transactionWithName:", "SGDPluginManager.processInteraction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__SGDPluginManager_processInteraction_bundleIdentifier_protectionClass_completion___block_invoke;
  v20[3] = &unk_1E7DA9DA8;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v14;
  v25 = v13;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  SGNotUserInitiated(CFSTR("plugin-processInteraction"), 2, v20);

}

- (void)purgeSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__SGDPluginManager_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v14[3] = &unk_1E7DACA98;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  SGNotUserInitiated(CFSTR("plugin-purgeSpotlightReferences"), 2, v14);

}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v14[3] = &unk_1E7DACA98;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  SGNotUserInitiated(CFSTR("plugin-deleteSpotlightReferences"), 2, v14);

}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 domainIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke;
  v14[3] = &unk_1E7DACA98;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  SGNotUserInitiated(CFSTR("plugin-deleteSpotlightReferences"), 2, v14);

}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_1E7DB6F48;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  SGNotUserInitiated(CFSTR("plugin-deleteSpotlightReferences"), 2, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugins, 0);
}

uint64_t __77__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t result;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1[4] + 8), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          sgLogHandle();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            v12 = a1[5];
            *(_DWORD *)buf = 138412546;
            v20 = v12;
            v21 = 2112;
            v22 = v6;
            _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "sending deletion of bundle %@ to plugin %@", buf, 0x16u);
          }

          objc_msgSend(v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginStartDeletion:](SGDPowerLog, "pluginStartDeletion:", v10);

          objc_msgSend(v8, "deleteSpotlightReferencesWithBundleIdentifier:", a1[5]);
          objc_msgSend(v8, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginEndDeletion:](SGDPowerLog, "pluginEndDeletion:", v11);

        }
        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v3);
  }

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __95__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          sgLogHandle();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            v12 = objc_msgSend(*(id *)(a1 + 40), "count");
            v13 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 134218498;
            v21 = v12;
            v22 = 2112;
            v23 = v13;
            v24 = 2112;
            v25 = v6;
            _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "sending deletion of %lu domains from %@ to plugin %@", buf, 0x20u);
          }

          objc_msgSend(v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginStartDeletion:](SGDPowerLog, "pluginStartDeletion:", v10);

          objc_msgSend(v8, "deleteSpotlightReferencesWithBundleIdentifier:domainIdentifiers:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
          objc_msgSend(v8, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginEndDeletion:](SGDPowerLog, "pluginEndDeletion:", v11);

        }
        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v3);
  }

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __95__SGDPluginManager_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          sgLogHandle();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            v12 = objc_msgSend(*(id *)(a1 + 40), "count");
            v13 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 134218498;
            v21 = v12;
            v22 = 2112;
            v23 = v13;
            v24 = 2112;
            v25 = v6;
            _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "sending deletion of %lu items from %@ to plugin %@", buf, 0x20u);
          }

          objc_msgSend(v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginStartDeletion:](SGDPowerLog, "pluginStartDeletion:", v10);

          objc_msgSend(v8, "deleteSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
          objc_msgSend(v8, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginEndDeletion:](SGDPowerLog, "pluginEndDeletion:", v11);

        }
        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v3);
  }

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __94__SGDPluginManager_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          sgLogHandle();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            v12 = objc_msgSend(*(id *)(a1 + 40), "count");
            v13 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 134218498;
            v21 = v12;
            v22 = 2112;
            v23 = v13;
            v24 = 2112;
            v25 = v6;
            _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "sending purge of %lu items from %@ to plugin %@", buf, 0x20u);
          }

          objc_msgSend(v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginStartDeletion:](SGDPowerLog, "pluginStartDeletion:", v10);

          objc_msgSend(v8, "purgeSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
          objc_msgSend(v8, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginEndDeletion:](SGDPowerLog, "pluginEndDeletion:", v11);

        }
        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v3);
  }

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __83__SGDPluginManager_processInteraction_bundleIdentifier_protectionClass_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v2)
  {
    v4 = v2;
    v29 = 0;
    v5 = sel_processInteraction_bundleIdentifier_protectionClass_;
    v6 = *(_QWORD *)v31;
    *(_QWORD *)&v3 = 138412546;
    v26 = v3;
    do
    {
      v7 = 0;
      v27 = v4;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = v5;
          sgLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*(id *)(a1 + 40), "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138412802;
            v35 = v22;
            v36 = 2112;
            v37 = v23;
            v38 = 2112;
            v39 = v8;
            _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "Sending processing of interaction %@ from %@ to %@", buf, 0x20u);

          }
          objc_msgSend(v10, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginStartProcessingSearchableItem:](SGDPowerLog, "pluginStartProcessingSearchableItem:", v13);

          objc_msgSend(v10, "processInteraction:bundleIdentifier:protectionClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDPowerLog pluginEndProcessingSearchableItem:](SGDPowerLog, "pluginEndProcessingSearchableItem:", v15);

          objc_msgSend(v14, "error");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            sgLogHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v14, "error");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v26;
              v35 = v8;
              v36 = 2112;
              v37 = v24;
              _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "Plugin reported error: %@: %@", buf, 0x16u);

            }
            v18 = v29;
            if (!v29)
              v18 = (void *)objc_opt_new();
            objc_msgSend(v14, "error", v26);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v18;
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v8);

          }
          objc_msgSend(v14, "historicalDataRequests", v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v21)
            +[SGDPluginManager _processHistoricalDataRequestsForPluginIdentifier:result:](SGDPluginManager, "_processHistoricalDataRequestsForPluginIdentifier:result:", v8, v14);

          v5 = v11;
          v4 = v27;
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v4);
  }
  else
  {
    v29 = 0;
  }

  v25 = *(_QWORD *)(a1 + 72);
  if (v25)
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v29);
  objc_msgSend(*(id *)(a1 + 64), "done", v26);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SGDPluginManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_5455 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_5455, block);
  return (id)sharedInstance__pasExprOnceResult_5456;
}

+ (void)_processHistoricalDataRequestsForPluginIdentifier:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[SGDSpotlightCommander sharedInstance](SGDSpotlightCommander, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = v6;
  objc_msgSend(v6, "historicalDataRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        sgLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v5;
          v22 = 2112;
          v23 = v13;
          _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "Plugin %@ requesting historical data: %@", buf, 0x16u);
        }

        objc_msgSend(v7, "requestReimportForHistoricalDataRequest:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v10);
  }

}

void __34__SGDPluginManager_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_5456;
  sharedInstance__pasExprOnceResult_5456 = v1;

  objc_autoreleasePoolPop(v0);
}

- (void)setPlugins:(id)a3
{
  objc_storeStrong((id *)&self->_plugins, a3);
}

- (id)pluginIdentifiers
{
  return -[NSDictionary allKeys](self->_plugins, "allKeys");
}

@end
