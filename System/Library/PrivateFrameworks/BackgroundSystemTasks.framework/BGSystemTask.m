@implementation BGSystemTask

- (BGSystemTask)initWithIdentifier:(id)a3
{
  id v5;
  BGSystemTask *v6;
  BGSystemTask *v7;
  uint64_t v8;
  NSMutableDictionary *runningConsumedResults;
  id v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *resultQueue;
  uint64_t v16;
  NSMutableDictionary *taskProgressInfo;
  uint64_t v18;
  NSUUID *uuid;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BGSystemTask;
  v6 = -[BGSystemTask init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    runningConsumedResults = v7->_runningConsumedResults;
    v7->_runningConsumedResults = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.BGSystemTask.resultQ.%@"), v5);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create(v11, v13);
    resultQueue = v7->_resultQueue;
    v7->_resultQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    taskProgressInfo = v7->_taskProgressInfo;
    v7->_taskProgressInfo = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = objc_claimAutoreleasedReturnValue();
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v18;

  }
  return v7;
}

+ (id)logger
{
  if (logger_onceToken_1 != -1)
    dispatch_once(&logger_onceToken_1, &__block_literal_global_2);
  return (id)logger_log_1;
}

void __22__BGSystemTask_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackgroundSystemTasks", "BGSTFramework");
  v1 = (void *)logger_log_1;
  logger_log_1 = (uint64_t)v0;

}

- (void)clearLocked
{
  id completionHandler;
  id expirationHandler;
  id expirationAckHandler;
  id expirationHandlerWithReason;
  id clientLedExpirationHandler;
  OS_os_transaction *transaction;
  NSMutableDictionary *runningConsumedResults;
  NSMutableDictionary *taskProgressInfo;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  expirationHandler = self->_expirationHandler;
  self->_expirationHandler = 0;

  expirationAckHandler = self->_expirationAckHandler;
  self->_expirationAckHandler = 0;

  expirationHandlerWithReason = self->_expirationHandlerWithReason;
  self->_expirationHandlerWithReason = 0;

  clientLedExpirationHandler = self->_clientLedExpirationHandler;
  self->_clientLedExpirationHandler = 0;
  self->_expirationReason = 0;

  *(_WORD *)&self->_hasPropagatedExpiration = 0;
  transaction = self->_transaction;
  self->_transaction = 0;

  runningConsumedResults = self->_runningConsumedResults;
  self->_runningConsumedResults = 0;

  taskProgressInfo = self->_taskProgressInfo;
  self->_taskProgressInfo = 0;

}

- (BOOL)invalid
{
  return self->_completionHandler == 0;
}

- (void)setTaskCompleted
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];

  +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  if (!-[BGSystemTask invalid](self, "invalid"))
  {
    -[BGSystemTask reportCumulativeResultConsumptionWithError:](self, "reportCumulativeResultConsumptionWithError:", 0);
    -[BGSystemTask reportBufferedTaskWorkloadProgress](self, "reportBufferedTaskWorkloadProgress");
    +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__BGSystemTask_setTaskCompleted__block_invoke;
    block[3] = &unk_1E920FD60;
    block[4] = self;
    dispatch_sync(v6, block);

  }
}

uint64_t __32__BGSystemTask_setTaskCompleted__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[9];
  if (v3)
  {
    (*(void (**)(_QWORD))(v3 + 16))(v2[9]);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "clearLocked");
}

- (BOOL)setTaskExpiredWithRetryAfter:(double)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  int v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  if (-[BGSystemTask invalid](self, "invalid"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), 4, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 1;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__2;
    v20 = __Block_byref_object_dispose__2;
    v21 = 0;
    v10 = -[BGSystemTask reportCumulativeResultConsumptionWithError:](self, "reportCumulativeResultConsumptionWithError:", a4);
    *((_BYTE *)v23 + 24) = v10;
    if (v10)
    {
      -[BGSystemTask reportBufferedTaskWorkloadProgress](self, "reportBufferedTaskWorkloadProgress");
      +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "internalQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51__BGSystemTask_setTaskExpiredWithRetryAfter_error___block_invoke;
      v15[3] = &unk_1E920FD88;
      *(double *)&v15[7] = a3;
      v15[4] = self;
      v15[5] = &v16;
      v15[6] = &v22;
      dispatch_sync(v12, v15);

      v13 = *((unsigned __int8 *)v23 + 24);
      if (a4 && !*((_BYTE *)v23 + 24))
      {
        *a4 = objc_retainAutorelease((id)v17[5]);
        v13 = *((unsigned __int8 *)v23 + 24);
      }
      v9 = v13 != 0;
    }
    else
    {
      v9 = 0;
    }
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  return v9;
}

