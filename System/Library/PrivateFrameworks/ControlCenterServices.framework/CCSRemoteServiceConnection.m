@implementation CCSRemoteServiceConnection

void __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 24);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_24D4609F8;
  v10[4] = v3;
  v11 = v4;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_15;
  v8[3] = &unk_24D460A48;
  v7 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "getEnabledStateOfModuleWithIdentifier:completionHandler:", v7, v8);

}

- (void)getEnabledStateOfModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *activity;
  _QWORD block[5];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCSRemoteServiceConnection.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[identifier length] > 0"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCSRemoteServiceConnection.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  activity = _os_activity_create(&dword_215C14000, "com.apple.ControlCenter.RemoteServiceConnection.getEnabledStateOfModule", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24D4609D0;
  block[4] = self;
  v15 = v7;
  v16 = v8;
  v9 = v8;
  v10 = v7;
  os_activity_apply(activity, block);

}

- (CCSRemoteServiceConnection)init
{
  CCSRemoteServiceConnection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *callOutQueue;
  uint64_t v9;
  NSXPCConnection *connection;
  NSXPCConnection *v11;
  void *v12;
  uint64_t v13;
  NSXPCConnection *v14;
  NSXPCConnection *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CCSRemoteServiceConnection;
  v2 = -[CCSRemoteServiceConnection init](&v19, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.ControlCenter.RemoteServiceConnection", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.ControlCenter.RemoteServiceConnection.callout", v6);
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.controlcenter.remoteservice"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v9;

    v11 = v2->_connection;
    CCSRemoteServiceServerInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v11, "setRemoteObjectInterface:", v12);

    v13 = MEMORY[0x24BDAC760];
    v14 = v2->_connection;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __34__CCSRemoteServiceConnection_init__block_invoke;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = v14;
    -[NSXPCConnection setInterruptionHandler:](v14, "setInterruptionHandler:", v18);
    v15 = v2->_connection;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __34__CCSRemoteServiceConnection_init__block_invoke_4;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = v14;
    -[NSXPCConnection setInvalidationHandler:](v15, "setInvalidationHandler:", v17);
    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

void __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 24);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_2;
  v11[3] = &unk_24D4609F8;
  v11[4] = v3;
  v12 = v4;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_30;
  v9[3] = &unk_24D460B88;
  v8 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v6, "setVisibility:forModuleWithIdentifier:completionHandler:", v7, v8, v9);

}

- (void)setVisibility:(BOOL)a3 forModuleWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *activity;
  _QWORD block[5];
  id v16;
  id v17;
  BOOL v18;

  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCSRemoteServiceConnection.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[identifier length] > 0"));

  }
  activity = _os_activity_create(&dword_215C14000, "com.apple.ControlCenter.RemoteServiceConnection.setVisibility", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24D460B10;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = a3;
  v11 = v10;
  v12 = v9;
  os_activity_apply(activity, block);

}

void __34__CCSRemoteServiceConnection_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_215C14000, v2, OS_LOG_TYPE_DEFAULT, "connection interrupted, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __34__CCSRemoteServiceConnection_init__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_215C14000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_24D4609D0;
  v8 = v4;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_3_cold_1();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_15(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_2_16;
  v5[3] = &unk_24D460A20;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_2_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)requestAvailableModuleIdentifiersWithCompletionHandler:(id)a3
{
  id v5;
  id v6;
  void *v7;
  NSObject *activity;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCSRemoteServiceConnection.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  activity = _os_activity_create(&dword_215C14000, "com.apple.ControlCenter.RemoteServiceConnection.requestAvailableModuleIdentifiersWithCompletionHandler", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke;
  block[3] = &unk_24D460A70;
  block[4] = self;
  v10 = v5;
  v6 = v5;
  os_activity_apply(activity, block);

}

void __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 24);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_24D460A98;
  v10[4] = v3;
  v11 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_18;
  v8[3] = &unk_24D460AE8;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v6, "requestAvailableModuleIdentifiersWithCompletionHandler:", v8);

}

void __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_24D460A70;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v2 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_3_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_2_19;
  block[3] = &unk_24D460AC0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_2_19(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)requestEnableModuleWithIdentifier:(id)a3 force:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *activity;
  _QWORD block[5];
  id v16;
  id v17;
  BOOL v18;

  v9 = a3;
  v10 = a5;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCSRemoteServiceConnection.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[identifier length] > 0"));

  }
  activity = _os_activity_create(&dword_215C14000, "com.apple.ControlCenter.RemoteServiceConnection.requestEnableModule", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke;
  block[3] = &unk_24D460B10;
  block[4] = self;
  v16 = v9;
  v18 = a4;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  os_activity_apply(activity, block);

}

void __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 24);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_2;
  v11[3] = &unk_24D460B38;
  v11[4] = v3;
  v12 = v4;
  v14 = *(_BYTE *)(a1 + 56);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_25;
  v9[3] = &unk_24D460B88;
  v8 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v6, "requestEnableModuleWithIdentifier:force:completionHandler:", v8, v7, v9);

}

void __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_3;
  v7[3] = &unk_24D460B10;
  v8 = v4;
  v9 = v3;
  v11 = *(_BYTE *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_3_cold_1();
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 40));
  return result;
}

