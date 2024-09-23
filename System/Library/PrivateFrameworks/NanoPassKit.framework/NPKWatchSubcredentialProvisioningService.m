@implementation NPKWatchSubcredentialProvisioningService

- (NPKWatchSubcredentialProvisioningService)init
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v7[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Expected to instantiate NPKWatchSubcredentialProvisioningService on watch.", v7, 2u);
    }

  }
  return 0;
}

- (void)registerProtobufActionsForService:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setProtobufAction:forIncomingResponsesOfType:", sel_canAcceptInvitationOnRemoteDeviceResponse_, 73);
  objc_msgSend(v3, "setProtobufAction:forIncomingResponsesOfType:", sel_fetchAccountAttestationAnonymizationSaltResponse_, 74);

}

- (void)sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  NPKWatchSubcredentialProvisioningService *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x2199B6780](v7);
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending can accept invitation on remote device request with completion: %@", buf, 0x16u);

    }
  }
  objc_initWeak((id *)buf, self);
  -[NPKSubcredentialProvisioningService subcredentialProvisioningQueue](self, "subcredentialProvisioningQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __113__NPKWatchSubcredentialProvisioningService_sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation_completion___block_invoke;
  v17[3] = &unk_24CFE9900;
  objc_copyWeak(&v21, (id *)buf);
  v19 = self;
  v20 = v7;
  v18 = v6;
  v15 = v7;
  v16 = v6;
  dispatch_async(v14, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __113__NPKWatchSubcredentialProvisioningService_sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NPKProtoCanAcceptInvitationRequest *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_alloc_init(NPKProtoCanAcceptInvitationRequest);
  NPKSecureArchiveObject(*(void **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCanAcceptInvitationRequest setInvitationData:](v3, "setInvitationData:", v4);

  v5 = objc_alloc(MEMORY[0x24BE4FE40]);
  -[NPKProtoCanAcceptInvitationRequest data](v3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithProtobufData:type:isResponse:", v6, 73, 0);

  objc_msgSend(WeakRetained, "sendProtobuf:responseExpected:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = MEMORY[0x2199B6780](*(_QWORD *)(a1 + 48));
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __113__NPKWatchSubcredentialProvisioningService_sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation_completion___block_invoke_2;
    v18[3] = &unk_24CFE98D8;
    v20 = *(id *)(a1 + 48);
    v18[4] = WeakRetained;
    v10 = v8;
    v19 = v10;
    v11 = (void *)MEMORY[0x2199B6780](v18);
    v12 = *(void **)(a1 + 40);
    v13 = (void *)MEMORY[0x2199B6780](v9);
    objc_msgSend(v12, "trackOutstandingRequestWithMessageIdentifier:completionHandler:errorHandler:", v10, v13, v11);

  }
  else
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (!v15)
      goto LABEL_4;
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: %{public}@: No message identifier for protobuf %@", buf, 0x16u);

    }
  }

LABEL_4:
}

void __113__NPKWatchSubcredentialProvisioningService_sendCanAcceptInvitationOnRemoteDeviceRequestForInvitation_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  else
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 40);
        v10 = 138543618;
        v11 = v8;
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: No response expected for message with identifier %@", (uint8_t *)&v10, 0x16u);

      }
    }
  }
}

- (void)canAcceptInvitationOnRemoteDeviceResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NPKProtoCanAcceptInvitationResponse *v15;
  void *v16;
  NPKProtoCanAcceptInvitationResponse *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  os_log_type_t v30;
  NSObject *v31;
  _BOOL4 v32;
  objc_class *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
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
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "npkDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v9;
      v36 = 2112;
      v37 = v10;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Received canAcceptInvitationOnRemoteDeviceResponse: incoming protobuf %@", (uint8_t *)&v34, 0x16u);

    }
  }
  objc_msgSend(v4, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "incomingResponseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    pk_Payment_log();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (v24)
    {
      pk_Payment_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v27;
        v28 = "Error: %{public}@: No associated message ID in response";
        v29 = v25;
        v30 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl(&dword_213518000, v29, v30, v28, (uint8_t *)&v34, 0xCu);

      }
LABEL_16:

    }
