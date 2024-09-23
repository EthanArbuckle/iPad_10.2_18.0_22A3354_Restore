@implementation DMCBYODEnrollmentFlowUIPresenter

- (DMCEnrollmentAuthenticationController)authenticationController
{
  DMCEnrollmentAuthenticationController *authenticationController;
  DMCEnrollmentAuthenticationController *v4;
  DMCEnrollmentAuthenticationController *v5;

  authenticationController = self->_authenticationController;
  if (!authenticationController)
  {
    v4 = (DMCEnrollmentAuthenticationController *)objc_opt_new();
    v5 = self->_authenticationController;
    self->_authenticationController = v4;

    authenticationController = self->_authenticationController;
  }
  return authenticationController;
}

- (void)_showCancelAlertForMAID:(id)a3 actionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "length");
  DMCLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[DMCBYODEnrollmentFlowUIPresenter managedAppleID](self, "managedAppleID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    DMCLocalizedFormat();
    v9 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    DMCLocalizedString();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v9;
  objc_msgSend(v6, "length", v21);
  DMCLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDF67E8];
  DMCLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __74__DMCBYODEnrollmentFlowUIPresenter__showCancelAlertForMAID_actionHandler___block_invoke;
  v25[3] = &unk_24D52E3C0;
  v15 = v7;
  v26 = v15;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDF67E8];
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __74__DMCBYODEnrollmentFlowUIPresenter__showCancelAlertForMAID_actionHandler___block_invoke_2;
  v23[3] = &unk_24D52E3E8;
  v23[4] = self;
  v24 = v15;
  v18 = v15;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v10, 0, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v19);
  objc_msgSend(v11, "addAction:", v16);
  -[DMCEnrollmentFlowUIPresenterBase navigationController](self, "navigationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "presentAlert:animated:", v11, 1);

}

uint64_t __74__DMCBYODEnrollmentFlowUIPresenter__showCancelAlertForMAID_actionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__DMCBYODEnrollmentFlowUIPresenter__showCancelAlertForMAID_actionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_presentOKAlertWithTitle:(id)a3 message:(id)a4 action:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDF67E8];
  DMCLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __76__DMCBYODEnrollmentFlowUIPresenter__presentOKAlertWithTitle_message_action___block_invoke;
  v16[3] = &unk_24D52E3C0;
  v17 = v8;
  v12 = v8;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v13);
  -[DMCEnrollmentFlowUIPresenterBase navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DMCEnrollmentFlowUIPresenterBase navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentAlert:animated:", v9, 1);
  }
  else
  {
    -[DMCEnrollmentFlowUIPresenterBase baseViewController](self, "baseViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentViewController:animated:completion:", v9, 1, 0);
  }

}

uint64_t __76__DMCBYODEnrollmentFlowUIPresenter__presentOKAlertWithTitle_message_action___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestUsernameWithDefaultUsername:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__DMCBYODEnrollmentFlowUIPresenter_requestUsernameWithDefaultUsername_completionHandler___block_invoke;
  block[3] = &unk_24D52E410;
  v11 = v6;
  v12 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __89__DMCBYODEnrollmentFlowUIPresenter_requestUsernameWithDefaultUsername_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setUsernameViewController:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "setUsernameCompletionHandler:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsernameEditable:", 1);

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsername:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showPasswordField:", 0);

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInProgress:", 0);

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStyle:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setHasDoneAuthServices:", 0);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "usernameViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:foundationViewController:", v11, v10);

}

- (void)requestESSOApplicationInstallationWithITunesItemID:(id)a3 requiredEntitlements:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  DMCBYODEnrollmentFlowUIPresenter *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  -[DMCBYODEnrollmentFlowUIPresenter setESSOApplicationInstallationCompletionHandler:](self, "setESSOApplicationInstallationCompletionHandler:", a5);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke;
  block[3] = &unk_24D52E488;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04488]), "initWithName:", CFSTR("DMC Enrollment SSO App Lockup"));
  v3 = objc_alloc(MEMORY[0x24BE04450]);
  objc_msgSend(*(id *)(a1 + 32), "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithStringValue:", v4);

  v6 = objc_alloc(MEMORY[0x24BE04478]);
  v7 = (void *)objc_msgSend(v6, "initWithID:kind:context:", v5, *MEMORY[0x24BE04430], *MEMORY[0x24BE04418]);
  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke_2;
  v12[3] = &unk_24D52E460;
  v13 = *(id *)(a1 + 32);
  v14 = v8;
  v9 = *(void **)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = v2;
  v17 = v9;
  v10 = v2;
  v11 = v8;
  objc_msgSend(v10, "_cacheLockupsWithRequests:withCompletionBlock:", v11, v12);

}

void __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!objc_msgSend(v3, "count"))
  {
    v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v16 = v5;
      _os_log_impl(&dword_216358000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch ASCLockupRequest with iTunes item ID: %{public}@. Will let the UI have another try.", buf, 0xCu);
    }
  }
  v6 = objc_msgSend(v3, "count");
  v7 = v3;
  if (!v6)
    v7 = *(void **)(a1 + 40);
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke_42;
  v11[3] = &unk_24D52E438;
  v9 = *(void **)(a1 + 56);
  v11[4] = *(_QWORD *)(a1 + 48);
  v12 = v8;
  v13 = v9;
  v14 = *(id *)(a1 + 64);
  v10 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __126__DMCBYODEnrollmentFlowUIPresenter_requestESSOApplicationInstallationWithITunesItemID_requiredEntitlements_completionHandler___block_invoke_42(uint64_t a1)
{
  DMCEnrollmentESSOApplicationDisclosureViewController *v2;

  v2 = -[DMCEnrollmentESSOApplicationDisclosureViewController initWithDelegate:lockupRequest:lockupViewGroup:requiredEntitlements:]([DMCEnrollmentESSOApplicationDisclosureViewController alloc], "initWithDelegate:lockupRequest:lockupViewGroup:requiredEntitlements:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:", v2);

}

- (void)requestDevicePasscodeWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  DMCLocalizedStringByDevice();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowUIPresenterBase requestDevicePasscodeWithDescriptionText:completionHandler:](self, "requestDevicePasscodeWithDescriptionText:completionHandler:", v5, v4);

}

- (void)requestWebAuthenticationWithWebAuthURL:(id)a3 authenticator:(id)a4 authParams:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  DMCBYODEnrollmentFlowUIPresenter *v25;
  id v26;
  id v27;
  id v28;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x24BDB7178];
  v14 = a3;
  v15 = [v13 alloc];
  v16 = *MEMORY[0x24BE60CE8];
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __118__DMCBYODEnrollmentFlowUIPresenter_requestWebAuthenticationWithWebAuthURL_authenticator_authParams_completionHandler___block_invoke;
  v24 = &unk_24D52E4D8;
  v25 = self;
  v17 = v12;
  v28 = v17;
  v18 = v10;
  v26 = v18;
  v19 = v11;
  v27 = v19;
  v20 = (void *)objc_msgSend(v15, "initWithURL:callbackURLScheme:completionHandler:", v14, v16, &v21);

  if ((objc_msgSend(MEMORY[0x24BE2A7F0], "useNonEphemeralWebAuthSession", v21, v22, v23, v24, v25) & 1) == 0)
    objc_msgSend(v20, "setPrefersEphemeralWebBrowserSession:", 1);
  objc_msgSend(v20, "setPresentationContextProvider:", self);
  objc_msgSend(v20, "start");

}

