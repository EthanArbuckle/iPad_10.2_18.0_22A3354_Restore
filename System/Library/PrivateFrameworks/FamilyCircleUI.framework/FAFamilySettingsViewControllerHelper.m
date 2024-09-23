@implementation FAFamilySettingsViewControllerHelper

- (FAFamilySettingsViewControllerHelper)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4 familyPictureStore:(id)a5 accountManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FAFamilySettingsViewControllerHelper *v15;
  FAFamilySettingsViewControllerHelper *v16;
  uint64_t v17;
  ACAccountStore *accountStore;
  uint64_t v19;
  ACAccount *grandSlamAccount;
  NSOperationQueue *v21;
  NSOperationQueue *networkingQueue;
  NSMutableDictionary *v23;
  NSMutableDictionary *objectModelDecorators;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)FAFamilySettingsViewControllerHelper;
  v15 = -[FAFamilySettingsViewControllerHelper init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_iCloudGrandSlamSigner, a4);
    objc_storeStrong((id *)&v16->_appleAccount, a3);
    objc_storeStrong((id *)&v16->_accountManager, a6);
    -[AAGrandSlamSigner accountStore](v16->_iCloudGrandSlamSigner, "accountStore");
    v17 = objc_claimAutoreleasedReturnValue();
    accountStore = v16->_accountStore;
    v16->_accountStore = (ACAccountStore *)v17;

    -[AAGrandSlamSigner grandSlamAccount](v16->_iCloudGrandSlamSigner, "grandSlamAccount");
    v19 = objc_claimAutoreleasedReturnValue();
    grandSlamAccount = v16->_grandSlamAccount;
    v16->_grandSlamAccount = (ACAccount *)v19;

    objc_storeStrong((id *)&v16->_familyPictureStore, a5);
    v21 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    networkingQueue = v16->_networkingQueue;
    v16->_networkingQueue = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    objectModelDecorators = v16->_objectModelDecorators;
    v16->_objectModelDecorators = v23;

  }
  return v16;
}

- (id)_appleIDGrandSlamSigner
{
  AAGrandSlamSigner *appleIDGrandSlamSigner;
  id v4;
  AAGrandSlamSigner *v5;
  AAGrandSlamSigner *v6;

  appleIDGrandSlamSigner = self->_appleIDGrandSlamSigner;
  if (!appleIDGrandSlamSigner)
  {
    v4 = objc_alloc(MEMORY[0x24BE049B0]);
    v5 = (AAGrandSlamSigner *)objc_msgSend(v4, "initWithAccountStore:grandSlamAccount:appTokenID:", self->_accountStore, self->_grandSlamAccount, *MEMORY[0x24BE04870]);
    v6 = self->_appleIDGrandSlamSigner;
    self->_appleIDGrandSlamSigner = v5;

    appleIDGrandSlamSigner = self->_appleIDGrandSlamSigner;
  }
  return appleIDGrandSlamSigner;
}

- (id)_requestConfigurator
{
  FARequestConfigurator *requestConfigurator;
  FARequestConfigurator *v4;
  FARequestConfigurator *v5;

  requestConfigurator = self->_requestConfigurator;
  if (!requestConfigurator)
  {
    v4 = (FARequestConfigurator *)objc_msgSend(objc_alloc(MEMORY[0x24BE30AE0]), "initWithAccount:", self->_appleAccount);
    v5 = self->_requestConfigurator;
    self->_requestConfigurator = v4;

    requestConfigurator = self->_requestConfigurator;
  }
  return requestConfigurator;
}

- (id)_itunesAccount
{
  ACAccount *itunesAccount;
  void *v4;
  ACAccount *v5;
  ACAccount *v6;

  itunesAccount = self->_itunesAccount;
  if (!itunesAccount)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_activeiTunesAccount");
    v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v6 = self->_itunesAccount;
    self->_itunesAccount = v5;

    itunesAccount = self->_itunesAccount;
  }
  return itunesAccount;
}

