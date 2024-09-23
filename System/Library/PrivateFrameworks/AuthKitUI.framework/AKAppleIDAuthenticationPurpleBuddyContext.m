@implementation AKAppleIDAuthenticationPurpleBuddyContext

- (AKAppleIDAuthenticationPurpleBuddyContext)init
{
  AKAppleIDAuthenticationPurpleBuddyContext *v2;
  AKAppleIDAuthenticationPurpleBuddyContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
  v2 = -[AKAppleIDAuthenticationPurpleBuddyContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AKAppleIDAuthenticationPurpleBuddyContext setShouldUpdatePersistentServiceTokens:](v2, "setShouldUpdatePersistentServiceTokens:", 1);
    -[AKAppleIDAuthenticationPurpleBuddyContext setAuthenticationType:](v3, "setAuthenticationType:", 2);
    -[AKAppleIDAuthenticationPurpleBuddyContext setSupportsPiggybacking:](v3, "setSupportsPiggybacking:", 1);
    -[AKAppleIDAuthenticationInAppContext setForceInlinePresentation:](v3, "setForceInlinePresentation:", 1);
  }
  return v3;
}

- (NSString)usernameForCreating
{
  void *v2;
  void *v3;
  void *v4;

  -[AKAppleIDAuthenticationInAppContext serverDataHarvester](self, "serverDataHarvester");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "harvestedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)passwordForCreating
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  -[AKAppleIDAuthenticationInAppContext serverDataHarvester](self, "serverDataHarvester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "harvestedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationPurpleBuddyContext passwordForCreating].cold.1(self, v5, v6);

  return (NSString *)v5;
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[16];

  v4 = a3;
  -[AKAppleIDAuthenticationPurpleBuddyContext _shortLivedToken](self, "_shortLivedToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Suppressing interactive login for SLT upgrade", buf, 2u);
    }

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7027);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, 0, v7);

    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
    -[AKAppleIDAuthenticationInAppContext presentBasicLoginUIWithCompletion:](&v8, sel_presentBasicLoginUIWithCompletion_, v4);
  }

}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD, void *))a3;
  -[AKAppleIDAuthenticationPurpleBuddyContext _shortLivedToken](self, "_shortLivedToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Suppressing login dismiss for SLT upgrade", buf, 2u);
    }

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7027);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v7);

    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
    -[AKAppleIDAuthenticationInAppContext dismissBasicLoginUIWithCompletion:](&v8, sel_dismissBasicLoginUIWithCompletion_, v4);
  }

}

- (void)dismissServerProvidedUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__AKAppleIDAuthenticationPurpleBuddyContext_dismissServerProvidedUIWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

id __83__AKAppleIDAuthenticationPurpleBuddyContext_dismissServerProvidedUIWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_super v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isPresentingServerUI"))
  {
    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  v3 = *(_QWORD *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
  return objc_msgSendSuper2(&v5, sel_dismissServerProvidedUIWithCompletion_, v3);
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CFFF10]))
  {

    goto LABEL_8;
  }
  v15 = objc_msgSend(v10, "code");

  if (v15 != -7034)
  {
LABEL_8:
    v17.receiver = self;
    v17.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
    -[AKAppleIDAuthenticationInAppContext _presentLoginAlertWithError:title:message:waitForInteraction:completion:](&v17, sel__presentLoginAlertWithError_title_message_waitForInteraction_completion_, v10, v11, v12, 1, v13);
    goto LABEL_9;
  }
  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v16, OS_LOG_TYPE_DEFAULT, "Suppressing error for forced failure", buf, 2u);
  }

  if (v13)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v13 + 2))(v13, 0, 0, 0, v10);
LABEL_9:

}

- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  objc_msgSend(v5, "ak_errorWithCode:", -7027);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKAppleIDAuthenticationPurpleBuddyContext;
  v7 = a4;
  -[AKAppleIDAuthenticationInAppContext remoteUIController:didReceiveObjectModel:actionSignal:](&v9, sel_remoteUIController_didReceiveObjectModel_actionSignal_, a3, v7, a5);
  objc_msgSend(MEMORY[0x1E0D872E8], "setupAssistantStyle", v9.receiver, v9.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyToObjectModel:", v7);

}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_topViewControllerOnLoadStart);
  objc_storeStrong((id *)&self->_overrideFirstActionSignal, 0);
}

- (void)passwordForCreating
{
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "serverDataHarvester");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v7 = objc_msgSend(a2, "length");
    v6 = CFSTR("(******)");
    if (!v7)
      v6 = CFSTR("(empty)");
  }
  else
  {
    v6 = CFSTR("(null)");
  }
  v8 = 138478083;
  v9 = v5;
  v10 = 2113;
  v11 = v6;
  _os_log_debug_impl(&dword_1BD795000, a3, OS_LOG_TYPE_DEBUG, "Buddy password from harverster %{private}@ - %{private}@", (uint8_t *)&v8, 0x16u);

}

@end
