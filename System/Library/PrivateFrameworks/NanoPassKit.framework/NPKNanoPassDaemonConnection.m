@implementation NPKNanoPassDaemonConnection

- (NPKNanoPassDaemonConnection)init
{
  NPKNanoPassDaemonConnection *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  PKXPCService *remoteService;
  objc_super v11;
  uint8_t buf[4];
  NPKNanoPassDaemonConnection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)NPKNanoPassDaemonConnection;
  v2 = -[NPKNanoPassDaemonConnection init](&v11, sel_init);
  if (v2)
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v2;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] New connection created: %@", buf, 0xCu);
      }

    }
    v6 = objc_alloc(MEMORY[0x24BE6EF78]);
    NPKNanoPassDaemonConnectionProtocolInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.NPKNanoPassDaemonConnection.XPC"), v7, 0, 0);
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v8;

    -[PKXPCService setDelegate:](v2->_remoteService, "setDelegate:", v2);
    -[PKXPCService setForceConnectionOnResume:](v2->_remoteService, "setForceConnectionOnResume:", 1);
  }
  return v2;
}

- (void)handleMetadataRequestOnPairedDevice:(id)a3 withAssociatedApplicationIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  NPKNanoPassDaemonConnection *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = a4;
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      pk_General_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection handleMetadataRequestOnPairedDevice %@", buf, 0xCu);
      }

    }
    v14 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __115__NPKNanoPassDaemonConnection_handleMetadataRequestOnPairedDevice_withAssociatedApplicationIdentifiers_completion___block_invoke;
    v21[3] = &unk_24CFE7B00;
    v15 = v9;
    v22 = v15;
    -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __115__NPKNanoPassDaemonConnection_handleMetadataRequestOnPairedDevice_withAssociatedApplicationIdentifiers_completion___block_invoke_2;
    v17[3] = &unk_24CFE7FC8;
    v18 = v8;
    v19 = self;
    v20 = v15;
    objc_msgSend(v16, "handleMetadataRequestOnPairedDevice:withAssociatedApplicationIdentifiers:completion:", v18, v10, v17);

  }
}

void __115__NPKNanoPassDaemonConnection_handleMetadataRequestOnPairedDevice_withAssociatedApplicationIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __115__NPKNanoPassDaemonConnection_handleMetadataRequestOnPairedDevice_withAssociatedApplicationIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response (%@, %@) for request %@", (uint8_t *)&v11, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)handleApplicationRedirectRequestOnPairedDeviceForPaymentPass:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection applicationRedirectRequestOnPairDevice %@-%@", (uint8_t *)&v12, 0x16u);
    }

  }
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, &__block_literal_global_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleApplicationRedirectRequestOnPairedDeviceForPaymentPass:transaction:", v6, v7);

}

void __104__NPKNanoPassDaemonConnection_handleApplicationRedirectRequestOnPairedDeviceForPaymentPass_transaction___block_invoke()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  uint8_t v3[16];

  pk_General_log();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_213518000, v2, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v3, 2u);
    }

  }
}

- (void)canAcceptInvitationOnRemoteDeviceForInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  NPKNanoPassDaemonConnection *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
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
      v11 = (void *)MEMORY[0x2199B6780](v7);
      *(_DWORD *)buf = 138412546;
      v24 = v6;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection canAcceptInvitationOnRemoteDeviceForInvitation: %@ completion: %@", buf, 0x16u);

    }
  }
  v12 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __89__NPKNanoPassDaemonConnection_canAcceptInvitationOnRemoteDeviceForInvitation_completion___block_invoke;
  v21[3] = &unk_24CFE7B00;
  v13 = v7;
  v22 = v13;
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __89__NPKNanoPassDaemonConnection_canAcceptInvitationOnRemoteDeviceForInvitation_completion___block_invoke_34;
  v17[3] = &unk_24CFE8030;
  v19 = self;
  v20 = v13;
  v18 = v6;
  v15 = v13;
  v16 = v6;
  objc_msgSend(v14, "canAcceptInvitationOnRemoteDeviceForInvitation:completion:", v16, v17);

}

void __89__NPKNanoPassDaemonConnection_canAcceptInvitationOnRemoteDeviceForInvitation_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v7, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
}

