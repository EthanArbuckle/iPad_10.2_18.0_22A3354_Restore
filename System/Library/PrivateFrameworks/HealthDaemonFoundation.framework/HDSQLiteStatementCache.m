@implementation HDSQLiteStatementCache

- (HDSQLiteStatementCache)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDSQLiteStatementCache)initWithDatabase:(sqlite3 *)a3
{
  HDSQLiteStatementCache *v4;
  HDSQLiteStatementCache *v5;
  _HDSQLiteStatementCacheStorage *v6;
  _HDSQLiteStatementCacheStorage *defaultStatementStorage;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDSQLiteStatementCache;
  v4 = -[HDSQLiteStatementCache init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_db = a3;
    v6 = objc_alloc_init(_HDSQLiteStatementCacheStorage);
    defaultStatementStorage = v5->_defaultStatementStorage;
    v5->_defaultStatementStorage = v6;

    v5->_activeStatements = CFSetCreateMutable(0, 0, 0);
    v5->_uncachedActiveStatements = CFSetCreateMutable(0, 0, 0);
  }
  return v5;
}

- (void)dealloc
{
  __CFSet *uncachedActiveStatements;
  __CFSet *activeStatements;
  objc_super v5;

  -[HDSQLiteStatementCache _assertNoActiveStatements]((uint64_t)self);
  -[HDSQLiteStatementCache clearCachedStatements](self, "clearCachedStatements");
  uncachedActiveStatements = self->_uncachedActiveStatements;
  if (uncachedActiveStatements)
  {
    CFRelease(uncachedActiveStatements);
    self->_uncachedActiveStatements = 0;
  }
  activeStatements = self->_activeStatements;
  if (activeStatements)
  {
    CFRelease(activeStatements);
    self->_activeStatements = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)HDSQLiteStatementCache;
  -[HDSQLiteStatementCache dealloc](&v5, sel_dealloc);
}

- (void)_assertNoActiveStatements
{
  void *v2;
  id v3;

  if (a1)
  {
    CFSetApplyFunction(*(CFSetRef *)(a1 + 32), (CFSetApplierFunction)logActiveStatement, 0);
    if (CFSetGetCount(*(CFSetRef *)(a1 + 32)))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", sel__assertNoActiveStatements, a1, CFSTR("HDSQLiteStatementCache.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("CFSetGetCount(_activeStatements) == 0"));

    }
    if (CFSetGetCount(*(CFSetRef *)(a1 + 40)))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", sel__assertNoActiveStatements, a1, CFSTR("HDSQLiteStatementCache.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("CFSetGetCount(_uncachedActiveStatements) == 0"));

    }
  }
}

- (int64_t)count
{
  _HDSQLiteStatementCacheStorage *defaultStatementStorage;
  uint64_t v4;
  uint64_t v5;
  _HDSQLiteStatementCacheStorage *transactionStatementStorage;
  uint64_t v7;
  uint64_t v8;

  defaultStatementStorage = self->_defaultStatementStorage;
  if (defaultStatementStorage)
  {
    v4 = -[__CFDictionary count](defaultStatementStorage->_statementsBySQL, "count");
    v5 = -[__CFDictionary count](defaultStatementStorage->_statementsByKey, "count") + v4;
  }
  else
  {
    v5 = 0;
  }
  transactionStatementStorage = self->_transactionStatementStorage;
  if (transactionStatementStorage)
  {
    v7 = -[__CFDictionary count](transactionStatementStorage->_statementsBySQL, "count");
    v8 = -[__CFDictionary count](transactionStatementStorage->_statementsByKey, "count") + v7;
  }
  else
  {
    v8 = 0;
  }
  return v8 + v5;
}

