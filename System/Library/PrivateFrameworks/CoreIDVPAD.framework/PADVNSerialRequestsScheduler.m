@implementation PADVNSerialRequestsScheduler

- (PADVNSerialRequestsScheduler)init
{
  PADVNSerialRequestsScheduler *v2;
  objc_class *v3;
  id v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PADVNSerialRequestsScheduler;
  v2 = -[PADVNSerialRequestsScheduler init](&v8, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    -[PADVNSerialRequestsScheduler _reset](v2, "_reset");
  }
  return v2;
}

- (PADVNSerialRequestsScheduler)initWithQueue:(id)a3
{
  id v5;
  PADVNSerialRequestsScheduler *v6;
  PADVNSerialRequestsScheduler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PADVNSerialRequestsScheduler;
  v6 = -[PADVNSerialRequestsScheduler init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    -[PADVNSerialRequestsScheduler _reset](v7, "_reset");
  }

  return v7;
}

- (void)processFrame:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_remainingRequests)
  {

  }
  else
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__PADVNSerialRequestsScheduler_processFrame___block_invoke;
    block[3] = &unk_24D0CF438;
    objc_copyWeak(&v9, &location);
    v8 = v5;
    dispatch_async(queue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);

  }
}

void __45__PADVNSerialRequestsScheduler_processFrame___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  int v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained
    && !WeakRetained[4]
    && (v5 = WeakRetained, v4 = objc_msgSend(WeakRetained, "shouldProcessFrame:", *(_QWORD *)(a1 + 32)), v3 = v5, v4))
  {
    objc_msgSend(v5, "_dispatchVisionRequestForFrame:", *(_QWORD *)(a1 + 32));

  }
  else
  {

  }
}

- (void)waitForCurrentFrameProcessingWithCompletion:(id)a3
{
  void *v4;
  id currentFrameProcessingCompletion;

  if (self->_isProcessingFrame)
  {
    v4 = _Block_copy(a3);
    currentFrameProcessingCompletion = self->_currentFrameProcessingCompletion;
    self->_currentFrameProcessingCompletion = v4;

  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_dispatchVisionRequestForFrame:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *requests;
  NSMutableDictionary *v7;
  NSMutableDictionary *currentObservationComposite;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSError **p_requestError;
  NSError *v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  id location;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_remainingRequests)
    -[PADVNSerialRequestsScheduler _dispatchVisionRequestForFrame:].cold.2();
  self->_isProcessingFrame = 1;
  objc_initWeak(&location, self);
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke;
  v45[3] = &unk_24D0CF488;
  objc_copyWeak(&v46, &location);
  -[PADVNSerialRequestsScheduler requestsForFrame:handler:](self, "requestsForFrame:handler:", v4, v45);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  requests = self->_requests;
  self->_requests = v5;

  self->_remainingRequests = -[NSArray count](self->_requests, "count");
  v7 = (NSMutableDictionary *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  currentObservationComposite = self->_currentObservationComposite;
  self->_currentObservationComposite = v7;

  v9 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v11 = self->_requests;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v9;
        else
          v16 = v10;
        objc_msgSend(v16, "addObject:", v15);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v12);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke_3;
  block[3] = &unk_24D0CF460;
  objc_copyWeak(&v40, &location);
  v18 = v10;
  v38 = v18;
  v19 = v4;
  v39 = v19;
  dispatch_async(queue, block);
  v20 = objc_alloc(MEMORY[0x24BDF9C28]);
  v21 = objc_msgSend(v19, "buffer");
  v22 = objc_msgSend(v19, "orientation");
  v23 = (void *)objc_msgSend(v20, "initWithCVPixelBuffer:orientation:options:", v21, v22, MEMORY[0x24BDBD1B8]);
  v36 = 0;
  v24 = objc_msgSend(v23, "performRequests:error:", v9, &v36);
  v25 = v36;
  v26 = v36;
  if ((v24 & 1) == 0)
  {
    v27 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[PADVNSerialRequestsScheduler _dispatchVisionRequestForFrame:].cold.1((uint64_t)v26, v27, v28, v29, v30, v31, v32, v33);

    self->_remainingRequests -= objc_msgSend(v9, "count");
    p_requestError = &self->_requestError;
    objc_storeStrong((id *)&self->_requestError, v25);
    if (!self->_remainingRequests)
    {
      -[PADVNSerialRequestsScheduler handleObservationCompositeError:](self, "handleObservationCompositeError:", self->_requestError);
      v35 = *p_requestError;
      *p_requestError = 0;

    }
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);

}

void __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  NSObject **WeakRetained;
  NSObject **v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained[3];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke_2;
    block[3] = &unk_24D0CF460;
    objc_copyWeak(&v14, v7);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

    objc_destroyWeak(&v14);
  }

}

void __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "handleResultForRequest:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __63__PADVNSerialRequestsScheduler__dispatchVisionRequestForFrame___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
          v9 = *(_QWORD *)(a1 + 40);
          v11 = 0;
          objc_msgSend(v8, "performOn:error:", v9, &v11);
          v10 = v11;
          objc_msgSend(WeakRetained, "handleResultForRequest:error:", v8, v10);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
}

