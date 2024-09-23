@implementation BMAccessAssertionCache

- (id)createAssertionForAccessDescriptor:(id)a3 extensionToken:(id)a4 path:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _PASLock *lock;
  id v14;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  BMAccessAssertionCache *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1AF4569E0]();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMAccessAssertion.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

    if (v10)
    {
LABEL_7:
      v14 = 0;
      goto LABEL_4;
    }
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMAccessAssertion.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionToken"));

    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  lock = self->_lock;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__BMAccessAssertionCache_createAssertionForAccessDescriptor_extensionToken_path___block_invoke;
  v18[3] = &unk_1E5E3CC40;
  v23 = &v24;
  v19 = v9;
  v20 = self;
  v21 = v10;
  v22 = v11;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v18);
  v14 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
LABEL_4:
  objc_autoreleasePoolPop(v12);

  return v14;
}

- (id)assertionForAccessDescriptor:(id)a3
{
  id v4;
  void *v5;
  _PASLock *lock;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF4569E0]();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__BMAccessAssertionCache_assertionForAccessDescriptor___block_invoke;
  v10[3] = &unk_1E5E3CC18;
  v12 = &v13;
  v7 = v4;
  v11 = v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  objc_autoreleasePoolPop(v5);

  return v8;
}

void __81__BMAccessAssertionCache_createAssertionForAccessDescriptor_extensionToken_path___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "_makeAssertionWithDescriptor:extensionToken:path:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(_QWORD *)(v9 + 40);
    if (v10)
    {
      objc_msgSend(*(id *)(v9 + 40), "descriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v10, v11);

    }
  }

}

- (id)_makeAssertionWithDescriptor:(id)a3 extensionToken:(id)a4 path:(id)a5
{
  id v7;
  id v8;
  id v9;
  _BMAccessAssertion *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_BMAccessAssertion initWithDescriptor:extensionToken:path:]([_BMAccessAssertion alloc], "initWithDescriptor:extensionToken:path:", v9, v8, v7);

  return v10;
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_4);
  return (id)sharedCache_cache;
}

void __55__BMAccessAssertionCache_assertionForAccessDescriptor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __37__BMAccessAssertionCache_sharedCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCache_cache;
  sharedCache_cache = v0;

}

- (BMAccessAssertionCache)init
{
  BMAccessAssertionCache *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMAccessAssertionCache;
  v2 = -[BMAccessAssertionCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
