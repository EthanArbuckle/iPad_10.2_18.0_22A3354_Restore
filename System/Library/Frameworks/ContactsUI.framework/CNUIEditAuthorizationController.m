@implementation CNUIEditAuthorizationController

- (void)presentAuthorizationUI
{
  void *v3;
  id v4;

  objc_msgSend((Class)getSTRemotePasscodeControllerClass[0](), "activateRemotePINUI");
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  getSTRestrictionsPINControllerDidFinishNotification[0]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_lockoutRestrictionsPINControllerDidFinish_, v3, 0);

}

- (void)lockoutRestrictionsPINControllerDidFinish:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getSTNotificationKeyPINSuccess[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CNUIEditAuthorizationController userDidEnterPasswordCorrectly:](self, "userDidEnterPasswordCorrectly:", objc_msgSend(v6, "BOOLValue"));
}

- (void)userDidEnterPasswordCorrectly:(BOOL)a3
{
  if (a3)
    -[CNUIEditAuthorizationController didAutorize](self, "didAutorize");
  else
    -[CNUIEditAuthorizationController didNotAuthorize](self, "didNotAuthorize");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNUIEditAuthorizationController;
  -[CNUIEditAuthorizationController dealloc](&v4, sel_dealloc);
}

- (void)didAutorize
{
  id v3;

  -[CNUIEditAuthorizationController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editAuthorizationController:authorizationDidFinishWithResult:", self, 2);

}

- (void)didNotAuthorize
{
  id v3;

  -[CNUIEditAuthorizationController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editAuthorizationController:authorizationDidFinishWithResult:", self, 1);

}

- (CNUIEditAuthorizationControllerDelegate)delegate
{
  return (CNUIEditAuthorizationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)sender
{
  return objc_loadWeakRetained(&self->_sender);
}

- (void)setSender:(id)a3
{
  objc_storeWeak(&self->_sender, a3);
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (UIViewController)guardedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_guardedViewController);
}

- (void)setGuardedViewController:(id)a3
{
  objc_storeWeak((id *)&self->_guardedViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_guardedViewController);
  objc_destroyWeak(&self->_sender);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