void __51__BGSystemTask_setTaskExpiredWithRetryAfter_error___block_invoke(uint64_t a1, __n128 a2)
{
  uint64_t *v3;
  double v4;
  uint64_t v5;
  int v6;
  double v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)(a1 + 56);
  v4 = round(*(double *)(a1 + 56));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(unsigned __int8 *)(v5 + 9);
  if (!*(_BYTE *)(v5 + 9))
  {
    v7 = 300.0;
    if (v4 < 300.0)
    {
      +[BGSystemTask logger](BGSystemTask, "logger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 134217984;
        v17 = 300;
        _os_log_impl(&dword_1D13A5000, v8, OS_LOG_TYPE_DEFAULT, "setTaskExpiredWithRetryAfter: Proactive expirations must have a cool off of at least %lu seconds, clamping", (uint8_t *)&v16, 0xCu);
      }

      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(unsigned __int8 *)(v5 + 9);
      goto LABEL_12;
    }
  }
  if (!*(_BYTE *)(v5 + 9))
  {
    v7 = v4;
    goto LABEL_12;
  }
  v7 = v4;
  if (v4 >= 0.0)
  {
LABEL_12:
    a2.n128_u64[0] = 0x418E848000000000;
    if (v7 <= 64000000.0)
      a2.n128_f64[0] = v7;
    if (v6)
    {
      v14 = *(_QWORD *)(v5 + 80);
      if (v14)
        (*(void (**)(__n128))(v14 + 16))(a2);
    }
    else
    {
      v15 = *(_QWORD *)(v5 + 88);
      if (v15)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(__n128))(v15 + 16))(a2);
    }
    objc_msgSend(*(id *)(a1 + 32), "clearLocked", a2.n128_f64[0]);
    return;
  }
  +[BGSystemTask logger](BGSystemTask, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __51__BGSystemTask_setTaskExpiredWithRetryAfter_error___block_invoke_cold_1(v3, v9, v10);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), 4, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

- (void)handleExpirationWithReason:(unint64_t)a3
{
  id expirationHandlerWithReason;
  id expirationHandler;

  if (!self->_hasPropagatedExpiration)
  {
    self->_expiring = 1;
    self->_expirationReason = a3;
    if (-[BGSystemTask hasValidExpirationHandler](self, "hasValidExpirationHandler"))
    {
      -[BGSystemTask invokeExpirationHandlerWithReason:](self, "invokeExpirationHandlerWithReason:", a3);
      expirationHandlerWithReason = self->_expirationHandlerWithReason;
      self->_expirationHandlerWithReason = 0;

      expirationHandler = self->_expirationHandler;
      self->_expirationHandler = 0;

    }
  }
}

- (void)invokeExpirationHandlerWithReason:(unint64_t)a3
{
  void (**expirationHandlerWithReason)(id, unint64_t);
  NSObject *v6;

  if (-[BGSystemTask hasValidExpirationHandler](self, "hasValidExpirationHandler"))
  {
    expirationHandlerWithReason = (void (**)(id, unint64_t))self->_expirationHandlerWithReason;
    if (expirationHandlerWithReason)
      expirationHandlerWithReason[2](expirationHandlerWithReason, a3);
    else
      (*((void (**)(void))self->_expirationHandler + 2))();
    self->_hasPropagatedExpiration = 1;
  }
  else
  {
    +[BGSystemTask logger](BGSystemTask, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BGSystemTask invokeExpirationHandlerWithReason:].cold.1(v6);

  }
}

- (BOOL)producedCumulativeResults:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BGSystemTask identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "validateTaskIdentifier:resultProduction:error:", v8, v6, a4);

  return (char)a4;
}

