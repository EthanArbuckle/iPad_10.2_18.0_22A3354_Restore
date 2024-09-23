@implementation HMFFuture

+ (id)futureWithValue:(id)a3
{
  id v3;
  HMFFulfilledFuture *v4;

  v3 = a3;
  if (v3)
  {
    v4 = [HMFFulfilledFuture alloc];
    -[HMFFulfilledFuture initWithValue:]((id *)&v4->super.super.isa, v3);
  }
  else
  {
    +[HMFFuture _futureWithNilValue]();
    v4 = (HMFFulfilledFuture *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)_futureWithNilValue
{
  objc_opt_self();
  if (_MergedGlobals_55 != -1)
    dispatch_once(&_MergedGlobals_55, &__block_literal_global_2);
  return (id)qword_1ED0130E8;
}

+ (id)futureWithError:(id)a3
{
  id v3;
  HMFRejectedFuture *v4;

  v3 = a3;
  if (v3)
  {
    v4 = [HMFRejectedFuture alloc];
    -[HMFRejectedFuture initWithError:]((id *)&v4->super.super.isa, v3);
  }
  else
  {
    objc_opt_self();
    if (qword_1ED0130F0 != -1)
      dispatch_once(&qword_1ED0130F0, &__block_literal_global_3);
    v4 = (HMFRejectedFuture *)(id)qword_1ED0130F8;
  }

  return v4;
}

void __32__HMFFuture__futureWithNilValue__block_invoke()
{
  id *v0;
  void *v1;

  v0 = -[HMFFulfilledFuture initWithValue:]((id *)[HMFFulfilledFuture alloc], 0);
  v1 = (void *)qword_1ED0130E8;
  qword_1ED0130E8 = (uint64_t)v0;

}

void __40__HMFFuture__futureWithUnspecifiedError__block_invoke()
{
  HMFRejectedFuture *v0;
  void *v1;
  id v2;

  v0 = [HMFRejectedFuture alloc];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfUnspecifiedError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMFRejectedFuture initWithError:]((id *)&v0->super.super.isa, v2);
  v1 = (void *)qword_1ED0130F8;
  qword_1ED0130F8 = (uint64_t)v0;

}

+ (id)_futureWithOutcome:(void *)a3
{
  id v5;
  void *v6;

  objc_opt_self();
  switch(a2)
  {
    case 1:
      +[HMFFuture futureWithValue:](HMFFuture, "futureWithValue:", a3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[HMFFuture futureWithError:](HMFFuture, "futureWithError:", a3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      v5 = a3;
      break;
    default:
      v6 = 0;
      goto LABEL_9;
  }
  v6 = v5;
LABEL_9:

  return v6;
}

+ (id)futureWithPromise:(id *)a3
{
  return (id)-[HMFAsyncFuture initWithPromise:]((uint64_t)[HMFAsyncFuture alloc], a3);
}

+ (id)inContext:(id)a3 perform:(id)a4
{
  id v5;
  id v6;
  HMFAsyncFuture *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  void *v15;

  v5 = a4;
  v15 = 0;
  v6 = a3;
  v7 = [HMFAsyncFuture alloc];
  -[HMFAsyncFuture initWithPromise:]((uint64_t)v7, &v15);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __31__HMFFuture_inContext_perform___block_invoke;
  v12[3] = &unk_1E3B37D38;
  v8 = v15;
  v13 = v15;
  v14 = v5;
  v9 = v5;
  v10 = v8;
  objc_msgSend(v6, "performBlock:", v12);

  return v7;
}

void __31__HMFFuture_inContext_perform___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v1)
    -[HMFPromise resolveWithOutcome:](v1, v2, v3);
  else

}

+ (HMFAsyncFuture)_inContext:(void *)a3 transform:(void *)a4 with:
{
  id v6;
  id v7;
  id v8;
  HMFAsyncFuture *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = a2;
  objc_opt_self();
  v19 = 0;
  v9 = [HMFAsyncFuture alloc];
  -[HMFAsyncFuture initWithPromise:]((uint64_t)v9, &v19);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__HMFFuture__inContext_transform_with___block_invoke;
  v15[3] = &unk_1E3B37D60;
  v10 = v19;
  v17 = v6;
  v18 = v7;
  v16 = v19;
  v11 = v6;
  v12 = v7;
  v13 = v10;
  objc_msgSend(v8, "performBlock:", v15);

  return v9;
}

void __39__HMFFuture__inContext_transform_with___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1[4];
  v2 = (*(uint64_t (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[5]);
  if (v1)
    -[HMFPromise resolveWithOutcome:](v1, v2, v3);
  else

}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HMFFuture isPending](self, "isPending");
  v5 = CFSTR("settled");
  if (v4)
    v5 = CFSTR("pending");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMFFuture %p (%@)>"), self, v5);
}

