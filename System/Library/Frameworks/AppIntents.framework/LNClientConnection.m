@implementation LNClientConnection

void __70__LNClientConnection_fetchAppShortcutParametersWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__LNClientConnection_fetchAppShortcutParametersWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v12 = v5;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

uint64_t __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchAppShortcutParametersWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__LNClientConnection_fetchAppShortcutParametersWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F0CB138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchAppShortcutParametersWithCompletionHandler:", v7);

}

void __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "hash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke_2;
  v12[3] = &unk_24F0CB1D8;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 88);
  objc_msgSend(v2, "fetchOptionsForAction:actionMetadata:parameterMetadata:optionsProviderReference:searchTerm:localeIdentifier:connectionIdentifier:completionHandler:", v9, v3, v4, v5, v6, v7, v11, v12);

}

void __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke_2;
  v9[3] = &unk_24F0CB250;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "fetchParameterOptionDefaultValueForAction:actionMetadata:parameterIdentifier:connectionIdentifier:completionHandler:", v6, v3, v4, v8, v9);

}

- (LNAppContext)appContext
{
  return self->_appContext;
}

- (void)fetchParameterOptionDefaultValueForAction:(id)a3 actionMetadata:(id)a4 parameterIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24F0CB278;
  block[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __70__LNClientConnection_fetchAppShortcutParametersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, void *, _QWORD))(v3 + 16))(v3, v6, v4, v5, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 48), 0, 0, 0, *(_QWORD *)(a1 + 40));
  }
}

- (void)getListenerEndpointWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _OWORD v15[2];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *, _QWORD))a3;
  -[LNClientConnection connectionListener](self, "connectionListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNClientConnection connectionListener](self, "connectionListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "xpcListener");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCE50];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "if_auditToken");
    else
      memset(v15, 0, sizeof(v15));
    objc_msgSend(v9, "if_dataWithAuditToken:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8, v14, 0);

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BE5FE78];
    v16 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to request listener endpoint because the connection listener is unset."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 2301, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *, void *))v4)[2](v4, 0, 0, v8);
    v11 = v4;
  }

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 optionsProviderReference:(id)a6 searchTerm:(id)a7 localeIdentifier:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke;
  v29[3] = &unk_24F0CB200;
  v29[4] = self;
  v30 = v15;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v35 = v20;
  v36 = v21;
  v22 = v21;
  v23 = v20;
  v24 = v19;
  v25 = v18;
  v26 = v17;
  v27 = v16;
  v28 = v15;
  dispatch_async(MEMORY[0x24BDAC9B8], v29);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  getLNLogCategoryExecution();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227EAE000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating client connection", buf, 2u);
  }

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)LNClientConnection;
  -[LNClientConnection dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionListener);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_performActionOperations, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
}

- (LNClientConnection)initWithConnection:(id)a3 connectionListener:(id)a4 queue:(id)a5 appContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNClientConnection *v15;
  LNClientConnection *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMapTable *performActionOperations;
  LNClientConnection *v22;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)LNClientConnection;
  v15 = -[LNClientConnection init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a5);
    objc_storeStrong((id *)&v16->_appContext, a6);
    objc_storeStrong((id *)&v16->_xpcConnection, a3);
    LNConnectionClientXPCInterface();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v16->_xpcConnection, "setRemoteObjectInterface:", v17);

    LNConnectionHostXPCInterface();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v16->_xpcConnection, "setExportedInterface:", v18);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE60240]), "initWithValue:", v16);
    -[NSXPCConnection setExportedObject:](v16->_xpcConnection, "setExportedObject:", v19);

    -[NSXPCConnection resume](v16->_xpcConnection, "resume");
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    performActionOperations = v16->_performActionOperations;
    v16->_performActionOperations = (NSMapTable *)v20;

    objc_storeWeak((id *)&v16->_connectionListener, v12);
    v22 = v16;
  }

  return v16;
}

