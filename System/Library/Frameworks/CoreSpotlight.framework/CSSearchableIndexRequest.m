@implementation CSSearchableIndexRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataWrapper, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_completionDataBlock, 0);
  objc_storeStrong(&self->_performBlock, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setPerformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CSSearchableIndexRequest)initWithSearchableIndex:(id)a3 label:(id)a4
{
  return -[CSSearchableIndexRequest initWithSearchableIndex:label:critical:](self, "initWithSearchableIndex:label:critical:", a3, a4, 0);
}

- (void)setCompletionDataBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

uint64_t __66__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(a1 + 40));
}

void __45__CSSearchableIndexRequest__finishWithError___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D782104]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)_finishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id completionDataBlock;
  void *v19;
  id v20;
  CSDataWrapper *v21;
  CSDataWrapper *dataWrapper;
  CSSearchableIndex *index;
  void *v24;
  id *v25;
  CSDataWrapper *v26;
  id v27;
  CSDataWrapper *v28;
  id v29;
  id completionBlock;
  void *v31;
  id v32;
  CSSearchableIndex *v33;
  void *v34;
  _QWORD *v35;
  id v36;
  id v37;
  id performBlock;
  _QWORD v39[6];
  _QWORD v40[6];
  _QWORD v41[7];
  _QWORD v42[7];
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_finished)
  {
    if (v4)
    {
      objc_msgSend(v4, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("CSIndexErrorDomain"));

      if (v7)
      {
        v8 = v5;
      }
      else
      {
        v43 = *MEMORY[0x1E0CB3388];
        v44[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1003, v16);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
      logForCSLogCategoryIndex();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CSSearchableIndexRequest _finishWithError:].cold.2();
    }
    else
    {
      logForCSLogCategoryIndex();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CSSearchableIndexRequest _finishWithError:].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
      v8 = 0;
    }

    v17 = (id)sCSSearchableIndexRequests;
    objc_sync_enter(v17);
    objc_msgSend((id)sCSSearchableIndexRequests, "removeObject:", self);
    objc_sync_exit(v17);

    -[CSSearchableIndexRequest _unthrottleIfNecessary](self, "_unthrottleIfNecessary");
    completionDataBlock = self->_completionDataBlock;
    if (completionDataBlock)
    {
      v19 = _Block_copy(completionDataBlock);
      v20 = self->_completionDataBlock;
      self->_completionDataBlock = 0;

      v21 = self->_dataWrapper;
      dataWrapper = self->_dataWrapper;
      self->_dataWrapper = 0;

      index = self->_index;
      if (self->_critical)
      {
        -[CSSearchableIndex criticalQueue](index, "criticalQueue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __45__CSSearchableIndexRequest__finishWithError___block_invoke;
        v42[3] = &unk_1E2405010;
        v25 = (id *)v42;
        v42[6] = v19;
        v42[4] = v8;
        v42[5] = v21;
        v26 = v21;
        v27 = v19;
        objc_msgSend(v24, "async:critical:", v42, 1);
      }
      else
      {
        -[CSSearchableIndex throttleQueue](index, "throttleQueue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __45__CSSearchableIndexRequest__finishWithError___block_invoke_2;
        v41[3] = &unk_1E2405010;
        v25 = (id *)v41;
        v41[6] = v19;
        v41[4] = v8;
        v41[5] = v21;
        v28 = v21;
        v29 = v19;
        objc_msgSend(v24, "async:", v41);
      }

    }
    completionBlock = self->_completionBlock;
    if (completionBlock)
    {
      v31 = _Block_copy(completionBlock);
      v32 = self->_completionBlock;
      self->_completionBlock = 0;

      v33 = self->_index;
      if (self->_critical)
      {
        -[CSSearchableIndex criticalQueue](v33, "criticalQueue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __45__CSSearchableIndexRequest__finishWithError___block_invoke_3;
        v40[3] = &unk_1E2405038;
        v35 = v40;
        v40[5] = v31;
        v40[4] = v8;
        v36 = v31;
        objc_msgSend(v34, "async:critical:", v40, 1);
      }
      else
      {
        -[CSSearchableIndex throttleQueue](v33, "throttleQueue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __45__CSSearchableIndexRequest__finishWithError___block_invoke_4;
        v39[3] = &unk_1E2405038;
        v35 = v39;
        v39[5] = v31;
        v39[4] = v8;
        v37 = v31;
        objc_msgSend(v34, "async:", v39);
      }

    }
    performBlock = self->_performBlock;
    self->_performBlock = 0;

    self->_finished = 1;
  }

}

- (void)start
{
  __assert_rtn("-[CSSearchableIndexRequest start]", "CSSearchableIndexRequest.m", 245, "!_started");
}

- (void)dealloc
{
  __assert_rtn("-[CSSearchableIndexRequest dealloc]", "CSSearchableIndexRequest.m", 67, "!_started || _finished");
}

- (void)_unthrottleIfNecessary
{
  if (!self->_critical && self->_throttled)
  {
    -[CSSearchableIndex unthrottle](self->_index, "unthrottle");
    self->_throttled = 0;
  }
}

- (void)_throttleIfNecessary
{
  if (!self->_critical && !self->_throttled)
  {
    -[CSSearchableIndex throttle](self->_index, "throttle");
    self->_throttled = 1;
  }
}

- (void)_perform
{
  __assert_rtn("-[CSSearchableIndexRequest _perform]", "CSSearchableIndexRequest.m", 172, "_performBlock");
}

- (void)retryIfNecessaryWithError:(id)a3 dataWrapper:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t retryCount;
  unint64_t maxRetryCount;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x18D782104]();
  if (v6)
    v9 = 0;
  else
    v9 = v7;
  objc_storeStrong((id *)&self->_dataWrapper, v9);
  if (!v6)
    goto LABEL_12;
  objc_msgSend(v6, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8])
    || objc_msgSend(v6, "code") != 4097 && objc_msgSend(v6, "code") != 4099)
  {

LABEL_12:
    -[CSSearchableIndex requestQueue](self->_index, "requestQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper___block_invoke_4;
    v18[3] = &unk_1E24013B8;
    v18[4] = self;
    v19 = v6;
    objc_msgSend(v17, "async:", v18);

    goto LABEL_13;
  }
  retryCount = self->_retryCount;
  maxRetryCount = self->_maxRetryCount;

  if (retryCount >= maxRetryCount || !self->_performBlock)
    goto LABEL_12;
  ++self->_retryCount;
  -[CSSearchableIndex requestQueue](self->_index, "requestQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "suspend");
  -[CSSearchableIndex throttleQueue](self->_index, "throttleQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "suspend");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper___block_invoke;
  v20[3] = &unk_1E2401ED0;
  v20[4] = self;
  v21 = v13;
  v22 = v14;
  v15 = v14;
  v16 = v13;
  objc_msgSend(v16, "async:", v20);

LABEL_13:
  objc_autoreleasePoolPop(v8);

}

void __45__CSSearchableIndexRequest__finishWithError___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D782104]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)retryIfNecessaryWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CSSearchableIndexRequest retryIfNecessaryWithError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  -[CSSearchableIndexRequest retryIfNecessaryWithError:dataWrapper:](self, "retryIfNecessaryWithError:dataWrapper:", v4, 0);
}

