@implementation HAPNameResolver

- (HAPNameResolver)initWithDeviceName:(id)a3 serviceType:(id)a4 domain:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPNameResolver *v12;
  HAPNameResolver *v13;
  uint64_t v14;
  OS_dispatch_queue *workQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HAPNameResolver;
  v12 = -[HAPNameResolver init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_serviceType, a4);
    objc_storeStrong((id *)&v13->_domain, a5);
    +[HAPNameResolver sharedWorkQueue](HAPNameResolver, "sharedWorkQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v14;

    v13->_resolutionState = 0;
  }

  return v13;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HAPNameResolver *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPNameResolver workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HAPNameResolver timer](self, "timer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNameResolver name](v8, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Name resolution timed out for %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HAPNameResolver _doCompletionWithErrorCode:state:](v8, "_doCompletionWithErrorCode:state:", 24, 3);
  }

}

- (void)_cancelTimer
{
  NSObject *v3;
  void *v4;

  -[HAPNameResolver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAPNameResolver timer](self, "timer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

  -[HAPNameResolver setTimer:](self, "setTimer:", 0);
}

- (void)_startTimerWithTimeout:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HAPNameResolver workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, a3);
  -[HAPNameResolver setTimer:](self, "setTimer:", v6);

  -[HAPNameResolver timer](self, "timer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[HAPNameResolver workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNameResolver timer](self, "timer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegateQueue:", v8);

  -[HAPNameResolver timer](self, "timer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

}

- (void)setResolutionState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_resolutionState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)resolutionState
{
  os_unfair_lock_s *p_lock;
  int64_t resolutionState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  resolutionState = self->_resolutionState;
  os_unfair_lock_unlock(p_lock);
  return resolutionState;
}

- (void)_doCompletionWithErrorCode:(int64_t)a3 socketInfo:(id)a4 state:(int64_t)a5
{
  id v8;
  NSObject *v9;
  int64_t v10;
  void *v11;
  HAPNameResolver *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  HAPNameResolver *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[HAPNameResolver workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = -[HAPNameResolver _cancelTimer](self, "_cancelTimer");
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), a3, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    a3 = v10;
  }
  v11 = (void *)MEMORY[0x1D17B7244](v10);
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPNameResolver name](v12, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = a3;
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@Name resolution completed for %@ error %@", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HAPNameResolver setResolutionState:](v12, "setResolutionState:", a5);
  -[HAPNameResolver connection](v12, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HAPNameResolver connection](v12, "connection");
    v17 = objc_claimAutoreleasedReturnValue();
    nw_connection_cancel(v17);

    -[HAPNameResolver setConnection:](v12, "setConnection:", 0);
  }
  -[HAPNameResolver completion](v12, "completion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HAPNameResolver completion](v12, "completion");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, int64_t, id))v19)[2](v19, a3, v8);

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17B7244]();
    v21 = v12;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v23;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "%{public}@No completion routine for name resolution", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }
  -[HAPNameResolver setCompletion:](v12, "setCompletion:", 0);

}

- (void)_doCompletionWithErrorCode:(int64_t)a3 state:(int64_t)a4
{
  NSObject *v7;

  -[HAPNameResolver workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HAPNameResolver _doCompletionWithErrorCode:socketInfo:state:](self, "_doCompletionWithErrorCode:socketInfo:state:", a3, 0, a4);
}

- (void)_updateSocketInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HAPNameResolver *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPNameResolver workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if ((unint64_t)(objc_msgSend(v4, "ipAddressType") - 1) <= 2)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNameResolver name](v7, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@IP received address %@ %@", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HAPNameResolver _cancelTimer](v7, "_cancelTimer");
    -[HAPNameResolver _doCompletionWithErrorCode:socketInfo:state:](v7, "_doCompletionWithErrorCode:socketInfo:state:", 0, v4, 2);
  }

}

- (void)_setStateChangedHandler
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[HAPNameResolver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  -[HAPNameResolver connection](self, "connection");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__HAPNameResolver__setStateChangedHandler__block_invoke;
  v5[3] = &unk_1E8949F20;
  objc_copyWeak(&v6, &location);
  nw_connection_set_state_changed_handler(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)_nwCreateConnection
{
  NSObject *v3;
  NSObject *secure_tcp;
  NSObject *v5;
  void *v6;
  HAPNameResolver *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  id v15;
  NSObject *bonjour_service;
  NSObject *v17;
  NSObject *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HAPNameResolver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], &__block_literal_global_9);
  v5 = nw_interface_create_with_name();
  nw_parameters_prohibit_interface(secure_tcp, v5);

  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPNameResolver shortDescription](v7, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@nw_connection_create with %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HAPNameResolver name](v7, "name");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  -[HAPNameResolver serviceType](v7, "serviceType");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  -[HAPNameResolver domain](v7, "domain");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  bonjour_service = nw_endpoint_create_bonjour_service(v12, v14, (const char *)objc_msgSend(v15, "UTF8String"));
  v17 = nw_connection_create(bonjour_service, secure_tcp);

  if (v17)
  {
    -[HAPNameResolver workQueue](v7, "workQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    nw_connection_set_queue(v17, v18);

  }
  return v17;
}

