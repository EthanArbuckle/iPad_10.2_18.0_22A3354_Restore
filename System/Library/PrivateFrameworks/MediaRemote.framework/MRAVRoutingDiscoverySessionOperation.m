@implementation MRAVRoutingDiscoverySessionOperation

- (MRAVRoutingDiscoverySessionOperation)initWithOutputDeviceUIDs:(id)a3
{
  id v4;
  MRAVRoutingDiscoverySessionOperation *v5;
  uint64_t v6;
  NSArray *outputDeviceUIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRAVRoutingDiscoverySessionOperation;
  v5 = -[MRAVRoutingDiscoverySessionOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    outputDeviceUIDs = v5->_outputDeviceUIDs;
    v5->_outputDeviceUIDs = (NSArray *)v6;

  }
  return v5;
}

- (void)setEndpointDiscoveredHandler:(id)a3
{
  MRAVRoutingDiscoverySessionOperation *v4;
  uint64_t v5;
  id endpointDiscoveredHandler;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  endpointDiscoveredHandler = v4->_endpointDiscoveredHandler;
  v4->_endpointDiscoveredHandler = (id)v5;

  objc_sync_exit(v4);
}

- (id)endpointDiscoveredHandler
{
  MRAVRoutingDiscoverySessionOperation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend(v2->_endpointDiscoveredHandler, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)setOutputDeviceDiscoveredHandler:(id)a3
{
  MRAVRoutingDiscoverySessionOperation *v4;
  uint64_t v5;
  id outputDeviceDiscoveredHandler;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  outputDeviceDiscoveredHandler = v4->_outputDeviceDiscoveredHandler;
  v4->_outputDeviceDiscoveredHandler = (id)v5;

  objc_sync_exit(v4);
}

- (id)outputDeviceDiscoveredHandler
{
  MRAVRoutingDiscoverySessionOperation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend(v2->_outputDeviceDiscoveredHandler, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)setFinishHandler:(id)a3
{
  MRAVRoutingDiscoverySessionOperation *v4;
  uint64_t v5;
  id finishHandler;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  finishHandler = v4->_finishHandler;
  v4->_finishHandler = (id)v5;

  objc_sync_exit(v4);
}

- (id)finishHandler
{
  MRAVRoutingDiscoverySessionOperation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend(v2->_finishHandler, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (OS_dispatch_queue)dispatchQueue
{
  MRAVRoutingDiscoverySessionOperation *v2;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *v7;

  v2 = self;
  objc_sync_enter(v2);
  dispatchQueue = v2->_dispatchQueue;
  if (!dispatchQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.mediaremote.discoverySessionOperation", v4);
    v6 = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    dispatchQueue = v2->_dispatchQueue;
  }
  v7 = dispatchQueue;
  objc_sync_exit(v2);

  return v7;
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  MRAVRoutingDiscoverySessionOperation *obj;

  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  dispatchQueue = obj->_dispatchQueue;
  obj->_dispatchQueue = v4;

  objc_sync_exit(obj);
}

- (void)executeWithTimeout:(double)a3
{
  MRAVRoutingDiscoverySessionOperation *v5;
  uint64_t v6;
  NSDate *startDate;
  void *v8;
  uint64_t v9;
  NSString *requestID;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  MRBlockGuard *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  MRBlockGuard *guard;
  uint64_t v27;
  MRAVRoutingDiscoverySession *session;
  MRAVRoutingDiscoverySession *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[5];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_session)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("MRAVRoutingDiscoverySessionOperation.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_session"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = objc_claimAutoreleasedReturnValue();
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v6;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = objc_claimAutoreleasedReturnValue();
  requestID = v5->_requestID;
  v5->_requestID = (NSString *)v9;

  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[MRAVRoutingDiscoverySessionOperation outputDeviceUIDs](v5, "outputDeviceUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), objc_opt_class(), v5->_requestID);
  -[MRAVRoutingDiscoverySessionOperation outputDeviceUIDs](v5, "outputDeviceUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MRAVRoutingDiscoverySessionOperation outputDeviceUIDs](v5, "outputDeviceUIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendFormat:", CFSTR(" for %@"), v16);

  }
  _MRLogForCategory(0xAuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v14;
    _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  v19 = objc_opt_class();
  -[MRAVRoutingDiscoverySessionOperation outputDeviceUIDs](v5, "outputDeviceUIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("%@-%@"), v19, v20);

  v22 = [MRBlockGuard alloc];
  -[MRAVRoutingDiscoverySessionOperation dispatchQueue](v5, "dispatchQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __59__MRAVRoutingDiscoverySessionOperation_executeWithTimeout___block_invoke;
  v36[3] = &unk_1E30C6918;
  v36[4] = v5;
  v25 = -[MRBlockGuard initWithTimeout:reason:queue:handler:](v22, "initWithTimeout:reason:queue:handler:", v21, v23, v36, a3);
  guard = v5->_guard;
  v5->_guard = (MRBlockGuard *)v25;

  +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", 8);
  v27 = objc_claimAutoreleasedReturnValue();
  session = v5->_session;
  v5->_session = (MRAVRoutingDiscoverySession *)v27;

  objc_initWeak((id *)buf, v5);
  v29 = v5->_session;
  v33[0] = v24;
  v33[1] = 3221225472;
  v33[2] = __59__MRAVRoutingDiscoverySessionOperation_executeWithTimeout___block_invoke_2;
  v33[3] = &unk_1E30C9FC8;
  objc_copyWeak(&v35, (id *)buf);
  v30 = v13;
  v34 = v30;
  v31 = -[MRAVRoutingDiscoverySession addEndpointsAddedCallback:](v29, "addEndpointsAddedCallback:", v33);
  -[MRAVRoutingDiscoverySession setDiscoveryMode:](v5->_session, "setDiscoveryMode:", 2);

  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)buf);

  objc_sync_exit(v5);
}

uint64_t __59__MRAVRoutingDiscoverySessionOperation_executeWithTimeout___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelWithError:", a2);
}

void __59__MRAVRoutingDiscoverySessionOperation_executeWithTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  id v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v5)
    {
      v6 = v5;
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v9 = *(id *)(v19 + 32);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v21 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
                objc_msgSend(v8, "outputDeviceForUID:", v14, v16);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15)
                  objc_msgSend(WeakRetained, "_notifyDiscoveredEndpoint:outputDevice:forTargetOutputDevice:", v8, v15, v14);

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v11);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v6);
    }

    v3 = v16;
  }

}