- (NSSet)allStatmentSQLStrings
{
  id v3;
  void *v4;
  _HDSQLiteStatementCacheStorage *transactionStatementStorage;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[_HDSQLiteStatementCacheStorage allStatementSQLStrings](&self->_defaultStatementStorage->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  transactionStatementStorage = self->_transactionStatementStorage;
  if (transactionStatementStorage)
  {
    -[_HDSQLiteStatementCacheStorage allStatementSQLStrings](&transactionStatementStorage->super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v7;
}

- (void)beginTransaction
{
  void *v4;

  if (self->_inTransaction)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteStatementCache.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_inTransaction == NO"));

  }
  self->_inTransaction = 1;
}

- (void)endTransaction
{
  _HDSQLiteStatementCacheStorage *transactionStatementStorage;
  void *v5;

  if (!self->_inTransaction)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteStatementCache.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_inTransaction"));

  }
  -[HDSQLiteStatementCache _assertNoActiveStatements]((uint64_t)self);
  self->_inTransaction = 0;
  transactionStatementStorage = self->_transactionStatementStorage;
  self->_transactionStatementStorage = 0;

}

- (sqlite3_stmt)checkOutStatementForSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  sqlite3_stmt *v9;
  sqlite3_stmt *v10;
  _BOOL4 v11;
  BOOL v13;

  v6 = a4;
  v8 = a3;
  v13 = 0;
  v9 = (sqlite3_stmt *)-[HDSQLiteStatementCache _cachedStatementForSQL:active:]((uint64_t)self, v8, &v13);
  if (v13)
    v6 = 0;
  if (!v9 || (v10 = v9, v13))
  {
    v10 = -[HDSQLiteStatementCache _prepareStatementForSQL:error:]((uint64_t)self, v8, a5);
    if (v10)
      v11 = v6;
    else
      v11 = 0;
    if (v11)
      -[HDSQLiteStatementCache _setCachedStatement:forSQL:]((char *)self, v10, v8);
  }
  -[HDSQLiteStatementCache _activateStatement:cached:]((uint64_t)self, v10, v6);

  return v10;
}

- (const)_cachedStatementForSQL:(BOOL *)a3 active:
{
  id v5;
  void *v6;
  const void *v7;

  v5 = a2;
  if (a1)
  {
    -[HDSQLiteStatementCache _statementStorage]((char *)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_HDSQLiteStatementCacheStorage statementForSQL:]((uint64_t)v6, v5);

    if (a3)
      *a3 = CFSetContainsValue(*(CFSetRef *)(a1 + 32), v7) != 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (sqlite3_stmt)_prepareStatementForSQL:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  unint64_t v7;
  sqlite3 *v8;
  id v9;
  int v10;
  int v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  sqlite3_stmt *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const __CFString **v37;
  uint64_t *v38;
  void *v39;
  id v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char *pzTail;
  sqlite3_stmt *ppStmt;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    ppStmt = 0;
    v6 = (void *)MEMORY[0x212BD35D0]();
    v7 = objc_msgSend(v5, "length");
    if (v7 >= 0x7FFFFFFF)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[HDSQLiteStatementCache _prepareStatementForSQL:error:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel__prepareStatementForSQL_error_);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("HDSQLiteStatementCache.m"), 170, CFSTR("NSString passed to %@ (%lu bytes) is larger than maximum allowed SQLite statement string (%lu bytes)"), v44, v7, 0x7FFFFFFFLL);

    }
    while (1)
    {
      pzTail = 0;
      v8 = *(sqlite3 **)(a1 + 8);
      v9 = objc_retainAutorelease(v5);
      v10 = sqlite3_prepare_v2(v8, (const char *)objc_msgSend(v9, "UTF8String"), v7, &ppStmt, (const char **)&pzTail);
      if (!v10)
        break;
      v11 = v10;
      if ((v10 - 5) >= 2)
      {
        ++*(_QWORD *)(a1 + 56);
        v12 = sqlite3_errmsg(*(sqlite3 **)(a1 + 8));
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: [%d, %s]"), v9, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 8)), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        HDSQLiteErrorFromDatabase(*(sqlite3 **)(a1 + 8), 0, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        HDSQLiteDatabaseErrorFromSQLiteError(v14);
        v15 = objc_claimAutoreleasedReturnValue();

        if (v11 == 1)
        {
          _HKInitializeLogging();
          v17 = *MEMORY[0x24BDD2FD8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_FAULT))
            -[HDSQLiteStatementCache _prepareStatementForSQL:error:].cold.3((uint64_t)v13, v17, v18, v19, v20, v21, v22, v23);
        }
        else if (v11 == 9)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hk_transactionInterruptedError");
          v16 = objc_claimAutoreleasedReturnValue();

          v15 = v16;
        }
        else
        {
          _HKInitializeLogging();
          v24 = *MEMORY[0x24BDD2FD8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
            -[HDSQLiteStatementCache _prepareStatementForSQL:error:].cold.2((uint64_t)v13, v24);
        }
        ppStmt = 0;

        goto LABEL_18;
      }
    }
    if (pzTail && *pzTail)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__prepareStatementForSQL_error_, a1, CFSTR("HDSQLiteStatementCache.m"), 180, CFSTR("SQL strings must contain only a single statement; remaining statements will not be executed: %s"),
        pzTail);

    }
    v15 = 0;
    ++*(_QWORD *)(a1 + 56);
