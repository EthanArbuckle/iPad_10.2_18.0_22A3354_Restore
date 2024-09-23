@implementation HDSQLiteQuery

- (HDSQLiteQuery)initWithDatabase:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  HDSQLiteQuery *v9;
  HDSQLiteQuery *v10;
  uint64_t v11;
  HDSQLiteQueryDescriptor *descriptor;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDSQLiteQuery;
  v9 = -[HDSQLiteQuery init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    v11 = objc_msgSend(v8, "copy");
    descriptor = v10->_descriptor;
    v10->_descriptor = (HDSQLiteQueryDescriptor *)v11;

  }
  return v10;
}

- (HDSQLiteQueryDescriptor)queryDescriptor
{
  return self->_descriptor;
}

- (BOOL)deleteAllEntitiesWithError:(id *)a3
{
  HDSQLiteDatabase *database;
  _QWORD v5[5];

  database = self->_database;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__HDSQLiteQuery_deleteAllEntitiesWithError___block_invoke;
  v5[3] = &unk_24CB18D20;
  v5[4] = self;
  return -[HDSQLiteDatabase performTransactionWithType:error:usingBlock:](database, "performTransactionWithType:error:usingBlock:", 1, a3, v5);
}

uint64_t __44__HDSQLiteQuery_deleteAllEntitiesWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_SQLForDeleteWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "shouldExpandLastSQLStatement");
    if ((v7 & 1) != 0)
      v8 = 0;
    else
      v8 = (void *)objc_msgSend(v6, "copy");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v8);
    if ((v7 & 1) == 0)

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __44__HDSQLiteQuery_deleteAllEntitiesWithError___block_invoke_2;
    v11[3] = &unk_24CB189D8;
    v11[4] = *(_QWORD *)(a1 + 32);
    v9 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", v6, a3, v11, 0);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __44__HDSQLiteQuery_deleteAllEntitiesWithError___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;

  v4 = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "bindToDeleteStatement:bindingIndex:", a2, &v4);
  -[HDSQLiteQuery _expandLastSQLStatementIfNecessary:](*(_QWORD *)(a1 + 32), a2);
}

- (void)_expandLastSQLStatementIfNecessary:(uint64_t)a1
{
  char *v4;
  char *v5;
  uint64_t v6;
  void *v7;

  if (a1 && objc_msgSend(*(id *)(a1 + 16), "shouldExpandLastSQLStatement"))
  {
    v4 = sqlite3_expanded_sql(a2);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v6;

      sqlite3_free(v5);
    }
  }
}

- (BOOL)enumeratePersistentIDsAndProperties:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  _QWORD v19[5];
  id v20;
  id v21;
  SEL v22;

  v9 = a3;
  v10 = a5;
  if (v9)
    v11 = (id)objc_msgSend(v9, "mutableCopy");
  else
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = v11;
  objc_msgSend(v11, "insertObject:atIndex:", CFSTR("ROWID"), 0);
  v13 = (void *)MEMORY[0x24BDBD1A8];
  if (v9)
    v13 = v9;
  v14 = v13;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __78__HDSQLiteQuery_enumeratePersistentIDsAndProperties_error_enumerationHandler___block_invoke;
  v19[3] = &unk_24CB18E90;
  v22 = a2;
  v19[4] = self;
  v15 = v10;
  v20 = v14;
  v21 = v15;
  v16 = v14;
  v17 = -[HDSQLiteQuery enumerateProperties:error:enumerationHandler:](self, "enumerateProperties:error:enumerationHandler:", v12, a4, v19);

  return v17;
}

uint64_t __78__HDSQLiteQuery_enumeratePersistentIDsAndProperties_error_enumerationHandler___block_invoke(_QWORD *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  void *v6;

  if ((*(uint64_t (**)(_DWORD *, _QWORD))(*(_QWORD *)a3 + 16))(a3, 0) <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("HDSQLiteQuery.mm"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pID > 0"));

  }
  a3[4] = 1;
  result = (*(uint64_t (**)(void))(a1[6] + 16))();
  a3[4] = 0;
  return result;
}

- (BOOL)enumerateProperties:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NSString *lastSQLStatement;
  NSString *v13;
  HDSQLiteDatabase *database;
  id v15;
  id v16;
  BOOL v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  _QWORD v25[3];
  char v26;

  v9 = a3;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v9, "count") >= 0x7FFFFFFF)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteQuery.mm"), 94, CFSTR("Insane number of properties for enumeration (%lu)"), objc_msgSend(v9, "count"));

  }
  -[HDSQLiteQueryDescriptor selectSQLForProperties:](self->_descriptor, "selectSQLForProperties:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HDSQLiteQueryDescriptor shouldExpandLastSQLStatement](self->_descriptor, "shouldExpandLastSQLStatement"))
  {
    lastSQLStatement = self->_lastSQLStatement;
    self->_lastSQLStatement = 0;
  }
  else
  {
    v13 = (NSString *)objc_msgSend(v11, "copy");
    lastSQLStatement = self->_lastSQLStatement;
    self->_lastSQLStatement = v13;
  }

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  database = self->_database;
  v23 = v25;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __62__HDSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke;
  v24[3] = &unk_24CB189D8;
  v24[4] = self;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __62__HDSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke_2;
  v20[3] = &unk_24CB18EB8;
  v15 = v9;
  v21 = v15;
  v16 = v10;
  v22 = v16;
  v17 = -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](database, "executeSQL:error:bindingHandler:enumerationHandler:", v11, a4, v24, v20);

  _Block_object_dispose(v25, 8);
  return v17;
}

void __62__HDSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;

  v4 = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "bindToSelectStatement:bindingIndex:", a2, &v4);
  -[HDSQLiteQuery _expandLastSQLStatementIfNecessary:](*(_QWORD *)(a1 + 32), a2);
}

uint64_t __62__HDSQLiteQuery_enumerateProperties_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    HDSQLiteRow::setColumnNames(a2, *(void **)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (HDSQLiteDatabase)database
{
  return (HDSQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)lastSQLStatement
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSQLStatement, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