- (void)_notifyDiscoveredEndpoint:(id)a3 outputDevice:(id)a4 forTargetOutputDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRAVRoutingDiscoverySessionOperation *v11;
  NSMutableSet *discoveredTargetOutputDeviceUIDs;
  NSMutableSet *v13;
  NSMutableSet *v14;
  NSMutableSet *discoveredEndpoints;
  uint64_t v16;
  NSMutableSet *v17;
  NSObject *v18;
  NSMutableSet *discoveredOutputDevices;
  uint64_t v20;
  NSMutableSet *v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD block[5];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  discoveredTargetOutputDeviceUIDs = v11->_discoveredTargetOutputDeviceUIDs;
  if (!discoveredTargetOutputDeviceUIDs)
  {
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v14 = v11->_discoveredTargetOutputDeviceUIDs;
    v11->_discoveredTargetOutputDeviceUIDs = v13;

    discoveredTargetOutputDeviceUIDs = v11->_discoveredTargetOutputDeviceUIDs;
  }
  -[NSMutableSet addObject:](discoveredTargetOutputDeviceUIDs, "addObject:", v10);
  discoveredEndpoints = v11->_discoveredEndpoints;
  if (!discoveredEndpoints)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSArray count](v11->_outputDeviceUIDs, "count"));
    v17 = v11->_discoveredEndpoints;
    v11->_discoveredEndpoints = (NSMutableSet *)v16;

    discoveredEndpoints = v11->_discoveredEndpoints;
  }
  if ((-[NSMutableSet containsObject:](discoveredEndpoints, "containsObject:", v8) & 1) == 0)
  {
    -[NSMutableSet addObject:](v11->_discoveredEndpoints, "addObject:", v8);
    -[MRAVRoutingDiscoverySessionOperation dispatchQueue](v11, "dispatchQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__MRAVRoutingDiscoverySessionOperation__notifyDiscoveredEndpoint_outputDevice_forTargetOutputDevice___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = v11;
    v28 = v8;
    dispatch_async(v18, block);

  }
  discoveredOutputDevices = v11->_discoveredOutputDevices;
  if (!discoveredOutputDevices)
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSArray count](v11->_outputDeviceUIDs, "count"));
    v21 = v11->_discoveredOutputDevices;
    v11->_discoveredOutputDevices = (NSMutableSet *)v20;

    discoveredOutputDevices = v11->_discoveredOutputDevices;
  }
  if ((-[NSMutableSet containsObject:](discoveredOutputDevices, "containsObject:", v9) & 1) == 0)
  {
    -[NSMutableSet addObject:](v11->_discoveredOutputDevices, "addObject:", v9);
    -[MRAVRoutingDiscoverySessionOperation dispatchQueue](v11, "dispatchQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __101__MRAVRoutingDiscoverySessionOperation__notifyDiscoveredEndpoint_outputDevice_forTargetOutputDevice___block_invoke_2;
    v24[3] = &unk_1E30C7328;
    v24[4] = v11;
    v25 = v8;
    v26 = v9;
    dispatch_async(v22, v24);

  }
  v23 = -[NSMutableSet count](v11->_discoveredTargetOutputDeviceUIDs, "count");
  if (v23 == -[NSArray count](v11->_outputDeviceUIDs, "count"))
    -[MRAVRoutingDiscoverySessionOperation _finishWithError:](v11, "_finishWithError:", 0);
  objc_sync_exit(v11);

}

