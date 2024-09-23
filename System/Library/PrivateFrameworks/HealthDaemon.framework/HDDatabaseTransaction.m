@implementation HDDatabaseTransaction

- (HDOntologyDatabase)ontologyDatabase
{
  void *v2;
  void *v3;

  -[HDDatabaseTransaction protectedResources](self, "protectedResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("OntologyDatabase"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDOntologyDatabase *)v3;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_isActive)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseTransaction.m"), 45, CFSTR("HDDatabaseTransaction dealloc'd while active."));

  }
  v5.receiver = self;
  v5.super_class = (Class)HDDatabaseTransaction;
  -[HDDatabaseTransaction dealloc](&v5, sel_dealloc);
}

- (HDDatabase)database
{
  return (HDDatabase *)objc_loadWeakRetained((id *)&self->_database);
}

- (int64_t)cacheScope
{
  return -[HDDatabaseTransactionContext cacheScope](self->_rootContext, "cacheScope");
}

- (HDDatabaseTransaction)initWithDatabase:(id)a3 provider:(id)a4 rootContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDDatabaseTransaction *v12;
  HDDatabaseTransaction *v13;
  uint64_t v14;
  HDDatabaseTransactionContext *rootContext;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseTransaction.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootContext != nil"));

  }
  v18.receiver = self;
  v18.super_class = (Class)HDDatabaseTransaction;
  v12 = -[HDDatabaseTransaction init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_database, v9);
    objc_storeWeak((id *)&v13->_databaseProvider, v10);
    v14 = objc_msgSend(v11, "copy");
    rootContext = v13->_rootContext;
    v13->_rootContext = (HDDatabaseTransactionContext *)v14;

  }
  return v13;
}

- (BOOL)isWriteTransaction
{
  return -[HDDatabaseTransactionContext requiresWrite](self->_rootContext, "requiresWrite");
}

- (id)databaseForEntityProtectionClass:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
  {
    v3 = 56;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v3 = 64;
LABEL_5:
    a2 = (SEL)*(id *)((char *)&self->super.isa + v3);
  }
  return (id)(id)a2;
}

- (id)databaseForEntity:(id)a3
{
  return -[HDDatabaseTransaction databaseForEntityProtectionClass:](self, "databaseForEntityProtectionClass:", objc_msgSend((id)objc_opt_class(), "protectionClass"));
}

- (id)databaseForEntityClass:(Class)a3
{
  return -[HDDatabaseTransaction databaseForEntityProtectionClass:](self, "databaseForEntityProtectionClass:", -[objc_class protectionClass](a3, "protectionClass"));
}

- (uint64_t)_resolveCacheScope:(uint64_t)result
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  if (result)
  {
    if (a2 == 2)
    {
      return 0;
    }
    else if (a2)
    {
      return 1;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(result + 8));
      objc_msgSend(WeakRetained, "configuration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "behavior");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "features");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "databaseStateCacheTransactionScoped");

      return v6;
    }
  }
  return result;
}

