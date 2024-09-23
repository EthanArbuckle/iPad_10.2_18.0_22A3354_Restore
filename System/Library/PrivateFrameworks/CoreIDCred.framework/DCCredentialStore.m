@implementation DCCredentialStore

- (DCCredentialStore)initWithPartitions:(id)a3
{
  id v4;
  NSObject *v5;
  DCCredentialStore *v6;
  DCCredentialStoreClient *v7;
  DCCredentialStoreClient *client;
  uint64_t v9;
  NSArray *partitions;
  objc_super v12;

  v4 = a3;
  DC_LOG_CLIENT_2();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStore initWithPartitions:].cold.1();

  v12.receiver = self;
  v12.super_class = (Class)DCCredentialStore;
  v6 = -[DCCredentialStore init](&v12, sel_init);
  v6->_lock._os_unfair_lock_opaque = 0;
  v7 = objc_alloc_init(DCCredentialStoreClient);
  client = v6->_client;
  v6->_client = v7;

  v9 = objc_msgSend(v4, "copy");
  partitions = v6->_partitions;
  v6->_partitions = (NSArray *)v9;

  v6->_hasBeenConfigured = 0;
  return v6;
}

- (void)configureIfNeededWithContinuation:(id)a3 errorHandler:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  void (**v14)(_QWORD);

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  if (-[DCCredentialStore hasBeenConfigured](self, "hasBeenConfigured"))
  {
LABEL_9:
    v6[2](v6);
    goto LABEL_10;
  }
  DC_LOG_CLIENT_2();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:].cold.2();

  if (!self->_client)
  {
    DC_LOG_CLIENT_2();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:].cold.1();

    goto LABEL_9;
  }
  -[DCCredentialStore client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCCredentialStore partitions](self, "partitions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke;
  v12[3] = &unk_24C306778;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v9, "configureWithPartitions:completion:", v10, v12);

LABEL_10:
}

void __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_2();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_2(v3, v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5)
      __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "finishConfiguration");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)finishConfiguration
{
  -[DCCredentialStore setHasBeenConfigured:](self, "setHasBeenConfigured:", 1);
}

- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke;
  v17[3] = &unk_24C3067A0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke_3;
  v15[3] = &unk_24C306078;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v17, v15);

}

void __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createCredentialInPartition:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateKeySigningKeyForCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke_4;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateKeySigningKeyForCredential:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_5;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isAccountKeySigningKeyAvailableForAccountKeyIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retrieveAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_6;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "retrieveAccountKeySigningKeyForAccountKeyIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_7;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createAccountKeySigningKeyForAccountKeyIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteAccountKeySigningKeyForAccountKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_8;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteAccountKeySigningKeyForAccountKeyIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateAccountKeyAuthorizationForCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke;
  v17[3] = &unk_24C3067A0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_9;
  v15[3] = &unk_24C306078;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v17, v15);

}

void __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateAccountKeyAuthorizationForCredential:accountKeyIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateDeviceEncryptionKeyForCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke_10;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateDeviceEncryptionKeyForCredential:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generatePresentmentKeyForCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke_11;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatePresentmentKeyForCredential:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int64_t v18;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke;
  v15[3] = &unk_24C3067F0;
  v15[4] = self;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_12;
  v13[3] = &unk_24C306078;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v15, v13);

}

void __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatePresentmentKeysForCredential:numKeys:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

uint64_t __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)authorizeDeviceKeySigningKeyOfCredential:(id)a3 accountKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke;
  v17[3] = &unk_24C3067A0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_13;
  v15[3] = &unk_24C306078;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v17, v15);

}

void __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authorizeDeviceKeySigningKeyOfCredential:accountKeyIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)authorizeRemoteKeySigningKeyWithCredential:(id)a3 remoteKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke;
  v17[3] = &unk_24C3067A0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_14;
  v15[3] = &unk_24C306078;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v17, v15);

}

void __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authorizeRemoteKeySigningKeyWithCredential:remoteKey:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)associateExternalPresentmentKeyWithCredential:(id)a3 publicKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke;
  v17[3] = &unk_24C3067A0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_15;
  v15[3] = &unk_24C306078;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v17, v15);

}

