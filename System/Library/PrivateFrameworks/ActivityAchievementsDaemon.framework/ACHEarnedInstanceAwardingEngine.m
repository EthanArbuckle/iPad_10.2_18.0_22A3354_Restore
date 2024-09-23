@implementation ACHEarnedInstanceAwardingEngine

- (ACHEarnedInstanceAwardingEngine)initWithClient:(id)a3 assertionClient:(id)a4 dataStore:(id)a5 earnedInstanceStore:(id)a6 historicalEvaluationPolicy:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ACHEarnedInstanceAwardingEngine *v16;
  ACHEarnedInstanceAwardingEngine *v17;
  __int128 v18;
  uint64_t v19;
  OS_dispatch_queue *internalQueue;
  uint64_t v21;
  NSCalendar *calendar;
  NSMutableDictionary *v23;
  NSMutableDictionary *sourceRegistry;
  uint64_t v25;
  NSMutableDictionary *queuedIncrementalEvaluations;
  const char *v27;
  NSObject *v28;
  _QWORD handler[4];
  id v31;
  id v32;
  id location;
  objc_super v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v34.receiver = self;
  v34.super_class = (Class)ACHEarnedInstanceAwardingEngine;
  v16 = -[ACHEarnedInstanceAwardingEngine init](&v34, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_client, v12);
    objc_storeWeak((id *)&v17->_assertionClient, v13);
    objc_storeWeak((id *)&v17->_dataStore, v14);
    objc_storeWeak((id *)&v17->_earnedInstanceStore, v15);
    v18 = *(_OWORD *)&a7->var2;
    *(_OWORD *)&v17->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime = *(_OWORD *)&a7->var0;
    *(_OWORD *)&v17->_historicalEvaluationPolicy.endDate = v18;
    v17->_isActivated = 0;
    HKCreateSerialDispatchQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    internalQueue = v17->_internalQueue;
    v17->_internalQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v21 = objc_claimAutoreleasedReturnValue();
    calendar = v17->_calendar;
    v17->_calendar = (NSCalendar *)v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sourceRegistry = v17->_sourceRegistry;
    v17->_sourceRegistry = v23;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    queuedIncrementalEvaluations = v17->_queuedIncrementalEvaluations;
    v17->_queuedIncrementalEvaluations = (NSMutableDictionary *)v25;

    objc_initWeak(&location, v17);
    v27 = (const char *)objc_msgSend((id)*MEMORY[0x24BE01560], "UTF8String");
    v28 = v17->_internalQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __123__ACHEarnedInstanceAwardingEngine_initWithClient_assertionClient_dataStore_earnedInstanceStore_historicalEvaluationPolicy___block_invoke;
    handler[3] = &unk_24D13D548;
    v31 = v12;
    objc_copyWeak(&v32, &location);
    notify_register_dispatch(v27, &v17->_protectedDataToken, v28, handler);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }

  return v17;
}

void __123__ACHEarnedInstanceAwardingEngine_initWithClient_assertionClient_dataStore_earnedInstanceStore_historicalEvaluationPolicy___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (objc_msgSend(*(id *)(a1 + 32), "isProtectedDataAvailable"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_queue_protectedDataBecameAvailable");

  }
}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_protectedDataToken))
    notify_cancel(self->_protectedDataToken);
  v3.receiver = self;
  v3.super_class = (Class)ACHEarnedInstanceAwardingEngine;
  -[ACHEarnedInstanceAwardingEngine dealloc](&v3, sel_dealloc);
}

- (ACHEarnedInstanceAwardingEngine)initWithProfile:(id)a3 dataStore:(id)a4 earnedInstanceStore:(id)a5 historicalEvaluationPolicy:(id *)a6
{
  id v10;
  id v11;
  id v12;
  ACHEarnedInstanceAwardingEngine *v13;
  ACHEarnedInstanceAwardingEngine *v14;
  __int128 v15;
  uint64_t v16;
  OS_dispatch_queue *internalQueue;
  uint64_t v18;
  NSCalendar *calendar;
  NSMutableDictionary *v20;
  NSMutableDictionary *sourceRegistry;
  uint64_t v22;
  NSMutableDictionary *queuedIncrementalEvaluations;
  id WeakRetained;
  void *v25;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)ACHEarnedInstanceAwardingEngine;
  v13 = -[ACHEarnedInstanceAwardingEngine init](&v27, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeWeak((id *)&v14->_dataStore, v11);
    objc_storeWeak((id *)&v14->_earnedInstanceStore, v12);
    v15 = *(_OWORD *)&a6->var2;
    *(_OWORD *)&v14->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime = *(_OWORD *)&a6->var0;
    *(_OWORD *)&v14->_historicalEvaluationPolicy.endDate = v15;
    HKCreateSerialDispatchQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    internalQueue = v14->_internalQueue;
    v14->_internalQueue = (OS_dispatch_queue *)v16;

    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v18 = objc_claimAutoreleasedReturnValue();
    calendar = v14->_calendar;
    v14->_calendar = (NSCalendar *)v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sourceRegistry = v14->_sourceRegistry;
    v14->_sourceRegistry = v20;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    queuedIncrementalEvaluations = v14->_queuedIncrementalEvaluations;
    v14->_queuedIncrementalEvaluations = (NSMutableDictionary *)v22;

    WeakRetained = objc_loadWeakRetained((id *)&v14->_profile);
    objc_msgSend(WeakRetained, "database");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addProtectedDataObserver:", v14);

  }
  return v14;
}

