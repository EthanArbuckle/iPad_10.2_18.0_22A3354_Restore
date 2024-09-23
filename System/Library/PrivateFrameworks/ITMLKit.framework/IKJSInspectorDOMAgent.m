@implementation IKJSInspectorDOMAgent

- (IKJSInspectorDOMAgent)initWithInspectorController:(id)a3
{
  id v4;
  IKJSInspectorDOMAgent *v5;
  uint64_t v6;
  NSMutableDictionary *searches;
  uint64_t v8;
  NSMapTable *eventListenersMap;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKJSInspectorDOMAgent;
  v5 = -[IKJSInspectorDOMAgent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    searches = v5->_searches;
    v5->_searches = (NSMutableDictionary *)v6;

    objc_storeWeak((id *)&v5->_controller, v4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    eventListenersMap = v5->_eventListenersMap;
    v5->_eventListenersMap = (NSMapTable *)v8;

  }
  return v5;
}

- (void)documentDidUpdate
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", a1);
  v7 = 134217984;
  v8 = v5;
  OUTLINED_FUNCTION_1_2(&dword_1D95F2000, a2, v6, "Updating RWIDocumentTree took %fms", (uint8_t *)&v7);

}

- (void)documentDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  self->_eventListenerIdSequence = 0;
  -[NSMapTable removeAllObjects](self->_eventListenersMap, "removeAllObjects");
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inspector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domEventDispatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safe_documentUpdated");
}

- (void)inspectNodeWithID:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  ITMLKitGetLogObject(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[IKJSInspectorDOMAgent inspectNodeWithID:].cold.1(a3, v5, v6);

  -[IKJSInspectorDOMAgent controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nodeById:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ik_nodePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[IKJSInspectorDOMAgent _fullfillNodePath:](self, "_fullfillNodePath:", v9);
    -[IKJSInspectorDOMAgent controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inspector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "domEventDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "safe_inspectWithNodeId:", a3);
  }

}

- (void)didAddEventListenerForNodeID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inspector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domEventDispatcher");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safe_didAddEventListenerWithNodeId:", v3);
}

- (void)willRemoveEventListenerForNodeID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inspector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domEventDispatcher");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safe_willRemoveEventListenerWithNodeId:", v3);
}

- (void)getDocumentWithErrorCallback:(id)a3 successCallback:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  RWIProtocolDOMNode *rootNode;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeDocument");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DD9620], "ik_nodeFromDOMNode:depth:", v12, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFrameId:", CFSTR("Page"));
    rootNode = self->_rootNode;
    self->_rootNode = (RWIProtocolDOMNode *)v7;
    v9 = v7;

    v10 = v9;
    v11 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DD9620], "safe_initWithNodeId:nodeType:nodeName:localName:nodeValue:", 0xFFFFFFFFLL, 0, &stru_1E9F50578, &stru_1E9F50578, &stru_1E9F50578);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    v11 = v9;
  }
  (*((void (**)(id, id))v5 + 2))(v5, v9);

}

- (void)requestChildNodesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 depth:(int *)a6
{
  uint64_t v7;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(id, const __CFString *);

  v7 = *(_QWORD *)&a5;
  v22 = (void (**)(id, const __CFString *))a3;
  v10 = (void (**)(_QWORD))a4;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inspector");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "domEventDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSInspectorDOMAgent controller](self, "controller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nodeById:", (int)v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (a6)
      v17 = *a6;
    else
      v17 = 3;
    objc_msgSend(MEMORY[0x1E0DD9620], "ik_nodeFromDOMNode:depth:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "children");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safe_setChildNodesWithParentId:nodes:", v7, v19);

    -[RWIProtocolDOMNode ik_nodeWithNodeId:](self->_rootNode, "ik_nodeWithNodeId:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "children");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setChildren:", v21);

    v10[2](v10);
  }
  else
  {
    v22[2](v22, CFSTR("Could not find node."));
  }

}

- (void)setNodeValueWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 value:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inspector");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "domEventDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSInspectorDOMAgent controller](self, "controller");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v17, "appContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__IKJSInspectorDOMAgent_setNodeValueWithErrorCallback_successCallback_nodeId_value___block_invoke;
  v24[3] = &unk_1E9F4F6C0;
  objc_copyWeak(&v30, &location);
  v19 = v17;
  v25 = v19;
  v31 = a5;
  v20 = v12;
  v26 = v20;
  v21 = v16;
  v27 = v21;
  v22 = v11;
  v28 = v22;
  v23 = v10;
  v29 = v23;
  objc_msgSend(v18, "_evaluate:", v24);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