- (BOOL)performWithContext:(id)a3 error:(id *)a4 block:(id)a5 inaccessibilityHandler:(id)a6
{
  id v11;
  NSDictionary *v12;
  int v13;
  unsigned int v14;
  int v15;
  NSObject *v16;
  char v17;
  unsigned int v19;
  double Current;
  HDSQLiteDatabase *unprotectedDatabase;
  id v22;
  HDSQLiteDatabase *v23;
  id v24;
  HDSQLiteDatabase *v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  id v31;
  id v32;
  void *v33;
  char v34;
  void *v35;
  id v36;
  id v37;
  id WeakRetained;
  HDSQLiteDatabase *v39;
  id v40;
  HDSQLiteDatabase *protectedDatabase;
  id v42;
  NSDictionary *v43;
  id v44;
  NSDictionary *protectedResources;
  char v46;
  id v47;
  HDSQLiteDatabase *v48;
  NSDictionary *v49;
  void *v50;
  id v51;
  HDSQLiteDatabase *v52;
  id v53;
  HDSQLiteDatabase *v54;
  id v55;
  void *v56;
  NSObject *v57;
  void *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  const char *label;
  int v63;
  int v64;
  _BOOL4 isActive;
  int v66;
  void *v67;
  id v68;
  _QWORD v69[5];
  id v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  id v75;
  id v76;
  _QWORD aBlock[4];
  NSDictionary *v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  int v84;
  __int16 v85;
  int v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  const char *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v68 = a5;
  v12 = (NSDictionary *)a6;
  v13 = objc_msgSend(v11, "requiresProtectedData");
  v67 = v11;
  v14 = objc_msgSend(v11, "requiresWrite");
  if (self->_performingMigration)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 107, CFSTR("Cannot peform a database transaction inside a database migration transaction"));
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  if (self->_isOutermostTransactionUnprotected)
    v15 = v13;
  else
    v15 = 0;
  if (v15 == 1)
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B7802000, v16, OS_LOG_TYPE_FAULT, "Cannot promote an unprotected transaction to a protected transaction", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 107, CFSTR("Cannot promote an unprotected transaction to a protected transaction"));
    goto LABEL_10;
  }
  v19 = v14;
  Current = 0.0;
  isActive = self->_isActive;
  if (!self->_isActive)
  {
    self->_isActive = 1;
    self->_isOutermostTransactionUnprotected = v13 ^ 1;
    Current = CFAbsoluteTimeGetCurrent();
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke;
  aBlock[3] = &unk_1E6CEEAB8;
  v78 = v12;
  v12 = (NSDictionary *)_Block_copy(aBlock);
  if (!v13 || self->_protectedDatabase)
  {
    v63 = 0;
    goto LABEL_17;
  }
  if (self->_unprotectedDatabase)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseTransaction.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_unprotectedDatabase == nil"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_databaseProvider);
  v76 = 0;
  objc_msgSend(WeakRetained, "checkOutProtectedDatabase:error:", self, &v76);
  v39 = (HDSQLiteDatabase *)objc_claimAutoreleasedReturnValue();
  v40 = v76;
  protectedDatabase = self->_protectedDatabase;
  self->_protectedDatabase = v39;

  if (!self->_protectedDatabase)
  {
    v46 = ((uint64_t (*)(NSDictionary *, id, id *))v12[2].super.isa)(v12, v40, a4);
LABEL_51:
    v17 = v46;

    v49 = v78;
LABEL_55:

    goto LABEL_56;
  }
  v42 = objc_loadWeakRetained((id *)&self->_databaseProvider);
  v75 = v40;
  objc_msgSend(v42, "checkOutProtectedResources:error:", self, &v75);
  v43 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v44 = v75;

  v40 = v44;
  protectedResources = self->_protectedResources;
  self->_protectedResources = v43;

  if (!self->_protectedResources)
  {
    v47 = objc_loadWeakRetained((id *)&self->_databaseProvider);
    objc_msgSend(v47, "checkInDatabase:type:protectedResources:", self->_protectedDatabase, 1, 0);

    v48 = self->_protectedDatabase;
    self->_protectedDatabase = 0;

    v46 = ((uint64_t (*)(NSDictionary *, id, id *))v12[2].super.isa)(v12, v44, a4);
    goto LABEL_51;
  }
  -[HDSQLiteDatabase setCacheScope:](self->_protectedDatabase, "setCacheScope:", -[HDDatabaseTransaction _resolveCacheScope:]((uint64_t)self, -[HDDatabaseTransactionContext cacheScope](self->_rootContext, "cacheScope")));
  -[HDSQLiteDatabase setTransactionInterruptRequested:](self->_protectedDatabase, "setTransactionInterruptRequested:", 0);

  v63 = 1;
LABEL_17:
  unprotectedDatabase = self->_unprotectedDatabase;
  if (!unprotectedDatabase)
  {
    v22 = objc_loadWeakRetained((id *)&self->_databaseProvider);
    v74 = 0;
    objc_msgSend(v22, "checkOutUnprotectedDatabase:error:", self, &v74);
    v23 = (HDSQLiteDatabase *)objc_claimAutoreleasedReturnValue();
    v24 = v74;
    v25 = self->_unprotectedDatabase;
    self->_unprotectedDatabase = v23;

    if (!self->_unprotectedDatabase)
    {
      v17 = ((uint64_t (*)(NSDictionary *, id, id *))v12[2].super.isa)(v12, v24, a4);

      goto LABEL_53;
    }
    -[HDSQLiteDatabase setCacheScope:](self->_unprotectedDatabase, "setCacheScope:", -[HDDatabaseTransaction _resolveCacheScope:]((uint64_t)self, -[HDDatabaseTransactionContext cacheScope](self->_rootContext, "cacheScope")));
    -[HDSQLiteDatabase setTransactionInterruptRequested:](self->_unprotectedDatabase, "setTransactionInterruptRequested:", 0);

  }
  if (isActive)
  {
    v26 = 0;
  }
  else
  {
    -[HDDatabaseTransactionContext statistics](self->_rootContext, "statistics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v27 != 0;

  }
  if (v13)
    v28 = 2;
  else
    v28 = 1;
  -[HDDatabaseTransaction databaseForEntityProtectionClass:](self, "databaseForEntityProtectionClass:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0.0;
  if (v26)
    v30 = CFAbsoluteTimeGetCurrent();
  v73 = 0;
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke_2;
  v69[3] = &unk_1E6D10568;
  v71 = v28;
  v72 = v19;
  v69[4] = self;
  v70 = v68;
  v17 = objc_msgSend(v29, "performTransactionWithType:error:usingBlock:", v19, &v73, v69);
  v31 = v73;
  if (v26)
  {
    v32 = -[HDDatabaseTransactionStatistics _initWithStartTime:endTime:]([HDDatabaseTransactionStatistics alloc], "_initWithStartTime:endTime:", v30, CFAbsoluteTimeGetCurrent());
    -[HDDatabaseTransactionContext statistics](self->_rootContext, "statistics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_addTransactionStatistics:", v32);

  }
  if (v31)
    v34 = 1;
  else
    v34 = v17;
  if ((v34 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 124, CFSTR("Transaction failure."));
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v31)
  {
    v35 = (void *)*MEMORY[0x1E0CB52B0];
    v36 = v31;
    v37 = v35;
    if (a4)
      *a4 = objc_retainAutorelease(v36);
    else
      _HKLogDroppedErrorWithReason();

  }
  if (!unprotectedDatabase)
  {
    v51 = objc_loadWeakRetained((id *)&self->_databaseProvider);
    objc_msgSend(v51, "checkInDatabase:type:protectedResources:", self->_unprotectedDatabase, 0, 0);

    v52 = self->_unprotectedDatabase;
    self->_unprotectedDatabase = 0;

LABEL_53:
    if ((v63 & 1) == 0)
      goto LABEL_56;
    goto LABEL_54;
  }
  if (v63)
  {
LABEL_54:
    v53 = objc_loadWeakRetained((id *)&self->_databaseProvider);
    objc_msgSend(v53, "checkInDatabase:type:protectedResources:", self->_protectedDatabase, 1, self->_protectedResources);

    v54 = self->_protectedDatabase;
    self->_protectedDatabase = 0;

    v49 = self->_protectedResources;
    self->_protectedResources = 0;
    goto LABEL_55;
  }
LABEL_56:
  if (!isActive)
  {
    v55 = v67;
    if (CFAbsoluteTimeGetCurrent() - Current > 10.0)
    {
      _HKInitializeLogging();
      v56 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
      {
        v57 = v56;
        HKDiagnosticStringFromDuration();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v55, "requiresWrite");
        v64 = objc_msgSend(v55, "requiresProtectedData");
        v59 = objc_msgSend(v55, "highPriority");
        v60 = objc_msgSend(v55, "cacheScope");
        v61 = objc_msgSend(v55, "journalType");
        label = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 138413826;
        v80 = v58;
        v81 = 1024;
        v82 = v66;
        v83 = 1024;
        v84 = v64;
        v85 = 1024;
        v86 = v59;
        v87 = 2048;
        v88 = v60;
        v89 = 2048;
        v90 = v61;
        v91 = 2080;
        v92 = label;
        _os_log_impl(&dword_1B7802000, v57, OS_LOG_TYPE_INFO, "long outermost database transaction: duration=%@, write=%{BOOL}d, protected=%{BOOL}d, priority=%{BOOL}d, cache=%ld, journal=%ld, queue=%s", buf, 0x3Cu);

      }
    }

    *(_WORD *)&self->_isActive = 0;
  }
LABEL_11:

  return v17 & 1;
}

uint64_t __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = (*(uint64_t (**)(uint64_t, id, _QWORD *))(v6 + 16))(v6, v5, a3);
  }
  else
  {
    v8 = v5;
    if (v8)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    v7 = 0;
  }

  return v7;
}