+ (void)initialize
{
  id v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3 = (void *)sCSSearchableIndexRequests;
    sCSSearchableIndexRequests = (uint64_t)v2;

  }
}

- (CSSearchableIndexRequest)initWithSearchableIndex:(id)a3 label:(id)a4 critical:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  CSSearchableIndexRequest *v12;
  CSSearchableIndexRequest *v13;
  unsigned int v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  if (!v9)
    -[CSSearchableIndexRequest initWithSearchableIndex:label:critical:].cold.1();
  v11 = v10;
  if (!v10)
    -[CSSearchableIndexRequest initWithSearchableIndex:label:critical:].cold.2();
  v16.receiver = self;
  v16.super_class = (Class)CSSearchableIndexRequest;
  v12 = -[CSSearchableIndexRequest init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    do
      v14 = __ldaxr((unsigned int *)&sCSSearchableIndexRequestID);
    while (__stlxr(v14 + 1, (unsigned int *)&sCSSearchableIndexRequestID));
    atomic_store(v14, &v12->_requestID);
    objc_storeStrong((id *)&v12->_index, a3);
    objc_storeStrong((id *)&v13->_label, a4);
    v13->_retryCount = 0;
    v13->_maxRetryCount = 1;
    *(_DWORD *)&v13->_shouldThrottle = 1;
    v13->_critical = a5;
  }

  return v13;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 6);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = atomic_load(&self->_requestID);
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("id=%ld"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("label=\"%@\"), self->_label);
  objc_msgSend(v3, "addObject:", v7);

  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CSSearchableIndex name](self->_index, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("index=\"%@\"/%p"), v9, self->_index);
  objc_msgSend(v3, "addObject:", v10);

  if (self->_retryCount)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("retry=%ld/%ld"), self->_retryCount, self->_maxRetryCount);
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  if (-[CSSearchableIndexRequest finished](self, "finished"))
    objc_msgSend(v12, "addObject:", CFSTR("finished"));
  if (-[CSSearchableIndexRequest critical](self, "critical"))
    objc_msgSend(v12, "addObject:", CFSTR("critical"));
  if (objc_msgSend(v12, "count"))
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("|"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("flags=%@"), v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  if (self->_dataWrapper)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("data=%p"), self->_dataWrapper);
    objc_msgSend(v3, "addObject:", v16);

  }
  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  v18 = objc_opt_class();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("<%@:%p; %@>"), v18, self, v19);

  return v20;
}

