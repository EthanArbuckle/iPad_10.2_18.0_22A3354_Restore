@implementation DMCHangDetectionQueue

- (DMCHangDetectionQueue)init
{
  return -[DMCHangDetectionQueue initWithQoS:hangThreshold:owner:](self, "initWithQoS:hangThreshold:owner:", -1, CFSTR("Unknown"), 30.0);
}

- (DMCHangDetectionQueue)initWithQoS:(int64_t)a3 hangThreshold:(double)a4 owner:(id)a5
{
  id v8;
  DMCHangDetectionQueue *v9;
  NSObject *v10;
  uint64_t v11;
  NSOperationQueue *workerQueue;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *logQueue;
  uint64_t v17;
  NSString *owner;
  uint64_t v19;
  DMCBacktraceLogger *logger;
  objc_super v22;

  v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)DMCHangDetectionQueue;
  v9 = -[DMCHangDetectionQueue init](&v22, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_new();
    workerQueue = v9->_workerQueue;
    v9->_workerQueue = (NSOperationQueue *)v11;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v9->_workerQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v9->_workerQueue, "setQualityOfService:", a3);
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_hang_detection_worker_queue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v9->_workerQueue, "setName:", v13);

    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_hang_detection_log_queue"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), v10);
    logQueue = v9->_logQueue;
    v9->_logQueue = (OS_dispatch_queue *)v15;

    v9->_threshold = a4;
    v17 = objc_msgSend(v8, "copy");
    owner = v9->_owner;
    v9->_owner = (NSString *)v17;

    v19 = objc_opt_new();
    logger = v9->_logger;
    v9->_logger = (DMCBacktraceLogger *)v19;

    v9->_shouldDumpStackshot = 1;
    v9->_lastExecutedJob = -1;
    atomic_store(0xFFFFFFFF, (unsigned int *)&v9->_blockNum);

  }
  return v9;
}

- (void)queueBlock:(id)a3
{
  id v4;
  int *p_blockNum;
  unsigned int v6;
  unsigned int v7;
  int v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;
  dispatch_time_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD *v27;
  unsigned int v28;
  BOOL v29;
  BOOL v30;
  _QWORD block[5];
  id v32;
  _QWORD *v33;
  unsigned int v34;
  _QWORD v35[3];
  char v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_blockNum = &self->_blockNum;
  do
    v6 = __ldaxr((unsigned int *)p_blockNum);
  while (__stlxr(v6 + 1, (unsigned int *)p_blockNum));
  v7 = atomic_load((unsigned int *)p_blockNum);
  if (queueBlock__onceToken != -1)
    dispatch_once(&queueBlock__onceToken, &__block_literal_global_8);
  v8 = queueBlock__isInternal;
  v9 = -[DMCHangDetectionQueue shouldDumpStackshot](self, "shouldDumpStackshot");
  if (v8)
    v10 = v9;
  else
    v10 = 0;
  v11 = -[DMCHangDetectionQueue verboseLogEnabled](self, "verboseLogEnabled");
  v12 = v11;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v13 = MEMORY[0x1E0C809B0];
  if (v10 || (v14 = 0, v11))
  {
    +[DMCBacktraceLogger callerOfCurrentMethod](DMCBacktraceLogger, "callerOfCurrentMethod");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v15 = (id)*DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        -[DMCHangDetectionQueue owner](self, "owner");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v16;
        v39 = 1024;
        v40 = v7;
        v41 = 2114;
        v42 = v14;
        _os_log_impl(&dword_1A4951000, v15, OS_LOG_TYPE_DEBUG, "DMCHangDetectionQueue (%{public}@) queueing task %d from: %{public}@", buf, 0x1Cu);

      }
    }
    if (v10)
    {
      -[DMCHangDetectionQueue threshold](self, "threshold");
      if (v17 > 0.0)
      {
        -[DMCHangDetectionQueue threshold](self, "threshold");
        v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
        -[DMCHangDetectionQueue logQueue](self, "logQueue");
        v20 = objc_claimAutoreleasedReturnValue();
        block[0] = v13;
        block[1] = 3221225472;
        block[2] = __36__DMCHangDetectionQueue_queueBlock___block_invoke_8;
        block[3] = &unk_1E4D37408;
        v33 = v35;
        block[4] = self;
        v34 = v7;
        v14 = v14;
        v32 = v14;
        dispatch_after(v19, v20, block);

      }
    }
  }
  -[DMCHangDetectionQueue workerQueue](self, "workerQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __36__DMCHangDetectionQueue_queueBlock___block_invoke_13;
  v24[3] = &unk_1E4D37458;
  v29 = v10;
  v24[4] = self;
  v22 = v4;
  v26 = v22;
  v30 = v12;
  v28 = v7;
  v23 = v14;
  v25 = v23;
  v27 = v35;
  objc_msgSend(v21, "addOperationWithBlock:", v24);

  _Block_object_dispose(v35, 8);
}

BOOL __36__DMCHangDetectionQueue_queueBlock___block_invoke()
{
  _BOOL8 result;

  result = +[DMCFeatureFlags isAppleInternal](DMCFeatureFlags, "isAppleInternal");
  queueBlock__isInternal = result;
  return result;
}

