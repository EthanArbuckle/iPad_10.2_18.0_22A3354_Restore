@implementation AAUIBeneficiaryClaimRemoteUIController

- (AAUIBeneficiaryClaimRemoteUIController)initWithAppleAccount:(id)a3 claimCode:(id)a4
{
  id v7;
  id v8;
  AAUIBeneficiaryClaimRemoteUIController *v9;
  AAUIBeneficiaryClaimRemoteUIController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIBeneficiaryClaimRemoteUIController;
  v9 = -[AAUIBeneficiaryClaimRemoteUIController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleAccount, a3);
    objc_storeStrong((id *)&v10->_claimCode, a4);
  }

  return v10;
}

- (void)presentRemoteUIFromNavigationController:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  AAUIRemoteUIController *v13;
  AAUIRemoteUIController *benefeciaryClaimRemoteUIController;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to load Remote UI for Starting Beneficiary Claim...", buf, 2u);
  }

  v9 = objc_alloc(MEMORY[0x1E0CFABC8]);
  -[AAUIBeneficiaryClaimRemoteUIController _grandSlamAccount](self, "_grandSlamAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount accountStore](self->_appleAccount, "accountStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithGrandSlamAccount:accountStore:claimCode:", v10, v11, self->_claimCode);

  v13 = objc_alloc_init(AAUIRemoteUIController);
  benefeciaryClaimRemoteUIController = self->_benefeciaryClaimRemoteUIController;
  self->_benefeciaryClaimRemoteUIController = v13;

  -[AAUIRemoteUIController setNavigationController:](self->_benefeciaryClaimRemoteUIController, "setNavigationController:", v7);
  -[AAUIRemoteUIController setDelegate:](self->_benefeciaryClaimRemoteUIController, "setDelegate:", self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke;
  v17[3] = &unk_1EA2DBB60;
  v18 = v12;
  v19 = v6;
  v17[4] = self;
  v15 = v12;
  v16 = v6;
  -[AAUIBeneficiaryClaimRemoteUIController _getServerUILoadDelegateWithCompletion:](self, "_getServerUILoadDelegateWithCompletion:", v17);

}

void __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(*(id *)(a1 + 40), "urlRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke_2;
    v10[3] = &unk_1EA2DC458;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v7, "loadRequest:completion:", v8, v10);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
  }

}

void __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    *(_DWORD *)buf = 138412802;
    v15 = v7;
    v16 = 1024;
    v17 = a2;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "%@ done loading request with success %d. Error: %@", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke_24;
  block[3] = &unk_1EA2DCCA8;
  v8 = *(id *)(a1 + 40);
  v13 = a2;
  v11 = v5;
  v12 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __97__AAUIBeneficiaryClaimRemoteUIController_presentRemoteUIFromNavigationController_withCompletion___block_invoke_24(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *secondaryToken;

  v8 = a3;
  v9 = a4;
  -[AKAppleIDServerResourceLoadDelegate processResponse:](self->_serverUILoadDelegate, "processResponse:", a5);
  -[AAUIBeneficiaryClaimRemoteUIController _addHeadersToRequest:](self, "_addHeadersToRequest:", v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "redirectResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "allHeaderFields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("X-Apple-2SV-Authenticate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_storeStrong((id *)&self->_secondaryToken, v13);

    }
  }
  secondaryToken = self->_secondaryToken;
  if (secondaryToken)
    objc_msgSend(v9, "setValue:forHTTPHeaderField:", secondaryToken, CFSTR("X-Apple-2SV-Authenticate"));

  return 1;
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  AKAppleIDServerResourceLoadDelegate *serverUILoadDelegate;
  id v6;
  void *v7;
  void *v8;
  id obj;

  serverUILoadDelegate = self->_serverUILoadDelegate;
  v6 = a4;
  -[AKAppleIDServerResourceLoadDelegate processResponse:](serverUILoadDelegate, "processResponse:", v6);
  objc_msgSend(v6, "allHeaderFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("X-Apple-2SV-Authenticate"));
  obj = (id)objc_claimAutoreleasedReturnValue();

  v8 = obj;
  if (obj)
  {
    objc_storeStrong((id *)&self->_secondaryToken, obj);
    v8 = obj;
  }

}

- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  AAUIRemotePage *v5;

  v5 = objc_alloc_init(AAUIRemotePage);
  -[AAUIRemotePage setHidesBottomBarWhenPushed:](v5, "setHidesBottomBarWhenPushed:", 1);
  return v5;
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AAUIBeneficiaryClaimRemoteUIController _handleObjectModelChangeForController:objectModel:isModal:](self, "_handleObjectModelChangeForController:objectModel:isModal:", v7, v6, 0);

}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v9 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AAUIBeneficiaryClaimRemoteUIController _handleObjectModelChangeForController:objectModel:isModal:](self, "_handleObjectModelChangeForController:objectModel:isModal:", v9, v8, v5);

}

- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  BOOL v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Handling an object model: %@", buf, 0xCu);

  }
  objc_storeStrong((id *)&self->_currentObjectModel, a4);
  objc_msgSend(v9, "defaultPages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "leftBarButtonItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v15, "count") == 0;

  if ((_DWORD)v13)
  {
    if (v5)
    {
      v17 = objc_alloc(MEMORY[0x1E0DC34F0]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1EA2E2A18, CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 0, self, sel__cancelButtonForRemoteObjectModelWasTapped_);
      objc_msgSend(v14, "setLeftBarButtonItem:", v20);

    }
  }
  else
  {
    objc_initWeak((id *)buf, v8);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __100__AAUIBeneficiaryClaimRemoteUIController__handleObjectModelChangeForController_objectModel_isModal___block_invoke;
    v21[3] = &unk_1EA2DD710;
    objc_copyWeak(&v22, (id *)buf);
    v16 = *MEMORY[0x1E0CFFEB8];
    v23 = v5;
    objc_msgSend(v8, "setHandlerForButtonName:handler:", v16, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

void __100__AAUIBeneficiaryClaimRemoteUIController__handleObjectModelChangeForController_objectModel_isModal___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFEE0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CFFEC0]);

    if (v8)
    {
      if (*(_BYTE *)(a1 + 40))
      {
        v9 = (id)objc_msgSend(WeakRetained, "dismissObjectModelsAnimated:completion:", 1, 0);
      }
      else
      {
        _AAUILogSystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Cancel action received for a non-modal flow", v11, 2u);
        }

      }
    }
  }

}

- (void)_addHeadersToRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Appending headers to page request %@...", (uint8_t *)&v11, 0xCu);
  }

  -[AAUIBeneficiaryClaimRemoteUIController _grandSlamAccount](self, "_grandSlamAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount accountStore](self->_appleAccount, "accountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "credentialForAccount:serviceID:", v6, *MEMORY[0x1E0CFAB40]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "token");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate setServiceToken:](self->_serverUILoadDelegate, "setServiceToken:", v9);
  -[AKAppleIDServerResourceLoadDelegate signRequest:](self->_serverUILoadDelegate, "signRequest:", v4);
  objc_msgSend(v6, "aida_dsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v10);

}

- (void)_cancelButtonForRemoteObjectModelWasTapped:(id)a3
{
  id v3;

  v3 = (id)-[AAUIRemoteUIController dismissObjectModelsAnimated:completion:](self->_benefeciaryClaimRemoteUIController, "dismissObjectModelsAnimated:completion:", 1, 0);
}

- (id)_grandSlamAccount
{
  ACAccount *grandSlamAccount;
  NSObject *v4;
  void *v5;
  ACAccount *v6;
  ACAccount *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    _AAUILogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Fetching grandslam account from apple account", buf, 2u);
    }

    -[ACAccount accountStore](self->_appleAccount, "accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aida_accountForiCloudAccount:", self->_appleAccount);
    v6 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v7 = self->_grandSlamAccount;
    self->_grandSlamAccount = v6;

    grandSlamAccount = self->_grandSlamAccount;
    if (!grandSlamAccount)
    {
      _AAUILogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Could not fetch GrandSlam Account, we're destined for failure!", v10, 2u);
      }

      grandSlamAccount = self->_grandSlamAccount;
    }
  }
  return grandSlamAccount;
}

- (id)_authController
{
  AKAppleIDAuthenticationController *authController;
  AKAppleIDAuthenticationController *v4;
  AKAppleIDAuthenticationController *v5;

  authController = self->_authController;
  if (!authController)
  {
    v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x1E0D00130]);
    v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }
  return authController;
}

- (void)_getServerUILoadDelegateWithCompletion:(id)a3
{
  void (**v4)(id, AKAppleIDServerResourceLoadDelegate *, _QWORD);
  AKAppleIDServerResourceLoadDelegate *serverUILoadDelegate;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(id, AKAppleIDServerResourceLoadDelegate *, _QWORD);
  uint8_t buf[16];

  v4 = (void (**)(id, AKAppleIDServerResourceLoadDelegate *, _QWORD))a3;
  serverUILoadDelegate = self->_serverUILoadDelegate;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (serverUILoadDelegate)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "AKAppleIDServerResourceLoadDelegate cache available", buf, 2u);
    }

    if (v4)
      v4[2](v4, self->_serverUILoadDelegate, 0);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Starting to fetch AKAppleIDServerResourceLoadDelegate", buf, 2u);
    }

    -[AAUIBeneficiaryClaimRemoteUIController _grandSlamAccount](self, "_grandSlamAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0D00128]);
    objc_msgSend(v8, "aida_alternateDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAltDSID:", v10);

    objc_msgSend(v9, "setAnticipateEscrowAttempt:", 1);
    -[AAUIBeneficiaryClaimRemoteUIController _authController](self, "_authController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__AAUIBeneficiaryClaimRemoteUIController__getServerUILoadDelegateWithCompletion___block_invoke;
    v12[3] = &unk_1EA2DD760;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v11, "getServerUILoadDelegateWithContext:completion:", v9, v12);

  }
}

void __81__AAUIBeneficiaryClaimRemoteUIController__getServerUILoadDelegateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Error! Unable to get AKAppleIDServerResourceLoadDelegate. %@", buf, 0xCu);
    }

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__AAUIBeneficiaryClaimRemoteUIController__getServerUILoadDelegateWithCompletion___block_invoke_42;
  v12[3] = &unk_1EA2DD738;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __81__AAUIBeneficiaryClaimRemoteUIController__getServerUILoadDelegateWithCompletion___block_invoke_42(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)a1[4];
  if (v2)
    objc_storeStrong((id *)(a1[5] + 24), v2);
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[6]);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_claimCode, 0);
  objc_storeStrong((id *)&self->_currentObjectModel, 0);
  objc_storeStrong((id *)&self->_benefeciaryClaimRemoteUIController, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_secondaryToken, 0);
  objc_storeStrong((id *)&self->_serverUILoadDelegate, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
}

@end
