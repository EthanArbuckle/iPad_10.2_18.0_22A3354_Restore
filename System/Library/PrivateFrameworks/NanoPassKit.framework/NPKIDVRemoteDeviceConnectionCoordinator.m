@implementation NPKIDVRemoteDeviceConnectionCoordinator

- (NPKIDVRemoteDeviceConnectionCoordinator)init
{
  NPKIDVRemoteDeviceConnectionCoordinator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *IDSMessagesQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *observerQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *outstandingRequestItems;
  uint64_t v9;
  NSHashTable *observers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NPKIDVRemoteDeviceConnectionCoordinator;
  v2 = -[NPKIDVRemoteDeviceConnectionCoordinator init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.NanoPassKit.remoteDeviceConnection.IDSMessages", 0);
    IDSMessagesQueue = v2->_IDSMessagesQueue;
    v2->_IDSMessagesQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.NanoPassKit.remoteDeviceConnection.observer", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    outstandingRequestItems = v2->_outstandingRequestItems;
    v2->_outstandingRequestItems = v7;

    objc_msgSend(MEMORY[0x24BDD15C0], "pk_weakObjectsHashTableUsingPointerPersonality");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

  }
  return v2;
}

- (void)startCurrentRemoteDeviceConnection
{
  NSObject *IDSMessagesQueue;
  _QWORD block[5];

  IDSMessagesQueue = self->_IDSMessagesQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__NPKIDVRemoteDeviceConnectionCoordinator_startCurrentRemoteDeviceConnection__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(IDSMessagesQueue, block);
}

void __77__NPKIDVRemoteDeviceConnectionCoordinator_startCurrentRemoteDeviceConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Will Start new IDV Remote Device IDS service", (uint8_t *)&v13, 2u);
    }

  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: We currently have an existing IDS service:%@ we will teardown it first", (uint8_t *)&v13, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_inQueue_teardownCurrentRemoteDeviceConnection");
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.applepay.identitycredential"));
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_createCredentialResponse_, 1);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_generateCredentialSigningKeyResponse_, 4);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_generatePresentmentKeysForCredentialResponse_, 14);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_deleteCredentialResponse_, 3);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_fetchPropertiesOfCredentialResponse_, 2);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_fetchPartitionsCredentialIdentifiersResponse_, 5);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_nonceForAuthorizationTokenResponse_, 6);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_prearmCredentialWithAuthorizationTokenResponse_, 7);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_provisionCredentialResponse_, 12);
  objc_msgSend(v9, "setProtobufAction:forIncomingRequestsOfType:", sel_handlePrearmStatusUpdate_service_account_fromID_context_, 8);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_establishPrearmTrustResponse_, 9);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_establishPrearmTrustV2Response_, 16);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_deleteGlobalAuthACLResponse_, 11);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_getCASDCertificateResponse_, 15);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_addNotificationResponse_, 13);
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", sel_updateProofingConfigurationResponse_, 17);
  objc_msgSend(v9, "setProtobufAction:forIncomingRequestsOfType:", sel_handleHeartbeats_service_account_fromID_context_, 0xFFFFLL);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), v9);
  objc_msgSend(v9, "addDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did Start IDV Remote Device IDS service:%@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (void)teardownCurrentRemoteDeviceConnection
{
  NSObject *IDSMessagesQueue;
  _QWORD block[5];

  IDSMessagesQueue = self->_IDSMessagesQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__NPKIDVRemoteDeviceConnectionCoordinator_teardownCurrentRemoteDeviceConnection__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_sync(IDSMessagesQueue, block);
}

uint64_t __80__NPKIDVRemoteDeviceConnectionCoordinator_teardownCurrentRemoteDeviceConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inQueue_teardownCurrentRemoteDeviceConnection");
}

- (void)_inQueue_teardownCurrentRemoteDeviceConnection
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSMutableDictionary *outstandingRequestItems;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  IDSService *remoteDeviceIDSService;
  IDSService *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_IDSMessagesQueue);
  if (-[NSMutableDictionary count](self->_outstandingRequestItems, "count"))
  {
    pk_Payment_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      pk_Payment_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        outstandingRequestItems = self->_outstandingRequestItems;
        v15 = 138412290;
        v16 = outstandingRequestItems;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: outstandingRequestItems is not empty:%@. expected to timeout eventually.", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      remoteDeviceIDSService = self->_remoteDeviceIDSService;
      v15 = 138412290;
      v16 = remoteDeviceIDSService;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Will teardownIDV Remote Device IDS service:%@", (uint8_t *)&v15, 0xCu);
    }

  }
  -[IDSService removeDelegate:](self->_remoteDeviceIDSService, "removeDelegate:", self);
  v11 = self->_remoteDeviceIDSService;
  self->_remoteDeviceIDSService = 0;

  pk_Payment_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did teardownIDV Remote Device IDS service", (uint8_t *)&v15, 2u);
    }

  }
}

- (void)createCredentialResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoCreateCredentialResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoCreateCredentialResponse *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315394;
      v19 = "-[NPKIDVRemoteDeviceConnectionCoordinator createCredentialResponse:]";
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v18, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoCreateCredentialResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoCreateCredentialResponse initWithData:](v10, "initWithData:", v11);

    -[NPKIDVRemoteDeviceProtoCreateCredentialResponse errorData](v12, "errorData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    NPKSecureUnarchiveObject(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "completion");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NPKIDVRemoteDeviceProtoCreateCredentialResponse credentialIdentifier](v12, "credentialIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v16)[2](v16, v17, v15);

  }
}

- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NPKIDVRemoteDeviceProtoCreateCredentialRequest *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[NPKIDVRemoteDeviceConnectionCoordinator createCredentialInPartition:options:completion:]";
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }

  }
  v14 = objc_alloc_init(NPKIDVRemoteDeviceProtoCreateCredentialRequest);
  -[NPKIDVRemoteDeviceProtoCreateCredentialRequest setPartitionIdentifier:](v14, "setPartitionIdentifier:", v10);

  NPKSecureArchiveObject(v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceProtoCreateCredentialRequest setCredentialOptionsData:](v14, "setCredentialOptionsData:", v15);
  v16 = (void *)MEMORY[0x2199B6780](v8);
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __90__NPKIDVRemoteDeviceConnectionCoordinator_createCredentialInPartition_options_completion___block_invoke;
  v26 = &unk_24CFE7B80;
  v27 = v8;
  v17 = v8;
  v18 = (void *)MEMORY[0x2199B6780](&v23);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("CreateCredential-%@"), v21, v23, v24, v25, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v14, 1, v22, v19);
}

void __90__NPKIDVRemoteDeviceConnectionCoordinator_createCredentialInPartition_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while creating credential:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)generateCredentialSigningKeyResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoGenerateKeyResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoGenerateKeyResponse *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315394;
      v21 = "-[NPKIDVRemoteDeviceConnectionCoordinator generateCredentialSigningKeyResponse:]";
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v20, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoGenerateKeyResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoGenerateKeyResponse initWithData:](v10, "initWithData:", v11);

    -[NPKIDVRemoteDeviceProtoGenerateKeyResponse signingKeyData](v12, "signingKeyData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    getDCCredentialCryptoKeyClass();
    v14 = objc_opt_class();
    NPKSecureUnarchiveObject(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKIDVRemoteDeviceProtoGenerateKeyResponse errorData](v12, "errorData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    NPKSecureUnarchiveObject(v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "completion");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v19)[2](v19, v15, v18);

  }
}

- (void)generateKeyWithType:(unint64_t)a3 credentialIdentifier:(id)a4 withConfiguredPartitions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NPKIDVRemoteDeviceProtoGenerateKeyRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  pk_Payment_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[NPKIDVRemoteDeviceConnectionCoordinator generateKeyWithType:credentialIdentifier:withConfiguredPartitions:completion:]";
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }

  }
  v16 = objc_alloc_init(NPKIDVRemoteDeviceProtoGenerateKeyRequest);
  -[NPKIDVRemoteDeviceProtoGenerateKeyRequest setCredentialIdentifier:](v16, "setCredentialIdentifier:", v12);
  NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceProtoGenerateKeyRequest setKeyTypeString:](v16, "setKeyTypeString:", v17);

  objc_msgSend(v11, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  -[NPKIDVRemoteDeviceProtoGenerateKeyRequest setConfiguredPartitionsIdentifiers:](v16, "setConfiguredPartitionsIdentifiers:", v19);

  v20 = (void *)MEMORY[0x2199B6780](v10);
  v25 = MEMORY[0x24BDAC760];
  v26 = 3221225472;
  v27 = __120__NPKIDVRemoteDeviceConnectionCoordinator_generateKeyWithType_credentialIdentifier_withConfiguredPartitions_completion___block_invoke;
  v28 = &unk_24CFE7B80;
  v29 = v10;
  v21 = v10;
  v22 = (void *)MEMORY[0x2199B6780](&v25);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GenerateCredentialKey-%@"), v12, v25, v26, v27, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v16, 4, v24, v23);
}

void __120__NPKIDVRemoteDeviceConnectionCoordinator_generateKeyWithType_credentialIdentifier_withConfiguredPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while Generating signing key:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)generatePresentmentKeysForCredentialResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[NPKIDVRemoteDeviceConnectionCoordinator generatePresentmentKeysForCredentialResponse:]";
      v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", buf, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse initWithData:](v10, "initWithData:", v11);

    v13 = objc_alloc(MEMORY[0x24BDBCEB8]);
    -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse presentmentKeysDatas](v12, "presentmentKeysDatas");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse presentmentKeysDatas](v12, "presentmentKeysDatas", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v20);
          getDCCredentialCryptoKeyClass();
          v22 = objc_opt_class();
          NPKSecureUnarchiveObject(v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "safelyAddObject:", v23);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v18);
    }

    -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse errorData](v12, "errorData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_class();
    NPKSecureUnarchiveObject(v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "completion");
    v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v27)[2](v27, v15, v26);

  }
}

- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 withConfiguredPartitions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  NPKPairedOrPairingDevice();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("E63BF630-F388-4DCC-B73A-40EFB659A4C2"));
  v15 = objc_msgSend(v13, "supportsCapability:", v14);

  if (a4 == 1 || (v15 & 1) == 0)
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __124__NPKIDVRemoteDeviceConnectionCoordinator_generatePresentmentKeysForCredential_numKeys_withConfiguredPartitions_completion___block_invoke;
    v30[3] = &unk_24CFE8210;
    v31 = v10;
    v16 = (NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest *)v10;
    v24 = (void *)MEMORY[0x2199B6780](v30);
    -[NPKIDVRemoteDeviceConnectionCoordinator generateKeyWithType:credentialIdentifier:withConfiguredPartitions:completion:](self, "generateKeyWithType:credentialIdentifier:withConfiguredPartitions:completion:", 3, v12, v11, v24);

    v20 = v31;
  }
  else
  {
    v16 = objc_alloc_init(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest);
    -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest setCredentialIdentifier:](v16, "setCredentialIdentifier:", v12);

    objc_msgSend(v11, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(v17, "mutableCopy");
    -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest setConfiguredPartitionsIdentifiers:](v16, "setConfiguredPartitionsIdentifiers:", v18);

    -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest setNumKeys:](v16, "setNumKeys:", a4);
    v19 = (void *)MEMORY[0x2199B6780](v10);
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = __124__NPKIDVRemoteDeviceConnectionCoordinator_generatePresentmentKeysForCredential_numKeys_withConfiguredPartitions_completion___block_invoke_2;
    v28 = &unk_24CFE7B80;
    v29 = v10;
    v20 = v10;
    v21 = (void *)MEMORY[0x2199B6780](&v25);
    -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v19, v21, v25, v26, v27, v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GenerateCredentialKey-PresentmentKeys"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v16, 14, v23, v22);

  }
}

void __124__NPKIDVRemoteDeviceConnectionCoordinator_generatePresentmentKeysForCredential_numKeys_withConfiguredPartitions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v9[0] = a2;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v8, v6);

}

