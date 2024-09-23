@implementation DMCJobQueue

- (DMCJobQueue)init
{
  DMCHangDetectionQueue *v3;
  DMCJobQueue *v4;

  v3 = -[DMCHangDetectionQueue initWithQoS:hangThreshold:owner:]([DMCHangDetectionQueue alloc], "initWithQoS:hangThreshold:owner:", -1, CFSTR("Default"), 30.0);
  v4 = -[DMCJobQueue initWithExecutionQueue:](self, "initWithExecutionQueue:", v3);

  return v4;
}

- (DMCJobQueue)initWithExecutionQueue:(id)a3
{
  id v5;
  DMCJobQueue *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *queueID;
  dispatch_queue_t v12;
  OS_dispatch_queue *jobQueue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DMCJobQueue;
  v6 = -[DMCJobQueue init](&v15, sel_init);
  if (v6)
  {
    do
      v7 = __ldaxr((unsigned int *)&initWithExecutionQueue___queueNumber);
    while (__stlxr(v7 + 1, (unsigned int *)&initWithExecutionQueue___queueNumber));
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = atomic_load((unsigned int *)&initWithExecutionQueue___queueNumber);
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%d"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    queueID = v6->_queueID;
    v6->_queueID = (NSString *)v10;

    v12 = dispatch_queue_create("DMCJobQueue job queue", 0);
    jobQueue = v6->_jobQueue;
    v6->_jobQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v6->_executionQueue, a3);
    v6->_nextJobSequenceNumber = 0;
  }

  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *queueID;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  __int16 v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    queueID = self->_queueID;
    *(_DWORD *)buf = 138543618;
    v7 = queueID;
    v8 = 2114;
    v9 = queueID;
    _os_log_impl(&dword_1A4951000, v3, OS_LOG_TYPE_DEFAULT, "DMCJQ %{public}@ Destroying job queue %{public}@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)DMCJobQueue;
  -[DMCJobQueue dealloc](&v5, sel_dealloc);
}

- (void)fromFunction:(const char *)a3 enqueueJob:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSString *queueID;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  const char *v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), self->_nextJobSequenceNumber);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->_nextJobSequenceNumber;
  v8 = *DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    queueID = self->_queueID;
    *(_DWORD *)buf = 138543874;
    v18 = queueID;
    v19 = 2114;
    v20 = v7;
    v21 = 2082;
    v22 = a3;
    _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_DEFAULT, "DMCJQ %{public}@ Enqueueing jobBlock %{public}@, calling function %{public}s", buf, 0x20u);
  }
  -[DMCJobQueue jobQueue](self, "jobQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke;
  block[3] = &unk_1E4D37640;
  block[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = a3;
  v11 = v6;
  v12 = v7;
  dispatch_async(v10, block);

}

void __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  _QWORD v11[5];
  id v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "jobQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

  v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v6 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    v15 = v5;
    v16 = 2114;
    v17 = v4;
    v18 = 2082;
    v19 = v6;
    _os_log_impl(&dword_1A4951000, v3, OS_LOG_TYPE_DEFAULT, "DMCJQ %{public}@ Dispatching to executionQueue jobBlock %{public}@ - %{public}s", buf, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 32), "executionQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke_9;
  v11[3] = &unk_1E4D37640;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v10 = *(_OWORD *)(a1 + 48);
  v9 = (id)v10;
  v13 = v10;
  objc_msgSend(v7, "queueBlock:", v11);

}

void __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke_9(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[5];
    v4 = *(_QWORD *)(a1[4] + 32);
    v5 = a1[7];
    *(_DWORD *)buf = 138543874;
    v13 = v4;
    v14 = 2114;
    v15 = v3;
    v16 = 2082;
    v17 = v5;
    _os_log_impl(&dword_1A4951000, v2, OS_LOG_TYPE_DEFAULT, "DMCJQ %{public}@ Executing jobBlock %{public}@ - %{public}s", buf, 0x20u);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke_10;
  v9[3] = &unk_1E4D37618;
  v7 = a1[6];
  v6 = a1[7];
  v8 = (void *)a1[5];
  v9[4] = a1[4];
  v11 = v6;
  v10 = v8;
  (*(void (**)(uint64_t, _QWORD *))(v7 + 16))(v7, v9);

}

uint64_t __39__DMCJobQueue_fromFunction_enqueueJob___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "jobDidFinishFromFunction:jobBlockDescription:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)jobDidFinishFromFunction:(const char *)a3 jobBlockDescription:(id)a4
{
  id v6;
  NSObject *v7;
  NSString *queueID;
  int v9;
  NSString *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    queueID = self->_queueID;
    v9 = 138543874;
    v10 = queueID;
    v11 = 2114;
    v12 = v6;
    v13 = 2082;
    v14 = a3;
    _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_DEFAULT, "DMCJQ %{public}@ JobBlock %{public}@ finished, calling function %{public}s", (uint8_t *)&v9, 0x20u);
  }
  dispatch_resume((dispatch_object_t)self->_jobQueue);

}

- (void)queueBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DMCJobQueue executionQueue](self, "executionQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueBlock:", v4);

}

- (void)waitForEnqueuedJobsToCompleteCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DMCJobQueue jobQueue](self, "jobQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke;
  v7[3] = &unk_1E4D370F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "jobQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

  objc_msgSend(*(id *)(a1 + 32), "executionQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E4D37668;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "queueBlock:", v5);

}

void __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E4D37668;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __60__DMCJobQueue_waitForEnqueuedJobsToCompleteCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "jobQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v3);

}

- (DMCHangDetectionQueue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executionQueue, a3);
}

- (OS_dispatch_queue)jobQueue
{
  return self->_jobQueue;
}

- (void)setJobQueue:(id)a3
{
  objc_storeStrong((id *)&self->_jobQueue, a3);
}

- (NSString)queueID
{
  return self->_queueID;
}

- (void)setQueueID:(id)a3
{
  objc_storeStrong((id *)&self->_queueID, a3);
}

- (unsigned)nextJobSequenceNumber
{
  return self->_nextJobSequenceNumber;
}

- (void)setNextJobSequenceNumber:(unsigned int)a3
{
  self->_nextJobSequenceNumber = a3;
}

- (id)executionQueueAbortCompletionBlock
{
  return self->_executionQueueAbortCompletionBlock;
}

- (void)setExecutionQueueAbortCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_executionQueueAbortCompletionBlock, 0);
  objc_storeStrong((id *)&self->_queueID, 0);
  objc_storeStrong((id *)&self->_jobQueue, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
}

@end
