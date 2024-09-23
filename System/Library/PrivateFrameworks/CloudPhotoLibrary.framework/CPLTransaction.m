@implementation CPLTransaction

- (CPLTransaction)initWithIdentifier:(id)a3 description:(id)a4 keepPower:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CPLTransaction *v10;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLTransaction;
  v10 = -[CPLTransaction init](&v14, sel_init);
  if (v10)
  {
    +[CPLTransaction beginTransactionWithIdentifier:description:keepPower:](CPLTransaction, "beginTransactionWithIdentifier:description:keepPower:", v8, v9, v5);
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_dirty = 1;
  }

  return v10;
}

- (void)endTransaction
{
  if (self->_dirty)
  {
    +[CPLTransaction endTransactionWithIdentifier:](CPLTransaction, "endTransactionWithIdentifier:", self->_identifier);
    self->_dirty = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_dirty)
    +[CPLTransaction endTransactionWithIdentifier:](CPLTransaction, "endTransactionWithIdentifier:", self->_identifier);
  v3.receiver = self;
  v3.super_class = (Class)CPLTransaction;
  -[CPLTransaction dealloc](&v3, sel_dealloc);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)beginTransactionWithIdentifier:(id)a3 description:(id)a4 keepPower:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[2];
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  BOOL v25;

  v7 = a3;
  v8 = a4;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v21 = __71__CPLTransaction_beginTransactionWithIdentifier_description_keepPower___block_invoke;
  v22 = &unk_1E60DC110;
  v9 = v7;
  v23 = v9;
  v10 = v8;
  v24 = v10;
  v25 = a5;
  v11 = v20;
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  if (!_transactionIdentifiers)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v13 = (void *)_transactionIdentifiers;
    _transactionIdentifiers = (uint64_t)v12;

    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = (void *)_transactionDescriptions;
    _transactionDescriptions = (uint64_t)v14;

    v16 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v17 = (void *)_poweredIdentifiers;
    _poweredIdentifiers = (uint64_t)v16;

    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = (void *)_transactions;
    _transactions = (uint64_t)v18;

  }
  v21((uint64_t)v11);
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

}

+ (void)endTransactionWithIdentifier:(id)a3
{
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[2];
  uint64_t (*v17)(_QWORD *);
  void *v18;
  id v19;
  SEL v20;
  id v21;

  v5 = a3;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = __47__CPLTransaction_endTransactionWithIdentifier___block_invoke;
  v18 = &unk_1E60DD0C0;
  v6 = v5;
  v19 = v6;
  v20 = a2;
  v21 = a1;
  v7 = v16;
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  if (!_transactionIdentifiers)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v9 = (void *)_transactionIdentifiers;
    _transactionIdentifiers = (uint64_t)v8;

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = (void *)_transactionDescriptions;
    _transactionDescriptions = (uint64_t)v10;

    v12 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v13 = (void *)_poweredIdentifiers;
    _poweredIdentifiers = (uint64_t)v12;

    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = (void *)_transactions;
    _transactions = (uint64_t)v14;

  }
  v17(v7);
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

}

+ (id)transactions
{
  _QWORD *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[2];
  void (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6163;
  v21 = __Block_byref_object_dispose__6164;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v14 = __30__CPLTransaction_transactions__block_invoke;
  v15 = &unk_1E60D7240;
  v16 = &v17;
  v2 = v13;
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  if (!_transactionIdentifiers)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v4 = (void *)_transactionIdentifiers;
    _transactionIdentifiers = (uint64_t)v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = (void *)_transactionDescriptions;
    _transactionDescriptions = (uint64_t)v5;

    v7 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v8 = (void *)_poweredIdentifiers;
    _poweredIdentifiers = (uint64_t)v7;

    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)_transactions;
    _transactions = (uint64_t)v9;

  }
  v14((uint64_t)v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

+ (unint64_t)transactionCount
{
  _QWORD *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v14 = __34__CPLTransaction_transactionCount__block_invoke;
  v15 = &unk_1E60D7240;
  v16 = &v17;
  v2 = v13;
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  if (!_transactionIdentifiers)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v4 = (void *)_transactionIdentifiers;
    _transactionIdentifiers = (uint64_t)v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = (void *)_transactionDescriptions;
    _transactionDescriptions = (uint64_t)v5;

    v7 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v8 = (void *)_poweredIdentifiers;
    _poweredIdentifiers = (uint64_t)v7;

    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)_transactions;
    _transactions = (uint64_t)v9;

  }
  v14((uint64_t)v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

  v11 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v11;
}

