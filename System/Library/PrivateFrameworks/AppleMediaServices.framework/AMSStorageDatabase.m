@implementation AMSStorageDatabase

- (id)isLassetAndReturnError:(id *)a3
{
  AMSStorageDatabase *v4;
  NSNumber v5;
  NSNumber v6;
  void *v7;
  id v8;

  v4 = self;
  v5.super.super.isa = AMSStorageDatabase.isLasset()().super.super.isa;

  if (v6.super.super.isa)
  {
    if (a3)
    {
      v7 = (void *)sub_18CEC1354();

      v8 = v7;
      v5.super.super.isa = 0;
      *a3 = v7;
    }
    else
    {

      v5.super.super.isa = 0;
    }
  }
  return v5.super.super.isa;
}

- (BOOL)setIsLasset:(id)a3 error:(id *)a4
{
  id v6;
  AMSStorageDatabase *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = self;
  AMSStorageDatabase.setIsLasset(_:)((NSNumber)v6);

  if (v8)
  {
    if (a4)
    {
      v9 = (void *)sub_18CEC1354();

      v10 = v9;
      *a4 = v9;
    }
    else
    {

    }
  }
  return v8 == 0;
}

- (AMSStorageDatabase)initWithDomain:(id)a3
{
  id v5;
  AMSStorageDatabase *v6;
  AMSStorageDatabase *v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *internalQueue;
  AMSSQLiteConnectionOptions *v15;
  AMSSQLiteConnection *v16;
  AMSSQLiteConnection *connection;
  AMSStorageDatabase *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD aBlock[4];
  id v25;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AMSStorageDatabase;
  v6 = -[AMSStorageDatabase init](&v26, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  objc_storeStrong((id *)&v6->_domain, a3);
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", CFSTR("AMSStorage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__AMSStorageDatabase_initWithDomain___block_invoke;
  aBlock[3] = &unk_1E253DBD8;
  v9 = v8;
  v25 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[AMSStorageDatabase _cachePath](v7, "_cachePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDatabaseHelper databasePathForCachePath:type:](AMSDatabaseHelper, "databasePathForCachePath:type:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (AMSSQLiteConnectionOptions *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (AMSSQLiteConnectionOptions *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSSQLiteConnectionOptions OSLogObject](v15, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Fatal Error: Failed to fetch AMSStorage database path.", buf, 0xCu);
    }
    goto LABEL_15;
  }
  v13 = dispatch_queue_create("com.apple.AMSStorageDatabase.internal", 0);
  internalQueue = v7->_internalQueue;
  v7->_internalQueue = (OS_dispatch_queue *)v13;

  v15 = -[AMSSQLiteConnectionOptions initWithDatabasePath:]([AMSSQLiteConnectionOptions alloc], "initWithDatabasePath:", v12);
  v16 = -[AMSSQLiteConnection initWithOptions:]([AMSSQLiteConnection alloc], "initWithOptions:", v15);
  connection = v7->_connection;
  v7->_connection = v16;

  -[AMSSQLiteConnection setDelegate:](v7->_connection, "setDelegate:", v7);
  if (!+[AMSStorageDatabaseSchema createOrUpdateSchemaUsingConnection:](AMSStorageDatabaseSchema, "createOrUpdateSchemaUsingConnection:", v7->_connection))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v19, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v28 = v22;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Fatal Error: Failed to create the AMSStorage database schema.", buf, 0xCu);
    }

LABEL_15:
    v10[2](v10);

    v18 = 0;
    goto LABEL_16;
  }

  v10[2](v10);
LABEL_5:
  v18 = v7;
LABEL_16:

  return v18;
}