void __89__NPKNanoPassDaemonConnection_canAcceptInvitationOnRemoteDeviceForInvitation_completion___block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("NO");
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138412802;
      if ((_DWORD)a2)
        v9 = CFSTR("YES");
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response (%@, %@) for invitation %@", (uint8_t *)&v12, 0x20u);
    }

  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);

}

- (void)startSubcredentialProvisioningOnRemoteDeviceForInvitation:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection startSubcredentialProvisioningOnRemoteDeviceForInvitation: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, &__block_literal_global_40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startSubcredentialProvisioningOnRemoteDeviceForInvitation:", v4);

}

void __89__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnRemoteDeviceForInvitation___block_invoke()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  uint8_t v3[16];

  pk_General_log();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_213518000, v2, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v3, 2u);
    }

  }
}

- (void)startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress:(id)a3 activationCode:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
      v12 = 138478083;
      v13 = v6;
      v14 = 2113;
      v15 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress: %{private}@, activationCode: %{private}@", (uint8_t *)&v12, 0x16u);
    }

  }
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, &__block_literal_global_41);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress:activationCode:", v6, v7);

}

void __108__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnRemoteDeviceForMailboxAddress_activationCode___block_invoke()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  uint8_t v3[16];

  pk_General_log();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_213518000, v2, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v3, 2u);
    }

  }
}

- (void)startSubcredentialProvisioningOnLocalDeviceMatchingInvitation:(id)a3 shouldFetchAnonymizationSaltFromRemoteDevice:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  NPKNanoPassDaemonConnection *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v14 = (void *)MEMORY[0x2199B6780](v9);
      *(_DWORD *)buf = 138412802;
      v27 = v8;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection startSubcredentialProvisioningOnLocalDeviceMatchingInvitation: %@ shouldFetchAnonymizationSaltFromRemoteDevice: %@ completion: %@", buf, 0x20u);

    }
  }
  v15 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __149__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke;
  v24[3] = &unk_24CFE7B00;
  v16 = v9;
  v25 = v16;
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __149__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke_42;
  v20[3] = &unk_24CFE8098;
  v22 = self;
  v23 = v16;
  v21 = v8;
  v18 = v16;
  v19 = v8;
  objc_msgSend(v17, "startSubcredentialProvisioningOnLocalDeviceMatchingInvitation:shouldFetchAnonymizationSaltFromRemoteDevice:completion:", v19, v6, v20);

}

void __149__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v7, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
}

void __149__NPKNanoPassDaemonConnection_startSubcredentialProvisioningOnLocalDeviceMatchingInvitation_shouldFetchAnonymizationSaltFromRemoteDevice_completion___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response (%@, %@) for invitation %@", (uint8_t *)&v11, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)addRemoteDevicePendingProvisionings:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection addRemoteDevicePendingProvisionings: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, &__block_literal_global_44);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addRemoteDevicePendingProvisionings:", v4);

}

void __67__NPKNanoPassDaemonConnection_addRemoteDevicePendingProvisionings___block_invoke()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  uint8_t v3[16];

  pk_General_log();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_213518000, v2, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v3, 2u);
    }

  }
}

- (void)noteWillDeleteAccountsSynchronous:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  _BOOL4 v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v4;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection stated noteWillDeleteAccountsSynchronous: %d", buf, 8u);
    }

  }
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__NPKNanoPassDaemonConnection_noteWillDeleteAccountsSynchronous_completion___block_invoke;
  v17[3] = &unk_24CFE7B00;
  v11 = v6;
  v18 = v11;
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", v4, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __76__NPKNanoPassDaemonConnection_noteWillDeleteAccountsSynchronous_completion___block_invoke_45;
  v14[3] = &unk_24CFE80E0;
  v16 = v4;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "noteWillDeleteAccountsWithCompletion:", v14);

}