void __124__NPKIDVRemoteDeviceConnectionCoordinator_generatePresentmentKeysForCredential_numKeys_withConfiguredPartitions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while generating presentment keys:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)deleteCredentialResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoDeleteCredentialResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoDeleteCredentialResponse *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[NPKIDVRemoteDeviceConnectionCoordinator deleteCredentialResponse:]";
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v17, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoDeleteCredentialResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoDeleteCredentialResponse initWithData:](v10, "initWithData:", v11);

    -[NPKIDVRemoteDeviceProtoDeleteCredentialResponse errorData](v12, "errorData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    NPKSecureUnarchiveObject(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "completion");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v16)[2](v16, v15);

  }
}

- (void)deleteCredential:(id)a3 withConfiguredPartitions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NPKIDVRemoteDeviceProtoDeleteCredentialRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[NPKIDVRemoteDeviceConnectionCoordinator deleteCredential:withConfiguredPartitions:completion:]";
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }

  }
  v14 = objc_alloc_init(NPKIDVRemoteDeviceProtoDeleteCredentialRequest);
  -[NPKIDVRemoteDeviceProtoDeleteCredentialRequest setCredentialIdentifier:](v14, "setCredentialIdentifier:", v10);
  objc_msgSend(v9, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  -[NPKIDVRemoteDeviceProtoDeleteCredentialRequest setConfiguredPartitionsIdentifiers:](v14, "setConfiguredPartitionsIdentifiers:", v16);

  v17 = (void *)MEMORY[0x2199B6780](v8);
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __96__NPKIDVRemoteDeviceConnectionCoordinator_deleteCredential_withConfiguredPartitions_completion___block_invoke;
  v25 = &unk_24CFE7B80;
  v26 = v8;
  v18 = v8;
  v19 = (void *)MEMORY[0x2199B6780](&v22);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DeleteCredential-%@"), v10, v22, v23, v24, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v14, 3, v21, v20);
}

void __96__NPKIDVRemoteDeviceConnectionCoordinator_deleteCredential_withConfiguredPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while deleting credential:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchPropertiesOfCredentialResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NPKIDVRemoteDeviceProtoCredentialPropertiesResponse *v11;
  void *v12;
  NPKIDVRemoteDeviceProtoCredentialPropertiesResponse *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[NPKIDVRemoteDeviceConnectionCoordinator fetchPropertiesOfCredentialResponse:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", buf, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (!v10)
  {
    v11 = [NPKIDVRemoteDeviceProtoCredentialPropertiesResponse alloc];
    objc_msgSend(v4, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NPKIDVRemoteDeviceProtoCredentialPropertiesResponse initWithData:](v11, "initWithData:", v12);

    -[NPKIDVRemoteDeviceProtoCredentialPropertiesResponse credentialPropertiesData](v13, "credentialPropertiesData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v15 = (void *)getDCCredentialPropertiesClass_softClass;
    v26 = getDCCredentialPropertiesClass_softClass;
    if (!getDCCredentialPropertiesClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getDCCredentialPropertiesClass_block_invoke;
      v28 = &unk_24CFE81D0;
      v29 = &v23;
      __getDCCredentialPropertiesClass_block_invoke((uint64_t)buf);
      v15 = (void *)v24[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v23, 8);
    v17 = objc_opt_class();
    NPKSecureUnarchiveObject(v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKIDVRemoteDeviceProtoCredentialPropertiesResponse errorData](v13, "errorData", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    NPKSecureUnarchiveObject(v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "completion");
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v22)[2](v22, v18, v21);

  }
}

- (void)propertiesOfCredential:(id)a3 withConfiguredPartitions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NPKIDVRemoteDeviceProtoCredentialPropertiesRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[NPKIDVRemoteDeviceConnectionCoordinator propertiesOfCredential:withConfiguredPartitions:completion:]";
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }

  }
  v14 = objc_alloc_init(NPKIDVRemoteDeviceProtoCredentialPropertiesRequest);
  -[NPKIDVRemoteDeviceProtoCredentialPropertiesRequest setCredentialIdentifier:](v14, "setCredentialIdentifier:", v10);

  objc_msgSend(v9, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  -[NPKIDVRemoteDeviceProtoCredentialPropertiesRequest setConfiguredPartitionsIdentifiers:](v14, "setConfiguredPartitionsIdentifiers:", v16);

  v17 = (void *)MEMORY[0x2199B6780](v8);
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __102__NPKIDVRemoteDeviceConnectionCoordinator_propertiesOfCredential_withConfiguredPartitions_completion___block_invoke;
  v27 = &unk_24CFE7B80;
  v28 = v8;
  v18 = v8;
  v19 = (void *)MEMORY[0x2199B6780](&v24);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("CredentialProperties-%@"), v22, v24, v25, v26, v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v14, 2, v23, v20);
}

void __102__NPKIDVRemoteDeviceConnectionCoordinator_propertiesOfCredential_withConfiguredPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while fetching credential properties:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchPartitionsCredentialIdentifiersResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersResponse *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315394;
      v21 = "-[NPKIDVRemoteDeviceConnectionCoordinator fetchPartitionsCredentialIdentifiersResponse:]";
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v20, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersResponse initWithData:](v10, "initWithData:", v11);

    -[NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersResponse partitionsCredentialIdentifiersData](v12, "partitionsCredentialIdentifiersData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    NPKSecureUnarchiveObject(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersResponse errorData](v12, "errorData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    NPKSecureUnarchiveObject(v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "completion");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v19)[2](v19, v15, v18);

  }
}

- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[NPKIDVRemoteDeviceConnectionCoordinator credentialIdentifiersInPartitions:completion:]";
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }

  }
  v11 = objc_alloc_init(NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest);
  v12 = (void *)objc_msgSend(v7, "mutableCopy");

  -[NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest setPartitionsIdentifiers:](v11, "setPartitionsIdentifiers:", v12);
  v13 = (void *)MEMORY[0x2199B6780](v6);
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __88__NPKIDVRemoteDeviceConnectionCoordinator_credentialIdentifiersInPartitions_completion___block_invoke;
  v23 = &unk_24CFE7B80;
  v24 = v6;
  v14 = v6;
  v15 = (void *)MEMORY[0x2199B6780](&v20);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("partitionsCredentialsIdentifiers-%@"), v18, v20, v21, v22, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v11, 5, v19, v16);
}

