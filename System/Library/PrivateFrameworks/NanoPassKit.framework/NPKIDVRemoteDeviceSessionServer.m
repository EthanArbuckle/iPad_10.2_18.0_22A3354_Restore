@implementation NPKIDVRemoteDeviceSessionServer

- (NPKIDVRemoteDeviceSessionServer)initWithConnection:(id)a3 eventsCoordinator:(id)a4 connectionCoordinator:(id)a5 preflightManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  NPKIDVRemoteDeviceSessionServer *v14;
  NPKIDVRemoteDeviceSessionServer *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)NPKIDVRemoteDeviceSessionServer;
  v14 = -[PDXPCService initWithConnection:](&v17, sel_initWithConnection_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_eventsCoordinator, a4);
    objc_storeStrong((id *)&v15->_connectionCoordinator, a5);
    objc_storeStrong((id *)&v15->_preflightManager, a6);
  }

  return v15;
}

- (void)confirmRemoteDeviceID:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  -[NPKIDVRemoteDeviceServiceEventsCoordinator remoteDeviceID](self->_eventsCoordinator, "remoteDeviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested confirm deviceID:%@ actual deviceID:%@", (uint8_t *)&v19, 0x16u);
    }

  }
  if (!v8)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = v6;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Fail to confirm given deviceID:%@, no active device is initialized", (uint8_t *)&v19, 0xCu);
      }

    }
    NPKIDVRemoteDeviceSessionError(-1003, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (v6 && (objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
  {
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      pk_Payment_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = v6;
        _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Fail to confirm given deviceID:%@", (uint8_t *)&v19, 0xCu);
      }

    }
    NPKIDVRemoteDeviceSessionError(-1002, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
    v8 = 0;
    goto LABEL_20;
  }
  v12 = 0;
LABEL_20:
  v7[2](v7, v8, v12);

}

- (void)credentialPreflightStatusForType:(unint64_t)a3 minOSVersion:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  char *v13;
  void *v14;
  NPKBiometricPassPreflightManager *preflightManager;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  _QWORD v24[4];
  void (**v25)(id, _QWORD, void *);
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
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
      NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v13;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested credential Preflight Status ForType:%@ minOSVersion:%@", buf, 0x16u);

    }
  }
  -[NPKIDVRemoteDeviceServiceEventsCoordinator remoteDeviceID](self->_eventsCoordinator, "remoteDeviceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      pk_Payment_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Fail fetch credential Preflight Status, no active device is initialized", buf, 2u);
      }

    }
    v20 = -1003;
    goto LABEL_18;
  }
  if (a3 != 1)
  {
    pk_Payment_log();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

    if (v22)
    {
      pk_Payment_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[NPKIDVRemoteDeviceSessionServer credentialPreflightStatusForType:minOSVersion:completion:]";
        _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: If you think the given credential type is correct you probably need to makes some code changes at %s", buf, 0xCu);
      }

    }
    v20 = -1050;
LABEL_18:
    NPKIDVRemoteDeviceSessionError(v20, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v16);
    goto LABEL_19;
  }
  preflightManager = self->_preflightManager;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __92__NPKIDVRemoteDeviceSessionServer_credentialPreflightStatusForType_minOSVersion_completion___block_invoke;
  v24[3] = &unk_24CFE7A40;
  v26 = 1;
  v25 = v9;
  -[NPKBiometricPassPreflightManager preflightStatusForType:pairedDeviceMinOSVersion:completion:](preflightManager, "preflightStatusForType:pairedDeviceMinOSVersion:completion:", 1, v8, v24);
  v16 = v25;
LABEL_19:

}

void __92__NPKIDVRemoteDeviceSessionServer_credentialPreflightStatusForType_minOSVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
      NSStringFromNPKIDVRemoteDeviceCredentialType(*(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v5;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish credential Preflight Status:%@ ForType:%@ error:%@", (uint8_t *)&v11, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)provisionedCredentialCountForType:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[8];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[NPKIDVRemoteDeviceSessionServer dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NPKIDVRemoteDeviceSessionServer dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteDevicesSessionServer:provisionedCredentialCountsForType:completion:", self, a3, v6);

  }
  else
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
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unable to fetch provisioned credential count! No data source found.", v15, 2u);
      }

    }
    if (v6)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BDD0FC8];
      v17[0] = CFSTR("No data source found");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v6[2](v6, 0, v14);
    }
  }

}

