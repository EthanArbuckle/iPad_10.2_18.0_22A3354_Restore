@implementation AMSCookieDatabase

uint64_t __67__AMSCookieDatabase__databasePathForIdentifiers_fileManager_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", a2);
}

+ (id)databasePathForIdentifiers:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3620];
  v7 = a3;
  objc_msgSend(v6, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_databasePathForIdentifiers:fileManager:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_databasePathForIdentifiers:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithCapacity:", objc_msgSend(v10, "count"));
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67__AMSCookieDatabase__databasePathForIdentifiers_fileManager_error___block_invoke;
  v24[3] = &unk_1E25402F0;
  v26 = a1;
  v13 = v11;
  v25 = v13;
  objc_msgSend(v10, "ams_mapWithTransformIgnoresNil:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __67__AMSCookieDatabase__databasePathForIdentifiers_fileManager_error___block_invoke_2;
  v22[3] = &unk_1E253D348;
  v23 = v8;
  v15 = v8;
  objc_msgSend(v14, "ams_firstObjectPassingTest:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "firstObject");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    if ((unint64_t)objc_msgSend(v13, "count") < 2)
    {
      if (objc_msgSend(v13, "count") == 1)
      {
        if (a5)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
      }
      else if (a5)
      {
        AMSError(0, CFSTR("Error creating database path"), 0, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else if (a5)
    {
      AMSErrorWithMultipleUnderlyingErrors(16, CFSTR("Error creating database path"), 0, v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      v19 = 0;
      *a5 = v21;
      goto LABEL_6;
    }
    v19 = 0;
    goto LABEL_6;
  }
  v18 = v16;
LABEL_5:
  v19 = v18;
LABEL_6:

  return v19;
}

uint64_t __73__AMSCookieDatabase__executeStatement_columns_forCookieProperties_error___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bindCookieProperties:column:position:using:", *(_QWORD *)(a1 + 40), objc_msgSend(a2, "unsignedIntegerValue"), (a3 + 1), *(_QWORD *)(a1 + 48));
}

- (id)_cookieDictionaryForCursor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AMSNameForAMSCookieDatabaseColumn(6uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForColumnName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (id)*MEMORY[0x1E0C92AD0];
    v18 = v5;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(&unk_1E25B00F8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(&unk_1E25B00F8);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "unsignedIntegerValue");
          NSHTTPCookiePropertyKeyForAMSCookieDatabaseColumn(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          AMSNameForAMSCookieDatabaseColumn(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "stringForColumnName:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "isEqualToString:", &stru_1E2548760))
          {

            v15 = 0;
          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(&unk_1E25B00F8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }
    v16 = (void *)objc_msgSend(v6, "copy");

    v5 = v18;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)cookiePropertiesWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", CFSTR("AMSCookies"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__21;
  v18 = __Block_byref_object_dispose__21;
  v19 = 0;
  -[AMSCookieDatabase connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__AMSCookieDatabase_cookiePropertiesWithError___block_invoke;
  v10[3] = &unk_1E25403E0;
  v12 = &v14;
  v13 = a3;
  v10[4] = self;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "executeQuery:withResults:", CFSTR("SELECT * FROM cookies"), v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (AMSSQLiteConnection)connection
{
  return self->_connection;
}

void __47__AMSCookieDatabase_cookiePropertiesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *, void *);
  void *v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
    {
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_opt_class();
        AMSLogKey();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v15;
        v42 = 2114;
        v43 = v16;
        v44 = 2114;
        v45 = v17;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Cookie query returned error: %{public}@", buf, 0x20u);

      }
      if (*(_QWORD *)(a1 + 56))
      {
        v12 = objc_retainAutorelease(v7);
        goto LABEL_15;
      }
    }
    else
    {
      v18 = objc_msgSend((id)v5, "hasRows");
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v18)
      {
        if (!v19)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "OSLogObject");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_opt_class();
          AMSLogKey();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v22;
          v42 = 2114;
          v43 = v23;
          _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: Cookie query returned row(s), enumerating.", buf, 0x16u);

        }
        v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v34 = MEMORY[0x1E0C809B0];
        v35 = 3221225472;
        v36 = __47__AMSCookieDatabase_cookiePropertiesWithError___block_invoke_102;
        v37 = &unk_1E25403B8;
        v38 = *(_QWORD *)(a1 + 32);
        v39 = v24;
        v25 = v24;
        objc_msgSend((id)v5, "enumerateRowsUsingBlock:", &v34);
        v26 = objc_msgSend(v25, "copy", v34, v35, v36, v37, v38);
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = v26;

      }
      else
      {
        if (!v19)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "OSLogObject");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = objc_opt_class();
          AMSLogKey();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v30;
          v42 = 2114;
          v43 = v31;
          _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: Cookie query returned no rows, returning empty array.", buf, 0x16u);

        }
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v33 = *(void **)(v32 + 40);
        *(_QWORD *)(v32 + 40) = MEMORY[0x1E0C9AA60];

      }
    }
  }
  else
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
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
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v10;
      v42 = 2114;
      v43 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Cookie query returned with neither results nor an error.", buf, 0x16u);

    }
    if (*(_QWORD *)(a1 + 56))
    {
      AMSError(16, CFSTR("Unknown Database Error"), CFSTR("A query returned with neither results nor an error."), 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
      **(_QWORD **)(a1 + 56) = v12;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

id __67__AMSCookieDatabase__databasePathForIdentifiers_fileManager_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v3 = *(void **)(a1 + 40);
  v9 = 0;
  objc_msgSend(v3, "_databasePathForIdentifier:error:", a2, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = v5;
  if (v4)
  {
    v7 = v4;
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

  return v4;
}

+ (id)_databasePathForIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a1, "_dataVaultPathForIdentifier:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544386;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: %{public}@ | identifier = %{public}@ | dataVaultPath = %{public}@", (uint8_t *)&v19, 0x34u);

    }
    +[AMSDatabaseHelper databasePathForDataVaultPath:type:](AMSDatabaseHelper, "databasePathForDataVaultPath:type:", v8, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_dataVaultPathForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "_rootDataVaultPathWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_rootDataVaultPathWithError:(id *)a3
{
  uint64_t v4;
  void *v5;

  +[AMSDatabaseHelper databaseFolderNameForType:](AMSDatabaseHelper, "databaseFolderNameForType:", 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (a3 && !v4)
  {
    AMSError(7, CFSTR("Database Path Not Found"), CFSTR("Could not find path for database"), 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_bindCookieProperties:(id)a3 column:(unint64_t)a4 position:(int)a5 using:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  id v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v7 = *(_QWORD *)&a5;
  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  NSHTTPCookiePropertyKeyForAMSCookieDatabaseColumn(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    switch(a4)
    {
      case 0uLL:
      case 2uLL:
      case 5uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "OSLogObject");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = objc_opt_class();
          AMSLogKey();
          v51 = v10;
          v16 = v9;
          v17 = v7;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v54 = v15;
          v55 = 2114;
          v56 = v18;
          v57 = 2114;
          v58 = v19;
          v59 = 2114;
          v60 = v20;
          v61 = 1026;
          v62 = v17;
          _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Binding a nullable key. key = %{public}@ | value = %{public}@ | position = %{public}d", buf, 0x30u);

          v7 = v17;
          v9 = v16;
          v10 = v51;
        }

        objc_msgSend(v10, "bindNullableString:atPosition:", v12, v7);
        goto LABEL_33;
      case 1uLL:
      case 7uLL:
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_24;
        objc_msgSend(v26, "absoluteString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 3uLL:
      case 8uLL:
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v28;
        v30 = &stru_1E2548760;
        if (v28)
          v30 = (__CFString *)v28;
        v12 = v30;

        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v31)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v31, "OSLogObject");
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          goto LABEL_32;
        v33 = objc_opt_class();
        AMSLogKey();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v11);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v12);
        v52 = v10;
        v36 = v9;
        v37 = v7;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v54 = v33;
        v55 = 2114;
        v56 = v34;
        v57 = 2114;
        v58 = v35;
        v59 = 2114;
        v60 = v38;
        v61 = 1026;
        v62 = v37;
        v39 = "%{public}@ [%{public}@]: Binding a nullable key that we can't store as NULL. key = %{public}@ | value = %{"
              "public}@ | position = %{public}d";
        goto LABEL_31;
      case 4uLL:
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v40 = (void *)MEMORY[0x1E0CB36A8];
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringFromDate:timeZone:formatOptions:", v26, v41, 1907);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
          objc_msgSend(v10, "bindNullableString:atPosition:", v27, v7);

        }
        else
        {
LABEL_24:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v10, "bindString:atPosition:", v26, v7);
          else
            objc_msgSend(v10, "bindNullAtPosition:", v7);
        }

        break;
      case 6uLL:
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v42 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v42;
        if (v12)
        {
          if (!v42)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v31, "OSLogObject");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v43 = objc_opt_class();
            AMSLogKey();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            AMSHashIfNeeded(v11);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            AMSHashIfNeeded(v12);
            v52 = v10;
            v36 = v9;
            v37 = v7;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v54 = v43;
            v55 = 2114;
            v56 = v34;
            v57 = 2114;
            v58 = v35;
            v59 = 2114;
            v60 = v38;
            v61 = 1026;
            v62 = v37;
            v39 = "%{public}@ [%{public}@]: Binding a non-null key. key = %{public}@ | value = %{public}@ | position = %{public}d";
LABEL_31:
            _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_INFO, v39, buf, 0x30u);

            v7 = v37;
            v9 = v36;
            v10 = v52;

          }
