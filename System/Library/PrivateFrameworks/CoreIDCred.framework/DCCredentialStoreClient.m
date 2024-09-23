@implementation DCCredentialStoreClient

- (DCCredentialStoreClient)init
{
  NSObject *v3;
  DCCredentialStoreClient *v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_super v65;

  DC_LOG_CLIENT_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient init].cold.2();

  v65.receiver = self;
  v65.super_class = (Class)DCCredentialStoreClient;
  v4 = -[DCCredentialStoreClient init](&v65, sel_init);
  if (v4)
  {
    DC_LOG_CLIENT_0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[DCCredentialStoreClient init].cold.1(v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.idcredd.storage.xpc"), 4096);
    -[DCCredentialStoreClient setServerConnection:](v4, "setServerConnection:", v6);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FCCB8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v7);

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_payloadsOfCredential_completion_, 0, 1);

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "remoteObjectInterface");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_elementsOfCredential_elementIdentifiers_authData_completion_, 0, 1);

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "remoteObjectInterface");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_allElementsOfCredential_authData_completion_, 0, 1);

    v26 = (void *)MEMORY[0x24BDBCF20];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "remoteObjectInterface");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_generateKeySigningKeyForCredential_completion_, 0, 1);

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "remoteObjectInterface");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_generateDeviceEncryptionKeyForCredential_completion_, 0, 1);

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "remoteObjectInterface");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_generatePresentmentKeyForCredential_completion_, 0, 1);

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "remoteObjectInterface");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_generatePresentmentKeysForCredential_numKeys_completion_, 0, 1);

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "remoteObjectInterface");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion_, 0, 1);

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "remoteObjectInterface");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_createAccountKeySigningKeyForAccountKeyIdentifier_completion_, 0, 1);

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "remoteObjectInterface");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion_, 0, 1);

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "remoteObjectInterface");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion_, 0, 1);

    v48 = (void *)MEMORY[0x24BDBCF20];
    v49 = objc_opt_class();
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, v50, v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "remoteObjectInterface");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setClasses:forSelector:argumentIndex:ofReply:", v52, sel_occupiedLegacySEKeySlotsWithCompletion_, 0, 1);

    v55 = (void *)MEMORY[0x24BDBCF20];
    v56 = objc_opt_class();
    v57 = objc_opt_class();
    v58 = objc_opt_class();
    v59 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, v57, v58, v59, objc_opt_class(), 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "remoteObjectInterface");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setClasses:forSelector:argumentIndex:ofReply:", v60, sel_keyInfoForCredential_completion_, 0, 1);

    -[DCCredentialStoreClient serverConnection](v4, "serverConnection");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "activate");

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
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient dealloc called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureWithPartitions:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient configureWithPartitions:completion:].cold.1();

  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke;
  v11[3] = &unk_24C306050;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "configureWithPartitions:completion:", v7, v11);

}

void __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke_cold_2();
  }
  else if (v5)
  {
    __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5
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
  DC_LOG_CLIENT_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient createCredentialInPartition:options:completion:].cold.1();

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke;
  v18[3] = &unk_24C306078;
  v13 = v8;
  v19 = v13;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2;
  v16[3] = &unk_24C3064D8;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "createCredentialInPartition:options:completion:", v10, v9, v16);

}

uint64_t __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)generateKeySigningKeyForCredential:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient generateKeySigningKeyForCredential:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2;
  v13[3] = &unk_24C306500;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "generateKeySigningKeyForCredential:completion:", v7, v13);

}

uint64_t __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient isAccountKeySigningKeyAvailableForAccountKeyIdentifier:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2;
  v13[3] = &unk_24C306528;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "isAccountKeySigningKeyAvailableForAccountKeyIdentifier:completion:", v7, v13);

}

uint64_t __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;

  v4 = a3;
  DC_LOG_CLIENT_0();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
      __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2_cold_2();
  }
  else if (v6)
  {
    __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)createAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient createAccountKeySigningKeyForAccountKeyIdentifier:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2;
  v13[3] = &unk_24C306500;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "createAccountKeySigningKeyForAccountKeyIdentifier:completion:", v7, v13);

}

