@implementation RPBroadcastHostViewController

- (void)updateBroadcastHandlerListenerEndpoint
{
  RPBroadcastExtensionHostContext *hostContext;
  _QWORD v3[5];

  hostContext = self->_hostContext;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__RPBroadcastHostViewController_updateBroadcastHandlerListenerEndpoint__block_invoke;
  v3[3] = &unk_24D15E378;
  v3[4] = self;
  -[RPBroadcastExtensionHostContext updateBroadcastHandlerListenerEndpoint:](hostContext, "updateBroadcastHandlerListenerEndpoint:", v3);
}

uint64_t __71__RPBroadcastHostViewController_updateBroadcastHandlerListenerEndpoint__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setListenerEndpoint:", a2);
}

- (RPBroadcastExtensionHostContext)hostContext
{
  return self->_hostContext;
}

- (void)setHostContext:(id)a3
{
  objc_storeStrong((id *)&self->_hostContext, a3);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_listenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_hostContext, 0);
}

@end
