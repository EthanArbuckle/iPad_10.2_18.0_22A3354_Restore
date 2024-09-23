@implementation DCBiometricStoreClient

- (DCBiometricStoreClient)init
{
  NSObject *v3;
  DCBiometricStoreClient *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  DC_LOG_CLIENT_1();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient init].cold.2();

  v18.receiver = self;
  v18.super_class = (Class)DCBiometricStoreClient;
  v4 = -[DCBiometricStoreClient init](&v18, sel_init);
  if (v4)
  {
    DC_LOG_CLIENT_1();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[DCBiometricStoreClient init].cold.1(v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.idcredd.biometrics.xpc"), 4096);
    -[DCBiometricStoreClient setServerConnection:](v4, "setServerConnection:", v6);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FD368);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCBiometricStoreClient serverConnection](v4, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v7);

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCBiometricStoreClient serverConnection](v4, "serverConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_globalAuthACLTemplateUUIDsWithCompletion_, 0, 1);

    -[DCBiometricStoreClient serverConnection](v4, "serverConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteObjectInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_setModifiedGlobalAuthACL_externalizedLAContext_completion_, 0, 1);

    -[DCBiometricStoreClient serverConnection](v4, "serverConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activate");

  }
  return v4;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient dealloc called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)bioBindingUnboundACL:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient bioBindingUnboundACL:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2;
  v10[3] = &unk_24C3060A0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "bioBindingUnboundACL:", v10);

}

uint64_t __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_3();
  }
  else
  {
    if (v8)
      __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_2();

    DC_LOG_MILESTONE_LOG();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)passcodeBindingUnboundACL:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient passcodeBindingUnboundACL:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2;
  v10[3] = &unk_24C3060A0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "passcodeBindingUnboundACL:", v10);

}

uint64_t __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_3();
  }
  else
  {
    if (v8)
      __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_2();

    DC_LOG_MILESTONE_LOG();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setGlobalAuthACL:(id)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a3;
  DC_LOG_CLIENT_1();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient setGlobalAuthACL:ofType:completion:].cold.1();

  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke;
  v13[3] = &unk_24C306050;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "setGlobalAuthACL:ofType:completion:", v9, a4, v13);

}

void __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_1();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_3();
  }
  else
  {
    if (v5)
      __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_2();

    DC_LOG_MILESTONE_LOG();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setModifiedGlobalAuthACL:(id)a3 externalizedLAContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  DC_LOG_CLIENT_1();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient setModifiedGlobalAuthACL:externalizedLAContext:completion:].cold.1();

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke;
  v18[3] = &unk_24C306078;
  v13 = v8;
  v19 = v13;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2;
  v16[3] = &unk_24C3060C8;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "setModifiedGlobalAuthACL:externalizedLAContext:completion:", v10, v9, v16);

}

uint64_t __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_3();
  }
  else
  {
    if (v8)
      __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_2();

    DC_LOG_MILESTONE_LOG();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)globalAuthACLWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient globalAuthACLWithCompletion:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2;
  v10[3] = &unk_24C306638;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "globalAuthACLWithCompletion:", v10);

}

uint64_t __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_3();
  }
  else
  {
    if (v8)
      __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_2();

    DC_LOG_MILESTONE_LOG();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient deleteGlobalAuthACLWithCompletion:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2;
  v10[3] = &unk_24C306528;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "deleteGlobalAuthACLWithCompletion:", v10);

}

uint64_t __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
      __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_3();
  }
  else
  {
    if (v6)
      __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_2();

    DC_LOG_MILESTONE_LOG();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient globalAuthACLTemplateUUIDsWithCompletion:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2;
  v10[3] = &unk_24C306660;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "globalAuthACLTemplateUUIDsWithCompletion:", v10);

}

uint64_t __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;

  v6 = a4;
  v7 = a2;
  DC_LOG_CLIENT_1();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v9)
      __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_3();
  }
  else
  {
    if (v9)
      __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_2();

    DC_LOG_MILESTONE_LOG();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient nonceForAuthorizationTokenWithCompletion:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2;
  v10[3] = &unk_24C306688;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "nonceForAuthorizationTokenWithCompletion:", v10);

}

uint64_t __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_3();
  }
  else
  {
    if (v8)
      __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_2();

    DC_LOG_MILESTONE_LOG();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  DC_LOG_CLIENT_1();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient prearmCredentialWithAuthorizationToken:completion:].cold.1();

  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke;
  v11[3] = &unk_24C306050;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "prearmCredentialWithAuthorizationToken:completion:", v7, v11);

}

void __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_1();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_3();
  }
  else
  {
    if (v5)
      __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_2();

    DC_LOG_MILESTONE_LOG();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  DC_LOG_CLIENT_1();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient establishPrearmTrustV2:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2;
  v13[3] = &unk_24C3066B0;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "establishPrearmTrustV2:completion:", v7, v13);

}

uint64_t __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_3();
  }
  else
  {
    if (v8)
      __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_2();

    DC_LOG_MILESTONE_LOG();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)revokeCredentialAuthorizationToken:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient revokeCredentialAuthorizationToken:].cold.1();

  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke;
  v8[3] = &unk_24C306050;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "revokeCredentialAuthorizationToken:", v8);

}