- (void)activate
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__ACHEarnedInstanceAwardingEngine_activate__block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __43__ACHEarnedInstanceAwardingEngine_activate__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 113);
  ACHLogAwardEngine();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __43__ACHEarnedInstanceAwardingEngine_activate__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "Activating Awarding Engine", v12, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = 1;
  }
}

- (unint64_t)sourceCount
{
  NSObject *internalQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__ACHEarnedInstanceAwardingEngine_sourceCount__block_invoke;
  v5[3] = &unk_24D13AC40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__ACHEarnedInstanceAwardingEngine_sourceCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)dataStorePropertyProviderForSource:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__32;
  v16 = __Block_byref_object_dispose__32;
  v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__ACHEarnedInstanceAwardingEngine_dataStorePropertyProviderForSource___block_invoke;
  block[3] = &unk_24D13AC68;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __70__ACHEarnedInstanceAwardingEngine_dataStorePropertyProviderForSource___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)registerSource:(id)a3
{
  id v4;
  NSObject *internalQueue;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254D673E0))
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__ACHEarnedInstanceAwardingEngine_registerSource___block_invoke;
    v7[3] = &unk_24D13A360;
    v7[4] = self;
    v8 = v4;
    dispatch_async(internalQueue, v7);

  }
  else
  {
    ACHLogAwardEngine();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceAwardingEngine registerSource:].cold.1();

  }
}

void __50__ACHEarnedInstanceAwardingEngine_registerSource___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  ACHEarnedInstanceAwardingSourceRecord *v7;
  uint64_t v8;
  id WeakRetained;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    ACHLogAwardEngine();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __50__ACHEarnedInstanceAwardingEngine_registerSource___block_invoke_cold_1((uint64_t)v2, v6);
  }
  else
  {
    v7 = [ACHEarnedInstanceAwardingSourceRecord alloc];
    v8 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(*(id *)(a1 + 32), "currentDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ACHEarnedInstanceAwardingSourceRecord initWithSource:earnedInstanceStore:dataStore:registrationDate:](v7, "initWithSource:earnedInstanceStore:dataStore:registrationDate:", v8, WeakRetained, v10, v11);

    v12 = *(void **)(a1 + 40);
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    objc_msgSend(v12, "uniqueName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, v14);

    ACHLogAwardEngine();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v2, "uniqueName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_21407B000, v15, OS_LOG_TYPE_DEFAULT, "Awarding engine registered source with name [%{public}@]", (uint8_t *)&v17, 0xCu);

    }
  }

}

- (void)deregisterSource:(id)a3
{
  id v4;
  NSObject *internalQueue;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254D673E0))
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __52__ACHEarnedInstanceAwardingEngine_deregisterSource___block_invoke;
    v7[3] = &unk_24D13A360;
    v7[4] = self;
    v8 = v4;
    dispatch_async(internalQueue, v7);

  }
  else
  {
    ACHLogAwardEngine();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceAwardingEngine deregisterSource:].cold.1();

  }
}

void __52__ACHEarnedInstanceAwardingEngine_deregisterSource___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    objc_msgSend(v6, "uniqueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    ACHLogAwardEngine();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v2, "uniqueName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Awarding engine deregistered source with name [%{public}@]", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    ACHLogAwardEngine();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __52__ACHEarnedInstanceAwardingEngine_deregisterSource___block_invoke_cold_1((uint64_t)v2, v9);
  }

}

- (void)requestIncrementalEvaluationForSource:(id)a3 evaluationBlock:(id)a4
{
  ACHAwardsClient **p_client;
  id v7;
  id WeakRetained;
  id v9;

  p_client = &self->_client;
  v7 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_client);

  if (WeakRetained)
    -[ACHEarnedInstanceAwardingEngine _client_requestIncrementalEvaluationForSource:evaluationBlock:](self, "_client_requestIncrementalEvaluationForSource:evaluationBlock:", v9, v7);
  else
    -[ACHEarnedInstanceAwardingEngine _daemon_requestIncrementalEvaluationForSource:evaluationBlock:](self, "_daemon_requestIncrementalEvaluationForSource:evaluationBlock:", v9, v7);

}

