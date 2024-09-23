@implementation CRKNonCatalystStudentDaemonProxy

- (CRKNonCatalystStudentDaemonProxy)init
{
  return -[CRKNonCatalystStudentDaemonProxy initWithCallbackQueue:](self, "initWithCallbackQueue:", MEMORY[0x24BDAC9B8]);
}

- (CRKNonCatalystStudentDaemonProxy)initWithCallbackQueue:(id)a3
{
  id v5;
  CRKNonCatalystStudentDaemonProxy *v6;
  CRKValidXPCConnectionProvider *v7;
  CRKValidXPCConnectionProvider *connectionProvider;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKNonCatalystStudentDaemonProxy;
  v6 = -[CRKNonCatalystStudentDaemonProxy init](&v10, sel_init);
  if (v6)
  {
    v7 = -[CRKValidXPCConnectionProvider initWithBuilder:]([CRKValidXPCConnectionProvider alloc], "initWithBuilder:", &__block_literal_global_57);
    connectionProvider = v6->_connectionProvider;
    v6->_connectionProvider = v7;

    objc_storeStrong((id *)&v6->_callbackQueue, a3);
  }

  return v6;
}

uint64_t __58__CRKNonCatalystStudentDaemonProxy_initWithCallbackQueue___block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDD1988], "crk_studentDaemonNonCatalystConnection");
}

- (id)setOfActiveRestrictionUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x3032000000;
  v18[2] = __Block_byref_object_copy_;
  v18[3] = __Block_byref_object_dispose_;
  v19 = 0;
  -[CRKNonCatalystStudentDaemonProxy connectionProvider](self, "connectionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __64__CRKNonCatalystStudentDaemonProxy_setOfActiveRestrictionUUIDs___block_invoke;
  v16[3] = &unk_24D9C8DA0;
  v16[4] = &v17;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __64__CRKNonCatalystStudentDaemonProxy_setOfActiveRestrictionUUIDs___block_invoke_2;
  v15[3] = &unk_24D9C8DC8;
  v15[4] = &v20;
  v15[5] = &v17;
  objc_msgSend(v8, "fetchSetOfActiveRestrictionUUIDsForClientType:completion:", v4, v15);

  v9 = (void *)v21[5];
  if (!v9)
  {
    if (_CRKLogGeneral_onceToken_15 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_15, &__block_literal_global_51);
    v10 = _CRKLogGeneral_logObj_15;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_15, OS_LOG_TYPE_ERROR))
      -[CRKNonCatalystStudentDaemonProxy setOfActiveRestrictionUUIDs:].cold.1((uint64_t)v18, v10);
    v11 = objc_opt_new();
    v12 = (void *)v21[5];
    v21[5] = v11;

    v9 = (void *)v21[5];
  }
  v13 = v9;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __64__CRKNonCatalystStudentDaemonProxy_setOfActiveRestrictionUUIDs___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64__CRKNonCatalystStudentDaemonProxy_setOfActiveRestrictionUUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)fetchConfigurationType:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__CRKNonCatalystStudentDaemonProxy_fetchConfigurationType___block_invoke;
  v6[3] = &unk_24D9C8DF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRKNonCatalystStudentDaemonProxy _fetchConfigurationType:](self, "_fetchConfigurationType:", v6);

}

void __59__CRKNonCatalystStudentDaemonProxy_fetchConfigurationType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = *(id *)(a1 + 32);
  v6 = a3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchConfigurationType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[CRKNonCatalystStudentDaemonProxy connectionProvider](self, "connectionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke;
  v13[3] = &unk_24D9C7DA0;
  v13[4] = self;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_3;
  v11[3] = &unk_24D9C8DF0;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "fetchConfigurationType:", v11);

}