void __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_1();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_3();
  }
  else
  {
    if (v5)
      __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_2();

    DC_LOG_MILESTONE_LOG();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)generatePhoneTokenWithNonce:(id)a3 keyBlob:(id)a4 pairingID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  DC_LOG_CLIENT_1();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient generatePhoneTokenWithNonce:keyBlob:pairingID:completion:].cold.1();

  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke;
  v21[3] = &unk_24C306078;
  v16 = v10;
  v22 = v16;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2;
  v19[3] = &unk_24C3066D8;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "generatePhoneTokenWithNonce:keyBlob:pairingID:completion:", v13, v12, v11, v19);

}

uint64_t __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_3();
  }
  else
  {
    if (v8)
      __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_2();

    DC_LOG_MILESTONE_LOG();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)generatePrearmTrustCertificateWithNonce:(id)a3 pairingID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  DC_LOG_CLIENT_1();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient generatePrearmTrustCertificateWithNonce:pairingID:completion:].cold.1();

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke;
  v18[3] = &unk_24C306078;
  v13 = v8;
  v19 = v13;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2;
  v16[3] = &unk_24C306700;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "generatePrearmTrustCertificateWithNonce:pairingID:completion:", v10, v9, v16);

}

uint64_t __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)migratePrearmTrustBlob:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  DC_LOG_CLIENT_1();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient migratePrearmTrustBlob:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2;
  v13[3] = &unk_24C3060A0;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "migratePrearmTrustBlob:completion:", v7, v13);

}

uint64_t __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)credentialAuthenticationTokenStatus:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient credentialAuthenticationTokenStatus:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2;
  v10[3] = &unk_24C306728;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "credentialAuthenticationTokenStatus:", v10);

}

uint64_t __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
      __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2_cold_2();
  }
  else if (v6)
  {
    __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getCASDCertificate:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient getCASDCertificate:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __45__DCBiometricStoreClient_getCASDCertificate___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2;
  v10[3] = &unk_24C3060A0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "getCASDCertificate:", v10);

}

uint64_t __45__DCBiometricStoreClient_getCASDCertificate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getGlobalProgenitorKeyAttestation:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient getGlobalProgenitorKeyAttestation:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2;
  v10[3] = &unk_24C3066B0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "getGlobalProgenitorKeyAttestation:", v10);

}

uint64_t __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getGlobalThirdPartyProgenitorKeyAttestation:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient getGlobalThirdPartyProgenitorKeyAttestation:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2;
  v10[3] = &unk_24C3066B0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "getGlobalThirdPartyProgenitorKeyAttestation:", v10);

}

uint64_t __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)boundAppletPresentmentACL:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient boundAppletPresentmentACL:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2;
  v10[3] = &unk_24C3060A0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "boundAppletPresentmentACL:", v10);

}

uint64_t __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)refreshProgenitorKeyDesignationsWithSessionHandoffToken:(id)a3 onlyIfNeeded:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  DC_LOG_CLIENT_1();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient refreshProgenitorKeyDesignationsWithSessionHandoffToken:onlyIfNeeded:completion:].cold.1();

  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke;
  v17[3] = &unk_24C306078;
  v12 = v8;
  v18 = v12;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2;
  v15[3] = &unk_24C306050;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "refreshProgenitorKeyDesignationsWithSessionHandoffToken:onlyIfNeeded:completion:", v9, v5, v15);

}

uint64_t __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_1();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2_cold_2();
  }
  else if (v5)
  {
    __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)clearProgenitorKeyDesignationsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  DC_LOG_CLIENT_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCBiometricStoreClient clearProgenitorKeyDesignationsWithCompletion:].cold.1();

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke;
  v12[3] = &unk_24C306078;
  v7 = v4;
  v13 = v7;
  -[DCBiometricStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2;
  v10[3] = &unk_24C306050;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "clearProgenitorKeyDesignationsWithCompletion:", v10);

}

