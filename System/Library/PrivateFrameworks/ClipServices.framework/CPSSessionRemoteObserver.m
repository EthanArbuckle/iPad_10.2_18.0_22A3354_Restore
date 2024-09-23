@implementation CPSSessionRemoteObserver

+ (id)observerWithXPCProxy:(id)a3
{
  id v3;
  CPSSessionRemoteObserver *v4;

  v3 = a3;
  v4 = -[CPSSessionRemoteObserver initWithXPCProxy:]([CPSSessionRemoteObserver alloc], "initWithXPCProxy:", v3);

  return v4;
}

- (CPSSessionRemoteObserver)initWithXPCProxy:(id)a3
{
  id v5;
  CPSSessionRemoteObserver *v6;
  CPSSessionRemoteObserver *v7;
  CPSSessionRemoteObserver *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSSessionRemoteObserver;
  v6 = -[CPSSessionRemoteObserver init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcProxy, a3);
    v8 = v7;
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return (id)-[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](self->_xpcProxy, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
}

void __56__CPSSessionRemoteObserver_forwardingTargetForSelector___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __56__CPSSessionRemoteObserver_forwardingTargetForSelector___block_invoke_cold_1((uint64_t)v2, v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcProxy, 0);
}

void __56__CPSSessionRemoteObserver_forwardingTargetForSelector___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20AD44000, a2, OS_LOG_TYPE_ERROR, "An error occurred when requesting remote proxy object for session proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end