void __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_2;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_4;
  block[3] = &unk_24D9C8E18;
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __60__CRKNonCatalystStudentDaemonProxy__fetchConfigurationType___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)setAdHocConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__CRKNonCatalystStudentDaemonProxy_setAdHocConfiguration_completion___block_invoke;
  v8[3] = &unk_24D9C7DA0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CRKNonCatalystStudentDaemonProxy _setAdHocConfiguration:completion:](self, "_setAdHocConfiguration:completion:", a3, v8);

}

void __69__CRKNonCatalystStudentDaemonProxy_setAdHocConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = *(id *)(a1 + 32);
  v5 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_setAdHocConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  -[CRKNonCatalystStudentDaemonProxy connectionProvider](self, "connectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke;
  v16[3] = &unk_24D9C7DA0;
  v16[4] = self;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_3;
  v14[3] = &unk_24D9C7DA0;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "setAdHocConfiguration:completion:", v7, v14);

}

void __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_2;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_4;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __70__CRKNonCatalystStudentDaemonProxy__setAdHocConfiguration_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchAdHocConfiguration:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__CRKNonCatalystStudentDaemonProxy_fetchAdHocConfiguration___block_invoke;
  v6[3] = &unk_24D9C8E40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRKNonCatalystStudentDaemonProxy _fetchAdHocConfiguration:](self, "_fetchAdHocConfiguration:", v6);

}

void __60__CRKNonCatalystStudentDaemonProxy_fetchAdHocConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;

  v6 = *(id *)(a1 + 32);
  v7 = a3;
  v8 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchAdHocConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[CRKNonCatalystStudentDaemonProxy connectionProvider](self, "connectionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke;
  v13[3] = &unk_24D9C7DA0;
  v13[4] = self;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_3;
  v11[3] = &unk_24D9C8E40;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "fetchAdHocConfiguration:", v11);

}

void __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_2;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_4;
  block[3] = &unk_24D9C7620;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__CRKNonCatalystStudentDaemonProxy__fetchAdHocConfiguration___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__CRKNonCatalystStudentDaemonProxy_setConfiguration_completion___block_invoke;
  v8[3] = &unk_24D9C7DA0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CRKNonCatalystStudentDaemonProxy _setConfiguration:completion:](self, "_setConfiguration:completion:", a3, v8);

}

void __64__CRKNonCatalystStudentDaemonProxy_setConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = *(id *)(a1 + 32);
  v5 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_setConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  -[CRKNonCatalystStudentDaemonProxy connectionProvider](self, "connectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke;
  v16[3] = &unk_24D9C7DA0;
  v16[4] = self;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_3;
  v14[3] = &unk_24D9C7DA0;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "setConfiguration:completion:", v7, v14);

}

void __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_2;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_4;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __65__CRKNonCatalystStudentDaemonProxy__setConfiguration_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchConfiguration:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__CRKNonCatalystStudentDaemonProxy_fetchConfiguration___block_invoke;
  v6[3] = &unk_24D9C8E40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRKNonCatalystStudentDaemonProxy _fetchConfiguration:](self, "_fetchConfiguration:", v6);

}

void __55__CRKNonCatalystStudentDaemonProxy_fetchConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;

  v6 = *(id *)(a1 + 32);
  v7 = a3;
  v8 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[CRKNonCatalystStudentDaemonProxy connectionProvider](self, "connectionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke;
  v13[3] = &unk_24D9C7DA0;
  v13[4] = self;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_3;
  v11[3] = &unk_24D9C8E40;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "fetchConfiguration:", v11);

}

void __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_2;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_4;
  block[3] = &unk_24D9C7620;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __56__CRKNonCatalystStudentDaemonProxy__fetchConfiguration___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setActiveStudentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__CRKNonCatalystStudentDaemonProxy_setActiveStudentIdentifier_completion___block_invoke;
  v8[3] = &unk_24D9C7DA0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CRKNonCatalystStudentDaemonProxy _setActiveStudentIdentifier:completion:](self, "_setActiveStudentIdentifier:completion:", a3, v8);

}