void __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associateExternalPresentmentKeyWithCredential:publicKeyIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)credentialIdentifierForPublicKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_16;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credentialIdentifierForPublicKeyIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)replacePayloadOfCredential:(id)a3 withPayload:(id)a4 format:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke;
  v19[3] = &unk_24C306818;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v23 = a5;
  v22 = v12;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke_17;
  v17[3] = &unk_24C306078;
  v18 = v22;
  v14 = v22;
  v15 = v11;
  v16 = v10;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v19, v17);

}

void __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replacePayloadOfCredential:withPayload:format:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

uint64_t __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setStateOfCredential:(id)a3 to:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke;
  v15[3] = &unk_24C3067F0;
  v15[4] = self;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke_18;
  v13[3] = &unk_24C306078;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v15, v13);

}

void __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStateOfCredential:to:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

uint64_t __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke_19;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credentialIdentifiersInPartitions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke;
  v17[3] = &unk_24C3067A0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke_20;
  v15[3] = &unk_24C306078;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v17, v15);

}

void __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credentialIdentifiersInPartitions:docType:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)credentialIdentifiersInPartitions:(id)a3 docType:(id)a4 region:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke;
  v21[3] = &unk_24C306840;
  v21[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_21;
  v19[3] = &unk_24C306078;
  v20 = v25;
  v15 = v25;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v21, v19);

}

void __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credentialIdentifiersInPartitions:docType:region:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)activeRegionsInPartitions:(id)a3 docType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke;
  v17[3] = &unk_24C3067A0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke_22;
  v15[3] = &unk_24C306078;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v17, v15);

}

void __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeRegionsInPartitions:docType:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)credentialIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCCredentialStore partitions](self, "partitions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DCCredentialStore credentialIdentifiersInPartitions:completion:](self, "credentialIdentifiersInPartitions:completion:", v5, v4);

}

- (void)deleteCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__DCCredentialStore_deleteCredential_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __49__DCCredentialStore_deleteCredential_completion___block_invoke_23;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __49__DCCredentialStore_deleteCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __49__DCCredentialStore_deleteCredential_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteCredential:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __49__DCCredentialStore_deleteCredential_completion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)propertiesOfCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke_24;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertiesOfCredential:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)payloadAuthACLForCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke_25;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadAuthACLForCredential:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 completion:(id)a5
{
  -[DCCredentialStore elementsOfCredential:elementIdentifiers:authData:completion:](self, "elementsOfCredential:elementIdentifiers:authData:completion:", a3, a4, 0, a5);
}

- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 authData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke;
  v21[3] = &unk_24C306840;
  v21[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_26;
  v19[3] = &unk_24C306078;
  v20 = v25;
  v15 = v25;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v21, v19);

}

void __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementsOfCredential:elementIdentifiers:authData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkCompletenessOfCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke_27;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkCompletenessOfCredential:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)hasBeenConfigured
{
  DCCredentialStore *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasBeenConfigured;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasBeenConfigured:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasBeenConfigured = a3;
  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialStoreClient)client
{
  return self->_client;
}

- (NSArray)partitions
{
  return self->_partitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partitions, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)payloadsOfCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke_206;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadsOfCredential:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke_206(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allElementsOfCredential:(id)a3 completion:(id)a4
{
  -[DCCredentialStore allElementsOfCredential:authData:completion:](self, "allElementsOfCredential:authData:completion:", a3, 0, a4);
}

- (void)allElementsOfCredential:(id)a3 authData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke;
  v17[3] = &unk_24C3067A0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke_207;
  v15[3] = &unk_24C306078;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v17, v15);

}

void __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allElementsOfCredential:authData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke_207(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)occupiedLegacySEKeySlotsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke;
  v9[3] = &unk_24C306868;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke_208;
  v7[3] = &unk_24C306078;
  v8 = v10;
  v6 = v10;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v9, v7);

}

void __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "occupiedLegacySEKeySlotsWithCompletion:", *(_QWORD *)(a1 + 40));

}

uint64_t __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke_208(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)eraseLegacySEKeySlot:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke;
  v11[3] = &unk_24C306890;
  v11[4] = self;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke_209;
  v9[3] = &unk_24C306078;
  v10 = v12;
  v8 = v12;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v11, v9);

}