- (void)fetchRemoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[8];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[NPKIDVRemoteDeviceSessionServer dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NPKIDVRemoteDeviceSessionServer dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteDevicesSessionServer:remoteBiometricAuthenticationStatusForCredentialType:completion:", self, a3, v6);

  }
  else
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
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unable to fetch remote biometric authentication status! No data source found.", v15, 2u);
      }

    }
    if (v6)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BDD0FC8];
      v17[0] = CFSTR("No data source found");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v6[2](v6, 0, v14);
    }
  }

}

- (void)registerForEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5
{
  unint64_t v8;
  void *v9;
  void (**v10)(id, unint64_t, void *);

  v10 = (void (**)(id, unint64_t, void *))a5;
  v8 = -[NPKIDVRemoteDeviceServiceEventsCoordinator registerEvents:forServiceName:](self->_eventsCoordinator, "registerEvents:forServiceName:", a3, a4);
  if (v8 == 0xFFFFFFFF80000000)
  {
    NPKIDVRemoteDeviceSessionError(-1003, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10[2](v10, v8, v9);

}

- (void)unregisterFromEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5
{
  unint64_t v8;
  void *v9;
  void (**v10)(id, unint64_t, void *);

  v10 = (void (**)(id, unint64_t, void *))a5;
  v8 = -[NPKIDVRemoteDeviceServiceEventsCoordinator unregisterEvents:forServiceName:](self->_eventsCoordinator, "unregisterEvents:forServiceName:", a3, a4);
  if (v8 == 0xFFFFFFFF80000000)
  {
    NPKIDVRemoteDeviceSessionError(-1003, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10[2](v10, v8, v9);

}

- (void)getCASDCertificateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, _QWORD, void *))a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested CASD certificate", v9, 2u);
    }

  }
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreBiometricsEntitlement](self, "_checkCredentialStoreBiometricsEntitlement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v4[2](v4, 0, v8);
  else
    -[NPKIDVRemoteDeviceConnectionCoordinator getCASDCertificateWithCompletion:](self->_connectionCoordinator, "getCASDCertificateWithCompletion:", v4);

}

- (void)pairedWatchSEIDWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD, void *);

  v9 = (void (**)(id, _QWORD, void *))a3;
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreBiometricsEntitlement](self, "_checkCredentialStoreBiometricsEntitlement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9[2](v9, 0, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getActivePairedDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BE6B3B8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      ((void (**)(id, void *, void *))v9)[2](v9, v7, 0);
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.nanopasskit.IDVRemoteDeviceSession.error"), -1003, 0);
      v9[2](v9, 0, v8);

    }
  }

}

- (void)configureWithPartition:(id)a3 ackHandler:(id)a4
{
  NSSet *v6;
  void (**v7)(id, void *);
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSSet *partitions;
  void *v15;
  NSSet *v16;
  NSSet *v17;
  int v18;
  NSSet *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (NSSet *)a3;
  v7 = (void (**)(id, void *))a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested configure Credential store partitions:%@", (uint8_t *)&v18, 0xCu);
    }

  }
  if (-[NSSet count](self->_partitions, "count"))
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        partitions = self->_partitions;
        v18 = 138412290;
        v19 = partitions;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Session is already configured with partitions:%@. We don't allow to configure it multiple times", (uint8_t *)&v18, 0xCu);
      }

    }
    NPKIDVRemoteDeviceSessionError(-1000, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v16 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v17 = self->_partitions;
    self->_partitions = v16;

    v7[2](v7, 0);
  }

}

- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
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
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested create credential in partition:%@ with options:%@", buf, 0x16u);
    }

  }
  v16 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreEntitlementWithPartition:](self, "_checkCredentialStoreEntitlementWithPartition:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v10[2](v10, 0, v15);
  else
    -[NPKIDVRemoteDeviceConnectionCoordinator createCredentialInPartition:options:completion:](self->_connectionCoordinator, "createCredentialInPartition:options:completion:", v8, v9, v10);

}