- (BOOL)isPending
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (_HMFFutureBlockOutcome)outcomeIfSettled
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)getResultWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)then:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)recover:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)then:(id)a3 orRecover:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (id)inContext:(id)a3 then:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (id)inContext:(id)a3 recover:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (id)inContext:(id)a3 then:(id)a4 orRecover:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

+ (id)futureWithDelay:(double)a3
{
  __objc2_class *v3;

  v3 = HMFFuture;
  if (HMFFuture)
  {
    +[HMFFuture futureWithDelay:outcome:](a3, (uint64_t)HMFFuture, 1, 0);
    v3 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)futureWithDelay:(uint64_t)a3 outcome:(void *)a4
{
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  objc_opt_self();
  v16 = 0;
  +[HMFFuture futureWithPromise:](HMFFuture, "futureWithPromise:", &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, (uint64_t)(a1 * 1000000000.0));
  dispatch_get_global_queue(21, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3254779904;
  v12[2] = __46__HMFFuture_Timeout__futureWithDelay_outcome___block_invoke;
  v12[3] = &unk_1E3B37EA0;
  v13 = v16;
  v14 = a3;
  v15 = a4;
  v10 = a4;
  dispatch_after(v8, v9, v12);

  return v7;
}

- (id)timeout:(double)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (_MergedGlobals_58 != -1)
    dispatch_once(&_MergedGlobals_58, &__block_literal_global_5);
  v13[0] = self;
  v5 = (id)qword_1ED013128;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfUnspecifiedError");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  if (HMFFuture)
  {
    +[HMFFuture futureWithDelay:outcome:](a3, (uint64_t)HMFFuture, 2, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v9 = 0;
  }
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMFFuture anySettled:](HMFFuture, "anySettled:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __30__HMFFuture_Timeout__timeout___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED013128;
  qword_1ED013128 = v0;

}

void __46__HMFFuture_Timeout__futureWithDelay_outcome___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  if (v1)
    -[HMFPromise resolveWithOutcome:](v1, v2, v3);
  else

}

+ (id)futureWithNoValue
{
  return +[HMFFuture _futureWithNilValue]();
}

- (id)finally:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __thenBlockForFinallyBlock_block_invoke;
  v14 = &unk_1E3B38430;
  v15 = v4;
  v6 = (void *)MEMORY[0x1A1AC373C](&v11);

  v11 = v5;
  v12 = 3221225472;
  v13 = __recoverBlockForFinallyBlock_block_invoke;
  v14 = &unk_1E3B38458;
  v15 = v4;
  v7 = v4;
  v8 = (void *)MEMORY[0x1A1AC373C](&v11);

  -[HMFFuture then:orRecover:](self, "then:orRecover:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)inContext:(id)a3 finally:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __thenBlockForFinallyBlock_block_invoke;
  v17 = &unk_1E3B38430;
  v18 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x1A1AC373C](&v14);

  v10 = v6;
  v14 = v7;
  v15 = 3221225472;
  v16 = __recoverBlockForFinallyBlock_block_invoke;
  v17 = &unk_1E3B38458;
  v18 = v10;
  v11 = (void *)MEMORY[0x1A1AC373C](&v14);

  -[HMFFuture inContext:then:orRecover:](self, "inContext:then:orRecover:", v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)ignoreErrors
{
  void *v3;
  void *v4;

  HMFCallerAsyncContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFFuture inContext:recover:](self, "inContext:recover:", v3, &__block_literal_global_13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ignoreResult
{
  void *v3;
  void *v4;

  HMFCallerAsyncContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFFuture inContext:then:](self, "inContext:then:", v3, &__block_literal_global_13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ignoreOutcome
{
  void *v3;
  void *v4;

  HMFCallerAsyncContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFFuture inContext:then:orRecover:](self, "inContext:then:orRecover:", v3, &__block_literal_global_13, &__block_literal_global_13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)waitForResult:(id *)a3 orError:(id *)a4 withTimeout:(double)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  dispatch_semaphore_t v15;
  NSObject *v16;
  dispatch_time_t v17;
  _QWORD v19[4];
  NSObject *v20;
  id *v21;
  id *v22;

  v9 = -[HMFFuture outcomeIfSettled](self, "outcomeIfSettled");
  v11 = v10;
  if (v9 == 2)
  {
    v13 = *a3;
    *a3 = 0;

    objc_storeStrong(a4, v11);
    goto LABEL_5;
  }
  if (v9 == 1)
  {
    objc_storeStrong(a3, v10);
    v12 = *a4;
    *a4 = 0;

LABEL_5:
    v14 = 1;
    goto LABEL_10;
  }
  v15 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__HMFFuture_Waiting__waitForResult_orError_withTimeout___block_invoke;
  v19[3] = &unk_1E3B384A8;
  v21 = a3;
  v22 = a4;
  v16 = v15;
  v20 = v16;
  -[HMFFuture getResultWithCompletion:](self, "getResultWithCompletion:", v19);
  if (a5 == 1.79769313e308)
    v17 = -1;
  else
    v17 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  v14 = dispatch_semaphore_wait(v16, v17) == 0;

LABEL_10:
  return v14;
}

void __56__HMFFuture_Waiting__waitForResult_orError_withTimeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void **v7;
  void *v8;
  void **v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void ***)(a1 + 40);
  v8 = *v7;
  *v7 = v5;
  v12 = v5;

  v9 = *(void ***)(a1 + 48);
  v10 = *v9;
  *v9 = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)all:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "copy");
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v24 = 0;
    +[HMFFuture futureWithPromise:](HMFFuture, "futureWithPromise:", &v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = v5;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __30__HMFFuture_Combinators__all___block_invoke;
    v18[3] = &unk_1E3B38FF8;
    v19 = v24;
    v21 = v23;
    v22 = v5;
    v7 = v3;
    v20 = v7;
    v8 = (void *)MEMORY[0x1A1AC373C](v18);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "getResultWithCompletion:", v8, (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
      }
      while (v10);
    }

    _Block_object_dispose(v23, 8);
  }
  else
  {
    +[HMFFuture futureWithValue:](HMFFuture, "futureWithValue:", MEMORY[0x1E0C9AA60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __30__HMFFuture_Combinators__all___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", v6);
  }
  else
  {
    v7 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(_QWORD *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = *(id *)(a1 + 40);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "outcomeIfSettled");
            v16 = v15;
            v17 = v15;
            if (!v15)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v3;
            }
            objc_msgSend(v10, "addObject:", v17);
            if (!v16)

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v12);
      }

      v18 = *(void **)(a1 + 32);
      v19 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v18, "fulfillWithValue:", v19);

    }
  }

}

