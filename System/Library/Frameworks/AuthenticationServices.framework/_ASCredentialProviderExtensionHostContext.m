@implementation _ASCredentialProviderExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "_as_credentialProviderHostInterface");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "_as_credentialProviderExtensionInterface");
}

- (void)prepareToCompleteRequestWithSelectedCredential:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "prepareToCompleteRequestWithHostContext:credential:completion:", self, v8, v6);
  else
    v6[2](v6);

}

- (void)prepareToCompleteAssertionRequestWithSelectedPasskeyCredential:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "prepareToCompleteRequestWithHostContext:passkeyAssertionCredential:completion:", self, v8, v6);
  else
    v6[2](v6);

}

- (void)prepareToCompleteRegistrationRequestWithSelectedPasskeyCredential:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "prepareToCompleteRequestWithHostContext:passkeyRegistrationCredential:completion:", self, v8, v6);
  else
    v6[2](v6);

}

- (void)prepareToCompleteOneTimeCodeRequestWithSelectedCredential:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "prepareToCompleteOneTimeCodeRequestWithHostContext:credential:completion:", self, v8, v6);
  else
    v6[2](v6);

}

- (void)prepareToCompleteRequestWithSelectedText:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "prepareToCompleteSelectionRequestWithHostContext:text:completion:", self, v8, v6);
  else
    v6[2](v6);

}

- (void)prepareToCancelRequestWithError:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "prepareToCancelRequestWithHostContext:error:completion:", self, v8, v6);
  else
    v6[2](v6);

}

- (void)prepareToCompleteExtensionConfigurationRequestWithCompletion:(id)a3
{
  _ASCredentialProviderExtensionHostContextDelegate **p_delegate;
  void (**v5)(_QWORD);
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = (void (**)(_QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "prepareToCompleteExtensionConfigurationRequestWithHost:completion:", self, v5);
  else
    v5[2](v5);

}

- (_ASCredentialProviderExtensionHostContextDelegate)delegate
{
  return (_ASCredentialProviderExtensionHostContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
