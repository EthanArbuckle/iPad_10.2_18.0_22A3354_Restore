@implementation LKHangDetectionQueue

- (LKHangDetectionQueue)init
{
  return -[LKHangDetectionQueue initWithQoS:hangThreshold:](self, "initWithQoS:hangThreshold:", 21, 5.0);
}

- (LKHangDetectionQueue)initWithQoS:(unsigned int)a3 hangThreshold:(double)a4
{
  LKHangDetectionQueue *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workerQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *logQueue;
  uint64_t v12;
  LKBacktraceLogger *backtraceLogger;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)LKHangDetectionQueue;
  v6 = -[LKHangDetectionQueue init](&v15, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a3, -1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("lk_hang_detection_worker_queue", v7);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("lk_hang_detection_log_queue", 0);
    logQueue = v6->_logQueue;
    v6->_logQueue = (OS_dispatch_queue *)v10;

    v6->_threshold = a4;
    v12 = objc_opt_new();
    backtraceLogger = v6->_backtraceLogger;
    v6->_backtraceLogger = (LKBacktraceLogger *)v12;

  }
  return v6;
}

- (void)queueBlock:(id)a3
{
  id v4;
  _BOOL4 v5;
  BOOL v6;
  uint64_t v7;
  double v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  BOOL v16;
  _QWORD block[6];
  _QWORD v18[3];
  char v19;

  v4 = a3;
  v5 = +[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild");
  v6 = v5;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v7 = MEMORY[0x24BDAC760];
  if (v5)
  {
    -[LKHangDetectionQueue threshold](self, "threshold");
    v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    -[LKHangDetectionQueue logQueue](self, "logQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __35__LKHangDetectionQueue_queueBlock___block_invoke;
    block[3] = &unk_24D59AED8;
    block[4] = self;
    block[5] = v18;
    dispatch_after(v9, v10, block);

  }
  -[LKHangDetectionQueue workerQueue](self, "workerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __35__LKHangDetectionQueue_queueBlock___block_invoke_4;
  v13[3] = &unk_24D59AF28;
  v16 = v6;
  v13[4] = self;
  v14 = v4;
  v15 = v18;
  v12 = v4;
  dispatch_async(v11, v13);

  _Block_object_dispose(v18, 8);
}

void __35__LKHangDetectionQueue_queueBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_2167FC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "LKHangDetectionQueue: task timed out", (uint8_t *)&v7, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "backtraceLogger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "getBacktraceFromTrackedThread");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "lastPrintedCallStack");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToArray:", v4);

    if ((v5 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "threshold");
        v7 = 134218242;
        v8 = v6;
        v9 = 2112;
        v10 = v3;
        _os_log_impl(&dword_2167FC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Queue was blocked for more than %.1f seconds. Call stack:\n%@", (uint8_t *)&v7, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 32), "setLastPrintedCallStack:", v3);
    }

  }
}

void __35__LKHangDetectionQueue_queueBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[6];
  _QWORD block[5];

  v2 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "logQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __35__LKHangDetectionQueue_queueBlock___block_invoke_2;
    block[3] = &unk_24D59AF00;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_sync(v3, block);

  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "logQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __35__LKHangDetectionQueue_queueBlock___block_invoke_3;
    v7[3] = &unk_24D59AED8;
    v6 = *(_QWORD *)(a1 + 48);
    v7[4] = *(_QWORD *)(a1 + 32);
    v7[5] = v6;
    dispatch_async(v5, v7);

  }
}

void __35__LKHangDetectionQueue_queueBlock___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "backtraceLogger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trackCurrentThread");

}

uint64_t __35__LKHangDetectionQueue_queueBlock___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "setLastPrintedCallStack:", 0);
}

- (OS_dispatch_queue)workerQueue
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

- (LKBacktraceLogger)backtraceLogger
{
  return self->_backtraceLogger;
}

- (void)setBacktraceLogger:(id)a3
{
  objc_storeStrong((id *)&self->_backtraceLogger, a3);
}

- (NSArray)lastPrintedCallStack
{
  return self->_lastPrintedCallStack;
}

- (void)setLastPrintedCallStack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPrintedCallStack, 0);
  objc_storeStrong((id *)&self->_backtraceLogger, 0);
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end
