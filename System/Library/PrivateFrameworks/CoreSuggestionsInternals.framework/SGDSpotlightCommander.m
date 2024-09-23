@implementation SGDSpotlightCommander

- (id)queryForPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5 contentTypes:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __CFString *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  id v37;
  void *v38;
  __CFString *v39;
  id v40;
  const __CFString *v41;
  const __CFString *v42;
  void *v43;
  id v45;
  __CFString *v46;
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v48 = v12;
  v49 = v11;
  if (objc_msgSend(v9, "length"))
  {
    v13 = (void *)objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v14 = objc_msgSend(&unk_1E7E105C0, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v55 != v16)
            objc_enumerationMutation(&unk_1E7E105C0);
          v18 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1C3BD4F6C]();
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" (%@ == \"*%@*\"cwdt) "), v18, v9);
          objc_msgSend(v13, "addObject:", v20);

          objc_autoreleasePoolPop(v19);
        }
        v15 = objc_msgSend(&unk_1E7E105C0, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v15);
    }
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v13, "_pas_componentsJoinedByString:", CFSTR(" || "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (__CFString *)objc_msgSend(v21, "initWithFormat:", CFSTR("(%@) "), v22);

    v12 = v48;
    v11 = v49;
  }
  else
  {
    v23 = &stru_1E7DB83A8;
  }
  v24 = (void *)objc_opt_new();
  if (v10)
  {
    v25 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v24, "stringFromDate:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (__CFString *)objc_msgSend(v25, "initWithFormat:", CFSTR("$time.iso(%@)"), v26);

    if (v11)
    {
LABEL_13:
      v27 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v24, "stringFromDate:", v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (__CFString *)objc_msgSend(v27, "initWithFormat:", CFSTR("$time.iso(%@)"), v28);

      goto LABEL_16;
    }
  }
  else
  {
    v46 = CFSTR("$time.this_year(-1)");
    if (v11)
      goto LABEL_13;
  }
  v29 = CFSTR("$time.today(1)");
LABEL_16:
  v47 = v24;
  if (v12)
  {
    if (objc_msgSend(v12, "count"))
    {
      v45 = v10;
      v30 = (void *)objc_opt_new();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v31 = v12;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v51 != v34)
              objc_enumerationMutation(v31);
            v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" (kMDItemContentType == '%@') "), *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j));
            objc_msgSend(v30, "addObject:", v36);

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        }
        while (v33);
      }

      v37 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v30, "_pas_componentsJoinedByString:", CFSTR(" || "));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (__CFString *)objc_msgSend(v37, "initWithFormat:", CFSTR("(%@) "), v38);

      v10 = v45;
      v12 = v48;
      v11 = v49;
    }
    else
    {
      v39 = &stru_1E7DB83A8;
    }
  }
  else
  {
    v39 = &stru_1E7DB83A8;
  }
  v40 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (-[__CFString length](v23, "length"))
    v41 = CFSTR("&&");
  else
    v41 = &stru_1E7DB83A8;
  if (-[__CFString length](v39, "length"))
    v42 = CFSTR("&&");
  else
    v42 = &stru_1E7DB83A8;
  v43 = (void *)objc_msgSend(v40, "initWithFormat:", CFSTR("%@ %@ InRange(kMDItemContentCreationDate,%@,%@) %@ %@"), v23, v41, v46, v29, v42, v39);

  return v43;
}

- (SGDSpotlightCommander)init
{
  SGDSpotlightCommander *v2;
  uint64_t v3;
  SGSqlEntityStore *store;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SGDSpotlightCommander;
  v2 = -[SGDSpotlightCommander init](&v10, sel_init);
  if (v2)
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v3 = objc_claimAutoreleasedReturnValue();
    store = v2->_store;
    v2->_store = (SGSqlEntityStore *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, (dispatch_qos_class_t)5u, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("com.apple.suggestions.spotlightCommander.reimportRequests", v6);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v7;

    -[SGDSpotlightCommander _registerForLockStateChange](v2, "_registerForLockStateChange");
    if (-[SGDSpotlightCommander _unlocked](v2, "_unlocked"))
      -[SGDSpotlightCommander _attemptToProcessRequests](v2, "_attemptToProcessRequests");

  }
  return v2;
}

