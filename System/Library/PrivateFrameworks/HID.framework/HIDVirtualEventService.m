@implementation HIDVirtualEventService

- (void)setDispatchQueue:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HIDVirtualEventService client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDispatchQueue:", v5);

  -[HIDVirtualEventService setQueue:](self, "setQueue:", v5);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCancelHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HIDVirtualEventService client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCancelHandler:", v4);

}

- (HIDVirtualEventService)init
{
  HIDVirtualEventService *v2;
  HIDEventSystemClient *v3;
  HIDVirtualEventService *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HIDVirtualEventService;
  v2 = -[HIDVirtualEventService init](&v6, sel_init);
  if (v2)
  {
    v3 = -[HIDEventSystemClient initWithType:]([HIDEventSystemClient alloc], "initWithType:", 4);
    -[HIDVirtualEventService setClient:](v2, "setClient:", v3);

    -[HIDVirtualEventService client](v2, "client");
    v4 = (HIDVirtualEventService *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)cancel
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

- (void)activate
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

- (HIDEventSystemClient)client
{
  return (HIDEventSystemClient *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)dispatchEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[HIDVirtualEventService serviceClient](self, "serviceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HIDVirtualEventService serviceClient](self, "serviceClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = IOHIDVirtualServiceClientDispatchEvent() != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HIDServiceClient)serviceClient
{
  return (HIDServiceClient *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HIDVirtualEventServiceDelegate)delegate
{
  return (HIDVirtualEventServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)dealloc
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<HIDVirtualEventService serviceID:0x%llx>"), -[HIDVirtualEventService serviceID](self, "serviceID"));
}

void __34__HIDVirtualEventService_activate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "notification:withProperty:forService:", 11, 0, v3);

    WeakRetained = v3;
  }

}

- (unint64_t)serviceID
{
  void *v3;
  __IOHIDServiceClient *v4;
  void *v5;
  unint64_t v6;

  -[HIDVirtualEventService serviceClient](self, "serviceClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HIDVirtualEventService serviceClient](self, "serviceClient");
  v4 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
  IOHIDServiceClientGetRegistryID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedLongLongValue");
  return v6;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

@end