+ (id)allSettled:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "copy");
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v24 = 0;
    +[HMFFuture futureWithPromise:](HMFFuture, "futureWithPromise:", &v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = v5;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __37__HMFFuture_Combinators__allSettled___block_invoke;
    v18[3] = &unk_1E3B38FF8;
    v21 = v23;
    v22 = v5;
    v7 = v3;
    v19 = v7;
    v20 = v24;
    v8 = (void *)MEMORY[0x1A1AC373C](v18);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "getResultWithCompletion:", v8, (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
      }
      while (v10);
    }

    _Block_object_dispose(v23, 8);
  }
  else
  {
    +[HMFFuture futureWithValue:](HMFFuture, "futureWithValue:", MEMORY[0x1E0C9AA60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __37__HMFFuture_Combinators__allSettled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v6 = a3;
  v7 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  do
  {
    v8 = __ldaxr(v7);
    v9 = v8 - 1;
  }
  while (__stlxr(v9, v7));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = *(id *)(a1 + 32);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "outcomeIfSettled");
          v16 = v15;
          v17 = v15;
          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v3;
          }
          objc_msgSend(v10, "addObject:", v17);
          if (!v16)

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

    v18 = *(void **)(a1 + 40);
    v19 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v18, "fulfillWithValue:", v19);

  }
}