void __84__IKJSInspectorDOMAgent_setNodeValueWithErrorCallback_successCallback_nodeId_value___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void (*v8)(void);
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "nodeById:", *(int *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!WeakRetained || !v2)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_9:
    v8();
    goto LABEL_10;
  }
  if (objc_msgSend(v2, "nodeType") != 3)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_9;
  }
  v3 = v2;
  objc_msgSend(WeakRetained[2], "ik_nodeWithNodeId:", *(unsigned int *)(a1 + 80));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setNodeValue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "safe_characterDataModifiedWithNodeId:characterData:", *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(v3, "parentNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("style"));

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "updateStylesheets");

LABEL_10:
}

- (void)removeNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;
  id location;

  v8 = a3;
  v9 = a4;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inspector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "domEventDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSInspectorDOMAgent controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v14, "appContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__IKJSInspectorDOMAgent_removeNodeWithErrorCallback_successCallback_nodeId___block_invoke;
  v20[3] = &unk_1E9F4F6E8;
  objc_copyWeak(&v25, &location);
  v16 = v14;
  v21 = v16;
  v26 = a5;
  v17 = v13;
  v22 = v17;
  v18 = v9;
  v23 = v18;
  v19 = v8;
  v24 = v19;
  objc_msgSend(v15, "_evaluate:", v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __76__IKJSInspectorDOMAgent_removeNodeWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "nodeById:", *(int *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained && v2)
  {
    objc_msgSend(v2, "parentNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(WeakRetained[2], "ik_nodeWithNodeId:", objc_msgSend(v3, "ITMLID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ik_removeChildWithId:", *(unsigned int *)(a1 + 72));
      v6 = (id)objc_msgSend(v4, "removeChild:", v2);
      objc_msgSend(*(id *)(a1 + 40), "safe_childNodeRemovedWithParentNodeId:nodeId:", objc_msgSend(v4, "ITMLID"), *(unsigned int *)(a1 + 72));

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)setAttributeValueWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 name:(id)a6 value:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int v30;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v16, "appContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __94__IKJSInspectorDOMAgent_setAttributeValueWithErrorCallback_successCallback_nodeId_name_value___block_invoke;
  v23[3] = &unk_1E9F4F6C0;
  objc_copyWeak(&v29, &location);
  v18 = v16;
  v24 = v18;
  v30 = a5;
  v19 = v15;
  v25 = v19;
  v20 = v14;
  v26 = v20;
  v21 = v13;
  v27 = v21;
  v22 = v12;
  v28 = v22;
  objc_msgSend(v17, "_evaluate:", v23);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __94__IKJSInspectorDOMAgent_setAttributeValueWithErrorCallback_successCallback_nodeId_name_value___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "nodeById:", *(int *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "setAttribute::", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained[2], "ik_nodeWithNodeId:", *(unsigned int *)(a1 + 80));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ik_setAttributeValue:name:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (void)setAttributesAsTextWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 text:(id)a6 name:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  IKJSInspectorDOMAgent *v31;
  id v32;
  id v33;
  id v34[2];
  int v35;
  id location;

  v26 = a3;
  v12 = a4;
  v13 = a6;
  objc_msgSend((id)objc_opt_class(), "_parseAttributeString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inspector");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "domEventDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSInspectorDOMAgent controller](self, "controller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v19, "appContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __95__IKJSInspectorDOMAgent_setAttributesAsTextWithErrorCallback_successCallback_nodeId_text_name___block_invoke;
  v27[3] = &unk_1E9F4F738;
  objc_copyWeak(v34, &location);
  v21 = v19;
  v35 = a5;
  v28 = v21;
  v34[1] = a7;
  v22 = v18;
  v29 = v22;
  v23 = v14;
  v30 = v23;
  v31 = self;
  v24 = v12;
  v32 = v24;
  v25 = v26;
  v33 = v25;
  objc_msgSend(v20, "_evaluate:", v27);

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);

}

