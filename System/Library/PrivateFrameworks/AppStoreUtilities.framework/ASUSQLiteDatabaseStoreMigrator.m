@implementation ASUSQLiteDatabaseStoreMigrator

- (ASUSQLiteDatabaseStoreMigrator)initWithConnection:(id)a3 tableNames:(id)a4
{
  id v7;
  id v8;
  ASUSQLiteDatabaseStoreMigrator *v9;
  ASUSQLiteDatabaseStoreMigrator *v10;
  uint64_t v11;
  NSArray *tableNames;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASUSQLiteDatabaseStoreMigrator;
  v9 = -[ASUSQLiteDatabaseStoreMigrator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = objc_msgSend(v8, "copy");
    tableNames = v10->_tableNames;
    v10->_tableNames = (NSArray *)v11;

    v10->_success = 1;
  }

  return v10;
}

- (ASUSQLiteConnection)connection
{
  return self->_connection;
}

- (void)executeOptionalStatement:(id)a3
{
  -[ASUSQLiteDatabaseStoreMigrator _executeStatement:canFailMigration:bindings:]((uint64_t)self, a3, 0, 0);
}

- (void)_executeStatement:(int)a3 canFailMigration:(void *)a4 bindings:
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  id v12;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24))
    {
      v9 = *(void **)(a1 + 8);
      v12 = 0;
      v10 = objc_msgSend(v9, "executeStatement:error:bindings:", v7, &v12, v8);
      v11 = v12;
      if ((v10 & 1) == 0 && a3)
        *(_BYTE *)(a1 + 24) = 0;
    }
    else
    {
      v11 = 0;
    }

  }
}

- (void)executeOptionalStatement:(id)a3 bindings:(id)a4
{
  -[ASUSQLiteDatabaseStoreMigrator _executeStatement:canFailMigration:bindings:]((uint64_t)self, a3, 0, a4);
}

- (void)executeStatement:(id)a3
{
  -[ASUSQLiteDatabaseStoreMigrator _executeStatement:canFailMigration:bindings:]((uint64_t)self, a3, 1, 0);
}

- (void)executeStatement:(id)a3 bindings:(id)a4
{
  -[ASUSQLiteDatabaseStoreMigrator _executeStatement:canFailMigration:bindings:]((uint64_t)self, a3, 1, a4);
}

- (void)executeOptionalQuery:(id)a3 withResults:(id)a4
{
  -[ASUSQLiteDatabaseStoreMigrator _executeQuery:canFailMigration:withResults:]((uint64_t)self, a3, 0, a4);
}

- (void)_executeQuery:(char)a3 canFailMigration:(void *)a4 withResults:
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  char v13;

  v10 = a2;
  v7 = a4;
  v8 = v7;
  if (a1 && *(_BYTE *)(a1 + 24))
  {
    v9 = *(void **)(a1 + 8);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __77__ASUSQLiteDatabaseStoreMigrator__executeQuery_canFailMigration_withResults___block_invoke;
    v11[3] = &unk_2507A9658;
    v13 = a3;
    v11[4] = a1;
    v12 = v7;
    objc_msgSend(v9, "executeQuery:withResults:", v10, v11);

  }
}

- (void)executeQuery:(id)a3 withResults:(id)a4
{
  -[ASUSQLiteDatabaseStoreMigrator _executeQuery:canFailMigration:withResults:]((uint64_t)self, a3, 1, a4);
}

uint64_t __77__ASUSQLiteDatabaseStoreMigrator__executeQuery_canFailMigration_withResults___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 && *(_BYTE *)(a1 + 48))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