- (void)_client_requestIncrementalEvaluationForSource:(id)a3 evaluationBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ACHLogAwardEngine();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Incremental evaluation requested for source with name: %{public}@", buf, 0xCu);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke;
  block[3] = &unk_24D13B530;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(internalQueue, block);

}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke(id *a1)
{
  id *v2;
  void **v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)a1[4];
  if (*((_BYTE *)v2 + 113))
  {
    v3 = a1 + 5;
    objc_msgSend(v2[10], "objectForKeyedSubscript:", a1[5]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      -[NSObject lastCompletedEvaluationInterval](v4, "lastCompletedEvaluationInterval");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (*((_BYTE *)a1[4] + 112))
        {
          ACHLogAwardEngine();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v8 = *v3;
            *(_DWORD *)buf = 138543362;
            v37 = v8;
            _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Queuing incremental request for %{public}@ because historical run in progress", buf, 0xCu);
          }

          v9 = objc_msgSend(a1[6], "copy");
          v10 = (void *)MEMORY[0x2199C9184]();
          objc_msgSend(*((id *)a1[4] + 15), "setObject:forKeyedSubscript:", v10, a1[5]);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Achievements Incremental Evaluation - %@"), a1[5]);
          v9 = objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)a1[4] + 2);
          v35 = 0;
          objc_msgSend(WeakRetained, "acquireDatabaseAssertionWithIdentifier:error:", v9, &v35);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v35;

          ACHLogAwardEngine();
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v12)
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v16 = *v3;
              *(_DWORD *)buf = 138543362;
              v37 = v16;
              _os_log_impl(&dword_21407B000, v15, OS_LOG_TYPE_DEFAULT, "Acquired assertion, proceeding with evaluation and removing queued evaluation if necessary for %{public}@", buf, 0xCu);
            }

            objc_msgSend(*((id *)a1[4] + 15), "removeObjectForKey:", a1[5]);
            -[NSObject lastScheduledEvaluationInterval](v5, "lastScheduledEvaluationInterval");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "endDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18)
            {
              v20 = v18;
            }
            else
            {
              -[NSObject lastCompletedEvaluationInterval](v5, "lastCompletedEvaluationInterval");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "endDate");
              v20 = (id)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(a1[4], "currentDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "compare:", v23) == 1)
            {
              ACHLogAwardEngine();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_5();
            }
            else
            {
              v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v20, v23);
              ACHLogAwardEngine();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v37 = v26;
                _os_log_impl(&dword_21407B000, v27, OS_LOG_TYPE_DEFAULT, "Incremental evaluation date interval is %{public}@", buf, 0xCu);
              }

              v28 = MEMORY[0x24BDAC760];
              v32[0] = MEMORY[0x24BDAC760];
              v32[1] = 3221225472;
              v32[2] = __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_264;
              v32[3] = &unk_24D13D570;
              v29 = a1[6];
              v33 = v26;
              v34 = v29;
              v30[0] = v28;
              v30[1] = 3221225472;
              v30[2] = __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2;
              v30[3] = &unk_24D13B508;
              v30[4] = a1[4];
              v31 = v12;
              v25 = v26;
              -[NSObject addEvaluationOperationWithDateInterval:databaseContext:evaluationBlock:completion:](v5, "addEvaluationOperationWithDateInterval:databaseContext:evaluationBlock:completion:", v25, 0, v32, v30);

            }
          }
          else
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_4();

            ACHLogAwardEngine();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = *v3;
              *(_DWORD *)buf = 138543362;
              v37 = v22;
              _os_log_impl(&dword_21407B000, v21, OS_LOG_TYPE_DEFAULT, "Queuing incremental request for %{public}@ until protected data becomes available", buf, 0xCu);
            }

            v20 = (id)objc_msgSend(a1[6], "copy");
            v23 = (void *)MEMORY[0x2199C9184]();
            objc_msgSend(*((id *)a1[4] + 15), "setObject:forKeyedSubscript:", v23, a1[5]);
          }

        }
      }
      else
      {
        ACHLogAwardEngine();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_3();
      }
    }
    else
    {
      ACHLogAwardEngine();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_2();
    }

  }
  else
  {
    ACHLogAwardEngine();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_1();
  }

}

uint64_t __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_264(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  NSObject *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(a1 + 40);
  v6 = 0;
  objc_msgSend(WeakRetained, "invalidateAssertionWithToken:error:", v3, &v6);
  v4 = v6;

  if (v4)
  {
    ACHLogAwardEngine();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2_cold_1();

  }
}

- (void)_daemon_requestIncrementalEvaluationForSource:(id)a3 evaluationBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ACHLogAwardEngine();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Incremental evaluation requested for source with name: %{public}@", buf, 0xCu);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke;
  block[3] = &unk_24D13B530;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(internalQueue, block);

}

