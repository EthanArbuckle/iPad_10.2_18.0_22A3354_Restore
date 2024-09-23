@implementation SyncManager

- (int64_t)setRead:(BOOL)a3 forCallsWithPredicate:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  NSObject *v14;
  int v16;
  int64_t v17;
  __int16 v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v6 = a3;
  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v20 = CFSTR("read");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SyncManager dbHandle](self, "dbHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateCallsWithPredicate:propertiesToUpdate:error:", v8, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  -[CHLogger logHandle](self, "logHandle");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218242;
    v17 = v13;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1B3FA4000, v14, OS_LOG_TYPE_DEFAULT, "Updated read status for %lu calls matching predicate %@", (uint8_t *)&v16, 0x16u);
  }

  if (v13)
  {
    -[SyncManager addUpdateTransactions:](self, "addUpdateTransactions:", v12);
  }
  else if (a5)
  {
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)predicateForLimits:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("kCHLimitCallKindsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SyncManager predicateForCallKinds:](self, "predicateForCallKinds:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  v34 = (void *)v7;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCHLimitStartDateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCHLimitStartDateKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("date"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v11);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCHLimitEndDateKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCHLimitEndDateKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("date"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v15);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCHLimitProtectedBundleIDsKey"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[SyncManager featureFlags](self, "featureFlags");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "protectedAppsEnabled");

    if (v19)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCHLimitProtectedBundleIDsKey"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = v5;
        v33 = v4;
        v21 = v20;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v36;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v36 != v24)
                objc_enumerationMutation(v21);
              v26 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v25);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[SyncManager bundleIDToServiceProvider:](self, "bundleIDToServiceProvider:", v26);
                v27 = objc_claimAutoreleasedReturnValue();
                if (-[NSObject length](v27, "length"))
                {
                  +[CHRecentCall predicateForCallsContainingServiceProvider:](CHRecentCall, "predicateForCallsContainingServiceProvider:", v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v28);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v6, "addObject:", v29);
                }
              }
              else
              {
                -[CHLogger logHandle](self, "logHandle");
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v40 = v26;
                  _os_log_error_impl(&dword_1B3FA4000, v27, OS_LOG_TYPE_ERROR, "Invalid bundleID %{public}@", buf, 0xCu);
                }
              }

              ++v25;
            }
            while (v23 != v25);
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
          }
          while (v23);
        }

        v5 = v32;
        v4 = v33;
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (CallHistoryDBClientHandleProtocol)dbHandle
{
  return self->_dbHandle;
}

