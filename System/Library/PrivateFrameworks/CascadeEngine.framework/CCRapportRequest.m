@implementation CCRapportRequest

- (CCRapportRequest)initWithUUID:(id)a3 activity:(id)a4 itemTypesSupportingSync:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CCRapportRequest *v17;
  CCRapportRequest *v18;
  uint64_t v19;
  id completionHandler;
  uint64_t v21;
  NSMutableSet *deliveredToDevices;
  uint64_t v23;
  NSMutableSet *inFlightToDevices;
  uint64_t v25;
  NSMutableDictionary *errorFromDevice;
  uint64_t v27;
  OS_os_transaction *transaction;
  id v30;
  objc_super v31;

  v30 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)CCRapportRequest;
  v17 = -[CCRapportRequest init](&v31, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_state = 0;
    objc_storeStrong((id *)&v17->_uuid, a3);
    objc_storeStrong((id *)&v18->_activity, a4);
    objc_storeStrong((id *)&v18->_itemTypesSupportingSync, a5);
    objc_storeStrong((id *)&v18->_queue, a6);
    v19 = objc_msgSend(v16, "copy");
    completionHandler = v18->_completionHandler;
    v18->_completionHandler = (id)v19;

    v21 = objc_opt_new();
    deliveredToDevices = v18->_deliveredToDevices;
    v18->_deliveredToDevices = (NSMutableSet *)v21;

    v23 = objc_opt_new();
    inFlightToDevices = v18->_inFlightToDevices;
    v18->_inFlightToDevices = (NSMutableSet *)v23;

    v25 = objc_opt_new();
    errorFromDevice = v18->_errorFromDevice;
    v18->_errorFromDevice = (NSMutableDictionary *)v25;

    v27 = os_transaction_create();
    transaction = v18->_transaction;
    v18->_transaction = (OS_os_transaction *)v27;

    -[CCRapportRequest startRequestTimeout](v18, "startRequestTimeout");
  }

  return v18;
}

- (void)markAsInFlightToDevice:(id)a3
{
  id v4;

  v4 = a3;
  -[CCRapportRequest startRequestTimeout](self, "startRequestTimeout");
  -[NSMutableSet addObject:](self->_inFlightToDevices, "addObject:", v4);

}

- (void)markAsDeliveredToDevice:(id)a3 withError:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[NSMutableSet removeObject:](self->_inFlightToDevices, "removeObject:", v7);
  -[NSMutableSet addObject:](self->_deliveredToDevices, "addObject:", v7);
  if (v6)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_errorFromDevice, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)startRequestTimeout
{
  NSObject *requestTimeout;
  dispatch_time_t v3;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id location;

  requestTimeout = self->_requestTimeout;
  if (requestTimeout)
  {
    v3 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(requestTimeout, v3, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
  }
  else
  {
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
    v6 = self->_requestTimeout;
    self->_requestTimeout = v5;

    v7 = self->_requestTimeout;
    v8 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
    objc_initWeak(&location, self);
    v9 = self->_requestTimeout;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39__CCRapportRequest_startRequestTimeout__block_invoke;
    v10[3] = &unk_25098A718;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_requestTimeout);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __39__CCRapportRequest_startRequestTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "requestTimeoutDidFire");

}

- (void)stopRequestTimeout
{
  NSObject *requestTimeout;
  OS_dispatch_source *v4;

  requestTimeout = self->_requestTimeout;
  if (requestTimeout)
  {
    dispatch_source_cancel(requestTimeout);
    v4 = self->_requestTimeout;
    self->_requestTimeout = 0;

  }
}

- (void)requestTimeoutDidFire
{
  void *v3;
  void (**v4)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCRapportRequest requestTimeoutHandler](self, "requestTimeoutHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CCRapportRequest requestTimeoutHandler](self, "requestTimeoutHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (NSArray)itemTypesSupportingSync
{
  return self->_itemTypesSupportingSync;
}

- (void)setItemTypesSupportingSync:(id)a3
{
  objc_storeStrong((id *)&self->_itemTypesSupportingSync, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSSet)deliveredToDevices
{
  return &self->_deliveredToDevices->super;
}

- (void)setDeliveredToDevices:(id)a3
{
  objc_storeStrong((id *)&self->_deliveredToDevices, a3);
}

- (NSSet)inFlightToDevices
{
  return &self->_inFlightToDevices->super;
}

- (void)setInFlightToDevices:(id)a3
{
  objc_storeStrong((id *)&self->_inFlightToDevices, a3);
}

- (NSDictionary)errorFromDevice
{
  return &self->_errorFromDevice->super;
}

- (void)setErrorFromDevice:(id)a3
{
  objc_storeStrong((id *)&self->_errorFromDevice, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)requestTimeout
{
  return self->_requestTimeout;
}

- (void)setRequestTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_requestTimeout, a3);
}

- (id)requestTimeoutHandler
{
  return self->_requestTimeoutHandler;
}

- (void)setRequestTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestTimeoutHandler, 0);
  objc_storeStrong((id *)&self->_requestTimeout, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_itemTypesSupportingSync, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_errorFromDevice, 0);
  objc_storeStrong((id *)&self->_inFlightToDevices, 0);
  objc_storeStrong((id *)&self->_deliveredToDevices, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