uint64_t __37__AMSStorageDatabase_initWithDomain___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)dealloc
{
  objc_super v3;

  -[AMSStorageDatabase close](self, "close");
  -[AMSStorageDatabase setConnection:](self, "setConnection:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AMSStorageDatabase;
  -[AMSStorageDatabase dealloc](&v3, sel_dealloc);
}

+ (BOOL)isFeatureSupported
{
  return _os_feature_enabled_impl();
}

- (void)close
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", CFSTR("AMSStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSStorageDatabase connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "close");

  if ((v5 & 1) == 0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      *(_DWORD *)v9 = 138543362;
      *(_QWORD *)&v9[4] = objc_opt_class();
      v8 = *(id *)&v9[4];
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to close the AMSStorage database connection", v9, 0xCu);

    }
  }
  objc_msgSend(v3, "invalidate", *(_OWORD *)v9);

}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id obj;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v6 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__65;
  v41 = __Block_byref_object_dispose__65;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__65;
  v31 = __Block_byref_object_dispose__65;
  v32 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __40__AMSStorageDatabase_valueForKey_error___block_invoke;
  v22[3] = &unk_1E2545E78;
  v22[4] = self;
  v24 = &v27;
  v7 = v6;
  v23 = v7;
  v25 = &v33;
  v26 = &v37;
  -[AMSStorageDatabase _performTransaction:](self, "_performTransaction:", v22);
  v14 = (id *)(v28 + 5);
  v13 = (void *)v28[5];
  if (!v13)
  {
    v16 = v38[5];
    if (v16)
    {
      v17 = v34[3];
      obj = 0;
      -[AMSStorageDatabase _convertToValueWithData:valueType:error:](self, "_convertToValueWithData:valueType:error:", v16, v17, &obj);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v14, obj);
      goto LABEL_9;
    }
    AMSErrorWithFormat(7, CFSTR("No value found in AMSStorage database."), CFSTR("No value found with key: %@ in the AMSStorage database."), v8, v9, v10, v11, v12, (uint64_t)v7);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v28[5];
    v28[5] = v18;

    if (a4)
    {
      v13 = (void *)v28[5];
      goto LABEL_3;
    }
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  if (!a4)
    goto LABEL_8;
LABEL_3:
  v15 = 0;
  *a4 = objc_retainAutorelease(v13);
LABEL_9:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v15;
}

BOOL __40__AMSStorageDatabase_valueForKey_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _BOOL8 v5;
  __int128 v7;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__AMSStorageDatabase_valueForKey_error___block_invoke_2;
  v8[3] = &unk_1E25435D8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 40);
  v3 = (id)v7;
  v4 = *(_OWORD *)(a1 + 56);
  v9 = v7;
  v10 = v4;
  objc_msgSend(v2, "executeQuery:withResults:", CFSTR("SELECT key, valueType, value FROM data WHERE key=? AND domain=?;"),
    v8);

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v5;
}

void __40__AMSStorageDatabase_valueForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  __int128 v11;
  uint64_t v12;
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
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(v5, "bindString:atPosition:", *(_QWORD *)(a1 + 40), 1);
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bindString:atPosition:", v9, 2);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__AMSStorageDatabase_valueForKey_error___block_invoke_16;
    v10[3] = &unk_1E25435B0;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = *(_OWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v5, "enumerateRowsUsingBlock:", v10);
  }

}