- (SyncManager)init
{
  void *v3;
  void *v4;
  void *v5;
  SyncManager *v6;

  +[TransactionManager instance](TransactionManager, "instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDatabaseClientHandleManager sharedInstance](CHDatabaseClientHandleManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseClientHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SyncManager initWithTransactionManager:dbHandle:](self, "initWithTransactionManager:dbHandle:", v3, v5);

  return v6;
}

- (void)initDBHandle
{
  CallHistoryDBClientHandleProtocol *v3;
  CallHistoryDBClientHandleProtocol *dbHandle;
  id v5;

  +[CHDatabaseClientHandleManager sharedInstance](CHDatabaseClientHandleManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseClientHandle");
  v3 = (CallHistoryDBClientHandleProtocol *)objc_claimAutoreleasedReturnValue();
  dbHandle = self->_dbHandle;
  self->_dbHandle = v3;

}

- (id)predicateForCallKinds:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[SyncManager predicateForCallKind:](self, "predicateForCallKind:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)predicateForCallKind:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCHMediaTypeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CHRecentCall predicateForCallsWithMediaType:](CHRecentCall, "predicateForCallsWithMediaType:", objc_msgSend(v5, "integerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCHTTYTypeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CHRecentCall predicateForCallsWithTTYType:](CHRecentCall, "predicateForCallsWithTTYType:", objc_msgSend(v7, "integerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCHServiceProviderKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    if (objc_msgSend(v10, "length"))
    {
      +[CHRecentCall predicateForCallsWithServiceProvider:](CHRecentCall, "predicateForCallsWithServiceProvider:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v11);

    }
  }
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    if (objc_msgSend(v4, "count") != 1)
    {
      v13 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v4, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
LABEL_15:

  return v13;
}

- (SyncManager)initWithTransactionManager:(id)a3 dbHandle:(id)a4
{
  id v7;
  id v8;
  SyncManager *v9;
  SyncManager *v10;
  CHFeatureFlags *v11;
  CHFeatureFlags *featureFlags;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SyncManager;
  v9 = -[CHLogger initWithDomain:](&v14, sel_initWithDomain_, "SyncManager");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transactionManager, a3);
    v11 = objc_alloc_init(CHFeatureFlags);
    featureFlags = v10->_featureFlags;
    v10->_featureFlags = v11;

    objc_storeStrong((id *)&v10->_dbHandle, a4);
  }

  return v10;
}

- (void)insert:(id)a3 withTransaction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  CHTransaction *v23;
  TransactionManagerProtocol *transactionManager;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  _BYTE v30[14];
  __int16 v31;
  int v32;
  _QWORD v33[2];

  v4 = a4;
  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SyncManager dbHandle](self, "dbHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHCallFingerprint matchCallWithFingerprint:usingDatabase:](CHCallFingerprint, "matchCallWithFingerprint:usingDatabase:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_msgSend(v6, "callStatus") & 3) != 0 && (objc_msgSend(v8, "callStatus") & 4) != 0)
    {
      -[CHLogger logHandle](self, "logHandle");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v28 = v8;
        v29 = 2114;
        *(_QWORD *)v30 = v6;
        _os_log_impl(&dword_1B3FA4000, v9, OS_LOG_TYPE_DEFAULT, "Replacing %{public}@ with %{public}@", buf, 0x16u);
      }

      objc_msgSend(v8, "uniqueId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SyncManager deleteObjectsWithUniqueIds:withTransaction:](self, "deleteObjectsWithUniqueIds:withTransaction:", v11, 0);

      -[CHLogger logHandle](self, "logHandle");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "uniqueId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v13;
        _os_log_impl(&dword_1B3FA4000, v12, OS_LOG_TYPE_DEFAULT, "Deleted call with UUID: %{public}@", buf, 0xCu);

      }
    }
    else if ((objc_msgSend(v6, "callStatus") & 4) != 0 && (objc_msgSend(v8, "callStatus") & 3) != 0)
    {
      -[CHLogger logHandle](self, "logHandle");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "uniqueId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v6, "callStatus");
        objc_msgSend(v8, "uniqueId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v28 = v15;
        v29 = 1024;
        *(_DWORD *)v30 = v16;
        *(_WORD *)&v30[4] = 2114;
        *(_QWORD *)&v30[6] = v17;
        v31 = 1024;
        v32 = objc_msgSend(v8, "callStatus");
        _os_log_impl(&dword_1B3FA4000, v14, OS_LOG_TYPE_DEFAULT, "Not saving incoming call with UUID %{public}@ because it has status %u while matching call with UUID %{public}@ has status %u", buf, 0x22u);

      }
      goto LABEL_23;
    }
  }
  -[CHLogger logHandle](self, "logHandle");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uniqueId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v19;
    _os_log_impl(&dword_1B3FA4000, v18, OS_LOG_TYPE_DEFAULT, "Inserting call with UUID %{public}@", buf, 0xCu);

  }
  -[SyncManager dbHandle](self, "dbHandle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "createCallRecord:", v6);

  if (v4)
  {
    v26 = 0;
    objc_msgSend(v6, "archivedDataWithError:", &v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v26;
    v14 = v22;
    if (v21)
    {
      v23 = -[CHTransaction initWithType:andRecord:]([CHTransaction alloc], "initWithType:andRecord:", 0, v21);
      transactionManager = self->_transactionManager;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TransactionManagerProtocol appendTransactions:](transactionManager, "appendTransactions:", v25);

    }
    else
    {
      if (!v22)
      {
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      -[CHLogger logHandle](self, "logHandle");
      v23 = (CHTransaction *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_ERROR))
        -[SyncManager insert:withTransaction:].cold.1();
    }

    goto LABEL_22;
  }
LABEL_24:

}