LABEL_32:

          objc_msgSend(v10, "bindString:atPosition:", v12, v7);
        }
        else
        {
          if (!v42)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v31, "OSLogObject");
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            v45 = objc_opt_class();
            AMSLogKey();
            v46 = v10;
            v47 = v9;
            v48 = v7;
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            AMSHashIfNeeded(v11);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v54 = v45;
            v55 = 2114;
            v56 = v49;
            v57 = 2114;
            v58 = v50;
            v59 = 1026;
            LODWORD(v60) = v48;
            v9 = v47;
            v10 = v46;
            _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Attempting to store a NULL name. key = %{public}@ | position = %{public}d", buf, 0x26u);

          }
        }
LABEL_33:

        break;
      case 0xEuLL:
        objc_msgSend(v10, "bindNullAtPosition:", v7);
        break;
      default:
        break;
    }
  }
  else
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v54 = v23;
      v55 = 2114;
      v56 = v24;
      v57 = 2114;
      v58 = v25;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Attempting to bind a key for an invalid column. column = %{public}@", buf, 0x20u);

    }
  }

}

uint64_t __91__AMSCookieDatabase_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  id v13;
  id v14;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    v14 = 0;
    v4 = objc_msgSend(v2, "_removeCookieProperties:error:", v3, &v14);
    v5 = v14;
    v6 = v5;
    if ((v4 & 1) == 0 && v5)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

  }
  else
  {
    v4 = 1;
  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 56);
    v13 = 0;
    v9 = objc_msgSend(v7, "_addCookieProperties:error:", v8, &v13);
    v10 = v13;
    v11 = v10;
    if ((v9 & 1) == 0 && v10)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

    v4 &= v9;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v4;
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

void __73__AMSCookieDatabase__executeStatement_columns_forCookieProperties_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__AMSCookieDatabase__executeStatement_columns_forCookieProperties_error___block_invoke_2;
  v6[3] = &unk_1E2540318;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

