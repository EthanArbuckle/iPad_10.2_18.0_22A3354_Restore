@implementation APKRemoteInspectorNetworkAgent

- (APKRemoteInspectorNetworkAgent)initWithDispatcher:(id)a3
{
  id v5;
  APKRemoteInspectorNetworkAgent *v6;
  APKRemoteInspectorNetworkAgent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APKRemoteInspectorNetworkAgent;
  v6 = -[APKRemoteInspectorNetworkAgent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dispatcher, a3);

  return v7;
}

- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Not supported"));
}

- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Not supported"));
}

- (APKRemoteInspectorNetworkEventDispatcherProtocol)dispatcher
{
  return self->_dispatcher;
}

- (APKRemoteInspectorNetworkAgentDelegate)delegate
{
  return (APKRemoteInspectorNetworkAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

@end