- (void)dealloc
{
  AAUIRemoteUIController *iCloudRemoteUIController;
  AAUIRemoteUIController *appleIDRemoteUIController;
  objc_super v5;

  -[NSOperationQueue cancelAllOperations](self->_networkingQueue, "cancelAllOperations");
  iCloudRemoteUIController = self->_iCloudRemoteUIController;
  if (iCloudRemoteUIController)
    -[AAUIRemoteUIController setDelegate:](iCloudRemoteUIController, "setDelegate:", 0);
  appleIDRemoteUIController = self->_appleIDRemoteUIController;
  if (appleIDRemoteUIController)
    -[AAUIRemoteUIController setDelegate:](appleIDRemoteUIController, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)FAFamilySettingsViewControllerHelper;
  -[FAFamilySettingsViewControllerHelper dealloc](&v5, sel_dealloc);
}

- (BOOL)loadRemoteUIWithRequest:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "urlRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v9, "urlRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[FAFamilySettingsViewControllerHelper loadRemoteUIWithRequest:url:type:completion:](self, "loadRemoteUIWithRequest:url:type:completion:", v11, v13, a4, v8);

  return a4;
}

- (BOOL)loadRemoteUIWithRequest:(id)a3 url:(id)a4 type:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSURL *urlBeingLoaded;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  AAUIServerUIHookHandler *v18;
  AAUIServerUIHookHandler *serverUIHookHandler;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  urlBeingLoaded = self->_urlBeingLoaded;
  if (!urlBeingLoaded)
  {
    objc_storeStrong((id *)&self->_urlBeingLoaded, a4);
    v14 = objc_alloc_init(MEMORY[0x24BE04D70]);
    if (a5 == 1)
    {
      v15 = 72;
    }
    else
    {
      if (a5 == 2)
        objc_storeStrong((id *)&self->_familyV2RemoteUIController, v14);
      v15 = 64;
    }
    objc_storeStrong((id *)((char *)&self->super.isa + v15), v14);
    v16 = objc_alloc(MEMORY[0x24BE04D78]);
    objc_msgSend(MEMORY[0x24BE04D78], "fcui_defaultFresnoServerHooks");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (AAUIServerUIHookHandler *)objc_msgSend(v16, "initWithRemoteUIController:hooks:", v14, v17);
    serverUIHookHandler = self->_serverUIHookHandler;
    self->_serverUIHookHandler = v18;

    if (a5 == 2)
      -[FAFamilySettingsViewControllerHelper _setFresnoRemoteUIDelgate:](self, "_setFresnoRemoteUIDelgate:", v14);
    else
      objc_msgSend(v14, "setDelegate:", self);
    -[FAFamilySettingsViewControllerHelper navigationController](self, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNavigationController:", v20);

    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __84__FAFamilySettingsViewControllerHelper_loadRemoteUIWithRequest_url_type_completion___block_invoke;
    v22[3] = &unk_24C88CC90;
    objc_copyWeak(&v24, &location);
    v23 = v12;
    objc_msgSend(v14, "loadRequest:completion:", v10, v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return urlBeingLoaded == 0;
}

void __84__FAFamilySettingsViewControllerHelper_loadRemoteUIWithRequest_url_type_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__FAFamilySettingsViewControllerHelper_loadRemoteUIWithRequest_url_type_completion___block_invoke_2;
  v7[3] = &unk_24C88CC68;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v11 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

  objc_destroyWeak(&v10);
}

void __84__FAFamilySettingsViewControllerHelper_loadRemoteUIWithRequest_url_type_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)WeakRetained[24];
  WeakRetained[24] = 0;

  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    v8[0] = 67109378;
    v8[1] = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_20DE41000, v4, OS_LOG_TYPE_DEFAULT, "Loading remote UI for family member details result: %d. Error: %@", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (void)loadMemberDetailsForFamilyMember:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  FAFamilyMemberDetailsUIRequest *v9;
  void *v10;
  uint64_t v11;
  FAFamilyMember *memberBeingViewed;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_memberBeingViewed, a3);
  v9 = -[FAFamilyRequest initWithGrandSlamSigner:]([FAFamilyMemberDetailsUIRequest alloc], "initWithGrandSlamSigner:", self->_iCloudGrandSlamSigner);
  -[FAFamilyMember dsid](self->_memberBeingViewed, "dsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  memberBeingViewed = self->_memberBeingViewed;
  if (v11 < 1)
  {
    -[FAFamilyMember inviteEmail](memberBeingViewed, "inviteEmail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyMemberDetailsUIRequest setMemberEmail:](v9, "setMemberEmail:", v13);
  }
  else
  {
    -[FAFamilyMember dsid](memberBeingViewed, "dsid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyMemberDetailsUIRequest setMemberDSID:](v9, "setMemberDSID:", v13);
  }

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __84__FAFamilySettingsViewControllerHelper_loadMemberDetailsForFamilyMember_completion___block_invoke;
  v15[3] = &unk_24C88CCB8;
  objc_copyWeak(&v17, &location);
  v14 = v8;
  v16 = v14;
  -[FAFamilyMemberDetailsUIRequest URLRequestWithCompletion:](v9, "URLRequestWithCompletion:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __84__FAFamilySettingsViewControllerHelper_loadMemberDetailsForFamilyMember_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "loadRemoteUIWithRequest:url:type:completion:", v5, v6, 0, *(_QWORD *)(a1 + 32));
}

- (void)_setFresnoRemoteUIDelgate:(id)a3
{
  id v4;
  FACircleRemoteUIDelegate *v5;
  FACircleRemoteUIDelegate *familyRemoteUIDelegate;
  FACircleContext *v7;

  v4 = a3;
  v7 = -[FACircleContext initWithEventType:]([FACircleContext alloc], "initWithEventType:", CFSTR("FACircleEventTypeFamilySettings"));
  v5 = -[FACircleRemoteUIDelegate initWithContext:serverHookHandler:pictureStore:]([FACircleRemoteUIDelegate alloc], "initWithContext:serverHookHandler:pictureStore:", v7, self->_serverUIHookHandler, self->_familyPictureStore);
  familyRemoteUIDelegate = self->_familyRemoteUIDelegate;
  self->_familyRemoteUIDelegate = v5;

  objc_msgSend(v4, "setDelegate:", self->_familyRemoteUIDelegate);
}

- (void)_fetchFamilyPaymentInfoWithCompletion:(id)a3
{
  id v4;
  FAFamilyPaymentInfoRequest *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  FAFamilySettingsViewControllerHelper *v14;
  id v15;

  v4 = a3;
  self->_fetchingPaymentInfo = 1;
  v5 = -[AAFamilyRequest initWithGrandSlamSigner:]([FAFamilyPaymentInfoRequest alloc], "initWithGrandSlamSigner:", self->_iCloudGrandSlamSigner);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __78__FAFamilySettingsViewControllerHelper__fetchFamilyPaymentInfoWithCompletion___block_invoke;
  v13 = &unk_24C88CBA0;
  v14 = self;
  v15 = v4;
  v6 = v4;
  v7 = _Block_copy(&v10);
  v8 = objc_alloc(MEMORY[0x24BE04A18]);
  v9 = (void *)objc_msgSend(v8, "initWithRequest:handler:", v5, v7, v10, v11, v12, v13, v14);
  -[NSOperationQueue addOperation:](self->_networkingQueue, "addOperation:", v9);

}

void __78__FAFamilySettingsViewControllerHelper__fetchFamilyPaymentInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  uint8_t buf[16];

  v3 = a2;
  if (objc_msgSend(v3, "statusCode") == 401)
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v4, OS_LOG_TYPE_DEFAULT, "Family payment info request returned 401. We need to re-auth...", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "renewCredentialsForAccount:force:reason:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), 1, 0, &__block_literal_global_11);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__FAFamilySettingsViewControllerHelper__fetchFamilyPaymentInfoWithCompletion___block_invoke_52;
  block[3] = &unk_24C88CB78;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __78__FAFamilySettingsViewControllerHelper__fetchFamilyPaymentInfoWithCompletion___block_invoke_50(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = a2;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials for family payment info request: %ld. Error: %@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __78__FAFamilySettingsViewControllerHelper__fetchFamilyPaymentInfoWithCompletion___block_invoke_52(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  objc_msgSend(*(id *)(a1 + 40), "creditCard");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  -[FAFamilySettingsViewControllerHelper _handleObjectModelChangeForController:objectModel:isModal:](self, "_handleObjectModelChangeForController:objectModel:isModal:", a3, a4, 0);
}

- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v5 = a5;
  v12 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "handleObjectModelChangeForController - %@", (uint8_t *)&v10, 0xCu);

  }
  -[AAUIServerUIHookHandler processObjectModel:isModal:](self->_serverUIHookHandler, "processObjectModel:isModal:", v7, v5);

}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  objc_msgSend(a4, "setModalInPresentation:", 0);
}

