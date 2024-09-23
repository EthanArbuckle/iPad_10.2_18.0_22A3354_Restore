@implementation _ASCredentialProviderExtensionConfigurationViewController

- (void)beginConfiguringExtension
{
  -[_ASExtensionViewController _beginRequestWithConnectionHandler:](self, "_beginRequestWithConnectionHandler:", &__block_literal_global_8);
}

- (void)_requestDidFailWithError:(id)a3 completion:(id)a4
{
  -[_ASCredentialProviderExtensionConfigurationViewController _finishWithSuccess:completion:](self, "_finishWithSuccess:completion:", 0, a4);
}

- (void)_finishWithSuccess:(BOOL)a3 completion:(id)a4
{
  id v5;
  id WeakRetained;
  void (**v7)(void);

  if (a4)
    v5 = a4;
  else
    v5 = &__block_literal_global_2;
  v7 = (void (**)(void))MEMORY[0x212BBEFEC](v5, a2, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "credentialProviderExtensionConfigurationViewControllerDidFinish:completion:", self, v7);
  else
    v7[2]();

}

- (void)prepareToCompleteExtensionConfigurationRequestWithHost:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __127___ASCredentialProviderExtensionConfigurationViewController_prepareToCompleteExtensionConfigurationRequestWithHost_completion___block_invoke;
  v7[3] = &unk_24C950080;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

- (_ASCredentialProviderExtensionConfigurationViewControllerDelegate)delegate
{
  return (_ASCredentialProviderExtensionConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