void __88__NPKIDVRemoteDeviceConnectionCoordinator_credentialIdentifiersInPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while fetching partition's credential identifiers:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)provisionCredentialResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoProvisionCredentialResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoProvisionCredentialResponse *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315394;
      v21 = "-[NPKIDVRemoteDeviceConnectionCoordinator provisionCredentialResponse:]";
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v20, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoProvisionCredentialResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoProvisionCredentialResponse initWithData:](v10, "initWithData:", v11);

    if (-[NPKIDVRemoteDeviceProtoProvisionCredentialResponse hasSecureElementPassData](v12, "hasSecureElementPassData"))
    {
      -[NPKIDVRemoteDeviceProtoProvisionCredentialResponse secureElementPassData](v12, "secureElementPassData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_class();
      NPKSecureUnarchiveObject(v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    if (-[NPKIDVRemoteDeviceProtoProvisionCredentialResponse hasErrorData](v12, "hasErrorData"))
    {
      -[NPKIDVRemoteDeviceProtoProvisionCredentialResponse errorData](v12, "errorData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_class();
      NPKSecureUnarchiveObject(v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v8, "completion");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v19)[2](v19, v15, v18);

  }
}

- (void)provisionCredentialWithType:(unint64_t)a3 metadata:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NPKIDVRemoteDeviceProtoProvisionCredentialRequest *v19;
  NPKIDVRemoteDeviceProtoProvisionCredentialRequest *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = objc_alloc_init(NPKIDVRemoteDeviceProtoProvisionCredentialRequest);
  v20 = v19;
  if (!a3)
  {
    v21 = 0;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v21 = 1;
LABEL_5:
    -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setCredentialType:](v19, "setCredentialType:", v21);
  }
  NPKSecureArchiveObject(v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setMetadataData:](v20, "setMetadataData:", v22);

  -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setCredentialIdentifier:](v20, "setCredentialIdentifier:", v15);
  NPKSecureArchiveObject(v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setAttestationsData:](v20, "setAttestationsData:", v23);
  -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setSupplementalData:](v20, "setSupplementalData:", v17);

  v24 = (void *)MEMORY[0x2199B6780](v16);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __142__NPKIDVRemoteDeviceConnectionCoordinator_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke;
  v32[3] = &unk_24CFE7AB8;
  v33 = v15;
  v34 = v16;
  v25 = v16;
  v26 = v15;
  v27 = (void *)MEMORY[0x2199B6780](v32);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v24, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("credentialProvisioning-%@"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v20, 12, v31, v28);
}

void __142__NPKIDVRemoteDeviceConnectionCoordinator_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while provisioning credential with identifier:%@ error:%@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)nonceForAuthorizationTokenResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse *v11;
  void *v12;
  NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[NPKIDVRemoteDeviceConnectionCoordinator nonceForAuthorizationTokenResponse:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", buf, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (!v10)
  {
    v11 = [NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse alloc];
    objc_msgSend(v4, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse initWithData:](v11, "initWithData:", v12);

    -[NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse nonceData](v13, "nonceData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v15 = (void *)getDCCredentialNonceClass_softClass;
    v26 = getDCCredentialNonceClass_softClass;
    if (!getDCCredentialNonceClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getDCCredentialNonceClass_block_invoke;
      v28 = &unk_24CFE81D0;
      v29 = &v23;
      __getDCCredentialNonceClass_block_invoke((uint64_t)buf);
      v15 = (void *)v24[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v23, 8);
    v17 = objc_opt_class();
    NPKSecureUnarchiveObject(v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse errorData](v13, "errorData", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    NPKSecureUnarchiveObject(v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "completion");
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v22)[2](v22, v18, v21);

  }
}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenRequest *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[NPKIDVRemoteDeviceConnectionCoordinator nonceForAuthorizationTokenWithCompletion:]";
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }

  }
  v8 = objc_alloc_init(NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenRequest);
  v9 = (void *)MEMORY[0x2199B6780](v4);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __84__NPKIDVRemoteDeviceConnectionCoordinator_nonceForAuthorizationTokenWithCompletion___block_invoke;
  v13[3] = &unk_24CFE7B80;
  v14 = v4;
  v10 = v4;
  v11 = (void *)MEMORY[0x2199B6780](v13);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:priority:queueIdentifier:requestItem:](self, "_sendRequest:withType:priority:queueIdentifier:requestItem:", v8, 6, 300, CFSTR("nonceForAuthorizationToken"), v12);
}

void __84__NPKIDVRemoteDeviceConnectionCoordinator_nonceForAuthorizationTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while fetching nonce for authentication token error:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)prearmCredentialWithAuthorizationTokenResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoPrearmCredentialResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoPrearmCredentialResponse *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[NPKIDVRemoteDeviceConnectionCoordinator prearmCredentialWithAuthorizationTokenResponse:]";
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v17, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoPrearmCredentialResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoPrearmCredentialResponse initWithData:](v10, "initWithData:", v11);

    -[NPKIDVRemoteDeviceProtoPrearmCredentialResponse errorData](v12, "errorData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    NPKSecureUnarchiveObject(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "completion");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v16)[2](v16, v15);

  }
}

- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NPKIDVRemoteDeviceProtoPrearmCredentialRequest *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(NPKIDVRemoteDeviceProtoPrearmCredentialRequest);
  NPKSecureArchiveObject(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceProtoPrearmCredentialRequest setAuthorizationTokenData:](v8, "setAuthorizationTokenData:", v9);
  v10 = (void *)MEMORY[0x2199B6780](v6);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __93__NPKIDVRemoteDeviceConnectionCoordinator_prearmCredentialWithAuthorizationToken_completion___block_invoke;
  v14[3] = &unk_24CFE7B80;
  v15 = v6;
  v11 = v6;
  v12 = (void *)MEMORY[0x2199B6780](v14);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:priority:queueIdentifier:requestItem:](self, "_sendRequest:withType:priority:queueIdentifier:requestItem:", v8, 7, 300, CFSTR("prearmCredentialWithAuthorizationToken"), v13);
}