void __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 113))
  {
    objc_msgSend(*(id *)(v2 + 80), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      -[NSObject lastCompletedEvaluationInterval](v3, "lastCompletedEvaluationInterval");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[NSObject lastScheduledEvaluationInterval](v4, "lastScheduledEvaluationInterval");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "endDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          v9 = v7;
        }
        else
        {
          -[NSObject lastCompletedEvaluationInterval](v4, "lastCompletedEvaluationInterval");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "endDate");
          v9 = objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(*(id *)(a1 + 32), "currentDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSObject compare:](v9, "compare:", v11) == 1)
        {
          ACHLogAwardEngine();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_5();
        }
        else
        {
          v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v9, v11);
          ACHLogAwardEngine();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v32 = v12;
            _os_log_impl(&dword_21407B000, v13, OS_LOG_TYPE_DEFAULT, "Incremental evaluation date interval is %{public}@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Achievements Incremental Evaluation - %@"), *(_QWORD *)(a1 + 40));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
          objc_msgSend(WeakRetained, "database");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          +[ACHDatabaseAssertion assertionWithDatabase:identifier:error:](ACHDatabaseAssertion, "assertionWithDatabase:identifier:error:", v16, v14, &v30);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v30;

          ACHLogAwardEngine();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if (v17)
          {
            if (v20)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21407B000, v19, OS_LOG_TYPE_DEFAULT, "Acquired assertion, proceeding with evaluation and removing queued evaluation if necessary", buf, 2u);
            }

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
            ACHDatabaseContextWithAccessibilityAssertion(v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = MEMORY[0x24BDAC760];
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_268;
            v27[3] = &unk_24D13D570;
            v29 = *(id *)(a1 + 48);
            v28 = v12;
            v25[0] = v22;
            v25[1] = 3221225472;
            v25[2] = __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2;
            v25[3] = &unk_24D13A610;
            v26 = v17;
            -[NSObject addEvaluationOperationWithDateInterval:databaseContext:evaluationBlock:completion:](v4, "addEvaluationOperationWithDateInterval:databaseContext:evaluationBlock:completion:", v28, v21, v27, v25);

            v23 = v29;
          }
          else
          {
            if (v20)
            {
              *(_DWORD *)buf = 138543362;
              v32 = v18;
              _os_log_impl(&dword_21407B000, v19, OS_LOG_TYPE_DEFAULT, "Failed to get accessibility assertion with error %{public}@", buf, 0xCu);
            }

            ACHLogAwardEngine();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21407B000, v24, OS_LOG_TYPE_DEFAULT, "Queuing incremental request until protected data becomes available", buf, 2u);
            }

            v21 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
            v23 = (void *)MEMORY[0x2199C9184]();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKeyedSubscript:", v23, *(_QWORD *)(a1 + 40));
          }

        }
      }
      else
      {
        ACHLogAwardEngine();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_3();
      }
    }
    else
    {
      ACHLogAwardEngine();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_2();
    }

  }
  else
  {
    ACHLogAwardEngine();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_1();
  }

}

uint64_t __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_268(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __97__ACHEarnedInstanceAwardingEngine__daemon_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *internalQueue;
  id WeakRetained;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke;
  block[3] = &unk_24D13AC40;
  block[4] = self;
  block[5] = &v20;
  dispatch_sync(internalQueue, block);
  if (*((_BYTE *)v21 + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    v7 = WeakRetained == 0;

    if (v7)
      -[ACHEarnedInstanceAwardingEngine _daemon_requestHistoricalEvaluationForAllSourcesWithCompletion:](self, "_daemon_requestHistoricalEvaluationForAllSourcesWithCompletion:", v4);
    else
      -[ACHEarnedInstanceAwardingEngine _client_requestHistoricalEvaluationForAllSourcesWithCompletion:](self, "_client_requestHistoricalEvaluationForAllSourcesWithCompletion:", v4);
  }
  else
  {
    ACHLogAwardEngine();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceAwardingEngine requestHistoricalEvaluationForAllSourcesWithCompletion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    v16 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0FC8];
    v25[0] = CFSTR("Awarding Engine not activated");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), 11, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, 0, v18);
  }
  _Block_object_dispose(&v20, 8);

}

uint64_t __90__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 113);
  return result;
}

- (void)_client_requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id buf;
  id v19;

  v4 = a3;
  ACHLogAwardEngine();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Requesting historical evaluation for all sources", (uint8_t *)&buf, 2u);
  }

  if (self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime)
    v6 = 600.0;
  else
    v6 = 15.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assertionClient);
  v19 = 0;
  objc_msgSend(WeakRetained, "acquireDatabaseAssertionWithIdentifier:duration:error:", CFSTR("Achievements Historical Evaluation"), &v19, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;

  if (v8)
  {
    objc_initWeak(&buf, self);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke;
    v13[3] = &unk_24D13D598;
    v11 = v10;
    v14 = v11;
    objc_copyWeak(&v17, &buf);
    v15 = v8;
    v16 = v4;
    -[ACHEarnedInstanceAwardingEngine _requestHistoricalEvaluationForAllSourcesWithCompletion:](self, "_requestHistoricalEvaluationForAllSourcesWithCompletion:", v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&buf);
  }
  else
  {
    ACHLogAwardEngine();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceAwardingEngine _client_requestHistoricalEvaluationForAllSourcesWithCompletion:].cold.1();

    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v9);
  }

}