void __101__MRAVRoutingDiscoverySessionOperation__notifyDiscoveredEndpoint_outputDevice_forTargetOutputDevice___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "endpointDiscoveredHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, *(_QWORD *)(a1 + 40));
    v2 = (void (**)(_QWORD, _QWORD))v3;
  }

}

void __101__MRAVRoutingDiscoverySessionOperation__notifyDiscoveredEndpoint_outputDevice_forTargetOutputDevice___block_invoke_2(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "outputDeviceDiscoveredHandler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v2 = (void (**)(_QWORD, _QWORD, _QWORD))v3;
  }

}

- (void)_finishWithError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  MRAVRoutingDiscoverySessionOperationReport *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSString *requestID;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  NSString *v36;
  void *v37;
  uint64_t v38;
  NSString *v39;
  void *v40;
  NSObject *v41;
  MRAVRoutingDiscoverySessionOperationReport *v42;
  _QWORD v43[5];
  MRAVRoutingDiscoverySessionOperationReport *v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  NSString *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MRAVRoutingDiscoverySession discoveryMode](self->_session, "discoveryMode"))
  {
    -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_session, "setDiscoveryMode:", 0);
    v5 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[MRAVRoutingDiscoverySessionOperation outputDeviceUIDs](self, "outputDeviceUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

    objc_msgSend(v7, "minusSet:", self->_discoveredTargetOutputDeviceUIDs);
    v8 = objc_alloc_init(MRAVRoutingDiscoverySessionOperationReport);
    -[NSMutableSet allObjects](self->_discoveredTargetOutputDeviceUIDs, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVRoutingDiscoverySessionOperationReport setDiscoveredOutputDeviceUIDs:](v8, "setDiscoveredOutputDeviceUIDs:", v9);

    objc_msgSend(v7, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVRoutingDiscoverySessionOperationReport setUndiscoveredOutputDeviceUIDs:](v8, "setUndiscoveredOutputDeviceUIDs:", v10);

    if (-[NSArray count](self->_outputDeviceUIDs, "count")
      && !-[NSMutableSet count](self->_discoveredTargetOutputDeviceUIDs, "count"))
    {
      v11 = v4;
      if (!v4)
      {
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 39, CFSTR("Could not discover any of the provided devices"));
        -[MRAVRoutingDiscoverySessionOperationReport setError:](v8, "setError:", v34);

LABEL_6:
        -[MRAVRoutingDiscoverySessionOperationReport error](v8, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {

        }
        else
        {
          -[MRAVRoutingDiscoverySessionOperationReport discoveredOutputDeviceUIDs](v8, "discoveredOutputDeviceUIDs");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            -[MRAVRoutingDiscoverySessionOperation outputDeviceUIDs](self, "outputDeviceUIDs");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            _MRLogForCategory(0xAuLL);
            v16 = objc_claimAutoreleasedReturnValue();
            v20 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
            if (v19)
            {
              if (v20)
              {
                v21 = objc_opt_class();
                requestID = self->_requestID;
                -[MRAVRoutingDiscoverySessionOperationReport discoveredOutputDeviceUIDs](v8, "discoveredOutputDeviceUIDs");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[MRAVRoutingDiscoverySessionOperation outputDeviceUIDs](self, "outputDeviceUIDs");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "timeIntervalSinceDate:", self->_startDate);
                *(_DWORD *)buf = 138544386;
                v46 = v21;
                v47 = 2114;
                v48 = requestID;
                v49 = 2112;
                v50 = v23;
                v51 = 2114;
                v52 = v24;
                v53 = 2048;
                v54 = v26;
                _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds", buf, 0x34u);

              }
              goto LABEL_29;
            }
            if (v20)
            {
              v38 = objc_opt_class();
              v39 = self->_requestID;
              -[MRAVRoutingDiscoverySessionOperationReport discoveredOutputDeviceUIDs](v8, "discoveredOutputDeviceUIDs");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "timeIntervalSinceDate:", self->_startDate);
              *(_DWORD *)buf = 138544130;
              v46 = v38;
              v47 = 2114;
              v48 = v39;
              v49 = 2112;
              v50 = v30;
              v51 = 2048;
              v52 = v40;
              v33 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
              goto LABEL_27;
            }
LABEL_29:

            -[MRAVRoutingDiscoverySessionOperation dispatchQueue](self, "dispatchQueue");
            v41 = objc_claimAutoreleasedReturnValue();
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __57__MRAVRoutingDiscoverySessionOperation__finishWithError___block_invoke;
            v43[3] = &unk_1E30C5F40;
            v43[4] = self;
            v44 = v8;
            v42 = v8;
            dispatch_async(v41, v43);

            goto LABEL_30;
          }
        }
        -[MRAVRoutingDiscoverySessionOperationReport error](v8, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[MRAVRoutingDiscoverySessionOperation outputDeviceUIDs](self, "outputDeviceUIDs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        _MRLogForCategory(0xAuLL);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v13)
        {
          v17 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
          if (v14)
          {
            if (v17)
              -[MRAVRoutingDiscoverySessionOperation _finishWithError:].cold.2(self, v8, v16);
          }
          else if (v17)
          {
            -[MRAVRoutingDiscoverySessionOperation _finishWithError:].cold.1((uint64_t)self, v8, v16);
          }
          goto LABEL_29;
        }
        v27 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v27)
          {
            v28 = objc_opt_class();
            v29 = self->_requestID;
            -[MRAVRoutingDiscoverySessionOperation outputDeviceUIDs](self, "outputDeviceUIDs");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "timeIntervalSinceDate:", self->_startDate);
            *(_DWORD *)buf = 138544130;
            v46 = v28;
            v47 = 2114;
            v48 = v29;
            v49 = 2114;
            v50 = v30;
            v51 = 2048;
            v52 = v32;
            v33 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_27:
            _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, v33, buf, 0x2Au);

            goto LABEL_28;
          }
        }
        else if (v27)
        {
          v35 = objc_opt_class();
          v36 = self->_requestID;
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "timeIntervalSinceDate:", self->_startDate);
          *(_DWORD *)buf = 138543874;
          v46 = v35;
          v47 = 2114;
          v48 = v36;
          v49 = 2048;
          v50 = v37;
          _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
