@implementation HKHealthPrivacyHostObjectPickerViewController

- (void)setPromptSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKHealthPrivacyHostObjectPickerViewController _healthPrivacyServiceViewControllerProxy](self, "_healthPrivacyServiceViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPromptSession:", v4);

}

- (void)didFinishWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKHealthPrivacyHostObjectPickerViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "healthPrivacyHostObjectPickerViewController:didFinishWithError:", self, v4);

}

+ (id)requestRemoteViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("HKHealthPrivacyServiceObjectPickerViewController"), *MEMORY[0x1E0CB7688], v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (HKHealthPrivacyHostObjectPickerViewControllerDelegate)delegate
{
  return (HKHealthPrivacyHostObjectPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