void __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  id *WeakRetained;
  id *v13;
  id v14;
  uint64_t v15;
  char v16;
  id v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v8 = v7;

  ACHLogAwardEngine();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (a2)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 134218242;
    v21 = v8;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Completed historical evaluation in %lf seconds with success: %@", buf, 0x16u);
  }

  if (v5)
  {
    ACHLogAwardEngine();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_2();

  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v14 = objc_loadWeakRetained(WeakRetained + 2);
    v15 = *(_QWORD *)(a1 + 40);
    v19 = 0;
    v16 = objc_msgSend(v14, "invalidateAssertionWithToken:error:", v15, &v19);
    v17 = v19;

    if ((v16 & 1) == 0)
    {
      ACHLogAwardEngine();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_1();

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_daemon_requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ACHLogAwardEngine();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Requesting historical evaluation for all sources", buf, 2u);
  }

  if (self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime)
    v6 = 60.0;
  else
    v6 = 15.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  +[ACHDatabaseAssertion assertionWithDatabase:identifier:timeout:error:](ACHDatabaseAssertion, "assertionWithDatabase:identifier:timeout:error:", v8, CFSTR("Achievements Historical Evaluation"), &v16, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;

  if (v9)
  {
    ACHDatabaseContextWithAccessibilityAssertion(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCacheScope:", 1);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __98__ACHEarnedInstanceAwardingEngine__daemon_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke;
    v13[3] = &unk_24D13D5C0;
    v14 = v9;
    v15 = v4;
    -[ACHEarnedInstanceAwardingEngine requestHistoricalEvaluationForAllSourcesWithDatabaseContext:completion:](self, "requestHistoricalEvaluationForAllSourcesWithDatabaseContext:completion:", v11, v13);

  }
  else
  {
    ACHLogAwardEngine();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get accessibility assertion with error %{public}@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v10);
  }

}

void __98__ACHEarnedInstanceAwardingEngine__daemon_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ACHLogAwardEngine();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Completed historical evaluation with success: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_requestHistoricalEvaluationForAllSourcesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  ACHLogAwardEngine();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Assertion acquired! Let's go!", buf, 2u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke;
  v8[3] = &unk_24D13BC70;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(internalQueue, v8);

}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  char v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  id v20;
  _QWORD *v21;
  uint8_t *v22;
  _QWORD v23[6];
  NSObject *v24;
  _QWORD *v25;
  uint8_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[3];
  char v38;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 72))
  {
LABEL_6:
    v4 = dispatch_group_create();
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v38 = 1;
    *(_QWORD *)buf = 0;
    v32 = buf;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__32;
    v35 = __Block_byref_object_dispose__32;
    v36 = 0;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v28;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10);
          dispatch_group_enter(v4);
          v12 = *(void **)(a1 + 32);
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_283;
          v23[3] = &unk_24D13D610;
          v25 = v37;
          v26 = buf;
          v23[4] = v12;
          v23[5] = v11;
          v24 = v4;
          objc_msgSend(v12, "_queue_evaluateHistoryForSource:completion:", v11, v23);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v8);
    }

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v15 = *(NSObject **)(v13 + 96);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_284;
    block[3] = &unk_24D13D638;
    v22 = buf;
    v21 = v37;
    block[4] = v13;
    v20 = v14;
    dispatch_group_notify(v4, v15, block);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v37, 8);
    goto LABEL_18;
  }
  WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
  v42 = 0;
  v3 = objc_msgSend(WeakRetained, "clearAllInMemoryPropertiesWithError:", &v42);
  v4 = v42;

  ACHLogAwardEngine();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "DataStore cleared for historical evaluation", buf, 2u);
    }

    goto LABEL_6;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_1();

  v16 = *(void **)(a1 + 40);
  if (v16)
  {
    dispatch_get_global_queue(21, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_282;
    v39[3] = &unk_24D13B278;
    v41 = v16;
    v4 = v4;
    v40 = v4;
    dispatch_async(v17, v39);

  }
LABEL_18:

}