uint64_t __48__AMSCookieDatabase__addCookieProperties_error___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v32;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v32 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v6);
        v8 = *(void **)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        v10 = *(_QWORD *)(a1 + 56);
        v30 = 0;
        v11 = objc_msgSend(v8, "_executeStatement:columns:forCookieProperties:error:", v9, v10, v7, &v30);
        v12 = v30;
        v13 = v12;
        if ((v11 & 1) == 0)
        {
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
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
            AMSLogKey();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            AMSLogableError(v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v36 = v17;
            v37 = 2114;
            v38 = v18;
            v39 = 2114;
            v40 = v19;
            _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Failed to add cookies. error = %{public}@", buf, 0x20u);

          }
          if (*(_QWORD *)(a1 + 72))
            **(_QWORD **)(a1 + 72) = objc_retainAutorelease(v13);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
          if (objc_msgSend(v13, "code") == 8)
          {
            v20 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
            +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v21;
            if (v20)
            {
              if (!v21)
              {
                +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v22, "OSLogObject");
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                v24 = objc_opt_class();
                AMSLogKey();
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v36 = v24;
                v37 = 2114;
                v38 = v25;
                _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Failed to add cookies with read-only error", buf, 0x16u);

              }
              objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
              v26 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v26, 0);
            }
            else
            {
              if (!v21)
              {
                +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v22, "OSLogObject");
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              {
                v27 = objc_opt_class();
                AMSLogKey();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v36 = v27;
                v37 = 2114;
                v38 = v28;
                _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_FAULT, "%{public}@ [%{public}@]: Failed to add cookies with read-only error", buf, 0x16u);

              }
            }

          }
          v14 = 0;
          goto LABEL_29;
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      if (v4)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_29:

  return v14;
}

__CFString *__48__AMSCookieDatabase__addCookieProperties_error___block_invoke(uint64_t a1, void *a2)
{
  return AMSNameForAMSCookieDatabaseColumn(objc_msgSend(a2, "unsignedIntegerValue"));
}

