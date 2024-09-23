@implementation _ASCredentialAuthenticationViewController

- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 passkeyAssertionRequest:(id)a4
{
  id v6;
  _ASCredentialAuthenticationViewController *v7;
  uint64_t v8;
  ASCredentialRequest *credentialRequest;
  _ASCredentialAuthenticationViewController *v10;
  _ASCredentialAuthenticationViewController *v11;
  _QWORD v13[4];
  _ASCredentialAuthenticationViewController *v14;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_ASCredentialAuthenticationViewController;
  v7 = -[_ASExtensionViewController initWithExtension:](&v15, sel_initWithExtension_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    credentialRequest = v7->_credentialRequest;
    v7->_credentialRequest = (ASCredentialRequest *)v8;

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __87___ASCredentialAuthenticationViewController_initWithExtension_passkeyAssertionRequest___block_invoke;
    v13[3] = &unk_24C94FE38;
    v10 = v7;
    v14 = v10;
    -[_ASExtensionViewController _beginNonUIRequest:connectionHandler:](v10, "_beginNonUIRequest:connectionHandler:", 1, v13);
    v11 = v10;

  }
  return v7;
}

- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 passkeyRegistrationRequest:(id)a4 forConditionalRegistration:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  _ASCredentialAuthenticationViewController *v9;
  uint64_t v10;
  ASCredentialRequest *credentialRequest;
  id *v12;
  _ASCredentialAuthenticationViewController *v13;
  _QWORD v15[4];
  _ASCredentialAuthenticationViewController *v16;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v5 = a5;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_ASCredentialAuthenticationViewController;
  v9 = -[_ASExtensionViewController initWithExtension:](&v19, sel_initWithExtension_, a3);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    credentialRequest = v9->_credentialRequest;
    v9->_credentialRequest = (ASCredentialRequest *)v10;

    if (v5)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke;
      v17[3] = &unk_24C94FE38;
      v12 = &v18;
      v18 = v8;
      -[_ASExtensionViewController _beginNonUIRequest:connectionHandler:](v9, "_beginNonUIRequest:connectionHandler:", 0, v17);
    }
    else
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_2;
      v15[3] = &unk_24C94FE38;
      v12 = (id *)&v16;
      v16 = v9;
      -[_ASExtensionViewController _beginRequestWithConnectionHandler:](v16, "_beginRequestWithConnectionHandler:", v15);
    }
    v13 = v9;

  }
  return v9;
}

- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 credentialIdentity:(id)a4
{
  id v6;
  _ASCredentialAuthenticationViewController *v7;
  uint64_t v8;
  ASCredentialRequest *credentialRequest;
  _ASCredentialAuthenticationViewController *v10;
  _ASCredentialAuthenticationViewController *v11;
  _QWORD v13[4];
  id v14;
  _ASCredentialAuthenticationViewController *v15;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_ASCredentialAuthenticationViewController;
  v7 = -[_ASExtensionViewController initWithExtension:](&v16, sel_initWithExtension_, a3);
  if (v7)
  {
    +[ASPasswordCredentialRequest requestWithCredentialIdentity:](ASPasswordCredentialRequest, "requestWithCredentialIdentity:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    credentialRequest = v7->_credentialRequest;
    v7->_credentialRequest = (ASCredentialRequest *)v8;

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __82___ASCredentialAuthenticationViewController_initWithExtension_credentialIdentity___block_invoke;
    v13[3] = &unk_24C94FE60;
    v14 = v6;
    v10 = v7;
    v15 = v10;
    -[_ASExtensionViewController _beginNonUIRequest:connectionHandler:](v10, "_beginNonUIRequest:connectionHandler:", 1, v13);
    v11 = v10;

  }
  return v7;
}

- (_ASCredentialAuthenticationViewController)initWithExtension:(id)a3 oneTimeCodeCredentialRequest:(id)a4
{
  id v7;
  _ASCredentialAuthenticationViewController *v8;
  _ASCredentialAuthenticationViewController *v9;
  _ASCredentialAuthenticationViewController *v10;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_ASCredentialAuthenticationViewController;
  v8 = -[_ASExtensionViewController initWithExtension:](&v14, sel_initWithExtension_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_credentialRequest, a4);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __92___ASCredentialAuthenticationViewController_initWithExtension_oneTimeCodeCredentialRequest___block_invoke;
    v12[3] = &unk_24C94FE38;
    v13 = v7;
    -[_ASExtensionViewController _beginNonUIRequest:connectionHandler:](v9, "_beginNonUIRequest:connectionHandler:", 1, v12);
    v10 = v9;

  }
  return v9;
}