void __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eraseLegacySEKeySlot:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke_209(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearPresentmentKeyUsageForCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke_210;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearPresentmentKeyUsageForCredential:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke_210(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)keyInfoForCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke;
  v13[3] = &unk_24C3067C8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke_211;
  v11[3] = &unk_24C306078;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[DCCredentialStore configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v13, v11);

}

void __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyInfoForCredential:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke_211(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initWithPartitions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore init called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureIfNeededWithContinuation:errorHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore configureIfNeeded no client set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureIfNeededWithContinuation:errorHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore configure needed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore configure completed successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __68__DCCredentialStore_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_20A40D000, a2, OS_LOG_TYPE_DEBUG, "DCCredentialStore configure return error %{error}@", (uint8_t *)&v4, 0xCu);

}

void __68__DCCredentialStore_createCredentialInPartition_options_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore createCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__DCCredentialStore_generateKeySigningKeyForCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore generateKeySigningKeyForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __87__DCCredentialStore_isAccountKeySigningKeyAvailableForAccountKeyIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore isAccountKeySigningKeyAvailableForAccountKeyIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__DCCredentialStore_retrieveAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore retrieveAccountKeySigningKeyForAccountKeyIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__DCCredentialStore_createAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore createAccountKeySigningKeyForAccountKeyIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __82__DCCredentialStore_deleteAccountKeySigningKeyForAccountKeyIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore deleteAccountKeySigningKeyForAccountKeyIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __98__DCCredentialStore_generateAccountKeyAuthorizationForCredential_accountKeyIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore generateAccountKeyAuthorizationForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__DCCredentialStore_generateDeviceEncryptionKeyForCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore generateDeviceEncryptionKeyForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __68__DCCredentialStore_generatePresentmentKeyForCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore generatePresentmentKeyForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__DCCredentialStore_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore generatePresentmentKeysForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __94__DCCredentialStore_authorizeDeviceKeySigningKeyOfCredential_accountKeyIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore authorizeDeviceKeySigningKeyOfCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __85__DCCredentialStore_authorizeRemoteKeySigningKeyWithCredential_remoteKey_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore authorizeRemoteKeySigningKeyWithCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __98__DCCredentialStore_associateExternalPresentmentKeyWithCredential_publicKeyIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore associateExternalPresentmentKeyWithCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __75__DCCredentialStore_credentialIdentifierForPublicKeyIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore credentialIdentifierForPublicKeyIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __78__DCCredentialStore_replacePayloadOfCredential_withPayload_format_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore replacePayloadOfCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__DCCredentialStore_setStateOfCredential_to_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore setStateofCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__DCCredentialStore_credentialIdentifiersInPartitions_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore credentialIdentifiersInPartitions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__DCCredentialStore_credentialIdentifiersInPartitions_docType_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore credentialIdentifiersInPartitionsDocType", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __81__DCCredentialStore_credentialIdentifiersInPartitions_docType_region_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore credentialIdentifiersInPartitionsDocTypeRegion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__DCCredentialStore_activeRegionsInPartitions_docType_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore activeRegionsInPartitions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__DCCredentialStore_deleteCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore deleteCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__DCCredentialStore_propertiesOfCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore propertiesOfCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__DCCredentialStore_payloadAuthACLForCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore payloadAuthACLForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __81__DCCredentialStore_elementsOfCredential_elementIdentifiers_authData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore elementsOfCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__DCCredentialStore_checkCompletenessOfCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore checkCompletenessOfCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__DCCredentialStore_DebugAPIs__payloadsOfCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore payloadsOfCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__DCCredentialStore_DebugAPIs__allElementsOfCredential_authData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore allElementsOfCredential:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__DCCredentialStore_DebugAPIs__occupiedLegacySEKeySlotsWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore occupiedLegacySEKeySlotsWithCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__DCCredentialStore_DebugAPIs__eraseLegacySEKeySlot_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore eraseLegacySEKeySlot", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __81__DCCredentialStore_DebugAPIs__clearPresentmentKeyUsageForCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore clearPresentmentKeyUsageForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__DCCredentialStore_DebugAPIs__keyInfoForCredential_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCCredentialStore keyInfoForCredential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
