@implementation NPKIDVRemoteDeviceSession

- (NPKIDVRemoteDeviceSession)init
{
  NPKIDVRemoteDeviceSession *v2;
  NPKIDVRemoteDeviceSession *v3;
  NSString *deviceID;
  id v5;
  void *v6;
  uint64_t v7;
  PKXPCService *remoteService;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NPKIDVRemoteDeviceSession;
  v2 = -[NPKIDVRemoteDeviceSession init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_deviceIDLock._os_unfair_lock_opaque = 0;
    deviceID = v2->_deviceID;
    v2->_deviceID = (NSString *)CFSTR("NPKIDVRemoteDeviceSessionInvalidDeviceID");
    v2->_status = 0;

    v5 = objc_alloc(MEMORY[0x24BE6EF78]);
    NPKIDVRemoteDeviceServiceSessionServerProtocolInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.NanoPassbook.IDVRemoteDeviceService.session.server"), v6, 0, v3);
    remoteService = v3->_remoteService;
    v3->_remoteService = (PKXPCService *)v7;

    -[PKXPCService setDelegate:](v3->_remoteService, "setDelegate:", v3);
    -[PKXPCService setForceConnectionOnResume:](v3->_remoteService, "setForceConnectionOnResume:", 1);
  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  NPKIDVRemoteDeviceSession *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[NPKIDVRemoteDeviceSession dealloc]";
      v9 = 2112;
      v10 = self;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s, %@", buf, 0x16u);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)NPKIDVRemoteDeviceSession;
  -[NPKIDVRemoteDeviceSession dealloc](&v6, sel_dealloc);
}

+ (void)sessionForDeviceID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__NPKIDVRemoteDeviceSession_sessionForDeviceID_completion___block_invoke;
  v10[3] = &unk_24CFEACC0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "_confirmRemoteDeviceID:withCompletion:", v7, v10);

}

void __59__NPKIDVRemoteDeviceSession_sessionForDeviceID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__NPKIDVRemoteDeviceSession_sessionForDeviceID_completion___block_invoke_2;
  block[3] = &unk_24CFE92B8;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __59__NPKIDVRemoteDeviceSession_sessionForDeviceID_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSString)deviceID
{
  os_unfair_lock_s *p_deviceIDLock;
  NSString *v4;

  p_deviceIDLock = &self->_deviceIDLock;
  os_unfair_lock_lock(&self->_deviceIDLock);
  v4 = self->_deviceID;
  os_unfair_lock_unlock(p_deviceIDLock);
  return v4;
}

- (void)setDeviceID:(id)a3
{
  NSString *v4;
  NSString *deviceID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  os_unfair_lock_lock(&self->_deviceIDLock);
  deviceID = self->_deviceID;
  self->_deviceID = v4;

  os_unfair_lock_unlock(&self->_deviceIDLock);
}

- (void)_confirmRemoteDeviceID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: requested confirm DeviceID:%@", buf, 0xCu);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67__NPKIDVRemoteDeviceSession__confirmRemoteDeviceID_withCompletion___block_invoke;
  v18[3] = &unk_24CFE7AB8;
  v19 = v6;
  v12 = v7;
  v20 = v12;
  v13 = v6;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __67__NPKIDVRemoteDeviceSession__confirmRemoteDeviceID_withCompletion___block_invoke_42;
  v16[3] = &unk_24CFEACE8;
  v16[4] = self;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v14, "confirmRemoteDeviceID:withCompletion:", v13, v16);

}

void __67__NPKIDVRemoteDeviceSession__confirmRemoteDeviceID_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error during deviceID:%@ check", (uint8_t *)&v8, 0xCu);
    }

  }
  v6 = *(_QWORD *)(a1 + 40);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

}

void __67__NPKIDVRemoteDeviceSession__confirmRemoteDeviceID_withCompletion___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish request confirmation DeviceID:%@, error:%@", (uint8_t *)&v12, 0x16u);
    }

  }
  v10 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v10, "invalidateSession");
    v11 = 0;
  }
  else
  {
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 32), "setDeviceID:", v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)credentialPreflightStatusForType:(unint64_t)a3 completion:(id)a4
{
  -[NPKIDVRemoteDeviceSession credentialPreflightStatusForType:minOSVersion:completion:](self, "credentialPreflightStatusForType:minOSVersion:completion:", a3, 0, a4);
}

- (void)credentialPreflightStatusForType:(unint64_t)a3 minOSVersion:(id)a4 completion:(id)a5
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
  _QWORD v18[5];
  id v19;
  unint64_t v20;
  _QWORD v21[4];
  id v22;
  unint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v13;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested credential preflight status for type:%@ minOSVersion:%@", buf, 0x16u);

    }
  }
  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __86__NPKIDVRemoteDeviceSession_credentialPreflightStatusForType_minOSVersion_completion___block_invoke;
  v21[3] = &unk_24CFE7A90;
  v23 = a3;
  v15 = v9;
  v22 = v15;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __86__NPKIDVRemoteDeviceSession_credentialPreflightStatusForType_minOSVersion_completion___block_invoke_44;
  v18[3] = &unk_24CFEAD10;
  v19 = v15;
  v20 = a3;
  v18[4] = self;
  v17 = v15;
  objc_msgSend(v16, "credentialPreflightStatusForType:minOSVersion:completion:", a3, v8, v18);

}