+ (id)any:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "copy");
  v4 = objc_msgSend(v3, "count");
  if (!v4)
    _HMFPreconditionFailure(CFSTR("count >= 1"));
  v5 = v4;
  v24 = 0;
  +[HMFFuture futureWithPromise:](HMFFuture, "futureWithPromise:", &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = v5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __30__HMFFuture_Combinators__any___block_invoke;
  v18[3] = &unk_1E3B38FF8;
  v19 = v24;
  v21 = v23;
  v22 = v5;
  v7 = v3;
  v20 = v7;
  v8 = (void *)MEMORY[0x1A1AC373C](v18);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "getResultWithCompletion:", v8, (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    }
    while (v10);
  }

  _Block_object_dispose(v23, 8);
  return v6;
}

void __30__HMFFuture_Combinators__any___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  const __CFString *v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(_QWORD *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = *(id *)(a1 + 40);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "outcomeIfSettled", (_QWORD)v22);
            v16 = v15;
            objc_msgSend(v10, "addObject:", v15);

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        }
        while (v12);
      }

      v17 = *(void **)(a1 + 32);
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v26 = CFSTR("HMFDetailedErrorsKey");
      v19 = (void *)objc_msgSend(v10, "copy");
      v27 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hmfErrorWithCode:userInfo:", 17, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rejectWithError:", v21);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fulfillWithValue:", v5);
  }

}

+ (id)anySettled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
    _HMFPreconditionFailure(CFSTR("futures.count >= 1"));
  v16 = 0;
  +[HMFFuture futureWithPromise:](HMFFuture, "futureWithPromise:", &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resolverBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "getResultWithCompletion:", v5, (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

  return v4;
}

+ (id)futureForOperation:(id)a3
{
  id v3;
  HMFOperationFutureAdapter *v4;
  HMFOperationFutureAdapter *v5;
  HMFOperationFutureAdapter *v6;
  id v7;
  uint64_t v8;
  HMFFuture *future;
  HMFFuture *v10;
  HMFFuture *v11;
  objc_super v13;

  v3 = a3;
  os_unfair_lock_lock_with_options();
  objc_getAssociatedObject(v3, &futureForOperation__lock);
  v4 = (HMFOperationFutureAdapter *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&futureForOperation__lock);
  }
  else
  {
    v4 = [HMFOperationFutureAdapter alloc];
    v7 = v3;
    if (v4)
    {
      v13.receiver = v4;
      v13.super_class = (Class)HMFOperationFutureAdapter;
      v4 = objc_msgSendSuper2(&v13, sel_init);
      if (v4)
      {
        +[HMFFuture futureWithPromise:](HMFFuture, "futureWithPromise:", &v4->_promise);
        v8 = objc_claimAutoreleasedReturnValue();
        future = v4->_future;
        v4->_future = (HMFFuture *)v8;

        objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v4, CFSTR("isFinished"), 1, HMFOperationFutureAdapterKVOContext);
        if (objc_msgSend(v7, "isFinished"))
          -[HMFOperationFutureAdapter _handleFinishedOperation:]((uint64_t)v4, v7);
      }
    }

    objc_setAssociatedObject(v7, &futureForOperation__lock, v4, (void *)1);
    os_unfair_lock_unlock((os_unfair_lock_t)&futureForOperation__lock);
    if (!v4)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  v10 = v4->_future;
LABEL_12:
  v11 = v10;

  return v11;
}

@end