uint64_t __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)deleteAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient deleteAccountKeySigningKeyForAccountKeyIdentifier:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2;
  v13[3] = &unk_24C306050;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "deleteAccountKeySigningKeyForAccountKeyIdentifier:completion:", v7, v13);

}

uint64_t __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2();
  }
  else if (v5)
  {
    __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)retrieveAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient retrieveAccountKeySigningKeyForAccountKeyIdentifier:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2;
  v13[3] = &unk_24C306500;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "retrieveAccountKeySigningKeyForAccountKeyIdentifier:completion:", v7, v13);

}

uint64_t __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)generateDeviceEncryptionKeyForCredential:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient generateDeviceEncryptionKeyForCredential:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2;
  v13[3] = &unk_24C306500;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "generateDeviceEncryptionKeyForCredential:completion:", v7, v13);

}

uint64_t __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)generateAccountKeyAuthorizationForCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke;
  v17[3] = &unk_24C306078;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2;
  v15[3] = &unk_24C306550;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "generateAccountKeyAuthorizationForCredential:accountKeyIdentifier:completion:", v12, v11, v15);

}

uint64_t __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  DC_LOG_CLIENT_0();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v11)
      __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2_cold_2();
  }
  else if (v11)
  {
    __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)generatePresentmentKeyForCredential:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient generatePresentmentKeyForCredential:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2;
  v13[3] = &unk_24C306500;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "generatePresentmentKeyForCredential:completion:", v7, v13);

}

uint64_t __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5
{
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

  v8 = a5;
  v9 = a3;
  DC_LOG_CLIENT_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient generatePresentmentKeysForCredential:numKeys:completion:].cold.1();

  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke;
  v17[3] = &unk_24C306078;
  v12 = v8;
  v18 = v12;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2;
  v15[3] = &unk_24C3060C8;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "generatePresentmentKeysForCredential:numKeys:completion:", v9, a4, v15);

}

uint64_t __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)authorizeDeviceKeySigningKeyOfCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5
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
  DC_LOG_CLIENT_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient authorizeDeviceKeySigningKeyOfCredential:accountKeyIdentifier:completion:].cold.1();

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke;
  v18[3] = &unk_24C306078;
  v13 = v8;
  v19 = v13;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2;
  v16[3] = &unk_24C3060A0;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "authorizeDeviceKeySigningKeyOfCredential:accountKeyIdentifier:completion:", v10, v9, v16);

}

uint64_t __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)authorizeRemoteKeySigningKeyWithCredential:(id)a3 remoteKey:(id)a4 completion:(id)a5
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
  DC_LOG_CLIENT_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient authorizeRemoteKeySigningKeyWithCredential:remoteKey:completion:].cold.1();

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke;
  v18[3] = &unk_24C306078;
  v13 = v8;
  v19 = v13;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2;
  v16[3] = &unk_24C3060A0;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "authorizeRemoteKeySigningKeyWithCredential:remoteKey:completion:", v10, v9, v16);

}

uint64_t __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)associateExternalPresentmentKeyWithCredential:(id)a3 publicKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  DC_LOG_CLIENT_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient associateExternalPresentmentKeyWithCredential:publicKeyIdentifier:completion:].cold.1();

  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke;
  v14[3] = &unk_24C306050;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "associateExternalPresentmentKeyWithCredential:publicKeyIdentifier:completion:", v10, v9, v14);

}

void __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_2();
  }
  else if (v5)
  {
    __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)credentialIdentifierForPublicKeyIdentifier:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient credentialIdentifierForPublicKeyIdentifier:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2;
  v13[3] = &unk_24C3064D8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "credentialIdentifierForPublicKeyIdentifier:completion:", v7, v13);

}

uint64_t __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)replacePayloadOfCredential:(id)a3 withPayload:(id)a4 format:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  DC_LOG_CLIENT_0();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient replacePayloadOfCredential:withPayload:format:completion:].cold.1();

  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke;
  v16[3] = &unk_24C306050;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "replacePayloadOfCredential:withPayload:format:completion:", v12, v11, a5, v16);

}

void __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_2();
  }
  else if (v5)
  {
    __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient credentialIdentifiersInPartitions:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2;
  v13[3] = &unk_24C306578;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "credentialIdentifiersInPartitions:completion:", v7, v13);

}