LABEL_17:
    v19 = 0;
    v22 = 0;
    goto LABEL_18;
  }
  -[NPKSubcredentialProvisioningService outstandingRequests](self, "outstandingRequests");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    pk_Payment_log();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

    if (v32)
    {
      pk_Payment_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v27;
        v28 = "Warning: %{public}@: Got response with no associated message handler";
        v29 = v25;
        v30 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v15 = [NPKProtoCanAcceptInvitationResponse alloc];
  objc_msgSend(v4, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NPKProtoCanAcceptInvitationResponse initWithData:](v15, "initWithData:", v16);

  -[NPKSubcredentialProvisioningService outstandingRequests](self, "outstandingRequests");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v12);

  objc_msgSend(v14, "completionHandler");
  v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NPKProtoCanAcceptInvitationResponse errorData](v17, "errorData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  NPKSecureUnarchiveObject(v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    ((void (**)(_QWORD, BOOL, void *))v19)[2](v19, v22 == 0, v22);
LABEL_18:

}

- (void)sendAcceptSubcredentialProvisioningRequestForInvitation:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending subcredential provisioning request for invitation: %@", buf, 0x16u);

    }
  }
  objc_initWeak((id *)buf, self);
  -[NPKSubcredentialProvisioningService subcredentialProvisioningQueue](self, "subcredentialProvisioningQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __109__NPKWatchSubcredentialProvisioningService_sendAcceptSubcredentialProvisioningRequestForInvitation_metadata___block_invoke;
  block[3] = &unk_24CFE8650;
  objc_copyWeak(&v19, (id *)buf);
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  dispatch_async(v13, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __109__NPKWatchSubcredentialProvisioningService_sendAcceptSubcredentialProvisioningRequestForInvitation_metadata___block_invoke(void **a1)
{
  id WeakRetained;
  NPKProtoAcceptSubcredentialInvitationRequest *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = objc_alloc_init(NPKProtoAcceptSubcredentialInvitationRequest);
  NPKSecureArchiveObject(a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoAcceptSubcredentialInvitationRequest setInvitationData:](v3, "setInvitationData:", v4);

  NPKSecureArchiveObject(a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoAcceptSubcredentialInvitationRequest setMetadataData:](v3, "setMetadataData:", v5);

  v6 = objc_alloc(MEMORY[0x24BE4FE40]);
  -[NPKProtoAcceptSubcredentialInvitationRequest data](v3, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithProtobufData:type:isResponse:", v7, 122, 0);

  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1[4], "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("SubcredentialProvisioning"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *MEMORY[0x24BE4FB18];
  v24[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sendProtobuf:responseExpected:extraOptions:", v8, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v15)
    {
      pk_General_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v18;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_ERROR, "Error: %{public}@: No message identifier for protobuf %@", buf, 0x16u);

      }
    }
  }

}

- (void)sendAcceptSubcredentialProvisioningRequestForMailboxAddress:(id)a3 activationCode:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length") == 0;
  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    v16 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      pk_General_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v19;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_ERROR, "Error: %{public}@: Unable to initiate subcredential provisioning request for empty mailbox address", buf, 0xCu);

      }
    }
  }
  else
  {
    v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v25 = v14;
        v26 = 2113;
        v27 = v6;
        v28 = 2113;
        v29 = v7;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending subcredential provisioning request for mailbox address: %{private}@, activationCode: %{private}@", buf, 0x20u);

      }
    }
    objc_initWeak((id *)buf, self);
    -[NPKSubcredentialProvisioningService subcredentialProvisioningQueue](self, "subcredentialProvisioningQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __119__NPKWatchSubcredentialProvisioningService_sendAcceptSubcredentialProvisioningRequestForMailboxAddress_activationCode___block_invoke;
    block[3] = &unk_24CFE8650;
    objc_copyWeak(&v23, (id *)buf);
    v21 = v6;
    v22 = v7;
    dispatch_async(v15, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

void __119__NPKWatchSubcredentialProvisioningService_sendAcceptSubcredentialProvisioningRequestForMailboxAddress_activationCode___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NPKProtoAcceptSubcredentialInvitationWithMailboxAddressRequest *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_alloc_init(NPKProtoAcceptSubcredentialInvitationWithMailboxAddressRequest);
  -[NPKProtoAcceptSubcredentialInvitationWithMailboxAddressRequest setMailboxAddress:](v3, "setMailboxAddress:", *(_QWORD *)(a1 + 32));
  -[NPKProtoAcceptSubcredentialInvitationWithMailboxAddressRequest setActivationCode:](v3, "setActivationCode:", *(_QWORD *)(a1 + 40));
  v4 = objc_alloc(MEMORY[0x24BE4FE40]);
  -[NPKProtoAcceptSubcredentialInvitationWithMailboxAddressRequest data](v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithProtobufData:type:isResponse:", v5, 126, 0);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("SubcredentialProvisioning"), *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BE4FB18];
  v20[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sendProtobuf:responseExpected:extraOptions:", v6, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v14;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: %{public}@: No message identifier for protobuf %@", buf, 0x16u);

      }
    }
  }

}

