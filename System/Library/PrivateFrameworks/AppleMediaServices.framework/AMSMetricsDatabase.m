@implementation AMSMetricsDatabase

void __41__AMSMetricsDatabase_insertEvents_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id obj;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v37;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v8);
        objc_msgSend(v9, "topic");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (!v11)
        {
          +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v14 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v14, "OSLogObject");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v21 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v41 = v21;
            v22 = v21;
            _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: No topic found on event", buf, 0xCu);

          }
          goto LABEL_17;
        }
        objc_msgSend(v9, "databaseEventBody");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        +[AMSData dataWithObject:encoding:error:](AMSData, "dataWithObject:encoding:error:", v12, 3, &v35);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v35;

        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v13, 4);
        v16 = v15;
        if (v14 || !objc_msgSend(v15, "length"))
        {
          +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v17, "OSLogObject");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v41 = v19;
            v42 = 2114;
            v43 = v14;
            v20 = v19;
            _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to serialize event fields to JSON. Error: %{public}@", buf, 0x16u);

          }
LABEL_17:

          goto LABEL_18;
        }
        objc_msgSend(*(id *)(a1 + 32), "connection");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(a1 + 40);
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v34 = *(id *)(v25 + 40);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __41__AMSMetricsDatabase_insertEvents_error___block_invoke_68;
        v31[3] = &unk_1E2540340;
        v31[4] = v9;
        v26 = v16;
        v32 = v26;
        v33 = v29;
        LOBYTE(v24) = objc_msgSend(v23, "executePreparedStatement:error:bindings:", v24, &v34, v31);
        objc_storeStrong((id *)(v25 + 40), v34);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v24;

        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {

          goto LABEL_27;
        }
        v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);

        if (v27)
          goto LABEL_27;
LABEL_18:
        ++v8;
      }
      while (v6 != v8);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      v6 = v28;
    }
    while (v28);
  }
LABEL_27:

}

void __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  __int128 v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v13 = objc_opt_class();
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query identifier_stores. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(v5, "bindString:atPosition:", a1[5], 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_99;
    v9[3] = &unk_1E25435B0;
    v9[4] = a1[4];
    v10 = *((_OWORD *)a1 + 3);
    v11 = a1[8];
    objc_msgSend(v5, "enumerateRowsUsingBlock:", v9);
  }

}

void __42__AMSMetricsDatabase__performTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__AMSMetricsDatabase__performTransaction___block_invoke_2;
  v6[3] = &unk_1E25436F0;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performTransaction:", v6);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __42__AMSMetricsDatabase__performTransaction___block_invoke_3;
  v5[3] = &unk_1E2543718;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "performTransaction:", v5);

}

- (AMSSQLiteConnection)connection
{
  return self->_connection;
}

uint64_t __42__AMSMetricsDatabase__performTransaction___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  BOOL v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v2 = objc_msgSend(v1, "executeStatement:error:", CFSTR("PRAGMA incremental_vacuum(100);"), &v10);
  v3 = v10;

  if ((_DWORD)v2)
    v4 = v3 == 0;
  else
    v4 = 0;
  if (!v4)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogableError(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Incremental vacuum failed. Error = %{public}@", buf, 0x16u);

    }
  }

  return v2;
}

uint64_t __42__AMSMetricsDatabase__performTransaction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  double v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  _QWORD v25[6];
  id v26;
  id obj;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x2020000000;
  v36 = 0;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_2;
  v28[3] = &unk_1E25435D8;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  v28[4] = *(_QWORD *)(a1 + 32);
  v30 = v4;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 64);
  v29 = v6;
  v31 = v7;
  v32 = &v33;
  objc_msgSend(v2, "executeQuery:withResults:", CFSTR("SELECT store_key, store_uuid, account, interval, cross_device, started, last_sync, modified, deleted FROM identifier_stores WHERE store_key=?;"),
    v28);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    || (v8 = *(_QWORD *)(a1 + 48),
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8),
        obj = *(id *)(v9 + 40),
        v10 = (*(uint64_t (**)(void))(v8 + 16))(),
        objc_storeStrong((id *)(v9 + 40), obj),
        (v10 & 1) == 0))
  {
    v22 = *(_QWORD *)(a1 + 80);
  }
  else
  {
    v11 = v34[3];
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 <= 0.0)
      v14 = CFSTR("INSERT OR IGNORE INTO identifier_stores (store_uuid, account, interval, cross_device, started, last_sync, modified, store_key) VALUES (?,?,?,?,?,?,?,?);");
    else
      v14 = CFSTR("UPDATE identifier_stores SET store_uuid=?, account=?, interval=?, cross_device=?, started=?, last_sync=?, modified=?, deleted=0 WHERE store_key=? AND modified=?;");
    v15 = *(_QWORD *)(a1 + 64);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    v25[0] = v3;
    v25[1] = 3221225472;
    v25[2] = __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_105;
    v25[3] = &unk_1E2543600;
    v25[4] = v15;
    v25[5] = &v33;
    v26 = v17;
    objc_msgSend(v12, "executeStatement:error:bindings:", v14, &v26, v25);
    objc_storeStrong((id *)(v16 + 40), v26);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_opt_class();
        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v38 = v20;
        v39 = 2114;
        v40 = v21;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update or insert identifier_stores. %{public}@", buf, 0x16u);
      }

    }
    v22 = *(_QWORD *)(a1 + 72);
  }
  *(_BYTE *)(*(_QWORD *)(v22 + 8) + 24) = 1;
  v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) == 0;

  _Block_object_dispose(&v33, 8);
  return v23;
}

BOOL __41__AMSMetricsDatabase_insertEvents_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "prepareStatement:error:", CFSTR("INSERT OR REPLACE INTO events (report_url, eventBody, batchId, account, timestampInserted) VALUES (?,?,?,?,?);"),
    &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v5 = 0;
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __41__AMSMetricsDatabase_insertEvents_error___block_invoke_2;
    v20[3] = &unk_1E2543510;
    v6 = *(void **)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v22 = &v25;
    v7 = v4;
    v8 = *(_QWORD *)(a1 + 48);
    v21 = v7;
    v23 = v8;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v20);
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v9, "finalizePreparedStatement:error:", v7, &v19);
    v10 = v19;

    if (v10)
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (id)objc_opt_class();
        AMSLogableError(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = (uint64_t)v13;
        v31 = 2114;
        v32 = v14;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to finalize statement. Error = %{public}@", buf, 0x16u);

      }
    }
    if (*((_BYTE *)v26 + 24))
    {
      v5 = 1;
    }
    else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v5 = 0;
    }
    else
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v30 = v17;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Inserting events failed without an error", buf, 0xCu);
      }

      v5 = *((_BYTE *)v26 + 24) != 0;
    }

  }
  _Block_object_dispose(&v25, 8);
  return v5;
}

void __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  __int128 v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v13 = objc_opt_class();
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query identifiers. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(v5, "bindString:atPosition:", a1[5], 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_108;
    v9[3] = &unk_1E25435B0;
    v9[4] = a1[4];
    v10 = *((_OWORD *)a1 + 3);
    v11 = a1[8];
    objc_msgSend(v5, "enumerateRowsUsingBlock:", v9);
  }

}

