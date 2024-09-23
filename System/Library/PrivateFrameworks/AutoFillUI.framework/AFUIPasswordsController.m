@implementation AFUIPasswordsController

- (AFUIPasswordsController)initWithDocumentTraits:(id)a3
{
  id v4;
  AFUIPasswordsController *v5;
  uint64_t v6;
  RTIDocumentTraits *documentTraits;
  AFUIPasswordsController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AFUIPasswordsController;
  v5 = -[AFUIPasswordsController init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    documentTraits = v5->_documentTraits;
    v5->_documentTraits = (RTIDocumentTraits *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)makePasswordPickerViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_msgSend(objc_alloc((Class)get_SFAppAutoFillPasswordViewControllerClass()), "init");
  objc_msgSend(v3, "setDelegate:", self);
  -[RTIDocumentTraits appId](self->_documentTraits, "appId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteAppID:", v4);

  -[RTIDocumentTraits localizedAppName](self->_documentTraits, "localizedAppName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteLocalizedAppName:", v5);

  -[RTIDocumentTraits appName](self->_documentTraits, "appName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteUnlocalizedAppName:", v6);

  -[RTIDocumentTraits associatedDomains](self->_documentTraits, "associatedDomains");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:", v7);

  -[RTIDocumentTraits autofillContext](self->_documentTraits, "autofillContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_WebViewURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setWebViewURL:", v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[RTIDocumentTraits autofillContext](self->_documentTraits, "autofillContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_page_id"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTIDocumentTraits autofillContext](self->_documentTraits, "autofillContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_frame_id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTIDocumentTraits autofillContext](self->_documentTraits, "autofillContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_credential_type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setPageID:frameID:credentialType:", v11, v13, v15);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setSystemAutoFillDocumentTraits:", self->_documentTraits);

  return v3;
}

- (void)presentPasswordPickerFromViewController:(id)a3 didFinishAuthenticationBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[AFUIPasswordsController makePasswordPickerViewController](self, "makePasswordPickerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModalPresentationStyle:", 4);
  v9 = -[AFUIPasswordsController _shouldPresentAllPasswordsViewInPopover](self, "_shouldPresentAllPasswordsViewInPopover");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __96__AFUIPasswordsController_presentPasswordPickerFromViewController_didFinishAuthenticationBlock___block_invoke;
  v13[3] = &unk_250856D20;
  v15 = v8;
  v16 = v7;
  v14 = v6;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "authenticateToPresentInPopover:completion:", v9, v13);

}

uint64_t __96__AFUIPasswordsController_presentPasswordPickerFromViewController_didFinishAuthenticationBlock___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 0, 0);
  return result;
}

+ (BOOL)isPasswordPickerViewControllerAuthenticating:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  get_SFAppAutoFillPasswordViewControllerClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)passwordViewControllerDidFinish:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  objc_msgSend(WeakRetained, "passwordsControllerDidFinish:", self);

}

- (void)passwordViewController:(id)a3 selectedCredential:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passwordsController:selectedCredential:", self, v6);

}

- (void)passwordViewController:(id)a3 fillUsername:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passwordsController:fillUsername:", self, v6);

}

- (void)passwordViewController:(id)a3 fillPassword:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passwordsController:fillPassword:", self, v6);

}

- (void)passwordViewController:(id)a3 fillVerificationCode:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passwordsController:fillVerificationCode:", self, v6);

}

- (void)passwordViewController:(id)a3 fillText:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passwordsController:fillText:", self, v6);

}

- (AFUIPasswordPickerDelegate)passwordPickerDelegate
{
  return (AFUIPasswordPickerDelegate *)objc_loadWeakRetained((id *)&self->_passwordPickerDelegate);
}

- (void)setPasswordPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_passwordPickerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passwordPickerDelegate);
  objc_storeStrong((id *)&self->_documentTraits, 0);
}

@end