- (void)requestReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  v10 = (__CFString *)a3;
  +[FIAPHistoricalDataRequest historicalDataRequestWithPersonHandle:startDate:endDate:](FIAPHistoricalDataRequest, "historicalDataRequestWithPersonHandle:startDate:endDate:", a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v10)
    v12 = v10;
  else
    v12 = CFSTR("unknown");
  objc_msgSend(v11, "setPluginIdentifier:", v12);

  -[SGDSpotlightCommander requestReimportForHistoricalDataRequest:](self, "requestReimportForHistoricalDataRequest:", v13);
}

- (void)requestReimportForHistoricalDataRequest:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SGDSpotlightCommander *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SGDSpotlightCommander_requestReimportForHistoricalDataRequest___block_invoke;
  v7[3] = &unk_1E7DB6A30;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

- (void)_registerForLockStateChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  id deviceStateToken;
  _QWORD v7[4];
  id v8;
  id location[2];

  if (!self->_deviceStateToken)
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: registering for lock state change", (uint8_t *)location, 2u);
    }

    location[0] = 0;
    objc_initWeak(location, self);
    v4 = (void *)MEMORY[0x1E0D81590];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__SGDSpotlightCommander__registerForLockStateChange__block_invoke;
    v7[3] = &unk_1E7DB4FF8;
    objc_copyWeak(&v8, location);
    objc_msgSend(v4, "registerForLockStateChangeNotifications:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    deviceStateToken = self->_deviceStateToken;
    self->_deviceStateToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
}

- (void)_unregisterForLockStateChange
{
  NSObject *v3;
  id deviceStateToken;
  uint8_t v5[16];

  if (self->_deviceStateToken)
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: unregistering for lock state change", v5, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D81590], "unregisterForLockStateChangeNotifications:", self->_deviceStateToken);
    deviceStateToken = self->_deviceStateToken;
    self->_deviceStateToken = 0;

  }
}

- (BOOL)_locked
{
  return objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked") ^ 1;
}

- (BOOL)_unlocked
{
  return objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked");
}

- (void)_attemptToProcessRequests
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SGDSpotlightCommander__attemptToProcessRequests__block_invoke;
  block[3] = &unk_1E7DB56F0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (id)_protectionClasses
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB2AB8];
  v5[0] = *MEMORY[0x1E0CB2AB0];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0CB2AE0];
  v5[2] = *MEMORY[0x1E0CB2AC0];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_reimportQueryForPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5 requestId:(unint64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  uint64_t v26;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  id location;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v9 = a4;
  v30 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -31536000.0);
  v28 = v9;
  objc_msgSend(v9, "laterDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v38 = (uint64_t)v29;
    v39 = 2112;
    v40 = (unint64_t)v11;
    v41 = 2112;
    v42 = v30;
    _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: reimportForPersonHandle: %@ : %@ : %@", buf, 0x20u);
  }

  -[SGDSpotlightCommander queryForPersonHandle:startDate:endDate:contentTypes:](self, "queryForPersonHandle:startDate:endDate:contentTypes:", v29, v11, v30, &unk_1E7E10B00);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v15 = dispatch_semaphore_create(0);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setFetchAttributes:", &unk_1E7E10B18);
  objc_msgSend(v16, "setLowPriority:", 1);
  objc_msgSend(v16, "setReason:", CFSTR("reason:SGDSpotlightCommander-1; code:6"));
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v13, v16);
  if (objc_msgSend(MEMORY[0x1E0D81590], "isDeviceFormattedForProtection"))
  {
    -[SGDSpotlightCommander _protectionClasses](self, "_protectionClasses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setProtectionClasses:", v18);

  }
  v19 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __83__SGDSpotlightCommander__reimportQueryForPersonHandle_startDate_endDate_requestId___block_invoke;
  v35[3] = &unk_1E7DB6610;
  v20 = v14;
  v36 = v20;
  objc_msgSend(v17, "setFoundItemsHandler:", v35);
  location = 0;
  objc_initWeak(&location, v17);
  v31[0] = v19;
  v31[1] = 3221225472;
  v31[2] = __83__SGDSpotlightCommander__reimportQueryForPersonHandle_startDate_endDate_requestId___block_invoke_38;
  v31[3] = &unk_1E7DB5020;
  objc_copyWeak(&v33, &location);
  v21 = v15;
  v32 = v21;
  objc_msgSend(v17, "setCompletionHandler:", v31);
  objc_msgSend(v17, "start");
  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  if (-[SGDSpotlightCommander _unlocked](self, "_unlocked"))
  {
    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v26 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 134218240;
      v38 = v26;
      v39 = 2048;
      v40 = a6;
      _os_log_debug_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: storing reimport items for %lu bundles for request %llu", buf, 0x16u);
    }

    -[SGSqlEntityStore storeReimportItems:requestId:](self->_store, "storeReimportItems:requestId:", v20, a6);
  }
  v23 = v32;
  v24 = v20;

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v24;
}