void __95__IKJSInspectorDOMAgent_setAttributesAsTextWithErrorCallback_successCallback_nodeId_text_name___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (**v31)(void);
  void (*v32)(void);
  void *v33;
  id *v34;
  void *v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  id v45;
  int v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "nodeById:", *(int *)(a1 + 96));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!WeakRetained || !v3)
  {
    v32 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_28:
    v32();
    goto LABEL_29;
  }
  if (objc_msgSend(v3, "nodeType") != 1)
  {
    v32 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_28;
  }
  v33 = v4;
  v37 = v4;
  objc_msgSend(WeakRetained[2], "ik_nodeWithNodeId:", *(unsigned int *)(a1 + 96));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 88))
  {
    +[IKDOMElement _filteredAttributes](IKDOMElement, "_filteredAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", **(_QWORD **)(a1 + 88));

    if ((v6 & 1) == 0)
    {
      v7 = **(void ***)(a1 + 88);
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v9, "isEqualToString:", &stru_1E9F50578) & 1) == 0)
      {
        objc_msgSend(v36, "ik_removeAttributeNamed:", **(_QWORD **)(a1 + 88));
        objc_msgSend(v37, "removeAttribute:", **(_QWORD **)(a1 + 88));
        objc_msgSend(*(id *)(a1 + 40), "safe_attributeRemovedWithNodeId:name:", *(unsigned int *)(a1 + 96), **(_QWORD **)(a1 + 88));
      }

    }
  }
  v34 = WeakRetained;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v14);
        +[IKDOMElement _filteredAttributes](IKDOMElement, "_filteredAttributes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsObject:", v15);

        if ((v17 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "ik_setAttributeValue:name:", v18, v15);

          objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setAttribute::", v15, v19);

          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __95__IKJSInspectorDOMAgent_setAttributesAsTextWithErrorCallback_successCallback_nodeId_text_name___block_invoke_2;
          v42[3] = &unk_1E9F4F710;
          v20 = *(id *)(a1 + 40);
          v46 = *(_DWORD *)(a1 + 96);
          v43 = v20;
          v44 = v15;
          v45 = *(id *)(a1 + 48);
          v21 = (void *)MEMORY[0x1DF092410](v42);
          objc_msgSend(v35, "addObject:", v21);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v12);
  }

  objc_msgSend(*(id *)(a1 + 56), "controller");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resetStylesFromNode:", v37);

  v23 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 96));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safe_inlineStyleInvalidatedWithNodeIds:", v25);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v26 = v35;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v39;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(v26);
        v31 = (void (**)(void))MEMORY[0x1DF092410](*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v30));
        v31[2]();

        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    }
    while (v28);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v4 = v33;
  WeakRetained = v34;
LABEL_29:

}

void __95__IKJSInspectorDOMAgent_setAttributesAsTextWithErrorCallback_successCallback_nodeId_text_name___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = *(unsigned int *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safe_attributeModifiedWithNodeId:name:value:", v1, v3, v4);

}