- (void)insertRecords:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  CHTransaction *v16;
  TransactionManagerProtocol *transactionManager;
  void *v18;
  __int128 v19;
  SyncManager *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = self;
  -[SyncManager insertRecordsWithoutTransactions:](self, "insertRecordsWithoutTransactions:", v4);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v23;
    *(_QWORD *)&v8 = 138412546;
    v19 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v21 = 0;
        objc_msgSend(v12, "archivedDataWithError:", &v21, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;
        v15 = v14;
        if (v13)
        {
          v16 = -[CHTransaction initWithType:andRecord:]([CHTransaction alloc], "initWithType:andRecord:", 0, v13);
          objc_msgSend(v5, "addObject:", v16);
        }
        else
        {
          if (!v14)
            goto LABEL_12;
          -[CHLogger logHandle](v20, "logHandle");
          v16 = (CHTransaction *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v27 = v12;
            v28 = 2114;
            v29 = v15;
            _os_log_error_impl(&dword_1B3FA4000, &v16->super, OS_LOG_TYPE_ERROR, "Attempt to archive %@ failed with error %{public}@", buf, 0x16u);
          }
        }

LABEL_12:
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "count"))
  {
    transactionManager = v20->_transactionManager;
    v18 = (void *)objc_msgSend(v5, "copy");
    -[TransactionManagerProtocol appendTransactions:](transactionManager, "appendTransactions:", v18);

  }
}

- (void)insertRecordsWithoutTransactions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SyncManager dbHandle](self, "dbHandle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createCallRecords:", v4);

}