void __118__DMCBYODEnrollmentFlowUIPresenter_requestWebAuthenticationWithWebAuthURL_authenticator_authParams_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setHasDoneAuthServices:", 1);
  v7 = *(void (***)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 56);
  if (v7)
  {
    if (v5)
    {
      v9 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __118__DMCBYODEnrollmentFlowUIPresenter_requestWebAuthenticationWithWebAuthURL_authenticator_authParams_completionHandler___block_invoke_2;
      v10[3] = &unk_24D52E4B0;
      v11 = v7;
      objc_msgSend(v9, "authTokensWithCallbackURL:authParams:completionHandler:", v5, v8, v10);

    }
    else
    {
      ((void (**)(_QWORD, _QWORD, BOOL, id))v7)[2](v7, 0, objc_msgSend(v6, "code") == 1, v6);
    }
  }

}

uint64_t __118__DMCBYODEnrollmentFlowUIPresenter_requestWebAuthenticationWithWebAuthURL_authenticator_authParams_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v11 = a3;
  v12 = a7;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke;
  v15[3] = &unk_24D52E5A0;
  v16 = v11;
  v17 = v12;
  v15[4] = self;
  v18 = a6;
  v19 = a5;
  v13 = v11;
  v14 = v12;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD, _QWORD);
  id v17;
  _QWORD v18[4];
  id v19;
  __int16 v20;
  id location;
  _QWORD v22[5];

  objc_msgSend(*(id *)(a1 + 32), "setAuthenticationCompletionHandler:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setUsernameViewController:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInProgress:", 0);

  v5 = objc_msgSend(*(id *)(a1 + 40), "length");
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUsername:", *(_QWORD *)(a1 + 40));

    if (objc_msgSend(*(id *)(a1 + 32), "hasDoneAuthServices"))
    {
      v8 = (void *)MEMORY[0x24BDF6F90];
      objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_2;
      v22[3] = &unk_24D52E500;
      v22[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", v10, 5242880, v22, 0, 0.100000001);

    }
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_3;
  v18[3] = &unk_24D52E550;
  objc_copyWeak(&v19, &location);
  v20 = *(_WORD *)(a1 + 56);
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199F7854](v18);
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "usernameViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pushViewController:foundationViewController:", v13, v14);

  if (objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    v11[2](v11, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_3_56;
    v15[3] = &unk_24D52E578;
    v16 = v11;
    v17 = *(id *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "setUsernameCompletionHandler:", v15);

  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setStyle:", 1);

}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = MEMORY[0x24BDAC760];
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_4;
    v16 = &unk_24D52E500;
    v17 = WeakRetained;
    BSRunLoopPerformAfterCACommit();
    objc_msgSend(v5, "authenticationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(unsigned __int8 *)(a1 + 40);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_5;
    v9[3] = &unk_24D52E528;
    v9[4] = v5;
    v11 = *(_BYTE *)(a1 + 41);
    v12 = v8;
    v10 = v3;
    objc_msgSend(v7, "fetchAuthenticationModeForUsername:requireAppleMAID:completionHandler:", v10, v8, v9);

  }
}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUsernameEditable:", 0);

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInProgress:", 1);

}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD block[5];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_6;
  block[3] = &unk_24D52E500;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  if (v5)
  {
    v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch authentication mode with error: %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "authenticationCompletionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "authenticationCompletionHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, id))v9)[2](v9, 0, 0, v5);

      objc_msgSend(*(id *)(a1 + 32), "setAuthenticationCompletionHandler:", 0);
    }
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(unsigned __int8 *)(a1 + 48);
    v12 = *(unsigned __int8 *)(a1 + 49);
    objc_msgSend(v10, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_makeAuthenticationActionHandlerWithEphemeral:requireAppleMAID:presentingViewController:", v11, v12, v13);

    if (a2 == 2)
    {
      v17[0] = v6;
      v17[1] = 3221225472;
      v17[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_2_53;
      v17[3] = &unk_24D52E500;
      v17[4] = *(_QWORD *)(a1 + 32);
      v14 = (void *)MEMORY[0x24BDAC9B8];
      dispatch_async(MEMORY[0x24BDAC9B8], v17);

      objc_msgSend(*(id *)(a1 + 32), "authenticationActionHandler");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v15[2](v15, *(_QWORD *)(a1 + 40), 0);

    }
    else
    {
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_52;
      v18[3] = &unk_24D52E500;
      v18[4] = *(_QWORD *)(a1 + 32);
      v16 = (void *)MEMORY[0x24BDAC9B8];
      dispatch_async(MEMORY[0x24BDAC9B8], v18);

    }
  }

}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_6(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setInProgress:", 0);

}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_52(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInProgress:", 0);

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showPasswordField:", 1);

}

void __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_2_53(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setInProgress:", 1);

}

uint64_t __135__DMCBYODEnrollmentFlowUIPresenter_requestMAIDAuthenticationWithManagedAppleID_personaID_ephemeral_requireAppleMAID_completionHandler___block_invoke_3_56(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_makeAuthenticationActionHandlerWithEphemeral:(BOOL)a3 requireAppleMAID:(BOOL)a4 presentingViewController:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;
  BOOL v14;
  id location;

  v8 = a5;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke;
  v10[3] = &unk_24D52E5F0;
  objc_copyWeak(&v12, &location);
  v13 = a3;
  v14 = a4;
  v9 = v8;
  v11 = v9;
  -[DMCBYODEnrollmentFlowUIPresenter setAuthenticationActionHandler:](self, "setAuthenticationActionHandler:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMAccountDrivenEnrollment")
      && (objc_msgSend(MEMORY[0x24BE2A7F0], "simluatedMDMAccountDrivenEnrollmentAuthenticationResults"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_2;
      block[3] = &unk_24D52E500;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_msgSend(WeakRetained, "authenticationCompletionHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE2A7F0], "simluatedMDMAccountDrivenEnrollmentAuthenticationResults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD, _QWORD))v9)[2](v9, v10, 0, 0);

      objc_msgSend(WeakRetained, "setAuthenticationCompletionHandler:", 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "authenticationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(unsigned __int8 *)(a1 + 48);
      v13 = *(unsigned __int8 *)(a1 + 49);
      v14 = *(_QWORD *)(a1 + 32);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_3;
      v15[3] = &unk_24D52E5C8;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      objc_msgSend(v11, "authenticateWithUsername:password:ephemeral:requireAppleMAID:presentingViewController:completionHandler:", v5, v6, v12, v13, v14, v15);

      objc_destroyWeak(&v16);
    }
  }

}

void __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setInProgress:", 0);

}