- (BOOL)updateCookiesWithCookiePropertiesToAdd:(id)a3 cookiePropertiesToRemove:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  __CFNotificationCenter *DarwinNotifyCenter;
  BOOL v21;
  _QWORD v23[4];
  id v24;
  AMSCookieDatabase *v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  -[AMSCookieDatabase connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __91__AMSCookieDatabase_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_error___block_invoke;
  v23[3] = &unk_1E2540408;
  v12 = v9;
  v24 = v12;
  v25 = self;
  v13 = v10;
  v26 = v13;
  v14 = v8;
  v27 = v14;
  v28 = &v29;
  objc_msgSend(v11, "performTransaction:", v23);

  if (objc_msgSend(v13, "count") == 1)
  {
    if (a5)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if ((unint64_t)objc_msgSend(v13, "count") < 2)
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      AMSLogKey();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v18;
      v35 = 2114;
      v36 = v19;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting a CookiesChanged notification.", buf, 0x16u);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.AppleMediaServices.cookieschanged"), 0, 0, 0);
  }
  else if (a5)
  {
    v15 = (void *)objc_msgSend(v13, "copy");
    AMSErrorWithMultipleUnderlyingErrors(16, CFSTR("Multiple Database Errors"), CFSTR("Encountered multiple errors modifying the cookie database."), v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v21 = *((_BYTE *)v30 + 24) != 0;

  _Block_object_dispose(&v29, 8);
  return v21;
}

- (BOOL)_executeStatement:(id)a3 columns:(id)a4 forCookieProperties:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  AMSCookieDatabase *v19;
  id v20;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  -[AMSCookieDatabase connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__AMSCookieDatabase__executeStatement_columns_forCookieProperties_error___block_invoke;
  v17[3] = &unk_1E2540340;
  v18 = v10;
  v19 = self;
  v20 = v11;
  v14 = v11;
  v15 = v10;
  LOBYTE(a6) = objc_msgSend(v13, "executeStatement:error:bindings:", v12, a6, v17);

  return (char)a6;
}

- (BOOL)_addCookieProperties:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  AMSCookieDatabase *v30;
  id v31;
  id v32;
  _BYTE *v33;
  id *v34;
  _BYTE buf[24];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2114;
    v36 = v11;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Adding cookie properties. cookieProperties = %{public}@", buf, 0x20u);

  }
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", CFSTR("AMSCookies"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AMSCookieDatabaseColumnAllCases();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v36) = 1;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("REPLACE INTO cookies("));
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendString:", v16);

  objc_msgSend(v15, "appendString:", CFSTR(") VALUES ("));
  objc_msgSend(MEMORY[0x1E0C99D20], "ams_arrayWithItem:count:", CFSTR("?"), objc_msgSend(v13, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendString:", v18);

  objc_msgSend(v15, "appendString:", CFSTR(");"));
  -[AMSCookieDatabase connection](self, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __48__AMSCookieDatabase__addCookieProperties_error___block_invoke_2;
  v28 = &unk_1E25402C8;
  v20 = v6;
  v29 = v20;
  v30 = self;
  v21 = v15;
  v31 = v21;
  v22 = v13;
  v32 = v22;
  v33 = buf;
  v34 = a4;
  objc_msgSend(v19, "performTransaction:", &v25);

  objc_msgSend(v12, "invalidate", v25, v26, v27, v28);
  v23 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v23;
}

+ (void)_cleanUpProtectionClassAtPath:(id)a3 fileManager:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  NSObject *log;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id obj;
  NSObject *obja;
  void *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id v84;
  _BYTE v85[128];
  void *v86;
  uint64_t v87;
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "fileExistsAtPath:", v6))
  {
    v84 = 0;
    objc_msgSend(v7, "attributesOfItemAtPath:error:", v6, &v84);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v84;
    if (v8)
    {
      v10 = (void *)*MEMORY[0x1E0CB2AD8];
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AD8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = 0;

LABEL_59:
        goto LABEL_60;
      }
      v12 = v11;

      if (!v12)
        goto LABEL_59;
      v13 = *MEMORY[0x1E0CB2AC0];
      if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2AC0]) & 1) != 0)
        goto LABEL_59;
      v66 = v8;
      v67 = v12;
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      v77 = v7;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = objc_opt_class();
        v19 = v18;
        if (v16)
        {
          AMSLogKey();
          obj = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] "), v19, obj);
        }
        else
        {
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: "), v18);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v6);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v67);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v89 = (uint64_t)v20;
        v90 = 2114;
        v91 = v28;
        v92 = 2114;
        v93 = v29;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Correcting file protection type of cookie database. path = %{public}@ | protectionType = %{public}@", buf, 0x20u);
        if (v16)
        {

          v20 = obj;
        }

        v7 = v77;
      }

      objc_msgSend(v6, "stringByDeletingLastPathComponent");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v7;
      v32 = v30;
      v83 = v9;
      objc_msgSend(v31, "contentsOfDirectoryAtPath:error:", v30, &v83);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v83;

      log = v32;
      if (v33)
      {
        v65 = v6;
        v86 = v10;
        v87 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        obja = v33;
        v36 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
        if (v36)
        {
          v37 = v36;
          v64 = v33;
          v38 = *(_QWORD *)v80;
          v71 = *(_QWORD *)v80;
          v72 = v35;
          do
          {
            v39 = 0;
            v40 = v34;
            v74 = v37;
            do
            {
              v41 = v10;
              if (*(_QWORD *)v80 != v38)
                objc_enumerationMutation(obja);
              -[NSObject stringByAppendingPathComponent:](v32, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v39));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = v40;
              v43 = objc_msgSend(v77, "setAttributes:ofItemAtPath:error:", v35, v42, &v78);
              v34 = v78;

              if ((v43 & 1) != 0)
              {
                v10 = v41;
              }
              else
              {
                v44 = v34;
                +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v45)
                {
                  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v45, "OSLogObject");
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  AMSLogKey();
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = (void *)MEMORY[0x1E0CB3940];
                  v49 = objc_opt_class();
                  v50 = v49;
                  if (v47)
                  {
                    AMSLogKey();
                    v70 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "stringWithFormat:", CFSTR("%@: [%@] "), v50, v70);
                    v51 = objc_claimAutoreleasedReturnValue();
                    v69 = (void *)v51;
                    v52 = v41;
                  }
                  else
                  {
                    objc_msgSend(v48, "stringWithFormat:", CFSTR("%@: "), v49);
                    v51 = objc_claimAutoreleasedReturnValue();
                    v52 = (void *)v51;
                  }
                  AMSHashIfNeeded(v42);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  AMSLogableError(v44);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v89 = v51;
                  v90 = 2114;
                  v91 = v53;
                  v92 = 2114;
                  v93 = v54;
                  _os_log_impl(&dword_18C849000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to alter file protection class. path = %{public}@ | error = %{public}@", buf, 0x20u);
                  v55 = v52;
                  v10 = v52;
                  if (v47)
                  {

                    v55 = (void *)v70;
                  }

                  v32 = log;
                }
                else
                {
                  v10 = v41;
                }

                v38 = v71;
                v35 = v72;
                v34 = v44;
                v37 = v74;
              }

              ++v39;
              v40 = v34;
            }
            while (v37 != v39);
            v37 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
          }
          while (v37);
          v33 = v64;
          v6 = v65;
        }
      }
      else
      {
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v35)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v35, "OSLogObject");
        obja = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(obja, OS_LOG_TYPE_ERROR))
        {
          v73 = v35;
          AMSLogKey();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (void *)MEMORY[0x1E0CB3940];
          v58 = objc_opt_class();
          v59 = v58;
          v60 = v34;
          if (v56)
          {
            AMSLogKey();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "stringWithFormat:", CFSTR("%@: [%@] "), v59, v35);
          }
          else
          {
            objc_msgSend(v57, "stringWithFormat:", CFSTR("%@: "), v58);
          }
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v32);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          AMSLogableError(v60);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v89 = (uint64_t)v61;
          v90 = 2114;
          v91 = v62;
          v92 = 2114;
          v93 = v63;
          _os_log_impl(&dword_18C849000, obja, OS_LOG_TYPE_ERROR, "%{public}@Cannot enumerate database parent directory. path = %{public}@ | error = %{public}@", buf, 0x20u);
          if (v56)
          {

            v61 = v35;
          }

          v33 = 0;
          v35 = v73;
          v34 = v60;
        }
      }
      v7 = v77;

      v9 = v34;
      v8 = v66;
      v12 = v67;
    }
    else
    {
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3940];
        v23 = objc_opt_class();
        v24 = v23;
        if (v21)
        {
          AMSLogKey();
          v4 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v24, v4);
        }
        else
        {
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: "), v23);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v9);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v89 = (uint64_t)v25;
        v90 = 2114;
        v91 = v26;
        v92 = 2114;
        v93 = v27;
        _os_log_impl(&dword_18C849000, log, OS_LOG_TYPE_ERROR, "%{public}@Cannot inspect attributes of database. path = %{public}@ | error = %{public}@", buf, 0x20u);
        if (v21)
        {

          v25 = (void *)v4;
        }

      }
    }

    goto LABEL_59;
  }
LABEL_60:

}

- (BOOL)_removeCookieProperties:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  AMSCookieDatabase *v29;
  id v30;
  id v31;
  _BYTE *v32;
  id *v33;
  _BYTE buf[24];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2114;
    v35 = v11;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Removing cookie properties. cookieProperties = %{public}@", buf, 0x20u);

  }
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", CFSTR("AMSCookies"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("DELETE FROM cookies WHERE "));
  AMSCookieDatabaseColumnAllCases();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ams_filterUsingTest:", &__block_literal_global_60);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "ams_mapWithTransform:", &__block_literal_global_61);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(" AND "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendString:", v17);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v35) = 1;
  -[AMSCookieDatabase connection](self, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __51__AMSCookieDatabase__removeCookieProperties_error___block_invoke_3;
  v27 = &unk_1E25402C8;
  v19 = v6;
  v28 = v19;
  v29 = self;
  v20 = v13;
  v30 = v20;
  v21 = v15;
  v32 = buf;
  v33 = a4;
  v31 = v21;
  objc_msgSend(v18, "performTransaction:", &v24);

  objc_msgSend(v12, "invalidate", v24, v25, v26, v27);
  v22 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v22;
}