- (BOOL)consumedResults:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *resultQueue;
  id v8;
  NSObject *v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  BGSystemTask *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  resultQueue = self->_resultQueue;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __38__BGSystemTask_consumedResults_error___block_invoke;
  v15 = &unk_1E920FAA0;
  v8 = v6;
  v16 = v8;
  v17 = self;
  v18 = &v20;
  v19 = &v26;
  dispatch_sync(resultQueue, &v12);
  if (!*((_BYTE *)v27 + 24))
  {
    +[BGSystemTask logger](BGSystemTask, "logger", v12, v13, v14, v15);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BGSystemTask consumedResults:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v21[5]);
  }
  v10 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

void __38__BGSystemTask_consumedResults_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
        objc_msgSend(v8, "identifier", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v2, "canTaskWithIdentifier:consumeResultOfIdentifier:", v9, v10);

        if ((v9 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), 7, 0);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v13 = *(void **)(v12 + 40);
          *(_QWORD *)(v12 + 40) = v11;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
          goto LABEL_11;
        }
        objc_msgSend(*(id *)(a1 + 40), "resultQueue_aggregateConsumedResult:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)resetResultsForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *resultQueue;
  id v8;
  NSObject *v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *);
  void *v15;
  id v16;
  BGSystemTask *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  resultQueue = self->_resultQueue;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __48__BGSystemTask_resetResultsForIdentifier_error___block_invoke;
  v15 = &unk_1E920FDB0;
  v18 = &v26;
  v8 = v6;
  v16 = v8;
  v17 = self;
  v19 = &v20;
  dispatch_sync(resultQueue, &v12);
  if (!*((_BYTE *)v27 + 24))
  {
    +[BGSystemTask logger](BGSystemTask, "logger", v12, v13, v14, v15);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BGSystemTask resetResultsForIdentifier:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease((id)v21[5]);
  }
  v10 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

void __48__BGSystemTask_resetResultsForIdentifier_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(_QWORD *)(a1[5] + 16);
  v5 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "resetResultsForIdentifier:byTaskIdentifier:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v6;

}

- (void)resultQueue_aggregateConsumedResult:(id)a3
{
  NSMutableDictionary *runningConsumedResults;
  void *v5;
  void *v6;
  BGSystemTaskResult *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;
  id v14;

  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  runningConsumedResults = self->_runningConsumedResults;
  objc_msgSend(v13, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](runningConsumedResults, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [BGSystemTaskResult alloc];
    objc_msgSend(v13, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BGSystemTaskResult initWithIdentifier:consumptionCount:](v7, "initWithIdentifier:consumptionCount:", v8, objc_msgSend(v13, "count") + objc_msgSend(v6, "count"));

    v10 = (void *)v9;
  }
  else
  {
    v10 = v13;
  }
  v11 = self->_runningConsumedResults;
  v14 = v10;
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, v12);

}

- (BOOL)resultQueue_containsPendingConsumedResults
{
  void *v3;
  BOOL v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  -[NSMutableDictionary allKeys](self->_runningConsumedResults, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)reportCumulativeResultConsumptionWithError:(id *)a3
{
  NSObject *resultQueue;
  NSObject *v6;
  char v7;
  _QWORD block[7];
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v10 = 0;
  v11[0] = &v10;
  v11[1] = 0x3032000000;
  v11[2] = __Block_byref_object_copy__2;
  v11[3] = __Block_byref_object_dispose__2;
  v12 = 0;
  resultQueue = self->_resultQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__BGSystemTask_reportCumulativeResultConsumptionWithError___block_invoke;
  block[3] = &unk_1E920FDD8;
  block[4] = self;
  block[5] = &v13;
  block[6] = &v10;
  dispatch_sync(resultQueue, block);
  if (!*((_BYTE *)v14 + 24))
  {
    +[BGSystemTask logger](BGSystemTask, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BGSystemTask reportCumulativeResultConsumptionWithError:].cold.1((uint64_t)self, (uint64_t)v11, v6);

    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(v11[0] + 40));
  }
  v7 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __59__BGSystemTask_reportCumulativeResultConsumptionWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  if (objc_msgSend(*(id *)(a1 + 32), "resultQueue_containsPendingConsumedResults"))
  {
    +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(v3 + 48), "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v8 + 40);
    LOBYTE(v4) = objc_msgSend(v2, "validateTaskIdentifier:resultConsumption:error:", v4, v7, &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 48);
    *(_QWORD *)(v10 + 48) = v9;

  }
}

