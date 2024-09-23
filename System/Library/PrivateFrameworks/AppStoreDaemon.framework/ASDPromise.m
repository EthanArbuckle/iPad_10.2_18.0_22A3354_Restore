@implementation ASDPromise

- (void)alwaysPerform:(id)a3 onScheduler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__ASDPromise_alwaysPerform_onScheduler___block_invoke;
  v11[3] = &unk_1E37BFB90;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __40__ASDPromise_alwaysPerform_onScheduler___block_invoke_2;
  v9[3] = &unk_1E37BDB60;
  v10 = v12;
  v8 = v12;
  -[ASDPromise thenPerform:orCatchError:onScheduler:](self, "thenPerform:orCatchError:onScheduler:", v11, v9, a4);

}

- (void)thenPerform:(id)a3 orCatchError:(id)a4 onScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSRecursiveLock *stateLock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ASDPromise *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  stateLock = self->_stateLock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__ASDPromise_thenPerform_orCatchError_onScheduler___block_invoke;
  v15[3] = &unk_1E37BFBD8;
  v18 = v8;
  v19 = v9;
  v16 = v10;
  v17 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  ASDWithLock(stateLock, v15);

}

+ (id)onScheduler:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initOnScheduler:withExecutor:", v7, v6);

  return v8;
}

- (id)initOnScheduler:(id)a3 withExecutor:(id)a4
{
  id v6;
  id v7;
  ASDPromise *v8;
  ASDPromise *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[ASDPromise init](self, "init");
  v9 = v8;
  if (v8)
    -[ASDPromise _invokeExecutor:onScheduler:]((uint64_t)v8, v7, v6);

  return v9;
}

- (ASDPromise)init
{
  return (ASDPromise *)-[ASDPromise initWithState:result:]((id *)&self->super.isa, 0, 0);
}

- (id)initWithState:(void *)a3 result:
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)ASDPromise;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB38E0]);
      v8 = a1[3];
      a1[3] = v7;

      a1[2] = a2;
      objc_storeStrong(a1 + 4, a3);
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = a1[1];
      a1[1] = v9;

    }
  }

  return a1;
}

- (void)_invokeExecutor:(void *)a3 onScheduler:
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__ASDPromise__invokeExecutor_onScheduler___block_invoke;
    v7[3] = &unk_1E37BDCC0;
    v7[4] = a1;
    v8 = v5;
    objc_msgSend(a3, "scheduleBlock:", v7);

  }
}

uint64_t __42__ASDPromise__invokeExecutor_onScheduler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[5];
  _QWORD v4[4];
  uint64_t v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__ASDPromise__invokeExecutor_onScheduler___block_invoke_2;
  v4[3] = &unk_1E37BFC00;
  v1 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__ASDPromise__invokeExecutor_onScheduler___block_invoke_3;
  v3[3] = &unk_1E37BDDB0;
  v3[4] = v5;
  return (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD *))(v1 + 16))(v1, v4, v3);
}

- (id)completionHandlerAdapter
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__ASDPromise_completionHandlerAdapter__block_invoke;
  v3[3] = &unk_1E37BFC78;
  v3[4] = self;
  return (id)MEMORY[0x19AEC5B88](v3, a2);
}

void __51__ASDPromise_thenPerform_orCatchError_onScheduler___block_invoke(_QWORD *a1)
{
  ASDPromiseObserver *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  ASDPromiseObserver *v7;

  v2 = -[ASDPromiseObserver initWithValueBlock:errorBlock:scheduler:]([ASDPromiseObserver alloc], "initWithValueBlock:errorBlock:scheduler:", a1[6], a1[7], a1[4]);
  v3 = a1[5];
  v4 = *(_QWORD *)(v3 + 16);
  switch(v4)
  {
    case 2:
      v7 = v2;
      objc_msgSend((id)v3, "result");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDPromiseObserver notifyRejectedWithError:](v7, "notifyRejectedWithError:", v6);
LABEL_7:

      goto LABEL_8;
    case 1:
      v7 = v2;
      objc_msgSend((id)v3, "result");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDPromiseObserver notifyResolvedWithValue:](v7, "notifyResolvedWithValue:", v6);
      goto LABEL_7;
    case 0:
      v7 = v2;
      objc_msgSend(*(id *)(v3 + 8), "addObject:", v2);