LABEL_28:

          goto LABEL_29;
        }
        goto LABEL_29;
      }
    }
    else
    {
      v11 = 0;
    }
    -[MRAVRoutingDiscoverySessionOperationReport setError:](v8, "setError:", v11);
    goto LABEL_6;
  }
LABEL_30:

}

void __57__MRAVRoutingDiscoverySessionOperation__finishWithError___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "finishHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, *(_QWORD *)(a1 + 40));
    v2 = (void (**)(_QWORD, _QWORD))v3;
  }

}

- (void)cancel
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 25);
  -[MRAVRoutingDiscoverySessionOperation cancelWithError:](self, "cancelWithError:", v3);

}

- (void)cancelWithError:(id)a3
{
  MRAVRoutingDiscoverySessionOperation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MRAVRoutingDiscoverySessionOperation _finishWithError:](v4, "_finishWithError:", v5);
  objc_sync_exit(v4);

}

- (NSArray)outputDeviceUIDs
{
  return self->_outputDeviceUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_discoveredTargetOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_discoveredOutputDevices, 0);
  objc_storeStrong((id *)&self->_discoveredEndpoints, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_finishHandler, 0);
  objc_storeStrong(&self->_endpointDiscoveredHandler, 0);
  objc_storeStrong(&self->_outputDeviceDiscoveredHandler, 0);
}

- (void)_finishWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint8_t v11[14];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v6 = *(_QWORD *)(a1 + 88);
  objc_msgSend(a2, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 80));
  OUTLINED_FUNCTION_0_7();
  v12 = v6;
  v13 = v9;
  v14 = v7;
  v15 = 2048;
  v16 = v10;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v11, 0x2Au);

}

- (void)_finishWithError:(NSObject *)a3 .cold.2(_QWORD *a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint8_t v12[14];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v6 = a1[11];
  objc_msgSend(a2, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "outputDeviceUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", a1[10]);
  OUTLINED_FUNCTION_0_7();
  v13 = v6;
  v14 = v10;
  v15 = v7;
  v16 = v10;
  v17 = v8;
  v18 = 2048;
  v19 = v11;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", v12, 0x34u);

}

@end