void __93__NPKIDVRemoteDeviceConnectionCoordinator_prearmCredentialWithAuthorizationToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while pre-arming credential with authentication token error:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)establishPrearmTrustResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoEstablishPrearmTrustResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoEstablishPrearmTrustResponse *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[NPKIDVRemoteDeviceConnectionCoordinator establishPrearmTrustResponse:]";
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v17, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoEstablishPrearmTrustResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoEstablishPrearmTrustResponse initWithData:](v10, "initWithData:", v11);

    if (-[NPKIDVRemoteDeviceProtoEstablishPrearmTrustResponse hasErrorData](v12, "hasErrorData"))
    {
      -[NPKIDVRemoteDeviceProtoEstablishPrearmTrustResponse errorData](v12, "errorData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_class();
      NPKSecureUnarchiveObject(v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v8, "completion");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v16)[2](v16, v15);

  }
}

- (void)establishPrearmTrustV2Response:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response *v11;
  void *v12;
  NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[NPKIDVRemoteDeviceConnectionCoordinator establishPrearmTrustV2Response:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", buf, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (!v10)
  {
    v11 = [NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response alloc];
    objc_msgSend(v4, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response initWithData:](v11, "initWithData:", v12);

    if (-[NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response hasErrorData](v13, "hasErrorData"))
    {
      -[NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response errorData](v13, "errorData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      NPKSecureUnarchiveObject(v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    -[NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response attestationData](v13, "attestationData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v18 = (void *)getDCCredentialAttestationClass_softClass;
    v26 = getDCCredentialAttestationClass_softClass;
    if (!getDCCredentialAttestationClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getDCCredentialAttestationClass_block_invoke;
      v28 = &unk_24CFE81D0;
      v29 = &v23;
      __getDCCredentialAttestationClass_block_invoke((uint64_t)buf);
      v18 = (void *)v24[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v23, 8);
    v20 = objc_opt_class();
    NPKSecureUnarchiveObject(v17, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "completion", v23);
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v22)[2](v22, v21, v16);

  }
}

- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Request *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v6 = a4;
  v7 = a3;
  NPKPairedOrPairingDevice();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("E63BF630-F388-4DCC-B73A-40EFB659A4C2"));
  v10 = objc_msgSend(v8, "supportsCapability:", v9);

  if (v10)
  {
    v11 = (void *)MEMORY[0x2199B6780](v6);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke;
    v27[3] = &unk_24CFE7B80;
    v12 = &v28;
    v28 = v6;
    v13 = v6;
    v14 = (void *)MEMORY[0x2199B6780](v27);
    -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc_init(NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Request);
    NPKSecureArchiveObject(v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Request setTrustData:](v16, "setTrustData:", v17);
    -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v16, 16, CFSTR("establishPrearmTrustV2"), v15);
  }
  else
  {
    v18 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke_122;
    v25[3] = &unk_24CFE7B80;
    v12 = &v26;
    v26 = v6;
    v19 = v6;
    v20 = (void *)MEMORY[0x2199B6780](v25);
    v21 = (void *)MEMORY[0x2199B6780]();
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke_2;
    v23[3] = &unk_24CFE7B80;
    v24 = v20;
    v16 = v20;
    v22 = (void *)MEMORY[0x2199B6780](v23);
    -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKIDVRemoteDeviceConnectionCoordinator _sendEstablishPrearmTrustRequest:item:](self, "_sendEstablishPrearmTrustRequest:item:", v7, v15);
  }

}

void __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while establishing prearm trust, error:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while establishing prearm trust, error:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_sendEstablishPrearmTrustRequest:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NPKIDVRemoteDeviceProtoEstablishPrearmTrustRequest *v9;

  v6 = a4;
  v7 = a3;
  v9 = objc_alloc_init(NPKIDVRemoteDeviceProtoEstablishPrearmTrustRequest);
  NPKSecureArchiveObject(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceProtoEstablishPrearmTrustRequest setTrustData:](v9, "setTrustData:", v8);
  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v9, 9, CFSTR("establishPrearmTrust"), v6);

}

- (void)handlePrearmStatusUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  NPKIDVRemoteDeviceProtoPrearmStatusUpdate *v9;
  void *v10;
  NPKIDVRemoteDeviceProtoPrearmStatusUpdate *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  NSObject *observerQueue;
  _QWORD v19[6];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = [NPKIDVRemoteDeviceProtoPrearmStatusUpdate alloc];
  objc_msgSend(v8, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[NPKIDVRemoteDeviceProtoPrearmStatusUpdate initWithData:](v9, "initWithData:", v10);
  v12 = -[NPKIDVRemoteDeviceProtoPrearmStatusUpdate prearmStatus](v11, "prearmStatus") + 1;
  if (v12 >= 4)
    v13 = 0;
  else
    v13 = v12 - 1;
  pk_Payment_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKIDVDeviceCredentialPrearmStatus(v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Received credential prearm status update:%@", buf, 0xCu);

    }
  }
  observerQueue = self->_observerQueue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __99__NPKIDVRemoteDeviceConnectionCoordinator_handlePrearmStatusUpdate_service_account_fromID_context___block_invoke;
  v19[3] = &unk_24CFE8238;
  v19[4] = self;
  v19[5] = v13;
  dispatch_async(observerQueue, v19);

}

