@implementation CNFuture

uint64_t __38__CNFuture_addFailureBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __38__CNFuture_addFailureBlock_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CNFuture_addFailureBlock_scheduler___block_invoke_2;
  v7[3] = &unk_1E29B8D88;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

uint64_t __38__CNFuture_addSuccessBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __48__CNFuture_recover_withBlock_schedulerProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calculationDependencies, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

void __48__CNFuture_flatMap_withBlock_schedulerProvider___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "finishPromise:withFuture:", *(_QWORD *)(a1 + 32), v3);
  objc_msgSend(*(id *)(a1 + 32), "future");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCalculationDependency:", v3);

}

- (id)result:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFuture resultBeforeDate:error:](self, "resultBeforeDate:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  return (id)-[CNFutureImpl resultBeforeDate:error:](self->_impl, "resultBeforeDate:error:", a3, a4);
}

- (CNFuture)initWithSchedulerProvider:(id)a3
{
  id v4;
  _CNBlockFutureImpl *v5;
  CNFuture *v6;

  v4 = a3;
  v5 = -[_CNBlockFutureImpl initWithSchedulerProvider:]([_CNBlockFutureImpl alloc], "initWithSchedulerProvider:", v4);

  v6 = -[CNFuture initWithImpl:](self, "initWithImpl:", v5);
  return v6;
}

- (CNFuture)initWithImpl:(id)a3
{
  id v5;
  CNFuture *v6;
  CNFuture *v7;
  NSMutableArray *v8;
  NSMutableArray *calculationDependencies;
  CNFuture *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNFuture;
  v6 = -[CNFuture init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    calculationDependencies = v7->_calculationDependencies;
    v7->_calculationDependencies = v8;

    v10 = v7;
  }

  return v7;
}

- (void)addSuccessBlock:(id)a3 scheduler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__CNFuture_addSuccessBlock_scheduler___block_invoke;
  v10[3] = &unk_1E29BAB48;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[CNFuture addSuccessBlock:](self, "addSuccessBlock:", v10);

}

- (void)addFailureBlock:(id)a3 scheduler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__CNFuture_addFailureBlock_scheduler___block_invoke;
  v10[3] = &unk_1E29BA9C8;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[CNFuture addFailureBlock:](self, "addFailureBlock:", v10);

}

+ (void)finishPromise:(id)a3 withFuture:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__CNFuture_finishPromise_withFuture___block_invoke;
  v12[3] = &unk_1E29BA8B8;
  v7 = v5;
  v13 = v7;
  v8 = a4;
  objc_msgSend(v8, "addSuccessBlock:", v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __37__CNFuture_finishPromise_withFuture___block_invoke_2;
  v10[3] = &unk_1E29B9558;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "addFailureBlock:", v10);

}

- (void)addSuccessBlock:(id)a3
{
  -[CNFutureImpl addSuccessBlock:](self->_impl, "addSuccessBlock:", a3);
}

- (void)addFailureBlock:(id)a3
{
  -[CNFutureImpl addFailureBlock:](self->_impl, "addFailureBlock:", a3);
}

+ (id)flatMap:(id)a3 withBlock:(id)a4 schedulerProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNPromise *v11;
  uint64_t v12;
  CNPromise *v13;
  id v14;
  CNPromise *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  CNPromise *v22;
  _QWORD v23[4];
  CNPromise *v24;
  id v25;
  id v26;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[CNPromise initWithSchedulerProvider:]([CNPromise alloc], "initWithSchedulerProvider:", v9);

  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __48__CNFuture_flatMap_withBlock_schedulerProvider___block_invoke;
  v23[3] = &unk_1E29BBBB0;
  v25 = v8;
  v26 = a1;
  v13 = v11;
  v24 = v13;
  v14 = v8;
  objc_msgSend(v10, "addSuccessBlock:", v23);
  v18 = v12;
  v19 = 3221225472;
  v20 = __48__CNFuture_flatMap_withBlock_schedulerProvider___block_invoke_2;
  v21 = &unk_1E29B9558;
  v22 = v13;
  v15 = v13;
  objc_msgSend(v10, "addFailureBlock:", &v18);
  -[CNPromise future](v15, "future", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addCalculationDependency:", v10);

  return v16;
}