- (void)enqueuePerformActionOperation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__LNClientConnection_enqueuePerformActionOperation___block_invoke;
  v6[3] = &unk_24F0CB110;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)removePerformActionOperation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__LNClientConnection_removePerformActionOperation___block_invoke;
  v6[3] = &unk_24F0CB110;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)fetchDisplayRepresentationForActions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __77__LNClientConnection_fetchDisplayRepresentationForActions_completionHandler___block_invoke;
  v10[3] = &unk_24F0CB138;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchDisplayRepresentationForActions:completionHandler:", v7, v10);

}

- (void)fetchViewEntitiesWithInteractionIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__LNClientConnection_fetchViewEntitiesWithInteractionIDs_completionHandler___block_invoke;
  v10[3] = &unk_24F0CB138;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchViewEntitiesWithInteractionIDs:completionHandler:", v7, v10);

}

- (void)fetchViewActionsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__LNClientConnection_fetchViewActionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F0CB138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchViewActionsWithCompletionHandler:", v7);

}

- (void)performPropertyQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _OWORD v17[2];

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v17, 0, sizeof(v17));
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__LNClientConnection_performPropertyQuery_completionHandler___block_invoke;
  v15[3] = &unk_24F0CB160;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v8, "performQuery:auditToken:connectionIdentifier:completionHandler:", v7, v17, v13, v15);

}

- (void)performConfigurableQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _OWORD v17[2];

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v17, 0, sizeof(v17));
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__LNClientConnection_performConfigurableQuery_completionHandler___block_invoke;
  v15[3] = &unk_24F0CB160;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v8, "performConfigurableQuery:auditToken:connectionIdentifier:completionHandler:", v7, v17, v13, v15);

}

- (void)performSuggestedResultsQueryWithEntityType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _OWORD v17[2];

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v17, 0, sizeof(v17));
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__LNClientConnection_performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke;
  v15[3] = &unk_24F0CB160;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v8, "performSuggestedResultsQueryWithEntityType:auditToken:connectionIdentifier:completionHandler:", v7, v17, v13, v15);

}

- (void)performSuggestedEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _OWORD v17[2];

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v17, 0, sizeof(v17));
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __95__LNClientConnection_performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke;
  v15[3] = &unk_24F0CB160;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v8, "performSuggestedEntitiesQueryWithEntityMangledTypeName:auditToken:connectionIdentifier:completionHandler:", v7, v17, v13, v15);

}

- (void)performAllEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _OWORD v17[2];

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v17, 0, sizeof(v17));
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __89__LNClientConnection_performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke;
  v15[3] = &unk_24F0CB160;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v8, "performAllEntitiesQueryWithEntityMangledTypeName:auditToken:connectionIdentifier:completionHandler:", v7, v17, v13, v15);

}

- (void)fetchDestinationMDMAccountIdentifierForAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__LNClientConnection_fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke;
  v10[3] = &unk_24F0CB188;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchDestinationMDMAccountIdentifierForAction:completionHandler:", v7, v10);

}

- (void)performAction:(id)a3 options:(id)a4 executor:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  LNPerformActionExecutorDelegateProxy *v14;
  void *v15;
  LNPerformActionExecutorDelegateProxy *v16;
  LNPerformActionOperation *v17;
  id v18;
  LNPerformActionOperation *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  LNClientConnection *v24;
  id v25;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [LNPerformActionExecutorDelegateProxy alloc];
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[LNPerformActionExecutorDelegateProxy initWithConnection:interface:](v14, "initWithConnection:interface:", v15, v11);

  v17 = [LNPerformActionOperation alloc];
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __71__LNClientConnection_performAction_options_executor_completionHandler___block_invoke;
  v23 = &unk_24F0CB1B0;
  v24 = self;
  v25 = v10;
  v18 = v10;
  v19 = -[LNPerformActionOperation initWithAction:options:client:completionHandler:](v17, "initWithAction:options:client:completionHandler:", v13, v12, v16, &v20);

  -[LNClientConnection enqueuePerformActionOperation:](self, "enqueuePerformActionOperation:", v19, v20, v21, v22, v23, v24);
}