uint64_t __51__AMSCookieDatabase__removeCookieProperties_error___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "unsignedIntegerValue");
  return (v2 < 9) & (0x148u >> v2);
}

id __51__AMSCookieDatabase__removeCookieProperties_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  AMSNameForAMSCookieDatabaseColumn(objc_msgSend(a2, "unsignedIntegerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ IS ?"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __51__AMSCookieDatabase__removeCookieProperties_error___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v6);
        v8 = *(void **)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        v10 = *(_QWORD *)(a1 + 56);
        v21 = 0;
        v11 = objc_msgSend(v8, "_executeStatement:columns:forCookieProperties:error:", v9, v10, v7, &v21);
        v12 = v21;
        v13 = v12;
        if ((v11 & 1) == 0)
        {
          +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
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
            AMSLogKey();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            AMSLogableError(v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v27 = v17;
            v28 = 2114;
            v29 = v18;
            v30 = 2114;
            v31 = v19;
            _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Failed to remove cookies. error = %{public}@", buf, 0x20u);

          }
          if (*(_QWORD *)(a1 + 72))
            **(_QWORD **)(a1 + 72) = objc_retainAutorelease(v13);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

          v14 = 0;
          goto LABEL_17;
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v4)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_17:

  return v14;
}

+ (id)cleanUpCookieDatabasesWithValidIdentifiers:(id)a3 fileManager:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  id v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  int v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  id v128;
  uint64_t v129;
  void *v130;
  id obj;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  id v142;
  id v143;
  id v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _QWORD v149[7];
  _QWORD v150[4];
  id v151;
  id v152;
  id v153;
  SEL v154;
  id v155;
  uint8_t v156[4];
  uint64_t v157;
  __int16 v158;
  id v159;
  __int16 v160;
  void *v161;
  _BYTE v162[128];
  uint64_t v163;
  _BYTE buf[24];
  uint64_t (*v165)(uint64_t, uint64_t);
  void (*v166)(uint64_t);
  id v167;
  uint64_t v168;

  v168 = *MEMORY[0x1E0C80C00];
  v114 = a3;
  v128 = a4;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    if (v7)
    {
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@ "), v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12;
    }
    AMSHashIfNeededNonnull(v114);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@| validIdentifiers = %{public}@", buf, 0x16u);
    if (v7)

  }
  v155 = 0;
  objc_msgSend(a1, "_rootDataVaultPathWithError:", &v155);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v155;
  v108 = v14;
  if (!v113)
  {
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v14);
    v119 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_107;
  }
  +[AMSDatabaseHelper dataVaultURLForDataVaultPath:](AMSDatabaseHelper, "dataVaultURLForDataVaultPath:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v150[0] = MEMORY[0x1E0C809B0];
  v150[1] = 3221225472;
  v150[2] = __76__AMSCookieDatabase_cleanUpCookieDatabasesWithValidIdentifiers_fileManager___block_invoke;
  v150[3] = &unk_1E2540368;
  v105 = v15;
  v151 = v105;
  v153 = a1;
  v154 = a2;
  v152 = v108;
  objc_msgSend(v114, "ams_mapWithTransformIgnoresNil:", v150);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = objc_opt_class();
    if (v19)
    {
      AMSLogKey();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: %@ "), v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v24;
    }
    AMSLogableURL(v105);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v25;
    _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEBUG, "%{public}@| enumerating contents of %{public}@", buf, 0x16u);
    if (v19)

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v165 = __Block_byref_object_copy__21;
  v166 = __Block_byref_object_dispose__21;
  v167 = 0;
  v139 = *MEMORY[0x1E0C99948];
  v163 = *MEMORY[0x1E0C99948];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v163, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = v16;
  v149[1] = 3221225472;
  v149[2] = __76__AMSCookieDatabase_cleanUpCookieDatabasesWithValidIdentifiers_fileManager___block_invoke_74;
  v149[3] = &unk_1E2540390;
  v149[6] = a2;
  v149[5] = a1;
  v149[4] = buf;
  objc_msgSend(v128, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v105, v26, 17, v149);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  obj = v27;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
  if (!v28)
    goto LABEL_93;
  v138 = *(_QWORD *)v146;
  do
  {
    v29 = 0;
    v140 = v28;
    do
    {
      if (*(_QWORD *)v146 != v138)
        objc_enumerationMutation(obj);
      v30 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * v29);
      v31 = (void *)MEMORY[0x18D78A1C4]();
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v32, "OSLogObject");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        AMSLogKey();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)MEMORY[0x1E0CB3940];
        v36 = objc_opt_class();
        if (v34)
        {
          AMSLogKey();
          v136 = objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v135 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v36, v136, v135);
          v37 = objc_claimAutoreleasedReturnValue();
          v132 = (void *)v37;
        }
        else
        {
          NSStringFromSelector(a2);
          v134 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: %@ "), v36, v134);
          v37 = objc_claimAutoreleasedReturnValue();
          v133 = (void *)v37;
        }
        AMSLogableURL(v30);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v156 = 138543618;
        v157 = v37;
        v158 = 2114;
        v159 = v38;
        _os_log_impl(&dword_18C849000, v33, OS_LOG_TYPE_DEBUG, "%{public}@ | Processing URL: %{public}@", v156, 0x16u);
        v39 = v133;
        v40 = (void *)v134;
        if (v34)
        {

          v39 = (void *)v135;
          v40 = (void *)v136;
        }

      }
      v143 = 0;
      v144 = 0;
      v41 = objc_msgSend(v30, "getResourceValue:forKey:error:", &v144, v139, &v143);
      v42 = v144;
      v43 = v143;
      if ((v41 & 1) == 0)
      {
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v44)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v44, "OSLogObject");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)MEMORY[0x1E0CB3940];
          if (v50)
          {
            v52 = objc_opt_class();
            AMSLogKey();
            v129 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: [%@] "), v52, v129);
            v53 = objc_claimAutoreleasedReturnValue();
            v126 = (void *)v53;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
            v53 = objc_claimAutoreleasedReturnValue();
            v127 = (void *)v53;
          }
          AMSLogableURL(v30);
          v60 = (id)objc_claimAutoreleasedReturnValue();
          AMSLogableError(v43);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v156 = 138543874;
          v157 = v53;
          v158 = 2114;
          v159 = v60;
          v160 = 2114;
          v161 = v61;
          _os_log_impl(&dword_18C849000, v45, OS_LOG_TYPE_ERROR, "%{public}@Error getting file resource identifier. URL = %{public}@ | error = %{public}@", v156, 0x20u);

          v62 = v127;
          if (v50)
          {

            v62 = (void *)v129;
          }

        }
        v63 = 3;
        goto LABEL_82;
      }
      if (objc_msgSend(v130, "containsObject:", v42))
      {
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v44)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v44, "OSLogObject");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          AMSLogKey();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (void *)MEMORY[0x1E0CB3940];
          v48 = objc_opt_class();
          if (v46)
          {
            AMSLogKey();
            v123 = objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v122 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v48, v123, v122);
            v49 = objc_claimAutoreleasedReturnValue();
            v115 = (void *)v49;
          }
          else
          {
            NSStringFromSelector(a2);
            v120 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "stringWithFormat:", CFSTR("%@: %@ "), v48, v120);
            v49 = objc_claimAutoreleasedReturnValue();
            v117 = (void *)v49;
          }
          AMSLogableURL(v30);
          v64 = (id)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v42);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v156 = 138543874;
          v157 = v49;
          v158 = 2114;
          v159 = v64;
          v160 = 2114;
          v161 = v65;
          _os_log_impl(&dword_18C849000, v45, OS_LOG_TYPE_DEBUG, "%{public}@| URL has expected identifier, skipping. URL = %{public}@ | identifier = %{public}@", v156, 0x20u);

          v66 = v117;
          v67 = (void *)v120;
          if (v46)
          {

            v66 = (void *)v122;
            v67 = (void *)v123;
          }

        }
        v63 = 0;