- (void)removeAttributeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  int v25;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v13, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__IKJSInspectorDOMAgent_removeAttributeWithErrorCallback_successCallback_nodeId_name___block_invoke;
  v19[3] = &unk_1E9F4F6E8;
  objc_copyWeak(&v24, &location);
  v15 = v13;
  v20 = v15;
  v25 = a5;
  v16 = v12;
  v21 = v16;
  v17 = v11;
  v22 = v17;
  v18 = v10;
  v23 = v18;
  objc_msgSend(v14, "_evaluate:", v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __86__IKJSInspectorDOMAgent_removeAttributeWithErrorCallback_successCallback_nodeId_name___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "nodeById:", *(int *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "removeAttribute:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained[2], "ik_nodeWithNodeId:", *(unsigned int *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ik_removeAttributeNamed:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (int)_eventListenerIDForListener:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_eventListenerIdSequence + 1;
  self->_eventListenerIdSequence = v5;
  -[NSMapTable dictionaryRepresentation](self->_eventListenersMap, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeysForObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v10, "intValue");

    objc_msgSend(v8, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v11);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          -[NSMapTable removeObjectForKey:](self->_eventListenersMap, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
  return v5;
}

- (void)getEventListenersForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  IKJSInspectorDOMAgent *v16;
  id v17;
  id v18;
  int v19;
  id location;

  v8 = a3;
  v9 = a4;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v10, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke;
  v14[3] = &unk_1E9F4F788;
  v12 = v10;
  v15 = v12;
  v19 = a5;
  objc_copyWeak(&v18, &location);
  v16 = self;
  v13 = v9;
  v17 = v13;
  objc_msgSend(v11, "_evaluate:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  int v18;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nodeById:", *(int *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke_2;
  v14 = &unk_1E9F4F760;
  objc_copyWeak(&v17, (id *)(a1 + 56));
  v15 = *(_QWORD *)(a1 + 40);
  v18 = *(_DWORD *)(a1 + 64);
  v6 = v5;
  v16 = v6;
  v7 = (void *)MEMORY[0x1DF092410](&v11);
  objc_msgSend(v4, "enumerateEventListenersUsingBlock:", v7, v11, v12, v13, v14, v15);
  objc_msgSend(v4, "ownerDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    objc_msgSend(v4, "parentNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enumerateEventListenersUsingBlock:", v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  objc_destroyWeak(&v17);
}

void __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  _QWORD *WeakRetained;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;

  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "_eventListenerIDForListener:", v7);
    objc_msgSend(MEMORY[0x1E0DD9618], "safe_initWithEventListenerId:type:useCapture:isAttribute:", v10, v8, a4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNodeId:", *(unsigned int *)(a1 + 56));
    if (v11)
    {
      ITMLKitGetLogObject(1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke_2_cold_1(v7);

      v13 = (void *)WeakRetained[3];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v7, v14);

      objc_msgSend(v11, "setDisabled:", objc_msgSend(v7, "isEnabled") ^ 1);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    }

  }
}

- (void)setEventListenerDisabledWithErrorCallback:(id)a3 successCallback:(id)a4 eventListenerId:(int)a5 disabled:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  NSMapTable *eventListenersMap;
  void *v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  eventListenersMap = self->_eventListenersMap;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = (void (**)(_QWORD))a4;
  objc_msgSend(v9, "numberWithInt:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](eventListenersMap, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setEnabled:", !v6);
  ITMLKitGetLogObject(1);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[IKJSInspectorDOMAgent setEventListenerDisabledWithErrorCallback:successCallback:eventListenerId:disabled:].cold.1(v12);

  v10[2](v10);
}

- (void)getAccessibilityPropertiesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v5;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v7 = (void (**)(id, uint64_t))a4;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nodeById:", (int)v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "getAttribute:", CFSTR("accessibilityText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DD9608], "safe_initWithExists:label:nodeId:role:", objc_msgSend(v9, "length") != 0, v9, v5, &stru_1E9F50578);
    v10 = objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);

    v7 = (void (**)(id, uint64_t))v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DD9608], "safe_initWithExists:label:nodeId:role:", 0, &stru_1E9F50578, v5, &stru_1E9F50578);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, (uint64_t)v9);
  }

}

- (void)getOuterHTMLWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  int v19;

  v8 = a3;
  v9 = a4;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__IKJSInspectorDOMAgent_getOuterHTMLWithErrorCallback_successCallback_nodeId___block_invoke;
  v15[3] = &unk_1E9F4F7B0;
  v19 = a5;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v11, "_evaluate:", v15);

}

void __78__IKJSInspectorDOMAgent_getOuterHTMLWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "nodeById:", *(int *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = *(_QWORD *)(a1 + 40);
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v5, "outerHTML");
    else
      objc_msgSend(v5, "nodeValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)setOuterHTMLWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 outerHTML:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  int v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__IKJSInspectorDOMAgent_setOuterHTMLWithErrorCallback_successCallback_nodeId_outerHTML___block_invoke;
  v19[3] = &unk_1E9F4F7D8;
  v24 = a5;
  v20 = v13;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v15 = v10;
  v16 = v11;
  v17 = v12;
  v18 = v13;
  objc_msgSend(v14, "_evaluate:", v19);

}