- (void)_nwConnectionStart
{
  NSObject *v3;
  NSObject *v4;

  -[HAPNameResolver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAPNameResolver connection](self, "connection");
  v4 = objc_claimAutoreleasedReturnValue();
  nw_connection_start(v4);

}

- (void)resolveWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  -[HAPNameResolver workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HAPNameResolver_resolveWithTimeout_completion___block_invoke;
  block[3] = &unk_1E894AF90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPNameResolver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__HAPNameResolver_invalidate__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HAPNameResolver name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNameResolver serviceType](self, "serviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNameResolver domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@/%@/%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __29__HAPNameResolver_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Name resolution time out for %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    if (objc_msgSend(*(id *)(a1 + 32), "resolutionState") == 1)
    {

    }
    else
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "resolutionState");

      if (v9)
        return;
    }
    objc_msgSend(*(id *)(a1 + 32), "_cancelTimer");
    objc_msgSend(*(id *)(a1 + 32), "_doCompletionWithErrorCode:state:", 2, 4);
  }
}

void __49__HAPNameResolver_resolveWithTimeout_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v20 = 138543874;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    v24 = 2048;
    v25 = v7;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting name resolution for %@ with timeout of %f", (uint8_t *)&v20, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 32), "resolutionState"))
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v11;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Attempt to initiate name resolution on stale object", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletion:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_nwCreateConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setConnection:", v13);

    objc_msgSend(*(id *)(a1 + 32), "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "setResolutionState:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_setStateChangedHandler");
      objc_msgSend(*(id *)(a1 + 32), "_startTimerWithTimeout:", *(double *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_nwConnectionStart");
    }
    else
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "shortDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v18;
        v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@nw_connection_create failed for %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 32), "_doCompletionWithErrorCode:state:", 9, 3);
    }
  }
}