LABEL_82:

        v72 = v43;
        goto LABEL_83;
      }
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v54)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v54, "OSLogObject");
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)MEMORY[0x1E0CB3940];
        v58 = objc_opt_class();
        if (v56)
        {
          AMSLogKey();
          v125 = objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v124 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v58, v125, v124);
          v59 = objc_claimAutoreleasedReturnValue();
          v116 = (void *)v59;
        }
        else
        {
          NSStringFromSelector(a2);
          v121 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "stringWithFormat:", CFSTR("%@: %@ "), v58, v121);
          v59 = objc_claimAutoreleasedReturnValue();
          v118 = (void *)v59;
        }
        AMSLogableURL(v30);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v156 = 138543618;
        v157 = v59;
        v158 = 2114;
        v159 = v68;
        _os_log_impl(&dword_18C849000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@| Deleting file at URL: %{public}@", v156, 0x16u);
        v69 = v118;
        v70 = (void *)v121;
        if (v56)
        {

          v69 = (void *)v124;
          v70 = (void *)v125;
        }

      }
      v142 = v43;
      v71 = objc_msgSend(v128, "removeItemAtURL:error:", v30, &v142);
      v72 = v142;

      if (v71)
      {
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v44)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v44, "OSLogObject");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          AMSLogKey();
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (void *)MEMORY[0x1E0CB3940];
          v75 = objc_opt_class();
          if (v73)
          {
            AMSLogKey();
            v112 = objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v111 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v75, v112, v111);
            v76 = objc_claimAutoreleasedReturnValue();
            v102 = (void *)v76;
          }
          else
          {
            NSStringFromSelector(a2);
            v107 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "stringWithFormat:", CFSTR("%@: %@ "), v75, v107);
            v76 = objc_claimAutoreleasedReturnValue();
            v104 = (void *)v76;
          }
          AMSLogableURL(v30);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v156 = 138543618;
          v157 = v76;
          v158 = 2114;
          v159 = v83;
          _os_log_impl(&dword_18C849000, v45, OS_LOG_TYPE_DEBUG, "%{public}@| Deleted file. URL = %{public}@", v156, 0x16u);
          v84 = v104;
          v85 = (void *)v107;
          if (v73)
          {

            v84 = (void *)v111;
            v85 = (void *)v112;
          }

        }
        v63 = 0;
        v43 = v72;
        goto LABEL_82;
      }
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v77)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v77, "OSLogObject");
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = (void *)MEMORY[0x1E0CB3940];
        v81 = objc_opt_class();
        if (v79)
        {
          AMSLogKey();
          v110 = objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v109 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v81, v110, v109);
          v82 = objc_claimAutoreleasedReturnValue();
          v101 = (void *)v82;
        }
        else
        {
          NSStringFromSelector(a2);
          v106 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "stringWithFormat:", CFSTR("%@: %@ "), v81, v106);
          v82 = objc_claimAutoreleasedReturnValue();
          v103 = (void *)v82;
        }
        AMSLogableURL(v30);
        v86 = (id)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v72);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v156 = 138543874;
        v157 = v82;
        v158 = 2114;
        v159 = v86;
        v160 = 2114;
        v161 = v87;
        _os_log_impl(&dword_18C849000, v78, OS_LOG_TYPE_ERROR, "%{public}@| Error deleting file. URL = %{public}@ | error = %{public}@", v156, 0x20u);

        v88 = v103;
        v89 = (void *)v106;
        if (v79)
        {

          v88 = (void *)v109;
          v89 = (void *)v110;
        }

      }
      AMSError(14, CFSTR("Filesystem Error"), CFSTR("Unable to delete the file."), v72);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v44);
      v119 = (id)objc_claimAutoreleasedReturnValue();
      v63 = 1;
LABEL_83:

      objc_autoreleasePoolPop(v31);
      if (v63 != 3 && v63)
      {

        goto LABEL_106;
      }
      ++v29;
    }
    while (v140 != v29);
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
  }
  while (v28);