- (void)addCalculationDependency:(id)a3
{
  -[NSMutableArray addObject:](self->_calculationDependencies, "addObject:", a3);
}

uint64_t __37__CNFuture_finishPromise_withFuture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __38__CNFuture_addSuccessBlock_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CNFuture_addSuccessBlock_scheduler___block_invoke_2;
  v7[3] = &unk_1E29B8D88;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v7);

}

+ (CNFuture)futureWithResult:(id)a3
{
  id v4;
  _CNConstantFutureImpl *v5;
  void *v6;

  v4 = a3;
  v5 = -[_CNConstantFutureImpl initWithResult:]([_CNConstantFutureImpl alloc], "initWithResult:", v4);

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImpl:", v5);
  return (CNFuture *)v6;
}

- (BOOL)finishWithResult:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;

  v4 = a3;
  if (!v4)
  {
    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CNFuture finishWithResult:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);

    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CNFuture finishWithResult:].cold.1();

    CNFutureThrowProtocolExceptionWithReason(CFSTR("result must be non-nil"), 0);
  }
  v14 = -[CNFuture finishWithResult:error:](self, "finishWithResult:error:", v4, 0);

  return v14;
}

- (BOOL)finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;

  v4 = a3;
  if (!v4)
  {
    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CNFuture finishWithError:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);

    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CNFuture finishWithResult:].cold.1();

    CNFutureThrowProtocolExceptionWithReason(CFSTR("error must be non-nil"), 0);
  }
  v14 = -[CNFuture finishWithResult:error:](self, "finishWithResult:error:", 0, v4);

  return v14;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return -[CNFutureImpl finishWithResult:error:](self->_impl, "finishWithResult:error:", a3, a4);
}

void __56__CNFuture_futureWithBlock_scheduler_schedulerProvider___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  v5 = 0;
  (*(void (**)(void))(v2 + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v3, v4);

}

- (id)flatMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFuture flatMap:schedulerProvider:](self, "flatMap:schedulerProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)flatMap:(id)a3 schedulerProvider:(id)a4
{
  return +[CNFuture flatMap:withBlock:schedulerProvider:](CNFuture, "flatMap:withBlock:schedulerProvider:", self, a3, a4);
}

uint64_t __37__CNFuture_finishPromise_withFuture___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

- (BOOL)isFinished
{
  return -[CNFutureImpl isFinished](self->_impl, "isFinished");
}

+ (CNFuture)futureWithError:(id)a3
{
  id v4;
  _CNFailedFutureImpl *v5;
  void *v6;

  v4 = a3;
  v5 = -[_CNFailedFutureImpl initWithError:]([_CNFailedFutureImpl alloc], "initWithError:", v4);

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImpl:", v5);
  return (CNFuture *)v6;
}

+ (CNFuture)futureWithBlock:(id)a3 scheduler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "futureWithBlock:scheduler:schedulerProvider:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNFuture *)v9;
}

+ (CNFuture)futureWithBlock:(id)a3 scheduler:(id)a4 schedulerProvider:(id)a5
{
  id v6;
  id v7;
  CNPromise *v8;
  CNPromise *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  CNPromise *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CNPromise);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __56__CNFuture_futureWithBlock_scheduler_schedulerProvider___block_invoke;
  v16 = &unk_1E29B8D88;
  v17 = v8;
  v18 = v6;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v7, "performBlock:", &v13);

  -[CNPromise future](v9, "future", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNFuture *)v11;
}

+ (id)lazyFutureWithBlock:(id)a3
{
  void *v4;
  void *v5;

  +[_CNBlockFutureImpl lazyImplWithBlock:](_CNBlockFutureImpl, "lazyImplWithBlock:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImpl:", v4);

  return v5;
}