BOOL __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  double v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  _QWORD v25[6];
  id v26;
  id obj;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x2020000000;
  v36 = 0;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_2;
  v28[3] = &unk_1E25435D8;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  v28[4] = *(_QWORD *)(a1 + 32);
  v30 = v4;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 64);
  v29 = v6;
  v31 = v7;
  v32 = &v33;
  objc_msgSend(v2, "executeQuery:withResults:", CFSTR("SELECT identifier_key, store_uuid, name, value, cross_device, expires, last_sync, modified, deleted, server_provided_at FROM identifiers WHERE identifier_key=?;"),
    v28);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    || (v8 = *(_QWORD *)(a1 + 48),
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8),
        obj = *(id *)(v9 + 40),
        v10 = (*(uint64_t (**)(void))(v8 + 16))(),
        objc_storeStrong((id *)(v9 + 40), obj),
        (v10 & 1) == 0))
  {
    v22 = *(_QWORD *)(a1 + 80);
  }
  else
  {
    v11 = v34[3];
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 <= 0.0)
      v14 = CFSTR("INSERT OR IGNORE INTO identifiers (store_uuid, name, value, cross_device, expires, last_sync, modified, server_provided_at, identifier_key) VALUES (?,?,?,?,?,?,?,?,?);");
    else
      v14 = CFSTR("UPDATE identifiers SET store_uuid=?, name=?, value=?, cross_device=?, expires=?, last_sync=?, modified=?, deleted=0, server_provided_at=? WHERE identifier_key=? AND modified=?;");
    v15 = *(_QWORD *)(a1 + 64);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    v25[0] = v3;
    v25[1] = 3221225472;
    v25[2] = __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_114;
    v25[3] = &unk_1E2543600;
    v25[4] = v15;
    v25[5] = &v33;
    v26 = v17;
    objc_msgSend(v12, "executeStatement:error:bindings:", v14, &v26, v25);
    objc_storeStrong((id *)(v16 + 40), v26);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_opt_class();
        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v38 = v20;
        v39 = 2114;
        v40 = v21;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update or insert identifiers. %{public}@", buf, 0x16u);
      }

    }
    v22 = *(_QWORD *)(a1 + 72);
  }
  *(_BYTE *)(*(_QWORD *)(v22 + 8) + 24) = 1;
  v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) == 0;

  _Block_object_dispose(&v33, 8);
  return v23;
}

uint64_t __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke(id *a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v2, "appendString:", CFSTR("SELECT pid, eventBody, batchId, account FROM events"));
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = v3;
  if (a1[4])
  {
    if (objc_msgSend(v3, "length"))
      objc_msgSend(v4, "appendString:", CFSTR(" AND"));
    objc_msgSend(v4, "appendString:", CFSTR(" report_url = ?"));
  }
  if (a1[5])
  {
    if (objc_msgSend(v4, "length"))
      objc_msgSend(v4, "appendString:", CFSTR(" AND"));
    objc_msgSend(v4, "appendString:", CFSTR(" locked_by = ? AND locked_time > ?"));
  }
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v2, "appendFormat:", CFSTR(" WHERE%@"), v4);
  objc_msgSend(v2, "appendString:", CFSTR(" ORDER BY report_url ASC, batchId ASC, timestampInserted ASC;"));
  objc_msgSend(a1[6], "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_2;
  v7[3] = &unk_1E25434C0;
  v7[4] = a1[6];
  v11 = a1[8];
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[7];
  objc_msgSend(v5, "executeQuery:withResults:", v2, v7);

  return 1;
}

void __51__AMSMetricsDatabase_unlockAllEventsWithKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;
  double v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindString:atPosition:", v2, 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3 + -600.0;
  *(float *)&v4 = v4;
  objc_msgSend(v5, "bindFloat:atPosition:", 2, v4);

}

uint64_t __51__AMSMetricsDatabase_unlockAllEventsWithKey_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__AMSMetricsDatabase_unlockAllEventsWithKey_error___block_invoke_2;
  v7[3] = &unk_1E2543448;
  v8 = v3;
  v5 = objc_msgSend(v2, "executeStatement:error:bindings:", CFSTR("UPDATE events SET locked_by = NULL, locked_time = 0 WHERE locked_by = ? OR locked_time <= ?;"),
         &obj,
         v7);
  objc_storeStrong((id *)(v4 + 40), obj);

  return v5;
}

uint64_t __45__AMSMetricsDatabase_lockAllEventsWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__AMSMetricsDatabase_lockAllEventsWithError___block_invoke_2;
  v7[3] = &unk_1E2543448;
  v8 = v3;
  v5 = objc_msgSend(v2, "executeStatement:error:bindings:", CFSTR("UPDATE events SET locked_by = ?, locked_time = ? WHERE locked_by IS NULL OR locked_by = '' OR locked_time <= ?;"),
         &obj,
         v7);
  objc_storeStrong((id *)(v4 + 40), obj);

  return v5;
}

uint64_t __39__AMSMetricsDatabase_dropEvents_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM events WHERE pid in (%@);"),
    *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "executeStatement:error:", v2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

  return v5;
}

void __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD6C8;
  qword_1ECEAD6C8 = v0;

}

- (AMSMetricsDatabase)initWithContainerId:(id)a3
{
  id v5;
  AMSMetricsDatabase *v6;
  AMSMetricsDatabase *v7;
  uint64_t v8;
  id *v9;
  void (**v10)(void);
  dispatch_queue_t v11;
  id v12;
  AMSSQLiteConnectionOptions *v13;
  AMSSQLiteConnectionOptions *v14;
  AMSSQLiteConnection *v15;
  NSObject *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  AMSMetricsDatabase *v26;
  uint64_t v28;
  uint64_t v29;
  BOOL (*v30)(uint64_t);
  void *v31;
  NSObject *v32;
  __int128 *p_buf;
  _QWORD v34[4];
  id *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  objc_super v43;
  uint8_t v44[4];
  uint64_t v45;
  __int128 buf;
  uint64_t v47;
  char v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)AMSMetricsDatabase;
  v6 = -[AMSMetricsDatabase init](&v43, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_18;
  objc_storeStrong((id *)&v6->_containerId, a3);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__43;
  v41 = __Block_byref_object_dispose__43;
  v8 = MEMORY[0x1E0C809B0];
  v42 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __42__AMSMetricsDatabase_initWithContainerId___block_invoke;
  v34[3] = &unk_1E253E378;
  v36 = &v37;
  v9 = v7;
  v35 = v9;
  AMSMetricsDatabaseBlockWithKeepAlive(CFSTR("AMSMetricsDatabase-init-createDirectory"), v34);
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v10[2]();

  if (v38[5])
  {
    v11 = dispatch_queue_create("com.apple.AMSMetricsDatabase.internal", 0);
    v12 = v9[3];
    v9[3] = v11;

    v13 = [AMSSQLiteConnectionOptions alloc];
    v14 = -[AMSSQLiteConnectionOptions initWithDatabasePath:](v13, "initWithDatabasePath:", v38[5]);
    -[AMSSQLiteConnectionOptions setCheckpointingOnCloseDisabled:](v14, "setCheckpointingOnCloseDisabled:", 1);
    v15 = -[AMSSQLiteConnection initWithOptions:]([AMSSQLiteConnection alloc], "initWithOptions:", v14);
    -[AMSSQLiteConnection setDelegate:](v15, "setDelegate:", v9);
    objc_storeStrong(v9 + 2, v15);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v47 = 0x2020000000;
    v48 = 0;
    v28 = v8;
    v29 = 3221225472;
    v30 = __42__AMSMetricsDatabase_initWithContainerId___block_invoke_8;
    v31 = &unk_1E253E378;
    p_buf = &buf;
    v16 = v15;
    v32 = v16;
    AMSMetricsDatabaseBlockWithKeepAlive(CFSTR("AMSMetricsDatabase-init-updateSchema"), &v28);
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v17[2](v17, v18, v19, v20);

    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v21 = 0;
    }
    else
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig", v28, v29, v30, v31);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_opt_class();
        *(_DWORD *)v44 = 138543362;
        v45 = v25;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Fatal Error: Failed to create the database schema", v44, 0xCu);
      }

      v21 = 1;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v14 = (AMSSQLiteConnectionOptions *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (AMSSQLiteConnectionOptions *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSSQLiteConnectionOptions OSLogObject](v14, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Fatal Error: Failed to fetch dbPath", (uint8_t *)&buf, 0xCu);
    }
    v21 = 1;
  }

  _Block_object_dispose(&v37, 8);
  if (v21)
    v26 = 0;
  else