LABEL_18:
    objc_autoreleasePoolPop(v6);
    v25 = ppStmt;
    if (!((unint64_t)ppStmt | v15))
    {
      objc_msgSend(v9, "hk_trimWhitespaceAndNewlines");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");

      if (v27)
      {
        _HKInitializeLogging();
        v28 = *MEMORY[0x24BDD2FD8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_FAULT))
          -[HDSQLiteStatementCache _prepareStatementForSQL:error:].cold.1((uint64_t)v9, v28, v29, v30, v31, v32, v33, v34);
        v35 = (void *)MEMORY[0x24BDD1540];
        v48 = *MEMORY[0x24BDD0FC8];
        v49 = CFSTR("Unknown error during sqlite3_prepare_v2");
        v36 = (void *)MEMORY[0x24BDBCE70];
        v37 = &v49;
        v38 = &v48;
      }
      else
      {
        v35 = (void *)MEMORY[0x24BDD1540];
        v50 = *MEMORY[0x24BDD0FC8];
        v51[0] = CFSTR("SQL string is empty");
        v36 = (void *)MEMORY[0x24BDBCE70];
        v37 = (const __CFString **)v51;
        v38 = &v50;
      }
      objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthd.SQLite"), 5, v39);
      v15 = objc_claimAutoreleasedReturnValue();

      v25 = ppStmt;
    }
    if (!v25)
    {
      v40 = (id)v15;
      if (v40)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v40);
        else
          _HKLogDroppedError();
      }

      v25 = ppStmt;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)_setCachedStatement:(void *)a3 forSQL:
{
  uint64_t v5;
  void *v6;
  id key;

  key = a3;
  if (a1)
  {
    -[HDSQLiteStatementCache _statementStorage](a1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v5 + 16), key, a2);

  }
}

- (void)_activateStatement:(char)a3 cached:
{
  if (a1 && value)
  {
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), value);
    if ((a3 & 1) == 0)
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), value);
  }
}

- (sqlite3_stmt)checkOutCachedStatementForKey:(const char *)a3 SQLGenerator:(id)a4 error:(id *)a5
{
  void (**v8)(_QWORD);
  sqlite3_stmt *v9;
  _BOOL4 v10;
  sqlite3_stmt *v11;
  void *v12;
  BOOL v14;

  v8 = (void (**)(_QWORD))a4;
  v14 = 0;
  v9 = (sqlite3_stmt *)-[HDSQLiteStatementCache _cachedStatementForKey:active:]((uint64_t)self, a3, &v14);
  if (!v9 || (v10 = v14))
  {
    v8[2](v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HDSQLiteStatementCache _prepareStatementForSQL:error:]((uint64_t)self, v12, a5);

    v10 = v14;
    if (v11)
    {
      if (v14)
      {
        v10 = 1;
      }
      else
      {
        -[HDSQLiteStatementCache _setCachedStatement:forKey:]((char *)self, v11, a3);
        v10 = v14;
      }
    }
  }
  else
  {
    v11 = v9;
  }
  -[HDSQLiteStatementCache _activateStatement:cached:]((uint64_t)self, v11, !v10);

  return v11;
}

