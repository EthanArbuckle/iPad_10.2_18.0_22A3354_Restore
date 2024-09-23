@implementation HDDatabaseValueCache

- (id)objectForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDDatabaseValueCache _storageForTransaction:createIfNecessary:]((uint64_t)self, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseValueCache _lock_objectForKey:storage:](self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (HDDatabaseValueCache)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDDatabaseValueCache)initWithName:(id)a3
{
  return -[HDDatabaseValueCache initWithName:cacheScope:](self, "initWithName:cacheScope:", a3, 0);
}

- (HDDatabaseValueCache)initWithName:(id)a3 cacheScope:(int64_t)a4
{
  id v6;
  HDDatabaseValueCache *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *cache;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *threadLocalKey;
  void *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDDatabaseValueCache;
  v7 = -[HDDatabaseValueCache init](&v16, sel_init);
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cache = v7->_cache;
    v7->_cache = v8;

    v10 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v10;

    v7->_cacheScope = a4;
    v7->_lock._os_unfair_lock_opaque = 0;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%p"), objc_opt_class(), v7);
    threadLocalKey = v7->_threadLocalKey;
    v7->_threadLocalKey = (NSString *)v12;

    v7->_statistics.faultCount = 0;
    v7->_statistics.lookupCount = 0;
    v7->_statistics.resetCount = 0;
    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDDatabaseValueCache;
  -[HDDatabaseValueCache dealloc](&v4, sel_dealloc);
}

- (int64_t)cacheScope
{
  return self->_cacheScope;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)statistics
{
  os_unfair_lock_s *p_lock;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *($F5DB93FF7B13EBFF3E2EFA7670924866 *)retstr = self->_statistics;
  os_unfair_lock_unlock(p_lock);
  return result;
}

- (id)fetchObjectForKey:(id)a3 transaction:(id)a4 error:(id *)a5 faultHandler:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, id, id *);
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD *v19;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, id, id *))a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseValueCache.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction != nil"));

    if (v13)
      goto LABEL_4;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseValueCache.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  if (!v12)
    goto LABEL_19;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseValueCache.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != NULL"));

LABEL_4:
  os_unfair_lock_lock(&self->_lock);
  -[HDDatabaseValueCache _storageForTransaction:createIfNecessary:]((uint64_t)self, v12, 0);
  v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseValueCache _lock_objectForKey:storage:](self, v11, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = 0;
LABEL_11:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_12;
  }
  ++self->_statistics.faultCount;
  v18 = (void *)MEMORY[0x1BCCACAC4]();
  v24 = 0;
  v13[2](v13, v12, &v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v24;
  objc_autoreleasePoolPop(v18);
  if (v16)
  {
    if (v14
      || (-[HDDatabaseValueCache _storageForTransaction:createIfNecessary:]((uint64_t)self, v12, 1),
          v19 = (_QWORD *)objc_claimAutoreleasedReturnValue(),
          (v14 = v19) != 0))
    {
      v19 = (_QWORD *)v14[2];
    }
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, v11);
    goto LABEL_11;
  }
  os_unfair_lock_unlock(&self->_lock);
  v17 = v17;
  if (v17)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v17);
    else
      _HKLogDroppedError();
  }

  v16 = 0;
LABEL_12:

  return v16;
}

- (HDDatabaseValueCacheTransactionStorage)_storageForTransaction:(int)a3 createIfNecessary:
{
  id v5;
  void *v6;
  void *v7;
  HDDatabaseValueCacheTransactionStorage *v8;
  BOOL v9;
  HDDatabaseValueCacheTransactionStorage *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  _QWORD v25[5];
  HDDatabaseValueCacheTransactionStorage *v26;
  id v27;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "threadDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 16));
    v8 = (HDDatabaseValueCacheTransactionStorage *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = 1;
    else
      v9 = a3 == 0;
    if (!v9)
    {
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__storageForTransaction_createIfNecessary_, a1, CFSTR("HDDatabaseValueCache.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction != nil"));

      }
      v10 = objc_alloc_init(HDDatabaseValueCacheTransactionStorage);
      v11 = v5;
      v12 = v11;
      v13 = *(_QWORD *)(a1 + 24);
      if (!v13)
      {
        if (v5 && objc_msgSend(v11, "cacheScope"))
        {
          v13 = objc_msgSend(v12, "cacheScope");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "features");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "databaseStateCacheTransactionScoped");

          if (v16)
            v13 = 1;
          else
            v13 = 2;
        }
      }

      if (!v10 || (v10->_cacheScope = v13) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__storageForTransaction_createIfNecessary_, a1, CFSTR("HDDatabaseValueCache.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storage.cacheScope != HDDatabaseTransactionCacheScopeUnspecified"));

      }
      v17 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __65__HDDatabaseValueCache__storageForTransaction_createIfNecessary___block_invoke;
      v25[3] = &unk_1E6CE7FB8;
      v25[4] = a1;
      v8 = v10;
      v26 = v8;
      v27 = v7;
      v22[0] = v17;
      v22[1] = 3221225472;
      v22[2] = __65__HDDatabaseValueCache__storageForTransaction_createIfNecessary___block_invoke_2;
      v22[3] = &unk_1E6CEF7C8;
      v18 = v27;
      v23 = v18;
      v24 = a1;
      objc_msgSend(v12, "onCommit:orRollback:", v25, v22);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 16));

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_lock_objectForKey:(void *)a3 storage:
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)a1 + 8);
    ++*((_QWORD *)a1 + 6);
    if (v6)
      v7 = (void *)v6[2];
    else
      v7 = 0;
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if ((v10 & 1) != 0)
      goto LABEL_5;
    if (v8)
    {
      v11 = v8;
    }
    else
    {
      if (v6 && *((_BYTE *)v6 + 8))
      {
LABEL_5:
        a1 = 0;
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(*((id *)a1 + 1), "objectForKeyedSubscript:", v5);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    a1 = v11;
    goto LABEL_9;
  }
LABEL_10:

  return a1;
}