- (void)fetchStructuredDataWithTypeIdentifier:(int64_t)a3 forEntityIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v8 = a5;
  v9 = a4;
  -[LNClientConnection appContext](self, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __99__LNClientConnection_fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke;
  v12[3] = &unk_24F0CB228;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "fetchStructuredDataWithTypeIdentifier:forEntityIdentifiers:completionHandler:", a3, v9, v12);

}

- (void)fetchOptionsDefaultValuesForAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke;
  block[3] = &unk_24F0CB368;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)fetchActionOutputValueWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__LNClientConnection_fetchActionOutputValueWithIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_24F0CB2A0;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "fetchActionOutputValueForConnection:withIdentifier:completionHandler:", v9, v7, v11);

}

- (void)fetchSuggestedActionsFromViewWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__LNClientConnection_fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F0CB138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchSuggestedActionsFromViewWithCompletionHandler:", v7);

}

- (void)fetchSuggestedActionsWithSiriLanguageCode:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __82__LNClientConnection_fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke;
  v10[3] = &unk_24F0CB138;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchSuggestedActionsWithSiriLanguageCode:completionHandler:", v7, v10);

}

- (void)fetchSuggestedActionsForStartWorkoutAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__LNClientConnection_fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke;
  v10[3] = &unk_24F0CB138;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchSuggestedActionsForStartWorkoutAction:completionHandler:", v7, v10);

}

- (void)fetchSuggestedFocusActionsForActionMetadata:(id)a3 suggestionContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __102__LNClientConnection_fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke;
  v13[3] = &unk_24F0CB138;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "fetchSuggestedFocusActionsForActionMetadata:suggestionContext:completionHandler:", v10, v9, v13);

}

- (void)fetchActionAppContextFromAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__LNClientConnection_fetchActionAppContextFromAction_completionHandler___block_invoke;
  v10[3] = &unk_24F0CB250;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchActionAppContextForAction:completionHandler:", v7, v10);

}

- (void)fetchActionForAutoShortcutPhrase:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__LNClientConnection_fetchActionForAutoShortcutPhrase_completionHandler___block_invoke;
  v10[3] = &unk_24F0CB2C8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchActionForAutoShortcutPhrase:completionHandler:", v7, v10);

}

- (void)fetchActionForAppShortcutIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__LNClientConnection_fetchActionForAppShortcutIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_24F0CB2F0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchActionForAppShortcutIdentifier:completionHandler:", v7, v10);

}

- (void)fetchStateForAppIntentIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__LNClientConnection_fetchStateForAppIntentIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_24F0CB228;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchStateForAppIntentIdentifiers:completionHandler:", v7, v10);

}

- (void)updateAppShortcutParametersWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__LNClientConnection_updateAppShortcutParametersWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F0CB340;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateAppShortcutParametersWithCompletionHandler:", v7);

}

- (void)fetchValueForPropertyWithIdentifier:(id)a3 entity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__LNClientConnection_fetchValueForPropertyWithIdentifier_entity_completionHandler___block_invoke;
  v13[3] = &unk_24F0CB2A0;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "fetchValueForPropertyWithIdentifier:entity:completionHandler:", v10, v9, v13);

}

- (void)fetchEntityURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__LNClientConnection_fetchEntityURL_completionHandler___block_invoke;
  v10[3] = &unk_24F0CB390;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchEntityURL:completionHandler:", v7, v10);

}

- (void)fetchURLForEnumWithIdentifier:(id)a3 caseIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __85__LNClientConnection_fetchURLForEnumWithIdentifier_caseIdentifier_completionHandler___block_invoke;
  v13[3] = &unk_24F0CB390;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "fetchURLForEnumWithIdentifier:caseIdentifier:completionHandler:", v10, v9, v13);

}

