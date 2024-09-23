@implementation ACHGizmoAwardingScheduler

- (ACHGizmoAwardingScheduler)initWithClient:(id)a3 dataStore:(id)a4 awardingEngine:(id)a5
{
  id v8;
  id v9;
  id v10;
  ACHGizmoAwardingScheduler *v11;
  ACHGizmoAwardingScheduler *v12;
  NSMutableSet *v13;
  NSMutableSet *blocksWaitingOnFirstEvaluation;
  uint64_t v15;
  OS_dispatch_queue *internalQueue;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ACHGizmoAwardingScheduler;
  v11 = -[ACHGizmoAwardingScheduler init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_client, v8);
    objc_storeWeak((id *)&v12->_dataStore, v9);
    objc_storeWeak((id *)&v12->_awardingEngine, v10);
    v12->_dataStoreHasPopulated = 0;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    blocksWaitingOnFirstEvaluation = v12->_blocksWaitingOnFirstEvaluation;
    v12->_blocksWaitingOnFirstEvaluation = v13;

    HKCreateSerialDispatchQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v15;

    *(_OWORD *)&v12->_retryInterval = xmmword_2140F67D0;
  }

  return v12;
}

- (ACHGizmoAwardingScheduler)initWithProfile:(id)a3 dataStore:(id)a4 awardingEngine:(id)a5
{
  id v8;
  id v9;
  id v10;
  ACHGizmoAwardingScheduler *v11;
  ACHGizmoAwardingScheduler *v12;
  NSMutableSet *v13;
  NSMutableSet *blocksWaitingOnFirstEvaluation;
  uint64_t v15;
  OS_dispatch_queue *internalQueue;
  void *v17;
  id WeakRetained;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ACHGizmoAwardingScheduler;
  v11 = -[ACHGizmoAwardingScheduler init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeWeak((id *)&v12->_dataStore, v9);
    objc_storeWeak((id *)&v12->_awardingEngine, v10);
    v12->_dataStoreHasPopulated = 0;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    blocksWaitingOnFirstEvaluation = v12->_blocksWaitingOnFirstEvaluation;
    v12->_blocksWaitingOnFirstEvaluation = v13;

    HKCreateSerialDispatchQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v15;

    *(_OWORD *)&v12->_retryInterval = xmmword_2140F67D0;
    objc_msgSend(MEMORY[0x24BE40E10], "sharedDiagnosticManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v12);

    WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerForDaemonReady:", v12);

  }
  return v12;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  if (notify_is_valid_token(self->_protectedDataToken))
    notify_cancel(self->_protectedDataToken);
  v4.receiver = self;
  v4.super_class = (Class)ACHGizmoAwardingScheduler;
  -[ACHGizmoAwardingScheduler dealloc](&v4, sel_dealloc);
}

- (void)activate
{
  NSObject *v3;
  uint8_t v4[16];

  ACHLogAwardScheduling();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "Activating gizmo scheduler", v4, 2u);
  }

  -[ACHGizmoAwardingScheduler _startUp](self, "_startUp");
}

- (void)_startUp
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *internalQueue;
  const char *v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);
  objc_msgSend(WeakRetained, "addObserver:", self);

  v4 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v4, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addProtectedDataObserver:", self);

  v6 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __37__ACHGizmoAwardingScheduler__startUp__block_invoke;
  v13[3] = &unk_24D13A338;
  v13[4] = self;
  objc_msgSend(v7, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", internalQueue, v13);

  v10 = (const char *)objc_msgSend((id)*MEMORY[0x24BE01560], "UTF8String");
  v11 = self->_internalQueue;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __37__ACHGizmoAwardingScheduler__startUp__block_invoke_191;
  v12[3] = &unk_24D13BD40;
  v12[4] = self;
  notify_register_dispatch(v10, &self->_protectedDataToken, v11, v12);
}

uint64_t __37__ACHGizmoAwardingScheduler__startUp__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 66))
  {
    v1 = result;
    ACHLogAwardScheduling();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Daemon ready and first unlock complete, scheduling immediate evaluation", v3, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 32), "_queue_requestRetryingAwardingEvaluationWithCompletion:", 0);
  }
  return result;
}

void __37__ACHGizmoAwardingScheduler__startUp__block_invoke_191(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 66))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    objc_msgSend((id)v1, "_queue_handleProtectedDataChange:", objc_msgSend(WeakRetained, "isProtectedDataAvailable"));

  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  NSObject *internalQueue;
  _QWORD v5[5];
  BOOL v6;

  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__ACHGizmoAwardingScheduler_database_protectedDataDidBecomeAvailable___block_invoke;
  v5[3] = &unk_24D13ABF0;
  v5[4] = self;
  v6 = a4;
  dispatch_async(internalQueue, v5);
}

_BYTE *__70__ACHGizmoAwardingScheduler_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[66])
    return (_BYTE *)objc_msgSend(result, "_queue_handleProtectedDataChange:", *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)_queue_handleProtectedDataChange:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  -[ACHGizmoAwardingScheduler _queue_cancelRetryAwardingEvaluationTimer](self, "_queue_cancelRetryAwardingEvaluationTimer");
  if (v3 && self->_needsRetry)
  {
    ACHLogAwardScheduling();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Protected data available and retry needed, scheduling immediate evaluation", v6, 2u);
    }

    -[ACHGizmoAwardingScheduler _queue_requestRetryingAwardingEvaluationWithCompletion:](self, "_queue_requestRetryingAwardingEvaluationWithCompletion:", 0);
  }
}