- (BOOL)reportTaskWorkloadProgress:(unint64_t)a3 completed:(unint64_t)a4 category:(unint64_t)a5 subCategory:(id)a6 error:(id *)a7
{
  __CFString *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  unint64_t v17;
  unint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id *v36;
  __CFString *v37;
  __CFString *v38;
  _QWORD v39[2];
  uint8_t buf[4];
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v12 = (__CFString *)a6;
  if (a4 < 0x65)
  {
    +[BGSystemTask logger](BGSystemTask, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v41 = a4;
      v42 = 2048;
      v43 = a3;
      v44 = 2048;
      v45 = a5;
      v46 = 2112;
      v47 = (unint64_t)v12;
      _os_log_impl(&dword_1D13A5000, v16, OS_LOG_TYPE_DEFAULT, "Completed %lu [Target:%lu] for workload %lu, subcategory %@", buf, 0x2Au);
    }
    v17 = a4;
    v18 = a3;
    v36 = a7;

    v19 = CFSTR("default");
    v37 = v12;
    if (v12)
      v19 = v12;
    v38 = v19;
    -[BGSystemTask taskProgressInfo](self, "taskProgressInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGSystemTask taskProgressInfo](self, "taskProgressInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);

    }
    -[BGSystemTask taskProgressInfo](self, "taskProgressInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v29;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v30 = a5;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKey:", v32, v38);

    if (!-[BGSystemTask shouldReportTaskWorkloadProgress:](self, "shouldReportTaskWorkloadProgress:", v17))
    {
      v15 = 1;
      v12 = v37;
      v13 = v38;
      goto LABEL_22;
    }
    v12 = v37;
    if (-[BGSystemTask sendTaskWorkloadProgressToPPS:completed:category:subCategory:](self, "sendTaskWorkloadProgressToPPS:completed:category:subCategory:", v18, v17, v30, v37))
    {
      v15 = 1;
      v13 = v38;
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), 3, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[BGSystemTask logger](BGSystemTask, "logger");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413314;
      v41 = (unint64_t)v33;
      v42 = 2048;
      v43 = v17;
      v44 = 2048;
      v45 = v18;
      v46 = 2048;
      v47 = v30;
      v48 = 2112;
      v49 = v37;
      _os_log_error_impl(&dword_1D13A5000, v34, OS_LOG_TYPE_ERROR, "Error: %@ Completed %lu [Target:%lu] for workload %lu, subcategory %@", buf, 0x34u);
    }

    v13 = v38;
    if (v36)
      *v36 = objc_retainAutorelease(v33);

LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), 4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[BGSystemTask logger](BGSystemTask, "logger");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413314;
    v41 = (unint64_t)v13;
    v42 = 2048;
    v43 = a4;
    v44 = 2048;
    v45 = a3;
    v46 = 2048;
    v47 = a5;
    v48 = 2112;
    v49 = v12;
    _os_log_error_impl(&dword_1D13A5000, v14, OS_LOG_TYPE_ERROR, "Error: %@ Completed %lu [Target:%lu] for workload %lu, subcategory %@", buf, 0x34u);
  }

  if (!a7)
    goto LABEL_21;
  v15 = 0;
  *a7 = objc_retainAutorelease(v13);
LABEL_22:

  return v15;
}

- (BOOL)reportBufferedTaskWorkloadProgress
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  BOOL v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[BGSystemTask taskProgressInfo](self, "taskProgressInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v30)
  {
    v4 = *(_QWORD *)v41;
    v32 = v3;
    v29 = *(_QWORD *)v41;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v41 != v4)
          objc_enumerationMutation(v3);
        v31 = v5;
        v6 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v5);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        -[BGSystemTask taskProgressInfo](self, "taskProgressInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v8;
        v35 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v35)
        {
          v9 = *(_QWORD *)v37;
          v33 = *(_QWORD *)v37;
          while (2)
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v37 != v9)
                objc_enumerationMutation(obj);
              v11 = *(__CFString **)(*((_QWORD *)&v36 + 1) + 8 * i);
              -[BGSystemTask taskProgressInfo](self, "taskProgressInfo");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", v6);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKey:", v11);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "unsignedLongValue");

              if (!-[BGSystemTask shouldReportTaskWorkloadProgress:](self, "shouldReportTaskWorkloadProgress:", v16))
              {
                -[BGSystemTask taskProgressInfo](self, "taskProgressInfo");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKeyedSubscript:", v6);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "objectForKey:", v11);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "unsignedLongValue");

                v22 = v11 == CFSTR("default") ? 0 : v11;
                v23 = v22;
                v24 = objc_msgSend(v6, "unsignedLongValue");
                v25 = v21;
                v9 = v33;
                v26 = -[BGSystemTask sendTaskWorkloadProgressToPPS:completed:category:subCategory:](self, "sendTaskWorkloadProgressToPPS:completed:category:subCategory:", v25, v16, v24, v23);

                if (!v26)
                {

                  v27 = 0;
                  v3 = v32;
                  goto LABEL_23;
                }
              }
            }
            v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v35)
              continue;
            break;
          }
        }

        v5 = v31 + 1;
        v3 = v32;
        v4 = v29;
      }
      while (v31 + 1 != v30);
      v27 = 1;
      v30 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v30);
  }
  else
  {
    v27 = 1;
  }
