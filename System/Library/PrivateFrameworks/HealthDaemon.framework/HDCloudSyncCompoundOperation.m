@implementation HDCloudSyncCompoundOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 0;
}

- (HDCloudSyncCompoundOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HDCloudSyncCompoundOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 name:(id)a5 continueOnSubOperationError:(BOOL)a6
{
  id v10;
  HDCloudSyncCompoundOperation *v11;
  uint64_t v12;
  NSString *name;
  NSMutableArray *v14;
  NSMutableArray *operations;
  objc_super v17;

  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncCompoundOperation;
  v11 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v17, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    operations = v11->_operations;
    v11->_operations = v14;

    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_continueOnSubOperationError = a6;
  }

  return v11;
}

- (void)start
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  -[HDCloudSyncCompoundOperation preparationHandler](self, "preparationHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, HDCloudSyncCompoundOperation *))(v3 + 16))(v3, self);
  v5.receiver = self;
  v5.super_class = (Class)HDCloudSyncCompoundOperation;
  -[HDCloudSyncOperation start](&v5, sel_start);

}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDCloudSyncCompoundOperation;
  v5 = -[HDCloudSyncOperation finishWithSuccess:error:](&v7, sel_finishWithSuccess_error_, a3, a4);
  -[HDCloudSyncCompoundOperation _invalidate]((uint64_t)self);
  return v5;
}

- (void)_invalidate
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(a1 + 104);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (!objc_msgSend(v7, "status", (_QWORD)v10))
            objc_msgSend(v7, "skip");
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

    objc_msgSend(*(id *)(a1 + 104), "removeAllObjects");
    v8 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = 0;

    v9 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (void)main
{
  uint64_t v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *remainingOperations;
  uint64_t v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_operations, "count"))
  {
    v3 = 100 * -[NSMutableArray count](self->_operations, "count");
    -[HDCloudSyncOperation progress](self, "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTotalUnitCount:", v3);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = self->_operations;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
          -[HDCloudSyncOperation progress](self, "progress");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "progress");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addChild:withPendingUnitCount:", v12, 100);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }

    v13 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __36__HDCloudSyncCompoundOperation_main__block_invoke;
    v21[3] = &unk_1E6CE77A0;
    v21[4] = self;
    -[NSMutableArray lastObject](self->_operations, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setOnError:", v21);

    -[NSMutableArray lastObject](self->_operations, "lastObject", v13, 3221225472, __36__HDCloudSyncCompoundOperation_main__block_invoke_2, &unk_1E6CE7778, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOnSuccess:", &v20);

    -[HDCloudSyncOperation cloudState](self, "cloudState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray firstObject](self->_operations, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCloudState:", v16);

    v18 = (NSArray *)-[NSMutableArray copy](self->_operations, "copy");
    remainingOperations = self->_remainingOperations;
    self->_remainingOperations = v18;

    -[HDCloudSyncCompoundOperation _runRemainingOperations]((uint64_t)self);
  }
  else
  {
    -[HDCloudSyncCompoundOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }
}

void __36__HDCloudSyncCompoundOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HDCloudSyncCompoundOperation _recordError:](*(_QWORD *)(a1 + 32), v6);
  v4 = *(_BYTE **)(a1 + 32);
  if (v4[152])
  {
    -[HDCloudSyncCompoundOperation _compoundError]((uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithSuccess:error:", 0, v5);

  }
  else
  {
    objc_msgSend(v4, "finishWithSuccess:error:", 0, v6);
  }

}

- (void)_recordError:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    v4 = *(void **)(a1 + 144);
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = v5;

      v4 = *(void **)(a1 + 144);
    }
    objc_msgSend(v4, "addObject:", v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    v3 = v7;
  }

}

- (id)_compoundError
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  v2 = objc_msgSend(*(id *)(a1 + 144), "count");
  v3 = *(void **)(a1 + 144);
  if (v2 == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB4E20];
    v10 = CFSTR("HDCloudSyncCompoundOperationUnderlyingErrorsKey");
    v7 = (void *)objc_msgSend(*(id *)(a1 + 144), "copy");
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 711, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  return v4;
}

void __36__HDCloudSyncCompoundOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a2, "cloudState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCloudState:", v3);

  -[HDCloudSyncCompoundOperation _compoundError](*(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v4;
  if (v4)
  {
    v5 = 0;
    v6 = v4;
  }
  else
  {
    v5 = 1;
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", v5, v6);

}

- (void)_runRemainingOperations
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    v2 = (unsigned __int8 *)(a1 + 136);
    do
      v3 = __ldaxr(v2);
    while (__stlxr(1u, v2));
    if ((v3 & 1) == 0)
    {
      if (objc_msgSend((id)a1, "status") == 1)
      {
        v4 = 0;
        while (1)
        {
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
          if (*(_QWORD *)(a1 + 120) || !objc_msgSend(*(id *)(a1 + 128), "count"))
          {
            v5 = 0;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 128), "firstObject");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong((id *)(a1 + 120), v5);
            objc_msgSend(*(id *)(a1 + 128), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 128), "count") - 1);
            v6 = objc_claimAutoreleasedReturnValue();
            v7 = *(void **)(a1 + 128);
            *(_QWORD *)(a1 + 128) = v6;

          }
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));

          if (!v5)
            break;
          objc_msgSend(v5, "start");
          v4 = v5;
          if (objc_msgSend((id)a1, "status") != 1)
            goto LABEL_15;
        }
      }
      else
      {
        v5 = 0;
LABEL_15:

      }
      atomic_store(0, (unsigned __int8 *)(a1 + 136));
    }
  }
}

- (void)skip
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDCloudSyncCompoundOperation;
  -[HDCloudSyncOperation skip](&v3, sel_skip);
  -[HDCloudSyncCompoundOperation _invalidate]((uint64_t)self);
}

- (BOOL)hasEncounteredSubOperationError
{
  HDCloudSyncCompoundOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[NSMutableArray count](v2->_operationErrors, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSArray)operations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_operations, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addOperationOfClass:(Class)a3 transitionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = [a3 alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "initWithConfiguration:cloudState:", v8, v9);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](self, "addOperation:transitionHandler:", v10, v6);
}

- (void)_clearOperationAndRunRemaining:(uint64_t)a1
{
  void *v3;
  id v4;

  v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if (*(id *)(a1 + 120) == v4)
  {
    *(_QWORD *)(a1 + 120) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", sel__clearOperationAndRunRemaining_, a1, CFSTR("HDCloudSyncCompoundOperation.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isCurrentOperation"));

  }
  -[HDCloudSyncCompoundOperation _runRemainingOperations](a1);

}

- (void)addOperation:(id)a3 transitionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id location;

  v7 = a3;
  v8 = a4;
  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncCompoundOperation.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray lastObject](self->_operations, "lastObject");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8 || v9)
  {
    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __63__HDCloudSyncCompoundOperation_addOperation_transitionHandler___block_invoke;
    v21[3] = &unk_1E6D01CD0;
    objc_copyWeak(&v24, &location);
    v13 = v7;
    v22 = v13;
    v14 = v8;
    v23 = v14;
    objc_msgSend(v10, "setOnError:", v21);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __63__HDCloudSyncCompoundOperation_addOperation_transitionHandler___block_invoke_2;
    v17[3] = &unk_1E6D01CF8;
    objc_copyWeak(&v20, &location);
    v15 = v13;
    v18 = v15;
    v19 = v14;
    objc_msgSend(v10, "setOnSuccess:", v17);
    -[NSMutableArray addObject:](self->_operations, "addObject:", v15);
    os_unfair_lock_unlock(&self->_lock);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncCompoundOperation.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preceedingOperation != nil"));

  }
}

void __63__HDCloudSyncCompoundOperation_addOperation_transitionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, id);
  void *v14;
  _BYTE *WeakRetained;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = v7;
  v11 = v6;
  v12 = v8;
  v13 = v9;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cloudState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCloudState:", v14);

    if (v13 && WeakRetained[152])
      v13[2](v13, v10, v12);
    -[HDCloudSyncCompoundOperation _recordError:]((uint64_t)WeakRetained, v11);
    if (WeakRetained[152])
      -[HDCloudSyncCompoundOperation _clearOperationAndRunRemaining:]((uint64_t)WeakRetained, v10);
    else
      objc_msgSend(WeakRetained, "finishWithSuccess:error:", 0, v11);
  }

}

void __63__HDCloudSyncCompoundOperation_addOperation_transitionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void (**v9)(id, id, id);
  void *v10;
  void *v11;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = v4;
  v8 = v5;
  v9 = v6;
  if (WeakRetained)
  {
    objc_msgSend(v7, "cloudState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setCloudState:", v10);

    objc_msgSend(v7, "cloudState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCloudState:", v11);

    if (v9)
      v9[2](v9, v7, v8);
    -[HDCloudSyncCompoundOperation _clearOperationAndRunRemaining:]((uint64_t)WeakRetained, v7);
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *name;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  -[HDCloudSyncCompoundOperation operations](self, "operations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[HDCloudSyncCompoundOperation operations](self, "operations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_map:", &__block_literal_global_183);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ (%ld): %@>"), v5, self, name, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

NSString *__43__HDCloudSyncCompoundOperation_description__block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (id)unitTest_currentOperation
{
  return self->_currentOperation;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)continueOnSubOperationError
{
  return self->_continueOnSubOperationError;
}

- (id)preparationHandler
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setPreparationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preparationHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_operationErrors, 0);
  objc_storeStrong((id *)&self->_remainingOperations, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_operations, 0);
}

@end
