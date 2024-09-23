@implementation APKRemoteInspectorDOMAgent

- (APKRemoteInspectorDOMAgent)initWithDispatcher:(id)a3
{
  id v5;
  APKRemoteInspectorDOMAgent *v6;
  APKRemoteInspectorDOMAgent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APKRemoteInspectorDOMAgent;
  v6 = -[APKRemoteInspectorDOMAgent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dispatcher, a3);

  return v7;
}

- (void)getDocumentWithErrorCallback:(id)a3 successCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[APKRemoteInspectorDOMAgent delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[APKRemoteInspectorDOMAgent delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __75__APKRemoteInspectorDOMAgent_getDocumentWithErrorCallback_successCallback___block_invoke;
    v10[3] = &unk_24F46BDE8;
    v11 = v7;
    v12 = v6;
    objc_msgSend(v9, "DOMAgent:onDocumentWithCompletion:", self, v10);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v6 + 2))(v6, CFSTR("Not supported"));
  }

}

void __75__APKRemoteInspectorDOMAgent_getDocumentWithErrorCallback_successCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v8 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setFrameId:", CFSTR("AirPlayKit.DisplayTree"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

- (void)getOuterHTMLWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
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
  -[APKRemoteInspectorDOMAgent delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[APKRemoteInspectorDOMAgent delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __83__APKRemoteInspectorDOMAgent_getOuterHTMLWithErrorCallback_successCallback_nodeId___block_invoke;
    v12[3] = &unk_24F46BE10;
    v13 = v9;
    v14 = v8;
    objc_msgSend(v11, "DOMAgent:onOuterHTMLRequestWithIdentifier:completion:", self, v5, v12);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v8 + 2))(v8, CFSTR("Not supported"));
  }

}

void __83__APKRemoteInspectorDOMAgent_getOuterHTMLWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (void)getAttributesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
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
  -[APKRemoteInspectorDOMAgent delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[APKRemoteInspectorDOMAgent delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __84__APKRemoteInspectorDOMAgent_getAttributesWithErrorCallback_successCallback_nodeId___block_invoke;
    v12[3] = &unk_24F46BD80;
    v13 = v9;
    v14 = v8;
    objc_msgSend(v11, "DOMAgent:onAttributesRequestWithIdentifier:completion:", self, v5, v12);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v8 + 2))(v8, CFSTR("Not supported"));
  }

}

void __84__APKRemoteInspectorDOMAgent_getAttributesWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (void)requestChildNodesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 depth:(int *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  int v19;
  id location;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  -[APKRemoteInspectorDOMAgent delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (a6)
      v13 = *a6;
    else
      v13 = 3;
    objc_initWeak(&location, self);
    -[APKRemoteInspectorDOMAgent delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __94__APKRemoteInspectorDOMAgent_requestChildNodesWithErrorCallback_successCallback_nodeId_depth___block_invoke;
    v15[3] = &unk_24F46BE38;
    objc_copyWeak(&v18, &location);
    v19 = v7;
    v16 = v11;
    v17 = v10;
    objc_msgSend(v14, "DOMAgent:onChildNodeRequestWithParentIdentifier:depth:completion:", self, v7, v13, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, const __CFString *))v10 + 2))(v10, CFSTR("Not supported"));
  }

}

void __94__APKRemoteInspectorDOMAgent_requestChildNodesWithErrorCallback_successCallback_nodeId_depth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "dispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setChildNodesWithParentId:nodes:", *(unsigned int *)(a1 + 56), v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

- (APKRemoteInspectorDOMEventDispatcherProtocol)dispatcher
{
  return self->_dispatcher;
}

- (APKRemoteInspectorDOMAgentDelegate)delegate
{
  return (APKRemoteInspectorDOMAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