LABEL_8:
      v2 = v7;
      break;
  }

}

uint64_t __31__ASDPromise_resolveWithValue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Promises may only be resolved once!"));
  +[ASDPromiseResult resultWithValue:](ASDPromiseResult, "resultWithValue:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "notifyResolvedWithValue:", *(_QWORD *)(a1 + 40), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

uint64_t __42__ASDPromise__invokeExecutor_onScheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolveWithValue:", a2);
}

uint64_t __40__ASDPromise_alwaysPerform_onScheduler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__ASDPromise_completionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "resolveWithValue:", a2);
  else
    return objc_msgSend(v2, "rejectWithError:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)resolveWithValue:(id)a3
{
  id v4;
  NSRecursiveLock *stateLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateLock = self->_stateLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__ASDPromise_resolveWithValue___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  ASDWithLock(stateLock, v7);

}

+ (ASDPromise)promiseWithValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:", v4);

  return (ASDPromise *)v5;
}

+ (ASDPromise)promiseWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithError:", v4);

  return (ASDPromise *)v5;
}

- (ASDPromise)initWithValue:(id)a3
{
  void *v4;
  ASDPromise *v5;

  +[ASDPromiseResult resultWithValue:](ASDPromiseResult, "resultWithValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (ASDPromise *)-[ASDPromise initWithState:result:]((id *)&self->super.isa, (void *)1, v4);

  return v5;
}

- (ASDPromise)initWithError:(id)a3
{
  void *v4;
  ASDPromise *v5;

  +[ASDPromiseResult resultWithError:](ASDPromiseResult, "resultWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (ASDPromise *)-[ASDPromise initWithState:result:]((id *)&self->super.isa, (void *)2, v4);

  return v5;
}

- (BOOL)isResolved
{
  NSRecursiveLock *stateLock;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateLock = self->_stateLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__ASDPromise_isResolved__block_invoke;
  v5[3] = &unk_1E37BDC70;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(stateLock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__ASDPromise_isResolved__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16) != 0;
  return result;
}

uint64_t __40__ASDPromise_alwaysPerform_onScheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)catchError:(id)a3 onScheduler:(id)a4
{
  -[ASDPromise thenPerform:orCatchError:onScheduler:](self, "thenPerform:orCatchError:onScheduler:", &__block_literal_global_26, a3, a4);
}

- (id)mapUsingTransformer:(id)a3 onScheduler:(id)a4
{
  id v6;
  ASDSyncTaskScheduler *v7;
  ASDPromise *v8;
  uint64_t v9;
  ASDPromise *v10;
  id v11;
  ASDPromise *v12;
  ASDPromise *v13;
  _QWORD v15[4];
  ASDPromise *v16;
  _QWORD v17[4];
  ASDPromise *v18;
  id v19;

  v6 = a3;
  v7 = (ASDSyncTaskScheduler *)a4;
  v8 = objc_alloc_init(ASDPromise);
  if (!v7)
    v7 = objc_alloc_init(ASDSyncTaskScheduler);
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__ASDPromise_mapUsingTransformer_onScheduler___block_invoke;
  v17[3] = &unk_1E37BF7E0;
  v19 = v6;
  v18 = v8;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __46__ASDPromise_mapUsingTransformer_onScheduler___block_invoke_2;
  v15[3] = &unk_1E37BDDB0;
  v10 = v18;
  v16 = v10;
  v11 = v6;
  -[ASDPromise thenPerform:orCatchError:onScheduler:](self, "thenPerform:orCatchError:onScheduler:", v17, v15, v7);
  v12 = v16;
  v13 = v10;

  return v13;
}

void __46__ASDPromise_mapUsingTransformer_onScheduler___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolveWithValue:", v2);

}

uint64_t __46__ASDPromise_mapUsingTransformer_onScheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", a2);
}

