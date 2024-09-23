@implementation _ASAccountAuthenticationModificationExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "_as_accountModificationHostInterface");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "_as_accountModificationExtensionInterface");
}

- (void)getSignInWithAppleAuthorizationWithState:(id)a3 nonce:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "getSignInWithAppleAuthorizationWithState:nonce:completion:", v12, v8, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v11);

  }
}

- (void)prepareToCompleteUpgradeToSignInWithAppleWithUserInfo:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "prepareToCompleteUpgradeToSignInWithAppleRequestWithHostContext:userInfo:completion:", self, v8, v6);
  else
    v6[2](v6);

}

- (void)prepareToCompleteRequestWithUpdatedCredential:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "prepareToCompleteRequestWithHostContext:updatedCredential:userInfo:completion:", self, v11, v8, v9);
  else
    v9[2](v9);

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

- (void)dismissRequestUI
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dismissRequestUI:", self);

}

- (_ASAccountAuthenticationModificationExtensionHostContextDelegate)delegate
{
  return (_ASAccountAuthenticationModificationExtensionHostContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