void __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_25(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_2_26;
  block[3] = &unk_24D460B60;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_2_26(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)requestDisableModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *activity;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCSRemoteServiceConnection.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[identifier length] > 0"));

  }
  activity = _os_activity_create(&dword_215C14000, "com.apple.ControlCenter.RemoteServiceConnection.requestDisableModule", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24D4609D0;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  os_activity_apply(activity, block);

}

void __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 24);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_24D4609F8;
  v10[4] = v3;
  v11 = v4;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_28;
  v8[3] = &unk_24D460B88;
  v7 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "requestDisableModuleWithIdentifier:completionHandler:", v7, v8);

}

void __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_24D4609D0;
  v8 = v4;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_3_cold_1();
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 40));
  return result;
}

void __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_28(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_2_29;
  block[3] = &unk_24D460B60;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_2_29(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

void __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_24D4609D0;
  v8 = v4;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_3_cold_1();
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 40));
  return result;
}

void __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_30(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_2_31;
  block[3] = &unk_24D460B60;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_2_31(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *activity;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  activity = _os_activity_create(&dword_215C14000, "com.apple.ControlCenter.RemoteServiceConnection.presentModuleWithIdentifier", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke;
  block[3] = &unk_24D460BB0;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  os_activity_apply(activity, block);

}

void __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 24);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_2;
  v11[3] = &unk_24D460BD8;
  v11[4] = v3;
  v12 = v4;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_32;
  v9[3] = &unk_24D460B88;
  v7 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v6, "presentModuleWithIdentifier:options:completionHandler:", v7, v8, v9);

}

void __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_3;
  v7[3] = &unk_24D460BB0;
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_3_cold_1();
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 48));
  return result;
}

void __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_32(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_2_33;
  block[3] = &unk_24D460B60;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_2_33(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *activity;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity = _os_activity_create(&dword_215C14000, "com.apple.ControlCenter.RemoteServiceConnection.handleIconElementRequest", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke;
  block[3] = &unk_24D4609D0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  os_activity_apply(activity, block);

}

void __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 24);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_2;
  v10[3] = &unk_24D4609F8;
  v10[4] = v3;
  v11 = v4;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_34;
  v8[3] = &unk_24D460B88;
  v7 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "handleIconElementRequest:completionHandler:", v7, v8);

}

void __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_3;
  block[3] = &unk_24D4609D0;
  v8 = v4;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_3_cold_1(a1, v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_34(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_2_35;
  block[3] = &unk_24D460B60;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_2_35(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *activity;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  activity = _os_activity_create(&dword_215C14000, "com.apple.ControlCenter.RemoteServiceConnection.handleControlCenterOperationType", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke;
  block[3] = &unk_24D460C00;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v7 = v6;
  os_activity_apply(activity, block);

}

void __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v2 = MEMORY[0x24BDAC760];
  v3 = a1[4];
  v4 = (void *)a1[5];
  v5 = *(void **)(v3 + 24);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_2;
  v11[3] = &unk_24D460A98;
  v11[4] = v3;
  v12 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_36;
  v9[3] = &unk_24D460B88;
  v7 = (void *)a1[5];
  v8 = a1[6];
  v9[4] = a1[4];
  v10 = v7;
  objc_msgSend(v6, "handleControlCenterOperationType:completionHandler:", v8, v9);

}

void __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_3;
  v7[3] = &unk_24D460A70;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_3_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_36(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_2_37;
  block[3] = &unk_24D460B60;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_2_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)requestIconElementState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *activity;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity = _os_activity_create(&dword_215C14000, "com.apple.ControlCenter.RemoteServiceConnection.requestIconElementState", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke;
  block[3] = &unk_24D460C78;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  os_activity_apply(activity, block);

}

void __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_2;
  v9[3] = &unk_24D460A98;
  v9[4] = v2;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_38;
  v7[3] = &unk_24D460C50;
  v6 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "requestIconElementState:completionHandler:", v6, v7);

}

void __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_3;
  v7[3] = &unk_24D460A70;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_3_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_2_39;
  block[3] = &unk_24D460C28;
  v11 = v6;
  v12 = a2;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_2_39(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_215C14000, v0, v1, "Error getting enabled state of module with identifier='%{public}@', error='%{public}@'", v2);
  OUTLINED_FUNCTION_1();
}

void __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215C14000, a2, a3, "Error requesting list of module identifiers, error='%{public}@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_215C14000, v0, v1, "Error requesting enabling of module with identifier='%{public}@', error='%{public}@', force='%{public}@'", v2, v3, v4, v5, v6);
}

void __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_215C14000, v0, v1, "Error requesting disabling of module with identifier='%{public}@', error='%{public}@'", v2);
  OUTLINED_FUNCTION_1();
}

void __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_215C14000, v0, v1, "Error requesting support of module with identifier='%{public}@', error='%{public}@'", v2);
  OUTLINED_FUNCTION_1();
}

void __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_215C14000, v0, v1, "Error requesting presentation of module with identifier='%{public}@' options=%{public}@}, error='%{public}@'", v2, v3, v4, v5, v6);
}

void __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_1_0(&dword_215C14000, v4, v7, "Failed to handle iconElementRequest for request: %@ error=%@", (uint8_t *)&v8);

}

void __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215C14000, a2, a3, "Failed to handle CCSControlCenterOperationType error=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215C14000, a2, a3, "Failed to request CCSIconElementState for CCSIconElementRequest error=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