- (void)remoteUIController:(id)a3 willLoadRequest:(id)a4
{
  AAUIRemoteUIController *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  dispatch_time_t v14;
  AAGrandSlamSigner *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  ACAccount *itunesAccount;
  void *v25;
  int v26;
  ACAccount *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (AAUIRemoteUIController *)a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, a4);
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", self->_urlBeingLoaded);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v7, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsString:", CFSTR("prefs:itunes"));

    if (v12)
    {
      v13 = (id)-[AAUIRemoteUIController dismissObjectModelsAnimated:completion:](v6, "dismissObjectModelsAnimated:completion:", 1, 0);
      v14 = dispatch_time(0, 500000000);
      dispatch_after(v14, MEMORY[0x24BDAC9B8], &__block_literal_global_57);
    }
    else
    {
      if (self->_appleIDRemoteUIController == v6)
      {
        -[FAFamilySettingsViewControllerHelper _appleIDGrandSlamSigner](self, "_appleIDGrandSlamSigner");
        v15 = (AAGrandSlamSigner *)objc_claimAutoreleasedReturnValue();
      }
      else if (self->_iCloudRemoteUIController == v6)
      {
        v15 = self->_iCloudGrandSlamSigner;
        objc_msgSend(v7, "aa_addLoggedInAppleIDHeaderWithAccount:", self->_appleAccount);
      }
      else
      {
        v15 = 0;
      }
      -[AAGrandSlamSigner signURLRequest:isUserInitiated:](v15, "signURLRequest:isUserInitiated:", v7, 1);
      objc_msgSend(v7, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_appleAccount, 0);
      objc_msgSend(MEMORY[0x24BE04958], "clientInfoHeader");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forHTTPHeaderField:", v16, CFSTR("X-MMe-Client-Info"));

      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", *MEMORY[0x24BDBCAE8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uppercaseString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forHTTPHeaderField:", v19, CFSTR("X-MMe-Country"));

      -[FAFamilySettingsViewControllerHelper _itunesAccount](self, "_itunesAccount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ams_DSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "length"))
      {
        objc_msgSend(v7, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v22);
      }
      else
      {
        _FALogSystem();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          itunesAccount = self->_itunesAccount;
          v26 = 138412290;
          v27 = itunesAccount;
          _os_log_impl(&dword_20DE41000, v23, OS_LOG_TYPE_DEFAULT, "No DSID for iTunes account ivar: %@", (uint8_t *)&v26, 0xCu);
        }

      }
      objc_msgSend(v7, "aa_addDeviceInternalDevHeaderIfEnabled");
      objc_msgSend(v7, "aa_addDeviceIDHeader");
      objc_msgSend(v7, "aa_addLocationSharingAllowedHeader");
      if (-[FAFamilyMember isMe](self->_memberBeingViewed, "isMe"))
      {
        -[FAFamilySettingsViewControllerHelper _itunesAccount](self, "_itunesAccount");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fam_addiTunesHeadersWithAccount:", v25);

      }
    }
  }

}

