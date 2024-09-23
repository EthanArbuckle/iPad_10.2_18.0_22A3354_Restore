@implementation AMSBinaryPromise

uint64_t __36__AMSBinaryPromise_addSuccessBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __34__AMSBinaryPromise_promiseAdapter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

uint64_t __34__AMSBinaryPromise_promiseAdapter__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __35__AMSBinaryPromise_addFinishBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "BOOLValue"), v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingPromise, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
}

uint64_t __35__AMSBinaryPromise_promiseWithAll___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "promiseAdapter");
}

+ (id)promiseWithSuccess
{
  id v3;
  void *v4;
  id v5;

  if ((id)objc_opt_class() == a1)
  {
    if (_MergedGlobals_86 != -1)
      dispatch_once(&_MergedGlobals_86, &__block_literal_global_10_0);
    v5 = (id)qword_1ECEACFE8;
  }
  else
  {
    v3 = objc_alloc((Class)a1);
    +[AMSFinishedPromise promiseWithResult:](AMSFinishedPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "initWithBackingPromise:", v4);

  }
  return v5;
}

- (AMSBinaryPromise)init
{
  AMSMutablePromise *v3;
  AMSBinaryPromise *v4;

  v3 = objc_alloc_init(AMSMutablePromise);
  v4 = -[AMSBinaryPromise initWithBackingPromise:](self, "initWithBackingPromise:", v3);

  return v4;
}

- (id)promiseAdapter
{
  AMSMutablePromise *v3;
  uint64_t v4;
  AMSMutablePromise *v5;
  AMSMutablePromise *v6;
  AMSMutablePromise *v7;
  AMSMutablePromise *v8;
  _QWORD v10[4];
  AMSMutablePromise *v11;
  _QWORD v12[4];
  AMSMutablePromise *v13;

  v3 = objc_alloc_init(AMSMutablePromise);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__AMSBinaryPromise_promiseAdapter__block_invoke;
  v12[3] = &unk_1E253DBD8;
  v5 = v3;
  v13 = v5;
  -[AMSBinaryPromise addSuccessBlock:](self, "addSuccessBlock:", v12);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __34__AMSBinaryPromise_promiseAdapter__block_invoke_2;
  v10[3] = &unk_1E253E120;
  v6 = v5;
  v11 = v6;
  -[AMSBinaryPromise addErrorBlock:](self, "addErrorBlock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

- (void)addSuccessBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__AMSBinaryPromise_addSuccessBlock___block_invoke;
  v7[3] = &unk_1E253F458;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addSuccessBlock:", v7);

}

- (void)addErrorBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addErrorBlock:", v4);

}

- (AMSMutablePromise)backingPromise
{
  return self->_backingPromise;
}

- (BOOL)finishWithSuccess
{
  return +[AMSMutableBinaryPromise finishPromise:withSuccess:](AMSMutableBinaryPromise, "finishPromise:withSuccess:", self, 1);
}

+ (id)promiseWithAll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "binaryPromiseAdapterForClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addFinishBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__AMSBinaryPromise_addFinishBlock___block_invoke;
  v7[3] = &unk_1E253F430;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addFinishBlock:", v7);

}

BOOL __44__AMSBinaryPromise_completionHandlerAdapter__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
    return +[AMSMutableBinaryPromise finishPromise:withSuccess:](AMSMutableBinaryPromise, "finishPromise:withSuccess:", v4, 1);
  else
    return +[AMSMutableBinaryPromise finishPromise:withError:](AMSMutableBinaryPromise, "finishPromise:withError:", v4, a3);
}

- (BOOL)resultWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = v5 != 0;

  return (char)a3;
}

- (id)completionHandlerAdapter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__AMSBinaryPromise_completionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E253F570;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (AMSBinaryPromise)initWithBackingPromise:(id)a3
{
  id v5;
  AMSBinaryPromise *v6;
  AMSBinaryPromise *v7;
  AMSBinaryPromise *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSBinaryPromise;
  v6 = -[AMSBinaryPromise init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingPromise, a3);
    if (objc_msgSend(v5, "isFinished"))
      v8 = 0;
    else
      v8 = v7;
    objc_storeStrong((id *)&v7->_retainedSelf, v8);
  }

  return v7;
}

+ (id)promiseWithAny:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_2_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAny:](AMSPromise, "promiseWithAny:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "binaryPromiseAdapterForClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __35__AMSBinaryPromise_promiseWithAny___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "promiseAdapter");
}

+ (id)promiseWithError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  +[AMSFinishedPromise promiseWithError:](AMSFinishedPromise, "promiseWithError:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithBackingPromise:", v6);
  return v7;
}

+ (id)promiseWithFlattenedPromises:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "binaryPromiseAdapterForClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __49__AMSBinaryPromise_promiseWithFlattenedPromises___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "promiseAdapter");
}