uint64_t __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_1();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2_cold_2();
  }
  else if (v5)
  {
    __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient invalidate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)createDaemonDisconnectedError
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DCBiometricStore"), -5001, 0);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[DCBiometricStoreClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__DCBiometricStoreClient_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_24C306050;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __60__DCBiometricStoreClient_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  DC_LOG_CLIENT_1();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__DCBiometricStoreClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "createDaemonDisconnectedError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient init called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)bioBindingUnboundACL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient bioBindingUnboundACL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient bioBindingUnboundACL returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__DCBiometricStoreClient_bioBindingUnboundACL___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient bioBindingUnboundACL returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)passcodeBindingUnboundACL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient passcodeBindingUnboundACL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient passcodeBindingUnboundACL returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__DCBiometricStoreClient_passcodeBindingUnboundACL___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient passcodeBindingUnboundACL returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setGlobalAuthACL:ofType:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient setGlobalAuthACL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient setGlobalAuthACL returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__DCBiometricStoreClient_setGlobalAuthACL_ofType_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient setGlobalAuthACL returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setModifiedGlobalAuthACL:externalizedLAContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient setModifiedGlobalAuthACL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient setModifiedGlobalAuthACL returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__DCBiometricStoreClient_setModifiedGlobalAuthACL_externalizedLAContext_completion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient setModifiedGlobalAuthACL returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)globalAuthACLWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient globalAuthACLWithCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient globalAuthACLWithCompletion returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__DCBiometricStoreClient_globalAuthACLWithCompletion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient globalAuthACLWithCompletion returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)deleteGlobalAuthACLWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient deleteGlobalAuthACLWithCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient deleteGlobalAuthACLWithCompletion returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__DCBiometricStoreClient_deleteGlobalAuthACLWithCompletion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient deleteGlobalAuthACLWithCompletion returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)globalAuthACLTemplateUUIDsWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient globalAuthACLTemplateUUIDsWithCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient globalAuthACLTemplateUUIDsWithCompletion returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__DCBiometricStoreClient_globalAuthACLTemplateUUIDsWithCompletion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient globalAuthACLTemplateUUIDsWithCompletion returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)nonceForAuthorizationTokenWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient nonceForAuthorizationTokenWithCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient nonceForAuthorizationTokenWithCompletion returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__DCBiometricStoreClient_nonceForAuthorizationTokenWithCompletion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient nonceForAuthorizationTokenWithCompletion returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)prearmCredentialWithAuthorizationToken:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient prearmCredentialWithAuthorizationToken", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient prearmCredentialWithAuthorizationToken returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__DCBiometricStoreClient_prearmCredentialWithAuthorizationToken_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient prearmCredentialWithAuthorizationToken returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)establishPrearmTrustV2:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient establishPrearmTrustV2", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient establishPrearmTrustV2 returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__DCBiometricStoreClient_establishPrearmTrustV2_completion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient establishPrearmTrustV2 returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)revokeCredentialAuthorizationToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient revokeCredentialAuthorizationToken", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient revokeCredentialAuthorizationToken returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__DCBiometricStoreClient_revokeCredentialAuthorizationToken___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient revokeCredentialAuthorizationToken returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)generatePhoneTokenWithNonce:keyBlob:pairingID:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient generatePhoneTokenWithNonce", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "(%@) %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient generatePhoneTokenWithNonce returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__DCBiometricStoreClient_generatePhoneTokenWithNonce_keyBlob_pairingID_completion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient generatePhoneTokenWithNonce returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)generatePrearmTrustCertificateWithNonce:pairingID:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient generatePrearmTrustCertificateForWatchWithNonce", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient generatePrearmTrustCertificateForWatchWithNonce returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __87__DCBiometricStoreClient_generatePrearmTrustCertificateWithNonce_pairingID_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient generatePrearmTrustCertificateForWatchWithNonce returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)migratePrearmTrustBlob:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient migratePrearmTrustBlob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient migratePrearmTrustBlob returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__DCBiometricStoreClient_migratePrearmTrustBlob_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient migratePrearmTrustBlob returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)credentialAuthenticationTokenStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient credentialAuthenticationTokenStatus", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient credentialAuthenticationTokenStatus returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__DCBiometricStoreClient_credentialAuthenticationTokenStatus___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient credentialAuthenticationTokenStatus returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)getCASDCertificate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "%s %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "%s %s returned successfully", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __45__DCBiometricStoreClient_getCASDCertificate___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_20A40D000, v0, v1, "%s %s returned with error %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

- (void)getGlobalProgenitorKeyAttestation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "%s %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "%s %s returned successfully", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __60__DCBiometricStoreClient_getGlobalProgenitorKeyAttestation___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_20A40D000, v0, v1, "%s %s returned with error %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

- (void)getGlobalThirdPartyProgenitorKeyAttestation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "%s %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "%s %s returned successfully", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __70__DCBiometricStoreClient_getGlobalThirdPartyProgenitorKeyAttestation___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_20A40D000, v0, v1, "%s %s returned with error %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

- (void)boundAppletPresentmentACL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "%s %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_20A40D000, v0, v1, "%s %s returned successfully", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __52__DCBiometricStoreClient_boundAppletPresentmentACL___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_20A40D000, v0, v1, "%s %s returned with error %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

- (void)refreshProgenitorKeyDesignationsWithSessionHandoffToken:onlyIfNeeded:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient refreshProgenitorKeyDesignations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient refreshProgenitorKeyDesignations returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __106__DCBiometricStoreClient_refreshProgenitorKeyDesignationsWithSessionHandoffToken_onlyIfNeeded_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient refreshProgenitorKeyDesignations returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)clearProgenitorKeyDesignationsWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient clearProgenitorKeyDesignations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCBiometricStoreClient clearProgenitorKeyDesignations returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__DCBiometricStoreClient_clearProgenitorKeyDesignationsWithCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCBiometricStoreClient clearProgenitorKeyDesignations returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __60__DCBiometricStoreClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_20A40D000, v0, OS_LOG_TYPE_ERROR, "DCBiometricStoreClient remote object proxy error: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end