void __74__CRKNonCatalystStudentDaemonProxy_setActiveStudentIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = *(id *)(a1 + 32);
  v5 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_setActiveStudentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  -[CRKNonCatalystStudentDaemonProxy connectionProvider](self, "connectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke;
  v16[3] = &unk_24D9C7DA0;
  v16[4] = self;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_3;
  v14[3] = &unk_24D9C7DA0;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "setActiveStudentIdentifier:completion:", v7, v14);

}

void __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_2;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_4;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __75__CRKNonCatalystStudentDaemonProxy__setActiveStudentIdentifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)studentDidAuthenticate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__CRKNonCatalystStudentDaemonProxy_studentDidAuthenticate_completion___block_invoke;
  v8[3] = &unk_24D9C7DA0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CRKNonCatalystStudentDaemonProxy _studentDidAuthenticate:completion:](self, "_studentDidAuthenticate:completion:", a3, v8);

}

void __70__CRKNonCatalystStudentDaemonProxy_studentDidAuthenticate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = *(id *)(a1 + 32);
  v5 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_studentDidAuthenticate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  -[CRKNonCatalystStudentDaemonProxy connectionProvider](self, "connectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke;
  v16[3] = &unk_24D9C7DA0;
  v16[4] = self;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_3;
  v14[3] = &unk_24D9C7DA0;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "studentDidAuthenticate:completion:", v7, v14);

}

void __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_2;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_4;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __71__CRKNonCatalystStudentDaemonProxy__studentDidAuthenticate_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchResourceFromURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__CRKNonCatalystStudentDaemonProxy_fetchResourceFromURL_completion___block_invoke;
  v8[3] = &unk_24D9C8E68;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CRKNonCatalystStudentDaemonProxy _fetchResourceFromURL:completion:](self, "_fetchResourceFromURL:completion:", a3, v8);

}

void __68__CRKNonCatalystStudentDaemonProxy_fetchResourceFromURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;

  v6 = *(id *)(a1 + 32);
  v7 = a3;
  v8 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchResourceFromURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  -[CRKNonCatalystStudentDaemonProxy connectionProvider](self, "connectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke;
  v16[3] = &unk_24D9C7DA0;
  v16[4] = self;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_3;
  v14[3] = &unk_24D9C8E68;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "fetchResourceFromURL:completion:", v7, v14);

}

void __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_2;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_4;
  block[3] = &unk_24D9C7620;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __69__CRKNonCatalystStudentDaemonProxy__fetchResourceFromURL_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchSetOfActiveRestrictionUUIDsForClientType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __93__CRKNonCatalystStudentDaemonProxy_fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke;
  v8[3] = &unk_24D9C8E90;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CRKNonCatalystStudentDaemonProxy _fetchSetOfActiveRestrictionUUIDsForClientType:completion:](self, "_fetchSetOfActiveRestrictionUUIDsForClientType:completion:", a3, v8);

}

void __93__CRKNonCatalystStudentDaemonProxy_fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;

  v6 = *(id *)(a1 + 32);
  v7 = a3;
  v8 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchSetOfActiveRestrictionUUIDsForClientType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = a3;
  -[CRKNonCatalystStudentDaemonProxy connectionProvider](self, "connectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke;
  v16[3] = &unk_24D9C7DA0;
  v16[4] = self;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_3;
  v14[3] = &unk_24D9C8E90;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "fetchSetOfActiveRestrictionUUIDsForClientType:completion:", v7, v14);

}

void __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_2;
  v7[3] = &unk_24D9C6E88;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_4;
  block[3] = &unk_24D9C7620;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __94__CRKNonCatalystStudentDaemonProxy__fetchSetOfActiveRestrictionUUIDsForClientType_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (CRKValidXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
}

- (void)setOfActiveRestrictionUUIDs:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch setOfActiveRestrictionUUIDs: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