LABEL_18:
    v26 = v7;

  return v26;
}

- (id)_cachePath
{
  void *v3;
  void *v4;

  +[AMSDatabaseHelper databaseFolderNameForType:](AMSDatabaseHelper, "databaseFolderNameForType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", self->_containerId);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __42__AMSMetricsDatabase_initWithContainerId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_cachePath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSDatabaseHelper databasePathForCachePath:type:](AMSDatabaseHelper, "databasePathForCachePath:type:", v5, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)sharedDatabaseWithContainerId:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__43;
  v23 = __Block_byref_object_dispose__43;
  v24 = 0;
  if (_MergedGlobals_128 != -1)
    dispatch_once(&_MergedGlobals_128, &__block_literal_global_86);
  v4 = (id)qword_1ECEAD6A8;
  if (qword_1ECEAD6B0 != -1)
    dispatch_once(&qword_1ECEAD6B0, &__block_literal_global_13_2);
  v5 = (id)qword_1ECEAD6B8;
  if (qword_1ECEAD6C0 != -1)
    dispatch_once(&qword_1ECEAD6C0, &__block_literal_global_17_1);
  v6 = (id)qword_1ECEAD6C8;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke_4;
  block[3] = &unk_1E25433A8;
  v14 = v5;
  v15 = v3;
  v17 = v4;
  v18 = &v19;
  v16 = v6;
  v7 = v4;
  v8 = v6;
  v9 = v3;
  v10 = v5;
  dispatch_sync(v7, block);
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (id)identifierForKey:(id)a3 updateMaybe:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD *v22;
  uint64_t *v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v7 = a3;
  v8 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__43;
  v40 = __Block_byref_object_dispose__43;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__43;
  v34 = __Block_byref_object_dispose__43;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v9 = MEMORY[0x1E0C809B0];
  do
  {
    v10 = (void *)v31[5];
    v31[5] = 0;

    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke;
    v17[3] = &unk_1E2543628;
    v17[4] = self;
    v20 = &v36;
    v11 = v7;
    v18 = v11;
    v21 = &v30;
    v22 = v24;
    v12 = v8;
    v19 = v12;
    v23 = &v26;
    -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v17);

  }
  while (!*((_BYTE *)v27 + 24));
  v13 = (void *)v37[5];
  if (v13)
  {
    v14 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }
  else
  {
    v14 = (id)v31[5];
  }
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v14;
}

- (id)identifierStoreForKey:(id)a3 updateMaybe:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD *v22;
  uint64_t *v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v7 = a3;
  v8 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__43;
  v40 = __Block_byref_object_dispose__43;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__43;
  v34 = __Block_byref_object_dispose__43;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v9 = MEMORY[0x1E0C809B0];
  do
  {
    v10 = (void *)v31[5];
    v31[5] = 0;

    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke;
    v17[3] = &unk_1E2543628;
    v17[4] = self;
    v20 = &v36;
    v11 = v7;
    v18 = v11;
    v21 = &v30;
    v22 = v24;
    v12 = v8;
    v19 = v12;
    v23 = &v26;
    -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v17);

  }
  while (!*((_BYTE *)v27 + 24));
  v13 = (void *)v37[5];
  if (v13)
  {
    v14 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }
  else
  {
    v14 = (id)v31[5];
  }
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v14;
}

- (BOOL)insertEvents:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__AMSMetricsDatabase_insertEvents_error___block_invoke;
  v14[3] = &unk_1E2543538;
  v14[4] = self;
  v16 = &v17;
  v7 = v6;
  v15 = v7;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v14);
  v8 = v18[5];
  if (v8)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogableError((void *)v18[5]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to insert events. Error = %{public}@", buf, 0x16u);

    }
    if (a4)
      *a4 = objc_retainAutorelease((id)v18[5]);
  }

  _Block_object_dispose(&v17, 8);
  return v8 == 0;
}

- (void)_performTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[AMSMetricsDatabase internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__AMSMetricsDatabase__performTransaction___block_invoke;
  v8[3] = &unk_1E253DC28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  AMSMetricsDatabaseBlockWithKeepAlive(CFSTR("AMSMetricsDatabase-transaction"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, v6);

}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)enumerateEventsWithTopic:(id)a3 lockKey:(id)a4 objectBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  AMSMetricsDatabase *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ams_iTunesAccounts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke;
  v17[3] = &unk_1E25434E8;
  v18 = v8;
  v19 = v9;
  v21 = v12;
  v22 = v10;
  v20 = self;
  v13 = v12;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v17);

}

void __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD6B8;
  qword_1ECEAD6B8 = v0;

}

void __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.AMSMetricsDatabase", v2);
  v1 = (void *)qword_1ECEAD6A8;
  qword_1ECEAD6A8 = (uint64_t)v0;

}

void __45__AMSMetricsDatabase_lockAllEventsWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "bindString:atPosition:", v2, 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(float *)&v3 = v3;
  objc_msgSend(v6, "bindFloat:atPosition:", 2, v3);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4 + -600.0;
  *(float *)&v5 = v5;
  objc_msgSend(v6, "bindFloat:atPosition:", 3, v5);

}

