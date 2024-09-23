@implementation ASUSQLiteConnection

- (ASUSQLiteConnection)initWithOptions:(id)a3
{
  id v4;
  ASUSQLiteConnection *v5;
  uint64_t v6;
  ASUSQLiteConnectionOptions *options;
  uint64_t v8;
  NSMapTable *preparedStatements;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASUSQLiteConnection;
  v5 = -[ASUSQLiteConnection init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (ASUSQLiteConnectionOptions *)v6;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    preparedStatements = v5->_preparedStatements;
    v5->_preparedStatements = (NSMapTable *)v8;

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_database)
  {
    ASULogHandleForCategory(1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      -[ASUSQLiteConnectionOptions databasePath](self->_options, "databasePath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v7 = v4;
      _os_log_fault_impl(&dword_236337000, v3, OS_LOG_TYPE_FAULT, "Connection taken down HARD, please call close before deallocating: %{public}@", buf, 0xCu);

    }
    sqlite3_close_v2(self->_database);
  }
  v5.receiver = self;
  v5.super_class = (Class)ASUSQLiteConnection;
  -[ASUSQLiteConnection dealloc](&v5, sel_dealloc);
}

- (uint64_t)_close
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  sqlite3_stmt *stmt;
  sqlite3_stmt *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 16))
    {
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(*(id *)(result + 32), "objectEnumerator", 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v11;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v11 != v5)
              objc_enumerationMutation(v2);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6++), "finalizeStatement");
          }
          while (v4 != v6);
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v4);
      }

      objc_msgSend(*(id *)(v1 + 32), "removeAllObjects");
      stmt = sqlite3_next_stmt(*(sqlite3 **)(v1 + 16), 0);
      if (stmt)
      {
        v8 = stmt;
        do
        {
          sqlite3_finalize(v8);
          v8 = sqlite3_next_stmt(*(sqlite3 **)(v1 + 16), v8);
        }
        while (v8);
      }
      if (sqlite3_close(*(sqlite3 **)(v1 + 16)))
      {
        return 0;
      }
      else
      {
        v9 = *(void **)(v1 + 8);
        *(_QWORD *)(v1 + 8) = 0;

        *(_QWORD *)(v1 + 16) = 0;
        *(_QWORD *)(v1 + 40) = 0;
        result = 1;
        *(_BYTE *)(v1 + 48) = 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)dispatchAfterTransaction:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *afterTransactionBlocks;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_transactionDepth)
  {
    if (!self->_afterTransactionBlocks)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      afterTransactionBlocks = self->_afterTransactionBlocks;
      self->_afterTransactionBlocks = v5;

    }
    v7 = (void *)objc_msgSend(v10, "copy");
    v8 = self->_afterTransactionBlocks;
    v9 = (void *)MEMORY[0x23B7F045C]();
    -[NSMutableArray addObject:](v8, "addObject:", v9);

  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }

}

- (void)executePreparedQuery:(id)a3 withResults:(id)a4
{
  id v6;
  void (**v7)(id, id *, id);
  void *v8;
  id v9;
  id *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, id *, id))a4;
  v11 = 0;
  -[ASUSQLiteConnection _verifiedStatementForPreparedStatement:error:]((id *)&self->super.isa, v6, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v8)
    v10 = -[ASUSQLiteQueryResults initWithStatement:]((id *)[ASUSQLiteQueryResults alloc], v8);
  else
    v10 = 0;
  v7[2](v7, v10, v9);
  objc_msgSend(v8, "clearBindings");
  objc_msgSend(v8, "reset");

}

