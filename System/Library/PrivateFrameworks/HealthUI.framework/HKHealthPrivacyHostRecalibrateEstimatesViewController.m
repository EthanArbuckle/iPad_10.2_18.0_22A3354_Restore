@implementation HKHealthPrivacyHostRecalibrateEstimatesViewController

- (void)setRequestRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HKHealthPrivacyHostRecalibrateEstimatesViewController _healthPrivacyServiceViewControllerProxy](self, "_healthPrivacyServiceViewControllerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRequestRecord:completion:", v7, v6);

}

- (void)didFinishWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKHealthPrivacyHostRecalibrateEstimatesViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "healthPrivacyHostRecalibrateEstimatesControllerDidFinishWithError:", v4);

}

+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("HKHealthPrivacyServiceRecalibrateEstimatesViewController"), *MEMORY[0x1E0CB7688], v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (HKHealthPrivacyHostRecalibrateEstimatesControllerDelegate)delegate
{
  return (HKHealthPrivacyHostRecalibrateEstimatesControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