void __86__NPKIDVRemoteDeviceSession_credentialPreflightStatusForType_minOSVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
      NSStringFromNPKIDVRemoteDeviceCredentialType(*(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error request credential preflight status for type:%@ error:%@", (uint8_t *)&v10, 0x16u);

    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

}

void __86__NPKIDVRemoteDeviceSession_credentialPreflightStatusForType_minOSVersion_completion___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromNPKIDVRemoteDeviceCredentialType(*(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Finish request credential preflight status for type:%@ status:%@ error:%@", (uint8_t *)&v11, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)pairedWatchSEIDWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

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
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Received request for device SEID", buf, 2u);
    }

  }
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__NPKIDVRemoteDeviceSession_pairedWatchSEIDWithCompletion___block_invoke;
  v14[3] = &unk_24CFE7B80;
  v9 = v4;
  v15 = v9;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __59__NPKIDVRemoteDeviceSession_pairedWatchSEIDWithCompletion___block_invoke_46;
  v12[3] = &unk_24CFEAD38;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "pairedWatchSEIDWithCompletion:", v12);

}

void __59__NPKIDVRemoteDeviceSession_pairedWatchSEIDWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error during device SEID request: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

void __59__NPKIDVRemoteDeviceSession_pairedWatchSEIDWithCompletion___block_invoke_46(uint64_t a1, void *a2, void *a3)
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
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Request for device SEID: %@ deviceSEID complete with error: %@", (uint8_t *)&v10, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)provisionedCredentialCountForType:(unint64_t)a3 completion:(id)a4
{
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
  unint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v6 = a4;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Received request for provisioned credential count", buf, 2u);
    }

  }
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __74__NPKIDVRemoteDeviceSession_provisionedCredentialCountForType_completion___block_invoke;
  v17[3] = &unk_24CFE7B80;
  v11 = v6;
  v18 = v11;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __74__NPKIDVRemoteDeviceSession_provisionedCredentialCountForType_completion___block_invoke_47;
  v14[3] = &unk_24CFEAD60;
  v15 = v11;
  v16 = a3;
  v14[4] = self;
  v13 = v11;
  objc_msgSend(v12, "provisionedCredentialCountForType:completion:", a3, v14);

}

void __74__NPKIDVRemoteDeviceSession_provisionedCredentialCountForType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error during provisioned credential count request: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 0x7FFFFFFFFFFFFFFFLL, v8);

}

void __74__NPKIDVRemoteDeviceSession_provisionedCredentialCountForType_completion___block_invoke_47(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromNPKIDVRemoteDeviceCredentialType(*(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v9;
      v12 = 2048;
      v13 = a2;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Finished request for provisioned credential count of type:%@. Count:%lu error:%@", (uint8_t *)&v10, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchRemoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a3 completion:(id)a4
{
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
  unint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v6 = a4;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Received request for remote biometric authentication status", buf, 2u);
    }

  }
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __98__NPKIDVRemoteDeviceSession_fetchRemoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke;
  v17[3] = &unk_24CFE7B80;
  v11 = v6;
  v18 = v11;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __98__NPKIDVRemoteDeviceSession_fetchRemoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke_49;
  v14[3] = &unk_24CFEAD88;
  v15 = v11;
  v16 = a3;
  v14[4] = self;
  v13 = v11;
  objc_msgSend(v12, "fetchRemoteBiometricAuthenticationStatusForCredentialType:completion:", a3, v14);

}

void __98__NPKIDVRemoteDeviceSession_fetchRemoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error during remote biometric authentication status request: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

void __98__NPKIDVRemoteDeviceSession_fetchRemoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKIDVRemoteDeviceCredentialType(*(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("NO");
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      if ((_DWORD)a2)
        v10 = CFSTR("YES");
      v14 = v10;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finished request for remote biometric authentication status of type:%@. Trust lost:%@ error:%@", (uint8_t *)&v11, 0x20u);

    }
  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2);

}

- (void)registerForEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  NPKIDVRemoteDeviceSession *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  unint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v13;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested register for events:%@ with serviceName:%@", buf, 0x16u);

    }
  }
  v14 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __87__NPKIDVRemoteDeviceSession_registerForEvents_withRemoteProcessServiceName_completion___block_invoke;
  v24[3] = &unk_24CFEADB0;
  v27 = a3;
  v15 = v8;
  v25 = v15;
  v16 = v9;
  v26 = v16;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __87__NPKIDVRemoteDeviceSession_registerForEvents_withRemoteProcessServiceName_completion___block_invoke_55;
  v20[3] = &unk_24CFEADD8;
  v22 = self;
  v23 = v16;
  v21 = v15;
  v18 = v16;
  v19 = v15;
  objc_msgSend(v17, "registerForEvents:withRemoteProcessServiceName:completion:", a3, v19, v20);

}