- (const)_cachedStatementForKey:(BOOL *)a3 active:
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const void *Value;
  const void *v10;

  if (!a1)
    return 0;
  -[HDSQLiteStatementCache _statementStorage]((char *)a1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v8 = v6;
    while (1)
    {
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v8 + 24), a2);
      if (Value)
        break;
      v8 = *(_QWORD *)(v8 + 8);
      if (!v8)
        goto LABEL_6;
    }
    v10 = Value;
  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  if (a3)
    *a3 = CFSetContainsValue(*(CFSetRef *)(a1 + 32), v10) != 0;
  return v10;
}

- (void)_setCachedStatement:(const void *)a3 forKey:
{
  CFMutableDictionaryRef *v5;
  CFMutableDictionaryRef *v6;

  if (a1)
  {
    -[HDSQLiteStatementCache _statementStorage](a1);
    v5 = (CFMutableDictionaryRef *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      CFDictionarySetValue(v5[3], a3, a2);
      v5 = v6;
    }

  }
}

- (void)checkInStatement:(sqlite3_stmt *)a3
{
  void *v6;

  if (!CFSetContainsValue(self->_activeStatements, a3))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteStatementCache.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("CFSetContainsValue(_activeStatements, stmt)"));

  }
  CFSetRemoveValue(self->_activeStatements, a3);
  if (CFSetContainsValue(self->_uncachedActiveStatements, a3))
  {
    CFSetRemoveValue(self->_uncachedActiveStatements, a3);
    sqlite3_finalize(a3);
  }
  else
  {
    sqlite3_clear_bindings(a3);
    sqlite3_reset(a3);
  }
}

- (void)clearCachedStatements
{
  _HDSQLiteStatementCacheStorage *transactionStatementStorage;

  -[HDSQLiteStatementCache _assertNoActiveStatements]((uint64_t)self);
  transactionStatementStorage = self->_transactionStatementStorage;
  self->_transactionStatementStorage = 0;

  -[_HDSQLiteStatementCacheStorage clearStatements]((uint64_t)self->_defaultStatementStorage);
}

- (char)_statementStorage
{
  char *v1;
  void *v2;
  void **v3;
  _QWORD *v4;
  void *v5;

  if (a1)
  {
    v1 = a1;
    if (a1[48])
    {
      v3 = (void **)(a1 + 24);
      v2 = (void *)*((_QWORD *)a1 + 3);
      if (v2)
      {
LABEL_7:
        a1 = v2;
        return a1;
      }
      v4 = -[_HDSQLiteStatementCacheStorage initWithParentStorage:]([_HDSQLiteStatementCacheStorage alloc], *((void **)a1 + 2));
      v5 = (void *)*((_QWORD *)v1 + 3);
      *((_QWORD *)v1 + 3) = v4;

    }
    else
    {
      v3 = (void **)(a1 + 16);
    }
    v2 = *v3;
    goto LABEL_7;
  }
  return a1;
}

- (int64_t)faultCount
{
  return self->_faultCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionStatementStorage, 0);
  objc_storeStrong((id *)&self->_defaultStatementStorage, 0);
}

- (void)_prepareStatementForSQL:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_210F9A000, a2, a3, "Attempted to prepare SQL statement %{public}@, but could not and no error code was set", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_prepareStatementForSQL:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_210F9A000, a2, OS_LOG_TYPE_ERROR, "Could not prepare statement: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_prepareStatementForSQL:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_210F9A000, a2, a3, "Could not prepare statement: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
