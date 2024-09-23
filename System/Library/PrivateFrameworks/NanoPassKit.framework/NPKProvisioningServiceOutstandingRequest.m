@implementation NPKProvisioningServiceOutstandingRequest

- (void)setOrResetCleanupTimer
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSString *messageIdentifier;
  OS_dispatch_queue *timeoutQueue;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  OS_dispatch_source *timeoutTimer;
  NSObject *v13;
  _QWORD handler[4];
  id v15;
  uint8_t buf[4];
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      messageIdentifier = self->_messageIdentifier;
      *(_DWORD *)buf = 138412290;
      v17 = messageIdentifier;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Setting or resetting cleanup timer for message with identifier %@", buf, 0xCu);
    }

  }
  -[NPKProvisioningServiceOutstandingRequest invalidateCleanupTimer](self, "invalidateCleanupTimer");
  timeoutQueue = self->_timeoutQueue;
  if (timeoutQueue)
  {
    v8 = timeoutQueue;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v8);
  v11 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak((id *)buf, self);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __66__NPKProvisioningServiceOutstandingRequest_setOrResetCleanupTimer__block_invoke;
  handler[3] = &unk_24CFE7970;
  objc_copyWeak(&v15, (id *)buf);
  dispatch_source_set_event_handler(v10, handler);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = (OS_dispatch_source *)v10;
  v13 = v10;

  dispatch_resume(v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __66__NPKProvisioningServiceOutstandingRequest_setOrResetCleanupTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 4);
    if (v3)
    {
      v4 = v2;
      (*(void (**)(void))(v3 + 16))();
      v2 = v4;
    }
  }

}

- (void)invalidateCleanupTimer
{
  NSObject *timeoutTimer;
  OS_dispatch_source *v4;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
    v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (OS_dispatch_queue)timeoutQueue
{
  return self->_timeoutQueue;
}

- (void)setTimeoutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

@end