void __87__NPKIDVRemoteDeviceSession_registerForEvents_withRemoteProcessServiceName_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a1[6]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[4];
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Error request register for events:%@ with serviceName:%@ error:%@", (uint8_t *)&v11, 0x20u);

    }
  }
  v9 = a1[5];
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, unint64_t, void *))(v9 + 16))(v9, 0xFFFFFFFF80000000, v10);

}

void __87__NPKIDVRemoteDeviceSession_registerForEvents_withRemoteProcessServiceName_completion___block_invoke_55(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish request register for events with currentEvents:%@ serviceName:%@ error:%@", (uint8_t *)&v11, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)unregisterFromEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  NPKIDVRemoteDeviceSession *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  unint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v13;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested unregister for events:%@ with serviceName:%@", buf, 0x16u);

    }
  }
  v14 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __90__NPKIDVRemoteDeviceSession_unregisterFromEvents_withRemoteProcessServiceName_completion___block_invoke;
  v24[3] = &unk_24CFEADB0;
  v27 = a3;
  v15 = v8;
  v25 = v15;
  v16 = v9;
  v26 = v16;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __90__NPKIDVRemoteDeviceSession_unregisterFromEvents_withRemoteProcessServiceName_completion___block_invoke_56;
  v20[3] = &unk_24CFEADD8;
  v22 = self;
  v23 = v16;
  v21 = v15;
  v18 = v16;
  v19 = v15;
  objc_msgSend(v17, "unregisterFromEvents:withRemoteProcessServiceName:completion:", a3, v19, v20);

}

void __90__NPKIDVRemoteDeviceSession_unregisterFromEvents_withRemoteProcessServiceName_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a1[6]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[4];
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Error request unregister for events:%@ with serviceName:%@ error:%@", (uint8_t *)&v11, 0x20u);

    }
  }
  v9 = a1[5];
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, unint64_t, void *))(v9 + 16))(v9, 0xFFFFFFFF80000000, v10);

}

void __90__NPKIDVRemoteDeviceSession_unregisterFromEvents_withRemoteProcessServiceName_completion___block_invoke_56(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish request unregister for events with currentEvents:%@ serviceName:%@ error:%@", (uint8_t *)&v11, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)configureWithPartition:(id)a3 ackHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested configure Credential store partitions:%@", buf, 0xCu);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__NPKIDVRemoteDeviceSession_configureWithPartition_ackHandler___block_invoke;
  v17[3] = &unk_24CFE7B80;
  v12 = v7;
  v18 = v12;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __63__NPKIDVRemoteDeviceSession_configureWithPartition_ackHandler___block_invoke_57;
  v15[3] = &unk_24CFEAE00;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "configureWithPartition:ackHandler:", v6, v15);

}

void __63__NPKIDVRemoteDeviceSession_configureWithPartition_ackHandler___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error configuring Credential store partitions with error:%@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void __63__NPKIDVRemoteDeviceSession_configureWithPartition_ackHandler___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  _BOOL4 v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (!v6)
      goto LABEL_10;
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v14 = 138412290;
    v15 = v3;
    v8 = "Error: NPKIDVRemoteDeviceService: Fail configure Credential store partitions with error:%@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 12;
    goto LABEL_8;
  }
  v12 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (!v12)
    goto LABEL_10;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    v8 = "Notice: NPKIDVRemoteDeviceService: Finish configure Credential store partitions";
    v9 = v7;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 2;
LABEL_8:
    _os_log_impl(&dword_213518000, v9, v10, v8, (uint8_t *)&v14, v11);
  }
LABEL_9:

LABEL_10:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5
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
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested create credential in partition:%@ with options:%@", buf, 0x16u);
    }

  }
  v14 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __76__NPKIDVRemoteDeviceSession_createCredentialInPartition_options_completion___block_invoke;
  v20[3] = &unk_24CFE7B80;
  v15 = v10;
  v21 = v15;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __76__NPKIDVRemoteDeviceSession_createCredentialInPartition_options_completion___block_invoke_58;
  v18[3] = &unk_24CFEAD38;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "createCredentialInPartition:options:completion:", v8, v9, v18);

}

void __76__NPKIDVRemoteDeviceSession_createCredentialInPartition_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error creating Credential In Partition with error:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

void __76__NPKIDVRemoteDeviceSession_createCredentialInPartition_options_completion___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v6;
        v11 = "Error: NPKIDVRemoteDeviceService: Fail create credential in partition with error:%@";
        v12 = v10;
        v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_213518000, v12, v13, v11, (uint8_t *)&v15, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v5;
        v11 = "Notice: NPKIDVRemoteDeviceService: Finish create credential in partition with identifier:%@";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:

    }
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);

}

- (void)generateKeySigningKeyForCredential:(id)a3 completion:(id)a4
{
  -[NPKIDVRemoteDeviceSession _generateKeyWithType:credentialIdentifier:completion:](self, "_generateKeyWithType:credentialIdentifier:completion:", 1, a3, a4);
}

- (void)generateDeviceEncryptionKeyForCredential:(id)a3 completion:(id)a4
{
  -[NPKIDVRemoteDeviceSession _generateKeyWithType:credentialIdentifier:completion:](self, "_generateKeyWithType:credentialIdentifier:completion:", 2, a3, a4);
}

