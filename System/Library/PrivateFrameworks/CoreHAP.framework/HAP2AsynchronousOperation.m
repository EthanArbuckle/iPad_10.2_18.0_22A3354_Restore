@implementation HAP2AsynchronousOperation

- (HAP2AsynchronousOperation)initWithName:(id)a3 optionalActivity:(id)a4
{
  id v6;
  id v7;
  HAP2AsynchronousOperation *v8;
  uint64_t v9;
  HAP2PropertyLock *propertyLock;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAP2AsynchronousOperation;
  v8 = -[HAP2AsynchronousOperation init](&v12, sel_init);
  if (v8)
  {
    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAP2AsynchronousOperation.propertyLock"));
    v9 = objc_claimAutoreleasedReturnValue();
    propertyLock = v8->_propertyLock;
    v8->_propertyLock = (HAP2PropertyLock *)v9;

    if (!v7)
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:parent:options:", v6, 0, 16);
    objc_storeStrong((id *)&v8->_activity, v7);
    -[HAP2AsynchronousOperation setName:](v8, "setName:", v6);
  }

  return v8;
}

- (void)finish
{
  -[HAP2AsynchronousOperation _setFinalStateWithError:cancelled:](self, 0, 0);
}

- (void)start
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9085;
  v19 = __Block_byref_object_dispose__9086;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[HAP2AsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[HAP2AsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v4 = propertyLock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__HAP2AsynchronousOperation_start__block_invoke;
  v10[3] = &unk_1E894B360;
  v10[4] = self;
  v10[5] = &v15;
  v10[6] = &v11;
  -[HAP2PropertyLock performWritingBlock:](v4, "performWritingBlock:", v10);

  -[HAP2AsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[HAP2AsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  v5 = (void *)v16[5];
  if (v5)
    objc_exception_throw(objc_retainAutorelease(v5));
  if (*((_BYTE *)v12 + 24))
  {
    -[HAP2AsynchronousOperation activity](self, "activity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "begin");
    -[HAP2AsynchronousOperation activity](self, "activity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HAP2AsynchronousOperation activity](self, "activity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markWithReason:", CFSTR("Started"));

    v8 = (void *)MEMORY[0x1D17B7244]();
    -[HAP2AsynchronousOperation main](self, "main");
    objc_autoreleasePoolPop(v8);
    __HMFActivityScopeLeave();

  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

}

- (void)_setFinalStateWithError:(int)a3 cancelled:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  char v14;

  v5 = a2;
  if (a1)
  {
    v11 = v5;
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("isExecuting"));
    objc_msgSend(a1, "willChangeValueForKey:", CFSTR("isFinished"));
    if (v11)
      objc_msgSend(a1, "willChangeValueForKey:", CFSTR("isCancelled"));
    v6 = (void *)a1[34];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__HAP2AsynchronousOperation__setFinalStateWithError_cancelled___block_invoke;
    v12[3] = &unk_1E894C050;
    v12[4] = a1;
    v14 = a3;
    v7 = v11;
    v13 = v7;
    objc_msgSend(v6, "performWritingBlock:", v12);
    if (v11)
      objc_msgSend(a1, "didChangeValueForKey:", CFSTR("isCancelled"));
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("isFinished"));
    objc_msgSend(a1, "didChangeValueForKey:", CFSTR("isExecuting"));
    objc_msgSend(a1, "activity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v9 = CFSTR("Canceled");
    }
    else
    {
      if (v11)
      {
        objc_msgSend(v8, "markWithFormat:", CFSTR("Finished with error: %@"), v7);
LABEL_12:

        objc_msgSend(a1, "activity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invalidate");

        v5 = v11;
        goto LABEL_13;
      }
      v9 = CFSTR("Finished");
    }
    objc_msgSend(v8, "markWithReason:", v9);
    goto LABEL_12;
  }
LABEL_13:

}

- (HMFActivity)activity
{
  return self->_activity;
}

- (BOOL)isExecuting
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v11 = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HAP2AsynchronousOperation_isExecuting__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)isFinished
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v11 = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__HAP2AsynchronousOperation_isFinished__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __39__HAP2AsynchronousOperation_isFinished__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 249);
  return result;
}

uint64_t __40__HAP2AsynchronousOperation_isExecuting__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 248);
  return result;
}

void __63__HAP2AsynchronousOperation__setFinalStateWithError_cancelled___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 249))
  {
    if (*(_BYTE *)(a1 + 48))
    {
      *(_BYTE *)(v1 + 250) = 1;
      v1 = *(_QWORD *)(a1 + 32);
    }
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      objc_storeStrong((id *)(v1 + 256), v3);
      v1 = *(_QWORD *)(a1 + 32);
    }
    if (*(_BYTE *)(v1 + 248))
    {
      *(_BYTE *)(v1 + 248) = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 249) = 1;
    }
  }
}

void __34__HAP2AsynchronousOperation_start__block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = (_BYTE *)a1[4];
  if (v2[248])
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99778];
    v5 = CFSTR("Operation is already executing.");
LABEL_10:
    objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    return;
  }
  if ((objc_msgSend(v2, "isReady") & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99778];
    v5 = CFSTR("Operation is not ready.");
    goto LABEL_10;
  }
  v6 = (_BYTE *)a1[4];
  if (v6[250])
  {
    v6[249] = 1;
    v6 = (_BYTE *)a1[4];
  }
  if (!v6[249])
  {
    v6[248] = 1;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("executing")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("finished")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("cancelled")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("isExecuting")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("isFinished")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("isCancelled")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___HAP2AsynchronousOperation;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (HAP2AsynchronousOperation)init
{
  objc_class *v3;
  void *v4;
  HAP2AsynchronousOperation *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAP2AsynchronousOperation initWithName:](self, "initWithName:", v4);

  return v5;
}

- (HAP2AsynchronousOperation)initWithName:(id)a3
{
  return -[HAP2AsynchronousOperation initWithName:optionalActivity:](self, "initWithName:optionalActivity:", a3, 0);
}

- (BOOL)isCancelled
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v11 = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HAP2AsynchronousOperation_isCancelled__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (NSError)error
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__9085;
  v12 = __Block_byref_object_dispose__9086;
  v13 = 0;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__HAP2AsynchronousOperation_error__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSError *)v5;
}

- (void)main
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)cancel
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HAP2AsynchronousOperation cancelWithError:](self, "cancelWithError:", v3);

}

- (void)cancelWithError:(id)a3
{
  -[HAP2AsynchronousOperation _setFinalStateWithError:cancelled:](self, a3, 1);
}

- (void)finishWithError:(id)a3
{
  -[HAP2AsynchronousOperation _setFinalStateWithError:cancelled:](self, a3, 0);
}

void __34__HAP2AsynchronousOperation_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 256));
}

uint64_t __40__HAP2AsynchronousOperation_isCancelled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 250);
  return result;
}

@end