- (int64_t)deleteCallsWithPredicate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  int v10;

  v6 = a3;
  -[SyncManager dbHandle](self, "dbHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deleteCallsWithPredicate:", v6);

  if (v8 >= 1)
  {
    -[SyncManager dbHandle](self, "dbHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "saveDatabase:", a4);

    if (!v10)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

- (unint64_t)fetchCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v8 = a4;
  -[SyncManager updatedPredicate:withLimits:](self, "updatedPredicate:withLimits:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SyncManager dbHandle](self, "dbHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fetchCallCountWithPredicate:sortDescriptors:", v9, v8);

  return v11;
}

- (id)fetchCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5 limit:(unint64_t)a6 offset:(unint64_t)a7 batchSize:(unint64_t)a8
{
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v14 = a4;
  -[SyncManager updatedPredicate:withLimits:](self, "updatedPredicate:withLimits:", a3, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SyncManager dbHandle](self, "dbHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchCallsWithPredicate:sortDescriptors:limit:offset:batchSize:", v15, v14, a6, a7, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)fetchCallIdentifiersWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5 limit:(unint64_t)a6 offset:(unint64_t)a7 batchSize:(unint64_t)a8
{
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v14 = a4;
  -[SyncManager updatedPredicate:withLimits:](self, "updatedPredicate:withLimits:", a3, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SyncManager dbHandle](self, "dbHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchCallIdentifiersWithPredicate:sortDescriptors:limit:offset:batchSize:", v15, v14, a6, a7, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unint64_t)fetchCoalescedCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v8 = a4;
  -[SyncManager updatedPredicate:withLimits:](self, "updatedPredicate:withLimits:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SyncManager dbHandle](self, "dbHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fetchCoalescedCallCountWithPredicate:sortDescriptors:", v9, v8);

  return v11;
}

- (id)fetchCoalescedCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limitsDictionary:(id)a5 limit:(unint64_t)a6 offset:(unint64_t)a7 batchSize:(unint64_t)a8
{
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v14 = a4;
  -[SyncManager updatedPredicate:withLimits:](self, "updatedPredicate:withLimits:", a3, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SyncManager dbHandle](self, "dbHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchCoalescedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:", v15, v14, a6, a7, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)fetchAllObjects
{
  void *v2;
  void *v3;

  -[SyncManager dbHandle](self, "dbHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAll");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fetchObjectWithUniqueId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SyncManager dbHandle](self, "dbHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchObjectWithUniqueId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)updatedPredicate:(id)a3 withLimits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SyncManager predicateForLimits:](self, "predicateForLimits:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E0CB3528];
    v13[0] = v6;
    v13[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

- (id)bundleIDToServiceProvider:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v3 = (__CFString *)a3;
  if (-[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", CFSTR("com.apple.mobilephone")))
  {
    if (-[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", CFSTR("com.apple.FaceTime")))
      v4 = v3;
    else
      v4 = CFSTR("com.apple.FaceTime");
  }
  else
  {
    v4 = CFSTR("com.apple.Telephony");
  }
  v5 = v4;

  return v5;
}

- (id)fetchObjectsWithLimits:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[SyncManager predicateForLimits:](self, "predicateForLimits:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHLogger logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "predicateFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "fetching with predicate: %@", (uint8_t *)&v10, 0xCu);

  }
  -[SyncManager dbHandle](self, "dbHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchObjectsWithPredicate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)deleteObjectsWithUniqueIds:(id)a3 withTransaction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  CHTransaction *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SyncManager dbHandle](self, "dbHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchObjectsWithUniqueIds:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  -[CHLogger logHandle](self, "logHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      v28 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "Deleting all %lu objects", buf, 0xCu);
    }

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v4)
    {
      v21 = v6;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v12);
            -[SyncManager archiveCallObject:](self, "archiveCallObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = -[CHTransaction initWithType:andRecord:]([CHTransaction alloc], "initWithType:andRecord:", 2, v17);
            -[NSObject addObject:](v10, "addObject:", v18);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v14);
      }

      -[SyncManager dbHandle](self, "dbHandle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v21;
      objc_msgSend(v19, "deleteObjectsWithUniqueIds:", v21);

      -[TransactionManagerProtocol appendTransactions:](self->_transactionManager, "appendTransactions:", v10);
    }
    else
    {
      -[SyncManager dbHandle](self, "dbHandle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "deleteObjectsWithUniqueIds:", v6);

    }
    notify_post("com.apple.callhistory.RecentDeletedNotification");
  }
  else if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "No Call Records found", buf, 2u);
  }

}

- (void)deleteAllObjects
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  CHTransaction *v19;
  CHRecentCall *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  CHTransaction *v25;
  id *p_isa;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SyncManager *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1B5E33064](self, a2);
  -[SyncManager dbHandle](self, "dbHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAllNoLimit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v30 = v3;
    v31 = self;
    -[CHLogger logHandle](self, "logHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v39 = v7;
      _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Deleting %lu calls", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
          v33 = 0;
          objc_msgSend(v15, "archivedDataWithError:", &v33, v28);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v33;
          v18 = v17;
          if (v16)
          {
            v19 = -[CHTransaction initWithType:andRecord:]([CHTransaction alloc], "initWithType:andRecord:", 2, v16);
            objc_msgSend(v9, "addObject:", v19);
          }
          else
          {
            if (!v17)
              goto LABEL_15;
            -[CHLogger logHandle](v31, "logHandle");
            v19 = (CHTransaction *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v39 = (uint64_t)v15;
              v40 = 2114;
              v41 = v18;
              _os_log_error_impl(&dword_1B3FA4000, &v19->super, OS_LOG_TYPE_ERROR, "Attempt to archive %@ failed with error %{public}@", buf, 0x16u);
            }
          }

LABEL_15:
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v12);
    }

    v20 = objc_alloc_init(CHRecentCall);
    +[CHTransaction toString:](CHTransaction, "toString:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHRecentCall setUniqueId:](v20, "setUniqueId:", v21);

    v32 = 0;
    -[CHRecentCall archivedDataWithError:](v20, "archivedDataWithError:", &v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v32;
    v24 = v23;
    if (v22)
    {
      v25 = -[CHTransaction initWithType:andRecord:]([CHTransaction alloc], "initWithType:andRecord:", 3, v22);
      objc_msgSend(v9, "addObject:", v25);
      v3 = v30;
      p_isa = (id *)&v31->super.super.isa;
    }
    else
    {
      v3 = v30;
      p_isa = (id *)&v31->super.super.isa;
      if (!v23)
      {
LABEL_23:
        objc_msgSend(p_isa, "dbHandle", v28);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "deleteAll");

        objc_msgSend(p_isa[4], "appendTransactions:", v9);
        notify_post("com.apple.callhistory.RecentsClearedNotification");

        v5 = v29;
        goto LABEL_24;
      }
      -[CHLogger logHandle](v31, "logHandle");
      v25 = (CHTransaction *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v25->super, OS_LOG_TYPE_ERROR))
        -[SyncManager insert:withTransaction:].cold.1();
    }

    goto LABEL_23;
  }
LABEL_24:

  objc_autoreleasePoolPop(v3);
}

- (void)deleteObjectsWithLimits:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  CHTransaction *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *context;
  void *v20;
  id obj;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  CHTransaction *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1B5E33064]();
  v20 = v4;
  -[SyncManager fetchObjectsWithLimits:](self, "fetchObjectsWithLimits:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHLogger logHandle](self, "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "Deleting %d objects", buf, 8u);
  }

  v23 = (void *)objc_opt_new();
  v22 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "uniqueId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[SyncManager archiveCallObject:](self, "archiveCallObject:", v11);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = -[CHTransaction initWithType:andRecord:]([CHTransaction alloc], "initWithType:andRecord:", 2, v13);
          objc_msgSend(v23, "addObject:", v14);
          objc_msgSend(v11, "uniqueId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v15);

        }
        else
        {
          -[CHLogger logHandle](self, "logHandle");
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            goto LABEL_13;
          +[CHRecentCall callMediaTypeAsString:](CHRecentCall, "callMediaTypeAsString:", objc_msgSend(v11, "mediaType"));
          v14 = (CHTransaction *)objc_claimAutoreleasedReturnValue();
          +[CHRecentCall callTTYTypeAsString:](CHRecentCall, "callTTYTypeAsString:", objc_msgSend(v11, "ttyType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "date");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v29 = v14;
          v30 = 2114;
          v31 = v16;
          v32 = 2114;
          v33 = v17;
          _os_log_impl(&dword_1B3FA4000, v13, OS_LOG_TYPE_DEFAULT, "Cannot delete call with mediaType %{public}@ and ttyType %{public}@ placed on %{public}@ with nil unique ID", buf, 0x20u);

        }
LABEL_13:

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v8);
  }

  -[SyncManager dbHandle](self, "dbHandle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deleteObjectsWithUniqueIds:", v22);

  -[TransactionManagerProtocol appendTransactions:](self->_transactionManager, "appendTransactions:", v23);
  objc_autoreleasePoolPop(context);

}