- (void)generatePresentmentKeyForCredential:(id)a3 completion:(id)a4
{
  -[NPKIDVRemoteDeviceSession _generateKeyWithType:credentialIdentifier:completion:](self, "_generateKeyWithType:credentialIdentifier:completion:", 3, a3, a4);
}

- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  NPKIDVRemoteDeviceSession *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested generate presentment keys for credential:%@", buf, 0xCu);
    }

  }
  v13 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __85__NPKIDVRemoteDeviceSession_generatePresentmentKeysForCredential_numKeys_completion___block_invoke;
  v23[3] = &unk_24CFE7AB8;
  v14 = v8;
  v24 = v14;
  v15 = v9;
  v25 = v15;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __85__NPKIDVRemoteDeviceSession_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_59;
  v19[3] = &unk_24CFEAE28;
  v21 = self;
  v22 = v15;
  v20 = v14;
  v17 = v15;
  v18 = v14;
  objc_msgSend(v16, "generatePresentmentKeysForCredential:numKeys:completion:", v18, a4, v19);

}

void __85__NPKIDVRemoteDeviceSession_generatePresentmentKeysForCredential_numKeys_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error generating presentment keys for credential:%@ with error:%@", (uint8_t *)&v10, 0x16u);
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

}

void __85__NPKIDVRemoteDeviceSession_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  _BOOL4 v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v19 = 138412546;
        v20 = v12;
        v21 = 2112;
        v22 = v6;
        v13 = "Error: NPKIDVRemoteDeviceService: Failed to generate presentment keys for credential:%@ with error:%@";
        v14 = v11;
        v15 = OS_LOG_TYPE_ERROR;
        v16 = 22;
LABEL_8:
        _os_log_impl(&dword_213518000, v14, v15, v13, (uint8_t *)&v19, v16);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v17 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 32);
        v19 = 138412290;
        v20 = v18;
        v13 = "Notice: NPKIDVRemoteDeviceService: Finish generating presentment keys of for credential:%@";
        v14 = v11;
        v15 = OS_LOG_TYPE_DEFAULT;
        v16 = 12;
        goto LABEL_8;
      }
LABEL_9:

    }
  }
  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v6, v10);

}

- (void)_generateKeyWithType:(unint64_t)a3 credentialIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  NPKIDVRemoteDeviceSession *v22;
  id v23;
  unint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  unint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v13;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested generate Key of type:%@ For Credential:%@", buf, 0x16u);

    }
  }
  v14 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __82__NPKIDVRemoteDeviceSession__generateKeyWithType_credentialIdentifier_completion___block_invoke;
  v25[3] = &unk_24CFEADB0;
  v28 = a3;
  v15 = v8;
  v26 = v15;
  v16 = v9;
  v27 = v16;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __82__NPKIDVRemoteDeviceSession__generateKeyWithType_credentialIdentifier_completion___block_invoke_61;
  v20[3] = &unk_24CFEAE50;
  v23 = v16;
  v24 = a3;
  v21 = v15;
  v22 = self;
  v18 = v16;
  v19 = v15;
  objc_msgSend(v17, "generateKeyWithType:credentialIdentifier:completion:", a3, v19, v20);

}

void __82__NPKIDVRemoteDeviceSession__generateKeyWithType_credentialIdentifier_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a1[6]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[4];
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error generating Key of type:%@ For Credential:%@ with error:%@", (uint8_t *)&v11, 0x20u);

    }
  }
  v9 = a1[5];
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

}

void __82__NPKIDVRemoteDeviceSession__generateKeyWithType_credentialIdentifier_completion___block_invoke_61(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  _BOOL4 v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a1[7]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = a1[4];
        v20 = 138412802;
        v21 = v12;
        v22 = 2112;
        v23 = v13;
        v24 = 2112;
        v25 = v6;
        v14 = "Error: NPKIDVRemoteDeviceService: Fail generating Key of type:%@ For Credential:%@ with error:%@";
        v15 = v11;
        v16 = OS_LOG_TYPE_ERROR;
        v17 = 32;
LABEL_8:
        _os_log_impl(&dword_213518000, v15, v16, v14, (uint8_t *)&v20, v17);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v18 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a1[7]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = a1[4];
        v20 = 138412546;
        v21 = v12;
        v22 = 2112;
        v23 = v19;
        v14 = "Notice: NPKIDVRemoteDeviceService: Finish generate Key of type:%@ For Credential:%@";
        v15 = v11;
        v16 = OS_LOG_TYPE_DEFAULT;
        v17 = 22;
        goto LABEL_8;
      }
LABEL_9:

    }
  }
  (*(void (**)(_QWORD, id, id, uint64_t))(a1[6] + 16))(a1[6], v5, v6, v10);

}

- (void)deleteCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  NPKIDVRemoteDeviceSession *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested delete Credential:%@", buf, 0xCu);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __57__NPKIDVRemoteDeviceSession_deleteCredential_completion___block_invoke;
  v20[3] = &unk_24CFE7B80;
  v12 = v7;
  v21 = v12;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __57__NPKIDVRemoteDeviceSession_deleteCredential_completion___block_invoke_63;
  v16[3] = &unk_24CFEAE78;
  v18 = self;
  v19 = v12;
  v17 = v6;
  v14 = v12;
  v15 = v6;
  objc_msgSend(v13, "deleteCredential:completion:", v15, v16);

}