- (id)flatMapUsingTransformer:(id)a3 onScheduler:(id)a4
{
  id v6;
  ASDSyncTaskScheduler *v7;
  ASDPromise *v8;
  uint64_t v9;
  ASDPromise *v10;
  ASDSyncTaskScheduler *v11;
  id v12;
  ASDPromise *v13;
  ASDPromise *v14;
  _QWORD v16[4];
  ASDPromise *v17;
  _QWORD v18[4];
  ASDPromise *v19;
  ASDSyncTaskScheduler *v20;
  id v21;

  v6 = a3;
  v7 = (ASDSyncTaskScheduler *)a4;
  v8 = objc_alloc_init(ASDPromise);
  if (!v7)
    v7 = objc_alloc_init(ASDSyncTaskScheduler);
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke;
  v18[3] = &unk_1E37BFC28;
  v21 = v6;
  v19 = v8;
  v20 = v7;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_4;
  v16[3] = &unk_1E37BDDB0;
  v10 = v19;
  v17 = v10;
  v11 = v7;
  v12 = v6;
  -[ASDPromise thenPerform:orCatchError:onScheduler:](self, "thenPerform:orCatchError:onScheduler:", v18, v16, v11);
  v13 = v17;
  v14 = v10;

  return v14;
}

void __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_2;
  v6[3] = &unk_1E37BFC00;
  v7 = *(id *)(a1 + 32);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_3;
  v4[3] = &unk_1E37BDDB0;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "thenPerform:orCatchError:onScheduler:", v6, v4, *(_QWORD *)(a1 + 40));

}

uint64_t __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolveWithValue:", a2);
}

uint64_t __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", a2);
}

uint64_t __50__ASDPromise_flatMapUsingTransformer_onScheduler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", a2);
}

- (id)joinWithPromise:(id)a3
{
  id v4;
  ASDPromise *v5;
  uint64_t v6;
  ASDPromise *v7;
  id v8;
  void *v9;
  ASDPromise *v10;
  ASDPromise *v11;
  _QWORD v13[4];
  ASDPromise *v14;
  _QWORD v15[4];
  id v16;
  ASDPromise *v17;

  v4 = a3;
  v5 = objc_alloc_init(ASDPromise);
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __30__ASDPromise_joinWithPromise___block_invoke;
  v15[3] = &unk_1E37BFC50;
  v16 = v4;
  v17 = v5;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __30__ASDPromise_joinWithPromise___block_invoke_4;
  v13[3] = &unk_1E37BDDB0;
  v7 = v17;
  v14 = v7;
  v8 = v4;
  v9 = (void *)objc_opt_new();
  -[ASDPromise thenPerform:orCatchError:onScheduler:](self, "thenPerform:orCatchError:onScheduler:", v15, v13, v9);

  v10 = v14;
  v11 = v7;

  return v11;
}

void __30__ASDPromise_joinWithPromise___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__ASDPromise_joinWithPromise___block_invoke_2;
  v10[3] = &unk_1E37BFC50;
  v5 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v3;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __30__ASDPromise_joinWithPromise___block_invoke_3;
  v8[3] = &unk_1E37BDDB0;
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "thenPerform:orCatchError:onScheduler:", v10, v8, v7);

}

void __30__ASDPromise_joinWithPromise___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v6[0] = *(_QWORD *)(a1 + 40);
  v6[1] = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveWithValue:", v5);

}

uint64_t __30__ASDPromise_joinWithPromise___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", a2);
}

uint64_t __30__ASDPromise_joinWithPromise___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", a2);
}

- (void)rejectWithError:(id)a3
{
  id v4;
  NSRecursiveLock *stateLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateLock = self->_stateLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__ASDPromise_rejectWithError___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  ASDWithLock(stateLock, v7);

}

uint64_t __30__ASDPromise_rejectWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Promises may only be resolved once!"));
  +[ASDPromiseResult resultWithError:](ASDPromiseResult, "resultWithError:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 2;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "notifyRejectedWithError:", *(_QWORD *)(a1 + 40), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

uint64_t __42__ASDPromise__invokeExecutor_onScheduler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", a2);
}

- (ASDPromiseResult)result
{
  return (ASDPromiseResult *)objc_getProperty(self, a2, 32, 1);
}

@end