void __75__FAFamilySettingsViewControllerHelper_remoteUIController_willLoadRequest___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;

  v2 = 0;
  objc_msgSend(MEMORY[0x24BE30B48], "urlDestinationTo:error:", 6, &v2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSMutableURLRequest *currentRemoteUIRequest;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "statusCode") == 401)
  {
    _FALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "BML request returned 401. We need to re-auth...", buf, 2u);
    }

    -[ACAccountStore renewCredentialsForAccount:force:reason:completion:](self->_accountStore, "renewCredentialsForAccount:force:reason:completion:", self->_appleAccount, 1, 0, &__block_literal_global_66);
  }
  else
  {
    if (objc_msgSend(v7, "statusCode") == 200)
    {
      objc_msgSend(v7, "allHeaderFields");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForKey:", CFSTR("X-Apple-Family-Changed"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = MEMORY[0x24BDAC760];
      if (v10)
      {
        _FALogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v10;
          _os_log_impl(&dword_20DE41000, v12, OS_LOG_TYPE_DEFAULT, "Family properties changed while we're in BML: %@", buf, 0xCu);
        }

        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_67;
        block[3] = &unk_24C88C190;
        block[4] = self;
        v28 = v10;
        v29 = v7;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
      objc_msgSend(v7, "allHeaderFields");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForKey:", CFSTR("X-Apple-Family-Subscription-Changed"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "BOOLValue"))
      {
        _FALogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v14;
          _os_log_impl(&dword_20DE41000, v15, OS_LOG_TYPE_DEFAULT, "Family subscription properties changed: %@", buf, 0xCu);
        }

        dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_70);
      }
      objc_msgSend(v7, "allHeaderFields");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForKey:", CFSTR("X-MMe-Setup-Family-Linked-ITunes-AppleID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        _FALogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v17;
          _os_log_impl(&dword_20DE41000, v18, OS_LOG_TYPE_DEFAULT, "Found updated linked Apple Account account header: %@", buf, 0xCu);
        }

        v25[0] = v11;
        v25[1] = 3221225472;
        v25[2] = __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_72;
        v25[3] = &unk_24C88B958;
        v25[4] = self;
        v26 = v17;
        dispatch_async(MEMORY[0x24BDAC9B8], v25);

      }
      if (-[NSMutableURLRequest aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:](self->_currentRemoteUIRequest, "aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:", v7))
      {
        _FALogSystem();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DE41000, v19, OS_LOG_TYPE_DEFAULT, "Device is provisioned... Reissuing request...", buf, 2u);
        }

        objc_msgSend(v6, "loadCompletion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        currentRemoteUIRequest = self->_currentRemoteUIRequest;
        v23[0] = v11;
        v23[1] = 3221225472;
        v23[2] = __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_73;
        v23[3] = &unk_24C88BF40;
        v24 = v20;
        v22 = v20;
        objc_msgSend(v6, "loadRequest:completion:", currentRemoteUIRequest, v23);

      }
    }
    else
    {
      -[FAFamilySettingsViewControllerHelper delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "familySettingsHelperShowConnectivityAlert:", self);
    }

  }
}