- (BOOL)shouldProcessFrame:(id)a3
{
  return 1;
}

- (id)requestsForFrame:(id)a3 handler:(id)a4
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)handleResultForRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *requestError;
  NSMutableDictionary *currentObservationComposite;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  --self->_remainingRequests;
  if (v7)
  {
    v9 = recentlyLoggedError;
    objc_msgSend(v7, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend((id)v9, "isEqualToString:", v10);

    if ((v9 & 1) == 0)
    {
      v11 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PADVNSerialRequestsScheduler handleResultForRequest:error:].cold.2((uint64_t)v6, (uint64_t)v8, v11);

      objc_msgSend(v8, "debugDescription");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)recentlyLoggedError;
      recentlyLoggedError = v12;

    }
    objc_storeStrong((id *)&self->_requestError, a4);
  }
  if (self->_requestError)
  {
    if (!self->_remainingRequests)
    {
      -[PADVNSerialRequestsScheduler handleObservationCompositeError:](self, "handleObservationCompositeError:");
      requestError = self->_requestError;
      self->_requestError = 0;
LABEL_19:

    }
  }
  else if (self->_currentObservationComposite)
  {
    -[PADVNSerialRequestsScheduler observationsFromRequest:](self, "observationsFromRequest:", v6);
    requestError = (void *)objc_claimAutoreleasedReturnValue();
    if (requestError)
    {
      hasLoggedObservationError = 0;
      currentObservationComposite = self->_currentObservationComposite;
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](currentObservationComposite, "setObject:forKeyedSubscript:", requestError, v17);

      v18 = -[NSMutableDictionary count](self->_currentObservationComposite, "count");
      if (v18 == -[NSArray count](self->_requests, "count"))
      {
        -[NSMutableArray addObject:](self->_currentObservationCompositeSet, "addObject:", self->_currentObservationComposite);
        -[PADVNSerialRequestsScheduler analyzeObservationComposite:](self, "analyzeObservationComposite:", self->_currentObservationComposite);
        v19 = self->_currentObservationComposite;
        self->_currentObservationComposite = 0;

        v20 = -[PADVNSerialRequestsScheduler observationCompositeSetSize](self, "observationCompositeSetSize");
        if (-[NSMutableArray count](self->_currentObservationCompositeSet, "count") == v20)
        {
          -[PADVNSerialRequestsScheduler analyzeObservationCompositeSet:](self, "analyzeObservationCompositeSet:", self->_currentObservationCompositeSet);
          -[NSMutableArray removeObjectAtIndex:](self->_currentObservationCompositeSet, "removeObjectAtIndex:", 0);
        }
      }
    }
    else if ((hasLoggedObservationError & 1) == 0)
    {
      v21 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[PADVNSerialRequestsScheduler handleResultForRequest:error:].cold.1((uint64_t)v6, v21, v22, v23, v24, v25, v26, v27);

      hasLoggedObservationError = 1;
    }
    goto LABEL_19;
  }

}

- (id)observationsFromRequest:(id)a3
{
  return (id)objc_msgSend(a3, "results");
}

- (unint64_t)observationCompositeSetSize
{
  return 1;
}

- (void)analyzeObservationComposite:(id)a3
{
  void (**currentFrameProcessingCompletion)(id, SEL, id);
  id v5;

  self->_isProcessingFrame = 0;
  currentFrameProcessingCompletion = (void (**)(id, SEL, id))self->_currentFrameProcessingCompletion;
  if (currentFrameProcessingCompletion)
  {
    currentFrameProcessingCompletion[2](currentFrameProcessingCompletion, a2, a3);
    v5 = self->_currentFrameProcessingCompletion;
    self->_currentFrameProcessingCompletion = 0;

  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[PADVNSerialRequestsScheduler _reset](self, "_reset");
}

- (void)_reset
{
  NSMutableDictionary *v3;
  NSMutableDictionary *currentObservationComposite;
  NSMutableArray *v5;
  NSMutableArray *currentObservationCompositeSet;

  v3 = (NSMutableDictionary *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  currentObservationComposite = self->_currentObservationComposite;
  self->_currentObservationComposite = v3;

  v5 = (NSMutableArray *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  currentObservationCompositeSet = self->_currentObservationCompositeSet;
  self->_currentObservationCompositeSet = v5;

  self->_remainingRequests = 0;
  self->_isProcessingFrame = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentFrameProcessingCompletion, 0);
  objc_storeStrong((id *)&self->_requestError, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentObservationCompositeSet, 0);
  objc_storeStrong((id *)&self->_currentObservationComposite, 0);
}

- (void)_dispatchVisionRequestForFrame:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213BCD000, a2, a3, "Vision request dispatch failed (%{public}@).", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_dispatchVisionRequestForFrame:.cold.2()
{
  __assert_rtn("-[PADVNSerialRequestsScheduler _dispatchVisionRequestForFrame:]", "PADVNSerialRequestsScheduler.m", 85, "_remainingRequests == 0");
}

- (void)handleResultForRequest:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213BCD000, a2, a3, "Request %{public}@ did not obtain any observations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleResultForRequest:(os_log_t)log error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_213BCD000, log, OS_LOG_TYPE_ERROR, "Request %{public}@ failed (%{public}@).", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