void __40__AMSStorageDatabase_valueForKey_error___block_invoke_16(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v12 = 138543618;
      v13 = objc_opt_class();
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", (uint8_t *)&v12, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = (int)objc_msgSend(v5, "intForColumnName:", CFSTR("valueType"));
    objc_msgSend(v5, "dataForColumnName:", CFSTR("value"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[AMSStorageDatabase _valueTypeForValue:](self, "_valueTypeForValue:", v8);
  if (v10 != 1)
  {
    v16 = v10;
    if (!v10)
    {
      AMSErrorWithFormat(2, CFSTR("Value type not supported"), CFSTR("The value type you are trying to use is not supported. Did you mean to conform to 'AMSStorageDatabasePersistable'? Key: %@"), v11, v12, v13, v14, v15, (uint64_t)v9);
      goto LABEL_5;
    }
    v34 = 0;
    -[AMSStorageDatabase _convertToDataWithValue:valueType:error:](self, "_convertToDataWithValue:valueType:error:", v8, v10, &v34);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v34;
    if (v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        v28 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v36 = v28;
        v37 = 2114;
        v38 = v9;
        v39 = 2114;
        v40 = v18;
        _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@: Creating data object for %{public}@ failed with error: %{public}@", buf, 0x20u);
      }

      if (a5)
      {
        v19 = 0;
        *a5 = objc_retainAutorelease(v18);
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      if (v20)
      {
        v19 = -[AMSStorageDatabase _setValueData:valueType:forKey:error:](self, "_setValueData:valueType:forKey:error:", v20, v16, v9, a5);
        goto LABEL_25;
      }
      AMSErrorWithFormat(2, CFSTR("Error converting value to data"), CFSTR("There was an issue converting value to data for key: %@"), v21, v22, v23, v24, v25, (uint64_t)v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v36 = v32;
        v37 = 2114;
        v38 = v9;
        v39 = 2114;
        v40 = v29;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Creating data object for %{public}@ failed with error: %{public}@", buf, 0x20u);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v29);

    }
    v19 = 0;
    goto LABEL_25;
  }
  AMSErrorWithFormat(2, CFSTR("Value is null"), CFSTR("You are trying to save a null value. Did you mean to call 'deleteForKey'? Key: %@"), v11, v12, v13, v14, v15, (uint64_t)v9);
LABEL_5:
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (a5)
  {
    v18 = objc_retainAutorelease(v17);
    v19 = 0;
    *a5 = v18;
  }
  else
  {
    v19 = 0;
  }
LABEL_26:

  return v19;
}

- (BOOL)BOOLeanForKey:(id)a3 error:(id *)a4
{
  void *v4;
  char v5;

  -[AMSStorageDatabase valueForKey:error:](self, "valueForKey:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)setBoolean:(BOOL)a3 forKey:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSStorageDatabase _convertToDataWithValue:valueType:error:](self, "_convertToDataWithValue:valueType:error:", v10, 2, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[AMSStorageDatabase _setValueData:valueType:forKey:error:](self, "_setValueData:valueType:forKey:error:", v11, 2, v9, a5);
  return (char)a5;
}

- (int64_t)integerForKey:(id)a3 error:(id *)a4
{
  void *v4;
  int64_t v5;

  -[AMSStorageDatabase valueForKey:error:](self, "valueForKey:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSStorageDatabase _convertToDataWithValue:valueType:error:](self, "_convertToDataWithValue:valueType:error:", v10, 2, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[AMSStorageDatabase _setValueData:valueType:forKey:error:](self, "_setValueData:valueType:forKey:error:", v11, 2, v9, a5);
  return (char)a5;
}

- (double)doubleForKey:(id)a3 error:(id *)a4
{
  void *v4;
  double v5;
  double v6;

  -[AMSStorageDatabase valueForKey:error:](self, "valueForKey:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (BOOL)setDouble:(double)a3 forKey:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSStorageDatabase _convertToDataWithValue:valueType:error:](self, "_convertToDataWithValue:valueType:error:", v10, 2, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[AMSStorageDatabase _setValueData:valueType:forKey:error:](self, "_setValueData:valueType:forKey:error:", v11, 2, v9, a5);
  return (char)a5;
}

- (BOOL)deleteForKey:(id)a3 error:(id *)a4
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
  v16 = __Block_byref_object_copy__65;
  v17 = __Block_byref_object_dispose__65;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__AMSStorageDatabase_deleteForKey_error___block_invoke;
  v10[3] = &unk_1E2543538;
  v10[4] = self;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  -[AMSStorageDatabase _performTransaction:](self, "_performTransaction:", v10);
  v8 = (void *)v14[5];
  if (a4 && v8)
    *a4 = objc_retainAutorelease(v8);

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

uint64_t __41__AMSStorageDatabase_deleteForKey_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id obj;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __41__AMSStorageDatabase_deleteForKey_error___block_invoke_2;
  v14[3] = &unk_1E2545B08;
  v14[1] = 3221225472;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v15 = v5;
  v16 = v6;
  v7 = objc_msgSend(v2, "executeStatement:error:bindings:", CFSTR("DELETE FROM data WHERE key=? AND domain=?;"),
         &obj,
         v14);
  objc_storeStrong((id *)(v4 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v19 = v10;
      v20 = 2114;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Deleting value for key: %{public}@ failed with error: %{public}@", buf, 0x20u);
    }

  }
  return v7;
}

void __41__AMSStorageDatabase_deleteForKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindString:atPosition:", v5, 2);

}

- (id)sizeWithError:(id *)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  _QWORD v12[5];
  id v13;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__65;
  v12[4] = __Block_byref_object_dispose__65;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__65;
  v10 = __Block_byref_object_dispose__65;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AMSStorageDatabase_sizeWithError___block_invoke;
  v5[3] = &unk_1E2545EF0;
  v5[4] = self;
  v5[5] = v12;
  v5[6] = &v6;
  -[AMSStorageDatabase _performTransaction:](self, "_performTransaction:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(v12, 8);
  return v3;
}

BOOL __36__AMSStorageDatabase_sizeWithError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__AMSStorageDatabase_sizeWithError___block_invoke_2;
  v4[3] = &unk_1E2545EC8;
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "executeQuery:withResults:", CFSTR("SELECT SUM(pgsize) FROM dbstat WHERE name='data';"), v4);

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

void __36__AMSStorageDatabase_sizeWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__AMSStorageDatabase_sizeWithError___block_invoke_46;
    v9[3] = &unk_1E2545EA0;
    v10 = *(_OWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(a2, "enumerateRowsUsingBlock:", v9);
  }

}

void __36__AMSStorageDatabase_sizeWithError___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v12 = 138543618;
      v13 = objc_opt_class();
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", (uint8_t *)&v12, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(a2, "stringForColumnIndex:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (id)allKeysForDomain:(id)a3 withError:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__65;
  v25 = __Block_byref_object_dispose__65;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__65;
  v19 = __Block_byref_object_dispose__65;
  v20 = (id)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke;
  v11[3] = &unk_1E2545F40;
  v11[4] = self;
  v13 = &v21;
  v7 = v6;
  v12 = v7;
  v14 = &v15;
  -[AMSStorageDatabase _performTransaction:](self, "_performTransaction:", v11);
  if (a4)
  {
    v8 = (void *)v22[5];
    if (v8)
      *a4 = objc_retainAutorelease(v8);
  }
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

BOOL __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _BOOL8 v4;
  __int128 v6;
  _QWORD v7[5];
  __int128 v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke_2;
  v7[3] = &unk_1E2545F18;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 40);
  v3 = (id)v6;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "executeQuery:withResults:", CFSTR("SELECT key FROM data WHERE domain=? ORDER BY length(data.value) DESC;"),
    v7);

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v4;
}