void __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogableError(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v9;
      v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query events. Error = %{public}@", buf, 0x16u);

    }
    buf[0] = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      objc_msgSend(v5, "bindString:atPosition:", v11, 1);
      v12 = 2;
    }
    else
    {
      v12 = 1;
    }
    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
    {
      objc_msgSend(v5, "bindString:atPosition:", v13, v12);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v15 = v14 + -600.0;
      *(float *)&v15 = v15;
      objc_msgSend(v5, "bindFloat:atPosition:", (v12 + 1), v15);
    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_57;
    v16[3] = &unk_1E2543498;
    v16[4] = *(_QWORD *)(a1 + 32);
    v18 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v5, "enumerateRowsUsingBlock:", v16);

  }
}

- (BOOL)dropEvents:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v23[4];
  id v24;
  AMSMetricsDatabase *v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__43;
  v35 = __Block_byref_object_dispose__43;
  v36 = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "databasePID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (!v13)
        {
          if (objc_msgSend(v6, "length"))
            objc_msgSend(v6, "appendString:", CFSTR(","));
          objc_msgSend(v11, "databasePID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v14);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "length"))
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __39__AMSMetricsDatabase_dropEvents_error___block_invoke;
    v23[3] = &unk_1E2543470;
    v24 = v6;
    v25 = self;
    v26 = &v31;
    -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v23);
    v15 = v32[5];
    v16 = v15 == 0;
    if (v15)
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        AMSLogableError((void *)v32[5]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v19;
        v39 = 2114;
        v40 = v20;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to drop events. Error = %{public}@", buf, 0x16u);

      }
      if (a4)
        *a4 = objc_retainAutorelease((id)v32[5]);
    }

  }
  else
  {
    v16 = 1;
  }

  _Block_object_dispose(&v31, 8);
  return v16;
}

- (BOOL)unlockAllEventsWithKey:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__AMSMetricsDatabase_unlockAllEventsWithKey_error___block_invoke;
  v14[3] = &unk_1E2543538;
  v14[4] = self;
  v16 = &v17;
  v7 = v6;
  v15 = v7;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v14);
  v8 = (void *)v18[5];
  if (v8)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v8);
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogableError((void *)v18[5]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lock events. Error = %{public}@", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v17, 8);
  return v8 == 0;
}

- (id)lockAllEventsWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[AMSMetricsDatabase _lockedById](self, "_lockedById");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__AMSMetricsDatabase_lockAllEventsWithError___block_invoke;
  v14[3] = &unk_1E2543538;
  v14[4] = self;
  v16 = &v17;
  v6 = v5;
  v15 = v6;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v14);
  v7 = (void *)v18[5];
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogableError((void *)v18[5]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lock events. Error = %{public}@", buf, 0x16u);

    }
    v12 = 0;
  }
  else
  {
    v12 = v6;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (id)_lockedById
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke_4(uint64_t a1)
{
  AMSMetricsDatabase *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  AMSMetricsDatabase *v6;
  dispatch_block_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  id v15;
  id v16;
  _QWORD block[4];
  AMSMetricsDatabase *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (AMSMetricsDatabase *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = -[AMSMetricsDatabase initWithContainerId:]([AMSMetricsDatabase alloc], "initWithContainerId:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v2);
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    dispatch_block_cancel(v3);
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AMSMetricsDatabase_sharedDatabaseWithContainerId___block_invoke_5;
  block[3] = &unk_1E253DBD8;
  v18 = v2;
  v6 = v2;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, block);

  v8 = *(void **)(a1 + 48);
  v9 = _Block_copy(v7);
  objc_msgSend(v8, "setObject:forKey:", v9, *(_QWORD *)(a1 + 40));

  v10 = *(void **)(a1 + 56);
  v11 = v7;
  v12 = v10;
  AMSLogKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 30000000000);
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __AMSDispatchAfter_block_invoke_4;
  v19[3] = &unk_1E253DC28;
  v20 = v13;
  v21 = v11;
  v15 = v13;
  v16 = v11;
  dispatch_after(v14, v12, v19);

}

BOOL __42__AMSMetricsDatabase_initWithContainerId___block_invoke_8(uint64_t a1)
{
  _BOOL8 result;

  result = +[AMSMetricsDatabaseSchema createOrUpdateSchemaUsingConnection:](AMSMetricsDatabaseSchema, "createOrUpdateSchemaUsingConnection:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[AMSMetricsDatabase close](self, "close");
  -[AMSMetricsDatabase setConnection:](self, "setConnection:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AMSMetricsDatabase;
  -[AMSMetricsDatabase dealloc](&v3, sel_dealloc);
}

- (void)close
{
  void (**v2)(void);
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__AMSMetricsDatabase_close__block_invoke;
  v3[3] = &unk_1E253DBD8;
  v3[4] = self;
  AMSMetricsDatabaseBlockWithKeepAlive(CFSTR("AMSMetricsDatabase-close"), v3);
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

void __27__AMSMetricsDatabase_close__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "close");

  if ((v2 & 1) == 0)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v5 = v7;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to close the database connection", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (int64_t)countAllEventsWithLockKey:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  AMSMetricsDatabase *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__43;
  v27 = __Block_byref_object_dispose__43;
  v28 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke;
  v18 = &unk_1E2543420;
  v7 = v6;
  v19 = v7;
  v20 = self;
  v21 = &v23;
  v22 = &v29;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", &v15);
  v8 = (void *)v24[5];
  if (a4)
  {
    *a4 = objc_retainAutorelease(v8);
  }
  else if (v8)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig", v15, v16, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogableError((void *)v24[5]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v11;
      v35 = 2114;
      v36 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to count events. Error = %{public}@", buf, 0x16u);

    }
  }
  v13 = v30[3];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

uint64_t __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v2, "appendString:", CFSTR("SELECT COUNT(*) FROM events"));
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v2, "appendString:", CFSTR(" locked_by = ? AND locked_time > ?"));
  objc_msgSend(v2, "appendString:", CFSTR(";"));
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke_2;
  v7[3] = &unk_1E25433F8;
  v9 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v8 = v4;
  v10 = v5;
  objc_msgSend(v3, "executeQuery:withResults:", v2, v7);

  return 1;
}

void __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  _QWORD v10[4];
  __int128 v11;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v9, "bindString:atPosition:", v6, 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v8 = v7 + -600.0;
      *(float *)&v8 = v8;
      objc_msgSend(v9, "bindFloat:atPosition:", 2, v8);
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke_3;
    v10[3] = &unk_1E25433D0;
    v11 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v9, "enumerateRowsUsingBlock:", v10);
  }

}

void __54__AMSMetricsDatabase_countAllEventsWithLockKey_error___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "int64ForColumnIndex:", 0);
  }

}

- (BOOL)dropAllEventsWithLockKey:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  AMSMetricsDatabase *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__43;
  v22 = __Block_byref_object_dispose__43;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__AMSMetricsDatabase_dropAllEventsWithLockKey_error___block_invoke;
  v14[3] = &unk_1E2543470;
  v7 = v6;
  v15 = v7;
  v16 = self;
  v17 = &v18;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v14);
  v8 = v19[5];
  if (v8)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogableError((void *)v19[5]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v11;
      v26 = 2114;
      v27 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to drop events. Error = %{public}@", buf, 0x16u);

    }
    if (a4)
      *a4 = objc_retainAutorelease((id)v19[5]);
  }

  _Block_object_dispose(&v18, 8);
  return v8 == 0;
}