- (void)_executeReimportOfIdentifiers:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *MEMORY[0x1E0D19A28];
  v5 = a3;
  -[SGDSpotlightCommander _protectionClasses](self, "_protectionClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDSpotlightCommander _reimportFromBundleId:protectionClasses:identifiers:](self, "_reimportFromBundleId:protectionClasses:identifiers:", v4, v6, v8);

  v9 = *MEMORY[0x1E0D19A38];
  -[SGDSpotlightCommander _protectionClasses](self, "_protectionClasses");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDSpotlightCommander _reimportFromBundleId:protectionClasses:identifiers:](self, "_reimportFromBundleId:protectionClasses:identifiers:", v9, v12, v11);

}

- (void)_reimportFromBundleId:(id)a3 protectionClasses:(id)a4 identifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v8, "_pas_componentsJoinedByString:", CFSTR(","));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = &stru_1E7DB83A8;
    objc_msgSend(v9, "_pas_componentsJoinedByString:", CFSTR(","));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("job:%@:%@:%d:%d:%@"), v16, v13, 1, 2, v14);

    -[SGDSpotlightCommander _issueCommand:](self, "_issueCommand:", v15);
  }

}

- (void)_issueCommand:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_sync_enter(v6);
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: issuing command to spotlight: %@", (uint8_t *)&v8, 0xCu);
    }

    -[NSObject _issueCommand:completionHandler:](v6, "_issueCommand:completionHandler:", v3, &__block_literal_global_29933);
    objc_sync_exit(v6);
  }
  else
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_1C3607000, v6, OS_LOG_TYPE_ERROR, "SGDSpotlightCommander: Error: unable to get spotlight index to issue reimport command to", (uint8_t *)&v8, 2u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong(&self->_deviceStateToken, 0);
}

void __39__SGDSpotlightCommander__issueCommand___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_1C3607000, v6, OS_LOG_TYPE_ERROR, "SGDSpotlightCommander: Error during CS issueCommand: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  if (objc_msgSend(v4, "length"))
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: reimport command issued: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: reimport command issued", (uint8_t *)&v9, 2u);
    }
  }

}

void __83__SGDSpotlightCommander__reimportQueryForPersonHandle_startDate_endDate_requestId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v29 = objc_msgSend(v3, "count");
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: reimport query found %lu items", buf, 0xCu);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 138412290;
    v23 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "bundleID", v23);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v11, "bundleID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(MEMORY[0x1E0D80F80], "shouldAdmitContentFromBundleIdentifier:", v15))
            {
              objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v16)
              {
                sgLogHandle();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v23;
                  v29 = (uint64_t)v15;
                  _os_log_debug_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: foundItemsHandler making new set for %@", buf, 0xCu);
                }

                v18 = (void *)objc_opt_new();
                objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, v15);

              }
              sgLogHandle();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v11, "uniqueIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v29 = (uint64_t)v15;
                v30 = 2112;
                v31 = v22;
                _os_log_debug_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: foundItemsHandler: %@ - %@", buf, 0x16u);

              }
              objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "uniqueIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObject:", v21);

            }
          }
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);
  }

}