void __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  __int128 v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v12 = objc_opt_class();
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(v5, "bindString:atPosition:", a1[5], 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke_50;
    v9[3] = &unk_1E2545EA0;
    v9[4] = a1[4];
    v10 = *((_OWORD *)a1 + 3);
    objc_msgSend(v5, "enumerateRowsUsingBlock:", v9);
  }

}

void __49__AMSStorageDatabase_allKeysForDomain_withError___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v10 = 138543618;
      v11 = objc_opt_class();
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(a2, "stringForColumnIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);

  }
}

- (id)allKeyValuesWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id obj;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[5];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__65;
  v29[4] = __Block_byref_object_dispose__65;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__65;
  v27 = __Block_byref_object_dispose__65;
  v28 = (id)objc_opt_new();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke;
  v22[3] = &unk_1E2545EF0;
  v22[4] = self;
  v22[5] = v29;
  v22[6] = &v23;
  -[AMSStorageDatabase _performTransaction:](self, "_performTransaction:", v22);
  v4 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)v24[5];
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7);
        v12 = 0;
        v13 = &v12;
        v14 = 0x3032000000;
        v15 = __Block_byref_object_copy__65;
        v16 = __Block_byref_object_dispose__65;
        v17 = (id)objc_opt_new();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_55;
        v11[3] = &unk_1E2545F40;
        v11[4] = self;
        v11[5] = v8;
        v11[6] = v29;
        v11[7] = &v12;
        -[AMSStorageDatabase _performTransaction:](self, "_performTransaction:", v11);
        objc_msgSend(v4, "setObject:forKey:", v13[5], v8);
        _Block_object_dispose(&v12, 8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(v29, 8);

  return v4;
}