void __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  _QWORD block[5];

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v8)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_4;
      block[3] = &unk_24D52E500;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_msgSend(v8, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE0AB28]))
      {
        v12 = objc_msgSend(v8, "code");

        if (v12 == -7006)
        {
          objc_msgSend(v10, "showEnrollmentFailure:", v8);
          goto LABEL_10;
        }
      }
      else
      {

      }
      objc_msgSend(v10, "authenticationCompletionHandler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v7, "mutableCopy");
      ((void (**)(_QWORD, void *, uint64_t, id))v13)[2](v13, v14, a3, v8);
    }
    else
    {
      objc_msgSend(WeakRetained, "authenticationCompletionHandler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v7, "mutableCopy");
      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v13)[2](v13, v14, a3, 0);
    }

    objc_msgSend(v10, "setAuthenticationCompletionHandler:", 0);
  }
LABEL_10:

}

void __124__DMCBYODEnrollmentFlowUIPresenter__makeAuthenticationActionHandlerWithEphemeral_requireAppleMAID_presentingViewController___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setInProgress:", 0);

}

- (void)requestSilentMAIDAuthenticationWithAuthenticationResults:(id)a3 personaID:(id)a4 requireAppleMAID:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke;
  block[3] = &unk_24D52E6B8;
  block[4] = self;
  v17 = v11;
  v18 = v10;
  v19 = v12;
  v20 = a5;
  v13 = v10;
  v14 = v12;
  v15 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  char v17;

  objc_msgSend(*(id *)(a1 + 32), "activityController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    DMCLocalizedStringByDevice();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentActivityPageWithText:showButtomView:", v4, 0);

  }
  objc_msgSend(MEMORY[0x24BE2A838], "currentPersonaID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE2A838];
  v7 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_2;
  v12[3] = &unk_24D52E690;
  v13 = v5;
  v16 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v17 = *(_BYTE *)(a1 + 64);
  v10 = v5;
  v11 = (id)objc_msgSend(v6, "performBlockUnderPersona:block:", v7, v12);

}

void __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  id *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMAccountDrivenEnrollment")
    && (objc_msgSend(MEMORY[0x24BE2A7F0], "simluatedMDMAccountDrivenEnrollmentAuthenticationResults"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    v3 = (void *)MEMORY[0x24BE2A838];
    v4 = *(_QWORD *)(a1 + 32);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_3;
    v15[3] = &unk_24D52E618;
    v5 = &v17;
    v17 = *(id *)(a1 + 56);
    v6 = &v16;
    v16 = *(id *)(a1 + 40);
    v7 = (id)objc_msgSend(v3, "performBlockUnderPersona:block:", v4, v15);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "authenticationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_4;
    v12[3] = &unk_24D52E668;
    v5 = &v13;
    v13 = *(id *)(a1 + 32);
    v6 = &v14;
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v8, "authenticateWithAuthenticationResults:ephemeral:requireAppleMAID:presentingViewController:completionHandler:", v10, 0, v9, v11, v12);

  }
}

void __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v1 + 16))(v1, v2, 0, 0);

}

void __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_4(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;

  v7 = a2;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BE2A838];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_5;
  v15[3] = &unk_24D52E640;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v17 = v8;
  v18 = v11;
  v19 = a3;
  v16 = v7;
  v12 = v8;
  v13 = v7;
  v14 = (id)objc_msgSend(v9, "performBlockUnderPersona:block:", v10, v15);

}

void __138__DMCBYODEnrollmentFlowUIPresenter_requestSilentMAIDAuthenticationWithAuthenticationResults_personaID_requireAppleMAID_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v2 + 16))(v2, v3, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)requestMAIDSignInWithAuthenticationResults:(id)a3 personaID:(id)a4 makeiTunesAccountActive:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __131__DMCBYODEnrollmentFlowUIPresenter_requestMAIDSignInWithAuthenticationResults_personaID_makeiTunesAccountActive_completionHandler___block_invoke;
  block[3] = &unk_24D52E708;
  block[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a5;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __131__DMCBYODEnrollmentFlowUIPresenter_requestMAIDSignInWithAuthenticationResults_personaID_makeiTunesAccountActive_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "activityController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    DMCLocalizedStringByDevice();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentActivityPageWithText:showButtomView:", v4, 0);

  }
  if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMAccountDrivenEnrollment")
    && (objc_msgSend(MEMORY[0x24BE2A7F0], "simluatedMDMAccountDrivenEnrollmentAuthenticationResults"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_fakeAppleAccountWithAuthenticationResults:personaID:store:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v6, "saveVerifiedAccount:error:", v7, &v21);
    v8 = v21;
    objc_msgSend(*(id *)(a1 + 32), "_fakeiTunesAccountWithAuthenticationResults:personaID:store:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8;
    objc_msgSend(v6, "saveVerifiedAccount:error:", v9, &v20);
    v10 = v20;

    (*(void (**)(_QWORD, BOOL, _QWORD, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v10 == 0, 0, v10);
  }
  else
  {
    v11 = (void *)objc_opt_new();
    v12 = *MEMORY[0x24BDB4180];
    v22[0] = *MEMORY[0x24BDB3FD8];
    v22[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v16 = *(unsigned __int8 *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __131__DMCBYODEnrollmentFlowUIPresenter_requestMAIDSignInWithAuthenticationResults_personaID_makeiTunesAccountActive_completionHandler___block_invoke_2;
    v18[3] = &unk_24D52E6E0;
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v11, "signInAccountsWithTypes:authenticationResult:personaID:canMakeAccountActive:baseViewController:completionHandler:", v13, v15, v14, v16, v17, v18);

    v6 = v19;
  }

}

uint64_t __131__DMCBYODEnrollmentFlowUIPresenter_requestMAIDSignInWithAuthenticationResults_personaID_makeiTunesAccountActive_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestUserConsentWithProfileData:(id)a3 managedAppleID:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[8];
  id v20;

  v8 = a4;
  v9 = (void *)MEMORY[0x24BE63CA8];
  v20 = 0;
  v10 = a5;
  objc_msgSend(v9, "profileWithData:outError:", a3, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  if (v12)
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216358000, v13, OS_LOG_TYPE_ERROR, "Failed to parse profile data", buf, 2u);
    }
  }
  -[DMCBYODEnrollmentFlowUIPresenter setManagedAppleID:](self, "setManagedAppleID:", v8);
  -[DMCBYODEnrollmentFlowUIPresenter setConsentCompletionHandler:](self, "setConsentCompletionHandler:", v10);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __103__DMCBYODEnrollmentFlowUIPresenter_requestUserConsentWithProfileData_managedAppleID_completionHandler___block_invoke;
  block[3] = &unk_24D52E488;
  block[4] = self;
  v17 = v8;
  v18 = v11;
  v14 = v11;
  v15 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __103__DMCBYODEnrollmentFlowUIPresenter_requestUserConsentWithProfileData_managedAppleID_completionHandler___block_invoke(uint64_t a1)
{
  DMCEnrollmentConsentViewController *v2;

  v2 = -[DMCEnrollmentConsentViewController initWithDelegate:username:profile:]([DMCEnrollmentConsentViewController alloc], "initWithDelegate:username:profile:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:", v2);

}

- (void)displayManagementDetailsOverviewWithProfileData:(id)a3 managedAppleID:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[8];
  id v20;

  v8 = a4;
  v9 = (void *)MEMORY[0x24BE63CA8];
  v20 = 0;
  v10 = a5;
  objc_msgSend(v9, "profileWithData:outError:", a3, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  if (v12)
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216358000, v13, OS_LOG_TYPE_ERROR, "Failed to parse profile data", buf, 2u);
    }
  }
  -[DMCBYODEnrollmentFlowUIPresenter setManagedAppleID:](self, "setManagedAppleID:", v8);
  -[DMCBYODEnrollmentFlowUIPresenter setConsentCompletionHandler:](self, "setConsentCompletionHandler:", v10);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__DMCBYODEnrollmentFlowUIPresenter_displayManagementDetailsOverviewWithProfileData_managedAppleID_completionHandler___block_invoke;
  block[3] = &unk_24D52E488;
  block[4] = self;
  v17 = v8;
  v18 = v11;
  v14 = v11;
  v15 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __117__DMCBYODEnrollmentFlowUIPresenter_displayManagementDetailsOverviewWithProfileData_managedAppleID_completionHandler___block_invoke(uint64_t a1)
{
  DMCEnrollmentManagementDetailsOverviewViewController *v2;

  v2 = -[DMCEnrollmentManagementDetailsOverviewViewController initWithDelegate:managedAppleID:profile:]([DMCEnrollmentManagementDetailsOverviewViewController alloc], "initWithDelegate:managedAppleID:profile:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:", v2);

}