+ (id)promiseWithPromise:(id)a3
{
  id v3;
  AMSMutableBinaryPromise *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a3;
  v4 = objc_alloc_init(AMSMutableBinaryPromise);
  objc_initWeak(&location, v4);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__AMSBinaryPromise_promiseWithPromise___block_invoke;
  v9[3] = &unk_1E253F3E0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "addSuccessBlock:", v9);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __39__AMSBinaryPromise_promiseWithPromise___block_invoke_2;
  v7[3] = &unk_1E253F408;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "addErrorBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v4;
}

void __39__AMSBinaryPromise_promiseWithPromise___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishWithSuccess");

}

void __39__AMSBinaryPromise_promiseWithPromise___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "finishWithError:", v3);

}

void __38__AMSBinaryPromise_promiseWithSuccess__block_invoke()
{
  AMSBinaryPromise *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [AMSBinaryPromise alloc];
  +[AMSFinishedPromise promiseWithResult:](AMSFinishedPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[AMSBinaryPromise initWithBackingPromise:](v0, "initWithBackingPromise:", v3);
  v2 = (void *)qword_1ECEACFE8;
  qword_1ECEACFE8 = v1;

}

- (void)resultWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "promiseWithTimeout:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__AMSBinaryPromise_resultWithTimeout_completion___block_invoke;
  v14[3] = &unk_1E253F480;
  v10 = v6;
  v15 = v10;
  objc_msgSend(v8, "addErrorBlock:", v14);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __49__AMSBinaryPromise_resultWithTimeout_completion___block_invoke_2;
  v12[3] = &unk_1E253F4A8;
  v13 = v10;
  v11 = v10;
  objc_msgSend(v8, "addSuccessBlock:", v12);

}

uint64_t __49__AMSBinaryPromise_resultWithTimeout_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__AMSBinaryPromise_resultWithTimeout_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)resultWithTimeout:(double)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultWithTimeout:error:", a4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = v7 != 0;

  return (char)a4;
}

- (void)waitUntilFinished
{
  id v2;

  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilFinished");

}

- (void)waitUntilFinishedWithTimeout:(double)a3
{
  id v4;

  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitUntilFinishedWithTimeout:", a3);

}

- (void)stopRetainingSelf
{
  AMSBinaryPromise *v3;

  v3 = self;
  os_unfair_lock_lock_with_options();
  -[AMSBinaryPromise setRetainedSelf:](v3, "setRetainedSelf:", 0);
  os_unfair_lock_unlock(&self->_backingPromise->super._stateLock);

}

- (id)catchWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__AMSBinaryPromise_catchWithBlock___block_invoke;
  v10[3] = &unk_1E253F4D0;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "catchWithBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "binaryPromiseAdapterForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __35__AMSBinaryPromise_catchWithBlock___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "promiseAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)catchWithPromiseBlock:(id)a3 successValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__AMSBinaryPromise_catchWithPromiseBlock_successValue___block_invoke;
  v13[3] = &unk_1E253F4F8;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "continueWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __55__AMSBinaryPromise_catchWithPromiseBlock_successValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if (objc_msgSend(a2, "BOOLValue"))
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 32));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)continueWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__AMSBinaryPromise_continueWithBlock___block_invoke;
  v10[3] = &unk_1E253F520;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "continueWithBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "binaryPromiseAdapterForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __38__AMSBinaryPromise_continueWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v5, "BOOLValue");
  else
    v8 = 0;
  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "promiseAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)continueWithPromiseBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__AMSBinaryPromise_continueWithPromiseBlock___block_invoke;
  v9[3] = &unk_1E253F520;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "continueWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __45__AMSBinaryPromise_continueWithPromiseBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "BOOLValue"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)thenWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__AMSBinaryPromise_thenWithBlock___block_invoke;
  v10[3] = &unk_1E253F548;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "thenWithBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "binaryPromiseAdapterForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __34__AMSBinaryPromise_thenWithBlock___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "promiseAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)thenWithPromiseBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[AMSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__AMSBinaryPromise_thenWithPromiseBlock___block_invoke;
  v9[3] = &unk_1E253F548;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __41__AMSBinaryPromise_thenWithPromiseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (AMSBinaryPromise)retainedSelf
{
  return self->_retainedSelf;
}

- (void)setRetainedSelf:(id)a3
{
  objc_storeStrong((id *)&self->_retainedSelf, a3);
}

- (BOOL)cancel
{
  return +[AMSMutableBinaryPromise cancelPromise:](AMSMutableBinaryPromise, "cancelPromise:", self);
}

- (BOOL)finishWithError:(id)a3
{
  return +[AMSMutableBinaryPromise finishPromise:withError:](AMSMutableBinaryPromise, "finishPromise:withError:", self, a3);
}

- (BOOL)finishWithPromise:(id)a3
{
  return +[AMSMutableBinaryPromise finishPromise:withPromise:](AMSMutableBinaryPromise, "finishPromise:withPromise:", self, a3);
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  return +[AMSMutableBinaryPromise finishPromise:withSuccess:error:](AMSMutableBinaryPromise, "finishPromise:withSuccess:error:", self, a3, a4);
}

@end
