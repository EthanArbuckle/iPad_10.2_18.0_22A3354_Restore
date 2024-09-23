@implementation HMFPromise

- (uint64_t)resolveWithOutcome:(void *)a3
{
  void *v3;
  uint64_t v4;
  unsigned __int8 *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  if (a1)
  {
    v4 = a2;
    v6 = (unsigned __int8 *)(a1 + 24);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(1u, v6));
    if ((v7 & 1) == 0)
    {
      if (a2 == 3)
      {
        v4 = objc_msgSend(a3, "outcomeIfSettled");
        v9 = v8;
        if (v4)
        {
          v10 = v8;

          v3 = v10;
        }
        else
        {
          v4 = 3;
        }

      }
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v13 = WeakRetained;
      if (WeakRetained)
      {
        if (!-[HMFAsyncFuture _resolveWithState:value:]((uint64_t)WeakRetained, v4, v3))
        {
          v11 = 0;
LABEL_25:

          goto LABEL_26;
        }
        objc_storeWeak((id *)(a1 + 8), 0);
      }
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AC373C](*(_QWORD *)(a1 + 16));
      if (v14)
      {
        v15 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = 0;

        if (v4 == 1)
        {
          v16 = 0;
          v17 = v3;
        }
        else
        {
          if (v4 != 2)
          {
            if (v4 == 3)
              v11 = -[HMFAsyncFuture _callOrAddCompletionBlock:]((uint64_t)v3, v14);
            else
              v11 = 0;
            goto LABEL_24;
          }
          v17 = 0;
          v16 = v3;
        }
        ((void (**)(_QWORD, void *, void *))v14)[2](v14, v17, v16);
      }
      v11 = 1;
LABEL_24:

      goto LABEL_25;
    }
  }
  v11 = 0;
LABEL_26:

  return v11;
}

- (void)_addCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1A1AC373C](*(_QWORD *)(a1 + 16));
    v5 = v4;
    if (v4)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __29__HMFPromise__addCompletion___block_invoke;
      v10[3] = &unk_1E3B37DB0;
      v11 = v4;
      v12 = v3;
      v8 = MEMORY[0x1A1AC373C](v10);
      v9 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v8;

      v7 = v11;
    }
    else
    {
      v6 = MEMORY[0x1A1AC373C](v3);
      v7 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v6;
    }

  }
}

- (void)dealloc
{
  atomic_flag *p_resolved;
  unsigned __int8 v4;
  id WeakRetained;
  void *v6;
  void (**completion)(id, _QWORD, void *);
  objc_super v8;

  p_resolved = &self->_resolved;
  do
    v4 = __ldxr((unsigned __int8 *)p_resolved);
  while (__stxr(1u, (unsigned __int8 *)p_resolved));
  if ((v4 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_future);
    if (WeakRetained || self->_completion)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFAsyncFuture _resolveWithState:value:]((uint64_t)WeakRetained, 2, v6);
      completion = (void (**)(id, _QWORD, void *))self->_completion;
      if (completion)
        completion[2](completion, 0, v6);

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)HMFPromise;
  -[HMFPromise dealloc](&v8, sel_dealloc);
}

void __29__HMFPromise__addCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id, id);
  id v7;
  void *v8;
  id v9;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t, id, id))(v5 + 16);
  v7 = a3;
  v9 = a2;
  v6(v5, v9, v7);
  v8 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)fulfillWithValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (self)
    LOBYTE(self) = -[HMFPromise resolveWithOutcome:]((uint64_t)self, 1, v4);
  else

  return (char)self;
}

- (BOOL)rejectWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfUnspecifiedError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  if (self)
    LOBYTE(self) = -[HMFPromise resolveWithOutcome:]((uint64_t)self, 2, v7);
  else

  return (char)self;
}

- (BOOL)resolveWithFuture:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure(CFSTR("future"));
  v5 = v4;
  if (self)
    LOBYTE(self) = -[HMFPromise resolveWithOutcome:]((uint64_t)self, 3, v4);
  else

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_future);
}

- (BOOL)fulfillWithNoValue
{
  if (self)
    LOBYTE(self) = -[HMFPromise resolveWithOutcome:]((uint64_t)self, 1, 0);
  return (char)self;
}

- (id)resolverBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__HMFPromise_Convenience__resolverBlock__block_invoke;
  v3[3] = &unk_1E3B383E0;
  v3[4] = self;
  return (id)MEMORY[0x1A1AC373C](v3, a2);
}

void __40__HMFPromise_Convenience__resolverBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v5)
    v7 = v5;
  else
    v7 = v10;
  if (v5)
    v8 = 2;
  else
    v8 = 1;
  v9 = v7;
  if (v6)
    -[HMFPromise resolveWithOutcome:](v6, v8, v9);
  else

}

- (id)errorOnlyResolverBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__HMFPromise_Convenience__errorOnlyResolverBlock__block_invoke;
  v3[3] = &unk_1E3B37B70;
  v3[4] = self;
  return (id)MEMORY[0x1A1AC373C](v3, a2);
}

void __49__HMFPromise_Convenience__errorOnlyResolverBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  if (!v3)
  {
    v6 = 1;
    if (v4)
      goto LABEL_3;
LABEL_5:

    goto LABEL_6;
  }
  v5 = v3;
  v6 = 2;
  if (!v4)
    goto LABEL_5;
LABEL_3:
  -[HMFPromise resolveWithOutcome:](v4, v6, v7);
LABEL_6:

}

- (id)voidResolverBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__HMFPromise_Convenience__voidResolverBlock__block_invoke;
  v3[3] = &unk_1E3B37AF8;
  v3[4] = self;
  return (id)MEMORY[0x1A1AC373C](v3, a2);
}

uint64_t __44__HMFPromise_Convenience__voidResolverBlock__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return -[HMFPromise resolveWithOutcome:](result, 1, 0);
  return result;
}

@end
