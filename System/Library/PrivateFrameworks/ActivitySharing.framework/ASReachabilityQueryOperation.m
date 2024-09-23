@implementation ASReachabilityQueryOperation

- (ASReachabilityQueryOperation)init
{
  ASReachabilityQueryOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASReachabilityQueryOperation;
  result = -[ASReachabilityQueryOperation init](&v3, sel_init);
  if (result)
  {
    result->_finished = 0;
    result->_executing = 0;
  }
  return result;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isReady
{
  return 1;
}

- (void)start
{
  void *v3;
  NSSet *destinations;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *results;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *rawIDSDestinationToOriginalDestination;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  IDSBatchIDQueryController *v33;
  IDSBatchIDQueryController *batchQueryController;
  NSMutableSet *v35;
  NSMutableSet *remainingDestinations;
  IDSBatchIDQueryController *v37;
  void *v38;
  OS_dispatch_source *v39;
  OS_dispatch_source *timer;
  NSObject *v41;
  dispatch_time_t v42;
  NSObject *v43;
  id v44;
  _QWORD handler[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  uint8_t v53[128];
  uint8_t buf[4];
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if (-[ASReachabilityQueryOperation isCancelled](self, "isCancelled"))
  {
    -[ASReachabilityQueryOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = 1;
    -[ASReachabilityQueryOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
  else
  {
    -[ASReachabilityQueryOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = 1;
    -[ASReachabilityQueryOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    ASLoggingInitialize();
    v3 = (void *)ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      destinations = self->_destinations;
      v5 = v3;
      *(_DWORD *)buf = 134217984;
      v55 = -[NSSet count](destinations, "count");
      _os_log_impl(&dword_21381F000, v5, OS_LOG_TYPE_DEFAULT, "Reachability: Starting for %lu destinations", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_statusCache);
    objc_msgSend(WeakRetained, "statusesForDestinations:", self->_destinations);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");
    results = self->_results;
    self->_results = v8;

    if (objc_msgSend(v7, "count"))
    {
      ASLoggingInitialize();
      v10 = (void *)ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 134217984;
        v55 = v12;
        _os_log_impl(&dword_21381F000, v11, OS_LOG_TYPE_DEFAULT, "Reachability: Hit %lu destinations in cache second pass", buf, 0xCu);

      }
      (*((void (**)(void))self->_updateHandler + 2))();
    }
    v13 = self->_destinations;
    v14 = (void *)MEMORY[0x24BDD1758];
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __37__ASReachabilityQueryOperation_start__block_invoke;
    v51[3] = &unk_24D0572C8;
    v44 = v7;
    v52 = v44;
    objc_msgSend(v14, "predicateWithBlock:", v51);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSet filteredSetUsingPredicate:](v13, "filteredSetUsingPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    rawIDSDestinationToOriginalDestination = self->_rawIDSDestinationToOriginalDestination;
    self->_rawIDSDestinationToOriginalDestination = v17;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v20 = v16;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v48 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          IDSDestinationForString(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v19, "addObject:", v26);
            v27 = (void *)IDSCopyRawAddressForDestination();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rawIDSDestinationToOriginalDestination, "setObject:forKeyedSubscript:", v25, v27);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v22);
    }

    if (objc_msgSend(v20, "count"))
    {
      ASLoggingInitialize();
      v28 = (void *)ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        v30 = objc_msgSend(v20, "count");
        *(_DWORD *)buf = 134217984;
        v55 = v30;
        _os_log_impl(&dword_21381F000, v29, OS_LOG_TYPE_DEFAULT, "Reachability: Querying %lu destinations", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "underlyingQueue");
      v32 = objc_claimAutoreleasedReturnValue();

      v33 = (IDSBatchIDQueryController *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FBF0]), "initWithService:delegate:queue:", self->_serviceIdentifier, self, v32);
      batchQueryController = self->_batchQueryController;
      self->_batchQueryController = v33;

      v35 = (NSMutableSet *)objc_msgSend(v20, "mutableCopy");
      remainingDestinations = self->_remainingDestinations;
      self->_remainingDestinations = v35;

      v37 = self->_batchQueryController;
      objc_msgSend(v19, "allObjects");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSBatchIDQueryController setDestinations:](v37, "setDestinations:", v38);

      v39 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v32);
      timer = self->timer;
      self->timer = v39;

      v41 = self->timer;
      v42 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v41, v42, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      objc_initWeak((id *)buf, self);
      v43 = self->timer;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __37__ASReachabilityQueryOperation_start__block_invoke_14;
      handler[3] = &unk_24D0576B8;
      objc_copyWeak(&v46, (id *)buf);
      dispatch_source_set_event_handler(v43, handler);
      dispatch_resume((dispatch_object_t)self->timer);
      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      -[ASReachabilityQueryOperation finish](self, "finish");
    }

  }
}

