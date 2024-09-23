@implementation SKRemoteAccountPageViewController

+ (id)exportedInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC959E8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  getSKUIRedeemClass();
  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_overrideRedeemCameraWithCompletion_, 0, 1);

  return v2;
}

+ (id)serviceViewControllerInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECAA7C8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  getSKUIRedeemClass();
  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_performRedeemOperationWithCode_cameraRecognized_completion_, 0, 1);

  return v2;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  SKAccountPageViewController **p_accountPageViewController;
  id v4;
  id WeakRetained;

  p_accountPageViewController = &self->_accountPageViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  objc_msgSend(WeakRetained, "_dismissViewControllerWithResult:error:", 0, v4);

}

- (void)didPrepareWithResult:(id)a3 error:(id)a4
{
  SKAccountPageViewController **p_accountPageViewController;
  id v6;
  id v7;
  uint64_t v8;
  id WeakRetained;

  p_accountPageViewController = &self->_accountPageViewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(WeakRetained, "_didPrepareWithResult:error:", v8, v6);
}

- (void)didFinishLoading
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_accountPageViewController);
  objc_msgSend(WeakRetained, "_didFinishLoading");

}

- (void)dismissViewControllerWithResult:(id)a3 error:(id)a4
{
  SKAccountPageViewController **p_accountPageViewController;
  id v6;
  id v7;
  uint64_t v8;
  id WeakRetained;

  p_accountPageViewController = &self->_accountPageViewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(WeakRetained, "_dismissViewControllerWithResult:error:", v8, v6);
}

- (void)financeInterruptionResolved:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountPageViewController);
  objc_msgSend(WeakRetained, "_financeInterruptionResolved:", v3);

}

- (void)overrideCreditCardPresentationWithCompletion:(id)a3
{
  SKAccountPageViewController **p_accountPageViewController;
  id v4;
  id WeakRetained;

  p_accountPageViewController = &self->_accountPageViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  objc_msgSend(WeakRetained, "_overrideCreditCardPresentationWithCompletion:", v4);

}

- (void)overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4
{
  SKAccountPageViewController **p_accountPageViewController;
  id v6;
  id WeakRetained;

  p_accountPageViewController = &self->_accountPageViewController;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  objc_msgSend(WeakRetained, "_overrideRedeemCameraPerformAction:withObject:", a3, v6);

}

- (void)overrideRedeemCameraWithCompletion:(id)a3
{
  SKAccountPageViewController **p_accountPageViewController;
  id v4;
  id WeakRetained;

  p_accountPageViewController = &self->_accountPageViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  objc_msgSend(WeakRetained, "_overrideRedeemCameraWithCompletion:", v4);

}

- (void)setBridgedNavigationItemWithOptions:(id)a3
{
  SKAccountPageViewController **p_accountPageViewController;
  id v4;
  id WeakRetained;

  p_accountPageViewController = &self->_accountPageViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  objc_msgSend(WeakRetained, "_setBridgedNavigationItemWithOptions:", v4);

}

- (void)pushBridgedViewControllerAnimated:(BOOL)a3 options:(id)a4
{
  _BOOL8 v4;
  SKAccountPageViewController **p_accountPageViewController;
  id v6;
  id WeakRetained;

  v4 = a3;
  p_accountPageViewController = &self->_accountPageViewController;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_accountPageViewController);
  objc_msgSend(WeakRetained, "_pushBridgedViewControllerAnimated:options:", v4, v6);

}

- (void)popBridgedViewControllersToIndex:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_accountPageViewController);
  objc_msgSend(WeakRetained, "_popBridgedViewControllersToIndex:", a3);

}

- (void)presentBridgedViewController
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_accountPageViewController);
  objc_msgSend(WeakRetained, "_presentBridgedViewController");

}

- (void)dismissBridgedViewController
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_accountPageViewController);
  objc_msgSend(WeakRetained, "_dismissBridgedViewController");

}

- (id)disconnect
{
  void *v3;
  void *v4;
  objc_super v6;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissPresentingBridgedViewController");
  v6.receiver = self;
  v6.super_class = (Class)SKRemoteAccountPageViewController;
  -[_UIRemoteViewController disconnect](&v6, sel_disconnect);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SKAccountPageViewController)accountPageViewController
{
  return (SKAccountPageViewController *)objc_loadWeakRetained((id *)&self->_accountPageViewController);
}

- (void)setAccountPageViewController:(id)a3
{
  objc_storeWeak((id *)&self->_accountPageViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accountPageViewController);
}

@end
