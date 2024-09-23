@implementation NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem

- (NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem)initWithtimeoutQueue:(id)a3
{
  id v5;
  NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem *v6;
  NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem;
  v6 = -[NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_timeoutQueue, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem invalidateCleanupTimer](self, "invalidateCleanupTimer");
  v3.receiver = self;
  v3.super_class = (Class)NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem;
  -[NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem dealloc](&v3, sel_dealloc);
}

- (void)setOrResetCleanupTimer
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSString *messageIdentifier;
  NSObject *v7;
  dispatch_time_t v8;
  OS_dispatch_source *timeoutTimer;
  NSObject *v10;
  _QWORD handler[4];
  id v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
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
      v14 = messageIdentifier;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Setting or resetting cleanup timer for message with identifier %@", buf, 0xCu);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem invalidateCleanupTimer](self, "invalidateCleanupTimer");
  v7 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_timeoutQueue);
  v8 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak((id *)buf, self);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __87__NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem_setOrResetCleanupTimer__block_invoke;
  handler[3] = &unk_24CFE7970;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_source_set_event_handler(v7, handler);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = (OS_dispatch_source *)v7;
  v10 = v7;

  dispatch_resume(v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __87__NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem_setOrResetCleanupTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 6);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end