void __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = a2;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials to continue BML flow: %ld. Error: %@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_67(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familySettingsHelper:handleFamilyStatusChange:affectedFamilyMember:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("MemberDeleted")) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("InviteDeleted")))
  {
    v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "popObjectModelAnimated:", 1);
  }
  return objc_msgSend(MEMORY[0x24BE30A58], "handleURLResponse:", *(_QWORD *)(a1 + 48));
}

uint64_t __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_69()
{
  return objc_msgSend(MEMORY[0x24BE30A30], "broadcastServicesChangedNotification");
}

void __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_72(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familySettingsHelper:updateMemberDetailsPageWithLinkedAppleID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __82__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveHTTPResponse___block_invoke_73(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _FALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Failed to load Family Settings remote UI: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];

  v8 = a3;
  v9 = a4;
  if (*a5 == 1)
    -[FAFamilySettingsViewControllerHelper _handleObjectModelChangeForController:objectModel:isModal:](self, "_handleObjectModelChangeForController:objectModel:isModal:", v8, v9, 0);
  objc_msgSend(v9, "clientInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("paymentMethodUpdated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __94__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke;
    v18[3] = &unk_24C88B7F0;
    v18[4] = self;
    -[FAFamilySettingsViewControllerHelper _fetchFamilyPaymentInfoWithCompletion:](self, "_fetchFamilyPaymentInfoWithCompletion:", v18);
    if (*a5 == 4)
    {
      objc_msgSend(v9, "allPages");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        -[FAFamilySettingsViewControllerHelper navigationController](self, "navigationController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "viewControllers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v16, "indexOfObject:", self);
        if (v17 == objc_msgSend(v16, "count") - 2)
          objc_msgSend(v9, "setPages:", 0);

      }
    }
  }

}