void __57__NPKIDVRemoteDeviceSession_deleteCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error deleting Credential with error:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

void __57__NPKIDVRemoteDeviceSession_deleteCredential_completion___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = v3;
        v8 = "Error: NPKIDVRemoteDeviceService: Fail deleting Credential with error:%@";
        v9 = v7;
        v10 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_213518000, v9, v10, v8, (uint8_t *)&v13, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v11 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(void **)(a1 + 32);
        v13 = 138412290;
        v14 = v12;
        v8 = "Notice: NPKIDVRemoteDeviceService: Finish delete Credential:%@";
        v9 = v7;
        v10 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:

    }
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3);

}

- (void)propertiesOfCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  NPKIDVRemoteDeviceSession *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested fetch properties Of Credential:%@", buf, 0xCu);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __63__NPKIDVRemoteDeviceSession_propertiesOfCredential_completion___block_invoke;
  v20[3] = &unk_24CFE7B80;
  v12 = v7;
  v21 = v12;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __63__NPKIDVRemoteDeviceSession_propertiesOfCredential_completion___block_invoke_64;
  v16[3] = &unk_24CFEAEA0;
  v18 = self;
  v19 = v12;
  v17 = v6;
  v14 = v12;
  v15 = v6;
  objc_msgSend(v13, "propertiesOfCredential:completion:", v15, v16);

}

void __63__NPKIDVRemoteDeviceSession_propertiesOfCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error fetching properties Of Credential with error:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

void __63__NPKIDVRemoteDeviceSession_propertiesOfCredential_completion___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412290;
        v17 = v6;
        v11 = "Error: NPKIDVRemoteDeviceService: Fail fetching properties Of Credential with error:%@";
        v12 = v10;
        v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_213518000, v12, v13, v11, (uint8_t *)&v16, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(void **)(a1 + 32);
        v16 = 138412290;
        v17 = v15;
        v11 = "Notice: NPKIDVRemoteDeviceService: Finish fetch properties Of Credential:%@";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:

    }
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5);

}

- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  NPKIDVRemoteDeviceSession *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested fetch credential Identifiers In Partitions:%@", buf, 0xCu);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __74__NPKIDVRemoteDeviceSession_credentialIdentifiersInPartitions_completion___block_invoke;
  v20[3] = &unk_24CFE7B80;
  v12 = v7;
  v21 = v12;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __74__NPKIDVRemoteDeviceSession_credentialIdentifiersInPartitions_completion___block_invoke_66;
  v16[3] = &unk_24CFEAEC8;
  v18 = self;
  v19 = v12;
  v17 = v6;
  v14 = v12;
  v15 = v6;
  objc_msgSend(v13, "credentialIdentifiersInPartitions:completion:", v15, v16);

}

void __74__NPKIDVRemoteDeviceSession_credentialIdentifiersInPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error fetching credential Identifiers In Partitions with error:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

void __74__NPKIDVRemoteDeviceSession_credentialIdentifiersInPartitions_completion___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412290;
        v17 = v6;
        v11 = "Error: NPKIDVRemoteDeviceService: Fail fetching properties Of Credential with error:%@";
        v12 = v10;
        v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_213518000, v12, v13, v11, (uint8_t *)&v16, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(void **)(a1 + 32);
        v16 = 138412290;
        v17 = v15;
        v11 = "Notice: NPKIDVRemoteDeviceService: Finish fetch credential Identifiers In Partitions:%@";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:

    }
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5);

}

- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Requested fetch credential elements:%@ of credential:%@. THIS METHOD IS NOT LONGER SUPPORTED", (uint8_t *)&v14, 0x16u);
    }

  }
  NPKIDVRemoteDeviceSessionError(-1000, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 0, v13);

}

- (void)provisionCredentialWithType:(unint64_t)a3 metadata:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  unint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  unint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  pk_Payment_log();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

  if (v20)
  {
    pk_Payment_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v22;
      v39 = 2112;
      v40 = v14;
      _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested provision credential type:%@ credential Identifier:%@", buf, 0x16u);

    }
  }
  v23 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __128__NPKIDVRemoteDeviceSession_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke;
  v33[3] = &unk_24CFEADB0;
  v36 = a3;
  v24 = v14;
  v34 = v24;
  v25 = v15;
  v35 = v25;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v29[1] = 3221225472;
  v29[2] = __128__NPKIDVRemoteDeviceSession_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke_68;
  v29[3] = &unk_24CFEAEF0;
  v31 = v25;
  v32 = a3;
  v30 = v24;
  v27 = v25;
  v28 = v24;
  objc_msgSend(v26, "provisionCredentialWithType:metadata:credentialIdentifier:attestations:supplementalData:completion:", a3, v18, v28, v17, v16, v29);

}