- (id)_verifiedStatementForPreparedStatement:(_QWORD *)a3 error:
{
  id **v5;
  id **v6;
  id *v7;
  id v8;
  id **v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id *v15;
  id *v16;
  uint64_t v17;
  id v18;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (v5)
      v7 = v5[1];
    else
      v7 = 0;
    if (v7 == a1)
    {
      if (-[ASUSQLiteConnection _open]((uint64_t)a1))
      {
        v9 = v6;
        objc_msgSend(a1[4], "objectForKey:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = 0;
          v13 = 0;
        }
        else
        {
          if (v6)
            v15 = v9[2];
          else
            v15 = 0;
          v16 = v15;
          v18 = 0;
          -[ASUSQLiteConnection _prepareStatement:error:]((uint64_t)a1, v16, &v18);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v18;

          if (v11)
          {
            objc_msgSend(a1[4], "setObject:forKey:", v11, v9);
            v12 = 0;
          }
          else
          {
            v12 = objc_retainAutorelease(v13);
            v13 = v12;
          }
        }

        v8 = v12;
        if (v11)
        {
          if (objc_msgSend(a1[7], "isReadOnly") && (objc_msgSend(v11, "isReadOnly") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASUSQLiteErrorDomain"), 2, 0);
            v17 = objc_claimAutoreleasedReturnValue();

            a1 = 0;
            v8 = (id)v17;
          }
          else
          {
            a1 = v11;
          }
        }
        else
        {
          a1 = 0;
        }

        if (!a3)
          goto LABEL_13;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASUSQLiteErrorDomain"), 1, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Statement from a different connection"));
      v8 = 0;
    }
    a1 = 0;
    if (!a3)
    {
LABEL_13:

      goto LABEL_14;
    }
LABEL_11:
    if (!a1)
      *a3 = objc_retainAutorelease(v8);
    goto LABEL_13;
  }
LABEL_14:

  return a1;
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4
{
  return -[ASUSQLiteConnection executePreparedStatement:error:bindings:](self, "executePreparedStatement:error:bindings:", a3, a4, 0);
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  id v10;
  char v11;
  id v12;
  id v14;
  id v15;

  v8 = (void (**)(id, void *))a5;
  v15 = 0;
  -[ASUSQLiteConnection _verifiedStatementForPreparedStatement:error:]((id *)&self->super.isa, a3, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    if (v8)
      v8[2](v8, v9);
    v14 = v10;
    v11 = -[ASUSQLiteConnection _executeStatement:error:]((uint64_t)self, v9, &v14);
    v12 = v14;

    if (v8)
      objc_msgSend(v9, "clearBindings");
    v10 = v12;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v9, "reset");
  if (a4 && (v11 & 1) == 0)
    *a4 = objc_retainAutorelease(v10);

  return v11;
}

- (uint64_t)_executeStatement:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__ASUSQLiteConnection__executeStatement_error___block_invoke;
    v10[3] = &unk_2507A9920;
    v7 = v5;
    v11 = v7;
    v8 = -[ASUSQLiteConnection _executeWithError:usingBlock:](a1, a3, v10);
    if ((_DWORD)v8)
      objc_msgSend(v7, "reset");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)executeQuery:(id)a3 withResults:(id)a4
{
  id v6;
  void (**v7)(id, id *, id);
  void *v8;
  id v9;
  _QWORD *v10;
  id *v11;
  id v12[5];

  v12[4] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id *, id))a4;
  v12[0] = 0;
  -[ASUSQLiteConnection _verifiedStatementForSQL:error:]((id *)&self->super.isa, v6, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12[0];
  v10 = -[ASUSQLitePreparedStatement initWithConnection:SQL:]([ASUSQLitePreparedStatement alloc], (uint64_t)self->_database, v6);
  if (v10)
    -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v8, v10);
  if (v8)
    v11 = -[ASUSQLiteQueryResults initWithStatement:]((id *)[ASUSQLiteQueryResults alloc], v8);
  else
    v11 = 0;
  v7[2](v7, v11, v9);
  objc_msgSend(v8, "finalizeStatement");
  if (v10)
    -[NSMapTable removeObjectForKey:](self->_preparedStatements, "removeObjectForKey:", v10);

}

