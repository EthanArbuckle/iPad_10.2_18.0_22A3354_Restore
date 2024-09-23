@implementation _ASCredentialListViewController

- (_ASCredentialListViewController)initWithExtension:(id)a3 serviceIdentifiers:(id)a4 requestParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  _ASCredentialListViewController *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _ASIncomingCallObserver *callObserver;
  _ASCredentialListViewController *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_ASCredentialListViewController;
  v11 = -[_ASExtensionViewController initWithExtension:](&v29, sel_initWithExtension_, v8);
  if (v11)
  {
    objc_initWeak(&location, v11);
    v12 = (void *)objc_msgSend(v9, "copy");

    v13 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke;
    v26[3] = &unk_24C94F530;
    objc_copyWeak(&v27, &location);
    v14 = (void *)MEMORY[0x212BBEFEC](v26);
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_3;
    v22[3] = &unk_24C94FF30;
    v23 = v10;
    v9 = v12;
    v24 = v9;
    v15 = v14;
    v25 = v15;
    -[_ASExtensionViewController _beginRequestWithConnectionHandler:](v11, "_beginRequestWithConnectionHandler:", v22);
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_4;
    v20[3] = &unk_24C94F530;
    objc_copyWeak(&v21, &location);
    +[_ASIncomingCallObserver callObserverWithBlock:](_ASIncomingCallObserver, "callObserverWithBlock:", v20);
    v16 = objc_claimAutoreleasedReturnValue();
    callObserver = v11->_callObserver;
    v11->_callObserver = (_ASIncomingCallObserver *)v16;

    v18 = v11;
    objc_destroyWeak(&v21);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (id)initOneTimeCodeCredentialListWithExtension:(id)a3 serviceIdentifiers:(id)a4
{
  id v6;
  id v7;
  _ASCredentialListViewController *v8;
  uint64_t v9;
  uint64_t v10;
  _ASIncomingCallObserver *callObserver;
  _ASCredentialListViewController *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_ASCredentialListViewController;
  v8 = -[_ASExtensionViewController initWithExtension:](&v20, sel_initWithExtension_, v6);
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke;
    v16[3] = &unk_24C94FF58;
    v17 = v7;
    objc_copyWeak(&v18, &location);
    -[_ASExtensionViewController _beginRequestWithConnectionHandler:](v8, "_beginRequestWithConnectionHandler:", v16);
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_4;
    v14[3] = &unk_24C94F530;
    objc_copyWeak(&v15, &location);
    +[_ASIncomingCallObserver callObserverWithBlock:](_ASIncomingCallObserver, "callObserverWithBlock:", v14);
    v10 = objc_claimAutoreleasedReturnValue();
    callObserver = v8->_callObserver;
    v8->_callObserver = (_ASIncomingCallObserver *)v10;

    v12 = v8;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)initForTextSelectingWithExtension:(id)a3 serviceIdentifiers:(id)a4
{
  id v6;
  id v7;
  _ASCredentialListViewController *v8;
  _ASCredentialListViewController *v9;
  uint64_t v10;
  _ASIncomingCallObserver *callObserver;
  _ASCredentialListViewController *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_ASCredentialListViewController;
  v8 = -[_ASExtensionViewController initWithExtension:](&v17, sel_initWithExtension_, v6);
  v9 = v8;
  if (v8)
  {
    -[_ASExtensionViewController _beginRequestWithConnectionHandler:](v8, "_beginRequestWithConnectionHandler:", &__block_literal_global_7);
    objc_initWeak(&location, v9);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __88___ASCredentialListViewController_initForTextSelectingWithExtension_serviceIdentifiers___block_invoke_2;
    v14[3] = &unk_24C94F530;
    objc_copyWeak(&v15, &location);
    +[_ASIncomingCallObserver callObserverWithBlock:](_ASIncomingCallObserver, "callObserverWithBlock:", v14);
    v10 = objc_claimAutoreleasedReturnValue();
    callObserver = v9->_callObserver;
    v9->_callObserver = (_ASIncomingCallObserver *)v10;

    v12 = v9;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)_requestDidFailWithError:(id)a3 completion:(id)a4
{
  -[_ASCredentialListViewController _finishWithCredential:completion:](self, "_finishWithCredential:completion:", 0, a4);
}

- (void)_finishWithCredential:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id WeakRetained;
  id v9;

  v9 = a3;
  if (a4)
    v6 = a4;
  else
    v6 = &__block_literal_global_4;
  v7 = (void (**)(_QWORD))MEMORY[0x212BBEFEC](v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "credentialListViewController:didFinishWithCredential:completion:", self, v9, v7);
  else
    v7[2](v7);

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
  block[2] = __97___ASCredentialListViewController_prepareToCompleteRequestWithHostContext_credential_completion___block_invoke;
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
  void (**v8)(_QWORD);
  id WeakRetained;
  id v10;

  v10 = a4;
  if (a5)
    v7 = a5;
  else
    v7 = &__block_literal_global_7_0;
  v8 = (void (**)(_QWORD))MEMORY[0x212BBEFEC](v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "credentialListViewController:didFinishWithPasskeyAssertionCredential:completion:", self, v10, v8);
  else
    v8[2](v8);

}

- (void)prepareToCompleteOneTimeCodeRequestWithHostContext:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  id WeakRetained;
  id v10;

  v10 = a4;
  if (a5)
    v7 = a5;
  else
    v7 = &__block_literal_global_10_0;
  v8 = (void (**)(_QWORD))MEMORY[0x212BBEFEC](v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "credentialListViewController:didFinishWithOneTimeCodeCredential:completion:", self, v10, v8);
  else
    v8[2](v8);

}

- (void)prepareToCompleteSelectionRequestWithHostContext:(id)a3 text:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  id WeakRetained;
  _QWORD v11[4];
  id v12;
  _ASCredentialListViewController *v13;
  id v14;
  void (**v15)(_QWORD);

  v7 = a4;
  if (a5)
    v8 = a5;
  else
    v8 = &__block_literal_global_13_0;
  v9 = (void (**)(_QWORD))MEMORY[0x212BBEFEC](v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __100___ASCredentialListViewController_prepareToCompleteSelectionRequestWithHostContext_text_completion___block_invoke_2;
    v11[3] = &unk_24C94F718;
    v12 = WeakRetained;
    v13 = self;
    v14 = v7;
    v15 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v11);

  }
  else
  {
    v9[2](v9);
  }

}

- (_ASCredentialListViewControllerDelegate)delegate
{
  return (_ASCredentialListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callObserver, 0);
}

@end