- (void)exportTransientEntities:(id)a3 withConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "hash"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __82__LNClientConnection_exportTransientEntities_withConfiguration_completionHandler___block_invoke;
  v16[3] = &unk_24F0CB2A0;
  v16[4] = self;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v11, "exportTransientEntities:withConfiguration:connectionIdentifier:completionHandler:", v10, v9, v14, v16);

}

- (void)getListenerEndpointForBundleIdentifier:(id)a3 action:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  _OWORD v27[2];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    -[LNClientConnection appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNClientConnection xpcConnection](self, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "auditToken");
    else
      memset(v27, 0, sizeof(v27));
    -[LNClientConnection xpcConnection](self, "xpcConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hash");
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke;
    v25[3] = &unk_24F0CB3B8;
    v25[4] = self;
    v26 = v10;
    objc_msgSend(v11, "fetchActionListenerEndpoint:auditToken:connectionIdentifier:completionHandler:", v9, v27, v18, v25);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE60118], "sharedProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke_3;
      v23[3] = &unk_24F0CB3E0;
      v24 = v10;
      objc_msgSend(v15, "provideListenerEndpointForBundleIdentifier:completionHandler:", v8, v23);
      v16 = v24;
    }
    else
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BE5FE78];
      v28 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The requested process is unable to mediate connection to %@"), v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 2300, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, 0, v22);

    }
  }

}

- (void)updateProperties:(id)a3 withQuery:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__LNClientConnection_updateProperties_withQuery_completionHandler___block_invoke;
  v13[3] = &unk_24F0CB340;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "updateProperties:withQuery:completionHandler:", v10, v9, v13);

}

- (void)updateConnectionContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  -[LNClientConnection appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNClientConnection xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__LNClientConnection_updateConnectionContext_completionHandler___block_invoke;
  v11[3] = &unk_24F0CB340;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "updateContextForConnection:context:completionHandler:", v9, v7, v11);

}

- (NSMapTable)performActionOperations
{
  return self->_performActionOperations;
}

- (LNConnectionListener)connectionListener
{
  return (LNConnectionListener *)objc_loadWeakRetained((id *)&self->_connectionListener);
}

void __64__LNClientConnection_updateConnectionContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__LNClientConnection_updateConnectionContext_completionHandler___block_invoke_2;
  v7[3] = &unk_24F0CB318;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __64__LNClientConnection_updateConnectionContext_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__LNClientConnection_updateProperties_withQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__LNClientConnection_updateProperties_withQuery_completionHandler___block_invoke_2;
  v7[3] = &unk_24F0CB318;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __67__LNClientConnection_updateProperties_withQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke_3(uint64_t a1, void *a2, _OWORD *a3, void *a4)
{
  id v7;
  id v8;
  __int128 v9;
  _OWORD v10[2];

  v7 = a2;
  v8 = a4;
  if (a3)
  {
    v9 = a3[1];
    v10[0] = *a3;
    v10[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE50], "if_dataWithAuditToken:", v10);
    a3 = (_OWORD *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "listenerEndpoint");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "auditTokenData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolvedAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *, _QWORD))(v2 + 16))(v2, v5, v3, v4, *(_QWORD *)(a1 + 40));

}