+ (id)newTransactionWithIdentifier:(id)a3 description:(id)a4 keepPower:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  CPLTransaction *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[CPLTransaction initWithIdentifier:description:keepPower:]([CPLTransaction alloc], "initWithIdentifier:description:keepPower:", v8, v7, v5);

  return v9;
}

uint64_t __34__CPLTransaction_transactionCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)_transactionIdentifiers, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __30__CPLTransaction_transactions__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)_transactionIdentifiers, "count"))
  {
    v24 = a1;
    v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v3 = (void *)objc_msgSend(v2, "initWithCapacity:", objc_msgSend((id)_transactionIdentifiers, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = (id)_transactionIdentifiers;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v9 = objc_msgSend((id)_poweredIdentifiers, "containsObject:", v8);
          v10 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend((id)_transactionDescriptions, "objectForKeyedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend((id)_transactionIdentifiers, "countForObject:", v8);
          if (v9)
            v13 = CFSTR("%@ (%lu - power)");
          else
            v13 = CFSTR("%@ (%lu)");
          objc_msgSend(v10, "stringWithFormat:", v13, v11, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v14);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v5);
    }

    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
    v15 = objc_claimAutoreleasedReturnValue();
    a1 = v24;
    v16 = *(_QWORD *)(*(_QWORD *)(v24 + 32) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  else
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = CFSTR("No transactions");

  }
  +[CPLPowerAssertion powerAssertionStatus](CPLPowerAssertion, "powerAssertionStatus");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\n%@"), v20, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

  }
}

uint64_t __47__CPLTransaction_endTransactionWithIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)_poweredIdentifiers, "containsObject:", a1[4]))
  {
    objc_msgSend((id)_poweredIdentifiers, "removeObject:", a1[4]);
    if (!objc_msgSend((id)_poweredIdentifiers, "count"))
      +[CPLPowerAssertion enableSleep](CPLPowerAssertion, "enableSleep");
  }
  v2 = objc_msgSend((id)_transactionIdentifiers, "countForObject:", a1[4]);
  if (!v2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = a1[4];
        *(_DWORD *)buf = 138412290;
        v12 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Transaction '%@' is invalid", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[5];
    v9 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLTransaction.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, v10, 88, CFSTR("Transaction '%@' is invalid"), a1[4]);

    abort();
  }
  v3 = v2;
  result = objc_msgSend((id)_transactionIdentifiers, "removeObject:", a1[4]);
  if (v3 == 1)
  {
    objc_msgSend((id)_transactions, "removeObjectForKey:", a1[4]);
    return objc_msgSend((id)_transactionDescriptions, "removeObjectForKey:", a1[4]);
  }
  return result;
}

uint64_t __71__CPLTransaction_beginTransactionWithIdentifier_description_keepPower___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (!objc_msgSend((id)_transactionIdentifiers, "countForObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    v2 = (void *)os_transaction_create();
    if (v2)
      objc_msgSend((id)_transactions, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));
    objc_msgSend((id)_transactionDescriptions, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  result = objc_msgSend((id)_transactionIdentifiers, "addObject:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 48))
  {
    if (!objc_msgSend((id)_poweredIdentifiers, "count"))
      +[CPLPowerAssertion disableSleep](CPLPowerAssertion, "disableSleep");
    return objc_msgSend((id)_poweredIdentifiers, "addObject:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

@end