uint64_t __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 completion:(id)a5
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
  DC_LOG_CLIENT_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient credentialIdentifiersInPartitions:docType:completion:].cold.1();

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke;
  v18[3] = &unk_24C306078;
  v13 = v8;
  v19 = v13;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2;
  v16[3] = &unk_24C306578;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "credentialIdentifiersInPartitions:docType:completion:", v10, v9, v16);

}

uint64_t __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 region:(id)a5 completion:(id)a6
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

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  DC_LOG_CLIENT_0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient credentialIdentifiersInPartitions:docType:region:completion:].cold.1();

  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke;
  v21[3] = &unk_24C306078;
  v16 = v12;
  v22 = v16;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2;
  v19[3] = &unk_24C306578;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "credentialIdentifiersInPartitions:docType:region:completion:", v13, v10, v11, v19);

}

uint64_t __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)activeRegionsInPartitions:(id)a3 docType:(id)a4 completion:(id)a5
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

  v8 = a4;
  v9 = a5;
  v10 = a3;
  DC_LOG_CLIENT_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient activeRegionsInPartitions:docType:completion:].cold.1();

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke;
  v18[3] = &unk_24C306078;
  v13 = v9;
  v19 = v13;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2;
  v16[3] = &unk_24C3065A0;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "activeRegionsInPartitions:docType:completion:", v10, v8, v16);

}

uint64_t __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)deleteCredential:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient deleteCredential:completion:].cold.1();

  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke;
  v11[3] = &unk_24C306050;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "deleteCredential:completion:", v7, v11);

}

void __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke_cold_2();
  }
  else if (v5)
  {
    __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)propertiesOfCredential:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient propertiesOfCredential:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2;
  v13[3] = &unk_24C3065C8;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "propertiesOfCredential:completion:", v7, v13);

}

uint64_t __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "code");
    DC_LOG_CLIENT_0();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8 == -5015)
    {
      if (v10)
        __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_2();
    }
    else if (v10)
    {
      __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_3();
    }
  }
  else
  {
    DC_LOG_CLIENT_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setStateOfCredential:(id)a3 to:(unint64_t)a4 completion:(id)a5
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
  DC_LOG_CLIENT_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient setStateOfCredential:to:completion:].cold.1();

  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke;
  v13[3] = &unk_24C306050;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "setStateOfCredential:to:completion:", v9, a4, v13);

}

void __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke_cold_2();
  }
  else if (v5)
  {
    __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)payloadAuthACLForCredential:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient payloadAuthACLForCredential:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2;
  v13[3] = &unk_24C3060A0;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "payloadAuthACLForCredential:completion:", v7, v13);

}

uint64_t __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 authData:(id)a5 completion:(id)a6
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
  DC_LOG_CLIENT_0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient elementsOfCredential:elementIdentifiers:authData:completion:].cold.1();

  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke;
  v21[3] = &unk_24C306078;
  v16 = v10;
  v22 = v16;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2;
  v19[3] = &unk_24C306578;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "elementsOfCredential:elementIdentifiers:authData:completion:", v13, v12, v11, v19);

}

uint64_t __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)checkCompletenessOfCredential:(id)a3 completion:(id)a4
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
  DC_LOG_CLIENT_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStoreClient checkCompletenessOfCredential:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke;
  v15[3] = &unk_24C306078;
  v10 = v6;
  v16 = v10;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2;
  v13[3] = &unk_24C3065F0;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "checkCompletenessOfCredential:completion:", v7, v13);

}

uint64_t __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;

  v4 = a3;
  DC_LOG_CLIENT_0();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
      __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2_cold_2();
  }
  else if (v6)
  {
    __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2_cold_1();
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
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient invalidate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)payloadsOfCredential:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke;
  v14[3] = &unk_24C306078;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2;
  v12[3] = &unk_24C3060C8;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "payloadsOfCredential:completion:", v9, v12);

}

uint64_t __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)allElementsOfCredential:(id)a3 authData:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke;
  v17[3] = &unk_24C306078;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2;
  v15[3] = &unk_24C306578;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "allElementsOfCredential:authData:completion:", v12, v11, v15);

}