- (id)recover:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFuture recover:schedulerProvider:](self, "recover:schedulerProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)recover:(id)a3 schedulerProvider:(id)a4
{
  return +[CNFuture recover:withBlock:schedulerProvider:](CNFuture, "recover:withBlock:schedulerProvider:", self, a3, a4);
}

+ (id)recover:(id)a3 withBlock:(id)a4 schedulerProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNPromise *v11;
  uint64_t v12;
  CNPromise *v13;
  CNPromise *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  CNPromise *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  CNPromise *v26;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[CNPromise initWithSchedulerProvider:]([CNPromise alloc], "initWithSchedulerProvider:", v9);

  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __48__CNFuture_recover_withBlock_schedulerProvider___block_invoke;
  v25[3] = &unk_1E29BA8B8;
  v13 = v11;
  v26 = v13;
  objc_msgSend(v10, "addSuccessBlock:", v25);
  v18 = v12;
  v19 = 3221225472;
  v20 = __48__CNFuture_recover_withBlock_schedulerProvider___block_invoke_2;
  v21 = &unk_1E29BBBD8;
  v23 = v8;
  v24 = a1;
  v22 = v13;
  v14 = v13;
  v15 = v8;
  objc_msgSend(v10, "addFailureBlock:", &v18);
  -[CNPromise future](v14, "future", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addCalculationDependency:", v10);

  return v16;
}

void __48__CNFuture_recover_withBlock_schedulerProvider___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "finishPromise:withFuture:", *(_QWORD *)(a1 + 32), v2);

}

+ (id)join:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 == 1)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNFuture _joinOne:](CNFuture, "_joinOne:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v4)
      +[CNFuture _joinMany:](CNFuture, "_joinMany:", v3);
    else
      +[CNFuture _joinZero](CNFuture, "_joinZero");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_joinOne:(id)a3
{
  return (id)objc_msgSend(a3, "flatMap:", &__block_literal_global_64);
}

id __21__CNFuture__joinOne___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNFuture futureWithResult:](CNFuture, "futureWithResult:", v4, v7, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)promiseFuture
{
  return objc_alloc_init((Class)a1);
}

+ (id)future
{
  return objc_alloc_init((Class)a1);
}

+ (CNFuture)futureWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "futureWithBlock:schedulerProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNFuture *)v6;
}

+ (CNFuture)futureWithBlock:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "futureWithBlock:scheduler:schedulerProvider:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNFuture *)v9;
}

uint64_t __48__CNFuture_flatMap_withBlock_schedulerProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

+ (id)chain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_tail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v6))
  {
    v7 = v5;
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __18__CNFuture_chain___block_invoke;
    v16[3] = &unk_1E29BBC00;
    v18 = a1;
    v9 = v6;
    v17 = v9;
    objc_msgSend(v5, "flatMap:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __18__CNFuture_chain___block_invoke_2;
    v13[3] = &unk_1E29BBC28;
    v15 = a1;
    v14 = v9;
    objc_msgSend(v10, "recover:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v11;
  }

  return v7;
}

id __18__CNFuture_chain___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = CNIsNull_block_invoke_5((uint64_t)&__block_literal_global_5_4, v3);
  v5 = *(void **)(a1 + 40);
  if (v4)
    objc_msgSend(v5, "chain:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v5, "futureWithResult:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __18__CNFuture_chain___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "chain:", *(_QWORD *)(a1 + 32));
}

+ (id)sequence:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v3))
  {
    +[CNFuture futureWithResult:](CNFuture, "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = v3;
    objc_msgSend(v3, "_cn_tail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v24;
      do
      {
        v12 = 0;
        v13 = v6;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v7);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
          v20[0] = v9;
          v20[1] = 3221225472;
          v20[2] = __21__CNFuture_sequence___block_invoke;
          v20[3] = &unk_1E29BBC50;
          v21 = v5;
          v22 = v14;
          objc_msgSend(v13, "flatMap:", v20);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          ++v12;
          v13 = v6;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __21__CNFuture_sequence___block_invoke_2;
    v18[3] = &unk_1E29BBC78;
    v19 = v5;
    v15 = v5;
    objc_msgSend(v6, "flatMap:", v18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v17;
  }

  return v4;
}

id __21__CNFuture_sequence___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return *(id *)(a1 + 40);
}

CNFuture *__21__CNFuture_sequence___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return +[CNFuture futureWithResult:](CNFuture, "futureWithResult:", *(_QWORD *)(a1 + 32));
}