void __99__NPKIDVRemoteDeviceConnectionCoordinator_handlePrearmStatusUpdate_service_account_fromID_context___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "remoteDeviceConnectionCoordinator:didReceivePrearmStatusUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)deleteGlobalAuthACLResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoDeleteGlobalAuthACLResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoDeleteGlobalAuthACLResponse *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[NPKIDVRemoteDeviceConnectionCoordinator deleteGlobalAuthACLResponse:]";
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v17, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoDeleteGlobalAuthACLResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoDeleteGlobalAuthACLResponse initWithData:](v10, "initWithData:", v11);

    -[NPKIDVRemoteDeviceProtoDeleteGlobalAuthACLResponse errorData](v12, "errorData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    NPKSecureUnarchiveObject(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "completion");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v16)[2](v16, v15);

  }
}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NPKIDVRemoteDeviceProtoDeleteGlobalAuthACLRequest *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[NPKIDVRemoteDeviceConnectionCoordinator deleteGlobalAuthACLWithCompletion:]";
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }

  }
  v8 = objc_alloc_init(NPKIDVRemoteDeviceProtoDeleteGlobalAuthACLRequest);
  v9 = (void *)MEMORY[0x2199B6780](v4);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__NPKIDVRemoteDeviceConnectionCoordinator_deleteGlobalAuthACLWithCompletion___block_invoke;
  v13[3] = &unk_24CFE7B80;
  v14 = v4;
  v10 = v4;
  v11 = (void *)MEMORY[0x2199B6780](v13);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v8, 11, CFSTR("deleteGlobalAuthACL"), v12);
}

void __77__NPKIDVRemoteDeviceConnectionCoordinator_deleteGlobalAuthACLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while deleting global auth ACL error:%@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)getCASDCertificateResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoCasdCertificateResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoCasdCertificateResponse *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315394;
      v20 = "-[NPKIDVRemoteDeviceConnectionCoordinator getCASDCertificateResponse:]";
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v19, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoCasdCertificateResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoCasdCertificateResponse initWithData:](v10, "initWithData:", v11);

    -[NPKIDVRemoteDeviceProtoCasdCertificateResponse errorData](v12, "errorData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[NPKIDVRemoteDeviceProtoCasdCertificateResponse errorData](v12, "errorData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      NPKSecureUnarchiveObject(v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v8, "completion");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NPKIDVRemoteDeviceProtoCasdCertificateResponse casdCertificate](v12, "casdCertificate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v17)[2](v17, v18, v16);

  }
}

- (void)getCASDCertificateWithCompletion:(id)a3
{
  id v4;
  NPKIDVRemoteDeviceProtoCasdCertificateRequest *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(NPKIDVRemoteDeviceProtoCasdCertificateRequest);
  v6 = (void *)MEMORY[0x2199B6780](v4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__NPKIDVRemoteDeviceConnectionCoordinator_getCASDCertificateWithCompletion___block_invoke;
  v10[3] = &unk_24CFE7B80;
  v11 = v4;
  v7 = v4;
  v8 = (void *)MEMORY[0x2199B6780](v10);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v5, 15, CFSTR("getCASDCertificate"), v9);
}

void __76__NPKIDVRemoteDeviceConnectionCoordinator_getCASDCertificateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while retrieving CASD certificate. Error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)addNotificationWithType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NPKIDVRemoteDeviceProtoNotificationRequest *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  unint64_t v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a5;
  pk_Payment_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[NPKIDVRemoteDeviceConnectionCoordinator addNotificationWithType:documentType:issuerName:completion:]";
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }

  }
  v15 = objc_alloc_init(NPKIDVRemoteDeviceProtoNotificationRequest);
  -[NPKIDVRemoteDeviceProtoNotificationRequest setIssuerName:](v15, "setIssuerName:", v11);

  if (a3 <= 8)
    -[NPKIDVRemoteDeviceProtoNotificationRequest setNotificationType:](v15, "setNotificationType:", a3);
  if (a4 <= 2)
    -[NPKIDVRemoteDeviceProtoNotificationRequest setDocumentType:](v15, "setDocumentType:", (a4 - 1));
  v16 = (void *)MEMORY[0x2199B6780](v10);
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __102__NPKIDVRemoteDeviceConnectionCoordinator_addNotificationWithType_documentType_issuerName_completion___block_invoke;
  v23 = &unk_24CFE7A90;
  v24 = v10;
  v25 = a3;
  v17 = v10;
  v18 = (void *)MEMORY[0x2199B6780](&v20);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v16, v18, v20, v21, v22, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:queueIdentifier:requestItem:](self, "_sendRequest:withType:queueIdentifier:requestItem:", v15, 13, CFSTR("addExtendedNotification"), v19);
}

void __102__NPKIDVRemoteDeviceConnectionCoordinator_addNotificationWithType_documentType_issuerName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromNPKIDVRemoteDeviceNotificationType(*(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while adding notification type:%@ error:%@", (uint8_t *)&v9, 0x16u);

    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)addNotificationResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoNotificationResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoNotificationResponse *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315394;
      v19 = "-[NPKIDVRemoteDeviceConnectionCoordinator addNotificationResponse:]";
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v18, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoNotificationResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoNotificationResponse initWithData:](v10, "initWithData:", v11);

    -[NPKIDVRemoteDeviceProtoNotificationResponse errorData](v12, "errorData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[NPKIDVRemoteDeviceProtoNotificationResponse errorData](v12, "errorData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      NPKSecureUnarchiveObject(v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v8, "completion");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v17)[2](v17, v16);

  }
}

- (void)updateProofingConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest *v11;
  NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[NPKIDVRemoteDeviceConnectionCoordinator updateProofingConfiguration:completion:]";
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }

  }
  v11 = objc_alloc_init(NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest);
  v12 = v11;
  if (v6)
  {
    NPKSecureArchiveObject(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest setConfigurationData:](v12, "setConfigurationData:", v13);

  }
  else
  {
    -[NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest setConfigurationData:](v11, "setConfigurationData:", 0);
  }
  v14 = (void *)MEMORY[0x2199B6780](v7);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __82__NPKIDVRemoteDeviceConnectionCoordinator_updateProofingConfiguration_completion___block_invoke;
  v24[3] = &unk_24CFE7AB8;
  v25 = v6;
  v26 = v7;
  v15 = v7;
  v16 = v6;
  v17 = (void *)MEMORY[0x2199B6780](v24);
  -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v16, "credentialIdentifier");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = &stru_24CFF06D8;
  if (v20)
    v22 = (const __CFString *)v20;
  objc_msgSend(v19, "stringWithFormat:", CFSTR("updateProofingConfiguration-%@"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:priority:queueIdentifier:requestItem:timeout:](self, "_sendRequest:withType:priority:queueIdentifier:requestItem:timeout:", v12, 17, 200, v23, v18, *MEMORY[0x24BE4FD70]);
}