uint64_t __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)occupiedLegacySEKeySlotsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke;
  v11[3] = &unk_24C306078;
  v6 = v4;
  v12 = v6;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2;
  v9[3] = &unk_24C3060C8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "occupiedLegacySEKeySlotsWithCompletion:", v9);

}

uint64_t __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)eraseLegacySEKeySlot:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke;
  v9[3] = &unk_24C306050;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "eraseLegacySEKeySlot:completion:", a3, v9);

}

void __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke_cold_2();
  }
  else if (v5)
  {
    __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)clearPresentmentKeyUsageForCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke;
  v10[3] = &unk_24C306050;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "clearPresentmentKeyUsageForCredential:completion:", v7, v10);

}

void __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_2();
  }
  else if (v5)
  {
    __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)keyInfoForCredential:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke;
  v14[3] = &unk_24C306078;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[DCCredentialStoreClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2;
  v12[3] = &unk_24C3060C8;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "keyInfoForCredential:completion:", v9, v12);

}

uint64_t __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = a2;
  DC_LOG_CLIENT_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)createDaemonDisconnectedError
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DCCredentialStore"), -5001, 0);
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
  -[DCCredentialStoreClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__DCCredentialStoreClient_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_24C306050;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __61__DCCredentialStoreClient_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  DC_LOG_CLIENT_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__DCCredentialStoreClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1();

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
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient init called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureWithPartitions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient configure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient configureWithPartitions returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__DCCredentialStoreClient_configureWithPartitions_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient configureWithPartitions returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)createCredentialInPartition:options:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient createCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient createCredentialInPartition returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__DCCredentialStoreClient_createCredentialInPartition_options_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient createCredentialInPartition returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)generateKeySigningKeyForCredential:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generateKeySigningKeyForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generateKeySigningKeyForCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__DCCredentialStoreClient_generateKeySigningKeyForCredential_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generateKeySigningKeyForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient isAccountKeySigningKeyAvailableForAccountKeyIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient isAccountKeySigningKeyAvailableForAccountKeyIdentifier returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __93__DCCredentialStoreClient_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient isAccountKeySigningKeyAvailableForAccountKeyIdentifier returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)createAccountKeySigningKeyForAccountKeyIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient createAccountKeySigningKeyForLabel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient createAccountKeySigningKeyForAccountKeyIdentifier returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __88__DCCredentialStoreClient_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient createAccountKeySigningKeyForAccountKeyIdentifier returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)deleteAccountKeySigningKeyForAccountKeyIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient deleteAccountKeySigningKeyForAccountKeyIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient deleteAccountKeySigningKeyForAccountKeyIdentifier returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __88__DCCredentialStoreClient_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient deleteAccountKeySigningKeyForAccountKeyIdentifier returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)retrieveAccountKeySigningKeyForAccountKeyIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient retrieveAccountKeySigningKeyForAccountKeyIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient retrieveAccountKeySigningKeyForAccountKeyIdentifier returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __90__DCCredentialStoreClient_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient retrieveAccountKeySigningKeyForAccountKeyIdentifier returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)generateDeviceEncryptionKeyForCredential:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generateDeviceEncryptionKeyForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generateDeviceEncryptionKeyForCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __79__DCCredentialStoreClient_generateDeviceEncryptionKeyForCredential_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generateDeviceEncryptionKeyForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generateAccountKeyAuthorizationForCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __104__DCCredentialStoreClient_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generateAccountKeyAuthorizationForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)generatePresentmentKeyForCredential:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generatePresentmentKeyForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generatePresentmentKeyForCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__DCCredentialStoreClient_generatePresentmentKeyForCredential_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generatePresentmentKeyForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)generatePresentmentKeysForCredential:numKeys:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generatePresentmentKeysForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generatePresentmentKeysForCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__DCCredentialStoreClient_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient generatePresentmentKeysForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)authorizeDeviceKeySigningKeyOfCredential:accountKeyIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient authorizeDeviceKeySigningKeyOfCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient authorizeDeviceKeySigningKeyOfCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __100__DCCredentialStoreClient_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient authorizeDeviceKeySigningKeyOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)authorizeRemoteKeySigningKeyWithCredential:remoteKey:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient authorizeRemoteKeySigningKeyWithCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient authorizeRemoteKeySigningKeyWithCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __91__DCCredentialStoreClient_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient authorizeRemoteKeySigningKeyWithCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)associateExternalPresentmentKeyWithCredential:publicKeyIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient associateExternalPresentmentKeyWithCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient associateExternalPresentmentKeyWithCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __104__DCCredentialStoreClient_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient associateExternalPresentmentKeyWithCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)credentialIdentifierForPublicKeyIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient credentialIdentifierForPublicKeyIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient credentialIdentifierForPublicKeyIdentifier returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __81__DCCredentialStoreClient_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient credentialIdentifierForPublicKeyIdentifier returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)replacePayloadOfCredential:withPayload:format:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient replacePayloadOfCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient replacePayloadOfCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__DCCredentialStoreClient_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient replacePayloadOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)credentialIdentifiersInPartitions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitions returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __72__DCCredentialStoreClient_credentialIdentifiersInPartitions_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitions returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)credentialIdentifiersInPartitions:docType:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocType", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocType returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __80__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocType returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)credentialIdentifiersInPartitions:docType:region:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_20A40D000, v1, OS_LOG_TYPE_DEBUG, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocTypeRegion docType %@ region %@", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocTypeRegion returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __87__DCCredentialStoreClient_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient credentialIdentifiersInPartitionsDocTypeRegion returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)activeRegionsInPartitions:docType:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient activeRegionsInPartitions docType %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient activeRegionsInPartitions returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __72__DCCredentialStoreClient_activeRegionsInPartitions_docType_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient activeRegionsInPartitions returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)deleteCredential:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient deleteCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient deleteCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__DCCredentialStoreClient_deleteCredential_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient deleteCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)propertiesOfCredential:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient propertiesOfCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient propertiesOfCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient propertiesOfCredential returned with error: unknown credential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__DCCredentialStoreClient_propertiesOfCredential_completion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient propertiesOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setStateOfCredential:to:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient setStateOfCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient setStateOfCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__DCCredentialStoreClient_setStateOfCredential_to_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient setStateOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)payloadAuthACLForCredential:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient payloadAuthACLForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient payloadAuthACLForCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__DCCredentialStoreClient_payloadAuthACLForCredential_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient payloadAuthACLForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)elementsOfCredential:elementIdentifiers:authData:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient elementsOfCredential:elementIdentifiers:authData:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient elementsOfCredential:elementIdentifiers:authData: returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __87__DCCredentialStoreClient_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient elementsOfCredential:elementIdentifiers:authData: returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)checkCompletenessOfCredential:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient checkCompletenessOfCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient checkCompletenessOfCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __68__DCCredentialStoreClient_checkCompletenessOfCredential_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient checkCompletenessOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient payloadsOfCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__DCCredentialStoreClient_payloadsOfCredential_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient payloadsOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient allElementsOfCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__DCCredentialStoreClient_allElementsOfCredential_authData_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient allElementsOfCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient occupiedLegacySEKeySlotsWithCompletion returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__DCCredentialStoreClient_occupiedLegacySEKeySlotsWithCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient occupiedLegacySEKeySlotsWithCompletion returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient eraseLegacySEKeySlot returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__DCCredentialStoreClient_eraseLegacySEKeySlot_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient eraseLegacySEKeySlot returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient clearPresentmentKeyUsageForCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__DCCredentialStoreClient_clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient clearPresentmentKeyUsageForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStoreClient keyInfoForCredential returned successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__DCCredentialStoreClient_keyInfoForCredential_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20A40D000, v0, v1, "DCCredentialStoreClient keyInfoForCredential returned with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __61__DCCredentialStoreClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_20A40D000, v0, OS_LOG_TYPE_ERROR, "DCCredentialStoreClient remote object proxy error: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end
