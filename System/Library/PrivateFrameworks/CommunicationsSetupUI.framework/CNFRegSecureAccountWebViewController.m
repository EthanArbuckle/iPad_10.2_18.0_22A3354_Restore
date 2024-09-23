@implementation CNFRegSecureAccountWebViewController

- (CNFRegSecureAccountWebViewController)initWithRegController:(id)a3 account:(id)a4
{
  id v6;
  CNFRegSecureAccountWebViewController *v7;
  CNFRegSecureAccountWebViewController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CNFRegSecureAccountWebViewController;
  v7 = -[CNFRegAccountWebViewController initWithRegController:](&v10, sel_initWithRegController_, a3);
  v8 = v7;
  if (v7)
  {
    -[CNFRegSecureAccountWebViewController setAccount:](v7, "setAccount:", v6);
    v8->_gotNewCredential = 0;
  }

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegSecureAccountWebViewController;
  -[CNFRegAccountWebViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CNFRegSecureAccountWebViewController _setupAccountHandlers](self, "_setupAccountHandlers");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegSecureAccountWebViewController;
  -[CNFRegAccountWebViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CNFRegServerWebViewController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllHandlers");

}

- (void)doHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v8 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
  {
    OSLogHandleForIDSCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v8;
      _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Got handoff with status : %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v18 = v8;
      IMLogString();
    }
  }
  if ((_DWORD)v8 == 5000)
  {
    v14 = !self->_triedGettingNewCredentials;
    v15 = -[CNFRegServerWebViewController _shouldLog](self, "_shouldLog", v18);
    if (v14)
    {
      if (v15)
      {
        OSLogHandleForIDSCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_DEFAULT, "Account was unauthenticated. Obtaining new auth credentials", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
      }
      self->_triedGettingNewCredentials = 1;
      -[CNFRegSecureAccountWebViewController _showRequestPasswordAlert](self, "_showRequestPasswordAlert");
    }
    else
    {
      if (v15)
      {
        OSLogHandleForIDSCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v16, OS_LOG_TYPE_DEFAULT, "Account was unauthenticated, and a previous attempt has been made to acquire auth credentials. Bailing.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
      }
      -[CNFRegAccountWebViewController _showURLDidNotLoadAlert](self, "_showURLDidNotLoadAlert");
    }
  }
  else
  {
    -[CNFRegAccountWebViewController completeHandoffWithStatus:appleID:authID:authToken:](self, "completeHandoffWithStatus:appleID:authID:authToken:", v8, v10, v11, v12);
  }

}

- (void)_showRegistrationFailureWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  CNFRegSecureAccountWebViewController *v38;
  _QWORD v39[5];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "code");
    if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
    {
      OSLogHandleForIDSCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v5;
        v42 = 2048;
        v43 = v6;
        _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Received sign in error : %@ (%ld)", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v34 = v5;
        v35 = v6;
        IMLogString();
      }
    }
  }
  -[CNFRegServerWebViewController regController](self, "regController", v34, v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldShowAlertForError:", v5);

  if (v9)
  {
    objc_msgSend(v5, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("cnf-customTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      CommunicationsSetupUIBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v15);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v5, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      CommunicationsSetupUIBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_GENERIC"), &stru_24D077260, v20);
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v5, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("cnf-customButton"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      CommunicationsSetupUIBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v26);
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v13, v18, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x24BDAC760];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __74__CNFRegSecureAccountWebViewController__showRegistrationFailureWithError___block_invoke;
    v39[3] = &unk_24D075A28;
    v39[4] = self;
    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v24, 0, v39);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:", v29);

    objc_msgSend(v5, "userInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", CFSTR("cnf-customActionTitle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = (void *)MEMORY[0x24BEBD3A8];
      v36[0] = v28;
      v36[1] = 3221225472;
      v36[2] = __74__CNFRegSecureAccountWebViewController__showRegistrationFailureWithError___block_invoke_2;
      v36[3] = &unk_24D075BA0;
      v37 = v5;
      v38 = self;
      objc_msgSend(v32, "actionWithTitle:style:handler:", v31, 0, v36);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addAction:", v33);

    }
    -[CNFRegSecureAccountWebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v27, 1, 0);

  }
}

uint64_t __74__CNFRegSecureAccountWebViewController__showRegistrationFailureWithError___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[132] >= 3uLL)
    return objc_msgSend(v1, "_showForgotPasswordAlert");
  else
    return objc_msgSend(v1, "_showRequestPasswordAlert");
}

void __74__CNFRegSecureAccountWebViewController__showRegistrationFailureWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("cnf-customActionURLString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "_shouldLog"))
      {
        OSLogHandleForIDSCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v11 = v6;
          _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Launching URL : %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          v9 = v6;
          IMLogString();
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "regController", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openURL:", v6);

    }
  }

}

- (void)_showBadPasswordAlert
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v3 = _os_feature_enabled_impl();
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_TITLE_APPLEACCOUNT");
  else
    v6 = CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_TITLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D077260, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_INVALID_CREDENTIALS_FOR_%@"), &stru_24D077260, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFRegSecureAccountWebViewController account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loginDisplayString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v13, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __61__CNFRegSecureAccountWebViewController__showBadPasswordAlert__block_invoke;
  v19[3] = &unk_24D075A28;
  v19[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v16, 0, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v18);

  -[CNFRegSecureAccountWebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
}