- (id)_verifiedStatementForSQL:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v10;

  v5 = a2;
  if (a1)
  {
    if (-[ASUSQLiteConnection _open]((uint64_t)a1))
    {
      v10 = 0;
      -[ASUSQLiteConnection _prepareStatement:error:]((uint64_t)a1, v5, &v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      if (v6)
      {
        if (objc_msgSend(a1[7], "isReadOnly") && (objc_msgSend(v6, "isReadOnly") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASUSQLiteErrorDomain"), 2, 0);
          v8 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "finalizeStatement");
          a1 = 0;
          v7 = (id)v8;
        }
        else
        {
          a1 = v6;
        }
      }
      else
      {
        a1 = 0;
      }

      if (!a3)
        goto LABEL_14;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASUSQLiteErrorDomain"), 1, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      a1 = 0;
      if (!a3)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    if (!a1)
      *a3 = objc_retainAutorelease(v7);
    goto LABEL_14;
  }
LABEL_15:

  return a1;
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return -[ASUSQLiteConnection executeStatement:error:bindings:](self, "executeStatement:error:bindings:", a3, a4, 0);
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  void *v10;
  id v11;
  _QWORD *v12;
  char v13;
  id v14;
  id v16;
  id v17;

  v8 = (void (**)(id, void *))a5;
  v17 = 0;
  v9 = a3;
  -[ASUSQLiteConnection _verifiedStatementForSQL:error:]((id *)&self->super.isa, v9, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  v12 = -[ASUSQLitePreparedStatement initWithConnection:SQL:]([ASUSQLitePreparedStatement alloc], (uint64_t)self->_database, v9);

  if (v12)
    -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v10, v12);
  if (!v10)
  {
    v13 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  if (v8)
    v8[2](v8, v10);
  v16 = v11;
  v13 = -[ASUSQLiteConnection _executeStatement:error:]((uint64_t)self, v10, &v16);
  v14 = v16;

  objc_msgSend(v10, "finalizeStatement");
  if (v12)
    -[NSMapTable removeObjectForKey:](self->_preparedStatements, "removeObjectForKey:", v12);
  v11 = v14;
  if (a4)
  {
LABEL_11:
    if ((v13 & 1) == 0)
      *a4 = objc_retainAutorelease(v11);
  }
LABEL_13:

  return v13;
}

- (BOOL)finalizePreparedStatement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  id v12;

  v6 = a3;
  v12 = 0;
  -[ASUSQLiteConnection _verifiedStatementForPreparedStatement:error:]((id *)&self->super.isa, v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (!v7)
  {
    v10 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  ASUSQLiteCreateErrorForResultCode(objc_msgSend(v7, "finalizeStatement"));
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = v9 == 0;
  -[NSMapTable removeObjectForKey:](self->_preparedStatements, "removeObjectForKey:", v6);
  v8 = (id)v9;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v8);
LABEL_4:

  return v10;
}

- (int64_t)lastChangeCount
{
  if (-[ASUSQLiteConnection _open]((uint64_t)self))
    return sqlite3_changes(self->_database);
  else
    return 0;
}

- (BOOL)_open
{
  _BOOL8 v2;
  char v3;
  int v4;
  char v6;
  sqlite3 *v7;
  sqlite3 *db;

  if (!a1)
    return 0;
  v2 = 1;
  if (!*(_QWORD *)(a1 + 16))
  {
    db = 0;
    v3 = 1;
    while (1)
    {
      v4 = ASUSQLiteOpenDatabaseAndApplyOptions(&db, *(void **)(a1 + 56));
      v2 = v4 == 0;
      if (!v4)
        break;
      if (v4 <= 0x1Au && ((1 << v4) & 0x4000C02) != 0)
      {
        v6 = v3 & -[ASUSQLiteConnection _resetAfterCorruptionError](a1);
        v3 = 0;
        if ((v6 & 1) != 0)
          continue;
      }
      return v2;
    }
    v7 = db;
    *(_QWORD *)(a1 + 16) = db;
    sqlite3_create_function(v7, "timestamp", 0, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_timeIntervalSinceReferenceDate, 0, 0);
  }
  return v2;
}

- (BOOL)performSavepoint:(id)a3
{
  unsigned int (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;

  v4 = (unsigned int (**)(_QWORD))a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_2507AA228);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("SP_%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SAVEPOINT %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = -[ASUSQLiteConnection executeStatement:error:](self, "executeStatement:error:", v10, 0);

  if (!(_DWORD)v7)
    goto LABEL_5;
  if (!v4[2](v4))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ROLLBACK TRANSACTION TO SAVEPOINT %@"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASUSQLiteConnection executeStatement:error:](self, "executeStatement:error:", v13, 0);

LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RELEASE SAVEPOINT %@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ASUSQLiteConnection executeStatement:error:](self, "executeStatement:error:", v11, 0);

LABEL_6:
  return v12;
}

- (BOOL)performTransaction:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(_QWORD);
  int64_t transactionDepth;
  id v8;
  int v9;
  BOOL v10;
  int64_t v11;
  int v12;
  int64_t v13;
  id *v14;
  NSMutableArray *afterTransactionBlocks;
  void *v16;
  NSMutableArray *v17;
  NSObject *v18;
  id v19;
  char v20;
  id v21;
  id v23[3];
  _QWORD block[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t (**)(_QWORD))a3;
  v23[0] = 0;
  transactionDepth = self->_transactionDepth;
  if (transactionDepth < 1)
  {
    if (!-[ASUSQLiteConnection executeStatement:error:](self, "executeStatement:error:", CFSTR("BEGIN DEFERRED TRANSACTION"), v23))goto LABEL_26;
    self->_transactionDepth = 1;
    self->_transactionWantsRollback = 0;
  }
  else
  {
    self->_transactionDepth = transactionDepth + 1;
    if (self->_transactionWantsRollback)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASUSQLiteErrorDomain"), 6, 0);
        v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
        v10 = 0;
        *a4 = v8;
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  os_variant_has_internal_content();
  v9 = v6[2](v6);
  v10 = v9;
  v11 = self->_transactionDepth;
  v12 = v9 ^ 1;
  if (self->_transactionWantsRollback)
    v12 = 1;
  self->_transactionWantsRollback = v12;
  v13 = v11 - 1;
  self->_transactionDepth = v13;
  if (!v13)
  {
    if (v12)
    {
      if (v23[0])
        v14 = 0;
      else
        v14 = v23;
      -[ASUSQLiteConnection executeStatement:error:](self, "executeStatement:error:", CFSTR("ROLLBACK TRANSACTION"), v14);
    }
    else
    {
      -[ASUSQLiteConnection executeStatement:error:](self, "executeStatement:error:", CFSTR("COMMIT TRANSACTION"), v23);
    }
    afterTransactionBlocks = self->_afterTransactionBlocks;
    if (afterTransactionBlocks)
    {
      v16 = (void *)-[NSMutableArray copy](afterTransactionBlocks, "copy");
      v17 = self->_afterTransactionBlocks;
      self->_afterTransactionBlocks = 0;

      dispatch_get_global_queue(0, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__ASUSQLiteConnection__flushAfterTransactionBlocks__block_invoke;
      block[3] = &unk_2507A9590;
      v25 = v16;
      v19 = v16;
      dispatch_async(v18, block);

    }
  }
  if (a4)
    v20 = v10;
  else
    v20 = 1;
  if ((v20 & 1) == 0)
  {
    if (v23[0])
    {
      v8 = objc_retainAutorelease(v23[0]);
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASUSQLiteErrorDomain"), 0, 0);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v21;

LABEL_26:
    v10 = 0;
  }
LABEL_27:

  return v10;
}

- (id)prepareStatement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _QWORD *v8;
  id v10;

  v6 = a3;
  v10 = 0;
  if (!-[ASUSQLiteConnection _open]((uint64_t)self))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASUSQLiteErrorDomain"), 1, 0);
    v8 = 0;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  -[ASUSQLiteConnection _prepareStatement:error:]((uint64_t)self, v6, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[ASUSQLitePreparedStatement initWithConnection:SQL:]([ASUSQLitePreparedStatement alloc], (uint64_t)self, v6);
    -[NSMapTable setObject:forKey:](self->_preparedStatements, "setObject:forKey:", v7, v8);
  }
  else
  {
    v8 = 0;
  }

  if (a4)
  {
LABEL_8:
    if (!v8)
      *a4 = objc_retainAutorelease(v10);
  }
LABEL_10:

  return v8;
}

- (id)_prepareStatement:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v16 = 0;
    v7 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__ASUSQLiteConnection__prepareStatement_error___block_invoke;
    v10[3] = &unk_2507A9948;
    v10[5] = &v11;
    v10[6] = v7;
    v10[4] = a1;
    -[ASUSQLiteConnection _executeWithError:usingBlock:](a1, a3, v10);
    v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)tableExists:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__ASUSQLiteConnection_tableExists___block_invoke;
  v7[3] = &unk_2507A9298;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ASUSQLiteConnection executeQuery:withResults:](self, "executeQuery:withResults:", CFSTR("SELECT name FROM sqlite_master where name = ?"), v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __35__ASUSQLiteConnection_tableExists___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindString:atPosition:", v3, 1);
  LOBYTE(v3) = objc_msgSend(v4, "hasRows");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

- (uint64_t)_executeWithError:(void *)a3 usingBlock:
{
  uint64_t (**v5)(id, uint8_t *);
  uint64_t v6;
  unsigned __int8 v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id WeakRetained;
  char v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_31;
  }
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = (void *)MEMORY[0x23B7F02C4]();
    buf[0] = 0;
    v9 = v5[2](v5, buf);
    if (v9 <= 0x19u)
    {
      switch((char)v9)
      {
        case 0:
          goto LABEL_13;
        case 5:
        case 6:
          if (v6 < 10)
          {
            usleep(0xF4240u);
            ++v6;
            goto LABEL_9;
          }
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASUSQLiteErrorDomain"), 3, 0);
          v12 = objc_claimAutoreleasedReturnValue();
          break;
        case 10:
          ASUSQLiteCreateErrorForResultCode(v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v8);
          ASULogHandleForCategory(1);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v19 = (void *)objc_opt_class();
            v20 = *(void **)(a1 + 56);
            v21 = v19;
            objc_msgSend(v20, "databasePath");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v32 = v19;
            v33 = 2114;
            v34 = v22;
            _os_log_error_impl(&dword_236337000, v13, OS_LOG_TYPE_ERROR, "[%@]: Reopening database after IO error: %{public}@", buf, 0x16u);

          }
          v14 = *(void **)(a1 + 8);
          v15 = v14;
          v16 = *(_QWORD *)(a1 + 40);
          if (!-[ASUSQLiteConnection _close](a1) || !-[ASUSQLiteConnection _open](a1))
            goto LABEL_22;
          if (!v16)
            goto LABEL_33;
          if (sqlite3_exec(*(sqlite3 **)(a1 + 16), "BEGIN DEFERRED TRANSACTION", 0, 0, 0))
          {
LABEL_22:
            -[ASUSQLiteConnection _resetAfterCorruptionError](a1);
          }
          else
          {
            objc_storeStrong((id *)(a1 + 8), v14);
            *(_QWORD *)(a1 + 40) = v16;
            *(_BYTE *)(a1 + 48) = 1;
LABEL_33:
            WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
            v24 = objc_opt_respondsToSelector();

            if ((v24 & 1) != 0)
            {
              ASULogHandleForCategory(1);
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v27 = (void *)objc_opt_class();
                v28 = *(void **)(a1 + 56);
                v30 = v27;
                objc_msgSend(v28, "databasePath");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v32 = v27;
                v33 = 2114;
                v34 = v29;
                _os_log_error_impl(&dword_236337000, v25, OS_LOG_TYPE_ERROR, "[%@]: Asking delegate to reset database after reopen: %{public}@", buf, 0x16u);

              }
              v26 = objc_loadWeakRetained((id *)(a1 + 24));
              objc_msgSend(v26, "connectionNeedsResetForReopen:", a1);

            }
          }

          goto LABEL_27;
        case 11:
          goto LABEL_14;
        default:
          goto LABEL_24;
      }
      goto LABEL_25;
    }
    if (v9 != 100)
    {
      if (v9 == 26)
      {
LABEL_14:
        ASUSQLiteCreateErrorForResultCode(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v8);
        -[ASUSQLiteConnection _resetAfterCorruptionError](a1);
        goto LABEL_27;
      }
      if (v9 == 101)
      {
LABEL_13:
        v11 = 0;
        v7 = 1;
LABEL_26:
        objc_autoreleasePoolPop(v8);
        goto LABEL_27;
      }
LABEL_24:
      ASUSQLiteCreateErrorForResultCode(v9);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v11 = (void *)v12;
      goto LABEL_26;
    }
    v7 = 1;