void __88__IKJSInspectorDOMAgent_setOuterHTMLWithErrorCallback_successCallback_nodeId_outerHTML___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "nodeById:", *(int *)(a1 + 64));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = *(_QWORD *)(a1 + 40);
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v4, "setOuterHTML:", v3);
    else
      objc_msgSend(v4, "setNodeValue:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)performSearchWithErrorCallback:(id)a3 successCallback:(id)a4 query:(id)a5 nodeIds:(id *)a6
{
  -[IKJSInspectorDOMAgent performSearchWithErrorCallback:successCallback:query:nodeIds:caseSensitive:](self, "performSearchWithErrorCallback:successCallback:query:nodeIds:caseSensitive:", a3, a4, a5, a6, 0);
}

- (void)performSearchWithErrorCallback:(id)a3 successCallback:(id)a4 query:(id)a5 nodeIds:(id *)a6 caseSensitive:(BOOL *)a7
{
  void (**v11)(id, void *, _QWORD);
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = (void (**)(id, void *, _QWORD))a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSInspectorDOMAgent controller](self, "controller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activeDocument");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7)
  {
    if (*a7)
      v17 = 2;
    else
      v17 = 1;
  }
  else
  {
    v17 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ik_pathsForSearchQuery:compareOptions:currentPath:", v12, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        -[IKJSInspectorDOMAgent _fullfillNodePath:](self, "_fullfillNodePath:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v25++), (_QWORD)v27);
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v23);
  }

  if (v21)
  {
    -[NSMutableDictionary setObject:forKey:](self->_searches, "setObject:forKey:", v21, v14);
    v26 = objc_msgSend(v21, "count") - 1;
    if (a6)
    {
      objc_msgSend((id)objc_opt_class(), "_nodeIDsFromNodePaths:", v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v26 = 0;
  }
  v11[2](v11, v14, v26);

}

- (void)getSearchResultsWithErrorCallback:(id)a3 successCallback:(id)a4 searchId:(id)a5 fromIndex:(int)a6 toIndex:(int)a7
{
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  unint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  void (**v19)(id, const __CFString *);

  v19 = (void (**)(id, const __CFString *))a3;
  v12 = (void (**)(id, void *))a4;
  -[NSMutableDictionary objectForKey:](self->_searches, "objectForKey:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13
    || (v15 = objc_msgSend(v13, "count"), a7 < 0)
    || (v15 > a7 ? (v16 = a7 < a6) : (v16 = 1), v16 || a6 < 0 || v15 <= a6))
  {
    v19[2](v19, CFSTR("Boom"));
  }
  else
  {
    objc_msgSend(v14, "subarrayWithRange:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_nodeIDsFromNodePaths:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v18);

  }
}

- (void)discardSearchResultsWithErrorCallback:(id)a3 successCallback:(id)a4 searchId:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  void *v10;
  void (**v11)(id, const __CFString *);

  v11 = (void (**)(id, const __CFString *))a3;
  v8 = (void (**)(_QWORD))a4;
  v9 = a5;
  -[NSMutableDictionary objectForKey:](self->_searches, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_searches, "removeObjectForKey:", v9);
    v8[2](v8);
  }
  else
  {
    v11[2](v11, CFSTR("Not found"));
  }

}

- (void)setInspectModeEnabledWithErrorCallback:(id)a3 successCallback:(id)a4 enabled:(BOOL)a5 highlightConfig:(id *)a6
{
  _BOOL8 v6;
  void *v8;
  void (**v9)(void);

  v6 = a5;
  self->_inspectElementModeEnabled = a5;
  v9 = (void (**)(void))a4;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inspectElementModeChanged:", v6);

  v9[2]();
}

- (void)highlightNodeWithErrorCallback:(id)a3 successCallback:(id)a4 highlightConfig:(id)a5 nodeId:(int *)a6 objectId:(id *)a7
{
  void (**v11)(_QWORD);
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(id, const __CFString *);

  v27 = (void (**)(id, const __CFString *))a3;
  v11 = (void (**)(_QWORD))a4;
  v12 = a5;
  if (!a6)
    goto LABEL_5;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nodeById:", *a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_5;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v14, "ITMLID");
  objc_msgSend(v12, "contentColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ik_color");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paddingColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ik_color");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "borderColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ik_color");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "marginColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ik_color");
  v24 = v14;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend(v15, "highlightViewForElementWithID:contentColor:paddingColor:borderColor:marginColor:", v23, v16, v17, v19, v21);

  if ((_DWORD)v23)
  {
    v11[2](v11);
  }
  else
  {
LABEL_5:
    -[IKJSInspectorDOMAgent controller](self, "controller");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cancelHighlightView");

    v27[2](v27, CFSTR("unsupported"));
  }

}

- (void)highlightNodeListWithErrorCallback:(id)a3 successCallback:(id)a4 nodeIds:(id)a5 highlightConfig:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  IKJSInspectorDOMAgent *v25;
  void *v26;
  void *v27;
  id v28;
  void (**v29)(id, const __CFString *);

  v29 = (void (**)(id, const __CFString *))a3;
  v28 = a4;
  v10 = a6;
  v11 = a5;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nodesByIds:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = self;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v13;
  objc_msgSend(v13, "valueForKey:", CFSTR("ITMLID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ik_color");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "paddingColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ik_color");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "borderColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ik_color");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "marginColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "ik_color");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v26, "highlightViewsForElementsWithIDs:contentColor:paddingColor:borderColor:marginColor:", v14, v16, v18, v20, v22);

  if ((_DWORD)v11)
  {
    v23 = v28;
    (*((void (**)(id))v28 + 2))(v28);
  }
  else
  {
    -[IKJSInspectorDOMAgent controller](v25, "controller");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cancelHighlightView");

    v29[2](v29, CFSTR("unsupported"));
    v23 = v28;
  }

}

