@implementation SKStoreProductActivityViewController

- (SKStoreProductActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[SKStoreProductActivityViewController initWithParameters:](self, "initWithParameters:", MEMORY[0x1E0C9AA70], a4);
}

- (SKStoreProductActivityViewController)initWithCoder:(id)a3
{
  return -[SKStoreProductActivityViewController initWithParameters:](self, "initWithParameters:", MEMORY[0x1E0C9AA70]);
}

- (SKStoreProductActivityViewController)init
{
  return -[SKStoreProductActivityViewController initWithParameters:](self, "initWithParameters:", MEMORY[0x1E0C9AA70]);
}

- (SKStoreProductActivityViewController)initWithParameters:(id)a3
{
  id v4;
  SKStoreProductActivityViewController *v5;
  SKInvocationQueueProxy *v6;
  SKUIServiceProductActivityViewController *serviceProxy;
  uint64_t v8;
  NSDictionary *parameters;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *logKey;
  void *v15;
  NSString *v16;
  id v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SKStoreProductActivityViewController;
  v5 = -[SKStoreProductActivityViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = -[SKInvocationQueueProxy initWithProtocol:]([SKInvocationQueueProxy alloc], "initWithProtocol:", &unk_1EECAA9A8);
    serviceProxy = v5->_serviceProxy;
    v5->_serviceProxy = (SKUIServiceProductActivityViewController *)v6;

    v8 = objc_msgSend(v4, "copy");
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("-"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v13;

    -[SKStoreProductActivityViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 17);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v16 = v5->_logKey;
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2114;
      v23 = v16;
      v17 = v15;
      _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Start.", buf, 0x16u);

    }
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  NSString *logKey;
  id v5;
  id v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543618;
    v9 = v3;
    v10 = 2114;
    v11 = logKey;
    v5 = v3;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Dealloc.", buf, 0x16u);

  }
  v6 = (id)-[_UIAsyncInvocation invoke](self->_cancelRequest, "invoke");
  -[SKUIServiceProductActivityViewController setInvocationTarget:](self->_serviceProxy, "setInvocationTarget:", 0);
  -[SKRemoteProductActivityViewController setProductActivityViewController:](self->_remoteViewController, "setProductActivityViewController:", 0);
  v7.receiver = self;
  v7.super_class = (Class)SKStoreProductActivityViewController;
  -[SKStoreProductActivityViewController dealloc](&v7, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKStoreProductActivityViewController;
  -[SKStoreProductActivityViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStoreProductActivityViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[SKStoreProductActivityViewController _requestRemoteViewController](self, "_requestRemoteViewController");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__viewTapped_);
  -[SKStoreProductActivityViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);

  -[SKStoreProductActivityViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addGestureRecognizer:", v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSString *logKey;
  id v7;
  SKUIServiceProductActivityViewController *serviceProxy;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = logKey;
    v7 = v5;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Will disappear.", buf, 0x16u);

  }
  v10.receiver = self;
  v10.super_class = (Class)SKStoreProductActivityViewController;
  -[SKStoreProductActivityViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, v3);
  serviceProxy = self->_serviceProxy;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIServiceProductActivityViewController finishImmediately:](serviceProxy, "finishImmediately:", v9);

}

- (void)_didFinishWithResult:(unint64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  NSString *logKey;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  id v20;
  char v21;
  id v22;
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)v23 = 138543618;
    *(_QWORD *)&v23[4] = v7;
    *(_WORD *)&v23[12] = 2114;
    *(_QWORD *)&v23[14] = logKey;
    v9 = v7;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Finished.", v23, 0x16u);

  }
  if ((-[SKStoreProductActivityViewController isBeingDismissed](self, "isBeingDismissed", *(_OWORD *)v23, *(_QWORD *)&v23[16], v24) & 1) == 0)-[SKStoreProductActivityViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  -[SKStoreProductActivityViewController presentingViewController](self, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(v6, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E5B2D460, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v17);

    objc_msgSend(v10, "presentViewController:animated:completion:", v13, 1, 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v19 = WeakRetained;
    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      v22 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v22, "productActivityViewController:didFinishWithResult:", self, a3);

    }
  }

}

- (void)_requestRemoteViewController
{
  _UIAsyncInvocation *v3;
  _UIAsyncInvocation *cancelRequest;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__SKStoreProductActivityViewController__requestRemoteViewController__block_invoke;
  v5[3] = &unk_1E5B26AD0;
  v5[4] = self;
  +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SKRemoteProductActivityViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("ServiceProductActivityViewController"), CFSTR("com.apple.ios.StoreKitUIService"), v5);
  v3 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v3;

}

void __68__SKStoreProductActivityViewController__requestRemoteViewController__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a2;
  v7 = *(id **)(a1 + 32);
  v11 = v6;
  if (v6)
  {
    objc_storeStrong(v7 + 123, a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setProductActivityViewController:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "serviceViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setInvocationTarget:", v8);

    objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984));
    objc_msgSend(*(id *)(a1 + 32), "_addRemoteView");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setupProductWithParameters:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
  }
  else
  {
    objc_msgSend(v7, "_didFinishWithResult:error:", 0, a3);
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 976);
  *(_QWORD *)(v9 + 976) = 0;

}

- (void)_addRemoteView
{
  void *v3;
  void *v4;
  id v5;

  if (self->_remoteViewController)
  {
    if (-[SKStoreProductActivityViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SKRemoteProductActivityViewController view](self->_remoteViewController, "view");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v3);

      -[SKStoreProductActivityViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addSubview:", v5);
      objc_msgSend(v4, "bounds");
      objc_msgSend(v5, "setFrame:");
      objc_msgSend(v5, "setAutoresizingMask:", 18);

    }
  }
}

- (void)_viewTapped:(id)a3
{
  -[SKStoreProductActivityViewController _didFinishWithResult:error:](self, "_didFinishWithResult:error:", 1, 0);
}

- (SKStoreProductActivityViewControllerDelegate)delegate
{
  return (SKStoreProductActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