uint64_t __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v10[5];
  id v11;

  if (*(_QWORD *)(a1 + 48) != 2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "unprotectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke_3;
  v10[3] = &unk_1E6CFDC28;
  v7 = *(id *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v8 = objc_msgSend(v5, "performTransactionWithType:error:usingBlock:", v6, a3, v10);

  return v8;
}

uint64_t __79__HDDatabaseTransaction_performWithContext_error_block_inaccessibilityHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)onCommit:(id)a3 orRollback:(id)a4
{
  id v7;
  NSMutableArray *onCommitBlocks;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  NSMutableArray *onRollbackBlocks;
  NSMutableArray *v14;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v7 = a4;
  if (!self->_isActive)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseTransaction.m"), 257, CFSTR("Must be in a transaction"));

  }
  if (v19)
  {
    onCommitBlocks = self->_onCommitBlocks;
    if (!onCommitBlocks)
    {
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = self->_onCommitBlocks;
      self->_onCommitBlocks = v9;

      onCommitBlocks = self->_onCommitBlocks;
    }
    v11 = (void *)objc_msgSend(v19, "copy");
    v12 = _Block_copy(v11);
    -[NSMutableArray addObject:](onCommitBlocks, "addObject:", v12);

  }
  if (v7)
  {
    onRollbackBlocks = self->_onRollbackBlocks;
    if (!onRollbackBlocks)
    {
      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = self->_onRollbackBlocks;
      self->_onRollbackBlocks = v14;

      onRollbackBlocks = self->_onRollbackBlocks;
    }
    v16 = (void *)objc_msgSend(v7, "copy");
    v17 = _Block_copy(v16);
    -[NSMutableArray addObject:](onRollbackBlocks, "addObject:", v17);

  }
}