- (BOOL)hideHighlight
{
  void *v2;
  char v3;

  -[IKJSInspectorDOMAgent controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cancelHighlightView");

  return v3;
}

- (void)hideHighlightWithErrorCallback:(id)a3 successCallback:(id)a4
{
  void (**v6)(_QWORD);
  void (**v7)(id, const __CFString *);

  v7 = (void (**)(id, const __CFString *))a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[IKJSInspectorDOMAgent hideHighlight](self, "hideHighlight"))
    v6[2](v6);
  else
    v7[2](v7, CFSTR("unsupported"));

}

- (void)getAttributesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  void (**v8)(id, id);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void (**v14)(id, const __CFString *);
  _QWORD v15[4];
  id v16;

  v14 = (void (**)(id, const __CFString *))a3;
  v8 = (void (**)(id, id))a4;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nodeById:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "nodeType") == 1)
  {
    objc_msgSend(v10, "_attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__IKJSInspectorDOMAgent_getAttributesWithErrorCallback_successCallback_nodeId___block_invoke;
    v15[3] = &unk_1E9F4DCE8;
    v16 = v12;
    v13 = v12;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);
    v8[2](v8, v13);

  }
  else
  {
    v14[2](v14, CFSTR("Invalid Node."));
  }

}

void __79__IKJSInspectorDOMAgent_getAttributesWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  v5 = a3;
  +[IKDOMElement _filteredAttributes](IKDOMElement, "_filteredAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v8);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

- (void)moveToWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 targetNodeId:(int)a6 insertBeforeNodeId:(int *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  RWIProtocolDOMNode *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  RWIProtocolDOMNode *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  RWIProtocolDOMNode *v28;
  id v29;
  id v30;
  id v31;
  int *v32;
  int v33;
  int v34;

  v12 = a3;
  v13 = a4;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inspector");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "domEventDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSInspectorDOMAgent controller](self, "controller");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_rootNode;
  objc_msgSend(v18, "appContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __104__IKJSInspectorDOMAgent_moveToWithErrorCallback_successCallback_nodeId_targetNodeId_insertBeforeNodeId___block_invoke;
  v26[3] = &unk_1E9F4F800;
  v33 = a5;
  v34 = a6;
  v27 = v18;
  v28 = v19;
  v29 = v17;
  v30 = v13;
  v31 = v12;
  v32 = a7;
  v21 = v12;
  v22 = v13;
  v23 = v17;
  v24 = v19;
  v25 = v18;
  objc_msgSend(v20, "_evaluate:", v26);

}

void __104__IKJSInspectorDOMAgent_moveToWithErrorCallback_successCallback_nodeId_targetNodeId_insertBeforeNodeId___block_invoke(uint64_t a1)
{
  void *v2;
  int *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "nodeById:", *(int *)(a1 + 80));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nodeById:", *(int *)(a1 + 84));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(int **)(a1 + 72);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "nodeById:", *v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (v19)
    v5 = v2 == 0;
  else
    v5 = 1;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_25;
  }
  objc_msgSend(v19, "parentNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v4, "previousSibling");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
    {
      v10 = 0;
      v9 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v6, "lastChild");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (!v8)
  {
    v10 = 0;
    if (!v7)
      goto LABEL_20;
    goto LABEL_18;
  }
  v10 = objc_msgSend(v8, "ITMLID");
  if (v7)
  {
LABEL_18:
    objc_msgSend(*(id *)(a1 + 40), "ik_nodeWithNodeId:", objc_msgSend(v7, "ITMLID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ik_removeChildWithId:", objc_msgSend(v19, "ITMLID"));
    v12 = (id)objc_msgSend(v7, "removeChild:", v19);
    objc_msgSend(*(id *)(a1 + 48), "safe_childNodeRemovedWithParentNodeId:nodeId:", objc_msgSend(v7, "ITMLID"), *(unsigned int *)(a1 + 80));

  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0DD9620], "ik_nodeFromDOMNode:depth:", v19, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "ik_nodeWithNodeId:", *(unsigned int *)(a1 + 84));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(*(id *)(a1 + 40), "ik_nodeWithNodeId:", objc_msgSend(v4, "ITMLID")),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "nodeId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ik_insertChild:before:", v13, v17);

  }
  else
  {
    objc_msgSend(v14, "ik_insertChild:before:", v13, 0);
  }
  v18 = (id)objc_msgSend(v2, "insertBefore::", v19, v4);
  objc_msgSend(*(id *)(a1 + 48), "safe_childNodeInsertedWithParentNodeId:previousNodeId:node:", *(unsigned int *)(a1 + 84), v10, v13);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_25:
}