uint64_t __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_282(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_283(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  block[1] = 3221225472;
  v9 = *(_OWORD *)(a1 + 48);
  v12 = *(_OWORD *)(a1 + 32);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2;
  block[3] = &unk_24D13D5E8;
  v15 = a2;
  v14 = *(_QWORD *)(a1 + 64);
  v11 = v5;
  v7 = (id)v9;
  v13 = v9;
  v8 = v5;
  dispatch_async(v6, block);

}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  id *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  char v21;
  NSObject *v22;
  uint64_t v23;
  id *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  id *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) &= *(_BYTE *)(a1 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  if (!v5)
    v4 = *(void **)(a1 + 32);
  objc_storeStrong(v3, v4);
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 73))
    goto LABEL_9;
  if (!*(_BYTE *)(a1 + 80) || *(_QWORD *)(a1 + 32))
  {
    ACHLogAwardEngine();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_1(a1, v6);
LABEL_8:

LABEL_9:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    return;
  }
  ACHLogAwardEngine();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "uniqueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v8;
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "[%@] succeeded historical evaluation, commiting data to dataStore", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  v10 = (id *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 48), "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v12 = objc_msgSend(WeakRetained, "commitPropertiesForProvider:withError:", v11, &v34);
  v13 = v34;

  ACHLogAwardEngine();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v10, "source");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uniqueName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v10, "uniqueName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v17;
      v37 = 2112;
      v38 = v18;
      _os_log_impl(&dword_21407B000, v15, OS_LOG_TYPE_DEFAULT, "Successfully commited data store properties for sourceRecord.source %@, now committing source record %@ properties", buf, 0x16u);

    }
    v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
    v20 = *(_QWORD *)(a1 + 48);
    v33 = v13;
    v21 = objc_msgSend(v19, "commitPropertiesForProvider:withError:", v20, &v33);
    v6 = v33;

    if ((v21 & 1) == 0)
    {
      ACHLogAwardEngine();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_2(a1 + 48, (uint64_t)v6, v22);

      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v26 = *(NSObject **)(v23 + 40);
      v24 = (id *)(v23 + 40);
      v25 = v26;
      if (v26)
        v27 = v25;
      else
        v27 = v6;
      objc_storeStrong(v24, v27);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_3(a1 + 48, (uint64_t)v13, v15);

  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v31 = *(void **)(v28 + 40);
  v29 = (id *)(v28 + 40);
  v30 = v31;
  if (v31)
    v32 = v30;
  else
    v32 = v13;
  objc_storeStrong(v29, v32);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_284(uint64_t a1)
{
  char v2;
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v2 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_285;
    block[3] = &unk_24D13BBD0;
    v8 = v4;
    v9 = v2;
    v7 = v3;
    dispatch_async(v5, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_performQueuedEvaluations");

}

uint64_t __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_285(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)requestHistoricalEvaluationForAllSourcesWithDatabaseContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  ACHLogAwardEngine();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Requesting historical evaluation for all sources with database context", buf, 2u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke;
  block[3] = &unk_24D13B530;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(internalQueue, block);

}

void __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[5];
  NSObject *v17;
  _QWORD *v18;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[3];
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 1;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__32;
  v24[4] = __Block_byref_object_dispose__32;
  v25 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1[4] + 80), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v21;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v6);
        dispatch_group_enter(v2);
        v8 = (void *)a1[4];
        v9 = a1[5];
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_2;
        v16[3] = &unk_24D13D688;
        v16[4] = v8;
        v18 = v26;
        v19 = v24;
        v17 = v2;
        objc_msgSend(v8, "_queue_evaluateHistoryForSource:databaseContext:completion:", v7, v9, v16);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v4);
  }

  v10 = (void *)a1[6];
  if (v10)
  {
    dispatch_get_global_queue(21, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_4;
    block[3] = &unk_24D13D6B0;
    v13 = v10;
    v14 = v26;
    v15 = v24;
    dispatch_group_notify(v2, v11, block);

  }
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
}

void __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  uint64_t v13;
  char v14;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_3;
  block[3] = &unk_24D13D660;
  v14 = a2;
  v9 = *(_OWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 56);
  v11 = v5;
  v7 = (id)v9;
  v12 = v9;
  v8 = v5;
  dispatch_async(v6, block);

}

void __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) &= *(_BYTE *)(a1 + 64);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  if (!v5)
    v4 = *(void **)(a1 + 32);
  objc_storeStrong(v3, v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __106__ACHEarnedInstanceAwardingEngine_requestHistoricalEvaluationForAllSourcesWithDatabaseContext_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  NSObject *internalQueue;
  _QWORD block[5];

  if (a4)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__ACHEarnedInstanceAwardingEngine_database_protectedDataDidBecomeAvailable___block_invoke;
    block[3] = &unk_24D13A338;
    block[4] = self;
    dispatch_async(internalQueue, block);
  }
}

uint64_t __76__ACHEarnedInstanceAwardingEngine_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_protectedDataBecameAvailable");
}

- (void)_queue_protectedDataBecameAvailable
{
  NSObject *v3;
  uint8_t v4[16];

  ACHLogAwardEngine();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "Protected data became available; attempting queued evaluation",
      v4,
      2u);
  }

  -[ACHEarnedInstanceAwardingEngine _queue_performQueuedEvaluations](self, "_queue_performQueuedEvaluations");
}