void __83__SGDSpotlightCommander__reimportQueryForPersonHandle_startDate_endDate_requestId___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      sgLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = (uint64_t)v3;
        v11 = 2112;
        v12 = v8;
        _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SGDSpotlightCommander: Error: reimport search query error: %@: %@", (uint8_t *)&v9, 0x16u);

      }
    }
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = objc_msgSend(WeakRetained, "foundItemCount");
      v9 = 134217984;
      v10 = v7;
      _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: total items to be reimported: %tu", (uint8_t *)&v9, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

void __50__SGDSpotlightCommander__attemptToProcessRequests__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  id *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_locked"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_registerForLockStateChange");
    return;
  }
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGDSpotlightCommander: attempting to process reimport requests", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "loadUnqueriedReimportRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v32 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134217984;
    v45 = v32;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: found %lu unqueried reimport requests", buf, 0xCu);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
        v11 = objc_msgSend(*(id *)(a1 + 32), "_locked");
        v12 = *(void **)(a1 + 32);
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "_registerForLockStateChange");
          v19 = v5;
          goto LABEL_33;
        }
        objc_msgSend(v10, "personHandle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (id)objc_msgSend(v12, "_reimportQueryForPersonHandle:startDate:endDate:requestId:", v13, v14, v15, objc_msgSend(v10, "requestId"));

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "loadUnexecutedReimportRequests");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v33 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134217984;
    v45 = v33;
    _os_log_debug_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEBUG, "SGDSpotlightCommander: found %lu unexecuted reimport requests", buf, 0xCu);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (!v20)
    goto LABEL_26;
  v21 = v20;
  v22 = *(_QWORD *)v35;
  while (2)
  {
    v23 = 0;
    do
    {
      if (*(_QWORD *)v35 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v23);
      v25 = objc_msgSend(*(id *)(a1 + 32), "_locked", (_QWORD)v34);
      v26 = *(id **)(a1 + 32);
      if (v25)
      {
        objc_msgSend(v26, "_registerForLockStateChange");
LABEL_31:

        goto LABEL_33;
      }
      objc_msgSend(v26[2], "loadUnseenReimportItemsForRequest:", objc_msgSend(v24, "requestId"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(*(id *)(a1 + 32), "_locked");
      v29 = *(void **)(a1 + 32);
      if (v28)
      {
        objc_msgSend(v29, "_registerForLockStateChange");

        goto LABEL_31;
      }
      objc_msgSend(v29, "_executeReimportOfIdentifiers:", v27);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "markReimportRequestAsExecutedWithRequestId:", objc_msgSend(v24, "requestId"));

      ++v23;
    }
    while (v21 != v23);
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v21)
      continue;
    break;
  }
LABEL_26:

  v30 = objc_msgSend(*(id *)(a1 + 32), "_locked");
  v31 = *(void **)(a1 + 32);
  if (v30)
    objc_msgSend(v31, "_registerForLockStateChange");
  else
    objc_msgSend(v31, "_unregisterForLockStateChange");
LABEL_33:

}

void __52__SGDSpotlightCommander__registerForLockStateChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_attemptToProcessRequests");

}

void __65__SGDSpotlightCommander_requestReimportForHistoricalDataRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v21 = v3;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGDSpotlightCommander: got reimport request: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "loadUnqueriedReimportRequests");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_5:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      if (objc_msgSend(*(id *)(a1 + 32), "subsetOfHistoricalDataRequest:", v9, (_QWORD)v15))
        break;
      objc_msgSend(*(id *)(a1 + 32), "pluginIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pluginIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (v12)
      {
        sgLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v9;
          v14 = "ignoring reimport request since plugin already has a pending request: %@";
LABEL_17:
          _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
        }
        goto LABEL_18;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    sgLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      v14 = "ignoring reimport request since it is subset of existing query: %@";
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
LABEL_12:

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "storeReimportRequest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_attemptToProcessRequests");
LABEL_19:

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SGDSpotlightCommander_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_30000 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_30000, block);
  return (id)sharedInstance__pasExprOnceResult_30001;
}

void __39__SGDSpotlightCommander_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_30001;
  sharedInstance__pasExprOnceResult_30001 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
