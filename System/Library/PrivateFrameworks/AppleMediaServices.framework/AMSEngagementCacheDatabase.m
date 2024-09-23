@implementation AMSEngagementCacheDatabase

- (BOOL)closeWithError:(id *)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  int v11;
  void *v12;
  BOOL v13;
  _QWORD aBlock[4];
  id v16;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__AMSEngagementCacheDatabase_closeWithError___block_invoke;
  aBlock[3] = &unk_1E253DBD8;
  v8 = v7;
  v16 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[AMSEngagementCacheDatabase connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "close");

  if (v11)
  {
    -[AMSEngagementCacheDatabase setConnection:](self, "setConnection:", 0);
  }
  else if (a3)
  {
    AMSError(16, CFSTR("Close Failure"), CFSTR("Failed to close Engagement cache database."), 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[AMSEngagementCacheDatabase connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  v9[2](v9);
  return v13;
}

uint64_t __45__AMSEngagementCacheDatabase_closeWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (BOOL)collectGarbageWithError:(id *)a3
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AMSEngagementCacheDatabase_collectGarbageWithError___block_invoke;
  v5[3] = &unk_1E25417B0;
  v5[4] = &v6;
  v5[5] = a3;
  -[AMSEngagementCacheDatabase _performTransaction:](self, "_performTransaction:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AMSEngagementCacheDatabase_collectGarbageWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD v10[5];

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ < ?"), 0x1E25537C0, 0x1E25537E0);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__AMSEngagementCacheDatabase_collectGarbageWithError___block_invoke_2;
  v10[3] = &__block_descriptor_40_e28_v16__0___AMSSQLiteBinding__8l;
  v10[4] = v7;
  v8 = objc_msgSend(v4, "executeStatement:error:bindings:", v5, v6, v10);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  return 1;
}

uint64_t __54__AMSEngagementCacheDatabase_collectGarbageWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindDouble:atPosition:", 1, *(double *)(a1 + 32));
}

- (BOOL)insertResponseData:(id)a3 filterData:(id)a4 expiration:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__AMSEngagementCacheDatabase_insertResponseData_filterData_expiration_error___block_invoke;
  v17[3] = &unk_1E25417D8;
  v18 = v10;
  v19 = v12;
  v20 = v11;
  v21 = a6;
  v13 = v11;
  v14 = v12;
  v15 = v10;
  -[AMSEngagementCacheDatabase _performTransaction:](self, "_performTransaction:", v17);

  return 1;
}

uint64_t __77__AMSEngagementCacheDatabase_insertResponseData_filterData_expiration_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@) VALUES (?,?,?)"), 0x1E25537C0, 0x1E254BFC0, 0x1E25537E0, 0x1E2553660);
  v6 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__AMSEngagementCacheDatabase_insertResponseData_filterData_expiration_error___block_invoke_2;
  v9[3] = &unk_1E2540340;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v7 = objc_msgSend(v4, "executeStatement:error:bindings:", v5, v6, v9);

  return v7;
}

void __77__AMSEngagementCacheDatabase_insertResponseData_filterData_expiration_error___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "bindData:atPosition:", v3, 1);
  objc_msgSend(v4, "bindDate:atPosition:", a1[5], 2);
  objc_msgSend(v4, "bindData:atPosition:", a1[6], 3);

}

- (BOOL)selectWithExpirationDate:(id)a3 handler:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke;
  v13[3] = &unk_1E2541850;
  v10 = v8;
  v16 = &v18;
  v17 = a5;
  v14 = v10;
  v11 = v9;
  v15 = v11;
  -[AMSEngagementCacheDatabase _performTransaction:](self, "_performTransaction:", v13);
  LOBYTE(self) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)self;
}

uint64_t __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("SELECT %@, %@ FROM %@ WHERE %@ > ?"), 0x1E254BFC0, 0x1E2553660, 0x1E25537C0, 0x1E25537E0);
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke_2;
  v10[3] = &unk_1E2541828;
  v12 = *(_QWORD *)(a1 + 56);
  v13 = v6;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v11 = v9;
  objc_msgSend(v4, "executeQuery:withResults:", v5, v10);

  return 1;
}