- (void)requestUserInputWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  DMCInstallProfileQuestionViewController *v7;
  DMCInstallProfileQuestionViewController *v8;
  _QWORD v9[5];
  DMCInstallProfileQuestionViewController *v10;

  v6 = a3;
  -[DMCBYODEnrollmentFlowUIPresenter setUserInputCompletionHandler:](self, "setUserInputCompletionHandler:", a4);
  v7 = -[DMCInstallProfileQuestionViewController initWithUserInput:]([DMCInstallProfileQuestionViewController alloc], "initWithUserInput:", v6);

  -[DMCInstallProfileQuestionViewController setQuestionsDelegate:](v7, "setQuestionsDelegate:", self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__DMCBYODEnrollmentFlowUIPresenter_requestUserInputWithRequest_completionHandler___block_invoke;
  v9[3] = &unk_24D52E730;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __82__DMCBYODEnrollmentFlowUIPresenter_requestUserInputWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushViewController:", *(_QWORD *)(a1 + 40));
}

- (void)informQuestionViewControllerOfPreflightResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DMCBYODEnrollmentFlowUIPresenter questionsController](self, "questionsController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileConnectionDidFinishPreflightWithError:", v4);

}

- (void)showiCloudPromotionPageWithiCloudQuotaString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __99__DMCBYODEnrollmentFlowUIPresenter_showiCloudPromotionPageWithiCloudQuotaString_completionHandler___block_invoke;
  v13[3] = &unk_24D52E758;
  v14 = v7;
  v9 = v7;
  -[DMCBYODEnrollmentFlowUIPresenter setICloudPromotionCompletionHandler:](self, "setICloudPromotionCompletionHandler:", v13);
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __99__DMCBYODEnrollmentFlowUIPresenter_showiCloudPromotionPageWithiCloudQuotaString_completionHandler___block_invoke_2;
  block[3] = &unk_24D52E730;
  block[4] = self;
  v12 = v6;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __99__DMCBYODEnrollmentFlowUIPresenter_showiCloudPromotionPageWithiCloudQuotaString_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__DMCBYODEnrollmentFlowUIPresenter_showiCloudPromotionPageWithiCloudQuotaString_completionHandler___block_invoke_2(uint64_t a1)
{
  DMCEnrollmentiCloudPromotionViewController *v2;

  v2 = -[DMCEnrollmentiCloudPromotionViewController initWithType:delegate:]([DMCEnrollmentiCloudPromotionViewController alloc], "initWithType:delegate:", 1, *(_QWORD *)(a1 + 32));
  -[DMCEnrollmentiCloudPromotionViewController setQuotaString:](v2, "setQuotaString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:", v2);

}

- (void)requestiCloudSignInConfirmationWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __89__DMCBYODEnrollmentFlowUIPresenter_requestiCloudSignInConfirmationWithCompletionHandler___block_invoke;
  v8[3] = &unk_24D52E758;
  v9 = v4;
  v6 = v4;
  -[DMCBYODEnrollmentFlowUIPresenter setICloudPromotionCompletionHandler:](self, "setICloudPromotionCompletionHandler:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __89__DMCBYODEnrollmentFlowUIPresenter_requestiCloudSignInConfirmationWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_24D52E500;
  v7[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __89__DMCBYODEnrollmentFlowUIPresenter_requestiCloudSignInConfirmationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__DMCBYODEnrollmentFlowUIPresenter_requestiCloudSignInConfirmationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  DMCEnrollmentiCloudPromotionViewController *v2;

  v2 = -[DMCEnrollmentiCloudPromotionViewController initWithType:delegate:]([DMCEnrollmentiCloudPromotionViewController alloc], "initWithType:delegate:", 0, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:foundationViewController:", v2, v2);

}

- (void)suggestRestoreForAccountWithUsername:(id)a3 personaID:(id)a4 completionHandler:(id)a5
{
  id v8;
  DMCRFMBDeviceEnvironment *v9;
  void *v10;
  void *v11;
  DMCRFMBSnapshotSource *v12;
  DMCRFMBDeviceEnvironment *v13;
  DMCRFRestoreFlow *v14;
  DMCRFMBDeviceEnvironment *v15;
  DMCRFRestoreFlow *v16;
  _QWORD v17[5];
  DMCRFMBDeviceEnvironment *v18;
  _QWORD v19[4];
  DMCRFMBDeviceEnvironment *v20;

  v8 = a4;
  v9 = (DMCRFMBDeviceEnvironment *)a5;
  -[DMCBYODEnrollmentFlowUIPresenter setManagedAppleID:](self, "setManagedAppleID:", a3);
  if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMAccountDrivenEnrollment")
    && (objc_msgSend(MEMORY[0x24BE2A7F0], "simluatedMDMAccountDrivenEnrollmentAuthenticationResults"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    v11 = (void *)objc_opt_new();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke;
    v19[3] = &unk_24D52E6E0;
    v20 = v9;
    v12 = v9;
    -[DMCBYODEnrollmentFlowUIPresenter doesUserWantToRestoreSnapshot:withConflictingApps:completion:](self, "doesUserWantToRestoreSnapshot:withConflictingApps:completion:", v11, 0, v19);

    v13 = v20;
  }
  else
  {
    v12 = -[DMCRFMBSnapshotSource initWithPersonaIdentifier:delegate:]([DMCRFMBSnapshotSource alloc], "initWithPersonaIdentifier:delegate:", v8, 0);
    v13 = objc_alloc_init(DMCRFMBDeviceEnvironment);
    v14 = [DMCRFRestoreFlow alloc];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_2;
    v17[3] = &unk_24D52E7D0;
    v17[4] = self;
    v18 = v9;
    v15 = v9;
    v16 = -[DMCRFRestoreFlow initWithSnapshotSource:interactionClient:deviceEnvironment:completion:](v14, "initWithSnapshotSource:interactionClient:deviceEnvironment:completion:", v12, self, v13, v17);
    -[DMCRFRestoreFlow startManagedRestoreWorkflow](v16, "startManagedRestoreWorkflow");

  }
}

uint64_t __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_3;
    v3[3] = &unk_24D52E7A8;
    v2 = *(void **)(a1 + 40);
    v3[4] = *(_QWORD *)(a1 + 32);
    v4 = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  DMCLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_4;
  v4[3] = &unk_24D52E780;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_presentOKAlertWithTitle:message:action:", 0, v3, v4);

}

uint64_t __101__DMCBYODEnrollmentFlowUIPresenter_suggestRestoreForAccountWithUsername_personaID_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestDebuggingApplicationsInstallation:(id)a3 requiredEntitlements:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  -[DMCBYODEnrollmentFlowUIPresenter setESSOApplicationInstallationCompletionHandler:](self, "setESSOApplicationInstallationCompletionHandler:", a5);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __116__DMCBYODEnrollmentFlowUIPresenter_requestDebuggingApplicationsInstallation_requiredEntitlements_completionHandler___block_invoke;
  block[3] = &unk_24D52E488;
  block[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __116__DMCBYODEnrollmentFlowUIPresenter_requestDebuggingApplicationsInstallation_requiredEntitlements_completionHandler___block_invoke(uint64_t a1)
{
  DMCEnrollmentDebuggingESSOApplicationInstallationViewController *v2;

  v2 = -[DMCEnrollmentDebuggingESSOApplicationInstallationViewController initWithDelegate:appBundleIDs:requiredEntitlements:]([DMCEnrollmentDebuggingESSOApplicationInstallationViewController alloc], "initWithDelegate:appBundleIDs:requiredEntitlements:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:", v2);

}

- (void)showInstallingEnrollmentProfileScene
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__DMCBYODEnrollmentFlowUIPresenter_showInstallingEnrollmentProfileScene__block_invoke;
  block[3] = &unk_24D52E500;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __72__DMCBYODEnrollmentFlowUIPresenter_showInstallingEnrollmentProfileScene__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "activityController");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_3;
  v3 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activityController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
LABEL_3:
    v7 = *(void **)(a1 + 32);
    DMCLocalizedStringByDevice();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentActivityPageWithText:showButtomView:", v8, 0);

  }
}