LABEL_93:

  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:");
    v119 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v90)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v90, "OSLogObject");
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = (void *)MEMORY[0x1E0CB3940];
      if (v92)
      {
        v94 = objc_opt_class();
        AMSLogKey();
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v94, v95, v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v98 = objc_opt_class();
        NSStringFromSelector(a2);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "stringWithFormat:", CFSTR("%@: %@ "), v98, v95);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = v97;
      }
      AMSLogableURL(v105);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v156 = 138543618;
      v157 = (uint64_t)v97;
      v158 = 2114;
      v159 = v99;
      _os_log_impl(&dword_18C849000, v91, OS_LOG_TYPE_DEBUG, "%{public}@| Finished enumeration contents of %{public}@", v156, 0x16u);
      if (v92)

    }
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v119 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_106:

  _Block_object_dispose(buf, 8);
LABEL_107:

  return v119;
}

NSObject *__76__AMSCookieDatabase_cleanUpCookieDatabasesWithValidIdentifiers_fileManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = objc_opt_class();
      if (v11)
      {
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v13, v14, v33);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: %@ "), v13, v14);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURL(*(void **)(a1 + 32));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(*(void **)(a1 + 40));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v38 = v15;
      v39 = 2114;
      v40 = v24;
      v41 = 2114;
      v42 = v25;
      v43 = 2114;
      v44 = v26;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@| Error creating URL. dataVaultURL = %{public}@ | identifier = %{public}@ | error = %{public}@", buf, 0x2Au);
      if (v11)
      {

        v15 = (void *)v33;
      }

    }
    goto LABEL_23;
  }
  v36 = 0;
  v6 = *MEMORY[0x1E0C99948];
  v35 = 0;
  v7 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v36, v6, &v35);
  v8 = v36;
  v9 = v35;
  if ((v7 & 1) == 0)
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
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
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = objc_opt_class();
      if (v18)
      {
        AMSLogKey();
        v31 = v19;
        v21 = v18;
        v22 = objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v32 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v22;
        v30 = v22;
        v18 = v21;
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v20, v30, v32);
      }
      else
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: %@ "), v20, v34);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURL(v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v9);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v23;
      v39 = 2114;
      v40 = v27;
      v41 = 2114;
      v42 = v28;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@| Error getting file resource identifier. URL = %{public}@ | error = %{public}@", buf, 0x20u);
      if (v18)
      {

        v23 = (void *)v32;
      }

    }
LABEL_23:
    v10 = 0;
    goto LABEL_24;
  }
  v8 = v8;
  v10 = v8;
LABEL_24:

  return v10;
}

uint64_t __76__AMSCookieDatabase_cleanUpCookieDatabasesWithValidIdentifiers_fileManager___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
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
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_opt_class();
    if (v9)
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v11, v12, v20);
    }
    else
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@ "), v11, v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v13;
    v23 = 2114;
    v24 = v14;
    v25 = 2114;
    v26 = v15;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@| Error enumerating file. URL = %{public}@ | error = %{public}@", buf, 0x20u);
    if (v9)
    {

      v13 = (void *)v20;
    }

  }
  AMSError(14, CFSTR("Error enumerating directory"), 0, v6);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  return 1;
}

- (void)close
{
  void *v3;
  void *v4;
  int v5;
  AMSSQLiteConnection *connection;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", CFSTR("AMSCookies"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCookieDatabase connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "close");

  if (v5)
  {
    connection = self->_connection;
    self->_connection = 0;

  }
  else
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
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
      *(_DWORD *)v10 = 138543362;
      *(_QWORD *)&v10[4] = objc_opt_class();
      v9 = *(id *)&v10[4];
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to close the AMS Cookie Storage database connection", v10, 0xCu);

    }
  }
  objc_msgSend(v3, "invalidate", *(_OWORD *)v10);

}

