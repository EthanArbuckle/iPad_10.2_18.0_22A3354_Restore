@implementation NPKBiometricPassPreflightManager

- (NPKBiometricPassPreflightManager)initWithDataSource:(id)a3
{
  id v4;
  NPKBiometricPassPreflightManager *v5;
  NPKBiometricPassPreflightManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NPKBiometricPassPreflightManager;
  v5 = -[NPKBiometricPassPreflightManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (void)preflightStatusForType:(unint64_t)a3 pairedDeviceMinOSVersion:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
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
      NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Start credential Preflight Status ForType:%@ minOSVersion", buf, 0xCu);

    }
  }
  if (!v8)
    goto LABEL_8;
  -[NPKBiometricPassPreflightManager dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "biometricPassPreflightManagerPairedDeviceOSVersion:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((PKVersionCheck() & 1) != 0)
  {

LABEL_8:
    if (a3 == 1 && (NPKPairedOrPairingDeviceSupportsCredentialType(129) & 1) != 0)
    {
      -[NPKBiometricPassPreflightManager dataSource](self, "dataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __95__NPKBiometricPassPreflightManager_preflightStatusForType_pairedDeviceMinOSVersion_completion___block_invoke;
      v25[3] = &unk_24CFEE838;
      v27 = 1;
      v26 = v9;
      objc_msgSend(v16, "biometricPassPreflightManager:provisionedCredentialCountsForType:completion:", self, 1, v25);

      v15 = v26;
    }
    else
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
          NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v20;
          _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Paired device doesn't support credential type:%@", buf, 0xCu);

        }
      }
      NPKIDVRemoteDeviceSessionError(-1000, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v15);
    }
    goto LABEL_21;
  }
  pk_Payment_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    pk_Payment_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v15;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Paired device with OSVersion:%@ doesn't fulfill minOSVersion:%@", buf, 0x16u);
    }

  }
  NPKIDVRemoteDeviceSessionError(-1000, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v24);

LABEL_21:
}

void __95__NPKBiometricPassPreflightManager_preflightStatusForType_pairedDeviceMinOSVersion_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadWebService");
  objc_msgSend(v4, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__NPKBiometricPassPreflightManager_preflightStatusForType_pairedDeviceMinOSVersion_completion___block_invoke_2;
  v8[3] = &unk_24CFEE810;
  v7 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = a2;
  v9 = v7;
  objc_msgSend(v5, "paymentWebService:validateAddBiometricPassPreconditionsWithCompletion:", v6, v8);

}

void __95__NPKBiometricPassPreflightManager_preflightStatusForType_pairedDeviceMinOSVersion_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  NPKIDVRemoteDeviceCredentialPreflightStatus *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
      NSStringFromNPKIDVRemoteDeviceCredentialType(a1[5]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = 67109634;
      v11[1] = a2;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish credential Preflight Status:%d ForType:%@ error:%@", (uint8_t *)v11, 0x1Cu);

    }
  }
  v10 = -[NPKIDVRemoteDeviceCredentialPreflightStatus initWithCredentialType:provisionedPassesCount:preflightSuccessful:]([NPKIDVRemoteDeviceCredentialPreflightStatus alloc], "initWithCredentialType:provisionedPassesCount:preflightSuccessful:", a1[5], a1[6], a2);
  (*(void (**)(void))(a1[4] + 16))();

}

- (NPKBiometricPassPreflightManagerDataSource)dataSource
{
  return (NPKBiometricPassPreflightManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