- (id)diagnosticDescription
{
  return CFSTR("Gizmo Awarding Scheduler");
}

- (void)requestAwardingEvaluationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  v4 = a3;
  ACHLogAwardScheduling();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Awarding evaluation requested", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_awardingEngine);
  objc_msgSend(WeakRetained, "requestHistoricalEvaluationForAllSourcesWithCompletion:", v4);

}

- (void)dataStoreDidPopulate:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ACHGizmoAwardingScheduler_dataStoreDidPopulate___block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __50__ACHGizmoAwardingScheduler_dataStoreDidPopulate___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 66) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestRetryingAwardingEvaluationWithCompletion:", 0);
}

- (void)_queue_requestRetryingAwardingEvaluationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t *v10;
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  ACHLogAwardScheduling();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Retrying awarding evaluation requested", buf, 2u);
  }

  self->_needsRetry = 0;
  -[ACHGizmoAwardingScheduler _queue_cancelRetryAwardingEvaluationTimer](self, "_queue_cancelRetryAwardingEvaluationTimer");
  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__13;
  v15 = __Block_byref_object_dispose__13;
  objc_msgSend(CFSTR("com.apple.activityawardsd.watch.full_history_evaluation"), "UTF8String");
  v16 = (id)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)&self->_awardingEngine);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__ACHGizmoAwardingScheduler__queue_requestRetryingAwardingEvaluationWithCompletion___block_invoke;
  v8[3] = &unk_24D13BD90;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  v10 = buf;
  objc_msgSend(WeakRetained, "requestHistoricalEvaluationForAllSourcesWithCompletion:", v8);

  _Block_object_dispose(buf, 8);
}

void __84__ACHGizmoAwardingScheduler__queue_requestRetryingAwardingEvaluationWithCompletion___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __84__ACHGizmoAwardingScheduler__queue_requestRetryingAwardingEvaluationWithCompletion___block_invoke_2;
  block[3] = &unk_24D13BD68;
  v6 = a1[4];
  v7 = (void *)a1[5];
  v8 = *(NSObject **)(v6 + 48);
  block[1] = 3221225472;
  v17 = a2;
  v13 = v5;
  v14 = v6;
  v9 = v7;
  v10 = a1[6];
  v15 = v9;
  v16 = v10;
  v11 = v5;
  dispatch_async(v8, block);

}

void __84__ACHGizmoAwardingScheduler__queue_requestRetryingAwardingEvaluationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 64) || *(_QWORD *)(a1 + 32))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 64) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_queue_scheduleRetryAwardingEvaluation");
  }
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 88);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
    v2 = *(_QWORD *)(a1 + 40);
  }
  if (!*(_BYTE *)(v2 + 65))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(id *)(v2 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeAllObjects", (_QWORD)v12);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 65) = 1;
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

- (void)_queue_scheduleRetryAwardingEvaluation
{
  int64_t v3;
  uint64_t v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *retryTimer;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_dataStoreHasPopulated)
  {
    v3 = (unint64_t)(self->_retryInterval * 1000000000.0);
    v4 = (unint64_t)(self->_retryLeeway * 1000000000.0);
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_internalQueue);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v5;

    v7 = self->_retryTimer;
    v8 = dispatch_time(0, v3);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, v4);
    v9 = self->_retryTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __67__ACHGizmoAwardingScheduler__queue_scheduleRetryAwardingEvaluation__block_invoke;
    handler[3] = &unk_24D13A338;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }
}

uint64_t __67__ACHGizmoAwardingScheduler__queue_scheduleRetryAwardingEvaluation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestRetryingAwardingEvaluationWithCompletion:", 0);
}

- (void)_queue_cancelRetryAwardingEvaluationTimer
{
  NSObject *retryTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel(retryTimer);
    v4 = self->_retryTimer;
    self->_retryTimer = 0;

  }
}

- (void)performAfterFirstEvaluation:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__ACHGizmoAwardingScheduler_performAfterFirstEvaluation___block_invoke;
  v7[3] = &unk_24D13BC70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __57__ACHGizmoAwardingScheduler_performAfterFirstEvaluation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 65))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(void **)(v1 + 40);
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = (void *)MEMORY[0x2199C9184]();
    objc_msgSend(v2, "addObject:", v3);

  }
}

- (double)retryInterval
{
  return self->_retryInterval;
}

- (void)setRetryInterval:(double)a3
{
  self->_retryInterval = a3;
}

- (double)retryLeeway
{
  return self->_retryLeeway;
}

- (void)setRetryLeeway:(double)a3
{
  self->_retryLeeway = a3;
}

- (id)scheduledEvaluationCompleteBlock
{
  return self->_scheduledEvaluationCompleteBlock;
}

- (void)setScheduledEvaluationCompleteBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scheduledEvaluationCompleteBlock, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_blocksWaitingOnFirstEvaluation, 0);
  objc_destroyWeak((id *)&self->_awardingEngine);
  objc_destroyWeak((id *)&self->_dataStore);
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_client);
}

@end