- (void)_lock_storeObject:(void *)a3 forKey:(void *)a4 transaction:
{
  const os_unfair_lock *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD *v12;

  if (a1)
  {
    v7 = (const os_unfair_lock *)(a1 + 32);
    v8 = a4;
    v9 = a3;
    v10 = a2;
    os_unfair_lock_assert_owner(v7);
    -[HDDatabaseValueCache _storageForTransaction:createIfNecessary:](a1, v8, 1);
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    v11 = v12;
    if (v12)
      v11 = (void *)v12[2];
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v9);

  }
}

- (void)setObject:(id)a3 forKey:(id)a4 transaction:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseValueCache.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"), v12);

  }
  os_unfair_lock_lock(&self->_lock);
  -[HDDatabaseValueCache _lock_storeObject:forKey:transaction:]((uint64_t)self, v12, v9, v10);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObjectForKey:(id)a3 transaction:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseValueCache.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseValueCache _lock_storeObject:forKey:transaction:]((uint64_t)self, v8, v10, v7);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeAllObjectsWithTransaction:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;
  uint64_t v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  if (self)
  {
    v6 = v5;
    os_unfair_lock_assert_owner(p_lock);
    -[HDDatabaseValueCache _storageForTransaction:createIfNecessary:]((uint64_t)self, v6, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(v7 + 16), "removeAllObjects");
      *(_BYTE *)(v7 + 8) = 1;
    }
    else
    {
      objc_msgSend(0, "removeAllObjects");
    }
    ++self->_statistics.resetCount;

  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __65__HDDatabaseValueCache__storageForTransaction_createIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  BOOL v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v2)
  {
    v4 = (os_unfair_lock_s *)(v2 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
    if (v3)
    {
      if (v3[8])
        objc_msgSend(*(id *)(v2 + 8), "removeAllObjects");
      v5 = *((_QWORD *)v3 + 3);
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__commitTransactionStorage_, v2, CFSTR("HDDatabaseValueCache.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transactionStorage.cacheScope != HDDatabaseTransactionCacheScopeUnspecified"));

        v5 = *((_QWORD *)v3 + 3);
      }
      v6 = v5 != 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__commitTransactionStorage_, v2, CFSTR("HDDatabaseValueCache.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transactionStorage.cacheScope != HDDatabaseTransactionCacheScopeUnspecified"));

      v6 = 1;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v8 = (void *)*((_QWORD *)v3 + 2);
    else
      v8 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__HDDatabaseValueCache__commitTransactionStorage___block_invoke;
    v13[3] = &unk_1E6D0EF30;
    v14 = v7;
    v15 = v2;
    v16 = v6;
    v9 = v7;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);
    os_unfair_lock_unlock(v4);

  }
  return objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __65__HDDatabaseValueCache__storageForTransaction_createIfNecessary___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
}

void __50__HDDatabaseValueCache__commitTransactionStorage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObjectForKey:", v6);
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v5, v6);
  }

}

- (id)diagnosticDescription
{
  os_unfair_lock_s *p_lock;
  int64_t lookupCount;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lookupCount = self->_statistics.lookupCount;
  if (lookupCount < 1)
    v5 = 0;
  else
    v5 = (int)((double)self->_statistics.faultCount / (double)lookupCount * 100.0);
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[HDDatabaseValueCache name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: %lu values, %d%% fault rate (%ld/%ld), %ld resets"), v7, -[NSMutableDictionary count](self->_cache, "count"), v5, self->_statistics.faultCount, self->_statistics.lookupCount, self->_statistics.resetCount, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_threadLocalKey, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
