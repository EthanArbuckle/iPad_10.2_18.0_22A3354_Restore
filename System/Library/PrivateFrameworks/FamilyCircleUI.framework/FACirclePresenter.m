@implementation FACirclePresenter

- (FACirclePresenter)init
{
  -[FACirclePresenter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (FACirclePresenter)initWithPresenter:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  FACirclePresenter *v9;
  FACirclePresenter *v10;
  RemoteUIController *v11;
  RemoteUIController *remoteUIController;
  FAProfilePictureStore *v13;
  FAProfilePictureStore *familyPictureStore;
  FACircleRemoteUIDelegate *v15;
  void *v16;
  uint64_t v17;
  FACircleRemoteUIDelegate *remoteUIDelegate;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FACirclePresenter;
  v9 = -[FACirclePresenter init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a3);
    v11 = (RemoteUIController *)objc_alloc_init(MEMORY[0x24BE7EE20]);
    remoteUIController = v10->_remoteUIController;
    v10->_remoteUIController = v11;

    -[RemoteUIController fa_registerFamilyRUIViews](v10->_remoteUIController, "fa_registerFamilyRUIViews");
    -[RemoteUIController setHostViewController:](v10->_remoteUIController, "setHostViewController:", v10->_presenter);
    v13 = -[FAProfilePictureStore initWithFamilyCircle:]([FAProfilePictureStore alloc], "initWithFamilyCircle:", 0);
    familyPictureStore = v10->_familyPictureStore;
    v10->_familyPictureStore = v13;

    v15 = [FACircleRemoteUIDelegate alloc];
    -[FACirclePresenter _serverHookHandlerWithRemoteUIController:](v10, "_serverHookHandlerWithRemoteUIController:", v10->_remoteUIController);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FACircleRemoteUIDelegate initWithContext:serverHookHandler:pictureStore:](v15, "initWithContext:serverHookHandler:pictureStore:", v8, v16, v10->_familyPictureStore);
    remoteUIDelegate = v10->_remoteUIDelegate;
    v10->_remoteUIDelegate = (FACircleRemoteUIDelegate *)v17;

    -[FACircleRemoteUIDelegate setDelegate:](v10->_remoteUIDelegate, "setDelegate:", v10);
    -[FACircleRemoteUIDelegate configureHookHandlersForRUIController:](v10->_remoteUIDelegate, "configureHookHandlersForRUIController:", v10->_remoteUIController);
    -[RemoteUIController setDelegate:](v10->_remoteUIController, "setDelegate:", v10->_remoteUIDelegate);
  }

  return v10;
}

- (void)setPresenter:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_presenter, a3);
  v5 = a3;
  -[RemoteUIController setHostViewController:](self->_remoteUIController, "setHostViewController:", self->_presenter);

}

- (void)cancel
{
  RemoteUIController *remoteUIController;

  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = 0;

}

- (id)_serverHookHandlerWithRemoteUIController:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BE04D78];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BE04D78], "fcui_defaultFresnoServerHooks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRemoteUIController:hooks:", v4, v6);

  return v7;
}

- (void)loadRequest:(id)a3 completion:(id)a4
{
  id v6;
  id completion;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  completion = self->_completion;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (completion)
  {
    _FALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FACirclePresenter loadRequest:completion:].cold.1(v10);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE30900], -1000, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30A38]), "initWithLoadSuccess:error:userInfo:", 0, v11, 0);
    ((void (**)(_QWORD, void *))v9)[2](v9, v12);

  }
  else
  {
    v13 = (void *)objc_msgSend(v8, "copy");

    v14 = self->_completion;
    self->_completion = v13;

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __44__FACirclePresenter_loadRequest_completion___block_invoke;
    v15[3] = &unk_24C88B958;
    v15[4] = self;
    v16 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v15);

  }
}

uint64_t __44__FACirclePresenter_loadRequest_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "loadRequest:completion:", *(_QWORD *)(a1 + 40), 0);
}

- (void)setCustomRUIStyle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_customRUIStyle, a3);
  v5 = a3;
  -[RemoteUIController setStyle:](self->_remoteUIController, "setStyle:", self->_customRUIStyle);

}

- (void)circleRemoteUIDelegate:(id)a3 completedWithResponse:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  void *v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "loadSuccess");
    objc_msgSend(v5, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67109378;
    v10[1] = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "FACirclePresenter - FACircleRemoteUIDelegate completedWithSuccess: %d error: %@", (uint8_t *)v10, 0x12u);

  }
  if (self->_completion)
  {
    _FALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "FACirclePresenter - we have a completion, calling back", (uint8_t *)v10, 2u);
    }

    (*((void (**)(void))self->_completion + 2))();
  }

}

- (void)circleRemoteUIDelegateDidPresent:(id)a3
{
  FACirclePresenterDelegate **p_delegate;
  id WeakRetained;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "circlePresenterDidPresent:", self);

  }
}

- (UIViewController)presenter
{
  return self->_presenter;
}

- (RUIStyle)customRUIStyle
{
  return self->_customRUIStyle;
}

- (FACirclePresenterDelegate)delegate
{
  return (FACirclePresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customRUIStyle, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_familyPictureStore, 0);
  objc_storeStrong((id *)&self->_remoteUIDelegate, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
}

- (void)loadRequest:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DE41000, log, OS_LOG_TYPE_ERROR, "Circle presenter already in use, bailing!", v1, 2u);
}

@end