void __66__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v2 = (void *)MEMORY[0x18D782104]();
  objc_msgSend(a1[4], "completionDataBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper___block_invoke_2;
    v12[3] = &unk_1E2404FC0;
    v15 = v3;
    v13 = a1[5];
    v14 = a1[6];
    objc_msgSend(a1[4], "setCompletionDataBlock:", v12);

    v5 = v15;
  }
  else
  {
    objc_msgSend(a1[4], "completionBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper___block_invoke_3;
    v8[3] = &unk_1E2404FE8;
    v11 = v6;
    v9 = a1[5];
    v10 = a1[6];
    v7 = a1[4];
    v5 = v6;
    objc_msgSend(v7, "setCompletionBlock:", v8);

  }
  objc_msgSend(a1[4], "_perform");

  objc_autoreleasePoolPop(v2);
}

uint64_t __66__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "resume");
  return objc_msgSend(*(id *)(a1 + 40), "resume");
}

uint64_t __66__CSSearchableIndexRequest_retryIfNecessaryWithError_dataWrapper___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "resume");
  return objc_msgSend(*(id *)(a1 + 40), "resume");
}

void __45__CSSearchableIndexRequest__finishWithError___block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D782104]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __45__CSSearchableIndexRequest__finishWithError___block_invoke_4(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D782104]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CSSearchableIndex requestQueue](self->_index, "requestQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CSSearchableIndexRequest_finishWithError___block_invoke;
  v7[3] = &unk_1E24013B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "async:", v7);

}

void __44__CSSearchableIndexRequest_finishWithError___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D782104]();
  objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (unint64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxRetryCount:(unint64_t)a3
{
  self->_maxRetryCount = a3;
}

- (BOOL)shouldThrottle
{
  return self->_shouldThrottle;
}

- (void)setShouldThrottle:(BOOL)a3
{
  self->_shouldThrottle = a3;
}

- (NSData)data
{
  return self->_data;
}

- (id)performBlock
{
  return self->_performBlock;
}

- (id)completionDataBlock
{
  return self->_completionDataBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_storeStrong((id *)&self->_index, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CSDataWrapper)dataWrapper
{
  return self->_dataWrapper;
}

- (void)setDataWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_dataWrapper, a3);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unsigned)requestID
{
  return atomic_load(&self->_requestID);
}

- (void)setRequestID:(unsigned int)a3
{
  atomic_store(a3, &self->_requestID);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)throttled
{
  return self->_throttled;
}

- (void)setThrottled:(BOOL)a3
{
  self->_throttled = a3;
}

- (BOOL)critical
{
  return self->_critical;
}

- (void)setCritical:(BOOL)a3
{
  self->_critical = a3;
}

- (void)initWithSearchableIndex:label:critical:.cold.1()
{
  __assert_rtn("-[CSSearchableIndexRequest initWithSearchableIndex:label:critical:]", "CSSearchableIndexRequest.m", 43, "index");
}

- (void)initWithSearchableIndex:label:critical:.cold.2()
{
  __assert_rtn("-[CSSearchableIndexRequest initWithSearchableIndex:label:critical:]", "CSSearchableIndexRequest.m", 44, "label");
}

- (void)retryIfNecessaryWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a2, a3, "~~~ retryIfNecessaryWithError: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_finishWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a2, a3, "Finished request:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_finishWithError:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_6();
  v3 = v0;
  OUTLINED_FUNCTION_1_1(&dword_18C42F000, v1, (uint64_t)v1, "Finished request:%@, error:%@", v2);
  OUTLINED_FUNCTION_1();
}

@end