void __82__NPKIDVRemoteDeviceConnectionCoordinator_updateProofingConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while updating proofing configuration:%@. Error:%@", (uint8_t *)&v9, 0x16u);
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)updateProofingConfigurationResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NPKIDVRemoteDeviceProtoUpdateProofingConfigurationResponse *v10;
  void *v11;
  NPKIDVRemoteDeviceProtoUpdateProofingConfigurationResponse *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315394;
      v19 = "-[NPKIDVRemoteDeviceConnectionCoordinator updateProofingConfigurationResponse:]";
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v18, 0x16u);
    }

  }
  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoUpdateProofingConfigurationResponse alloc];
    objc_msgSend(v4, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NPKIDVRemoteDeviceProtoUpdateProofingConfigurationResponse initWithData:](v10, "initWithData:", v11);

    -[NPKIDVRemoteDeviceProtoUpdateProofingConfigurationResponse errorData](v12, "errorData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[NPKIDVRemoteDeviceProtoUpdateProofingConfigurationResponse errorData](v12, "errorData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      NPKSecureUnarchiveObject(v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v8, "completion");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v17)[2](v17, v16);

  }
}

- (void)handleHeartbeats:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NPKIDVRemoteDeviceProtoHeartbeatRequest *v12;
  void *v13;
  NPKIDVRemoteDeviceProtoHeartbeatRequest *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  char *v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[NPKIDVRemoteDeviceConnectionCoordinator handleHeartbeats:service:account:fromID:context:]";
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s request:%@", buf, 0x16u);
    }

  }
  v12 = [NPKIDVRemoteDeviceProtoHeartbeatRequest alloc];
  objc_msgSend(v8, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NPKIDVRemoteDeviceProtoHeartbeatRequest initWithData:](v12, "initWithData:", v13);

  pk_Payment_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKIDVRemoteDeviceProtoHeartbeatRequest inProgressResponseIdentifiers](v14, "inProgressResponseIdentifiers");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Received heartbeat for response identifiers:%@", buf, 0xCu);

    }
  }
  -[NPKIDVRemoteDeviceProtoHeartbeatRequest inProgressResponseIdentifiers](v14, "inProgressResponseIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __91__NPKIDVRemoteDeviceConnectionCoordinator_handleHeartbeats_service_account_fromID_context___block_invoke;
  v20[3] = &unk_24CFE8260;
  v20[4] = self;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v20);

}

uint64_t __91__NPKIDVRemoteDeviceConnectionCoordinator_handleHeartbeats_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_safeQueue_resetCleanupTimerForOutstandingRequestItemWithMessageIdentifier:", a2);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NPKIDVRemoteDeviceConnectionCoordinator *v9;

  v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__NPKIDVRemoteDeviceConnectionCoordinator_addObserver___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(observerQueue, v7);

}

uint64_t __55__NPKIDVRemoteDeviceConnectionCoordinator_addObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Register observer:%@ at:%@", (uint8_t *)&v8, 0x16u);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NPKIDVRemoteDeviceConnectionCoordinator *v9;

  v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__NPKIDVRemoteDeviceConnectionCoordinator_removeObserver___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(observerQueue, v7);

}

uint64_t __58__NPKIDVRemoteDeviceConnectionCoordinator_removeObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Remove observer:%@ at:%@", (uint8_t *)&v8, 0x16u);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: IDS service accounts changed: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: IDS service devices changed: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  pk_Payment_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138413314;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: IDS service incoming unhandled protobuf: %@ %@ %@ %@ %@", (uint8_t *)&v19, 0x34u);
    }

  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *IDSMessagesQueue;
  _QWORD block[5];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v8 = a6;
  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  pk_Payment_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      v29 = 1024;
      v30 = v8;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: IDS service did send with success: %@ %@ %@ %d %@", buf, 0x30u);
    }

  }
  if (!v8)
  {
    IDSMessagesQueue = self->_IDSMessagesQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __95__NPKIDVRemoteDeviceConnectionCoordinator_service_account_identifier_didSendWithSuccess_error___block_invoke;
    block[3] = &unk_24CFE8288;
    block[4] = self;
    v21 = v14;
    v22 = v15;
    dispatch_async(IDSMessagesQueue, block);

  }
}

void __95__NPKIDVRemoteDeviceConnectionCoordinator_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_safeQueue_outstandingRequestItemWithMessageIdentifier:remove:", *(_QWORD *)(a1 + 40), 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v4, "errorHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 48));

  }
}

- (id)_outstandingRequestItemWithCompletion:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem initWithtimeoutQueue:]([NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem alloc], "initWithtimeoutQueue:", self->_IDSMessagesQueue);
  -[NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem setCompletion:](v8, "setCompletion:", v7);

  -[NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem setErrorHandler:](v8, "setErrorHandler:", v6);
  return v8;
}

- (void)_sendRequest:(id)a3 withType:(unsigned __int16)a4 queueIdentifier:(id)a5 requestItem:(id)a6
{
  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:priority:queueIdentifier:requestItem:](self, "_sendRequest:withType:priority:queueIdentifier:requestItem:", a3, a4, 200, a5, a6);
}

- (void)_sendRequest:(id)a3 withType:(unsigned __int16)a4 priority:(int64_t)a5 queueIdentifier:(id)a6 requestItem:(id)a7
{
  -[NPKIDVRemoteDeviceConnectionCoordinator _sendRequest:withType:priority:queueIdentifier:requestItem:timeout:](self, "_sendRequest:withType:priority:queueIdentifier:requestItem:timeout:", a3, a4, a5, a6, a7, 30.0);
}