+ (id)_joinZero
{
  return +[CNFuture futureWithResult:](CNFuture, "futureWithResult:", MEMORY[0x1E0C9AA60]);
}

+ (id)_joinMany:(id)a3
{
  id v3;
  CNPromise *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  CNPromise *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  CNPromise *v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(CNPromise);
  +[CNScheduler synchronousSerialDispatchQueueWithName:](CNScheduler, "synchronousSerialDispatchQueueWithName:", CFSTR("com.apple.contacts.future.join"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "mutableCopy");
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __22__CNFuture__joinMany___block_invoke;
  v23[3] = &unk_1E29BBD10;
  v8 = v6;
  v24 = v8;
  v9 = v7;
  v25 = v9;
  v10 = v4;
  v26 = v10;
  v11 = v5;
  v27 = v11;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v23);
  -[CNPromise future](v10, "future");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v12, "addCalculationDependency:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++), (_QWORD)v19);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v15);
  }

  return v12;
}

void __22__CNFuture__joinMany___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18[2];
  id location;

  v5 = a2;
  v6 = a1[4];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_initWeak(&location, v5);
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __22__CNFuture__joinMany___block_invoke_2;
  v14[3] = &unk_1E29BBCC0;
  objc_copyWeak(v18, &location);
  v15 = a1[5];
  v16 = a1[4];
  v18[1] = a3;
  v17 = a1[6];
  objc_msgSend(v5, "addSuccessBlock:scheduler:", v14, a1[7]);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __22__CNFuture__joinMany___block_invoke_3;
  v9[3] = &unk_1E29BBCE8;
  v10 = a1[7];
  objc_copyWeak(&v13, &location);
  v11 = a1[5];
  v12 = a1[6];
  objc_msgSend(v5, "addFailureBlock:", v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

void __22__CNFuture__joinMany___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", WeakRetained);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 64), v6);
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v5);
    if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, *(void **)(a1 + 32)))
      objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 40));
  }

}

void __22__CNFuture__joinMany___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __22__CNFuture__joinMany___block_invoke_4;
  v15[3] = &unk_1E29BA6D0;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  v16 = *(id *)(a1 + 40);
  v6 = v4;
  v17 = v6;
  objc_msgSend(v5, "performBlock:", v15);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "cancel", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
  objc_destroyWeak(&v18);

}

void __22__CNFuture__joinMany___block_invoke_4(id *a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = objc_msgSend(a1[4], "indexOfObject:");
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1[4], "removeObjectAtIndex:", v2);
    objc_msgSend(a1[5], "setArray:", a1[4]);
    objc_msgSend(a1[4], "removeAllObjects");
  }

}

- (CNFuture)init
{
  void *v3;
  CNFuture *v4;

  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNFuture initWithSchedulerProvider:](self, "initWithSchedulerProvider:", v3);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFutureImpl updateDescriptionWithBuilder:](self->_impl, "updateDescriptionWithBuilder:", v3);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFuture resultBeforeDate:error:](self, "resultBeforeDate:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isCancelled
{
  return -[CNFutureImpl isCancelled](self->_impl, "isCancelled");
}

- (BOOL)cancel
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CNFutureImpl cancel](self->_impl, "cancel");
  else
    return 1;
}

- (id)completionHandlerAdapterWithDefaultValue:(id)a3
{
  return CNPromiseCompletionHandlerWithDefaultValue(self, a3);
}

- (void)_flushCompletionBlocks
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNFutureImpl _flushCompletionBlocks](self->_impl, "_flushCompletionBlocks");
}

- (void)finishWithResult:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_18F80C000, v1, v2, "Call stack: %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)finishWithResult:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F80C000, a1, a3, "A promise was finished with a nil result", a5, a6, a7, a8, 0);
}

- (void)finishWithError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F80C000, a1, a3, "A promise was finished with a nil error", a5, a6, a7, a8, 0);
}

@end
