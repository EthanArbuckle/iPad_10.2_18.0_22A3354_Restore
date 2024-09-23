@implementation CNTask

- (id)runWithRetryDelegate:(id)a3
{
  id v4;
  CNRetry *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  v5 = -[CNRetry initWithDelegate:]([CNRetry alloc], "initWithDelegate:", v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__CNTask_Retry__runWithRetryDelegate___block_invoke;
  v8[3] = &unk_1E29B9AE8;
  v8[4] = self;
  -[CNRetry performAndWait:](v5, "performAndWait:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __38__CNTask_Retry__runWithRetryDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

+ (id)taskWithBlock:(id)a3
{
  id v3;
  _CNBlockTask *v4;

  v3 = a3;
  v4 = -[_CNBlockTask initWithBlock:]([_CNBlockTask alloc], "initWithBlock:", v3);

  return v4;
}

+ (id)taskWithName:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  _CNBlockTask *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_CNBlockTask initWithName:block:]([_CNBlockTask alloc], "initWithName:block:", v6, v5);

  return v7;
}

+ (id)taskWithName:(id)a3 subtasks:(id)a4
{
  id v5;
  id v6;
  _CNAggregateTask *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_CNAggregateTask initWithName:tasks:]([_CNAggregateTask alloc], "initWithName:tasks:", v6, v5);

  return v7;
}

+ (id)taskWithResult:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__CNTask_taskWithResult___block_invoke;
  v7[3] = &unk_1E29B9DD0;
  v8 = v3;
  v4 = v3;
  +[CNTask taskWithBlock:](CNTask, "taskWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __25__CNTask_taskWithResult___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)taskWithName:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__CNTask_taskWithName_result___block_invoke;
  v9[3] = &unk_1E29B9DD0;
  v10 = v5;
  v6 = v5;
  +[CNTask taskWithName:block:](CNTask, "taskWithName:block:", a3, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __30__CNTask_taskWithName_result___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)taskWithError:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __24__CNTask_taskWithError___block_invoke;
  v7[3] = &unk_1E29B9DD0;
  v8 = v3;
  v4 = v3;
  +[CNTask taskWithBlock:](CNTask, "taskWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __24__CNTask_taskWithError___block_invoke(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = objc_retainAutorelease(*(id *)(a1 + 32));
  return 0;
}

+ (id)taskWithName:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__CNTask_taskWithName_error___block_invoke;
  v9[3] = &unk_1E29B9DD0;
  v10 = v5;
  v6 = v5;
  +[CNTask taskWithName:block:](CNTask, "taskWithName:block:", a3, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __29__CNTask_taskWithName_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = objc_retainAutorelease(*(id *)(a1 + 32));
  return 0;
}

- (CNTask)init
{
  return -[CNTask initWithName:](self, "initWithName:", &stru_1E29BCC70);
}

- (CNTask)initWithName:(id)a3
{
  id v4;
  NSObject *v5;
  CNTask *v6;
  uint64_t v7;
  NSString *name;
  CNTask *v9;
  objc_super v11;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_1 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_26);
    v5 = CNGuardOSLog_cn_once_object_0_1;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT))
      -[CNTask initWithName:].cold.1(v5);
  }
  v11.receiver = self;
  v11.super_class = (Class)CNTask;
  v6 = -[CNTask init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    name = v6->_name;
    v6->_name = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (BOOL)isCancelled
{
  CNTask *v2;
  BOOL cancelled;

  v2 = self;
  objc_sync_enter(v2);
  cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (BOOL)cancel
{
  CNTask *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = !v2->_cancelled;
  v2->_cancelled = 1;
  objc_sync_exit(v2);

  return v3;
}

- (id)run:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[CNTask methodForSelector:](self, "methodForSelector:", &sel_run);
  if (v5 == +[CNTask instanceMethodForSelector:](CNTask, "instanceMethodForSelector:", &sel_run))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNTask run](self, "run");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (a3)
        *a3 = objc_retainAutorelease(v9);

      v8 = 0;
    }

  }
  return v8;
}

- (id)run
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v8;
  void *v9;
  id v10;

  v3 = -[CNTask methodForSelector:](self, "methodForSelector:", sel_run_);
  if (v3 == +[CNTask instanceMethodForSelector:](CNTask, "instanceMethodForSelector:", sel_run_))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNResult successWithValue:](CNResult, "successWithValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v10 = 0;
    -[CNTask run:](self, "run:", &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    +[CNResult resultWithValue:orError:](CNResult, "resultWithValue:orError:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (id)flatMap:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __18__CNTask_flatMap___block_invoke;
  v8[3] = &unk_1E29B9DF8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  +[CNTask taskWithBlock:](CNTask, "taskWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __18__CNTask_flatMap___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  id v14;

  v4 = *(void **)(a1 + 32);
  v14 = 0;
  objc_msgSend(v4, "run:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    v8 = v5;
  }
  else if (v6)
  {
    v8 = 0;
    if (a2)
      *a2 = objc_retainAutorelease(v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v9, "run:", &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    +[CNFoundationError ifResultIsNil:setOutputError:toError:](CNFoundationError, "ifResultIsNil:setOutputError:toError:", v10, a2, v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)map:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __14__CNTask_map___block_invoke;
  v8[3] = &unk_1E29B9E20;
  v9 = v4;
  v5 = v4;
  -[CNTask flatMap:](self, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __14__CNTask_map___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNTask taskWithResult:](CNTask, "taskWithResult:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)recover:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __18__CNTask_recover___block_invoke;
  v8[3] = &unk_1E29B9DF8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  +[CNTask taskWithBlock:](CNTask, "taskWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __18__CNTask_recover___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;
  id v13;

  v4 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v4, "run:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v7, "run:", &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    +[CNFoundationError ifResultIsNil:setOutputError:toError:](CNFoundationError, "ifResultIsNil:setOutputError:toError:", v8, a2, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (id)profileWithTimeProvider:(id)a3 os_log:(id)a4
{
  id v6;
  id v7;
  _CNTimeProfilingTask *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_CNTimeProfilingTask initWithTask:timeProvider:os_log:]([_CNTimeProfilingTask alloc], "initWithTask:timeProvider:os_log:", self, v7, v6);

  return v8;
}

- (id)description
{
  return +[CNDescriptionBuilder descriptionForObject:withNamesAndObjects:](CNDescriptionBuilder, "descriptionForObject:withNamesAndObjects:", self->_name, 0);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithName:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18F80C000, log, OS_LOG_TYPE_FAULT, "parameter ‘name’ must be nonnull", v1, 2u);
}

@end
