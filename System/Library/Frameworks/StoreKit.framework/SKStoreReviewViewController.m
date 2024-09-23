@implementation SKStoreReviewViewController

- (SKStoreReviewViewController)initWithReviewRequestToken:(id)a3
{
  id v4;
  SKStoreReviewViewController *v5;
  SKInvocationQueueProxy *v6;
  SKUIServiceReviewViewController *serviceProxy;
  uint64_t v8;
  NSString *reviewRequestToken;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKStoreReviewViewController;
  v5 = -[SKStoreReviewViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = -[SKInvocationQueueProxy initWithProtocol:]([SKInvocationQueueProxy alloc], "initWithProtocol:", &unk_1EECAA828);
    serviceProxy = v5->_serviceProxy;
    v5->_serviceProxy = (SKUIServiceReviewViewController *)v6;

    v8 = objc_msgSend(v4, "copy");
    reviewRequestToken = v5->_reviewRequestToken;
    v5->_reviewRequestToken = (NSString *)v8;

    -[SKStoreReviewViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 17);
    -[SKStoreReviewViewController setModalTransitionStyle:](v5, "setModalTransitionStyle:", 12);
  }

  return v5;
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  -[SKStoreReviewViewController setPresentationWindow:](self, "setPresentationWindow:", 0);
  v3 = (id)-[_UIAsyncInvocation invoke](self->_cancelRequest, "invoke");
  -[SKUIServiceReviewViewController setInvocationTarget:](self->_serviceProxy, "setInvocationTarget:", 0);
  -[SKRemoteReviewViewController setReviewViewController:](self->_remoteViewController, "setReviewViewController:", 0);
  -[SKRemoteReviewViewController setDelegate:](self->_remoteViewController, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SKStoreReviewViewController;
  -[SKStoreReviewViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKStoreReviewViewController;
  -[SKStoreReviewViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStoreReviewViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[SKStoreReviewViewController _requestRemoteViewController](self, "_requestRemoteViewController");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKStoreReviewViewController;
  -[SKStoreReviewViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  -[SKStoreReviewViewController serviceProxy](self, "serviceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishImmediately:", v6);

}

- (void)_didFinishWithResult:(unint64_t)a3 error:(id)a4
{
  SKXPCConnection *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v6 = -[SKXPCConnection initWithServiceName:]([SKXPCConnection alloc], "initWithServiceName:", 0x1E5B2FB40);
    v7 = (void *)SSXPCCreateMessageDictionary();
    -[SKStoreReviewViewController reviewRequestToken](self, "reviewRequestToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1AF43AF10](v7, "1", v8);

    -[SKXPCConnection sendMessage:](v6, "sendMessage:", v7);
  }
  if ((-[SKStoreReviewViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
    -[SKStoreReviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  -[SKStoreReviewViewController setPresentationWindow:](self, "setPresentationWindow:", 0);

}

- (void)remoteReviewViewControllerTerminatedWithError:(id)a3
{
  -[SKStoreReviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)_requestRemoteViewController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  SKStoreReviewViewController *v9;
  id v10;
  id location;
  _QWORD v12[5];

  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__SKStoreReviewViewController__requestRemoteViewController__block_invoke;
  v12[3] = &unk_1E5B268B8;
  v12[4] = self;
  -[SKStoreReviewViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", v12, 10.0);
  objc_initWeak(&location, self);
  v5 = v3;
  v6 = 3221225472;
  v7 = __59__SKStoreReviewViewController__requestRemoteViewController__block_invoke_2;
  v8 = &unk_1E5B268E0;
  objc_copyWeak(&v10, &location);
  v9 = self;
  +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SKRemoteReviewViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("ServiceReviewViewController"), CFSTR("com.apple.ios.StoreKitUIService"), &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStoreReviewViewController setCancelRequest:](self, "setCancelRequest:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

uint64_t __59__SKStoreReviewViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_didFinishWithResult:error:", 0, 0);
  return 0;
}

void __59__SKStoreReviewViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "setRemoteViewController:", v5);
    objc_msgSend(v8, "remoteViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReviewViewController:", v8);

    objc_msgSend(v8, "remoteViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v8);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "serviceViewControllerProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInvocationTarget:", v11);

    objc_msgSend(v8, "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
    objc_msgSend(v8, "_addRemoteView");
    objc_msgSend(v8, "remoteViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v8, "reviewRequestToken");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DAFDF8]);

    objc_msgSend(v8, "serviceProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("SKUIServiceReviewSandboxMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setupWithParameters:", v18);

  }
  else
  {
    objc_msgSend(WeakRetained, "_didFinishWithResult:error:", 0, v6);
  }
  objc_msgSend(v8, "setCancelRequest:", 0);
  objc_msgSend(v8, "_endDelayingPresentation");

}

- (void)_addRemoteView
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SKStoreReviewViewController remoteViewController](self, "remoteViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[SKStoreReviewViewController isViewLoaded](self, "isViewLoaded");

    if (v5)
    {
      -[SKStoreReviewViewController remoteViewController](self, "remoteViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v7);

      -[SKStoreReviewViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      objc_msgSend(v9, "setFrame:");
      objc_msgSend(v9, "setAutoresizingMask:", 18);
      objc_msgSend(v8, "addSubview:", v9);

    }
  }
}

- (SKStoreReviewPresentationWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
  objc_storeStrong((id *)&self->_presentationWindow, a3);
}

- (SKUIServiceReviewViewController)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (_UIAsyncInvocation)cancelRequest
{
  return self->_cancelRequest;
}

- (void)setCancelRequest:(id)a3
{
  objc_storeStrong((id *)&self->_cancelRequest, a3);
}

- (SKRemoteReviewViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (NSString)reviewRequestToken
{
  return self->_reviewRequestToken;
}

- (void)setReviewRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_reviewRequestToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewRequestToken, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
}

@end
