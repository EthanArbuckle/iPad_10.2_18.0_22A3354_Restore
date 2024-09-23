@implementation AMSURLTaskInfo

void __40__AMSURLTaskInfo_removeTaskInfoForTask___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "sharedTaskStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

void __40__AMSURLTaskInfo_createTaskInfoForTask___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  AMSURLTaskInfo *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 48), "sharedTaskStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v6 = -[AMSURLTaskInfo initWithTask:]([AMSURLTaskInfo alloc], "initWithTask:", *(_QWORD *)(a1 + 32));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 48), "sharedTaskStore");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));

  }
}

void __34__AMSURLTaskInfo_taskInfoForTask___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 48), "sharedTaskStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (NSMutableDictionary)sharedTaskStore
{
  if (_MergedGlobals_154 != -1)
    dispatch_once(&_MergedGlobals_154, &__block_literal_global_136);
  return (NSMutableDictionary *)(id)qword_1ECEAD9A8;
}

- (AMSURLTaskInfo)initWithTask:(id)a3
{
  id v5;
  AMSURLTaskInfo *v6;
  NSMutableData *v7;
  NSMutableData *data;
  AMSURLRequestProperties *v9;
  AMSURLRequestProperties *properties;
  NSMutableSet *v11;
  NSMutableSet *retryIdentifiers;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *taskQueue;
  AMSContiguousActionPerformer *v16;
  AMSContiguousActionPerformer *contiguousActionPerformer;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSURLTaskInfo;
  v6 = -[AMSURLTaskInfo init](&v19, sel_init);
  if (v6)
  {
    v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    data = v6->_data;
    v6->_data = v7;

    v6->_performingBlockWithDataAccess = 0;
    v9 = objc_alloc_init(AMSURLRequestProperties);
    properties = v6->_properties;
    v6->_properties = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    retryIdentifiers = v6->_retryIdentifiers;
    v6->_retryIdentifiers = v11;

    v6->_signpostID = 0;
    objc_storeStrong((id *)&v6->_task, a3);
    v6->_taskLock = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.AppleMediaServices.TaskQueue", v13);
    taskQueue = v6->_taskQueue;
    v6->_taskQueue = (OS_dispatch_queue *)v14;

    v16 = -[AMSContiguousActionPerformer initWithQueue:]([AMSContiguousActionPerformer alloc], "initWithQueue:", v6->_taskQueue);
    contiguousActionPerformer = v6->_contiguousActionPerformer;
    v6->_contiguousActionPerformer = v16;

  }
  return v6;
}

- (id)completionBlock
{
  void *v3;
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  v3 = _Block_copy(self->_completionBlock);
  os_unfair_recursive_lock_unlock();
  v4 = _Block_copy(v3);

  return v4;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (void)setSession:(id)a3
{
  AMSURLSession *v4;
  AMSURLSession *session;

  v4 = (AMSURLSession *)a3;
  os_unfair_recursive_lock_lock_with_options();
  session = self->_session;
  self->_session = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setProperties:(id)a3
{
  AMSURLRequestProperties *v4;
  AMSURLRequestProperties *properties;

  v4 = (AMSURLRequestProperties *)a3;
  os_unfair_recursive_lock_lock_with_options();
  properties = self->_properties;
  self->_properties = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id completionBlock;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = _Block_copy(v4);

  completionBlock = self->_completionBlock;
  self->_completionBlock = v5;

  os_unfair_recursive_lock_unlock();
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)performAsyncBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSURLTaskInfo contiguousActionPerformer](self, "contiguousActionPerformer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "async:", v4);

}

- (AMSURLAction)receivedAction
{
  AMSURLAction *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_receivedAction;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (unint64_t)startContiguousAsyncActionWithInitialBlock:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[AMSURLTaskInfo contiguousActionPerformer](self, "contiguousActionPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "performInitialContiguousActionWithBlock:", v4);

  return v6;
}

- (unint64_t)startContiguousAsyncActionWithInitialDataBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[AMSURLTaskInfo contiguousActionPerformer](self, "contiguousActionPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__AMSURLTaskInfo_startContiguousAsyncActionWithInitialDataBlock___block_invoke;
  v9[3] = &unk_1E2547230;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "performInitialContiguousActionWithBlock:", v9);

  return v7;
}

- (void)performSyncBlockWithExclusiveAccess:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[AMSURLTaskInfo taskQueue](self, "taskQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[AMSURLTaskInfo contiguousActionPerformer](self, "contiguousActionPerformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__AMSURLTaskInfo_performSyncBlockWithExclusiveAccess___block_invoke;
  v8[3] = &unk_1E253DC28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "sync:", v8);

}