- (void)_queue_performQueuedEvaluations
{
  NSMutableDictionary *queuedIncrementalEvaluations;
  _QWORD v3[5];

  queuedIncrementalEvaluations = self->_queuedIncrementalEvaluations;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __66__ACHEarnedInstanceAwardingEngine__queue_performQueuedEvaluations__block_invoke;
  v3[3] = &unk_24D13D6D8;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](queuedIncrementalEvaluations, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __66__ACHEarnedInstanceAwardingEngine__queue_performQueuedEvaluations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  ACHLogAwardEngine();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Attempting queued evaluation for %{public}@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "requestIncrementalEvaluationForSource:evaluationBlock:", v5, v6);
}

- (void)_queue_evaluateHistoryForSource:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  NSCalendar *calendar;
  void *v16;
  __int128 v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD block[4];
  void (**v34)(id, _QWORD, id);
  uint8_t buf[16];
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  ACHLogAwardEngine();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Getting ready to evaluate history for source: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v6, "lastCompletedEvaluationInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&self->_historicalEvaluationPolicy.endDate;
  *(_OWORD *)buf = *(_OWORD *)&self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime;
  v36 = v13;
  ACHHistoricalEvaluationStartDateForPolicy((uint64_t)buf, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    calendar = self->_calendar;
    -[ACHEarnedInstanceAwardingEngine currentDate](self, "currentDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_OWORD *)&self->_historicalEvaluationPolicy.endDate;
    *(_OWORD *)buf = *(_OWORD *)&self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime;
    v36 = v17;
    ACHHistoricalEvaluationEndDateForPolicy((uint64_t)buf, calendar, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    v20 = v19;
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    if (v20 <= v21)
    {
      ACHLogAwardEngine();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[ACHEarnedInstanceAwardingEngine _queue_evaluateHistoryForSource:completion:].cold.1((uint64_t)v14);

      if (!v7)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Achievements.AwardingEngine"), 101, 0);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v26);
    }
    else
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v14, v18);
      ACHLogAwardEngine();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v22;
        _os_log_impl(&dword_21407B000, v23, OS_LOG_TYPE_DEFAULT, "Historical evaluation interval is %{public}@", buf, 0xCu);
      }

      objc_msgSend(v6, "cancelAllEvaluationOperations");
      objc_msgSend(v6, "source");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __78__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_completion___block_invoke_287;
      v30[3] = &unk_24D13D728;
      v31 = v24;
      v32 = v22;
      v25 = v22;
      v26 = v24;
      objc_msgSend(v6, "addEvaluationOperationWithDateInterval:evaluationBlock:completion:", v25, v30, v7);

    }
LABEL_17:

    goto LABEL_18;
  }
  ACHLogAwardEngine();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v27, OS_LOG_TYPE_DEFAULT, "No valid start date, not evaluating history", buf, 2u);
  }

  if (v7)
  {
    dispatch_get_global_queue(21, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_completion___block_invoke;
    block[3] = &unk_24D13D700;
    v34 = v7;
    dispatch_async(v28, block);

    v18 = v34;
    goto LABEL_17;
  }
LABEL_18:

}

void __78__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Achievements.AwardingEngine"), 102, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __78__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_completion___block_invoke_287(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "earnedInstancesForHistoricalInterval:error:", *(_QWORD *)(a1 + 40), a2);
}

- (void)_queue_evaluateHistoryForSource:(id)a3 databaseContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  void *v17;
  NSCalendar *calendar;
  void *v19;
  __int128 v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD block[4];
  void (**v38)(id, _QWORD, id);
  uint8_t buf[16];
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  ACHLogAwardEngine();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Getting ready to evaluate history for source: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v8, "lastCompletedEvaluationInterval");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&self->_historicalEvaluationPolicy.endDate;
  *(_OWORD *)buf = *(_OWORD *)&self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime;
  v40 = v16;
  ACHHistoricalEvaluationStartDateForPolicy((uint64_t)buf, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    calendar = self->_calendar;
    -[ACHEarnedInstanceAwardingEngine currentDate](self, "currentDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_OWORD *)&self->_historicalEvaluationPolicy.endDate;
    *(_OWORD *)buf = *(_OWORD *)&self->_historicalEvaluationPolicy.allowsHistoricalEvaluationFromBeginningOfTime;
    v40 = v20;
    ACHHistoricalEvaluationEndDateForPolicy((uint64_t)buf, calendar, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    v23 = v22;
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    if (v23 <= v24)
    {
      ACHLogAwardEngine();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[ACHEarnedInstanceAwardingEngine _queue_evaluateHistoryForSource:completion:].cold.1((uint64_t)v17);

      if (!v10)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Achievements.AwardingEngine"), 101, 0);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v29);
    }
    else
    {
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v17, v21);
      ACHLogAwardEngine();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl(&dword_21407B000, v26, OS_LOG_TYPE_DEFAULT, "Historical evaluation interval is %{public}@", buf, 0xCu);
      }

      objc_msgSend(v8, "cancelAllEvaluationOperations");
      objc_msgSend(v8, "source");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __94__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_databaseContext_completion___block_invoke_289;
      v33[3] = &unk_24D13D750;
      v34 = v27;
      v35 = v25;
      v36 = v9;
      v28 = v25;
      v29 = v27;
      objc_msgSend(v8, "addEvaluationOperationWithDateInterval:databaseContext:evaluationBlock:completion:", v28, v36, v33, v10);

    }
LABEL_17:

    goto LABEL_18;
  }
  ACHLogAwardEngine();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v30, OS_LOG_TYPE_DEFAULT, "No valid start date, not evaluating history", buf, 2u);
  }

  if (v10)
  {
    dispatch_get_global_queue(21, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __94__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_databaseContext_completion___block_invoke;
    block[3] = &unk_24D13D700;
    v38 = v10;
    dispatch_async(v31, block);

    v21 = v38;
    goto LABEL_17;
  }
LABEL_18:

}