BOOL __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_2;
  v4[3] = &unk_1E2545EC8;
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "executeQuery:withResults:", CFSTR("SELECT DISTINCT domain FROM data;"), v4);

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

void __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_53;
    v9[3] = &unk_1E2545EA0;
    v10 = *(_OWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(a2, "enumerateRowsUsingBlock:", v9);
  }

}

void __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v10 = 138543618;
      v11 = objc_opt_class();
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(a2, "stringForColumnIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);

  }
}

BOOL __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_55(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_2_58;
  v5[3] = &unk_1E2545F18;
  v3 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v2, "executeQuery:withResults:", CFSTR("SELECT key, value, valueType FROM data WHERE domain=? ORDER BY length(data.value) DESC;"),
    v5);

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

void __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_2_58(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  __int128 v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v12 = objc_opt_class();
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(v5, "bindString:atPosition:", a1[5], 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_59;
    v9[3] = &unk_1E2545EA0;
    v9[4] = a1[4];
    v10 = *((_OWORD *)a1 + 3);
    objc_msgSend(v5, "enumerateRowsUsingBlock:", v9);
  }

}

void __44__AMSStorageDatabase_allKeyValuesWithError___block_invoke_59(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id obj;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v20 = objc_opt_class();
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    v9 = *(_QWORD *)(a1[5] + 8);
    v10 = v6;
    v11 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }
  else
  {
    objc_msgSend(v5, "stringForColumnIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "intForColumnName:", CFSTR("valueType"));
    objc_msgSend(v5, "dataForColumnName:", CFSTR("value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12;
    v15 = (void *)a1[4];
    v16 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v16 + 40);
    objc_msgSend(v15, "_convertToValueWithData:valueType:error:", v13, v14, &obj);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v16 + 40), obj);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKey:", v17, v11);

  }
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", CFSTR("AMSStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v4, "truncate") & 1) != 0
     || (objc_msgSend(v4, "close"),
         -[AMSStorageDatabase _cachePath](self, "_cachePath"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = +[AMSDatabaseHelper removeDatabaseForCachePath:](AMSDatabaseHelper, "removeDatabaseForCachePath:", v6), v6, v7))&& +[AMSStorageDatabaseSchema createOrUpdateSchemaUsingConnection:](AMSStorageDatabaseSchema, "createOrUpdateSchemaUsingConnection:", v4))
  {
    v8 = 1;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v12 = 138543362;
      v13 = objc_opt_class();
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset AMSStorage database after corruption. This is bad!", (uint8_t *)&v12, 0xCu);
    }

    v8 = 0;
  }
  objc_msgSend(v5, "invalidate");

  return v8;
}

- (id)_allKeysPrefixedByDomainWithError:(id *)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__65;
  v34 = __Block_byref_object_dispose__65;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__65;
  v28 = __Block_byref_object_dispose__65;
  v29 = (id)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke;
  v23[3] = &unk_1E2545EF0;
  v23[4] = self;
  v23[5] = &v30;
  v23[6] = &v24;
  -[AMSStorageDatabase _performTransaction:](self, "_performTransaction:", v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (id)v25[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v36, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v10 = (id *)(v31 + 5);
        obj = (id)v31[5];
        -[AMSStorageDatabase allKeysForDomain:withError:](self, "allKeysForDomain:withError:", v9, &obj);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v10, obj);
        if (objc_msgSend(v11, "count"))
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "componentsJoinedByString:", CFSTR(";"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:%@"), v9, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObject:", v11);
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v36, 16);
    }
    while (v6);
  }

  if (a3)
  {
    v15 = (void *)v31[5];
    if (v15)
      *a3 = objc_retainAutorelease(v15);
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v4;
}