- (void)assertIsOnPrivateQueue
{
  NSObject *v2;

  -[AMSURLTaskInfo taskQueue](self, "taskQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

}

- (OS_dispatch_queue)taskQueue
{
  return self->_taskQueue;
}

- (void)finishContiguousAsyncActionWithIdentifier:(unint64_t)a3
{
  id v4;

  -[AMSURLTaskInfo contiguousActionPerformer](self, "contiguousActionPerformer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishContiguousActionWithIdentifier:", a3);

}

- (void)continueContiguousAsyncActionWithIdentifier:(unint64_t)a3 block:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AMSURLTaskInfo contiguousActionPerformer](self, "contiguousActionPerformer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "continueContiguousActionWithIdentifier:withBlock:", a3, v6);

}

- (AMSContiguousActionPerformer)contiguousActionPerformer
{
  return self->_contiguousActionPerformer;
}

- (void)setReceivedAction:(id)a3
{
  AMSURLAction *v4;
  AMSURLAction *receivedAction;

  v4 = (AMSURLAction *)a3;
  os_unfair_recursive_lock_lock_with_options();
  receivedAction = self->_receivedAction;
  self->_receivedAction = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setError:(id)a3
{
  NSError *v4;
  NSError *error;

  v4 = (NSError *)a3;
  os_unfair_recursive_lock_lock_with_options();
  error = self->_error;
  self->_error = v4;

  os_unfair_recursive_lock_unlock();
}

- (id)createMetricsContextForDecodedObject:(id)a3
{
  id v4;
  id v5;
  AMSMetricsLoadURLContext *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  v6 = -[AMSMetricsLoadURLContext initWithTaskInfo:serverPayload:]([AMSMetricsLoadURLContext alloc], "initWithTaskInfo:serverPayload:", self, v5);
  return v6;
}

- (NSURLSessionTaskMetrics)metrics
{
  NSURLSessionTaskMetrics *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_metrics;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSError)error
{
  NSError *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_error;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setResponse:(id)a3
{
  NSURLResponse *v4;
  NSURLResponse *response;

  v4 = (NSURLResponse *)a3;
  os_unfair_recursive_lock_lock_with_options();
  response = self->_response;
  self->_response = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSURLResponse)response
{
  NSURLResponse *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_response;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (AMSURLSession)session
{
  AMSURLSession *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_session;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (NSData)data
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = (void *)-[NSMutableData copy](self->_data, "copy");
  os_unfair_recursive_lock_unlock();
  return (NSData *)v3;
}

uint64_t __54__AMSURLTaskInfo_performSyncBlockWithExclusiveAccess___block_invoke(uint64_t a1)
{
  os_unfair_recursive_lock_lock_with_options();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return os_unfair_recursive_lock_unlock();
}

- (AMSURLRequestProperties)properties
{
  AMSURLRequestProperties *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_properties;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contiguousActionPerformer, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_originalResponse, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_receivedAction, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_retryIdentifiers, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

void __65__AMSURLTaskInfo_startContiguousAsyncActionWithInitialDataBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__AMSURLTaskInfo_startContiguousAsyncActionWithInitialDataBlock___block_invoke_2;
  v4[3] = &unk_1E2547208;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v3, "_performDataAccessUsingBlock:", v4);

}

- (void)_performDataAccessUsingBlock:(id)a3
{
  void (**v4)(id, NSMutableData *);
  NSUInteger v5;

  v4 = (void (**)(id, NSMutableData *))a3;
  os_unfair_recursive_lock_lock_with_options();
  self->_performingBlockWithDataAccess = 1;
  v5 = -[NSMutableData length](self->_data, "length");
  v4[2](v4, self->_data);

  if (-[NSMutableData length](self->_data, "length") != v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AMSURLTaskInfoDisallowedDataMutation"), CFSTR("Data length was modified while running data access block."));
  self->_performingBlockWithDataAccess = 0;
  os_unfair_recursive_lock_unlock();
}

uint64_t __65__AMSURLTaskInfo_startContiguousAsyncActionWithInitialDataBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

- (void)setMetrics:(id)a3
{
  NSURLSessionTaskMetrics *v4;
  NSURLSessionTaskMetrics *metrics;

  v4 = (NSURLSessionTaskMetrics *)a3;
  os_unfair_recursive_lock_lock_with_options();
  metrics = self->_metrics;
  self->_metrics = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)appendData:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_performingBlockWithDataAccess)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AMSURLTaskInfoDisallowedDataMutation"), CFSTR("Attempted to append data while running a data access block."));
  -[NSMutableData appendData:](self->_data, "appendData:", v4);
  os_unfair_recursive_lock_unlock();

}

+ (void)removeTaskInfoForTask:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(a1, "sharedTaskQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__AMSURLTaskInfo_removeTaskInfoForTask___block_invoke;
    block[3] = &unk_1E2540A40;
    v8 = a1;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

+ (id)createTaskInfoForTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__75;
  v17 = __Block_byref_object_dispose__75;
  v18 = 0;
  objc_msgSend(a1, "sharedTaskQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AMSURLTaskInfo_createTaskInfoForTask___block_invoke;
  block[3] = &unk_1E25416B8;
  v11 = &v13;
  v12 = a1;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

+ (id)taskInfoForTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__75;
    v16 = __Block_byref_object_dispose__75;
    v17 = 0;
    objc_msgSend(a1, "sharedTaskQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__AMSURLTaskInfo_taskInfoForTask___block_invoke;
    block[3] = &unk_1E25416B8;
    v10 = &v12;
    v11 = a1;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (OS_dispatch_queue)sharedTaskQueue
{
  if (qword_1ECEAD9B0 != -1)
    dispatch_once(&qword_1ECEAD9B0, &__block_literal_global_17_2);
  return (OS_dispatch_queue *)(id)qword_1ECEAD9B8;
}

void __33__AMSURLTaskInfo_sharedTaskStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ECEAD9A8;
  qword_1ECEAD9A8 = (uint64_t)v0;

}

void __33__AMSURLTaskInfo_sharedTaskQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSURLTaskInfo.task", v2);
  v1 = (void *)qword_1ECEAD9B8;
  qword_1ECEAD9B8 = (uint64_t)v0;

}

- (unint64_t)previousAuthorizationCredentialSource
{
  unint64_t previousAuthorizationCredentialSource;

  os_unfair_recursive_lock_lock_with_options();
  previousAuthorizationCredentialSource = self->_previousAuthorizationCredentialSource;
  os_unfair_recursive_lock_unlock();
  return previousAuthorizationCredentialSource;
}

- (int64_t)retryCount
{
  int64_t retryCount;

  os_unfair_recursive_lock_lock_with_options();
  retryCount = self->_retryCount;
  os_unfair_recursive_lock_unlock();
  return retryCount;
}

- (NSSet)retryIdentifiers
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = (void *)-[NSMutableSet copy](self->_retryIdentifiers, "copy");
  os_unfair_recursive_lock_unlock();
  return (NSSet *)v3;
}

- (void)setPreviousAuthorizationCredentialSource:(unint64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_previousAuthorizationCredentialSource = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setRetryCount:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_retryCount = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)addRetryIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableSet addObject:](self->_retryIdentifiers, "addObject:", v4);

  os_unfair_recursive_lock_unlock();
}