void __128__NPKIDVRemoteDeviceSession_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      NSStringFromNPKIDVRemoteDeviceCredentialType(a1[6]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[4];
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error provisioning credential type:%@ credential Identifier:%@ with error:%@", (uint8_t *)&v11, 0x20u);

    }
  }
  v9 = a1[5];
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

}

void __128__NPKIDVRemoteDeviceSession_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke_68(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        NSStringFromNPKIDVRemoteDeviceCredentialType(a1[6]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = a1[4];
        v19 = 138412802;
        v20 = v12;
        v21 = 2112;
        v22 = v13;
        v23 = 2112;
        v24 = v6;
        v14 = "Error: NPKIDVRemoteDeviceService: Fail provisioning credential type:%@ credential Identifier:%@ with error:%@";
        v15 = v11;
        v16 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_213518000, v15, v16, v14, (uint8_t *)&v19, 0x20u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v17 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromNPKIDVRemoteDeviceCredentialType(a1[6]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = a1[4];
        v19 = 138412802;
        v20 = v12;
        v21 = 2112;
        v22 = v18;
        v23 = 2112;
        v24 = v5;
        v14 = "Notice: NPKIDVRemoteDeviceService: Finish provisioning credential type:%@ credential Identifier:%@ secureElementPass:%@";
        v15 = v11;
        v16 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:

    }
  }
  (*(void (**)(_QWORD, id, id, uint64_t))(a1[5] + 16))(a1[5], v5, v6, v10);

}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

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
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested nonce for Authentication Token", buf, 2u);
    }

  }
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__NPKIDVRemoteDeviceSession_nonceForAuthorizationTokenWithCompletion___block_invoke;
  v14[3] = &unk_24CFE7B80;
  v9 = v4;
  v15 = v9;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __70__NPKIDVRemoteDeviceSession_nonceForAuthorizationTokenWithCompletion___block_invoke_70;
  v12[3] = &unk_24CFEAF18;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "nonceForAuthorizationTokenWithCompletion:", v12);

}

void __70__NPKIDVRemoteDeviceSession_nonceForAuthorizationTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error fetching nonce for Authentication Token with error:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

void __70__NPKIDVRemoteDeviceSession_nonceForAuthorizationTokenWithCompletion___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v6;
        v11 = "Error: NPKIDVRemoteDeviceService: Fail fetching nonce for Authentication Token with error:%@";
        v12 = v10;
        v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_213518000, v12, v13, v11, (uint8_t *)&v15, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v5;
        v11 = "Notice: NPKIDVRemoteDeviceService: Finish fetch nonce:%@ for Authentication Token";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:

    }
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);

}

- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested pre-arm credential with authenticationToken:%@", buf, 0xCu);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __79__NPKIDVRemoteDeviceSession_prearmCredentialWithAuthorizationToken_completion___block_invoke;
  v17[3] = &unk_24CFE7B80;
  v12 = v7;
  v18 = v12;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __79__NPKIDVRemoteDeviceSession_prearmCredentialWithAuthorizationToken_completion___block_invoke_72;
  v15[3] = &unk_24CFEAE00;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "prearmCredentialWithAuthorizationToken:completion:", v6, v15);

}

void __79__NPKIDVRemoteDeviceSession_prearmCredentialWithAuthorizationToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error pre-arming credential with authentication token, error:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

void __79__NPKIDVRemoteDeviceSession_prearmCredentialWithAuthorizationToken_completion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  _BOOL4 v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = v3;
        v8 = "Error: NPKIDVRemoteDeviceService: Fail pre-arming credential with authentication token, error:%@";
        v9 = v7;
        v10 = OS_LOG_TYPE_ERROR;
        v11 = 12;
LABEL_8:
        _os_log_impl(&dword_213518000, v9, v10, v8, (uint8_t *)&v13, v11);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v12 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        v8 = "Notice: NPKIDVRemoteDeviceService: Finish pre-arming credential with authentication token";
        v9 = v7;
        v10 = OS_LOG_TYPE_DEFAULT;
        v11 = 2;
        goto LABEL_8;
      }
LABEL_9:

    }
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);

}

- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested establish trust V2 with Key:%@", buf, 0xCu);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__NPKIDVRemoteDeviceSession_establishPrearmTrustV2_completion___block_invoke;
  v17[3] = &unk_24CFE7B80;
  v12 = v7;
  v18 = v12;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __63__NPKIDVRemoteDeviceSession_establishPrearmTrustV2_completion___block_invoke_73;
  v15[3] = &unk_24CFEAF40;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "establishPrearmTrustV2:completion:", v6, v15);

}

void __63__NPKIDVRemoteDeviceSession_establishPrearmTrustV2_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error establishing trust, error:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

void __63__NPKIDVRemoteDeviceSession_establishPrearmTrustV2_completion___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  _BOOL4 v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412290;
        v17 = v6;
        v11 = "Error: NPKIDVRemoteDeviceService: Fail establishing trust, error:%@";
        v12 = v10;
        v13 = OS_LOG_TYPE_ERROR;
        v14 = 12;