void __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  _QWORD v11[4];
  __int128 v12;
  uint64_t v13;

  v5 = a3;
  if (v5)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v10 = v5;
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v5);
      v5 = v10;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    v6 = *(double *)(a1 + 56);
    v7 = a2;
    objc_msgSend(v7, "bindDouble:atPosition:", 1, v6);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke_3;
    v11[3] = &unk_1E2541800;
    v13 = *(_QWORD *)(a1 + 48);
    v9 = *(_OWORD *)(a1 + 32);
    v8 = (id)v9;
    v12 = v9;
    objc_msgSend(v7, "enumerateRowsUsingBlock:", v11);

    v5 = 0;
  }

}

void __69__AMSEngagementCacheDatabase_selectWithExpirationDate_handler_error___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    if (a4)
      *a4 = 1;
  }
  else
  {
    objc_msgSend(v11, "dataForColumnIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataForColumnIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      *a4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (BOOL)openAtPath:(id)a3 error:(id *)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD);
  AMSSQLiteConnectionOptions *v12;
  AMSSQLiteConnection *v13;
  void *v14;
  BOOL v15;
  _QWORD aBlock[4];
  id v18;

  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__AMSEngagementCacheDatabase_openAtPath_error___block_invoke;
  aBlock[3] = &unk_1E253DBD8;
  v10 = v9;
  v18 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  v12 = -[AMSSQLiteConnectionOptions initWithDatabasePath:]([AMSSQLiteConnectionOptions alloc], "initWithDatabasePath:", v6);
  v13 = -[AMSSQLiteConnection initWithOptions:]([AMSSQLiteConnection alloc], "initWithOptions:", v12);
  -[AMSSQLiteConnection setDelegate:](v13, "setDelegate:", self);
  if (+[AMSEngagementCacheDatabaseSchema createOrUpdateSchemaUsingConnection:](AMSEngagementCacheDatabaseSchema, "createOrUpdateSchemaUsingConnection:", v13))
  {
    -[AMSEngagementCacheDatabase setConnection:](self, "setConnection:", v13);
  }
  else if (a4)
  {
    AMSError(16, CFSTR("Open Failure"), CFSTR("Failed to open Engagement cache database."), 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[AMSEngagementCacheDatabase connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 != 0;

  v11[2](v11);
  return v15;
}

uint64_t __47__AMSEngagementCacheDatabase_openAtPath_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v22;
  _QWORD aBlock[4];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__AMSEngagementCacheDatabase_connectionNeedsResetForCorruption___block_invoke;
  aBlock[3] = &unk_1E253DBD8;
  v7 = v6;
  v24 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((objc_msgSend(v3, "truncate") & 1) == 0)
  {
    objc_msgSend(v3, "close");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "databasePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v12 = objc_msgSend(v9, "removeItemAtPath:error:", v11, &v22);
    v13 = v22;

    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
        v26 = v17;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset Engagement database after corruption. This is bad!", buf, 0xCu);
      }

      goto LABEL_11;
    }

  }
  if (+[AMSEngagementCacheDatabaseSchema createOrUpdateSchemaUsingConnection:](AMSEngagementCacheDatabaseSchema, "createOrUpdateSchemaUsingConnection:", v3))
  {
    v14 = 1;
    goto LABEL_16;
  }
LABEL_11:
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    *(_DWORD *)buf = 138543362;
    v26 = v20;
    _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset Engagement database after corruption. This is bad!", buf, 0xCu);
  }

  v14 = 0;
LABEL_16:
  v8[2](v8);

  return v14;
}

uint64_t __64__AMSEngagementCacheDatabase_connectionNeedsResetForCorruption___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_performTransaction:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD aBlock[4];
  id v18;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSKeepAlive keepAliveWithName:](AMSKeepAlive, "keepAliveWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__AMSEngagementCacheDatabase__performTransaction___block_invoke;
  aBlock[3] = &unk_1E253DBD8;
  v9 = v7;
  v18 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[AMSEngagementCacheDatabase connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __50__AMSEngagementCacheDatabase__performTransaction___block_invoke_2;
  v14[3] = &unk_1E2541878;
  v12 = v4;
  v16 = v12;
  v13 = v11;
  v15 = v13;
  objc_msgSend(v13, "performTransaction:", v14);

  v10[2](v10);
}

uint64_t __50__AMSEngagementCacheDatabase__performTransaction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __50__AMSEngagementCacheDatabase__performTransaction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (AMSSQLiteConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