- (void)getSupportedEventNamesWithErrorCallback:(id)a3 successCallback:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  +[IKViewElement DOMEventTypeNameMap](IKViewElement, "DOMEventTypeNameMap");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v5, v6);

}

- (void)getAssociatedDataForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  void (**v7)(id, id *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v7 = (void (**)(id, id *))a4;
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nodeById:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[IKDOMBindingController domBindingControllerForDOMElement:](IKDOMBindingController, "domBindingControllerForDOMElement:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v10, "dataItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_11;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v12, 0, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v19;
  if (!v13)
  {
    ITMLKitGetLogObject(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[IKJSInspectorDOMAgent getAssociatedDataForNodeWithErrorCallback:successCallback:nodeId:].cold.1((uint64_t)v14, v15);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v13, 4);

  if (v16)
  {
    v18 = v16;
    v7[2](v7, &v18);
    v17 = v18;

  }
  else
  {
LABEL_11:
    v7[2](v7, 0);
  }

}

- (void)getDataBindingsForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void **p_cache;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  void *v31;
  void *v32;
  char *v33;
  id v34;
  char *v35;
  void **v36;
  void **v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  void *v41;
  char v42;
  const __CFString *v43;
  char v44;
  char v45;
  char v46;
  void *v47;
  void (**v48)(id, void *);
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSInspectorDOMAgent controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nodeById:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[IKDOMBindingController domBindingControllerForDOMElement:](IKDOMBindingController, "domBindingControllerForDOMElement:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      v47 = v9;
      v48 = v7;
      objc_msgSend(v10, "binding");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      if (!v15)
        goto LABEL_48;
      v16 = v15;
      p_cache = &OBJC_METACLASS___IKDOMXPathResult.cache;
      v18 = &OBJC_METACLASS___IKDOMXPathResult.cache;
      v19 = *(_QWORD *)v63;
      v50 = v11;
      v52 = v14;
      v55 = *(_QWORD *)v63;
      while (1)
      {
        v20 = 0;
        v51 = v16;
        do
        {
          if (*(_QWORD *)v63 != v19)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v20);
          objc_msgSend(v14, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v56 = v21;
            v54 = v20;
            objc_msgSend(v11, "dataItem");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "dataDictionary");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = v22;
            objc_msgSend(v22, "accessorSequence");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v26 = v25;
            v57 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
            if (v57)
            {
              v27 = *(_QWORD *)v59;
              while (2)
              {
                v28 = 0;
                v29 = sel_objectForKeyedSubscript_;
                v30 = sel_objectAtIndexedSubscript_;
                do
                {
                  if (*(_QWORD *)v59 != v27)
                    objc_enumerationMutation(v26);
                  v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v28);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                  {
                    objc_msgSend(v31, "property");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "objectForKeyedSubscript:", v32);
                    v33 = v30;
                    v34 = v26;
                    v35 = v29;
                    v36 = v18;
                    v37 = p_cache;
                    v38 = objc_claimAutoreleasedReturnValue();

                    v24 = (void *)v38;
                    p_cache = v37;
                    v18 = v36;
                    v29 = v35;
                    v26 = v34;
                    v30 = v33;
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
                    {

                      v24 = 0;
                      goto LABEL_27;
                    }
                    objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v31, "subscriptIndex"));
                    v32 = v24;
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  ++v28;
                }
                while (v57 != v28);
                v57 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
                if (v57)
                  continue;
                break;
              }
            }
LABEL_27:

            v11 = v50;
            v16 = v51;
            v14 = v52;
            v22 = v53;
            v20 = v54;
            if (!v24)
            {
LABEL_25:
              v39 = 0;
              goto LABEL_46;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v39 = 0;
              v24 = 0;
              goto LABEL_46;
            }
            v56 = v21;
            objc_msgSend(v22, "literal");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v24)
              goto LABEL_25;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = v24;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v24, "stringValue");
              v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (!v39)
                goto LABEL_46;
            }
            else
            {
              objc_opt_class();
              v39 = CFSTR("(Collection)");
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v39 = CFSTR("(Collection)");
                else
                  v39 = CFSTR("(Unspecified)");
              }
            }
          }
          v40 = v22;
          objc_msgSend(MEMORY[0x1E0DD9610], "safe_initWithBinding:value:", v56, v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v56, "isEqualToString:", CFSTR("textContent"));
          v43 = CFSTR("Text Content");
          if ((v42 & 1) == 0)
          {
            v44 = objc_msgSend(v56, "isEqualToString:", CFSTR("children"));
            v43 = CFSTR("Children");
            if ((v44 & 1) == 0)
            {
              v45 = objc_msgSend(v56, "isEqualToString:", CFSTR("items"));
              v43 = CFSTR("Items");
              if ((v45 & 1) == 0)
              {
                v46 = objc_msgSend(v56, "hasPrefix:", CFSTR("@"));
                v43 = CFSTR("Attribute");
                if ((v46 & 1) == 0)
                {
                  if (objc_msgSend(v56, "hasPrefix:", CFSTR("#")))
                    v43 = CFSTR("Style");
                  else
                    v43 = 0;
                }
              }
            }
          }
          objc_msgSend(v41, "setType:", v43);
          objc_msgSend(v49, "addObject:", v41);

          v22 = v40;
          v14 = v52;