void __94__FAFamilySettingsViewControllerHelper_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familySettingsHelperDidUpdatePaymentInfo:", *(_QWORD *)(a1 + 32));

}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  FAProfileViewTableViewDecorator *v18;
  void *v19;
  void *v20;
  void *v21;
  FAProfileViewTableViewDecorator *v22;
  FAProfilePictureTableViewDecorator *v23;
  void *v24;
  FAProfilePictureTableViewDecorator *v25;
  NSMutableDictionary *objectModelDecorators;
  void *v27;
  uint8_t v28[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[FAFamilySettingsViewControllerHelper _handleObjectModelChangeForController:objectModel:isModal:](self, "_handleObjectModelChangeForController:objectModel:isModal:", a3, v8, v5);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v8, "allPages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v13++), "setHidesBottomBarWhenPushed:", 1);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "defaultPages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_memberBeingViewed)
  {
    if (objc_msgSend(v15, "hasTableView"))
    {
      objc_msgSend(v8, "sourceURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        _FALogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_20DE41000, v17, OS_LOG_TYPE_DEFAULT, "Decorating RUI page...", v28, 2u);
        }

        v18 = [FAProfileViewTableViewDecorator alloc];
        objc_msgSend(v15, "tableViewOM");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "tableView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "tableViewOM");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[FAProfileViewTableViewDecorator initWithTableView:ruiTableView:forPerson:pictureStore:](v18, "initWithTableView:ruiTableView:forPerson:pictureStore:", v20, v21, self->_memberBeingViewed, self->_familyPictureStore);

        v23 = [FAProfilePictureTableViewDecorator alloc];
        objc_msgSend(v15, "tableViewOM");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[FAProfilePictureTableViewDecorator initWithTableView:ruiTableView:pictureStore:](v23, "initWithTableView:ruiTableView:pictureStore:", v22, v24, self->_familyPictureStore);

        objectModelDecorators = self->_objectModelDecorators;
        objc_msgSend(v8, "sourceURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](objectModelDecorators, "setObject:forKey:", v25, v27);

      }
    }
  }

}

- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  return objc_alloc_init(MEMORY[0x24BE04D68]);
}

- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4
{
  void *v5;
  NSMutableDictionary *objectModelDecorators;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "sourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objectModelDecorators = self->_objectModelDecorators;
    objc_msgSend(v8, "sourceURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](objectModelDecorators, "removeObjectForKey:", v7);

  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  -[NSMutableDictionary removeAllObjects](self->_objectModelDecorators, "removeAllObjects", a3);
}

- (FAFamilySettingsViewControllerHelperDelegate)delegate
{
  return (FAFamilySettingsViewControllerHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (NSURL)urlBeingLoaded
{
  return self->_urlBeingLoaded;
}

- (void)setUrlBeingLoaded:(id)a3
{
  objc_storeStrong((id *)&self->_urlBeingLoaded, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBeingLoaded, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_familyPictureStore, 0);
  objc_storeStrong((id *)&self->_networkingQueue, 0);
  objc_storeStrong((id *)&self->_itunesAccount, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_familyRemoteUIDelegate, 0);
  objc_storeStrong((id *)&self->_familyV2RemoteUIController, 0);
  objc_storeStrong((id *)&self->_appleIDRemoteUIController, 0);
  objc_storeStrong((id *)&self->_iCloudRemoteUIController, 0);
  objc_storeStrong((id *)&self->_requestConfigurator, 0);
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, 0);
  objc_storeStrong((id *)&self->_objectModelDecorators, 0);
  objc_storeStrong((id *)&self->_memberBeingViewed, 0);
  objc_storeStrong((id *)&self->_iCloudGrandSlamSigner, 0);
  objc_storeStrong((id *)&self->_appleIDGrandSlamSigner, 0);
  objc_storeStrong((id *)&self->_serverUIHookHandler, 0);
}

@end