void __42__HAPNameResolver__setStateChangedHandler__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  nw_path_t v35;
  NSObject *v36;
  NSObject *v37;
  int v38;
  int v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  uint64_t Port;
  HAPSocketInfo *v60;
  void *v61;
  void *v62;
  HAPSocketInfo *v63;
  void *v64;
  id v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint8_t v74[4];
  void *v75;
  __int16 v76;
  _BYTE v77[14];
  __int16 v78;
  void *v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_8;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v81 = v10;
    v82 = 2112;
    v83 = v11;
    v84 = 1024;
    v85 = a2;
    v86 = 2112;
    v87 = v5;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@nw_connection state changed %@ %d error %@", buf, 0x26u);

  }
  objc_autoreleasePoolPop(v7);
  if (v5)
  {
    objc_msgSend(v8, "connection");
    v12 = objc_claimAutoreleasedReturnValue();
    nw_connection_cancel_current_endpoint(v12);

    v13 = v8;
    v14 = 1;
LABEL_6:
    v15 = 3;
LABEL_7:
    objc_msgSend(v13, "_doCompletionWithErrorCode:state:", v14, v15);
    goto LABEL_8;
  }
  switch(a2)
  {
    case 0:
      v16 = (void *)MEMORY[0x1D17B7244]();
      v17 = v8;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v81 = v19;
        v82 = 2112;
        v83 = v20;
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEBUG, "%{public}@nw_connection_state invalid %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      goto LABEL_8;
    case 1:
      v21 = (void *)MEMORY[0x1D17B7244]();
      v22 = v8;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        goto LABEL_18;
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v81 = v24;
      v82 = 2112;
      v83 = v25;
      v26 = "%{public}@nw_connection_state waiting %@";
      v27 = v23;
      v28 = OS_LOG_TYPE_DEBUG;
      goto LABEL_17;
    case 2:
      v21 = (void *)MEMORY[0x1D17B7244]();
      v22 = v8;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        goto LABEL_18;
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v81 = v24;
      v82 = 2112;
      v83 = v25;
      v26 = "%{public}@nw_connection_state preparing %@";
      v27 = v23;
      v28 = OS_LOG_TYPE_INFO;
LABEL_17:
      _os_log_impl(&dword_1CCE01000, v27, v28, v26, buf, 0x16u);

LABEL_18:
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v22, "setResolutionState:", 1);
      goto LABEL_8;
    case 3:
      v29 = (void *)MEMORY[0x1D17B7244]();
      v30 = v8;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v81 = v32;
        v82 = 2112;
        v83 = v33;
        _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_INFO, "%{public}@nw_connection_state ready %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(v30, "connection");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = nw_connection_copy_current_path(v34);

      if (!v35)
      {
        v37 = 0;
LABEL_35:
        objc_msgSend(v30, "connection");
        v58 = objc_claimAutoreleasedReturnValue();
        nw_connection_cancel_current_endpoint(v58);

        v45 = v30;
        v46 = 15;
LABEL_36:
        objc_msgSend(v45, "_doCompletionWithErrorCode:state:", v46, 3);
        goto LABEL_37;
      }
      v36 = nw_path_copy_endpoint();
      v37 = v36;
      if (!v36 || !nw_endpoint_get_address(v36))
        goto LABEL_35;
      v38 = SockAddrToString();
      if (v38)
      {
        v39 = v38;
        v40 = (void *)MEMORY[0x1D17B7244]();
        v41 = v30;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "name");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v74 = 138543874;
          v75 = v43;
          v76 = 1024;
          *(_DWORD *)v77 = v39;
          *(_WORD *)&v77[4] = 2112;
          *(_QWORD *)&v77[6] = v44;
          _os_log_impl(&dword_1CCE01000, v42, OS_LOG_TYPE_ERROR, "%{public}@nw_connection sock addr to string failed: %d %@", v74, 0x1Cu);

        }
        objc_autoreleasePoolPop(v40);
        v45 = v41;
        v46 = 8;
        goto LABEL_36;
      }
      Port = SockAddrGetPort();
      v60 = [HAPSocketInfo alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", Port);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[HAPSocketInfo initWithIPAddressString:port:](v60, "initWithIPAddressString:port:", v61, v62);

      v64 = (void *)MEMORY[0x1D17B7244]();
      v65 = v30;
      HMFGetOSLogHandle();
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = v66;
      if (v63)
      {
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "name");
          v72 = v64;
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v74 = 138544130;
          v75 = v68;
          v76 = 2080;
          *(_QWORD *)v77 = buf;
          *(_WORD *)&v77[8] = 1024;
          *(_DWORD *)&v77[10] = Port;
          v78 = 2112;
          v79 = v69;
          _os_log_impl(&dword_1CCE01000, v67, OS_LOG_TYPE_INFO, "%{public}@nw_connection Address resolved:  %s   port: %d for %@", v74, 0x26u);

          v64 = v72;
        }

        objc_autoreleasePoolPop(v64);
        objc_msgSend(v65, "_updateSocketInfo:", v63);
      }
      else
      {
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v73 = v64;
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "name");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v74 = 138544130;
          v75 = v70;
          v76 = 2080;
          *(_QWORD *)v77 = buf;
          *(_WORD *)&v77[8] = 1024;
          *(_DWORD *)&v77[10] = Port;
          v78 = 2112;
          v79 = v71;
          _os_log_impl(&dword_1CCE01000, v67, OS_LOG_TYPE_ERROR, "%{public}@nw_connection Address resolved:  %s   port: %d for %@, but address type could not be determined", v74, 0x26u);

          v64 = v73;
        }

        objc_autoreleasePoolPop(v64);
      }

LABEL_37:
LABEL_8:

      return;
    case 4:
      v47 = (void *)MEMORY[0x1D17B7244]();
      v48 = v8;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "name");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v81 = v50;
        v82 = 2112;
        v83 = v51;
        _os_log_impl(&dword_1CCE01000, v49, OS_LOG_TYPE_INFO, "%{public}@nw_connection_state failed %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v47);
      objc_msgSend(v48, "connection");
      v52 = objc_claimAutoreleasedReturnValue();
      nw_connection_cancel(v52);

      v13 = v48;
      v14 = 8;
      goto LABEL_6;
    case 5:
      v53 = (void *)MEMORY[0x1D17B7244]();
      v54 = v8;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "name");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v81 = v56;
        v82 = 2112;
        v83 = v57;
        _os_log_impl(&dword_1CCE01000, v55, OS_LOG_TYPE_INFO, "%{public}@nw_connection_state cancelled %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v53);
      v13 = v54;
      v14 = 2;
      v15 = 4;
      goto LABEL_7;
    default:
      goto LABEL_8;
  }
}

+ (id)sharedWorkQueue
{
  if (sharedWorkQueue_onceToken != -1)
    dispatch_once(&sharedWorkQueue_onceToken, &__block_literal_global_3464);
  return (id)sharedWorkQueue_workQueue;
}

void __34__HAPNameResolver_sharedWorkQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.HAPNameResolution", 0);
  v1 = (void *)sharedWorkQueue_workQueue;
  sharedWorkQueue_workQueue = (uint64_t)v0;

}

@end