- (void)showEnrollmentCompletionScene
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentCompletionScene__block_invoke;
  block[3] = &unk_24D52E500;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __65__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentCompletionScene__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentCompletionScene__block_invoke_2;
  v3[3] = &unk_24D52E500;
  v3[4] = v1;
  return objc_msgSend(v1, "dismissWithCompletion:", v3);
}

void __65__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentCompletionScene__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = *MEMORY[0x24BE63E98];
  objc_msgSend(*(id *)(a1 + 32), "managedAppleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@&username=%@"), v2, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v5, 0);

}

- (void)showEnrollmentFailure:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentFailure___block_invoke;
  v6[3] = &unk_24D52E730;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __58__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentFailure___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "setActivityController:", 0);
  objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE2A7E8], "isAppleInternal"))
  {
    objc_msgSend(*(id *)(a1 + 40), "underlyingErrors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 40), "underlyingErrors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@\n\n[Internal only]\n%@"), v2, v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "blockNavigationPush");

  objc_initWeak(&location, *(id *)(a1 + 32));
  v10 = *(void **)(a1 + 32);
  DMCLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentFailure___block_invoke_2;
  v12[3] = &unk_24D52E7F8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v10, "_presentOKAlertWithTitle:message:action:", v11, v2, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __58__DMCBYODEnrollmentFlowUIPresenter_showEnrollmentFailure___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "unblockNavigationPush");

}

- (void)dismissEnrollmentScene
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD block[5];

  -[DMCBYODEnrollmentFlowUIPresenter usernameViewController](self, "usernameViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "inProgress") & 1) != 0)
  {
    -[DMCEnrollmentFlowUIPresenterBase navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCBYODEnrollmentFlowUIPresenter usernameViewController](self, "usernameViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      v7 = dispatch_time(0, 700000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__DMCBYODEnrollmentFlowUIPresenter_dismissEnrollmentScene__block_invoke;
      block[3] = &unk_24D52E500;
      block[4] = self;
      dispatch_after(v7, MEMORY[0x24BDAC9B8], block);
      return;
    }
  }
  else
  {

  }
  -[DMCEnrollmentFlowUIPresenterBase dismissWithCompletion:](self, "dismissWithCompletion:", 0);
}

uint64_t __58__DMCBYODEnrollmentFlowUIPresenter_dismissEnrollmentScene__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWithCompletion:", 0);
}

- (id)notificationNameForApplicationWillTerminate
{
  return (id)*MEMORY[0x24BDF75E0];
}

- (void)authenticationViewController:(id)a3 didReceiveUsername:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  _QWORD block[5];

  v5 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceiveUsername___block_invoke;
  block[3] = &unk_24D52E500;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[DMCBYODEnrollmentFlowUIPresenter usernameCompletionHandler](self, "usernameCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DMCBYODEnrollmentFlowUIPresenter usernameCompletionHandler](self, "usernameCompletionHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v7)[2](v7, v5, 0);

    -[DMCBYODEnrollmentFlowUIPresenter setUsernameCompletionHandler:](self, "setUsernameCompletionHandler:", 0);
  }

}

void __84__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceiveUsername___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setInProgress:", 1);

}

- (void)authenticationViewController:(id)a3 didReceivePassword:(id)a4 forUsername:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v14[5];
  _QWORD block[5];

  v7 = a4;
  v8 = a5;
  -[DMCBYODEnrollmentFlowUIPresenter authenticationCompletionHandler](self, "authenticationCompletionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x24BDAC760];
  if (v9)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceivePassword_forUsername___block_invoke;
    block[3] = &unk_24D52E500;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    -[DMCBYODEnrollmentFlowUIPresenter authenticationActionHandler](self, "authenticationActionHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v11)[2](v11, v8, v7);

  }
  -[DMCBYODEnrollmentFlowUIPresenter usernameAndPasswordCompletionHandler](self, "usernameAndPasswordCompletionHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __96__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceivePassword_forUsername___block_invoke_2;
    v14[3] = &unk_24D52E500;
    v14[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v14);
    -[DMCBYODEnrollmentFlowUIPresenter usernameAndPasswordCompletionHandler](self, "usernameAndPasswordCompletionHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, _QWORD))v13)[2](v13, v8, v7, 0);

    -[DMCBYODEnrollmentFlowUIPresenter setUsernameAndPasswordCompletionHandler:](self, "setUsernameAndPasswordCompletionHandler:", 0);
  }

}

void __96__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceivePassword_forUsername___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setInProgress:", 1);

}

void __96__DMCBYODEnrollmentFlowUIPresenter_authenticationViewController_didReceivePassword_forUsername___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setInProgress:", 1);

}