- (void)_sendRequest:(id)a3 withType:(unsigned __int16)a4 priority:(int64_t)a5 queueIdentifier:(id)a6 requestItem:(id)a7 timeout:(double)a8
{
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  IDSService *remoteDeviceIDSService;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *IDSMessagesQueue;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD block[4];
  id v37;
  NPKIDVRemoteDeviceConnectionCoordinator *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id location;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  const __CFString *v51;
  _QWORD v52[4];
  _QWORD v53[7];

  v11 = a4;
  v53[4] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc(MEMORY[0x24BE4FE40]);
  v34 = v13;
  objc_msgSend(v13, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithProtobufData:type:isResponse:", v17, v11, 0);

  v19 = *MEMORY[0x24BE4FB18];
  v52[0] = *MEMORY[0x24BE4FB30];
  v52[1] = v19;
  v53[0] = &unk_24D0566B0;
  v53[1] = v14;
  v20 = *MEMORY[0x24BE4FA78];
  v52[2] = *MEMORY[0x24BE4FAC0];
  v52[3] = v20;
  v53[2] = MEMORY[0x24BDBD1C8];
  v53[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    pk_Payment_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v18, "npkDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v47 = v24;
      v48 = 2112;
      v49 = v14;
      v50 = 2112;
      v51 = CFSTR("com.apple.private.alloy.applepay.identitycredential");
      _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Sending protobuf:%@ queueIdentifier:%@ serviceIdentifier:%@", buf, 0x20u);

    }
  }
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v15);
  remoteDeviceIDSService = self->_remoteDeviceIDSService;
  objc_msgSend(v15, "errorHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NPKProtoSendWithOptions(remoteDeviceIDSService, v18, a5, 0, 1, v26, v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setMessageIdentifier:", v27);
  v28 = MEMORY[0x24BDAC760];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __110__NPKIDVRemoteDeviceConnectionCoordinator__sendRequest_withType_priority_queueIdentifier_requestItem_timeout___block_invoke;
  v42[3] = &unk_24CFE82B0;
  objc_copyWeak(&v43, &location);
  objc_copyWeak(&v44, (id *)buf);
  objc_msgSend(v15, "setTimeoutHandler:", v42);
  objc_msgSend(v15, "setOrResetCleanupTimer");
  IDSMessagesQueue = self->_IDSMessagesQueue;
  block[0] = v28;
  block[1] = 3221225472;
  block[2] = __110__NPKIDVRemoteDeviceConnectionCoordinator__sendRequest_withType_priority_queueIdentifier_requestItem_timeout___block_invoke_149;
  block[3] = &unk_24CFE82D8;
  v37 = v27;
  v38 = self;
  v39 = v15;
  v40 = v18;
  v41 = v14;
  v30 = v14;
  v31 = v18;
  v32 = v15;
  v33 = v27;
  dispatch_async(IDSMessagesQueue, block);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __110__NPKIDVRemoteDeviceConnectionCoordinator__sendRequest_withType_priority_queueIdentifier_requestItem_timeout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    objc_msgSend(WeakRetained, "messageIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      pk_Payment_log();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (v6)
      {
        pk_Payment_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "messageIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412290;
          v15 = v8;
          _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Timeout timer trigger for message with identifier %@", (uint8_t *)&v14, 0xCu);

        }
      }
      v9 = (void *)v3[3];
      objc_msgSend(WeakRetained, "messageIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", v10);

    }
  }
  objc_msgSend(WeakRetained, "errorHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(WeakRetained, "errorHandler");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    NPKIDVRemoteDeviceSessionError(-500, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v12, v13);

  }
}

void __110__NPKIDVRemoteDeviceConnectionCoordinator__sendRequest_withType_priority_queueIdentifier_requestItem_timeout___block_invoke_149(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_Payment_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 56), "npkDescription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(a1 + 64);
        v7 = 138412546;
        v8 = v5;
        v9 = 2112;
        v10 = v6;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Fail to send protobuf:%@ queueIdentifier:%@", (uint8_t *)&v7, 0x16u);

      }
    }
  }
}

- (id)_safeQueue_outstandingRequestItemWithMessageIdentifier:(id)a3 remove:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  _BOOL4 v16;
  int v18;
  id v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_IDSMessagesQueue);
  if (!v6)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        v12 = "Error: NPKIDVRemoteDeviceService: Missing IDS Message identifier";
        v13 = v11;
        v14 = 2;
LABEL_11:
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v18, v14);
      }
LABEL_12:

    }
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outstandingRequestItems, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v18 = 138412290;
        v19 = v6;
        v12 = "Error: NPKIDVRemoteDeviceService: Could not find completion handler for received Message Identifier:%@";
        v13 = v11;
        v14 = 12;
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "invalidateCleanupTimer");
    -[NSMutableDictionary removeObjectForKey:](self->_outstandingRequestItems, "removeObjectForKey:", v6);
  }
LABEL_14:

  return v8;
}

- (void)_safeQueue_resetCleanupTimerForOutstandingRequestItemWithMessageIdentifier:(id)a3
{
  id v3;

  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemWithMessageIdentifier:remove:](self, "_safeQueue_outstandingRequestItemWithMessageIdentifier:remove:", a3, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOrResetCleanupTimer");

}

- (id)_safeQueue_outstandingRequestItemForIDSProtobuf:(id)a3
{
  return -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemForIDSProtobuf:remove:](self, "_safeQueue_outstandingRequestItemForIDSProtobuf:remove:", a3, 1);
}

- (id)_safeQueue_outstandingRequestItemForIDSProtobuf:(id)a3 remove:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  objc_msgSend(a3, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "incomingResponseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKIDVRemoteDeviceConnectionCoordinator _safeQueue_outstandingRequestItemWithMessageIdentifier:remove:](self, "_safeQueue_outstandingRequestItemWithMessageIdentifier:remove:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_outstandingRequestItems, 0);
  objc_storeStrong((id *)&self->_IDSMessagesQueue, 0);
  objc_storeStrong((id *)&self->_remoteDeviceIDSService, 0);
}

@end