void __36__DMCHangDetectionQueue_queueBlock___block_invoke_8(uint64_t a1)
{
  __CFString *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) + 1 == *(_DWORD *)(a1 + 56))
  {
    if (+[DMCFeatureFlags isAppleInternal](DMCFeatureFlags, "isAppleInternal"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "getBacktraceFromTrackedThread");
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v3 = *DMCLogObjects();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v4 = *(void **)(a1 + 32);
        v5 = v3;
        objc_msgSend(v4, "owner");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "threshold");
        v8 = *(_DWORD *)(a1 + 56);
        v9 = CFSTR("<None>");
        v10 = *(_QWORD *)(a1 + 40);
        if (v2)
          v9 = v2;
        v21 = 138544386;
        v22 = v6;
        v23 = 2048;
        v24 = v7;
        v25 = 1024;
        v26 = v8;
        v27 = 2114;
        v28 = v10;
        v29 = 2114;
        v30 = v9;
        _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_FAULT, "DMCHangDetectionQueue (%{public}@) was blocked for more than %.1f seconds. Queued task: %d %{public}@. Callstack: %{public}@", (uint8_t *)&v21, 0x30u);

      }
    }
    else
    {
      v11 = *DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(void **)(a1 + 32);
        v13 = v11;
        objc_msgSend(v12, "owner");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "threshold");
        v15 = *(_DWORD *)(a1 + 56);
        v16 = *(_QWORD *)(a1 + 40);
        v21 = 138544130;
        v22 = v14;
        v23 = 2048;
        v24 = v17;
        v25 = 1024;
        v26 = v15;
        v27 = 2114;
        v28 = v16;
        _os_log_impl(&dword_1A4951000, v13, OS_LOG_TYPE_ERROR, "DMCHangDetectionQueue (%{public}@) was blocked for more than %.1f seconds. Queued task: %d %{public}@", (uint8_t *)&v21, 0x26u);

      }
      v2 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "owner");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", CFSTR("_queue_latestStackshot.ips"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    DMCHangTracerDirectory();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMCBacktraceLogger dumpStackshotToPath:fileName:](DMCBacktraceLogger, "dumpStackshotToPath:fileName:", v20, v19);

  }
}

void __36__DMCHangDetectionQueue_queueBlock___block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[6];
  int v11;
  char v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (+[DMCFeatureFlags isAppleInternal](DMCFeatureFlags, "isAppleInternal") && *(_BYTE *)(a1 + 68))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "trackCurrentThread");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (*(_BYTE *)(a1 + 69))
  {
    v2 = *DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(void **)(a1 + 32);
      v4 = v2;
      objc_msgSend(v3, "owner");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_DWORD *)(a1 + 64);
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v14 = v5;
      v15 = 1024;
      v16 = v6;
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_DEBUG, "DMCHangDetectionQueue (%{public}@) done executing task %d from: %{public}@", buf, 0x1Cu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__DMCHangDetectionQueue_queueBlock___block_invoke_14;
  block[3] = &unk_1E4D37430;
  v12 = *(_BYTE *)(a1 + 68);
  v11 = *(_DWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v9;
  dispatch_async(v8, block);

}

uint64_t __36__DMCHangDetectionQueue_queueBlock___block_invoke_14(uint64_t result)
{
  if (*(_BYTE *)(result + 52))
  {
    *(_DWORD *)(*(_QWORD *)(result + 32) + 12) = *(_DWORD *)(result + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)shouldDumpStackshot
{
  DMCHangDetectionQueue *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[DMCHangDetectionQueue logQueue](self, "logQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__DMCHangDetectionQueue_shouldDumpStackshot__block_invoke;
  v5[3] = &unk_1E4D37480;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __44__DMCHangDetectionQueue_shouldDumpStackshot__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)setShouldDumpStackshot:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[DMCHangDetectionQueue logQueue](self, "logQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__DMCHangDetectionQueue_setShouldDumpStackshot___block_invoke;
  v6[3] = &unk_1E4D374A8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __48__DMCHangDetectionQueue_setShouldDumpStackshot___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)verboseLogEnabled
{
  DMCHangDetectionQueue *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[DMCHangDetectionQueue logQueue](self, "logQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__DMCHangDetectionQueue_verboseLogEnabled__block_invoke;
  v5[3] = &unk_1E4D37480;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __42__DMCHangDetectionQueue_verboseLogEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

- (void)setVerboseLogEnabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[DMCHangDetectionQueue logQueue](self, "logQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__DMCHangDetectionQueue_setVerboseLogEnabled___block_invoke;
  v6[3] = &unk_1E4D374A8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __46__DMCHangDetectionQueue_setVerboseLogEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = *(_BYTE *)(result + 40);
  return result;
}

- (void)waitUntilAllBlocksAreFinished
{
  id v2;

  -[DMCHangDetectionQueue workerQueue](self, "workerQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilAllOperationsAreFinished");

}

- (NSString)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSOperationQueue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workerQueue, a3);
}

- (OS_dispatch_queue)logQueue
{
  return self->_logQueue;
}

- (void)setLogQueue:(id)a3
{
  objc_storeStrong((id *)&self->_logQueue, a3);
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (int)lastExecutedJob
{
  return self->_lastExecutedJob;
}

- (void)setLastExecutedJob:(int)a3
{
  self->_lastExecutedJob = a3;
}

- (int)blockNum
{
  return atomic_load((unsigned int *)&self->_blockNum);
}

- (void)setBlockNum:(int)a3
{
  atomic_store(a3, (unsigned int *)&self->_blockNum);
}

- (DMCBacktraceLogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