LABEL_9:
    v10 = buf[0];
    objc_autoreleasePoolPop(v8);
  }
  while (!v10);
  v11 = 0;
LABEL_27:
  if (a2 && (v7 & 1) == 0)
    *a2 = objc_retainAutorelease(v11);

  v17 = v7;
LABEL_31:

  return v17;
}

uint64_t __47__ASUSQLiteConnection__executeStatement_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "step");
}

- (uint64_t)_resetAfterCorruptionError
{
  id *v2;
  id WeakRetained;
  char v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 24);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    ASULogHandleForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = *(void **)(a1 + 56);
      v13 = v11;
      objc_msgSend(v12, "databasePath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v11;
      v21 = 2114;
      v22 = v14;
      _os_log_error_impl(&dword_236337000, v5, OS_LOG_TYPE_ERROR, "[%@]: Asking delegate to reset database after corruption: %{public}@", (uint8_t *)&v19, 0x16u);

    }
    v6 = objc_loadWeakRetained(v2);
    v7 = objc_msgSend(v6, "connectionNeedsResetForCorruption:", a1);
LABEL_10:
    v8 = v7;

    return v8;
  }
  if ((objc_msgSend(*(id *)(a1 + 56), "isReadOnly") & 1) == 0)
  {
    ASULogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      v16 = *(void **)(a1 + 56);
      v17 = v15;
      objc_msgSend(v16, "databasePath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v15;
      v21 = 2114;
      v22 = v18;
      _os_log_error_impl(&dword_236337000, v9, OS_LOG_TYPE_ERROR, "[%@]: Deleting database after corruption: %{public}@", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 56), "databasePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASUSQLiteConnection _close](a1);
    v7 = ASUSQLiteDeleteDatabase(v6, 0);
    goto LABEL_10;
  }
  return 0;
}

void __51__ASUSQLiteConnection__flushAfterTransactionBlocks__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __47__ASUSQLiteConnection__prepareStatement_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  ASUSQLiteStatement *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), *(const char **)(a1 + 48), -1, &ppStmt, 0);
  if (v2 - 100 < 2 || v2 == 0)
  {
    v4 = [ASUSQLiteStatement alloc];
    v5 = -[ASUSQLiteStatement initWithStatement:onConnection:](v4, "initWithStatement:onConnection:", ppStmt, *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    sqlite3_finalize(ppStmt);
  }
  return v2;
}

- (ASUSQLiteConnectionDelegate)delegate
{
  return (ASUSQLiteConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ASUSQLiteConnectionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_afterTransactionBlocks, 0);
}

@end