- (void)authenticationViewControllerDidCancel:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD block[5];

  -[DMCBYODEnrollmentFlowUIPresenter usernameCompletionHandler](self, "usernameCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DMCBYODEnrollmentFlowUIPresenter usernameCompletionHandler](self, "usernameCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, 1);

    -[DMCBYODEnrollmentFlowUIPresenter setUsernameCompletionHandler:](self, "setUsernameCompletionHandler:", 0);
  }
  else
  {
    if (-[DMCBYODEnrollmentFlowUIPresenter hasDoneAuthServices](self, "hasDoneAuthServices"))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __74__DMCBYODEnrollmentFlowUIPresenter_authenticationViewControllerDidCancel___block_invoke;
      block[3] = &unk_24D52E500;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
    else
    {
      -[DMCBYODEnrollmentFlowUIPresenter authenticationCompletionHandler](self, "authenticationCompletionHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[DMCBYODEnrollmentFlowUIPresenter authenticationCompletionHandler](self, "authenticationCompletionHandler");
        v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, 1, 0);

        -[DMCBYODEnrollmentFlowUIPresenter setAuthenticationCompletionHandler:](self, "setAuthenticationCompletionHandler:", 0);
      }
    }
    -[DMCBYODEnrollmentFlowUIPresenter usernameAndPasswordCompletionHandler](self, "usernameAndPasswordCompletionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[DMCBYODEnrollmentFlowUIPresenter usernameAndPasswordCompletionHandler](self, "usernameAndPasswordCompletionHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, 0, 1);

      -[DMCBYODEnrollmentFlowUIPresenter setUsernameAndPasswordCompletionHandler:](self, "setUsernameAndPasswordCompletionHandler:", 0);
    }
  }
}

uint64_t __74__DMCBYODEnrollmentFlowUIPresenter_authenticationViewControllerDidCancel___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __74__DMCBYODEnrollmentFlowUIPresenter_authenticationViewControllerDidCancel___block_invoke_2;
  v3[3] = &unk_24D52E820;
  v3[4] = v1;
  return objc_msgSend(v1, "_showCancelAlertForMAID:actionHandler:", 0, v3);
}

void __74__DMCBYODEnrollmentFlowUIPresenter_authenticationViewControllerDidCancel___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticationCompletionHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "authenticationCompletionHandler");
      v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, 1, 0);

      objc_msgSend(*(id *)(a1 + 32), "setAuthenticationCompletionHandler:", 0);
    }
  }
}

- (void)consentViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  _QWORD block[5];

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    -[DMCBYODEnrollmentFlowUIPresenter consentCompletionHandler](self, "consentCompletionHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "setInProgress:", 1);
      -[DMCBYODEnrollmentFlowUIPresenter consentCompletionHandler](self, "consentCompletionHandler");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, 1);

      -[DMCBYODEnrollmentFlowUIPresenter setConsentCompletionHandler:](self, "setConsentCompletionHandler:", 0);
    }
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__DMCBYODEnrollmentFlowUIPresenter_consentViewController_didReceiveUserAction___block_invoke;
    block[3] = &unk_24D52E500;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __79__DMCBYODEnrollmentFlowUIPresenter_consentViewController_didReceiveUserAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "managedAppleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __79__DMCBYODEnrollmentFlowUIPresenter_consentViewController_didReceiveUserAction___block_invoke_2;
  v4[3] = &unk_24D52E820;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "_showCancelAlertForMAID:actionHandler:", v3, v4);

}

void __79__DMCBYODEnrollmentFlowUIPresenter_consentViewController_didReceiveUserAction___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "consentCompletionHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "consentCompletionHandler");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0);

      objc_msgSend(*(id *)(a1 + 32), "setConsentCompletionHandler:", 0);
    }
  }
}

- (void)questionsController:(id)a3 didFinishWithResponses:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _QWORD block[4];
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__DMCBYODEnrollmentFlowUIPresenter_questionsController_didFinishWithResponses___block_invoke;
  block[3] = &unk_24D52E500;
  v8 = v6;
  v12 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[DMCBYODEnrollmentFlowUIPresenter userInputCompletionHandler](self, "userInputCompletionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DMCBYODEnrollmentFlowUIPresenter userInputCompletionHandler](self, "userInputCompletionHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, BOOL))v10)[2](v10, v7, objc_msgSend(v7, "count") == 0);

  }
}

uint64_t __79__DMCBYODEnrollmentFlowUIPresenter_questionsController_didFinishWithResponses___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitForMoreInput");
}

- (BOOL)questionsControllerIsDisplayedInSheet:(id)a3
{
  return 1;
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[DMCEnrollmentFlowUIPresenterBase baseViewController](self, "baseViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)iCloudPromotionViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  _QWORD block[5];

  if (a4)
  {
    -[DMCBYODEnrollmentFlowUIPresenter iCloudPromotionCompletionHandler](self, "iCloudPromotionCompletionHandler", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[DMCBYODEnrollmentFlowUIPresenter iCloudPromotionCompletionHandler](self, "iCloudPromotionCompletionHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, 1);

      -[DMCBYODEnrollmentFlowUIPresenter setICloudPromotionCompletionHandler:](self, "setICloudPromotionCompletionHandler:", 0);
    }
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__DMCBYODEnrollmentFlowUIPresenter_iCloudPromotionViewController_didReceiveUserAction___block_invoke;
    block[3] = &unk_24D52E500;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __87__DMCBYODEnrollmentFlowUIPresenter_iCloudPromotionViewController_didReceiveUserAction___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __87__DMCBYODEnrollmentFlowUIPresenter_iCloudPromotionViewController_didReceiveUserAction___block_invoke_2;
  v3[3] = &unk_24D52E820;
  v3[4] = v1;
  return objc_msgSend(v1, "_showCancelAlertForMAID:actionHandler:", 0, v3);
}

void __87__DMCBYODEnrollmentFlowUIPresenter_iCloudPromotionViewController_didReceiveUserAction___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "iCloudPromotionCompletionHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "iCloudPromotionCompletionHandler");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0);

      objc_msgSend(*(id *)(a1 + 32), "setICloudPromotionCompletionHandler:", 0);
    }
  }
}

- (void)doesUserWantToRestoreSnapshot:(id)a3 withConflictingApps:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __97__DMCBYODEnrollmentFlowUIPresenter_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke;
  v18[3] = &unk_24D52E758;
  v19 = v10;
  v12 = v10;
  -[DMCBYODEnrollmentFlowUIPresenter setRestoreCompletionHandler:](self, "setRestoreCompletionHandler:", v18);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __97__DMCBYODEnrollmentFlowUIPresenter_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke_2;
  v15[3] = &unk_24D52E488;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

uint64_t __97__DMCBYODEnrollmentFlowUIPresenter_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

void __97__DMCBYODEnrollmentFlowUIPresenter_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke_2(uint64_t a1)
{
  DMCEnrollmentFlowRestoreViewController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  DMCEnrollmentFlowRestoreViewController *v7;

  v2 = [DMCEnrollmentFlowRestoreViewController alloc];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "managedAppleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMCEnrollmentFlowRestoreViewController initWithDelegate:managedAppleID:restoreSnapshot:conflictingApps:](v2, "initWithDelegate:managedAppleID:restoreSnapshot:conflictingApps:", v3, v4, v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "pushViewController:", v7);
}

