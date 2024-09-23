@implementation APKRemoteInspectorPageAgent

- (APKRemoteInspectorPageAgent)initWithDispatcher:(id)a3
{
  id v5;
  APKRemoteInspectorPageAgent *v6;
  APKRemoteInspectorPageAgent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APKRemoteInspectorPageAgent;
  v6 = -[APKRemoteInspectorPageAgent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dispatcher, a3);

  return v7;
}

- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Not supported"));
}

- (void)getResourceTreeWithErrorCallback:(id)a3 successCallback:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[APKRemoteInspectorPageAgent delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__APKRemoteInspectorPageAgent_getResourceTreeWithErrorCallback_successCallback___block_invoke;
  v8[3] = &unk_24F46BE60;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "pageAgent:onResourcesRequestWithCompletion:", self, v8);

}

void __80__APKRemoteInspectorPageAgent_getResourceTreeWithErrorCallback_successCallback___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x24BEC2770];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithIdentifier:loaderId:url:securityOrigin:mimeType:", CFSTR("AirPlayKit.DisplayTree"), &stru_24F471938, CFSTR("airplay://index"), CFSTR("AirPlayKit.DisplayTree"), CFSTR("text/xml"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2780]), "initWithFrame:resources:", v6, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getResourceContentWithErrorCallback:(id)a3 successCallback:(id)a4 frameId:(id)a5 url:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[APKRemoteInspectorPageAgent delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __95__APKRemoteInspectorPageAgent_getResourceContentWithErrorCallback_successCallback_frameId_url___block_invoke;
  v15[3] = &unk_24F46BE88;
  v16 = v10;
  v17 = v9;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v12, "pageAgent:onResourceContentRequestWithIdentifier:completion:", self, v11, v15);

}

void __95__APKRemoteInspectorPageAgent_getResourceContentWithErrorCallback_successCallback_frameId_url___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v5;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a4, "localizedDescription");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

- (APKRemoteInspectorPageEventDispatcherProtocol)dispatcher
{
  return self->_dispatcher;
}

- (APKRemoteInspectorPageAgentDelegate)delegate
{
  return (APKRemoteInspectorPageAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
