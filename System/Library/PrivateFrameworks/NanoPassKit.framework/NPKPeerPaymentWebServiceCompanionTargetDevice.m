@implementation NPKPeerPaymentWebServiceCompanionTargetDevice

+ (void)attemptToDownloadPeerPaymentPassAtURL:(id)a3 withWebService:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[16];

  v7 = a3;
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
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Attempting to download peer payment pass following provisioning", buf, 2u);
    }

  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke;
  v15[3] = &unk_24CFEA358;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v14, "passAtURL:completion:", v7, v15);

}

void __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a3;
  v6 = v5;
  if (a2 == 1 && v5)
  {
    objc_msgSend(MEMORY[0x24BE6EA80], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataAccessor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NPKPairedDeviceSecureElementIdentifiers();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke_2;
    v11[3] = &unk_24CFE91B0;
    v12 = *(id *)(a1 + 32);
    v13 = v6;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v8, "downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:seids:completion:", v7, v9, v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }

}

void __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "targetDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke_3;
    v6[3] = &unk_24CFE7B00;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v3, "paymentWebService:addPaymentPass:withCompletionHandler:", v4, v5, v6);

  }
}

uint64_t __113__NPKPeerPaymentWebServiceCompanionTargetDevice_attemptToDownloadPeerPaymentPassAtURL_withWebService_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v6[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Added payment pass following provisioning", v6, 2u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NPKPeerPaymentWebServiceCompanionTargetDevice)init
{
  NPKPeerPaymentWebServiceCompanionTargetDevice *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPKPeerPaymentWebServiceCompanionTargetDevice;
  v2 = -[NPKPeerPaymentWebServiceCompanionTargetDevice init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleAccountChanged_, CFSTR("NPKSharedPeerPaymentAccountDidChangeNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NPKPeerPaymentWebServiceCompanionTargetDevice;
  -[NPKPeerPaymentWebServiceCompanionTargetDevice dealloc](&v4, sel_dealloc);
}

- (void)downloadPassIfNecessaryWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (id)account
{
  void *v2;
  void *v3;

  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerPaymentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateAccountWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "updatePeerPaymentAccountWithCompletion:", v3);
}

- (id)bridgedClientInfo
{
  return +[NPKPaymentWebServiceCompanionTargetDevice bridgedClientInfoHTTPHeader](NPKPaymentWebServiceCompanionTargetDevice, "bridgedClientInfoHTTPHeader");
}

- (BOOL)userHasDisabledPeerPayment
{
  void *v2;
  char v3;

  NPKDomainAccessorForDomain(CFSTR(".GlobalPreferences"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x24BE6F950]);

  return v3;
}

- (void)setUserHasDisabledPeerPayment:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  NPKDomainAccessorForDomain(CFSTR(".GlobalPreferences"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE6F950];
  objc_msgSend(v8, "setBool:forKey:", v3, *MEMORY[0x24BE6F950]);
  v5 = (id)objc_msgSend(v8, "synchronize");
  v6 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronizeNanoDomain:keys:", CFSTR(".GlobalPreferences"), v7);

}

- (void)provisionPeerPaymentPassWithProvisioningController:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v7 = a5;
  v8 = a3;
  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "webService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __122__NPKPeerPaymentWebServiceCompanionTargetDevice_provisionPeerPaymentPassWithProvisioningController_credential_completion___block_invoke;
  v14[3] = &unk_24CFEA380;
  v14[4] = self;
  v15 = v11;
  v16 = v7;
  v12 = v7;
  v13 = v11;
  objc_msgSend(v10, "provisionPeerPaymentPassWithCompletion:", v14);

}

void __122__NPKPeerPaymentWebServiceCompanionTargetDevice_provisionPeerPaymentPassWithProvisioningController_credential_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  char v22;

  v5 = a3;
  v6 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "associatedPassURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_opt_class();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __122__NPKPeerPaymentWebServiceCompanionTargetDevice_provisionPeerPaymentPassWithProvisioningController_credential_completion___block_invoke_2;
      v19[3] = &unk_24CFE80E0;
      v10 = *(_QWORD *)(a1 + 40);
      v21 = *(id *)(a1 + 48);
      v22 = a2;
      v20 = v6;
      objc_msgSend(v9, "attemptToDownloadPeerPaymentPassAtURL:withWebService:completion:", v8, v10, v19);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    objc_msgSend(v5, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.NPKErrorDomain"));

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("GIZMO_UNREACHABLE_ALERT_TITLE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("GIZMO_UNREACHABLE_ALERT_MESSAGE"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v17 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v17;
    }
  }
  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
    (*(void (**)(uint64_t, uint64_t, void *))(v18 + 16))(v18, a2, v6);

}

uint64_t __122__NPKPeerPaymentWebServiceCompanionTargetDevice_provisionPeerPaymentPassWithProvisioningController_credential_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)initalizeCloudStoreIfNecessaryWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "initializeCloudStoreIfNecessaryWithCompletion:", v3);
}