- (void)assertHasExclusiveAccess
{
  NSObject *v3;

  -[AMSURLTaskInfo taskQueue](self, "taskQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_taskLock);
}

- (void)migrateFromTaskInfo:(id)a3
{
  id v4;
  NSURLSessionTaskMetrics *v5;
  NSURLSessionTaskMetrics *metrics;
  void *v7;
  AMSURLRequestProperties *v8;
  AMSURLRequestProperties *properties;
  void *v10;
  NSMutableSet *v11;
  NSMutableSet *retryIdentifiers;
  AMSURLSession *v13;
  AMSURLSession *session;
  unint64_t v15;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v4, "metrics");
  v5 = (NSURLSessionTaskMetrics *)objc_claimAutoreleasedReturnValue();
  metrics = self->_metrics;
  self->_metrics = v5;

  self->_previousAuthorizationCredentialSource = objc_msgSend(v4, "previousAuthorizationCredentialSource");
  objc_msgSend(v4, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (AMSURLRequestProperties *)objc_msgSend(v7, "copy");
  properties = self->_properties;
  self->_properties = v8;

  self->_retryCount = objc_msgSend(v4, "retryCount");
  objc_msgSend(v4, "retryIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSMutableSet *)objc_msgSend(v10, "mutableCopy");
  retryIdentifiers = self->_retryIdentifiers;
  self->_retryIdentifiers = v11;

  objc_msgSend(v4, "session");
  v13 = (AMSURLSession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v13;

  v15 = objc_msgSend(v4, "signpostID");
  self->_signpostID = v15;
  os_unfair_recursive_lock_unlock();
}

- (void)performAsyncBlockWithData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AMSURLTaskInfo contiguousActionPerformer](self, "contiguousActionPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__AMSURLTaskInfo_performAsyncBlockWithData___block_invoke;
  v7[3] = &unk_1E253DC28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "async:", v7);

}

uint64_t __44__AMSURLTaskInfo_performAsyncBlockWithData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performDataAccessUsingBlock:", *(_QWORD *)(a1 + 40));
}

- (void)performSyncBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[AMSURLTaskInfo taskQueue](self, "taskQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[AMSURLTaskInfo contiguousActionPerformer](self, "contiguousActionPerformer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sync:", v4);

}

- (void)setAccount:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__AMSURLTaskInfo_setAccount___block_invoke;
  v6[3] = &unk_1E253E2B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AMSURLTaskInfo performSyncBlockWithExclusiveAccess:](self, "performSyncBlockWithExclusiveAccess:", v6);

}

void __29__AMSURLTaskInfo_setAccount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccount:", v1);

}

- (NSURLResponse)originalResponse
{
  return self->_originalResponse;
}

- (void)setOriginalResponse:(id)a3
{
  objc_storeStrong((id *)&self->_originalResponse, a3);
}

- (os_unfair_recursive_lock_s)taskLock
{
  return self->_taskLock;
}

@end