uint64_t __76__NPKNanoPassDaemonConnection_noteWillDeleteAccountsSynchronous_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t result;
  uint8_t v6[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v6, 2u);
    }

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __76__NPKNanoPassDaemonConnection_noteWillDeleteAccountsSynchronous_completion___block_invoke_45(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  uint64_t result;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 48);
      v7[0] = 67109120;
      v7[1] = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection finished noteWillDeleteAccountsSynchronous: %d", (uint8_t *)v7, 8u);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)identityPassPrearmStatusSynchronous:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  _BOOL4 v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v19 = v4;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started identityPassPrearmStatusSynchronous %d", buf, 8u);
    }

  }
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__NPKNanoPassDaemonConnection_identityPassPrearmStatusSynchronous_completion___block_invoke;
  v16[3] = &unk_24CFE7B00;
  v11 = v6;
  v17 = v11;
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", v4, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __78__NPKNanoPassDaemonConnection_identityPassPrearmStatusSynchronous_completion___block_invoke_46;
  v14[3] = &unk_24CFE8108;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "identityPassPrearmStatusWithCompletion:", v14);

}

uint64_t __78__NPKNanoPassDaemonConnection_identityPassPrearmStatusSynchronous_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v6[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v6, 2u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__NPKNanoPassDaemonConnection_identityPassPrearmStatusSynchronous_completion___block_invoke_46(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKIDVDeviceCredentialPrearmStatus(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Received identity Pass Prearm status: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)addUserNotificationOfType:(unint64_t)a3 passUniqueID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  NPKNanoPassDaemonConnection *v21;
  id v22;
  unint64_t v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKNanoPassbookUserNotificationType(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v13;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started addUserNotificationOfType: %@, pass unique ID: %@", buf, 0x16u);

    }
  }
  v14 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __81__NPKNanoPassDaemonConnection_addUserNotificationOfType_passUniqueID_completion___block_invoke;
  v24[3] = &unk_24CFE7B00;
  v15 = v9;
  v25 = v15;
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __81__NPKNanoPassDaemonConnection_addUserNotificationOfType_passUniqueID_completion___block_invoke_48;
  v19[3] = &unk_24CFE8130;
  v22 = v15;
  v23 = a3;
  v20 = v8;
  v21 = self;
  v17 = v15;
  v18 = v8;
  objc_msgSend(v16, "addUserNotificationOfType:passUniqueID:completion:", a3, v18, v19);

}

void __81__NPKNanoPassDaemonConnection_addUserNotificationOfType_passUniqueID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v7, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __81__NPKNanoPassDaemonConnection_addUserNotificationOfType_passUniqueID_completion___block_invoke_48(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKNanoPassbookUserNotificationType(a1[7]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[4];
      v10 = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection finished addUserNotificationOfType: %@, passUniqueID: %@, error?: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  v9 = a1[6];
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

- (void)canNotifyAboutExpressModeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
      v8 = (void *)MEMORY[0x2199B6780](v4);
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started canNotifyAboutExpressModeWithCompletion %@", buf, 0xCu);

    }
  }
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__NPKNanoPassDaemonConnection_canNotifyAboutExpressModeWithCompletion___block_invoke;
  v15[3] = &unk_24CFE7B00;
  v10 = v4;
  v16 = v10;
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __71__NPKNanoPassDaemonConnection_canNotifyAboutExpressModeWithCompletion___block_invoke_50;
  v13[3] = &unk_24CFE7B58;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "canNotifyAboutExpressModeWithCompletion:", v13);

}

void __71__NPKNanoPassDaemonConnection_canNotifyAboutExpressModeWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v6, 2u);
    }

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5 != 0);

  }
}

uint64_t __71__NPKNanoPassDaemonConnection_canNotifyAboutExpressModeWithCompletion___block_invoke_50(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t result;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      if ((_DWORD)a2)
        v7 = CFSTR("YES");
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response with canNotify: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)fetchRelevantPassInformationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
      v8 = (void *)MEMORY[0x2199B6780](v4);
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started fetchRelevantPassInformationWithCompletion %@", buf, 0xCu);

    }
  }
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__NPKNanoPassDaemonConnection_fetchRelevantPassInformationWithCompletion___block_invoke;
  v15[3] = &unk_24CFE7B00;
  v10 = v4;
  v16 = v10;
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __74__NPKNanoPassDaemonConnection_fetchRelevantPassInformationWithCompletion___block_invoke_52;
  v13[3] = &unk_24CFE8158;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "fetchRelevantPassInformationWithCompletion:", v13);

}

