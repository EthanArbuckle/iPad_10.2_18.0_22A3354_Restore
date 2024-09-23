@implementation HDIDSReachabilityOperation

- (HDIDSReachabilityOperation)initWithIdentifers:(id)a3 serviceIdentifier:(id)a4 updateHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDIDSReachabilityOperation *v12;
  HDIDSReachabilityOperation *v13;
  uint64_t v14;
  id updateHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDIDSReachabilityOperation;
  v12 = -[HDIDSReachabilityOperation init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_destinationIdentifiers, a3);
    objc_storeStrong((id *)&v13->_serviceIdentifier, a4);
    v14 = objc_msgSend(v11, "copy");
    updateHandler = v13->_updateHandler;
    v13->_updateHandler = (id)v14;

    v13->_queryTimeout = 60;
    v13->_finished = 0;
    v13->_executing = 0;
  }

  return v13;
}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  NSUInteger v5;
  void *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *timer;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  void *v13;
  id location;
  _BYTE buf[24];
  void *v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  if (!self->_queryController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSReachabilityOperation.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_queryController != nil"));

  }
  if (-[HDIDSReachabilityOperation isCancelled](self, "isCancelled"))
  {
    _HKInitializeLogging();
    HKLogSharing();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: We've been cancelled while in the operation queue.", buf, 0xCu);
    }
  }
  else
  {
    -[HDIDSReachabilityOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = 1;
    -[HDIDSReachabilityOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    _HKInitializeLogging();
    HKLogSharing();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[NSArray count](self->_destinationIdentifiers, "count");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Starting reachability operation for %ld identifiers", buf, 0x16u);
    }

    -[IDSBatchIDQueryController setDestinations:](self->_queryController, "setDestinations:", self->_destinationIdentifiers);
    objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "underlyingQueue");
    v3 = objc_claimAutoreleasedReturnValue();

    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
    timer = self->_timer;
    self->_timer = v7;

    v9 = self->_timer;
    v10 = dispatch_time(0, 1000000000 * self->_queryTimeout);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak(&location, self);
    v11 = self->_timer;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __41__HDIDSReachabilityOperation__startTimer__block_invoke;
    v16 = &unk_1E6CECE78;
    objc_copyWeak(v17, &location);
    dispatch_source_set_event_handler(v11, buf);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }

}

- (void)updateDestinations:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *timer;
  dispatch_time_t v7;
  int v8;
  HDIDSReachabilityOperation *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  HKLogSharing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2048;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating reachability operation for %ld identifiers", (uint8_t *)&v8, 0x16u);
  }

  -[IDSBatchIDQueryController setDestinations:](self->_queryController, "setDestinations:", v4);
  timer = self->_timer;
  if (timer)
  {
    v7 = dispatch_time(0, 1000000000 * self->_queryTimeout);
    dispatch_source_set_timer(timer, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)cancel
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  HDIDSReachabilityOperation *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogSharing();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: The reachability operation has been cancelled.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)HDIDSReachabilityOperation;
  -[HDIDSReachabilityOperation cancel](&v4, sel_cancel);
  -[HDIDSReachabilityOperation _finish]((uint64_t)self);
}

- (uint64_t)_finish
{
  uint64_t v1;
  NSObject *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 256), "invalidate");
    v2 = *(NSObject **)(v1 + 288);
    if (v2)
      dispatch_source_cancel(v2);
    objc_msgSend((id)v1, "willChangeValueForKey:", CFSTR("isFinished"));
    objc_msgSend((id)v1, "willChangeValueForKey:", CFSTR("isExecuting"));
    *(_BYTE *)(v1 + 249) = 0;
    *(_BYTE *)(v1 + 248) = 1;
    objc_msgSend((id)v1, "didChangeValueForKey:", CFSTR("isExecuting"));
    return objc_msgSend((id)v1, "didChangeValueForKey:", CFSTR("isFinished"));
  }
  return result;
}

void __41__HDIDSReachabilityOperation__startTimer__block_invoke(uint64_t a1)
{
  NSObject *v1;
  id WeakRetained;
  uint8_t buf[4];
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    HKLogSharing();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v4 = WeakRetained;
      _os_log_impl(&dword_1B7802000, v1, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: The reachability operation has timed out.", buf, 0xCu);
    }

    -[HDIDSReachabilityOperation _finish]((uint64_t)WeakRetained);
  }

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

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v16;
  HDIDSReachabilityOperation *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (-[HDIDSReachabilityOperation isCancelled](self, "isCancelled"))
  {
    _HKInitializeLogging();
    HKLogSharing();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = self;
      v13 = "[summary-sharing] %{public}@: We got a reachability callback but we are already cancelled.";
      v14 = v12;
      v15 = 12;
LABEL_8:
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
    }
  }
  else if (objc_msgSend(v10, "isEqualToString:", self->_serviceIdentifier))
  {
    objc_msgSend(v9, "hk_map:", &__block_literal_global_233);
    v12 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_updateHandler + 2))();
  }
  else
  {
    _HKInitializeLogging();
    HKLogSharing();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543618;
      v17 = self;
      v18 = 2112;
      v19 = v10;
      v13 = "[summary-sharing] %{public}@: We got a reachability callback with the incorrect service identifier %@";
      v14 = v12;
      v15 = 22;
      goto LABEL_8;
    }
  }

}

void __93__HDIDSReachabilityOperation_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (**v5)(id, id, id);
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)IDSCopyRawAddressForDestination();
  v5[2](v5, v7, v6);

}

- (void)unitTest_updateOperationTimeout:(unint64_t)a3
{
  self->_queryTimeout = a3;
}

- (IDSBatchIDQueryController)queryController
{
  return self->_queryController;
}

- (void)setQueryController:(id)a3
{
  objc_storeStrong((id *)&self->_queryController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_destinationIdentifiers, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
}

@end