uint64_t __53__AMSMetricsDatabase_dropAllEventsWithLockKey_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  id obj;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v2, "appendString:", CFSTR("DELETE FROM events"));
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v2, "appendString:", CFSTR(" WHERE locked_by = ?"));
  objc_msgSend(v2, "appendString:", CFSTR(";"));
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__AMSMetricsDatabase_dropAllEventsWithLockKey_error___block_invoke_2;
  v7[3] = &unk_1E2543448;
  v8 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v3, "executeStatement:error:bindings:", v2, &obj, v7);
  objc_storeStrong((id *)(v4 + 40), obj);

  return v5;
}

uint64_t __53__AMSMetricsDatabase_dropAllEventsWithLockKey_error___block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return objc_msgSend(a2, "bindString:atPosition:", v2, 1);
  return result;
}

void __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_57(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  AMSMetricsEvent *v28;
  void *v29;
  AMSMetricsEvent *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v8)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogableError(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v11;
      v44 = 2114;
      v45 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate events. Error = %{public}@", buf, 0x16u);

    }
    *a4 = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v13 = objc_msgSend(v7, "int64ForColumnIndex:", 0);
    objc_msgSend(v7, "stringForColumnIndex:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForColumnIndex:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForColumnIndex:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v41 = 0;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSData objectWithData:encoding:error:](AMSData, "objectWithData:encoding:error:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      if (!v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v34 = v15;
          v35 = v17;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "longLongValue"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = *(void **)(a1 + 40);
            v39[0] = MEMORY[0x1E0C809B0];
            v39[1] = 3221225472;
            v39[2] = __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_63;
            v39[3] = &unk_1E253D5A0;
            v40 = v19;
            v36 = v19;
            objc_msgSend(v20, "ams_firstObjectPassingTest:", v39);
            v21 = objc_claimAutoreleasedReturnValue();

            v22 = (void *)v21;
          }
          else
          {
            v22 = 0;
          }
          v23 = v13;
          v37 = v22;
          if (!v22 && v16)
          {
            +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v24)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v33 = v24;
            objc_msgSend(v24, "OSLogObject");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v31 = objc_opt_class();
              AMSHashIfNeeded(v16);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("topic"));
              v26 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v43 = v31;
              v44 = 2114;
              v45 = v32;
              v46 = 2114;
              v47 = v26;
              v27 = (void *)v26;
              _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Unable to locate account for dsid: %{public}@ topic: %{public}@", buf, 0x20u);

            }
          }
          v28 = [AMSMetricsEvent alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v35;
          v30 = -[AMSMetricsEvent initWithDatabaseEventBody:account:databasePID:](v28, "initWithDatabaseEventBody:account:databasePID:", v35, v37, v29);

          v15 = v34;
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        }
      }

    }
  }

}

uint64_t __67__AMSMetricsDatabase_enumerateEventsWithTopic_lockKey_objectBlock___block_invoke_63(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __41__AMSMetricsDatabase_insertEvents_error___block_invoke_68(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v3, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bindString:atPosition:", v4, 1);

  objc_msgSend(v8, "bindString:atPosition:", *(_QWORD *)(a1 + 40), 2);
  objc_msgSend(v8, "bindString:atPosition:", *(_QWORD *)(a1 + 48), 3);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_DSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bindNullableString:atPosition:", v7, 4);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "bindDouble:atPosition:", 5);

}

- (BOOL)unlockEvents:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v23[4];
  id v24;
  AMSMetricsDatabase *v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__43;
  v35 = __Block_byref_object_dispose__43;
  v36 = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "databasePID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (!v13)
        {
          if (objc_msgSend(v6, "length"))
            objc_msgSend(v6, "appendString:", CFSTR(","));
          objc_msgSend(v11, "databasePID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v14);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "length"))
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __41__AMSMetricsDatabase_unlockEvents_error___block_invoke;
    v23[3] = &unk_1E2543470;
    v24 = v6;
    v25 = self;
    v26 = &v31;
    -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v23);
    v15 = (void *)v32[5];
    v16 = v15 == 0;
    if (v15)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v15);
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        AMSLogableError((void *)v32[5]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v19;
        v39 = 2114;
        v40 = v20;
        _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to drop events. Error = %{public}@", buf, 0x16u);

      }
    }

  }
  else
  {
    v16 = 1;
  }

  _Block_object_dispose(&v31, 8);
  return v16;
}

uint64_t __41__AMSMetricsDatabase_unlockEvents_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE events SET locked_by = NULL, locked_time = 0 WHERE pid in (%@);"),
    *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "executeStatement:error:", v2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

  return v5;
}

- (BOOL)cleanupInvalidIdentifiersWithError:(id *)a3
{
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__43;
  v11 = __Block_byref_object_dispose__43;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke;
  v6[3] = &unk_1E2543560;
  v6[4] = self;
  v6[5] = &v7;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v6);
  v4 = (void *)v8[5];
  if (a3 && v4)
    *a3 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v7, 8);

  return v4 == 0;
}

uint64_t __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id obj;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = MEMORY[0x1E0C809B0];
  obj = *(id *)(v5 + 40);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke_2;
  v19[3] = &__block_descriptor_40_e28_v16__0___AMSSQLiteBinding__8l;
  v19[4] = v3;
  objc_msgSend(v4, "executeStatement:error:bindings:", CFSTR("DELETE FROM identifiers WHERE cross_device=0 AND ((expires>0 AND expires<?) OR store_uuid NOT IN (SELECT store_uuid FROM identifier_stores WHERE deleted=0));"),
    &obj,
    v19);
  objc_storeStrong((id *)(v5 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v9 = objc_opt_class();
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    v23 = 2114;
    v24 = v10;
    v11 = "%{public}@: Failed to delete identifiers. %{public}@";
LABEL_11:
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, v11, buf, 0x16u);
LABEL_12:

    return 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(id *)(v13 + 40);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke_80;
  v17[3] = &__block_descriptor_40_e28_v16__0___AMSSQLiteBinding__8l;
  v17[4] = v3;
  objc_msgSend(v12, "executeStatement:error:bindings:", CFSTR("UPDATE identifiers SET modified=?, deleted=1 WHERE deleted=0 AND ((expires>0 AND expires<?) OR store_uuid NOT IN (SELECT store_uuid FROM identifier_stores WHERE deleted=0));"),
    &v18,
    v17);
  objc_storeStrong((id *)(v13 + 40), v18);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v14 = objc_opt_class();
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v22 = v14;
    v23 = 2114;
    v24 = v15;
    v11 = "%{public}@: Failed to update identifiers. %{public}@";
    goto LABEL_11;
  }
  return 1;
}

uint64_t __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindDouble:atPosition:", 1, *(double *)(a1 + 32));
}

void __57__AMSMetricsDatabase_cleanupInvalidIdentifiersWithError___block_invoke_80(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindDouble:atPosition:", 1, v3);
  objc_msgSend(v4, "bindDouble:atPosition:", 2, *(double *)(a1 + 32));

}