void __74__NPKNanoPassDaemonConnection_fetchRelevantPassInformationWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v6, 2u);
    }

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __74__NPKNanoPassDaemonConnection_fetchRelevantPassInformationWithCompletion___block_invoke_52(uint64_t a1, void *a2)
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
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response with relevantPassInformation: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v3, 0);

}

- (void)insertBridgeBulletinWithTitle:(id)a3 message:(id)a4 actionURL:(id)a5 forPass:(id)a6 playSound:(BOOL)a7 notificationIdentifier:(id)a8 expirationDate:(id)a9
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  uint8_t buf[16];

  v10 = a7;
  v16 = a9;
  v17 = a8;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  pk_General_log();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

  if (v23)
  {
    pk_General_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started insertBridgeBulletinWithTitle:message:actionURL:forPass:playSound:notificationIdentifier:expirationDate:", buf, 2u);
    }

  }
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, &__block_literal_global_54);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "insertBridgeBulletinWithTitle:message:actionURL:forPass:playSound:notificationIdentifier:expirationDate:", v21, v20, v19, v18, v10, v17, v16);

}

void __135__NPKNanoPassDaemonConnection_insertBridgeBulletinWithTitle_message_actionURL_forPass_playSound_notificationIdentifier_expirationDate___block_invoke()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  uint8_t v3[16];

  pk_General_log();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_213518000, v2, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v3, 2u);
    }

  }
}

- (void)fetchIdentityProofingConfigurationForCountry:(id)a3 state:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  pk_General_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x2199B6780](v8);
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection started fetchIdentityProofingConfigurationForCountry:state:completion %@", buf, 0xCu);

    }
  }
  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __93__NPKNanoPassDaemonConnection_fetchIdentityProofingConfigurationForCountry_state_completion___block_invoke;
  v21[3] = &unk_24CFE7B00;
  v16 = v8;
  v22 = v16;
  -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:](self, "_remoteObjectProxySynchronous:withFailureHandler:", 0, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __93__NPKNanoPassDaemonConnection_fetchIdentityProofingConfigurationForCountry_state_completion___block_invoke_55;
  v19[3] = &unk_24CFE81A0;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "fetchIdentityProofingConfigurationForCountry:state:completion:", v10, v9, v19);

}

void __93__NPKNanoPassDaemonConnection_fetchIdentityProofingConfigurationForCountry_state_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: [NanoPassdXPC] Failed to create remoteObjectProxy", v7, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
}

void __93__NPKNanoPassDaemonConnection_fetchIdentityProofingConfigurationForCountry_state_completion___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Connection got response with configuration: %@, error: %@", (uint8_t *)&v11, 0x16u);
    }

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (id)_remoteObjectProxySynchronous:(BOOL)a3 withFailureHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[NPKNanoPassDaemonConnection remoteService](self, "remoteService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKNanoPassDaemonConnection _errorHandlerWithCompletion:](self, "_errorHandlerWithCompletion:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  else
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v8);
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
        v14 = 136446978;
        v15 = "-[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:]";
        v16 = 2082;
        v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKNanoPassDaemonConnection.m";
        v18 = 2048;
        v19 = 282;
        v20 = 1024;
        v21 = v4;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: -[NPKNanoPassDaemonConnection _remoteObjectProxySynchronous:withFailureHandler:] (synchronous:%d) would have returned nil)", (uint8_t *)&v14, 0x26u);
      }

    }
    _NPKAssertAbort();
  }

  return v9;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__NPKNanoPassDaemonConnection__errorHandlerWithCompletion___block_invoke;
  v8[3] = &unk_24CFE7B80;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x2199B6780](v8);
  v6 = (void *)MEMORY[0x2199B6780]();

  return v6;
}

void __59__NPKNanoPassDaemonConnection__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Error on NPKNanoPassDaemonConnection connection: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (void)remoteService:(id)a3 didEstablishConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Service %@ didEstablishConnection: %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Service %@ didInterruptConnection: %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)remoteServiceDidResume:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Service didResume: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)remoteServiceDidSuspend:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NanoPassdXPC] Service didSuspend: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (PKXPCService)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
  objc_storeStrong((id *)&self->_remoteService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