LABEL_23:

  return v27;
}

- (BOOL)sendTaskWorkloadProgressToPPS:(unint64_t)a3 completed:(unint64_t)a4 category:(unint64_t)a5 subCategory:(id)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v10 = a6;
  +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "internalQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v12);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "internalQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke;
  v17[3] = &unk_1E920FE00;
  v21 = a4;
  v22 = a5;
  v17[4] = self;
  v18 = v10;
  v19 = &v23;
  v20 = a3;
  v15 = v10;
  dispatch_sync(v14, v17);

  LOBYTE(a5) = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  return a5;
}

void __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];

  objc_msgSend(MEMORY[0x1E0D1D928], "sharedScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke_2;
  v9[3] = &unk_1E920F928;
  v7 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v7;
  objc_msgSend(v2, "reportTaskWorkloadProgress:target:completed:category:subCategory:completionHandler:", v3, v6, v4, v5, v8, v9);

}

void __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (a2)
  {
    *(_BYTE *)(v3 + 24) = 1;
    +[BGSystemTask logger](BGSystemTask, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1D13A5000, v4, OS_LOG_TYPE_DEFAULT, "Successfully reported task workload progress for %@", (uint8_t *)&v6, 0xCu);

    }
  }
  else
  {
    *(_BYTE *)(v3 + 24) = 0;
    +[BGSystemTask logger](BGSystemTask, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke_2_cold_1(a1, v4);
  }

}

- (BOOL)shouldReportTaskWorkloadProgress:(unint64_t)a3
{
  return 0xCCCCCCCCCCCCCCCDLL * a3 < 0x3333333333333334;
}

- (BOOL)eligibleToRun
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__BGSystemTask_eligibleToRun__block_invoke;
  v8[3] = &unk_1E920FE28;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(self) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)self;
}

_BYTE *__29__BGSystemTask_eligibleToRun__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[9] || (result = (_BYTE *)objc_msgSend(result, "invalid"), (_DWORD)result))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (void)prepareForRunning
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;

  -[NSString UTF8String](self->_identifier, "UTF8String");
  v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

}

- (void)setExpirationHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  id expirationHandler;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  if (self->_expiring)
  {
    v7 = -[BGSystemTask hasValidExpirationHandler](self, "hasValidExpirationHandler");
    v8 = (void *)MEMORY[0x1D17E72F4](v4);
    expirationHandler = self->_expirationHandler;
    self->_expirationHandler = v8;

    if (!v7)
    {
      +[BGSystemTask logger](BGSystemTask, "logger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[BGSystemTask identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v11;
        _os_log_impl(&dword_1D13A5000, v10, OS_LOG_TYPE_DEFAULT, "Invoking expirationHandler for %{public}@ immediately after being set due to a cached expiration request", buf, 0xCu);

      }
      +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "internalQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__BGSystemTask_setExpirationHandler___block_invoke;
      block[3] = &unk_1E920FD60;
      block[4] = self;
      dispatch_async(v13, block);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17E72F4](v4);
    v15 = self->_expirationHandler;
    self->_expirationHandler = v14;

  }
}

uint64_t __37__BGSystemTask_setExpirationHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleExpirationWithReason:", 0);
}

