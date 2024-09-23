@implementation HKHealthPrivacyHostAuthorizationViewController

- (void)setRequestRecord:(id)a3 presentationRequests:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HKHealthPrivacyHostAuthorizationViewController _healthPrivacyServiceViewControllerProxy](self, "_healthPrivacyServiceViewControllerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRequestRecord:presentationRequests:", v7, v6);

}

- (void)show
{
  id v2;

  -[HKHealthPrivacyHostAuthorizationViewController _healthPrivacyServiceViewControllerProxy](self, "_healthPrivacyServiceViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "show");

}

- (void)didFinishWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKHealthPrivacyHostAuthorizationViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "healthPrivacyHostAuthorizationControllerDidFinishWithError:", v4);

}

+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("HKHealthPrivacyServiceAuthorizationViewController"), *MEMORY[0x1E0CB7688], v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (HKHealthPrivacyHostAuthorizationControllerDelegate)delegate
{
  return (HKHealthPrivacyHostAuthorizationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