LABEL_8:
        _os_log_impl(&dword_213518000, v12, v13, v11, (uint8_t *)&v16, v14);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v15 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        v11 = "Notice: NPKIDVRemoteDeviceService: Finish establishing trust";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEFAULT;
        v14 = 2;
        goto LABEL_8;
      }
LABEL_9:

    }
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);

}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

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
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested delete global auth ACL", buf, 2u);
    }

  }
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__NPKIDVRemoteDeviceSession_deleteGlobalAuthACLWithCompletion___block_invoke;
  v14[3] = &unk_24CFE7B80;
  v9 = v4;
  v15 = v9;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __63__NPKIDVRemoteDeviceSession_deleteGlobalAuthACLWithCompletion___block_invoke_75;
  v12[3] = &unk_24CFEAE00;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "deleteGlobalAuthACLWithCompletion:", v12);

}

void __63__NPKIDVRemoteDeviceSession_deleteGlobalAuthACLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error deleting global auth ACL with error:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

void __63__NPKIDVRemoteDeviceSession_deleteGlobalAuthACLWithCompletion___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  _BOOL4 v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (!v6)
      goto LABEL_10;
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v14 = 138412290;
    v15 = v3;
    v8 = "Error: NPKIDVRemoteDeviceService: Fail delete global auth ACL with error:%@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 12;
    goto LABEL_8;
  }
  v12 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (!v12)
    goto LABEL_10;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    v8 = "Notice: NPKIDVRemoteDeviceService: Finish delete global auth ACL";
    v9 = v7;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 2;
LABEL_8:
    _os_log_impl(&dword_213518000, v9, v10, v8, (uint8_t *)&v14, v11);
  }
LABEL_9:

LABEL_10:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

- (void)getCASDCertificateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

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
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested get CASD certificate", buf, 2u);
    }

  }
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__NPKIDVRemoteDeviceSession_getCASDCertificateWithCompletion___block_invoke;
  v14[3] = &unk_24CFE7B80;
  v9 = v4;
  v15 = v9;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __62__NPKIDVRemoteDeviceSession_getCASDCertificateWithCompletion___block_invoke_76;
  v12[3] = &unk_24CFEAF68;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "getCASDCertificateWithCompletion:", v12);

}

void __62__NPKIDVRemoteDeviceSession_getCASDCertificateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error retrieving CASD certificate with error:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

void __62__NPKIDVRemoteDeviceSession_getCASDCertificateWithCompletion___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    if (v8)
    {
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v6;
        v10 = "Notice: NPKIDVRemoteDeviceService: Failed get CASD Certificate with error %@";
LABEL_8:
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      v10 = "Notice: NPKIDVRemoteDeviceService: Finished get CASD Certificate: %@";
      goto LABEL_8;
    }
LABEL_9:

  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);

}

- (void)addNotificationWithType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  char *v15;
  char *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  unint64_t v27;
  _QWORD v28[4];
  id v29;
  unint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  pk_Payment_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKIDVRemoteDeviceNotificationType(a3);
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromNPKIDVRemoteDeviceDocumentType(a4);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v15;
      v33 = 2112;
      v34 = v16;
      v35 = 2112;
      v36 = (uint64_t)v10;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested add notification type:%@ document type:%@ issuerName:%@", buf, 0x20u);

    }
  }
  if (a3 != 4 && !v10)
  {
    pk_General_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (v18)
    {
      pk_General_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromNPKIDVRemoteDeviceNotificationType(a3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446978;
        v32 = "-[NPKIDVRemoteDeviceSession addNotificationWithType:documentType:issuerName:completion:]";
        v33 = 2082;
        v34 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/CoreIDV Connection/Host Process "
              "Classes/NPKIDVRemoteDeviceSession.m";
        v35 = 2048;
        v36 = 577;
        v37 = 2112;
        v38 = v20;
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Can't have nil issue name for notification type:%@)", buf, 0x2Au);

      }
    }
    _NPKAssertAbort();
  }
  v21 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __88__NPKIDVRemoteDeviceSession_addNotificationWithType_documentType_issuerName_completion___block_invoke;
  v28[3] = &unk_24CFE7A90;
  v30 = a3;
  v22 = v11;
  v29 = v22;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v25[1] = 3221225472;
  v25[2] = __88__NPKIDVRemoteDeviceSession_addNotificationWithType_documentType_issuerName_completion___block_invoke_79;
  v25[3] = &unk_24CFEAF90;
  v26 = v22;
  v27 = a3;
  v25[4] = self;
  v24 = v22;
  objc_msgSend(v23, "addNotificationWithType:documentType:issuerName:completion:", a3, a4, v10, v25);

}

void __88__NPKIDVRemoteDeviceSession_addNotificationWithType_documentType_issuerName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error Requesting add notification type:%@ error:%@", (uint8_t *)&v10, 0x16u);

    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

void __88__NPKIDVRemoteDeviceSession_addNotificationWithType_documentType_issuerName_completion___block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  _BOOL4 v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (!v6)
      goto LABEL_10;
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    NSStringFromNPKIDVRemoteDeviceNotificationType(*(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    v9 = "Error: NPKIDVRemoteDeviceService: Fail Requesting add notification type:%@ error:%@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_8;
  }
  v13 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (!v13)
    goto LABEL_10;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromNPKIDVRemoteDeviceNotificationType(*(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v8;
    v9 = "Notice: NPKIDVRemoteDeviceService: Finish Requesting add notification type:%@";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
LABEL_8:
    _os_log_impl(&dword_213518000, v10, v11, v9, (uint8_t *)&v15, v12);

  }
LABEL_9:

LABEL_10:
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);

}

