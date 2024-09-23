@implementation _CNBlockFutureImpl

- (BOOL)workBlockScheduled
{
  return self->_workBlockScheduled;
}

- (void)nts_resumeQueue
{
  if (self->_queueSuspended)
  {
    self->_queueSuspended = 0;
    -[CNSuspendableSchedulerDecorator resume](self->_blockScheduler, "resume");
  }
}

- (void)addSuccessBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[_CNBlockFutureImpl implicitlyResumeQueue](self, "implicitlyResumeQueue");
  objc_initWeak(&location, self);
  -[_CNBlockFutureImpl blockScheduler](self, "blockScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38___CNBlockFutureImpl_addSuccessBlock___block_invoke;
  v7[3] = &unk_1E29BB050;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)implicitlyResumeQueue
{
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43___CNBlockFutureImpl_implicitlyResumeQueue__block_invoke;
  v4[3] = &unk_1E29BB028;
  v4[4] = self;
  v4[5] = &v5;
  CNRunWithLock(v3, v4);

  if (*((_BYTE *)v6 + 24))
    -[CNSuspendableSchedulerDecorator resume](self->_blockScheduler, "resume");
  _Block_object_dispose(&v5, 8);
}

- (CNSuspendableSchedulerDecorator)blockScheduler
{
  return self->_blockScheduler;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _BOOL4 v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[CNObservableContractEnforcement shouldSwizzleNilResults](CNObservableContractEnforcement, "shouldSwizzleNilResults"))
  {
    v8 = ((unint64_t)v6 | (unint64_t)v7) == 0;
  }
  else
  {
    v8 = 0;
  }
  if (!v8)
  {
    v9 = v6 != 0;
    v10 = v7 != 0;
    if (((v9 ^ v10) & 1) != 0)
    {
LABEL_27:
      v13 = v6;
      goto LABEL_28;
    }
LABEL_13:
    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_CNBlockFutureImpl finishWithResult:error:].cold.4();

    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_CNBlockFutureImpl finishWithResult:error:].cold.3();

    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_CNBlockFutureImpl finishWithResult:error:].cold.2();

    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_CNBlockFutureImpl finishWithResult:error:].cold.1(v17);

    v18 = CNObserverProtocolExceptionNullMarker[0];
    v28[0] = CNObserverProtocolExceptionResultKey[0];
    v28[1] = CNObserverProtocolExceptionErrorKey[0];
    if (v9)
      v19 = (__CFString *)v6;
    else
      v19 = CNObserverProtocolExceptionNullMarker[0];
    if (v10)
      v18 = (__CFString *)v7;
    v29[0] = v19;
    v29[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    CNFutureThrowProtocolExceptionWithReason(CFSTR("Either the result or error must be non-nil"), v20);

    goto LABEL_27;
  }
  +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[_CNBlockFutureImpl finishWithResult:error:].cold.6();

  +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[_CNBlockFutureImpl finishWithResult:error:].cold.1(v12);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v10 = 0;
    v9 = 0;
    goto LABEL_13;
  }
LABEL_28:
  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lock");

  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "condition");

  if (v23 == 1)
  {
    -[_CNBlockFutureImpl stateLock](self, "stateLock");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "unlock");

  }
  else
  {
    -[CNFutureResult setResult:error:](self->_futureResult, "setResult:error:", v13, v7);
    v24 = -[_CNBlockFutureImpl nts_mayResumeQueue](self, "nts_mayResumeQueue");
    -[_CNBlockFutureImpl stateLock](self, "stateLock");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "unlockWithCondition:", 1);

    if (v24)
      -[CNSuspendableSchedulerDecorator resume](self->_blockScheduler, "resume");
  }

  return v23 != 1;
}