- (void)fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x2199B6780](v4);
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending fetch account attestation anonymization salt request with completion: %@", buf, 0x16u);

    }
  }
  objc_initWeak((id *)buf, self);
  -[NPKSubcredentialProvisioningService subcredentialProvisioningQueue](self, "subcredentialProvisioningQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __113__NPKWatchSubcredentialProvisioningService_fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion___block_invoke;
  block[3] = &unk_24CFE9928;
  objc_copyWeak(&v15, (id *)buf);
  block[4] = self;
  v14 = v4;
  v12 = v4;
  dispatch_async(v11, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __113__NPKWatchSubcredentialProvisioningService_fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NPKProtoAccountAttestationAnonymizationSaltRequest *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_alloc_init(NPKProtoAccountAttestationAnonymizationSaltRequest);
  v4 = objc_alloc(MEMORY[0x24BE4FE40]);
  -[NPKProtoAccountAttestationAnonymizationSaltRequest data](v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithProtobufData:type:isResponse:", v5, 74, 0);

  v25 = *MEMORY[0x24BE4FB18];
  v26[0] = CFSTR("SubcredentialProvisioning");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sendProtobuf:responseExpected:extraOptions:", v6, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = MEMORY[0x2199B6780](*(_QWORD *)(a1 + 40));
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __113__NPKWatchSubcredentialProvisioningService_fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion___block_invoke_2;
    v18[3] = &unk_24CFE98D8;
    v20 = *(id *)(a1 + 40);
    v18[4] = WeakRetained;
    v10 = v8;
    v19 = v10;
    v11 = (void *)MEMORY[0x2199B6780](v18);
    v12 = *(void **)(a1 + 32);
    v13 = (void *)MEMORY[0x2199B6780](v9);
    objc_msgSend(v12, "trackOutstandingRequestWithMessageIdentifier:completionHandler:errorHandler:", v10, v13, v11);

  }
  else
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (!v15)
      goto LABEL_4;
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: %{public}@: No message identifier for protobuf %@", buf, 0x16u);

    }
  }

LABEL_4:
}

void __113__NPKWatchSubcredentialProvisioningService_fetchAccountAttestationAnonymizationSaltOnRemoteDeviceWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  else
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 40);
        v10 = 138543618;
        v11 = v8;
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: No response expected for message with identifier %@", (uint8_t *)&v10, 0x16u);

      }
    }
  }
}

- (void)fetchAccountAttestationAnonymizationSaltResponse:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NPKProtoAccountAttestationAnonymizationSaltResponse *v15;
  void *v16;
  NPKProtoAccountAttestationAnonymizationSaltResponse *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  os_log_type_t v31;
  NSObject *v32;
  _BOOL4 v33;
  objc_class *v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
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
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "npkDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v9;
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Received accountAttestationAnonymizationSaltResponse: incoming protobuf %@", (uint8_t *)&v35, 0x16u);

    }
  }
  objc_msgSend(v4, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "incomingResponseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    pk_Payment_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

    if (v25)
    {
      pk_Payment_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543362;
        v36 = v28;
        v29 = "Error: %{public}@: No associated message ID in response";
        v30 = v26;
        v31 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl(&dword_213518000, v30, v31, v29, (uint8_t *)&v35, 0xCu);

      }
LABEL_16:

    }
LABEL_17:
    v19 = 0;
    v20 = 0;
    v23 = 0;
    goto LABEL_18;
  }
  -[NPKSubcredentialProvisioningService outstandingRequests](self, "outstandingRequests");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    pk_Payment_log();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

    if (v33)
    {
      pk_Payment_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543362;
        v36 = v28;
        v29 = "Warning: %{public}@: Got response with no associated message handler";
        v30 = v26;
        v31 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v15 = [NPKProtoAccountAttestationAnonymizationSaltResponse alloc];
  objc_msgSend(v4, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NPKProtoAccountAttestationAnonymizationSaltResponse initWithData:](v15, "initWithData:", v16);

  -[NPKSubcredentialProvisioningService outstandingRequests](self, "outstandingRequests");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v12);

  objc_msgSend(v14, "completionHandler");
  v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NPKProtoAccountAttestationAnonymizationSaltResponse anonymizationSalt](v17, "anonymizationSalt");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoAccountAttestationAnonymizationSaltResponse errorData](v17, "errorData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_class();
  NPKSecureUnarchiveObject(v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    ((void (**)(_QWORD, void *, void *))v19)[2](v19, v20, v23);
LABEL_18:

}

@end
