@implementation AMSSQLiteSchema

- (AMSSQLiteSchema)initWithConnection:(id)a3
{
  id v5;
  AMSSQLiteSchema *v6;
  AMSSQLiteSchema *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSQLiteSchema;
  v6 = -[AMSSQLiteSchema init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (int64_t)currentUserVersion
{
  AMSSQLiteConnection *connection;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  connection = self->_connection;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AMSSQLiteSchema_currentUserVersion__block_invoke;
  v5[3] = &unk_1E2545E20;
  v5[4] = &v6;
  -[AMSSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("PRAGMA user_version;"),
    v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __37__AMSSQLiteSchema_currentUserVersion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "firstInt64Value");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)column:(id)a3 existsInTable:(id)a4
{
  id v6;
  id v7;
  AMSSQLiteConnection *connection;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  connection = self->_connection;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA table_info(%@);"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__AMSSQLiteSchema_column_existsInTable___block_invoke;
  v12[3] = &unk_1E2545DF8;
  v14 = &v15;
  v10 = v6;
  v13 = v10;
  -[AMSSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v9, v12);

  LOBYTE(connection) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)connection;
}

void __40__AMSSQLiteSchema_column_existsInTable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6[2];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AMSSQLiteSchema_column_existsInTable___block_invoke_2;
  v5[3] = &unk_1E2545DD0;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  *(_OWORD *)v6 = v4;
  objc_msgSend(a2, "enumerateRowsUsingBlock:", v5);

}

void __40__AMSSQLiteSchema_column_existsInTable___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  id v7;

  objc_msgSend(a2, "stringForColumnName:", CFSTR("name"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  *a4 = v6;

}

- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  AMSSQLiteConnection *connection;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__AMSSQLiteSchema_migrateToVersion_usingBlock___block_invoke;
  v10[3] = &unk_1E2545E48;
  v10[4] = self;
  v8 = v6;
  v11 = v8;
  v12 = &v14;
  v13 = a3;
  -[AMSSQLiteConnection performTransaction:](connection, "performTransaction:", v10);
  LOBYTE(a3) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return a3;
}

uint64_t __47__AMSSQLiteSchema_migrateToVersion_usingBlock___block_invoke(uint64_t a1)
{
  AMSSQLiteSchemaMigration *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = -[AMSSQLiteSchemaMigration initWithConnection:]([AMSSQLiteSchemaMigration alloc], "initWithConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[AMSSQLiteSchemaMigration success](v2, "success");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setUserVersion:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
      v5 = objc_opt_class();
      -[AMSSQLiteSchemaMigration error](v2, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to run database migration. Error: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  return v7;
}

- (BOOL)tableExists:(id)a3
{
  id v4;
  AMSSQLiteConnection *connection;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  connection = self->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__AMSSQLiteSchema_tableExists___block_invoke;
  v8[3] = &unk_1E2545A40;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[AMSSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("SELECT name FROM sqlite_master where name = '?'"), v8);
  LOBYTE(connection) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)connection;
}

void __31__AMSSQLiteSchema_tableExists___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  LOBYTE(v3) = objc_msgSend(v4, "hasRows");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

- (void)_setUserVersion:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %lld;"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSSQLiteConnection executeStatement:error:](self->_connection, "executeStatement:error:", v4, 0);

}

@end