BOOL __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke_2;
  v4[3] = &unk_1E2545EC8;
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "executeQuery:withResults:", CFSTR("SELECT DISTINCT domain FROM data;"), v4);

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

void __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke_60;
    v9[3] = &unk_1E2545EA0;
    v10 = *(_OWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(a2, "enumerateRowsUsingBlock:", v9);
  }

}

void __56__AMSStorageDatabase__allKeysPrefixedByDomainWithError___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v10 = 138543618;
      v11 = objc_opt_class();
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to query data in AMSStorage database. %{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(a2, "stringForColumnIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);

  }
}

- (int64_t)_valueTypeForValue:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = 3;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = 4;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = 5;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v4 = 6;
          }
          else if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EE077D08) & 1) != 0)
          {
            v4 = 7;
          }
          else
          {
            v4 = v3 == 0;
          }
        }
      }
    }
  }

  return v4;
}

- (id)_convertToDataWithValue:(id)a3 valueType:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  AMSStorageDatabase *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  switch(a4)
  {
    case 0:
    case 1:
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        *(_DWORD *)buf = 138543362;
        v17 = objc_opt_class();
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Unsupported value can't be saved to the database. This path should not be reachable.", buf, 0xCu);
      }

      self = 0;
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dataUsingEncoding:", 4);
      self = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();

      break;
    case 3:
    case 5:
    case 6:
      -[AMSStorageDatabase _dataForPlistValue:error:](self, "_dataForPlistValue:error:", v8, a5);
      v10 = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4:
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v10 = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      self = v10;
      break;
    case 7:
      objc_msgSend(v8, "serializeToDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSStorageDatabase _dataForPlistValue:error:](self, "_dataForPlistValue:error:", v14, a5);
      self = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }

  return self;
}

- (id)_convertToValueWithData:(id)a3 valueType:(int64_t)a4 error:(id *)a5
{
  id v8;
  AMSStorageDatabase *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  switch(a4)
  {
    case 0:
    case 1:
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v15 = 138543362;
        v16 = objc_opt_class();
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Unsupported value should not have been saved to the database. This path should not be reachable.", (uint8_t *)&v15, 0xCu);
      }

      self = 0;
      break;
    case 2:
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
      v13 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v13, "numberFromString:", v12);
      self = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();

      break;
    case 3:
    case 5:
    case 6:
    case 7:
      -[AMSStorageDatabase _plistValueForData:error:](self, "_plistValueForData:error:", v8, a5);
      v9 = (AMSStorageDatabase *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 4:
      v9 = (AMSStorageDatabase *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
LABEL_3:
      self = v9;
      break;
    default:
      break;
  }

  return self;
}

- (id)_dataForPlistValue:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  id v25;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v5, 100) & 1) != 0)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v25;
    v18 = v12;
    if (v11)
    {
      v19 = v11;
    }
    else
    {
      AMSErrorWithFormat(3, CFSTR("Error serializing data"), CFSTR("Error serializing plist data in the AMSStorage database: %@"), v13, v14, v15, v16, v17, (uint64_t)v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (a4)
        *a4 = objc_retainAutorelease(v21);

    }
  }
  else
  {
    AMSErrorWithFormat(3, CFSTR("AMSStorage invalid format"), CFSTR("Trying to save invalid format in the AMSStorage database."), v6, v7, v8, v9, v10, v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;
    if (a4)
    {
      v18 = objc_retainAutorelease(v20);
      v11 = 0;
      *a4 = v18;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)_plistValueForData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  id v19;
  uint64_t v20;

  v19 = 0;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, &v20, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  v12 = v6;
  if (v5)
  {
    if (v20 == 100)
    {
      v13 = v5;
    }
    else
    {
      AMSErrorWithFormat(3, CFSTR("AMSStorage invalid format"), CFSTR("Trying to read invalid format from the AMSStorage database."), v7, v8, v9, v10, v11, v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        v12 = objc_retainAutorelease(v16);
        v13 = 0;
        *a4 = v12;
      }
      else
      {
        v13 = 0;
        v12 = v16;
      }
    }
  }
  else
  {
    AMSErrorWithFormat(3, CFSTR("Error deserializing data"), CFSTR("Error deserializing plist data in the AMSStorage database: %@"), v7, v8, v9, v10, v11, (uint64_t)v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a4)
      *a4 = objc_retainAutorelease(v14);

    v13 = 0;
  }

  return v13;
}

- (BOOL)_setValueData:(id)a3 valueType:(int64_t)a4 forKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v10 = a3;
  v11 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__65;
  v25 = __Block_byref_object_dispose__65;
  v26 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__AMSStorageDatabase__setValueData_valueType_forKey_error___block_invoke;
  v16[3] = &unk_1E2545F90;
  v16[4] = self;
  v19 = &v21;
  v12 = v11;
  v17 = v12;
  v20 = a4;
  v13 = v10;
  v18 = v13;
  -[AMSStorageDatabase _performTransaction:](self, "_performTransaction:", v16);
  v14 = (void *)v22[5];
  if (a6 && v14)
    *a6 = objc_retainAutorelease(v14);

  _Block_object_dispose(&v21, 8);
  return v14 == 0;
}

