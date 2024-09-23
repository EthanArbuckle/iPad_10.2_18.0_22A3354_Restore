@implementation APKRemoteInspectorCSSAgent

- (APKRemoteInspectorCSSAgent)initWithDispatcher:(id)a3
{
  id v5;
  APKRemoteInspectorCSSAgent *v6;
  APKRemoteInspectorCSSAgent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APKRemoteInspectorCSSAgent;
  v6 = -[APKRemoteInspectorCSSAgent init](&v9, sel_init);
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

- (void)getInlineStylesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  -[APKRemoteInspectorCSSAgent delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[APKRemoteInspectorCSSAgent delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __93__APKRemoteInspectorCSSAgent_getInlineStylesForNodeWithErrorCallback_successCallback_nodeId___block_invoke;
    v12[3] = &unk_24F46BD58;
    v13 = v9;
    v14 = v8;
    objc_msgSend(v11, "CSSAgent:onInlineStylesRequestWithIdentifier:completion:", self, v5, v12);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v8 + 2))(v8, CFSTR("Not supported"));
  }

}

void __93__APKRemoteInspectorCSSAgent_getInlineStylesForNodeWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a2;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 32);
    v11 = v6;
    (*(void (**)(void))(v7 + 16))();
    v8 = v11;

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a3, "localizedDescription");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

  }
}

- (void)getComputedStyleForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  -[APKRemoteInspectorCSSAgent delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[APKRemoteInspectorCSSAgent delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __94__APKRemoteInspectorCSSAgent_getComputedStyleForNodeWithErrorCallback_successCallback_nodeId___block_invoke;
    v12[3] = &unk_24F46BD80;
    v13 = v9;
    v14 = v8;
    objc_msgSend(v11, "CSSAgent:onComputedStylesRequestWithIdentifier:completion:", self, v5, v12);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v8 + 2))(v8, CFSTR("Not supported"));
  }

}

void __94__APKRemoteInspectorCSSAgent_getComputedStyleForNodeWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a3, "localizedDescription");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

- (APKRemoteInspectorCSSEventDispatcherProtocol)dispatcher
{
  return self->_dispatcher;
}

- (APKRemoteInspectorCSSAgentDelegate)delegate
{
  return (APKRemoteInspectorCSSAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