LABEL_46:

          ++v20;
          v19 = v55;
        }
        while (v20 != v16);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        if (!v16)
        {
LABEL_48:

          v9 = v47;
          v7 = v48;
          break;
        }
      }
    }
  }
  v7[2](v7, v49);

}

- (void)_fullfillNodePath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  RWIProtocolDOMNode *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  if ((unint64_t)objc_msgSend(v17, "length") >= 3)
  {
    -[IKJSInspectorDOMAgent controller](self, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inspector");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domEventDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = self->_rootNode;
    -[IKJSInspectorDOMAgent controller](self, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(objc_msgSend(v17, "length") - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = 1;
      do
      {
        -[RWIProtocolDOMNode ik_updateWithDOMNode:fullfillChildren:dispatcher:](v8, "ik_updateWithDOMNode:fullfillChildren:dispatcher:", v10, 1, v7);
        if (objc_msgSend(v17, "length") - 1 > v11)
        {
          v12 = objc_msgSend(v17, "indexAtPosition:", v11);
          -[RWIProtocolDOMNode children](v8, "children");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndex:", v12);
          v14 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "childNodesAsArray");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndex:", v12);
          v16 = objc_claimAutoreleasedReturnValue();

          v8 = (RWIProtocolDOMNode *)v14;
          v10 = (void *)v16;
        }
        ++v11;
      }
      while (objc_msgSend(v17, "length") - 1 > v11);
    }

  }
}

+ (id)_parseAttributeString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  xmlDocPtr Memory;
  xmlDoc *v9;
  _xmlNode *children;
  void (**v11)(xmlChar *);
  _xmlAttr *i;
  xmlChar *Prop;
  void *v14;
  void *v15;
  void *v17;

  objc_msgSend(CFSTR("<a "), "stringByAppendingString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(" />"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v5);
  Memory = xmlReadMemory((const char *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), "noname.xml", 0, 0);
  if (Memory)
  {
    v9 = Memory;
    v17 = v4;
    children = Memory->children;
    if (children)
    {
      v11 = (void (**)(xmlChar *))MEMORY[0x1E0DE8D30];
      do
      {
        if (children->type == XML_ELEMENT_NODE)
        {
          for (i = children->properties; i; i = i->next)
          {
            Prop = xmlGetProp(children, i->name);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Prop);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", i->name);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKey:", v14, v15);

            if (Prop)
              (*v11)(Prop);
          }
        }
        children = children->next;
      }
      while (children);
    }
    xmlFreeDoc(v9);
    v4 = v17;
  }

  return v6;
}

+ (id)_nodeIDsFromNodePaths:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "indexAtPosition:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "length", (_QWORD)v13) - 1));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (IKJSInspectorController)controller
{
  return (IKJSInspectorController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (BOOL)isInspectElementModeEnabled
{
  return self->_inspectElementModeEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_eventListenersMap, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_searches, 0);
}

- (void)inspectNodeWithID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1D95F2000, a2, a3, "Inspecting node with id %lu", (uint8_t *)&v3);
}

void __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "isEnabled");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1D95F2000, v1, v2, "Adding %p with ID %i and %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_14();
}

- (void)setEventListenerDisabledWithErrorCallback:(void *)a1 successCallback:eventListenerId:disabled:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "isEnabled");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1D95F2000, v1, v2, "Setting %p with ID %i to %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_14();
}

- (void)getAssociatedDataForNodeWithErrorCallback:(uint64_t)a1 successCallback:(NSObject *)a2 nodeId:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "Unable to generate JSON data dictionary: %@", (uint8_t *)&v2, 0xCu);
}

@end
