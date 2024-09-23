@implementation _ASAccountAuthenticationModificationRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("ASAccountAuthenticationModificationServiceViewController"), CFSTR("com.apple.SafariViewService"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)upgradeCredentialToSignInWithApple:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a6, "_plugIn");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "upgradeCredentialToSignInWithApple:forServiceIdentifier:userInfo:extensionUUID:", v12, v11, v10, v15);

}

- (void)updateCredential:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a6, "_plugIn");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateCredential:forServiceIdentifier:userInfo:extensionUUID:", v12, v11, v10, v15);

}

- (void)requestToUpgradeToSignInWithAppleDidFinishWithUserInfo:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountModificationRemoteViewControllerDidFinishUpgradeToSignInWithApple:userInfo:completion:", self, v8, v6);
  else
    v6[2](v6);

}

- (void)requestDidFinishWithCredential:(id)a3 userInfo:(id)a4 completion:(id)a5
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
    objc_msgSend(WeakRetained, "accountModificationRemoteViewController:didFinishWithCredential:userInfo:completion:", self, v11, v8, v9);
  else
    v9[2](v9);

}

- (void)requestDidFailWithError:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountModificationRemoteViewController:requestCanceledWithError:completion:", self, v8, v6);
  else
    v6[2](v6);

}

- (void)presentAccountModificationRemoteViewController
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presentAccountModificationRemoteViewController:", self);

}

- (void)dismissAccountModificationRemoteViewController
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dismissAccountModificationRemoteViewController:", self);

}

+ (id)exportedInterface
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A372D0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_requestDidFinishWithCredential_userInfo_completion_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_requestDidFailWithError_completion_, 0, 0);

  return v2;
}

+ (id)serviceViewControllerInterface
{
  return +[ASAccountAuthenticationModificationServiceViewController _exportedInterface](ASAccountAuthenticationModificationServiceViewController, "_exportedInterface");
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountModificationRemoteViewController:viewServiceDidTerminateWithError:", self, v5);

}

- (_ASAccountAuthenticationModificationRemoteViewControllerDelegate)delegate
{
  return (_ASAccountAuthenticationModificationRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