+ (id)cookieDatabaseForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Getting cookie database. accountIdentifier = %{public}@", buf, 0x20u);

  }
  v15 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cookieDatabaseForIdentifiers:error:", v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)cookieDatabaseForIdentifiers:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3620];
  v7 = a3;
  objc_msgSend(v6, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cookieDatabaseForIdentifiers:error:fileManager:", v7, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)cookieDatabaseForIdentifiers:(id)a3 error:(id *)a4 fileManager:(id)a5
{
  void *v5;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  AMSCookieDatabase *v22;
  void *v23;
  AMSSQLiteConnection *v24;
  BOOL v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  id v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
  id v56;
  id v57;
  id v58;
  AMSSQLiteConnectionOptions *v59;
  id v61;
  id v62;
  id v63;
  id v64;
  _QWORD aBlock[4];
  id v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v62 = a5;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v61);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v68 = v10;
    v69 = 2114;
    v70 = v11;
    v71 = 2114;
    v72 = v12;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: Getting cookie database. accountIdentifiers = %{public}@", buf, 0x20u);

  }
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", CFSTR("AMSCookies"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__AMSCookieDatabase_cookieDatabaseForIdentifiers_error_fileManager___block_invoke;
  aBlock[3] = &unk_1E253DBD8;
  v58 = v13;
  v66 = v58;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(a1, "_databasePathForIdentifiers:fileManager:error:", v61, v62, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      if (v18)
      {
        v20 = objc_opt_class();
        AMSLogKey();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] "), v20, v21);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v5;
      }
      AMSHashIfNeeded(v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = (uint64_t)v5;
      v69 = 2114;
      v70 = v23;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_INFO, "%{public}@Cookie database path is %{public}@", buf, 0x16u);
      if (v18)

    }
    v59 = -[AMSSQLiteConnectionOptions initWithDatabasePath:]([AMSSQLiteConnectionOptions alloc], "initWithDatabasePath:", v15);
    -[AMSSQLiteConnectionOptions setProtectionType:](v59, "setProtectionType:", *MEMORY[0x1E0CB2AC0]);
    objc_msgSend(a1, "_cleanUpProtectionClassAtPath:fileManager:", v15, v62);
    v24 = -[AMSSQLiteConnection initWithOptions:]([AMSSQLiteConnection alloc], "initWithOptions:", v59);
    v64 = 0;
    v25 = -[AMSSQLiteConnection openWithError:](v24, "openWithError:", &v64);
    v57 = v64;
    if (v25 || !objc_msgSend(v57, "ams_hasDomain:code:", 0x1E2562A20, -7700))
    {
      v63 = 0;
      v32 = +[AMSCookieDatabaseSchema createOrUpdateSchemaUsingConnection:error:](AMSCookieDatabaseSchema, "createOrUpdateSchemaUsingConnection:error:", v24, &v63);
      v33 = v63;
      v55 = v33;
      if (v32)
      {
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v34, "OSLogObject");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = objc_opt_class();
          AMSLogKey();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v36;
          v69 = 2114;
          v70 = v37;
          _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Finished creating or updating schema. Initializing database.", buf, 0x16u);

        }
        v22 = -[AMSCookieDatabase initWithConnection:path:]([AMSCookieDatabase alloc], "initWithConnection:path:", v24, v15);
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v38 = (id)objc_claimAutoreleasedReturnValue();
        if (!v38)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v38 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v38, "OSLogObject");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          AMSLogKey();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)MEMORY[0x1E0CB3940];
          if (v40)
          {
            v42 = objc_opt_class();
            AMSLogKey();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringWithFormat:", CFSTR("%@: [%@] "), v42, v43, v55);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v44;
          }
          AMSHashIfNeeded(v22);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = (uint64_t)v44;
          v69 = 2114;
          v70 = v53;
          _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_INFO, "%{public}@Created cookie database. %{public}@", buf, 0x16u);
          if (v40)

        }
      }
      else
      {
        AMSError(16, CFSTR("Error Creating Schema"), CFSTR("Failed to create the AMSCookie database schema."), v33);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v45)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v45, "OSLogObject");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)MEMORY[0x1E0CB3940];
          if (v47)
          {
            v49 = objc_opt_class();
            AMSLogKey();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "stringWithFormat:", CFSTR("%@: [%@] "), v49, v50, v55);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v51;
          }
          AMSLogableError(v55);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = (uint64_t)v51;
          v69 = 2114;
          v70 = v52;
          _os_log_impl(&dword_18C849000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to create the AMSCookie database schema. error = %{public}@", buf, 0x16u);
          if (v47)

        }
        if (a4)
        {
          v38 = objc_retainAutorelease(v38);
          v22 = 0;
          *a4 = v38;
        }
        else
        {
          v22 = 0;
        }
      }

    }
    else
    {
      AMSError(16, CFSTR("Error Opening Database"), CFSTR("Failed to open cookie database"), v57);
      v55 = (id)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v26, "OSLogObject");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0CB3940];
        if (v28)
        {
          v30 = objc_opt_class();
          AMSLogKey();
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: [%@] "), v30, v5);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = (uint64_t)v31;
        _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to open the AMS cookie database.", buf, 0xCu);
        if (v28)
        {

          v31 = v5;
        }

      }
      if (a4)
      {
        v56 = objc_retainAutorelease(v55);
        v22 = 0;
        *a4 = v56;

        goto LABEL_52;
      }
      v22 = 0;
    }

LABEL_52:
    goto LABEL_53;
  }
  v22 = 0;
LABEL_53:

  v14[2](v14);
  return v22;
}

uint64_t __68__AMSCookieDatabase_cookieDatabaseForIdentifiers_error_fileManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __47__AMSCookieDatabase_cookiePropertiesWithError___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v9;
    if (v6)
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Error enumerating row: %{public}@", (uint8_t *)&v20, 0x20u);

    }
    else
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      v19 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v19;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Enumerated row and got neither a cursor nor an error.", (uint8_t *)&v20, 0x16u);
    }

LABEL_19:
    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 32), "_cookieDictionaryForCursor:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  else
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v16;
      v22 = 2114;
      v23 = v17;
      v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Could not create cookie properties for cursor: %{public}@", (uint8_t *)&v20, 0x20u);

    }
    v8 = 0;
  }
LABEL_20:

}

- (void)dealloc
{
  objc_super v3;

  -[AMSCookieDatabase close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)AMSCookieDatabase;
  -[AMSCookieDatabase dealloc](&v3, sel_dealloc);
}

- (AMSCookieDatabase)initWithConnection:(id)a3 path:(id)a4
{
  id v7;
  id v8;
  AMSCookieDatabase *v9;
  AMSCookieDatabase *v10;
  uint64_t v11;
  NSString *dbPath;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSCookieDatabase;
  v9 = -[AMSCookieDatabase init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_msgSend(v7, "setDelegate:", v10);
    v11 = objc_msgSend(v8, "copy");
    dbPath = v10->_dbPath;
    v10->_dbPath = (NSString *)v11;

  }
  return v10;
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v7;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Resetting connection for corruption is called.", (uint8_t *)&v20, 0x16u);

  }
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", CFSTR("AMSCookies"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "truncate") & 1) == 0)
  {
    objc_msgSend(v4, "close");
    -[AMSCookieDatabase dbPath](self, "dbPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_10;
    v11 = (void *)MEMORY[0x1E0C99E98];
    -[AMSCookieDatabase dbPath](self, "dbPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[AMSDatabaseHelper removeDatabaseAtURL:](AMSDatabaseHelper, "removeDatabaseAtURL:", v13);

    if (!v14)
      goto LABEL_10;
  }
  if (+[AMSCookieDatabaseSchema createOrUpdateSchemaUsingConnection:](AMSCookieDatabaseSchema, "createOrUpdateSchemaUsingConnection:", v4))
  {
    v15 = 1;
  }
  else
  {
LABEL_10:
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
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
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset AMS cookie database after corruption. This is bad!", (uint8_t *)&v20, 0xCu);
    }

    v15 = 0;
  }
  objc_msgSend(v9, "invalidate");

  return v15;
}

- (NSString)dbPath
{
  return self->_dbPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbPath, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