- (void)transactionDidEndWithError:(id)a3
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  NSMutableArray *onCommitBlocks;
  NSMutableArray *onRollbackBlocks;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_isActive)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseTransaction.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isActive"));

  }
  if (v5)
  {
    v18 = 0uLL;
    v19 = 0uLL;
    v16 = 0uLL;
    v17 = 0uLL;
    v6 = self->_onRollbackBlocks;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i) + 16))();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v7);
    }
  }
  else
  {
    v22 = 0uLL;
    v23 = 0uLL;
    v20 = 0uLL;
    v21 = 0uLL;
    v6 = self->_onCommitBlocks;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j) + 16))();
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
    }
  }

  onCommitBlocks = self->_onCommitBlocks;
  self->_onCommitBlocks = 0;

  onRollbackBlocks = self->_onRollbackBlocks;
  self->_onRollbackBlocks = 0;

}

- (void)requestTransactionInterruption
{
  -[HDSQLiteDatabase setTransactionInterruptRequested:](self->_protectedDatabase, "setTransactionInterruptRequested:", 1);
  -[HDSQLiteDatabase setTransactionInterruptRequested:](self->_unprotectedDatabase, "setTransactionInterruptRequested:", 1);
}

- (void)requireRollback
{
  -[HDSQLiteDatabase requireRollback](self->_protectedDatabase, "requireRollback");
  -[HDSQLiteDatabase requireRollback](self->_unprotectedDatabase, "requireRollback");
}

- (HDSQLiteDatabase)unprotectedDatabase
{
  return self->_unprotectedDatabase;
}

- (HDSQLiteDatabase)protectedDatabase
{
  return self->_protectedDatabase;
}

- (HDHFDataStore)highFrequencyDataStore
{
  return self->_highFrequencyDataStore;
}

- (HDDatabaseTransactionContext)rootContext
{
  return self->_rootContext;
}

- (BOOL)performingMigration
{
  return self->_performingMigration;
}

- (void)setPerformingMigration:(BOOL)a3
{
  self->_performingMigration = a3;
}

- (NSDictionary)protectedResources
{
  return self->_protectedResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootContext, 0);
  objc_storeStrong((id *)&self->_highFrequencyDataStore, 0);
  objc_storeStrong((id *)&self->_protectedDatabase, 0);
  objc_storeStrong((id *)&self->_unprotectedDatabase, 0);
  objc_storeStrong((id *)&self->_protectedResources, 0);
  objc_storeStrong((id *)&self->_onRollbackBlocks, 0);
  objc_storeStrong((id *)&self->_onCommitBlocks, 0);
  objc_destroyWeak((id *)&self->_databaseProvider);
  objc_destroyWeak((id *)&self->_database);
}

@end