- (BOOL)removeIdentifiersForAccount:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__43;
  v17 = __Block_byref_object_dispose__43;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke;
  v10[3] = &unk_1E2543538;
  v10[4] = self;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v10);
  v8 = (void *)v14[5];
  if (a4 && v8)
    *a4 = objc_retainAutorelease(v8);

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

BOOL __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  id obj;
  _QWORD v40[4];
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v42 = *(id *)(v6 + 40);
  v40[2] = __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_2;
  v40[3] = &unk_1E2543448;
  v7 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v41 = v5;
  objc_msgSend(v4, "executeStatement:error:bindings:", CFSTR("DELETE FROM identifiers WHERE cross_device=0 AND store_uuid in (SELECT store_uuid FROM identifier_stores WHERE account=?);"),
    &v42,
    v40);
  objc_storeStrong((id *)(v6 + 40), v42);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v44 = v10;
      v45 = 2114;
      v46 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete identifiers. %{public}@", buf, 0x16u);
    }

    v12 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v15 + 40);
    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_85;
    v36[3] = &unk_1E2543588;
    v38 = v3;
    v37 = v14;
    objc_msgSend(v13, "executeStatement:error:bindings:", CFSTR("UPDATE identifiers SET modified=?, deleted=1 WHERE deleted=0 AND store_uuid in (SELECT store_uuid FROM identifier_stores WHERE account=?);"),
      &obj,
      v36);
    objc_storeStrong((id *)(v15 + 40), obj);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v44 = v18;
        v45 = 2114;
        v46 = v19;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update identifiers. %{public}@", buf, 0x16u);
      }

      v12 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "connection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 40);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v35 = *(id *)(v22 + 40);
      v29 = v7;
      v30 = 3221225472;
      v31 = __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_88;
      v32 = &unk_1E2543588;
      v34 = v3;
      v33 = v21;
      objc_msgSend(v20, "executeStatement:error:bindings:", CFSTR("UPDATE identifier_stores SET modified=?, deleted=1 WHERE deleted=0 AND account=?;"),
        &v35,
        &v29);
      objc_storeStrong((id *)(v22 + 40), v35);

      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v12 = v23 == 0;
      if (v23)
      {
        +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig", v29, v30, v31, v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v24, "OSLogObject");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = objc_opt_class();
          v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          v44 = v26;
          v45 = 2114;
          v46 = v27;
          _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update identifier_stores. %{public}@", buf, 0x16u);
        }

      }
      v16 = v33;
    }

    v8 = v37;
  }

  return v12;
}

uint64_t __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindString:atPosition:", *(_QWORD *)(a1 + 32), 1);
}

void __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_85(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindDouble:atPosition:", 1, v3);
  objc_msgSend(v4, "bindString:atPosition:", *(_QWORD *)(a1 + 32), 2);

}

void __56__AMSMetricsDatabase_removeIdentifiersForAccount_error___block_invoke_88(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindDouble:atPosition:", 1, v3);
  objc_msgSend(v4, "bindString:atPosition:", *(_QWORD *)(a1 + 32), 2);

}

- (BOOL)removeIdentifiersForStore:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__43;
  v17 = __Block_byref_object_dispose__43;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke;
  v10[3] = &unk_1E2543538;
  v10[4] = self;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v10);
  v8 = (void *)v14[5];
  if (a4 && v8)
    *a4 = objc_retainAutorelease(v8);

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

BOOL __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  id obj;
  _QWORD v40[4];
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v42 = *(id *)(v6 + 40);
  v40[2] = __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_2;
  v40[3] = &unk_1E2543448;
  v7 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v41 = v5;
  objc_msgSend(v4, "executeStatement:error:bindings:", CFSTR("DELETE FROM identifiers WHERE cross_device=0 AND store_uuid in (SELECT store_uuid FROM identifier_stores WHERE store_key=?);"),
    &v42,
    v40);
  objc_storeStrong((id *)(v6 + 40), v42);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v44 = v10;
      v45 = 2114;
      v46 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete identifiers. %{public}@", buf, 0x16u);
    }

    v12 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v15 + 40);
    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_93;
    v36[3] = &unk_1E2543588;
    v38 = v3;
    v37 = v14;
    objc_msgSend(v13, "executeStatement:error:bindings:", CFSTR("UPDATE identifiers SET modified=?, deleted=1 WHERE deleted=0 AND store_uuid in (SELECT store_uuid FROM identifier_stores WHERE store_key=?);"),
      &obj,
      v36);
    objc_storeStrong((id *)(v15 + 40), obj);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v44 = v18;
        v45 = 2114;
        v46 = v19;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update identifiers. %{public}@", buf, 0x16u);
      }

      v12 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "connection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 40);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v35 = *(id *)(v22 + 40);
      v29 = v7;
      v30 = 3221225472;
      v31 = __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_96;
      v32 = &unk_1E2543588;
      v34 = v3;
      v33 = v21;
      objc_msgSend(v20, "executeStatement:error:bindings:", CFSTR("UPDATE identifier_stores SET modified=?, deleted=1 WHERE deleted=0 AND store_key=?;"),
        &v35,
        &v29);
      objc_storeStrong((id *)(v22 + 40), v35);

      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v12 = v23 == 0;
      if (v23)
      {
        +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig", v29, v30, v31, v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v24, "OSLogObject");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = objc_opt_class();
          v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          v44 = v26;
          v45 = 2114;
          v46 = v27;
          _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update identifier_stores. %{public}@", buf, 0x16u);
        }

      }
      v16 = v33;
    }

    v8 = v37;
  }

  return v12;
}

uint64_t __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindString:atPosition:", *(_QWORD *)(a1 + 32), 1);
}

void __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_93(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindDouble:atPosition:", 1, v3);
  objc_msgSend(v4, "bindString:atPosition:", *(_QWORD *)(a1 + 32), 2);

}

void __54__AMSMetricsDatabase_removeIdentifiersForStore_error___block_invoke_96(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindDouble:atPosition:", 1, v3);
  objc_msgSend(v4, "bindString:atPosition:", *(_QWORD *)(a1 + 32), 2);

}

void __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_99(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v8)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v23 = 138543618;
      v24 = objc_opt_class();
      v25 = 2114;
      v26 = v8;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate identifier_stores. %{public}@", (uint8_t *)&v23, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v11 = objc_opt_new();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(v7, "stringForColumnIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setStoreKey:", v14);

    objc_msgSend(v7, "stringForColumnIndex:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setStoreUUID:", v15);

    objc_msgSend(v7, "stringForColumnIndex:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setAccount:", v16);

    objc_msgSend(v7, "doubleForColumnIndex:", 3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setResetInterval:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setCrossDeviceSync:", objc_msgSend(v7, "intForColumnIndex:", 4) != 0);
    objc_msgSend(v7, "doubleForColumnIndex:", 5);
    if (v17 <= 0.0)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setStarted:", v18);

    objc_msgSend(v7, "doubleForColumnIndex:", 6);
    if (v19 <= 0.0)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setLastSync:", v20);

    objc_msgSend(v7, "doubleForColumnIndex:", 7);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v21;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(*(_QWORD *)(a1[7] + 8) + 24));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setModified:", v22);

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setDeleted:", objc_msgSend(v7, "intForColumnIndex:", 8) != 0);
  }
  *a4 = 1;

}