void __94__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_databaseContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Achievements.AwardingEngine"), 102, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __94__ACHEarnedInstanceAwardingEngine__queue_evaluateHistoryForSource_databaseContext_completion___block_invoke_289(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "earnedInstancesForHistoricalInterval:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setCurrentDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateOverride, a3);
}

- (id)currentDate
{
  NSDate *currentDateOverride;

  currentDateOverride = self->_currentDateOverride;
  if (currentDateOverride)
    return currentDateOverride;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedIncrementalEvaluations, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_sourceRegistry, 0);
  objc_destroyWeak((id *)&self->_earnedInstanceStore);
  objc_destroyWeak((id *)&self->_dataStore);
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_assertionClient);
  objc_destroyWeak((id *)&self->_client);
}

void __43__ACHEarnedInstanceAwardingEngine_activate__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_21407B000, a1, a3, "Awarding Engine is already activated!", a5, a6, a7, a8, 0);
}

- (void)registerSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Not registering source %{public}@ because it does not conform to awarding protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__ACHEarnedInstanceAwardingEngine_registerSource___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_13(a1), "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21407B000, a2, v4, "Error registering source with name [%{public}@]: a provider with this name already exists", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)deregisterSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Not deregistering source %{public}@ because it does not conform to awarding protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52__ACHEarnedInstanceAwardingEngine_deregisterSource___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_13(a1), "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21407B000, a2, v4, "Error deregistering source with name [%{public}@]: no source is registered", v5);

  OUTLINED_FUNCTION_1_0();
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "[%{public}@] requested an incremental evaluation but engine is not activated yet. Skipping!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error requesting incremental evaluation for source with name [%{public}@]: no such source exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error requesting incremental evaluation for source with name [%{public}@]: this source has never completed a historical run", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v1, v2, "Failed to get accessibility assertion for %{public}@ with error %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v1, v2, "Error requesting incremental evaluation for source with name [%{public}@]: the evaluation start date is greater than the end date. - sourceRecord: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __97__ACHEarnedInstanceAwardingEngine__client_requestIncrementalEvaluationForSource_evaluationBlock___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error invalidating assertion with token %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)requestHistoricalEvaluationForAllSourcesWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_21407B000, a1, a3, "Received a request to run a historical evaluation but engine is not activated yet. Skipping!", a5, a6, a7, a8, 0);
}

- (void)_client_requestHistoricalEvaluationForAllSourcesWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Failed to get accessibility assertion with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error invalidating accessibility assertion: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __98__ACHEarnedInstanceAwardingEngine__client_requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Failed to clear data store with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 48), "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v7 = 2114;
  v8 = v4;
  OUTLINED_FUNCTION_4_2(&dword_21407B000, a2, v5, "[%@] failed historical evaluation, not commiting data to dataStore: %{public}@", v6);

  OUTLINED_FUNCTION_7();
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_13(a1), "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_2(&dword_21407B000, a3, v5, "Error committing data store properties for sourceRecord %@ with error %{public}@", v6);

  OUTLINED_FUNCTION_7();
}

void __91__ACHEarnedInstanceAwardingEngine__requestHistoricalEvaluationForAllSourcesWithCompletion___block_invoke_2_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  objc_msgSend((id)OUTLINED_FUNCTION_13(a1), "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_2(&dword_21407B000, a3, v6, "Error committing data store properties for sourceRecord.source %@ with error %{public}@", v7);

  OUTLINED_FUNCTION_7();
}

- (void)_queue_evaluateHistoryForSource:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v1, v2, "Historical evaluation not possible, interval start date comes after end date: %{public}@ -> %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

@end