- (id)futureResult
{
  void *v3;
  void *v4;
  void *v5;

  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = (void *)-[CNFutureResult copy](self->_futureResult, "copy");
  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (BOOL)nts_mayResumeQueue
{
  BOOL queueSuspended;

  queueSuspended = self->_queueSuspended;
  self->_queueSuspended = 0;
  return queueSuspended;
}

- (void)dealloc
{
  objc_super v3;

  -[_CNBlockFutureImpl resumeQueue](self, "resumeQueue");
  v3.receiver = self;
  v3.super_class = (Class)_CNBlockFutureImpl;
  -[_CNBlockFutureImpl dealloc](&v3, sel_dealloc);
}

- (void)resumeQueue
{
  void *v3;
  _QWORD v4[5];

  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33___CNBlockFutureImpl_resumeQueue__block_invoke;
  v4[3] = &unk_1E29B9358;
  v4[4] = self;
  CNRunWithLock(v3, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockScheduler, 0);
  objc_storeStrong((id *)&self->_futureResult, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[_CNBlockFutureImpl implicitlyResumeQueue](self, "implicitlyResumeQueue");
  if (-[_CNBlockFutureImpl isFinished](self, "isFinished"))
  {
    -[_CNBlockFutureImpl futureResultFromImmediateLookup](self, "futureResultFromImmediateLookup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_CNBlockFutureImpl futureResultFromAsynchronousLookupBeforeDate:error:](self, "futureResultFromAsynchronousLookupBeforeDate:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v10 = 0;
      goto LABEL_6;
    }
  }
  objc_msgSend(v7, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNFoundationError ifResultIsNil:setOutputError:toError:](CNFoundationError, "ifResultIsNil:setOutputError:toError:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v10;
}

- (BOOL)isFinished
{
  void *v3;
  void *v4;

  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = -[_CNBlockFutureImpl _nts_isFinished](self, "_nts_isFinished");
  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (BOOL)_nts_isFinished
{
  void *v2;
  BOOL v3;

  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "condition") == 1;

  return v3;
}

- (id)futureResultFromImmediateLookup
{
  return (id)-[CNFutureResult copy](self->_futureResult, "copy");
}

- (_CNBlockFutureImpl)initWithSchedulerProvider:(id)a3
{
  id v4;
  _CNBlockFutureImpl *v5;
  uint64_t v6;
  NSConditionLock *stateLock;
  CNFutureResult *v8;
  CNFutureResult *futureResult;
  void *v10;
  uint64_t v11;
  CNSuspendableSchedulerDecorator *blockScheduler;
  _CNBlockFutureImpl *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_CNBlockFutureImpl;
  v5 = -[_CNBlockFutureImpl init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    stateLock = v5->_stateLock;
    v5->_stateLock = (NSConditionLock *)v6;

    -[NSConditionLock setName:](v5->_stateLock, "setName:", CFSTR("CNFuture state lock"));
    v8 = objc_alloc_init(CNFutureResult);
    futureResult = v5->_futureResult;
    v5->_futureResult = v8;

    objc_msgSend(v4, "immediateScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNSuspendableSchedulerDecorator suspendedSchedulerWithScheduler:](CNSuspendableSchedulerDecorator, "suspendedSchedulerWithScheduler:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    blockScheduler = v5->_blockScheduler;
    v5->_blockScheduler = (CNSuspendableSchedulerDecorator *)v11;

    v5->_queueSuspended = 1;
    v13 = v5;
  }

  return v5;
}

- (void)addFailureBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[_CNBlockFutureImpl implicitlyResumeQueue](self, "implicitlyResumeQueue");
  objc_initWeak(&location, self);
  -[_CNBlockFutureImpl blockScheduler](self, "blockScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38___CNBlockFutureImpl_addFailureBlock___block_invoke;
  v7[3] = &unk_1E29BB050;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

+ (id)lazyImplWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lazyImplWithSchedulerProvider:block:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)lazyImplWithSchedulerProvider:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSchedulerProvider:", v6);
  objc_initWeak(&location, v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58___CNBlockFutureImpl_lazyImplWithSchedulerProvider_block___block_invoke;
  v11[3] = &unk_1E29BB000;
  v9 = v7;
  v12 = v9;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "addWriterBlock:", v11);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v8;
}

- (void)addWriterBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[_CNBlockFutureImpl blockScheduler](self, "blockScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37___CNBlockFutureImpl_addWriterBlock___block_invoke;
  v7[3] = &unk_1E29BB050;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

  -[_CNBlockFutureImpl setWorkBlockScheduled:](self, "setWorkBlockScheduled:", 1);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)setWorkBlockScheduled:(BOOL)a3
{
  self->_workBlockScheduled = a3;
}

- (id)futureResultFromAsynchronousLookupBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  void *v12;
  id v13;
  double v14;
  dispatch_time_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD block[4];
  NSObject *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  id v27;
  id location;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v6 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__6;
  v37 = __Block_byref_object_dispose__6;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke;
  block[3] = &unk_1E29BB078;
  objc_copyWeak(&v27, &location);
  v9 = v7;
  v23 = v9;
  v25 = &v29;
  v10 = v6;
  v24 = v10;
  v26 = &v33;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
  -[_CNBlockFutureImpl blockScheduler](self, "blockScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke_21;
  v20[3] = &unk_1E29B9BF8;
  v13 = v11;
  v21 = v13;
  objc_msgSend(v12, "performBlock:", v20);

  objc_msgSend(v10, "timeIntervalSinceNow");
  if (v14 <= 1000000000.0)
    v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
  else
    v15 = -1;
  if (dispatch_group_wait(v9, v15) || !*((_BYTE *)v30 + 24))
  {
    +[CNFoundationError timeoutError](CNFoundationError, "timeoutError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a4)
      *a4 = objc_retainAutorelease(v16);

    v18 = 0;
  }
  else
  {
    v18 = (id)v34[5];
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

+ (id)log
{
  if (log_cn_once_token_1 != -1)
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_38);
  return (id)log_cn_once_object_1;
}

+ (id)implWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "implWithSchedulerProvider:block:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)implWithSchedulerProvider:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSchedulerProvider:", v7);

  objc_msgSend(v8, "resumeQueue");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54___CNBlockFutureImpl_implWithSchedulerProvider_block___block_invoke;
  v14[3] = &unk_1E29B8D88;
  v16 = v6;
  v9 = v8;
  v15 = v9;
  v10 = v6;
  objc_msgSend(v9, "addWriterBlock:", v14);
  v11 = v15;
  v12 = v9;

  return v12;
}

- (_CNBlockFutureImpl)init
{
  void *v3;
  _CNBlockFutureImpl *v4;

  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_CNBlockFutureImpl initWithSchedulerProvider:](self, "initWithSchedulerProvider:", v3);

  return v4;
}

- (void)updateDescriptionWithBuilder:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tryLock");

  if (v5)
  {
    -[_CNBlockFutureImpl stateLock](self, "stateLock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "condition");

    if (v7)
      v8 = CFSTR("finished");
    else
      v8 = CFSTR("ready");
    v9 = (id)objc_msgSend(v13, "appendName:object:", CFSTR("state"), v8);
    -[_CNBlockFutureImpl stateLock](self, "stateLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlock");

  }
  else
  {
    v11 = (id)objc_msgSend(v13, "appendName:object:", CFSTR("state"), CFSTR("locked"));
  }
  v12 = (id)objc_msgSend(v13, "appendName:object:", CFSTR("result"), self->_futureResult);

}

- (BOOL)isCancelled
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (-[_CNBlockFutureImpl nts_isFinished](self, "nts_isFinished"))
  {
    -[CNFutureResult error](self->_futureResult, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[CNFoundationError isCanceledError:](CNFoundationError, "isCanceledError:", v4);

  }
  else
  {
    v5 = 0;
  }
  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return v5;
}

- (BOOL)nts_isFinished
{
  void *v2;
  BOOL v3;

  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "condition") == 1;

  return v3;
}

- (BOOL)cancel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[_CNBlockFutureImpl stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "condition");

  if (v5 == 1)
  {
    -[_CNBlockFutureImpl stateLock](self, "stateLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlock");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFutureResult setError:](self->_futureResult, "setError:", v6);

    LODWORD(v6) = -[_CNBlockFutureImpl nts_mayResumeQueue](self, "nts_mayResumeQueue");
    -[_CNBlockFutureImpl stateLock](self, "stateLock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlockWithCondition:", 1);

    if ((_DWORD)v6)
      -[CNSuspendableSchedulerDecorator resume](self->_blockScheduler, "resume");
  }
  return v5 != 1;
}

- (void)_flushCompletionBlocks
{
  id v2;

  -[_CNBlockFutureImpl blockScheduler](self, "blockScheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBlock:", &__block_literal_global_29);

}

- (void)finishWithResult:(NSObject *)a1 error:.cold.1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_6(&dword_18F80C000, a1, v3, "Call stack: %{public}@", v4);

  OUTLINED_FUNCTION_1_0();
}

- (void)finishWithResult:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_6(&dword_18F80C000, v0, v1, "Error : %{public}@", v2);
}

- (void)finishWithResult:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_6(&dword_18F80C000, v0, v1, "Result: %{public}@", v2);
}

- (void)finishWithResult:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_18F80C000, v0, v1, "A promise was finished incorrectly", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)finishWithResult:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_18F80C000, v0, v1, "Swizzling a nil result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