uint64_t __59__AMSStorageDatabase__setValueData_valueType_forKey_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  id obj;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __59__AMSStorageDatabase__setValueData_valueType_forKey_error___block_invoke_2;
  v14[3] = &unk_1E2545F68;
  v4 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v14[1] = 3221225472;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 64);
  v15 = v5;
  v17 = v6;
  v16 = *(id *)(a1 + 48);
  v7 = objc_msgSend(v2, "executeStatement:error:bindings:", CFSTR("INSERT OR REPLACE INTO data (domain, key, valueType, value, lastModified) VALUES (?,?,?,?,?);"),
         &obj,
         v14);
  objc_storeStrong((id *)(v3 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v20 = v10;
      v21 = 2114;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Inserting data for key: %{public}@ failed with error: %{public}@", buf, 0x20u);
    }

  }
  return v7;
}

void __59__AMSStorageDatabase__setValueData_valueType_forKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindString:atPosition:", v4, 1);

  objc_msgSend(v5, "bindString:atPosition:", *(_QWORD *)(a1 + 40), 2);
  objc_msgSend(v5, "bindInt:atPosition:", *(unsigned int *)(a1 + 56), 3);
  objc_msgSend(v5, "bindData:atPosition:", *(_QWORD *)(a1 + 48), 4);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "bindDouble:atPosition:", 5);

}

- (id)_cachePath
{
  return +[AMSDatabaseHelper databaseFolderNameForType:](AMSDatabaseHelper, "databaseFolderNameForType:", 1);
}

- (void)_performTransaction:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", CFSTR("AMSStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSStorageDatabase internalQueue](self, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AMSStorageDatabase__performTransaction___block_invoke;
  block[3] = &unk_1E253E900;
  v10 = v5;
  v11 = v4;
  block[4] = self;
  v7 = v5;
  v8 = v4;
  dispatch_sync(v6, block);

}

void __42__AMSStorageDatabase__performTransaction___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  objc_msgSend(a1[4], "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__AMSStorageDatabase__performTransaction___block_invoke_2;
  v6[3] = &unk_1E25436F0;
  v7 = a1[6];
  objc_msgSend(v2, "performTransaction:", v6);

  objc_msgSend(a1[4], "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __42__AMSStorageDatabase__performTransaction___block_invoke_3;
  v5[3] = &unk_1E2543718;
  v5[4] = a1[4];
  objc_msgSend(v4, "performTransaction:", v5);

  objc_msgSend(a1[5], "invalidate");
}

uint64_t __42__AMSStorageDatabase__performTransaction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__AMSStorageDatabase__performTransaction___block_invoke_3(uint64_t a1)
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
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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

+ (id)sharedDatabaseWithDomain:(id)a3
{
  id v3;
  AMSStorageDatabase *v4;

  v3 = a3;
  v4 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", v3);

  return v4;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (AMSSQLiteConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
