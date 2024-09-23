@implementation MSVXPCTransaction

- (void)endTransaction
{
  int64_t transactionCount;
  void *v5;
  OS_os_transaction *transaction;
  void *v7;

  transactionCount = self->_transactionCount;
  self->_transactionCount = transactionCount - 1;
  if (transactionCount <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVXPCTransaction.m"), 113, CFSTR("Unbalanced calls to -[MSVXPCTransaction endTransaction]"));

    if (self->_transactionCount)
      return;
  }
  else if (transactionCount != 1)
  {
    return;
  }
  if (self->_transaction)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MSVXPCTransactionLock);
    transaction = self->_transaction;
    self->_transaction = 0;

    _MSVXPCTransactionsGet();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", self);

    os_unfair_lock_unlock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  }
}

- (void)beginTransaction
{
  int64_t transactionCount;
  void *v4;
  NSString *name;
  void *v6;
  id v7;
  OS_os_transaction *v8;
  OS_os_transaction *transaction;
  void *v10;

  transactionCount = self->_transactionCount;
  self->_transactionCount = transactionCount + 1;
  if ((transactionCount & 0x8000000000000000) == 0 && !self->_transaction)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MSVXPCTransactionLock);
    v4 = (void *)MEMORY[0x1E0CB3940];
    name = self->_name;
    -[NSUUID UUIDString](self->_identifier, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), name, v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "UTF8String");
    v8 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v8;

    _MSVXPCTransactionsGet();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", self);

    os_unfair_lock_unlock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (MSVXPCTransaction)initWithName:(id)a3
{
  id v4;
  MSVXPCTransaction *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  NSUUID *v9;
  NSUUID *identifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSVXPCTransaction;
  v5 = -[MSVXPCTransaction init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = CFSTR("<UNNAMED TRANSACTION>");
    objc_storeStrong((id *)&v5->_name, v8);

    v9 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    identifier = v5->_identifier;
    v5->_identifier = v9;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *name;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  name = self->_name;
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_transaction)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, name=\"%@:%@\" isActive=%@>"), v4, self, name, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isActive
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  LOBYTE(self) = self->_transaction != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  return (char)self;
}

- (void)endTransactionOnDate:(id)a3
{
  double v4;
  dispatch_time_t v5;
  _QWORD block[5];

  objc_msgSend(a3, "timeIntervalSinceNow");
  v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MSVXPCTransaction_endTransactionOnDate___block_invoke;
  block[3] = &unk_1E43E9C88;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
}

- (NSString)name
{
  return self->_name;
}

uint64_t __42__MSVXPCTransaction_endTransactionOnDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endTransaction");
}

+ (id)activeTransactions
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  _MSVXPCTransactionsGet();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9) + 16))
          objc_msgSend(v4, "addObject:", (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  return v4;
}

@end