- (void)restoreViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(_QWORD, _QWORD);

  v4 = a4;
  -[DMCBYODEnrollmentFlowUIPresenter restoreCompletionHandler](self, "restoreCompletionHandler", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DMCBYODEnrollmentFlowUIPresenter restoreCompletionHandler](self, "restoreCompletionHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, v4);

    -[DMCBYODEnrollmentFlowUIPresenter setRestoreCompletionHandler:](self, "setRestoreCompletionHandler:", 0);
  }
}

- (void)ESSOApplicationDisclosurViewController:(id)a3 didReceiveUserAction:(BOOL)a4 error:(id)a5
{
  -[DMCBYODEnrollmentFlowUIPresenter _handleApplicationInstallationViewControllerDelegate:didReceiveUserAction:error:](self, "_handleApplicationInstallationViewControllerDelegate:didReceiveUserAction:error:", a3, a4, 0);
}

- (void)_handleApplicationInstallationViewControllerDelegate:(id)a3 didReceiveUserAction:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  DMCBYODEnrollmentFlowUIPresenter *v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __116__DMCBYODEnrollmentFlowUIPresenter__handleApplicationInstallationViewControllerDelegate_didReceiveUserAction_error___block_invoke;
  v12[3] = &unk_24D52E848;
  v16 = a4;
  v13 = v9;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __116__DMCBYODEnrollmentFlowUIPresenter__handleApplicationInstallationViewControllerDelegate_didReceiveUserAction_error___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  _QWORD v5[5];

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "setInProgress:", 1);
  }
  else if (!*(_QWORD *)(a1 + 32))
  {
    v4 = *(void **)(a1 + 48);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __116__DMCBYODEnrollmentFlowUIPresenter__handleApplicationInstallationViewControllerDelegate_didReceiveUserAction_error___block_invoke_2;
    v5[3] = &unk_24D52E820;
    v5[4] = v4;
    objc_msgSend(v4, "_showCancelAlertForMAID:actionHandler:", 0, v5);
    return;
  }
  objc_msgSend(*(id *)(a1 + 48), "ESSOApplicationInstallationCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "ESSOApplicationInstallationCompletionHandler");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 48), "setESSOApplicationInstallationCompletionHandler:", 0);
  }
}

void __116__DMCBYODEnrollmentFlowUIPresenter__handleApplicationInstallationViewControllerDelegate_didReceiveUserAction_error___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "ESSOApplicationInstallationCompletionHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "ESSOApplicationInstallationCompletionHandler");
      v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, 1, 0);

      objc_msgSend(*(id *)(a1 + 32), "setESSOApplicationInstallationCompletionHandler:", 0);
    }
  }
}

- (void)debuggingApplicationInstallationViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
  -[DMCBYODEnrollmentFlowUIPresenter _handleApplicationInstallationViewControllerDelegate:didReceiveUserAction:error:](self, "_handleApplicationInstallationViewControllerDelegate:didReceiveUserAction:error:", a3, a4, 0);
}

- (void)managementDetailsOverviewViewController:(id)a3 didReceiveUserAction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  _QWORD block[5];

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    -[DMCBYODEnrollmentFlowUIPresenter consentCompletionHandler](self, "consentCompletionHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "setInProgress:", 1);
      -[DMCBYODEnrollmentFlowUIPresenter consentCompletionHandler](self, "consentCompletionHandler");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, 1);

      -[DMCBYODEnrollmentFlowUIPresenter setConsentCompletionHandler:](self, "setConsentCompletionHandler:", 0);
    }
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __97__DMCBYODEnrollmentFlowUIPresenter_managementDetailsOverviewViewController_didReceiveUserAction___block_invoke;
    block[3] = &unk_24D52E500;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __97__DMCBYODEnrollmentFlowUIPresenter_managementDetailsOverviewViewController_didReceiveUserAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "managedAppleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __97__DMCBYODEnrollmentFlowUIPresenter_managementDetailsOverviewViewController_didReceiveUserAction___block_invoke_2;
  v4[3] = &unk_24D52E820;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "_showCancelAlertForMAID:actionHandler:", v3, v4);

}

void __97__DMCBYODEnrollmentFlowUIPresenter_managementDetailsOverviewViewController_didReceiveUserAction___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "consentCompletionHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "consentCompletionHandler");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0);

      objc_msgSend(*(id *)(a1 + 32), "setConsentCompletionHandler:", 0);
    }
  }
}

- (void)requestUserConsentWithCloudConfig:(id)a3 completionHandler:(id)a4
{
  _QWORD block[5];

  -[DMCBYODEnrollmentFlowUIPresenter setConsentCompletionHandler:](self, "setConsentCompletionHandler:", a4);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__DMCBYODEnrollmentFlowUIPresenter_requestUserConsentWithCloudConfig_completionHandler___block_invoke;
  block[3] = &unk_24D52E500;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __88__DMCBYODEnrollmentFlowUIPresenter_requestUserConsentWithCloudConfig_completionHandler___block_invoke(uint64_t a1)
{
  DMCEnrollmentConsentViewController *v2;

  v2 = -[DMCEnrollmentConsentViewController initWithDelegate:username:profile:]([DMCEnrollmentConsentViewController alloc], "initWithDelegate:username:profile:", *(_QWORD *)(a1 + 32), CFSTR("Cloud Config Test"), 0);
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:", v2);

}

- (void)fetchEnrollmentProfileWithWebAuthURL:(id)a3 machineInfo:(id)a4 anchorCertificateRefs:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  DMCBYODEnrollmentFlowUIPresenter *v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[DMCBYODEnrollmentFlowUIPresenter setWebURLCompletionHandler:](self, "setWebURLCompletionHandler:", a6);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __125__DMCBYODEnrollmentFlowUIPresenter_fetchEnrollmentProfileWithWebAuthURL_machineInfo_anchorCertificateRefs_completionHandler___block_invoke;
  v16[3] = &unk_24D52E438;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v20 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v16);

}

void __125__DMCBYODEnrollmentFlowUIPresenter_fetchEnrollmentProfileWithWebAuthURL_machineInfo_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1)
{
  DMCTestWebViewController *v2;

  v2 = objc_alloc_init(DMCTestWebViewController);
  -[DMCTestWebViewController setWebURL:](v2, "setWebURL:", *(_QWORD *)(a1 + 32));
  -[DMCTestWebViewController setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 40));
  -[DMCTestWebViewController setMachineInfo:](v2, "setMachineInfo:", *(_QWORD *)(a1 + 48));
  -[DMCTestWebViewController setAnchorCerts:](v2, "setAnchorCerts:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "pushViewController:", v2);

}

- (void)requestMDMUsernameAndPasswordWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __87__DMCBYODEnrollmentFlowUIPresenter_requestMDMUsernameAndPasswordWithCompletionHandler___block_invoke;
  v6[3] = &unk_24D52E7A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __87__DMCBYODEnrollmentFlowUIPresenter_requestMDMUsernameAndPasswordWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setUsernameViewController:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "setUsernameAndPasswordCompletionHandler:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsernameEditable:", 1);

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsername:", CFSTR("user"));

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showPasswordField:", 1);

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInProgress:", 0);

  objc_msgSend(*(id *)(a1 + 32), "usernameViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStyle:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setHasDoneAuthServices:", 0);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "usernameViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:", v10);

}