- (void)_nonUIRequestDidRequireUserInteraction
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke;
  v2[3] = &unk_24C94FE38;
  v2[4] = self;
  -[_ASExtensionViewController _beginRequestWithConnectionHandler:](self, "_beginRequestWithConnectionHandler:", v2);
}

- (void)_finishWithCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id WeakRetained;
  id v12;

  v12 = a3;
  v8 = a4;
  if (a5)
    v9 = a5;
  else
    v9 = &__block_literal_global_6;
  v10 = (void (**)(_QWORD))MEMORY[0x212BBEFEC](v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "credentialAuthenticationViewController:didFinishWithCredential:error:completion:", self, v12, v8, v10);
  else
    v10[2](v10);

}

- (void)_finishWithPasskeyAssertionCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id WeakRetained;
  id v12;

  v12 = a3;
  v8 = a4;
  if (a5)
    v9 = a5;
  else
    v9 = &__block_literal_global_7;
  v10 = (void (**)(_QWORD))MEMORY[0x212BBEFEC](v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "credentialAuthenticationViewController:didFinishWithPasskeyAssertionCredential:error:completion:", self, v12, v8, v10);
  else
    v10[2](v10);

}

- (void)_finishWithPasskeyRegistrationCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id WeakRetained;
  id v12;

  v12 = a3;
  v8 = a4;
  if (a5)
    v9 = a5;
  else
    v9 = &__block_literal_global_10;
  v10 = (void (**)(_QWORD))MEMORY[0x212BBEFEC](v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "credentialAuthenticationViewController:didFinishWithPasskeyRegistrationCredential:error:completion:", self, v12, v8, v10);
  else
    v10[2](v10);

}

- (void)_finishWithOneTimeCodeCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id WeakRetained;
  id v12;

  v12 = a3;
  v8 = a4;
  if (a5)
    v9 = a5;
  else
    v9 = &__block_literal_global_13;
  v10 = (void (**)(_QWORD))MEMORY[0x212BBEFEC](v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "credentialAuthenticationViewController:didFinishWithOneTimeCodeCredential:error:completion:", self, v12, v8, v10);
  else
    v10[2](v10);

}

- (void)_requestDidFailWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", CFSTR("ASExtensionErrorDomain"), 101))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20E4D9000, v8, OS_LOG_TYPE_DEFAULT, "Extension did not find a credential corresponding the identity. Invalidating the identity store.", buf, 2u);
    }
    -[_ASExtensionViewController extension](self, "extension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sf_bundleIdentifierForContainingApp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x24BE83028]);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __81___ASCredentialAuthenticationViewController__requestDidFailWithError_completion___block_invoke;
    v13[3] = &unk_24C94FF08;
    v14 = v11;
    v12 = v11;
    objc_msgSend(v12, "removeCredentialIdentityStoreForApplication:completion:", v10, v13);

  }
  -[_ASCredentialAuthenticationViewController _finishWithCredential:error:completion:](self, "_finishWithCredential:error:completion:", 0, v6, v7);

}

- (void)prepareToCompleteRequestWithHostContext:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_credential_completion___block_invoke;
  block[3] = &unk_24C94F6C8;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)prepareToCompleteRequestWithHostContext:(id)a3 passkeyAssertionCredential:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __123___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_passkeyAssertionCredential_completion___block_invoke;
  block[3] = &unk_24C94F6C8;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)prepareToCompleteRequestWithHostContext:(id)a3 passkeyRegistrationCredential:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __126___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_passkeyRegistrationCredential_completion___block_invoke;
  block[3] = &unk_24C94F6C8;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)prepareToCompleteOneTimeCodeRequestWithHostContext:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __118___ASCredentialAuthenticationViewController_prepareToCompleteOneTimeCodeRequestWithHostContext_credential_completion___block_invoke;
  block[3] = &unk_24C94F6C8;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (_ASCredentialAuthenticationViewControllerDelegate)delegate
{
  return (_ASCredentialAuthenticationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_credentialRequest, 0);
}

@end