BOOL __37__ASReachabilityQueryOperation_start__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __37__ASReachabilityQueryOperation_start__block_invoke_14(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queryTimedOut");

}

- (void)finish
{
  void *v3;
  NSSet *destinations;
  NSObject *v5;
  NSObject *timer;
  id completionHandler;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!self->_finished)
  {
    ASLoggingInitialize();
    v3 = (void *)ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      destinations = self->_destinations;
      v5 = v3;
      v8 = 134217984;
      v9 = -[NSSet count](destinations, "count");
      _os_log_impl(&dword_21381F000, v5, OS_LOG_TYPE_DEFAULT, "Reachability: Finished %lu destinations", (uint8_t *)&v8, 0xCu);

    }
    timer = self->timer;
    if (timer)
      dispatch_source_cancel(timer);
    -[IDSBatchIDQueryController invalidate](self->_batchQueryController, "invalidate");
    -[ASReachabilityQueryOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    -[ASReachabilityQueryOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = 1;
    self->_executing = 0;
    -[ASReachabilityQueryOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    -[ASReachabilityQueryOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
    (*((void (**)(void))self->_completionHandler + 2))();
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (void)_queryTimedOut
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21381F000, log, OS_LOG_TYPE_ERROR, "Reachability: Query timed out", v1, 2u);
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  id WeakRetained;
  NSMutableSet *remainingDestinations;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v19 = a4;
  v8 = a5;
  -[ASReachabilityQueryOperation serviceIdentifier](self, "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  v11 = v19;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __95__ASReachabilityQueryOperation_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke;
    v20[3] = &unk_24D0576E0;
    v20[4] = self;
    v13 = v12;
    v21 = v13;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v20);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_results, "addEntriesFromDictionary:", v13);
    WeakRetained = objc_loadWeakRetained((id *)&self->_statusCache);
    objc_msgSend(WeakRetained, "addStatusesByDestination:", v13);

    (*((void (**)(void))self->_updateHandler + 2))();
    remainingDestinations = self->_remainingDestinations;
    v16 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v13, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet minusSet:](remainingDestinations, "minusSet:", v18);

    if (!-[NSMutableSet count](self->_remainingDestinations, "count"))
      -[ASReachabilityQueryOperation finish](self, "finish");

    v11 = v19;
  }

}

void __95__ASReachabilityQueryOperation_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)IDSCopyRawAddressForDestination();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (ASReachabilityStatusCache)statusCache
{
  return (ASReachabilityStatusCache *)objc_loadWeakRetained((id *)&self->_statusCache);
}

- (void)setStatusCache:(id)a3
{
  objc_storeWeak((id *)&self->_statusCache, a3);
}

- (NSSet)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_statusCache);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_rawIDSDestinationToOriginalDestination, 0);
  objc_storeStrong((id *)&self->timer, 0);
  objc_storeStrong((id *)&self->_batchQueryController, 0);
  objc_storeStrong((id *)&self->_remainingDestinations, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
}

@end