void __82__LNClientConnection_exportTransientEntities_withConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__LNClientConnection_exportTransientEntities_withConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __82__LNClientConnection_exportTransientEntities_withConfiguration_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __85__LNClientConnection_fetchURLForEnumWithIdentifier_caseIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__LNClientConnection_fetchURLForEnumWithIdentifier_caseIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __85__LNClientConnection_fetchURLForEnumWithIdentifier_caseIdentifier_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __55__LNClientConnection_fetchEntityURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__LNClientConnection_fetchEntityURL_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __55__LNClientConnection_fetchEntityURL_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __83__LNClientConnection_fetchValueForPropertyWithIdentifier_entity_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__LNClientConnection_fetchValueForPropertyWithIdentifier_entity_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __83__LNClientConnection_fetchValueForPropertyWithIdentifier_entity_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __71__LNClientConnection_updateAppShortcutParametersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__LNClientConnection_updateAppShortcutParametersWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_24F0CB318;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __71__LNClientConnection_updateAppShortcutParametersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __74__LNClientConnection_fetchStateForAppIntentIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__LNClientConnection_fetchStateForAppIntentIdentifiers_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __74__LNClientConnection_fetchStateForAppIntentIdentifiers_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __76__LNClientConnection_fetchActionForAppShortcutIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__LNClientConnection_fetchActionForAppShortcutIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __76__LNClientConnection_fetchActionForAppShortcutIdentifier_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __73__LNClientConnection_fetchActionForAutoShortcutPhrase_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__LNClientConnection_fetchActionForAutoShortcutPhrase_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __73__LNClientConnection_fetchActionForAutoShortcutPhrase_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __72__LNClientConnection_fetchActionAppContextFromAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__LNClientConnection_fetchActionAppContextFromAction_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __72__LNClientConnection_fetchActionAppContextFromAction_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __102__LNClientConnection_fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__LNClientConnection_fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __102__LNClientConnection_fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __83__LNClientConnection_fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__LNClientConnection_fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __83__LNClientConnection_fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __82__LNClientConnection_fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__LNClientConnection_fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __82__LNClientConnection_fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __73__LNClientConnection_fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__LNClientConnection_fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __73__LNClientConnection_fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __77__LNClientConnection_fetchActionOutputValueWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__LNClientConnection_fetchActionOutputValueWithIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __77__LNClientConnection_fetchActionOutputValueWithIdentifier_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke_2;
  v7[3] = &unk_24F0CB250;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "fetchOptionsDefaultValuesForAction:connectionIdentifier:completionHandler:", v4, v6, v7);

}

void __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke_3;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __99__LNClientConnection_fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__LNClientConnection_fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __99__LNClientConnection_fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __71__LNClientConnection_performAction_options_executor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__LNClientConnection_performAction_options_executor_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __71__LNClientConnection_performAction_options_executor_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __86__LNClientConnection_fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__LNClientConnection_fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __86__LNClientConnection_fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __89__LNClientConnection_performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__LNClientConnection_performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __89__LNClientConnection_performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __95__LNClientConnection_performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__LNClientConnection_performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __95__LNClientConnection_performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __83__LNClientConnection_performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__LNClientConnection_performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __83__LNClientConnection_performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __65__LNClientConnection_performConfigurableQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__LNClientConnection_performConfigurableQuery_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __65__LNClientConnection_performConfigurableQuery_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __61__LNClientConnection_performPropertyQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__LNClientConnection_performPropertyQuery_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__LNClientConnection_performPropertyQuery_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __60__LNClientConnection_fetchViewActionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__LNClientConnection_fetchViewActionsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __60__LNClientConnection_fetchViewActionsWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __76__LNClientConnection_fetchViewEntitiesWithInteractionIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__LNClientConnection_fetchViewEntitiesWithInteractionIDs_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __76__LNClientConnection_fetchViewEntitiesWithInteractionIDs_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __77__LNClientConnection_fetchDisplayRepresentationForActions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__LNClientConnection_fetchDisplayRepresentationForActions_completionHandler___block_invoke_2;
  block[3] = &unk_24F0CB368;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __77__LNClientConnection_fetchDisplayRepresentationForActions_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __51__LNClientConnection_removePerformActionOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "performActionOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  return objc_msgSend(*(id *)(a1 + 40), "setDelegate:", 0);
}

uint64_t __52__LNClientConnection_enqueuePerformActionOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "performActionOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "setDelegate:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "start");
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)currentAuditToken
{
  return +[LNAppContext currentAuditToken](LNAppContext, "currentAuditToken");
}

+ (void)performWithoutTimeout:(id)a3
{
  void (**v3)(_QWORD);

  v3 = (void (**)(_QWORD))a3;
  +[LNAppContext cancelTimeout](LNAppContext, "cancelTimeout");
  v3[2](v3);

  +[LNAppContext extendTimeout](LNAppContext, "extendTimeout");
}

@end