- (void)updateProofingConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  NPKIDVRemoteDeviceSession *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Session - Requested to update proofing configuration: %@", buf, 0xCu);
    }

  }
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __68__NPKIDVRemoteDeviceSession_updateProofingConfiguration_completion___block_invoke;
  v20[3] = &unk_24CFE7B80;
  v12 = v7;
  v21 = v12;
  -[NPKIDVRemoteDeviceSession _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __68__NPKIDVRemoteDeviceSession_updateProofingConfiguration_completion___block_invoke_80;
  v16[3] = &unk_24CFEAE78;
  v18 = self;
  v19 = v12;
  v17 = v6;
  v14 = v12;
  v15 = v6;
  objc_msgSend(v13, "updateProofingConfiguration:completion:", v15, v16);

}

void __68__NPKIDVRemoteDeviceSession_updateProofingConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error requesting to update proofing configuration. Error:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  NPKIDVRemoteDeviceSessionError(-1001, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

void __68__NPKIDVRemoteDeviceSession_updateProofingConfiguration_completion___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (!v6)
      goto LABEL_10;
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v14 = 138412290;
    v15 = v3;
    v8 = "Error: NPKIDVRemoteDeviceService: Session - Failed to update proofing configuration. Error: %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }
  v11 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (!v11)
    goto LABEL_10;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    v14 = 138412290;
    v15 = v12;
    v8 = "Notice: NPKIDVRemoteDeviceService: Session - Finished updating proofing configuration: %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
    _os_log_impl(&dword_213518000, v9, v10, v8, (uint8_t *)&v14, 0xCu);
  }
LABEL_9:

LABEL_10:
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

- (unint64_t)status
{
  os_unfair_lock_s *p_sessionStatusLock;
  unint64_t status;

  p_sessionStatusLock = &self->_sessionStatusLock;
  os_unfair_lock_lock(&self->_sessionStatusLock);
  status = self->_status;
  os_unfair_lock_unlock(p_sessionStatusLock);
  return status;
}

- (void)setStatus:(unint64_t)a3
{
  os_unfair_lock_s *p_sessionStatusLock;

  p_sessionStatusLock = &self->_sessionStatusLock;
  os_unfair_lock_lock(&self->_sessionStatusLock);
  self->_status = a3;
  os_unfair_lock_unlock(p_sessionStatusLock);
}

- (void)invalidateSession
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  PKXPCService *remoteService;
  int v7;
  NPKIDVRemoteDeviceSession *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Invalidating session:%@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[NPKIDVRemoteDeviceSession setStatus:](self, "setStatus:", 1);
  remoteService = self->_remoteService;
  self->_remoteService = 0;

}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  PKXPCService *remoteService;
  void *v11;
  uint8_t v13[16];

  v4 = (void (**)(id, void *))a3;
  if (-[NPKIDVRemoteDeviceSession status](self, "status")
    || (remoteService = self->_remoteService,
        -[NPKIDVRemoteDeviceSession _errorHandlerWithCompletion:](self, "_errorHandlerWithCompletion:", v4),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PKXPCService remoteObjectProxyWithErrorHandler:](remoteService, "remoteObjectProxyWithErrorHandler:", v11),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v9))
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Fail to obtain remote proxy object", v13, 2u);
      }

    }
    -[NPKIDVRemoteDeviceSession invalidateSession](self, "invalidateSession");
    if (v4)
    {
      NPKIDVRemoteDeviceSessionError(-1001, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8);

    }
    v9 = 0;
  }

  return v9;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__NPKIDVRemoteDeviceSession__errorHandlerWithCompletion___block_invoke;
  v13[3] = &unk_24CFE7AB8;
  v13[4] = self;
  v14 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x2199B6780](v13);
  v11 = (void *)MEMORY[0x2199B6780](v6, v7, v8, v9, v10);

  return v11;
}

void __57__NPKIDVRemoteDeviceSession__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error on connection: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidateSession");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)remoteService:(id)a3 didEstablishConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  NPKIDVRemoteDeviceSession *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      v11 = 138412802;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@, remote service:%@ did establish connection:%@", (uint8_t *)&v11, 0x20u);
    }

  }
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  NPKIDVRemoteDeviceSession *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      v11 = 138412802;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@, remote service:%@ did interrupt connection:%@", (uint8_t *)&v11, 0x20u);
    }

  }
  -[NPKIDVRemoteDeviceSession invalidateSession](self, "invalidateSession");

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (self->_status)
    v5 = CFSTR("NPKIDVRemoteDeviceSessionStatusInvalidated");
  else
    v5 = CFSTR("NPKIDVRemoteDeviceSessionStatusReady");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> RemoteDeviceID:%@ status:%@"), v4, self, self->_deviceID, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