- (void)setExpirationHandlerWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  id expirationHandlerWithReason;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  if (self->_expiring)
  {
    v7 = -[BGSystemTask hasValidExpirationHandler](self, "hasValidExpirationHandler");
    v8 = (void *)MEMORY[0x1D17E72F4](v4);
    expirationHandlerWithReason = self->_expirationHandlerWithReason;
    self->_expirationHandlerWithReason = v8;

    if (!v7)
    {
      +[BGSystemTask logger](BGSystemTask, "logger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[BGSystemTask identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v11;
        _os_log_impl(&dword_1D13A5000, v10, OS_LOG_TYPE_DEFAULT, "Invoking expirationHandlerWithReason for %{public}@ immediately after being set due to a cached expiration request", buf, 0xCu);

      }
      +[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "internalQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__BGSystemTask_setExpirationHandlerWithReason___block_invoke;
      block[3] = &unk_1E920FD60;
      block[4] = self;
      dispatch_async(v13, block);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17E72F4](v4);
    v15 = self->_expirationHandlerWithReason;
    self->_expirationHandlerWithReason = v14;

  }
}

uint64_t __47__BGSystemTask_setExpirationHandlerWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleExpirationWithReason:", objc_msgSend(*(id *)(a1 + 32), "expirationReason"));
}

- (BOOL)hasValidExpirationHandler
{
  return self->_expirationHandler || self->_expirationHandlerWithReason != 0;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)expirationHandler
{
  return self->_expirationHandler;
}

- (id)expirationHandlerWithReason
{
  return self->_expirationHandlerWithReason;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (NSMutableDictionary)runningConsumedResults
{
  return self->_runningConsumedResults;
}

- (void)setRunningConsumedResults:(id)a3
{
  objc_storeStrong((id *)&self->_runningConsumedResults, a3);
}

- (OS_dispatch_queue)resultQueue
{
  return self->_resultQueue;
}

- (void)setResultQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultQueue, a3);
}

- (BOOL)hasPropagatedExpiration
{
  return self->_hasPropagatedExpiration;
}

- (void)setHasPropagatedExpiration:(BOOL)a3
{
  self->_hasPropagatedExpiration = a3;
}

- (NSMutableDictionary)taskProgressInfo
{
  return self->_taskProgressInfo;
}

- (void)setTaskProgressInfo:(id)a3
{
  objc_storeStrong((id *)&self->_taskProgressInfo, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)expirationAckHandler
{
  return self->_expirationAckHandler;
}

- (void)setExpirationAckHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)clientLedExpirationHandler
{
  return self->_clientLedExpirationHandler;
}

- (void)setClientLedExpirationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)expiring
{
  return self->_expiring;
}

- (unint64_t)expirationReason
{
  return self->_expirationReason;
}

- (void)setExpirationReason:(unint64_t)a3
{
  self->_expirationReason = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_clientLedExpirationHandler, 0);
  objc_storeStrong(&self->_expirationAckHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_taskProgressInfo, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_runningConsumedResults, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_expirationHandlerWithReason, 0);
  objc_storeStrong(&self->_expirationHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __51__BGSystemTask_setTaskExpiredWithRetryAfter_error___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_1D13A5000, a2, a3, "setTaskExpiredWithRetryAfter: Invalid value for seconds: %lf", (uint8_t *)&v4);
}

- (void)invokeExpirationHandlerWithReason:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D13A5000, log, OS_LOG_TYPE_ERROR, "Tried to invoke expirationHandler on a task without one setup!", v1, 2u);
}

- (void)consumedResults:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D13A5000, v0, v1, "%s: Unable to consume results %@ with error; %@", v2);
  OUTLINED_FUNCTION_3_0();
}

- (void)resetResultsForIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D13A5000, v0, v1, "%s: Unable to reset result production for %@ with error: %@", v2);
  OUTLINED_FUNCTION_3_0();
}

- (void)reportCumulativeResultConsumptionWithError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1D13A5000, log, OS_LOG_TYPE_ERROR, "Failed to report aggregate result consumption to dasd for %@ with error: %@", (uint8_t *)&v5, 0x16u);
}

void __77__BGSystemTask_sendTaskWorkloadProgressToPPS_completed_category_subCategory___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_1D13A5000, a2, v4, "reportTaskWorkloadProgress: failed for %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_3_0();
}

@end