- (void)generateKeyWithType:(unint64_t)a3 credentialIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
      NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested generate Key of type:%@ For Credential:%@", (uint8_t *)&v15, 0x16u);

    }
  }
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreEntitlementWithPartition:](self, "_checkCredentialStoreEntitlementWithPartition:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v9[2](v9, 0, v14);
  else
    -[NPKIDVRemoteDeviceConnectionCoordinator generateKeyWithType:credentialIdentifier:withConfiguredPartitions:completion:](self->_connectionCoordinator, "generateKeyWithType:credentialIdentifier:withConfiguredPartitions:completion:", a3, v8, self->_partitions, v9);

}

- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
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
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested generate presentent keys for Credential:%@", (uint8_t *)&v14, 0xCu);
    }

  }
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreEntitlementWithPartition:](self, "_checkCredentialStoreEntitlementWithPartition:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v9[2](v9, 0, v13);
  else
    -[NPKIDVRemoteDeviceConnectionCoordinator generatePresentmentKeysForCredential:numKeys:withConfiguredPartitions:completion:](self->_connectionCoordinator, "generatePresentmentKeysForCredential:numKeys:withConfiguredPartitions:completion:", v8, a4, self->_partitions, v9);

}

- (void)deleteCredential:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested delete Credential:%@", (uint8_t *)&v12, 0xCu);
    }

  }
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreEntitlementWithPartition:](self, "_checkCredentialStoreEntitlementWithPartition:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v7[2](v7, v11);
  else
    -[NPKIDVRemoteDeviceConnectionCoordinator deleteCredential:withConfiguredPartitions:completion:](self->_connectionCoordinator, "deleteCredential:withConfiguredPartitions:completion:", v6, self->_partitions, v7);

}

- (void)propertiesOfCredential:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested fetch properties Of Credential:%@", (uint8_t *)&v12, 0xCu);
    }

  }
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreEntitlementWithPartition:](self, "_checkCredentialStoreEntitlementWithPartition:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v7[2](v7, 0, v11);
  else
    -[NPKIDVRemoteDeviceConnectionCoordinator propertiesOfCredential:withConfiguredPartitions:completion:](self->_connectionCoordinator, "propertiesOfCredential:withConfiguredPartitions:completion:", v6, self->_partitions, v7);

}

- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested fetch credential Identifiers In Partitions:%@", (uint8_t *)&v12, 0xCu);
    }

  }
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreEntitlementWithPartition:](self, "_checkCredentialStoreEntitlementWithPartition:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v7[2](v7, 0, v11);
  else
    -[NPKIDVRemoteDeviceConnectionCoordinator credentialIdentifiersInPartitions:completion:](self->_connectionCoordinator, "credentialIdentifiersInPartitions:completion:", v6, v7);

}

- (void)provisionCredentialWithType:(unint64_t)a3 metadata:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD, void *);
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  void (**v31)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, _QWORD, void *))a8;
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialProvisioningEntitlement](self, "_checkCredentialProvisioningEntitlement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v18[2](v18, 0, v19);
  }
  else
  {
    pk_Payment_log();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      pk_Payment_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v23;
        v34 = 2112;
        v35 = v15;
        _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested provision credential type:%@ identifier:%@", buf, 0x16u);

      }
    }
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __134__NPKIDVRemoteDeviceSessionServer_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke;
    v29 = &unk_24CFE7A68;
    v24 = v15;
    v30 = v24;
    v31 = v18;
    v25 = (void *)MEMORY[0x2199B6780](&v26);
    -[NPKIDVRemoteDeviceConnectionCoordinator provisionCredentialWithType:metadata:credentialIdentifier:attestations:supplementalData:completion:](self->_connectionCoordinator, "provisionCredentialWithType:metadata:credentialIdentifier:attestations:supplementalData:completion:", a3, v14, v24, v16, v17, v25, v26, v27, v28, v29);

  }
}

void __134__NPKIDVRemoteDeviceSessionServer_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
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
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138412802;
      v13 = v10;
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish provision credential with identifier:%@ secureElementPass:%@ error:%@", (uint8_t *)&v12, 0x20u);
    }

  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, _QWORD, void *))a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested nonce for authentication token", v9, 2u);
    }

  }
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreBiometricsEntitlement](self, "_checkCredentialStoreBiometricsEntitlement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v4[2](v4, 0, v8);
  else
    -[NPKIDVRemoteDeviceConnectionCoordinator nonceForAuthorizationTokenWithCompletion:](self->_connectionCoordinator, "nonceForAuthorizationTokenWithCompletion:", v4);

}

- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested pre-arm credential with authentication token:%@", (uint8_t *)&v12, 0xCu);
    }

  }
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreBiometricsEntitlement](self, "_checkCredentialStoreBiometricsEntitlement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v7[2](v7, v11);
  else
    -[NPKIDVRemoteDeviceConnectionCoordinator prearmCredentialWithAuthorizationToken:completion:](self->_connectionCoordinator, "prearmCredentialWithAuthorizationToken:completion:", v6, v7);

}

- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Server requested establish trust V2 with Key:%@", (uint8_t *)&v12, 0xCu);
    }

  }
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreBiometricsEntitlement](self, "_checkCredentialStoreBiometricsEntitlement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v7[2](v7, 0, v11);
  else
    -[NPKIDVRemoteDeviceConnectionCoordinator establishPrearmTrustV2:completion:](self->_connectionCoordinator, "establishPrearmTrustV2:completion:", v6, v7);

}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, void *))a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested delete global auth ACL", v9, 2u);
    }

  }
  -[NPKIDVRemoteDeviceSessionServer _checkCredentialStoreBiometricsEntitlement](self, "_checkCredentialStoreBiometricsEntitlement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v4[2](v4, v8);
  else
    -[NPKIDVRemoteDeviceConnectionCoordinator deleteGlobalAuthACLWithCompletion:](self->_connectionCoordinator, "deleteGlobalAuthACLWithCompletion:", v4);

}

- (void)addNotificationWithType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NPKIDVRemoteDeviceConnectionCoordinator *connectionCoordinator;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  unint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
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
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromNPKIDVRemoteDeviceDocumentType(a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v15;
      v30 = 2112;
      v31 = v16;
      v32 = 2112;
      v33 = v10;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested add notification type:%@ document type:%@ issuerName:%@", buf, 0x20u);

    }
  }
  -[PDXPCService connection](self, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "valueForEntitlement:", CFSTR("com.apple.NanoPassbook.IDVRemoteDeviceService.extendedReviewNotification"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v18, "BOOLValue") & 1) != 0)
  {
    connectionCoordinator = self->_connectionCoordinator;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __94__NPKIDVRemoteDeviceSessionServer_addNotificationWithType_documentType_issuerName_completion___block_invoke;
    v25[3] = &unk_24CFE7A90;
    v27 = a3;
    v26 = v11;
    -[NPKIDVRemoteDeviceConnectionCoordinator addNotificationWithType:documentType:issuerName:completion:](connectionCoordinator, "addNotificationWithType:documentType:issuerName:completion:", a3, a4, v10, v25);
    v20 = v26;
  }
  else
  {
    NPKIDVRemoteDeviceSessionError(-1000, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    pk_Payment_log();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
    {
      pk_Payment_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        NSStringFromNPKIDVRemoteDeviceNotificationType(a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v24;
        v30 = 2112;
        v31 = v20;
        _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error Requesting add notification type:%@ error:%@", buf, 0x16u);

      }
    }
    if (v11)
      (*((void (**)(id, void *))v11 + 2))(v11, v20);
  }

}

void __94__NPKIDVRemoteDeviceSessionServer_addNotificationWithType_documentType_issuerName_completion___block_invoke(uint64_t a1, void *a2)
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
    NSStringFromNPKIDVRemoteDeviceNotificationType(*(_QWORD *)(a1 + 40));
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
    NSStringFromNPKIDVRemoteDeviceNotificationType(*(_QWORD *)(a1 + 40));
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
  v14 = *(_QWORD *)(a1 + 32);
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
  NPKIDVRemoteDeviceConnectionCoordinator *connectionCoordinator;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
      v18 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested to update proofing configuration: %@", buf, 0xCu);
    }

  }
  connectionCoordinator = self->_connectionCoordinator;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __74__NPKIDVRemoteDeviceSessionServer_updateProofingConfiguration_completion___block_invoke;
  v14[3] = &unk_24CFE7AB8;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  -[NPKIDVRemoteDeviceConnectionCoordinator updateProofingConfiguration:completion:](connectionCoordinator, "updateProofingConfiguration:completion:", v13, v14);

}