uint64_t __61__CNFRegSecureAccountWebViewController__showBadPasswordAlert__block_invoke(uint64_t a1)
{
  CNFRegLogBacktrace();
  return objc_msgSend(*(id *)(a1 + 32), "_showRequestPasswordAlert");
}

- (void)_showRequestPasswordAlert
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  CNFRegSecureAccountWebViewController *v24;
  _QWORD v25[5];

  v3 = _os_feature_enabled_impl();
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_TITLE_APPLEACCOUNT");
  else
    v6 = CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_TITLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D077260, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFRegSecureAccountWebViewController account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loginDisplayString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_CANCEL"), &stru_24D077260, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_BUTTON_LABEL"), &stru_24D077260, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addTextFieldWithConfigurationHandler:", &__block_literal_global_9);
  v17 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __65__CNFRegSecureAccountWebViewController__showRequestPasswordAlert__block_invoke_2;
  v25[3] = &unk_24D075A28;
  v25[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v12, 0, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v18);

  v19 = (void *)MEMORY[0x24BEBD3A8];
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __65__CNFRegSecureAccountWebViewController__showRequestPasswordAlert__block_invoke_3;
  v22[3] = &unk_24D075BA0;
  v23 = v16;
  v24 = self;
  v20 = v16;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v15, 0, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v21);

  -[CNFRegSecureAccountWebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
}

uint64_t __65__CNFRegSecureAccountWebViewController__showRequestPasswordAlert__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSecureTextEntry:", 1);
}

uint64_t __65__CNFRegSecureAccountWebViewController__showRequestPasswordAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelTapped");
}

void __65__CNFRegSecureAccountWebViewController__showRequestPasswordAlert__block_invoke_3(uint64_t a1)
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
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "showSpinner");
    objc_msgSend(*(id *)(a1 + 40), "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authorizationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateAuthorizationCredentials:token:", v7, 0);

    objc_msgSend(*(id *)(a1 + 40), "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTemporaryPassword:", v4);

    objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateAccount:", v10);

    objc_msgSend(*(id *)(a1 + 40), "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerAccount");

    objc_msgSend(*(id *)(a1 + 40), "_startTimeoutWithDuration:", 20.0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_showBadPasswordAlert");
  }

}

- (void)_launchForgotPasswordUrl
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CNFRegiForgotURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v2, 0);

}

- (void)_resetSigninFailureCount
{
  self->_signinFailureCount = 0;
}

- (void)_incrementSigninFailureCount
{
  unint64_t signinFailureCount;

  signinFailureCount = self->_signinFailureCount;
  if (signinFailureCount != -1)
    self->_signinFailureCount = signinFailureCount + 1;
}

- (void)_showForgotPasswordAlert
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];

  v3 = _os_feature_enabled_impl();
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_TITLE_APPLEACCOUNT");
  else
    v6 = CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_TITLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D077260, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_MESSAGE"), &stru_24D077260, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_CANCEL"), &stru_24D077260, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_OK"), &stru_24D077260, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v10, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __64__CNFRegSecureAccountWebViewController__showForgotPasswordAlert__block_invoke;
  v22[3] = &unk_24D075A28;
  v22[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v13, 1, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v19);

  v21[0] = v18;
  v21[1] = 3221225472;
  v21[2] = __64__CNFRegSecureAccountWebViewController__showForgotPasswordAlert__block_invoke_2;
  v21[3] = &unk_24D075A28;
  v21[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v16, 0, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v20);

  -[CNFRegSecureAccountWebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
}

uint64_t __64__CNFRegSecureAccountWebViewController__showForgotPasswordAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showRequestPasswordAlert");
}

uint64_t __64__CNFRegSecureAccountWebViewController__showForgotPasswordAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchForgotPasswordUrl");
}

- (id)authIdHeaderValue
{
  void *v2;
  void *v3;

  -[CNFRegSecureAccountWebViewController account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)authTokenHeaderValue
{
  void *v2;
  void *v3;

  -[CNFRegSecureAccountWebViewController account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setupAccountHandlers
{
  void *v3;
  _QWORD v4[5];

  -[CNFRegServerWebViewController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllHandlers");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__CNFRegSecureAccountWebViewController__setupAccountHandlers__block_invoke;
  v4[3] = &unk_24D075CB8;
  v4[4] = self;
  objc_msgSend(v3, "setAccountRegistrationBlock:", v4);

}

void __61__CNFRegSecureAccountWebViewController__setupAccountHandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _BYTE *v8;
  int v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "account");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v5 && (v8 = *(_BYTE **)(a1 + 32), v8[1048]) && (objc_msgSend(v8, "timedOut") & 1) == 0)
  {
    v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1049);

    if (!v9)
    {
      if (objc_msgSend(v5, "CNFRegSignInComplete"))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "_shouldLog"))
        {
          OSLogHandleForIDSCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, "Got new account credentials, reloading page", v11, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            IMLogString();
        }
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1049) = 1;
        objc_msgSend(*(id *)(a1 + 32), "_resetSigninFailureCount");
        objc_msgSend(*(id *)(a1 + 32), "_stopTimeout");
        objc_msgSend(*(id *)(a1 + 32), "_reloadDelayed");
      }
      else if (objc_msgSend(v5, "CNFRegSignInFailed"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_incrementSigninFailureCount");
        objc_msgSend(*(id *)(a1 + 32), "_stopTimeout");
        objc_msgSend(*(id *)(a1 + 32), "_showRegistrationFailureWithError:", v6);
      }
    }
  }
  else
  {

  }
}

- (IMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