void __62__AMSMetricsDatabase_identifierStoreForKey_updateMaybe_error___block_invoke_105(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "storeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindString:atPosition:", v3, 1);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindString:atPosition:", v4, 2);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "resetInterval");
  objc_msgSend(v9, "bindDouble:atPosition:", 3);
  objc_msgSend(v9, "bindInt:atPosition:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "crossDeviceSync"), 4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "started");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "bindDouble:atPosition:", 5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastSync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "bindDouble:atPosition:", 6);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "modified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "bindDouble:atPosition:", 7);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "storeKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bindString:atPosition:", v8, 8);

  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 0.0)
    objc_msgSend(v9, "bindDouble:atPosition:", 9);

}

void __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_108(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v8)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v26 = 138543618;
      v27 = objc_opt_class();
      v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate identifiers. %{public}@", (uint8_t *)&v26, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v11 = objc_opt_new();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(v7, "stringForColumnIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setIdKey:", v14);

    objc_msgSend(v7, "stringForColumnIndex:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setStoreUUID:", v15);

    objc_msgSend(v7, "stringForColumnIndex:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setName:", v16);

    objc_msgSend(v7, "stringForColumnIndex:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setValue:", v17);

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setCrossDeviceSync:", objc_msgSend(v7, "intForColumnIndex:", 4) != 0);
    objc_msgSend(v7, "doubleForColumnIndex:", 5);
    if (v18 <= 0.0)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setExpires:", v19);

    objc_msgSend(v7, "doubleForColumnIndex:", 6);
    if (v20 <= 0.0)
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setLastSync:", v21);

    objc_msgSend(v7, "doubleForColumnIndex:", 7);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v22;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(*(_QWORD *)(a1[7] + 8) + 24));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setModified:", v23);

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setDeleted:", objc_msgSend(v7, "intForColumnIndex:", 8) != 0);
    objc_msgSend(v7, "doubleForColumnIndex:", 9);
    if (v24 <= 0.0)
    {
      v25 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setServerProvidedAt:", v25);

  }
  *a4 = 1;

}

void __57__AMSMetricsDatabase_identifierForKey_updateMaybe_error___block_invoke_114(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "storeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindString:atPosition:", v3, 1);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindString:atPosition:", v4, 2);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindString:atPosition:", v5, 3);

  objc_msgSend(v11, "bindInt:atPosition:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "crossDeviceSync"), 4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "expires");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "bindDouble:atPosition:", 5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastSync");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "bindDouble:atPosition:", 6);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "modified");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "bindDouble:atPosition:", 7);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "serverProvidedAt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "bindDouble:atPosition:", 8);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "idKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bindString:atPosition:", v10, 9);

  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 0.0)
    objc_msgSend(v11, "bindDouble:atPosition:", 10);

}

- (BOOL)clearIdentifierSyncStateWithError:(id *)a3
{
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__43;
  v11 = __Block_byref_object_dispose__43;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__AMSMetricsDatabase_clearIdentifierSyncStateWithError___block_invoke;
  v6[3] = &unk_1E2543560;
  v6[4] = self;
  v6[5] = &v7;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v6);
  v4 = (void *)v8[5];
  if (a3 && v4)
    *a3 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v7, 8);

  return v4 == 0;
}

uint64_t __56__AMSMetricsDatabase_clearIdentifierSyncStateWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  id obj;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "executeStatement:error:", CFSTR("UPDATE identifiers SET last_sync=0 WHERE cross_device=1;"), &obj);
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    v8 = "%{public}@: Failed to clear identifiers last sync. %{public}@";
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(id *)(v10 + 40);
  objc_msgSend(v9, "executeStatement:error:", CFSTR("UPDATE identifier_stores SET last_sync=0 WHERE cross_device=1;"),
    &v14);
  objc_storeStrong((id *)(v10 + 40), v14);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    return 1;
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v11 = objc_opt_class();
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    v8 = "%{public}@: Failed to clear identifier_stores last sync. %{public}@";
LABEL_11:
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
  }
LABEL_12:

  return 0;
}

- (BOOL)enumerateUnsyncedIdentifierStoresUsingBlock:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__43;
  v17 = __Block_byref_object_dispose__43;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke;
  v10[3] = &unk_1E25436A0;
  v10[4] = self;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v10);
  v8 = (void *)v14[5];
  if (a4 && v8)
    *a4 = objc_retainAutorelease(v8);

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

BOOL __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _BOOL8 v4;
  __int128 v6;
  _QWORD v7[5];
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke_2;
  v7[3] = &unk_1E2543678;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 40);
  v3 = (id)v6;
  v8 = v6;
  objc_msgSend(v2, "executeQuery:withResults:", CFSTR("SELECT store_key, store_uuid, account, interval, started, last_sync, modified, deleted FROM identifier_stores WHERE cross_device=1 AND last_sync<modified;"),
    v7);

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) == 0;
  return v4;
}

void __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  __int128 v10;
  _QWORD v11[5];
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = objc_opt_class();
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query identifier_stores. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke_121;
    v11[3] = &unk_1E2543650;
    v11[4] = *(_QWORD *)(a1 + 32);
    v10 = *(_OWORD *)(a1 + 40);
    v9 = (id)v10;
    v12 = v10;
    objc_msgSend(a2, "enumerateRowsUsingBlock:", v11);

  }
}

void __72__AMSMetricsDatabase_enumerateUnsyncedIdentifierStoresUsingBlock_error___block_invoke_121(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v8)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v21 = 138543618;
      v22 = objc_opt_class();
      v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate identifier_stores. %{public}@", (uint8_t *)&v21, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v7, "stringForColumnIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStoreKey:", v12);

    objc_msgSend(v7, "stringForColumnIndex:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStoreUUID:", v13);

    objc_msgSend(v7, "stringForColumnIndex:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccount:", v14);

    objc_msgSend(v7, "doubleForColumnIndex:", 3);
    objc_msgSend(v11, "setResetInterval:");
    objc_msgSend(v7, "doubleForColumnIndex:", 4);
    if (v15 <= 0.0)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setStarted:", v16);

    objc_msgSend(v7, "doubleForColumnIndex:", 5);
    if (v17 <= 0.0)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setLastSync:", v18);

    objc_msgSend(v7, "doubleForColumnIndex:", 6);
    if (v19 <= 0.0)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setModified:", v20);

    objc_msgSend(v11, "setDeleted:", objc_msgSend(v7, "intForColumnIndex:", 7) != 0);
    *a4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() ^ 1;

  }
}

- (BOOL)enumerateUnsyncedIdentifiersUsingBlock:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__43;
  v17 = __Block_byref_object_dispose__43;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke;
  v10[3] = &unk_1E25436A0;
  v10[4] = self;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v10);
  v8 = (void *)v14[5];
  if (a4 && v8)
    *a4 = objc_retainAutorelease(v8);

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

