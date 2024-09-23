@implementation ASUSQLiteSchema

- (ASUSQLiteSchema)initWithConnection:(id)a3
{
  id v5;
  ASUSQLiteSchema *v6;
  ASUSQLiteSchema *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASUSQLiteSchema;
  v6 = -[ASUSQLiteSchema init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (BOOL)column:(id)a3 existsInTable:(id)a4
{
  id v6;
  id v7;
  ASUSQLiteConnection *connection;
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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA table_info(%@);"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__ASUSQLiteSchema_column_existsInTable___block_invoke;
  v12[3] = &unk_2507A9090;
  v14 = &v15;
  v10 = v6;
  v13 = v10;
  -[ASUSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v9, v12);

  LOBYTE(connection) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)connection;
}

void __40__ASUSQLiteSchema_column_existsInTable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6[2];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__ASUSQLiteSchema_column_existsInTable___block_invoke_2;
  v5[3] = &unk_2507A9068;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  *(_OWORD *)v6 = v4;
  objc_msgSend(a2, "enumerateRowsUsingBlock:", v5);

}

void __40__ASUSQLiteSchema_column_existsInTable___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  id v7;

  objc_msgSend(a2, "stringForColumnName:", CFSTR("name"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  *a4 = v6;

}

- (int64_t)currentUserVersion
{
  ASUSQLiteConnection *connection;
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
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__ASUSQLiteSchema_currentUserVersion__block_invoke;
  v5[3] = &unk_2507A90B8;
  v5[4] = &v6;
  -[ASUSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", CFSTR("PRAGMA user_version;"),
    v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__ASUSQLiteSchema_currentUserVersion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "firstInt64Value");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  ASUSQLiteConnection *connection;
  id v8;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__ASUSQLiteSchema_migrateToVersion_usingBlock___block_invoke;
  v10[3] = &unk_2507A90E0;
  v11 = v6;
  v12 = a3;
  v10[4] = self;
  v8 = v6;
  LOBYTE(self) = -[ASUSQLiteConnection performTransaction:error:](connection, "performTransaction:error:", v10, 0);

  return (char)self;
}

uint64_t __47__ASUSQLiteSchema_migrateToVersion_usingBlock___block_invoke(_QWORD *a1)
{
  ASUSQLiteSchemaMigration *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = -[ASUSQLiteSchemaMigration initWithConnection:]([ASUSQLiteSchemaMigration alloc], "initWithConnection:", *(_QWORD *)(a1[4] + 8));
  ASULogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1[4] + 8), "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "databasePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[6];
    *(_DWORD *)buf = 138543618;
    v15 = v5;
    v16 = 2048;
    v17 = v6;
    _os_log_impl(&dword_236337000, v3, OS_LOG_TYPE_DEFAULT, "Migrating %{public}@ to %llu", buf, 0x16u);

  }
  (*(void (**)(void))(a1[5] + 16))();
  v7 = -[ASUSQLiteSchemaMigration success](v2, "success");
  if (!(_DWORD)v7)
  {
    ASULogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1[4] + 8), "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "databasePath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = a1[6];
      *(_DWORD *)buf = 138543618;
      v15 = v12;
      v16 = 2048;
      v17 = v13;
      _os_log_error_impl(&dword_236337000, v9, OS_LOG_TYPE_ERROR, "Migrating %{public}@ to %llu failed!", buf, 0x16u);

    }
    goto LABEL_8;
  }
  v8 = a1[4];
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA user_version = %lld;"), a1[6]);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v8 + 8), "executeStatement:error:", v9, 0);
LABEL_8:

  }
  return v7;
}

- (BOOL)tableExists:(id)a3
{
  id v4;
  ASUSQLiteConnection *connection;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  connection = self->_connection;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master where name = '%@'"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__ASUSQLiteSchema_tableExists___block_invoke;
  v8[3] = &unk_2507A90B8;
  v8[4] = &v9;
  -[ASUSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", v6, v8);

  LOBYTE(connection) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)connection;
}

uint64_t __31__ASUSQLiteSchema_tableExists___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasRows");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