void __74__NPKIDVRemoteDeviceSessionServer_updateProofingConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
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
    v8 = *(_QWORD *)(a1 + 32);
    v16 = 138412546;
    v17 = v8;
    v18 = 2112;
    v19 = v3;
    v9 = "Error: NPKIDVRemoteDeviceService: Failed to update proofing configuration (%@). Error: %@";
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
    v14 = *(_QWORD *)(a1 + 32);
    v16 = 138412290;
    v17 = v14;
    v9 = "Notice: NPKIDVRemoteDeviceService: Finished updating proofing configuration (%@)";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
LABEL_8:
    _os_log_impl(&dword_213518000, v10, v11, v9, (uint8_t *)&v16, v12);
  }
LABEL_9:

LABEL_10:
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);

}

- (id)_checkCredentialProvisioningEntitlement
{
  void *v2;
  void *v3;
  void *v4;

  -[PDXPCService connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.NanoPassbook.IDVRemoteDeviceService.credentialprovisioning"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    NPKIDVRemoteDeviceSessionError(-1000, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_checkCredentialStoreBiometricsEntitlement
{
  void *v2;
  void *v3;
  void *v4;

  -[PDXPCService connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.idcredentials.biometrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    NPKIDVRemoteDeviceSessionError(-1000, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_checkCredentialStoreEntitlementWithPartition:(id)a3
{
  NSSet *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  NSSet *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  NSObject *v21;
  _BOOL4 v22;
  NSSet *partitions;
  NSObject *v24;
  _BOOL4 v25;
  int v27;
  NSSet *v28;
  __int16 v29;
  NSSet *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (NSSet *)a3;
  -[PDXPCService connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.idcredentials.storage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (!-[NSSet count](self->_partitions, "count"))
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (!v12)
    {
      v14 = -1101;
LABEL_29:
      NPKIDVRemoteDeviceSessionError(v14, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: no partitions set", (uint8_t *)&v27, 2u);
    }
    v14 = -1101;
LABEL_27:

    goto LABEL_29;
  }
  if (objc_msgSend(v7, "containsObject:", CFSTR("*")) && !PKIsInternalInstall())
  {
    pk_Payment_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

    if (v25)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27) = 0;
        v18 = "Error: NPKIDVRemoteDeviceService: WildCard entitlement only allowed at internal builds";
        v19 = v13;
        v20 = 2;
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    goto LABEL_28;
  }
  if (-[NSSet count](v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSubsetOfSet:", self->_partitions);

    if ((v9 & 1) == 0)
    {
      pk_Payment_log();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (v22)
      {
        pk_Payment_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          partitions = self->_partitions;
          v27 = 138412546;
          v28 = v4;
          v29 = 2112;
          v30 = partitions;
          v18 = "Error: NPKIDVRemoteDeviceService: Partitions:%@ must be part of the configured partitions:%@";
          v19 = v13;
          v20 = 22;
          goto LABEL_25;
        }
LABEL_26:
        v14 = -1000;
        goto LABEL_27;
      }
LABEL_28:
      v14 = -1000;
      goto LABEL_29;
    }
  }
  if (!-[NSSet isSubsetOfSet:](self->_partitions, "isSubsetOfSet:", v7))
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = self->_partitions;
        v27 = 138412290;
        v28 = v17;
        v18 = "Error: NPKIDVRemoteDeviceService: Missing entitlement for some of the configured partitions:%@";
        v19 = v13;
        v20 = 12;
LABEL_25:
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v27, v20);
        goto LABEL_26;
      }
      goto LABEL_26;
    }
    goto LABEL_28;
  }
  v10 = 0;
LABEL_30:

  return v10;
}

- (NPKIDVRemoteDeviceSessionServerDataSource)dataSource
{
  return (NPKIDVRemoteDeviceSessionServerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_partitions, 0);
  objc_storeStrong((id *)&self->_preflightManager, 0);
  objc_storeStrong((id *)&self->_connectionCoordinator, 0);
  objc_storeStrong((id *)&self->_eventsCoordinator, 0);
}

@end