BOOL __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _BOOL8 v4;
  __int128 v6;
  _QWORD v7[5];
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke_2;
  v7[3] = &unk_1E2543678;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 40);
  v3 = (id)v6;
  v8 = v6;
  objc_msgSend(v2, "executeQuery:withResults:", CFSTR("SELECT identifier_key, store_uuid, name, value, cross_device, expires, last_sync, modified, deleted, server_provided_at FROM identifiers WHERE cross_device=1 AND last_sync<modified AND (expires=0 OR expires>?);"),
    v7);

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) == 0;
  return v4;
}

void __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  __int128 v10;
  _QWORD v11[5];
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = objc_opt_class();
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query identifiers. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "bindDouble:atPosition:", 1);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke_124;
    v11[3] = &unk_1E2543650;
    v11[4] = *(_QWORD *)(a1 + 32);
    v10 = *(_OWORD *)(a1 + 40);
    v9 = (id)v10;
    v12 = v10;
    objc_msgSend(v5, "enumerateRowsUsingBlock:", v11);

  }
}

void __67__AMSMetricsDatabase_enumerateUnsyncedIdentifiersUsingBlock_error___block_invoke_124(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v8)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v24 = 138543618;
      v25 = objc_opt_class();
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate identifiers. %{public}@", (uint8_t *)&v24, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v7, "stringForColumnIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIdKey:", v12);

    objc_msgSend(v7, "stringForColumnIndex:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStoreUUID:", v13);

    objc_msgSend(v7, "stringForColumnIndex:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", v14);

    objc_msgSend(v7, "stringForColumnIndex:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:", v15);

    objc_msgSend(v11, "setCrossDeviceSync:", objc_msgSend(v7, "intForColumnIndex:", 4) != 0);
    objc_msgSend(v7, "doubleForColumnIndex:", 5);
    if (v16 <= 0.0)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setExpires:", v17);

    objc_msgSend(v7, "doubleForColumnIndex:", 6);
    if (v18 <= 0.0)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setLastSync:", v19);

    objc_msgSend(v7, "doubleForColumnIndex:", 7);
    if (v20 <= 0.0)
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setModified:", v21);

    objc_msgSend(v11, "setDeleted:", objc_msgSend(v7, "intForColumnIndex:", 8) != 0);
    objc_msgSend(v7, "doubleForColumnIndex:", 9);
    if (v22 <= 0.0)
    {
      v23 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setServerProvidedAt:", v23);

    *a4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() ^ 1;
  }

}

- (BOOL)permanentlyRemoveIdentifierForKey:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__43;
  v17 = __Block_byref_object_dispose__43;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke;
  v10[3] = &unk_1E2543538;
  v10[4] = self;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v10);
  v8 = (void *)v14[5];
  if (a4 && v8)
    *a4 = objc_retainAutorelease(v8);

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

BOOL __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id obj;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v5 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke_2;
  v26[3] = &unk_1E2543448;
  v27 = v3;
  objc_msgSend(v2, "executeStatement:error:bindings:", CFSTR("DELETE FROM identifier_stores WHERE store_key=?"), &obj, v26);
  objc_storeStrong((id *)(v4 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v30 = v8;
      v31 = 2114;
      v32 = v9;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete identifier_stores. %{public}@", buf, 0x16u);
    }

    v10 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v25 = *(id *)(v13 + 40);
    v20 = v5;
    v21 = 3221225472;
    v22 = __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke_129;
    v23 = &unk_1E2543448;
    v24 = v12;
    objc_msgSend(v11, "executeStatement:error:bindings:", CFSTR("DELETE FROM identifiers WHERE identifier_key=?"), &v25, &v20);
    objc_storeStrong((id *)(v13 + 40), v25);

    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = v14 == 0;
    if (v14)
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig", v20, v21, v22, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v30 = v17;
        v31 = 2114;
        v32 = v18;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete identifiers. %{public}@", buf, 0x16u);
      }

    }
    v6 = v24;
  }

  return v10;
}

uint64_t __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindString:atPosition:", *(_QWORD *)(a1 + 32), 1);
}

uint64_t __62__AMSMetricsDatabase_permanentlyRemoveIdentifierForKey_error___block_invoke_129(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindString:atPosition:", *(_QWORD *)(a1 + 32), 1);
}

- (BOOL)removeCrossDeviceIdentifiersWithError:(id *)a3
{
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__43;
  v11 = __Block_byref_object_dispose__43;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__AMSMetricsDatabase_removeCrossDeviceIdentifiersWithError___block_invoke;
  v6[3] = &unk_1E2543560;
  v6[4] = self;
  v6[5] = &v7;
  -[AMSMetricsDatabase _performTransaction:](self, "_performTransaction:", v6);
  v4 = (void *)v8[5];
  if (a3 && v4)
    *a3 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v7, 8);

  return v4 == 0;
}

uint64_t __60__AMSMetricsDatabase_removeCrossDeviceIdentifiersWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  id obj;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "executeStatement:error:", CFSTR("DELETE FROM identifiers WHERE cross_device=1 OR store_uuid IN (SELECT store_uuid FROM identifier_stores WHERE cross_device=1);"),
    &obj);
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    v8 = "%{public}@: Failed to delete identifiers. %{public}@";
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(id *)(v10 + 40);
  objc_msgSend(v9, "executeStatement:error:", CFSTR("DELETE FROM identifier_stores WHERE cross_device=1;"), &v14);
  objc_storeStrong((id *)(v10 + 40), v14);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    return 1;
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v11 = objc_opt_class();
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    v8 = "%{public}@: Failed to delete identifier_stores. %{public}@";
LABEL_11:
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
  }
LABEL_12:

  return 0;
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void);
  _QWORD v8[4];
  id v9;
  AMSMetricsDatabase *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__AMSMetricsDatabase_connectionNeedsResetForCorruption___block_invoke;
  v8[3] = &unk_1E25436C8;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  AMSMetricsDatabaseBlockWithKeepAlive(CFSTR("AMSMetricsDatabase-truncateAfterCorruption"), v8);
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();

  LOBYTE(v6) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v6;
}

void __56__AMSMetricsDatabase_connectionNeedsResetForCorruption___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "truncate") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "close"),
        objc_msgSend(*(id *)(a1 + 40), "_cachePath"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = +[AMSDatabaseHelper removeDatabaseForCachePath:](AMSDatabaseHelper, "removeDatabaseForCachePath:", v2), v2, v3))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = +[AMSMetricsDatabaseSchema createOrUpdateSchemaUsingConnection:](AMSMetricsDatabaseSchema, "createOrUpdateSchemaUsingConnection:", *(_QWORD *)(a1 + 32));
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = objc_opt_class();
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset database after corruption. This is bad!", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (NSString)containerId
{
  return self->_containerId;
}

- (void)setContainerId:(id)a3
{
  objc_storeStrong((id *)&self->_containerId, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_containerId, 0);
}

@end
