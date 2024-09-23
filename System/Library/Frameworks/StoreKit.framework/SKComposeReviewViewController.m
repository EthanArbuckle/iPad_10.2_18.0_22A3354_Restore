@implementation SKComposeReviewViewController

- (SKComposeReviewViewController)initWithCompositionURL:(id)a3
{
  id v4;
  SKComposeReviewViewController *v5;
  uint64_t v6;
  NSURL *compositionURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKComposeReviewViewController;
  v5 = -[SKComposeReviewViewController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    compositionURL = v5->_compositionURL;
    v5->_compositionURL = (NSURL *)v6;

  }
  return v5;
}

- (SKComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SKComposeReviewViewController *v4;
  SKInvocationQueueProxy *v5;
  SKUIServiceComposeReviewViewController *serviceProxy;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKComposeReviewViewController;
  v4 = -[SKComposeReviewViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = -[SKInvocationQueueProxy initWithProtocol:]([SKInvocationQueueProxy alloc], "initWithProtocol:", &unk_1EECAA948);
    serviceProxy = v4->_serviceProxy;
    v4->_serviceProxy = (SKUIServiceComposeReviewViewController *)v5;

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 1)
      -[SKComposeReviewViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
  }
  return v4;
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = (id)-[_UIAsyncInvocation invoke](self->_cancelRequest, "invoke");
  -[SKRemoteComposeReviewViewController setComposeReviewViewController:](self->_remoteViewController, "setComposeReviewViewController:", 0);
  -[SKUIServiceComposeReviewViewController setInvocationTarget:](self->_serviceProxy, "setInvocationTarget:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SKComposeReviewViewController;
  -[SKComposeReviewViewController dealloc](&v4, sel_dealloc);
}

- (void)prepareWithCompletionBlock:(id)a3
{
  void *v4;
  id prepareBlock;

  if (self->_prepareBlock)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Double prepare"));
  }
  else
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    prepareBlock = self->_prepareBlock;
    self->_prepareBlock = v4;

    -[SKComposeReviewViewController _requestRemoteViewController](self, "_requestRemoteViewController");
  }
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[SKComposeReviewViewController setView:](self, "setView:", v4);
  -[SKComposeReviewViewController _addRemoteView](self, "_addRemoteView");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SKUIServiceComposeReviewViewController loadReviewWithURL:](self->_serviceProxy, "loadReviewWithURL:", self->_compositionURL);
  v5.receiver = self;
  v5.super_class = (Class)SKComposeReviewViewController;
  -[SKComposeReviewViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)_didFinishWithResult:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id WeakRetained;
  char v7;
  id v8;
  char v9;
  id v10;

  v4 = a3;
  if (self->_prepareBlock)
  {
    -[SKComposeReviewViewController _didPrepareWithResult:error:](self, "_didPrepareWithResult:error:", a3, a4);
    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "reviewComposeViewController:didFinishSubmitting:", self, v4);
  }
  else
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
      return;
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "reviewComposeViewControllerDidFinish:", self);
  }

}

- (void)_didPrepareWithResult:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void (**prepareBlock)(id, _BOOL8, id);
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v9 = a4;
  if (v4)
    -[SKComposeReviewViewController _addRemoteView](self, "_addRemoteView");
  -[SKComposeReviewViewController _endDelayingPresentation](self, "_endDelayingPresentation");
  prepareBlock = (void (**)(id, _BOOL8, id))self->_prepareBlock;
  v7 = v9;
  if (prepareBlock)
  {
    prepareBlock[2](prepareBlock, v4, v9);
    v8 = self->_prepareBlock;
    self->_prepareBlock = 0;

    v7 = v9;
  }

}

- (void)_tearDownAfterError:(id)a3
{
  if (self->_prepareBlock)
    -[SKComposeReviewViewController _didFinishWithResult:error:](self, "_didFinishWithResult:error:", 0, a3);
  else
    -[SKComposeReviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)_addRemoteView
{
  void *v3;
  id v4;

  if (self->_remoteViewController)
  {
    if (-[SKComposeReviewViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SKComposeReviewViewController view](self, "view");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[SKRemoteComposeReviewViewController view](self->_remoteViewController, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      objc_msgSend(v3, "setFrame:");
      objc_msgSend(v3, "setAutoresizingMask:", 18);
      objc_msgSend(v4, "addSubview:", v3);

    }
  }
}

- (void)_requestRemoteViewController
{
  uint64_t v3;
  _UIAsyncInvocation *v4;
  _UIAsyncInvocation *cancelRequest;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SKComposeReviewViewController__requestRemoteViewController__block_invoke;
  v7[3] = &unk_1E5B268B8;
  v7[4] = self;
  -[SKComposeReviewViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", v7, 10.0);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __61__SKComposeReviewViewController__requestRemoteViewController__block_invoke_2;
  v6[3] = &unk_1E5B26AD0;
  v6[4] = self;
  +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SKRemoteComposeReviewViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("ServiceComposeReviewViewController"), CFSTR("com.apple.ios.StoreKitUIService"), v6);
  v4 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v4;

}

uint64_t __61__SKComposeReviewViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  SSError();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didPrepareWithResult:error:", 0, v2);

  return 0;
}

void __61__SKComposeReviewViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v6 = a3;
  if (v12)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 992), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setComposeReviewViewController:");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 1000);
    objc_msgSend(*(id *)(v7 + 992), "serviceViewControllerProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInvocationTarget:", v9);

    objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
  }
  else
  {
    NSLog(CFSTR("Could not request view controller: %@"), v6);
    objc_msgSend(*(id *)(a1 + 32), "_didPrepareWithResult:error:", 0, v6);
    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 968);
  *(_QWORD *)(v10 + 968) = 0;

}

- (SKComposeReviewDelegate)delegate
{
  return (SKComposeReviewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong(&self->_prepareBlock, 0);
  objc_storeStrong((id *)&self->_compositionURL, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);
}

@end