- (void)initalizeCloudStoreIfNecessaryWithHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "initializeCloudStoreIfNecessaryWithHandler:", v3);
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "checkTLKsMissingWithCompletion:", v3);
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "resetApplePayManateeViewWithCompletion:", v3);
}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cloudStoreStatusWithCompletion:", v3);
}

- (void)peerPaymentReRegisterWithURL:(id)a3 pushToken:(id)a4 peerPaymentWebService:(id)a5 completion:(id)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a6;
  v8 = a3;
  +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __121__NPKPeerPaymentWebServiceCompanionTargetDevice_peerPaymentReRegisterWithURL_pushToken_peerPaymentWebService_completion___block_invoke;
  v12[3] = &unk_24CFEA3A8;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "peerPaymentRegisterWithURL:forceReRegistration:completion:", v8, 1, v12);

}

void __121__NPKPeerPaymentWebServiceCompanionTargetDevice_peerPaymentReRegisterWithURL_pushToken_peerPaymentWebService_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
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
      v10[0] = 67109378;
      v10[1] = a2;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Calling peerPaymentReRegisterWithURL:pushToken: completion with success %i error %@", (uint8_t *)v10, 0x12u);
    }

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

- (id)deviceClass
{
  return CFSTR("Watch");
}

- (void)_handleAccountChanged:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", *MEMORY[0x24BE6F7A8], self, 0);

}

- (id)appleAccountInformation
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE6E9D8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleAccountInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)preferences
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint8_t v11[16];

  NPKPairedDevicePeerPaymentPreferences();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    NPKPairedOrPairingDevice();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("47B09AC1-3757-485D-9FB4-F124AC8FE430"));
    v5 = objc_msgSend(v3, "supportsCapability:", v4);

    if (v5)
    {

    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x24BE6EDF0]);
      objc_msgSend(v6, "preferences");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (v2)
        return v2;
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
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Missing peer payment preferences for paring paired device", v11, 2u);
      }

    }
    v2 = 0;
  }
  return v2;
}

- (void)setPreferences:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;
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
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Requested to set peer payment preferences:%@", buf, 0xCu);
    }

  }
  NPKPairedOrPairingDevice();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("47B09AC1-3757-485D-9FB4-F124AC8FE430"));
  v13 = objc_msgSend(v11, "supportsCapability:", v12);

  if (v13)
  {
    +[NPKSharedWebServiceProvider sharedWebServiceProvider](NPKSharedWebServiceProvider, "sharedWebServiceProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "targetDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __75__NPKPeerPaymentWebServiceCompanionTargetDevice_setPreferences_completion___block_invoke;
    v25[3] = &unk_24CFEA3D0;
    v26 = v7;
    objc_msgSend(v15, "setPeerPaymentPreferences:completion:", v6, v25);
    v16 = v26;
LABEL_13:

    goto LABEL_14;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_peerPaymentWebService);

  pk_General_log();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (WeakRetained)
  {
    if (v19)
    {
      pk_General_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Falling back to setting preferences via peer payment web service", buf, 2u);
      }

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EDF8]), "initWithPeerPaymentPreferences:", v6);
    v21 = objc_loadWeakRetained((id *)&self->_peerPaymentWebService);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __75__NPKPeerPaymentWebServiceCompanionTargetDevice_setPreferences_completion___block_invoke_65;
    v23[3] = &unk_24CFEA3F8;
    v23[4] = self;
    v24 = v7;
    objc_msgSend(v21, "peerPaymentUpdatePreferencesWithRequest:completion:", v15, v23);

    v16 = v24;
    goto LABEL_13;
  }
  if (v19)
  {
    pk_General_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Warning: No peer payment web service; not setting preferences",
        buf,
        2u);
    }

  }
  -[NPKPeerPaymentWebServiceCompanionTargetDevice preferences](self, "preferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v15, 0);
LABEL_14:

}

void __75__NPKPeerPaymentWebServiceCompanionTargetDevice_setPreferences_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Calling setPreferences:completion: completion with preferences %@ error %@", (uint8_t *)&v11, 0x16u);
    }

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

void __75__NPKPeerPaymentWebServiceCompanionTargetDevice_setPreferences_completion___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(a2, "peerPaymentPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "preferences");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v9);

    }
  }
  else
  {
    objc_msgSend(v5, "setDirty:", 0);
    NPKPairedDeviceSetPeerPaymentPreferences(v5);
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v5, 0);
  }

}

- (PKPeerPaymentWebService)peerPaymentWebService
{
  return (PKPeerPaymentWebService *)objc_loadWeakRetained((id *)&self->_peerPaymentWebService);
}

- (void)setPeerPaymentWebService:(id)a3
{
  objc_storeWeak((id *)&self->_peerPaymentWebService, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_peerPaymentWebService);
}

@end