- (void)ensureNetworkConnectionWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  DMCTestNetworkMonitor *v6;
  id v7;
  DMCTestNetworkMonitor *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  _QWORD block[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__DMCBYODEnrollmentFlowUIPresenter_ensureNetworkConnectionWithCompletionHandler___block_invoke;
  block[3] = &unk_24D52E500;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v6 = [DMCTestNetworkMonitor alloc];
  v9 = v5;
  v10 = 3221225472;
  v11 = __81__DMCBYODEnrollmentFlowUIPresenter_ensureNetworkConnectionWithCompletionHandler___block_invoke_2;
  v12 = &unk_24D52E780;
  v13 = v4;
  v7 = v4;
  v8 = -[DMCTestNetworkMonitor initWithNetworkAvailableHandler:](v6, "initWithNetworkAvailableHandler:", &v9);
  -[DMCTestNetworkMonitor startMonitoring](v8, "startMonitoring", v9, v10, v11, v12);

}

void __81__DMCBYODEnrollmentFlowUIPresenter_ensureNetworkConnectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "activityController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    DMCLocalizedStringByDevice();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentActivityPageWithText:showButtomView:", v4, 0);

  }
}

uint64_t __81__DMCBYODEnrollmentFlowUIPresenter_ensureNetworkConnectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)webAuthCanceled:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[DMCBYODEnrollmentFlowUIPresenter webURLCompletionHandler](self, "webURLCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DMCBYODEnrollmentFlowUIPresenter webURLCompletionHandler](self, "webURLCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, BOOL))v5)[2](v5, 0, v6 == 0);

    -[DMCBYODEnrollmentFlowUIPresenter setWebURLCompletionHandler:](self, "setWebURLCompletionHandler:", 0);
  }

}

- (void)recievedProfile:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[DMCBYODEnrollmentFlowUIPresenter webURLCompletionHandler](self, "webURLCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DMCBYODEnrollmentFlowUIPresenter webURLCompletionHandler](self, "webURLCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD, _QWORD))v5)[2](v5, v6, 0, 0);

    -[DMCBYODEnrollmentFlowUIPresenter setWebURLCompletionHandler:](self, "setWebURLCompletionHandler:", 0);
  }

}

- (id)_fakeAppleAccountWithAuthenticationResults:(id)a3 personaID:(id)a4 store:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = (objc_class *)MEMORY[0x24BDB4380];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [v7 alloc];
  objc_msgSend(v8, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB3FD8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithAccountType:", v12);
  v14 = *MEMORY[0x24BE0ABF0];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABF0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccountDescription:", v15);

  objc_msgSend(v10, "objectForKeyedSubscript:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUsername:", v16);

  objc_msgSend(v13, "dmc_setPersonaIdentifier:", v9);
  objc_msgSend(v13, "aa_setAccountClass:", *MEMORY[0x24BE047E8]);
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dmc_setAltDSID:", v17);

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB70]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dmc_setDSID:", v18);

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB90]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "aa_setFirstName:", v19);

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABC0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "aa_setLastName:", v20);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("isManagedAppleID"));
  objc_msgSend(v13, "setAuthenticated:", 1);
  return v13;
}

- (id)_fakeiTunesAccountWithAuthenticationResults:(id)a3 personaID:(id)a4 store:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = (objc_class *)MEMORY[0x24BDB4380];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [v7 alloc];
  objc_msgSend(v8, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4180]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithAccountType:", v12);
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABF0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUsername:", v14);

  objc_msgSend(v13, "dmc_setPersonaIdentifier:", v9);
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dmc_setAltDSID:", v15);

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB90]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "aa_setFirstName:", v16);

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABC0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "aa_setLastName:", v17);
  objc_msgSend(v13, "setActive:", 0);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("isManagedAppleID"));
  objc_msgSend(v13, "setAuthenticated:", 1);
  return v13;
}

- (DMCEnrollmentAuthenticationViewController)usernameViewController
{
  return self->_usernameViewController;
}

- (void)setUsernameViewController:(id)a3
{
  objc_storeStrong((id *)&self->_usernameViewController, a3);
}

- (id)usernameCompletionHandler
{
  return self->_usernameCompletionHandler;
}

- (void)setUsernameCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)ESSOApplicationInstallationCompletionHandler
{
  return self->_ESSOApplicationInstallationCompletionHandler;
}

- (void)setESSOApplicationInstallationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)hasDoneAuthServices
{
  return self->_hasDoneAuthServices;
}

- (void)setHasDoneAuthServices:(BOOL)a3
{
  self->_hasDoneAuthServices = a3;
}

- (void)setAuthenticationController:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationController, a3);
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (void)setManagedAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (DMCEnrollmentConsentViewController)consentViewController
{
  return self->_consentViewController;
}

- (void)setConsentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_consentViewController, a3);
}

- (id)consentCompletionHandler
{
  return self->_consentCompletionHandler;
}

- (void)setConsentCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)profileInstallationCompletionHandler
{
  return self->_profileInstallationCompletionHandler;
}

- (void)setProfileInstallationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)authenticationActionHandler
{
  return self->_authenticationActionHandler;
}

- (void)setAuthenticationActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (DMCInstallProfileQuestionViewController)questionsController
{
  return self->_questionsController;
}

- (void)setQuestionsController:(id)a3
{
  objc_storeStrong((id *)&self->_questionsController, a3);
}

- (id)userInputCompletionHandler
{
  return self->_userInputCompletionHandler;
}

- (void)setUserInputCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)iCloudPromotionCompletionHandler
{
  return self->_iCloudPromotionCompletionHandler;
}

- (void)setICloudPromotionCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)restoreCompletionHandler
{
  return self->_restoreCompletionHandler;
}

- (void)setRestoreCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)webURLCompletionHandler
{
  return self->_webURLCompletionHandler;
}

- (void)setWebURLCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)usernameAndPasswordCompletionHandler
{
  return self->_usernameAndPasswordCompletionHandler;
}

- (void)setUsernameAndPasswordCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)authenticationCompletionHandler
{
  return self->_authenticationCompletionHandler;
}

- (void)setAuthenticationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authenticationCompletionHandler, 0);
  objc_storeStrong(&self->_usernameAndPasswordCompletionHandler, 0);
  objc_storeStrong(&self->_webURLCompletionHandler, 0);
  objc_storeStrong(&self->_restoreCompletionHandler, 0);
  objc_storeStrong(&self->_iCloudPromotionCompletionHandler, 0);
  objc_storeStrong(&self->_userInputCompletionHandler, 0);
  objc_storeStrong((id *)&self->_questionsController, 0);
  objc_storeStrong(&self->_authenticationActionHandler, 0);
  objc_storeStrong(&self->_profileInstallationCompletionHandler, 0);
  objc_storeStrong(&self->_consentCompletionHandler, 0);
  objc_storeStrong((id *)&self->_consentViewController, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong(&self->_ESSOApplicationInstallationCompletionHandler, 0);
  objc_storeStrong(&self->_usernameCompletionHandler, 0);
  objc_storeStrong((id *)&self->_usernameViewController, 0);
}

@end