- (void)updateObjects:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1B5E33064]();
  -[SyncManager dbHandle](self, "dbHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCallRecords:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SyncManager addUpdateTransactions:](self, "addUpdateTransactions:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)updateAllObjects:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1B5E33064]();
  -[SyncManager dbHandle](self, "dbHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAllCallRecords:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SyncManager addUpdateTransactions:](self, "addUpdateTransactions:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)addUpdateTransactions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CHTransaction *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[SyncManager archiveCallObject:](self, "archiveCallObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = -[CHTransaction initWithType:andRecord:]([CHTransaction alloc], "initWithType:andRecord:", 1, v11);
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[TransactionManagerProtocol appendTransactions:](self->_transactionManager, "appendTransactions:", v5);
}

- (double)timerLifetime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SyncManager dbHandle](self, "dbHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timerLifetime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)timerIncoming
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SyncManager dbHandle](self, "dbHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timerIncoming");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)timerOutgoing
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SyncManager dbHandle](self, "dbHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timerOutgoing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)resetTimers
{
  id v2;

  -[SyncManager dbHandle](self, "dbHandle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetTimers");

}

- (id)archiveCallObject:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB36F8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "setOutputFormat:", 200);
  objc_msgSend(v5, "encodeObject:forKey:", v4, *MEMORY[0x1E0CB2CD0]);

  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (TransactionManagerProtocol)transactionManager
{
  return self->_transactionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_dbHandle, 0);
}

- (void)insert:withTransaction:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1B3FA4000, v0, v1, "Attempt to archive %@ failed with error %{public}@");
}

@end
