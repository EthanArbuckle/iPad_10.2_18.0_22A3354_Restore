@implementation SKStorePageViewController

- (SKStorePageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SKStorePageViewController *v4;
  SKInvocationQueueProxy *v5;
  SKUIServiceStorePageViewController *serviceProxy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKStorePageViewController;
  v4 = -[SKStorePageViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = -[SKInvocationQueueProxy initWithProtocol:]([SKInvocationQueueProxy alloc], "initWithProtocol:", &unk_1EECAAA08);
    serviceProxy = v4->_serviceProxy;
    v4->_serviceProxy = (SKUIServiceStorePageViewController *)v5;

  }
  return v4;
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = (id)-[_UIAsyncInvocation invoke](self->_cancelRequest, "invoke");
  -[SKStoreProductViewController setDelegate:](self->_productPageViewController, "setDelegate:", 0);
  -[SKUIServiceStorePageViewController setInvocationTarget:](self->_serviceProxy, "setInvocationTarget:", 0);
  -[SKRemoteStorePageViewController setStorePageViewController:](self->_remoteViewController, "setStorePageViewController:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SKStorePageViewController;
  -[SKStorePageViewController dealloc](&v4, sel_dealloc);
}

- (void)loadPageWithURL:(id)a3 completionBlock:(id)a4
{
  id v6;

  v6 = a3;
  -[SKStorePageViewController _prepareToLoadWithCompletionBlock:](self, "_prepareToLoadWithCompletionBlock:", a4);
  -[SKUIServiceStorePageViewController loadPageWithURL:](self->_serviceProxy, "loadPageWithURL:", v6);

}

- (void)loadPageWithURLBagKey:(id)a3 completionBlock:(id)a4
{
  id v6;

  v6 = a3;
  -[SKStorePageViewController _prepareToLoadWithCompletionBlock:](self, "_prepareToLoadWithCompletionBlock:", a4);
  -[SKUIServiceStorePageViewController loadPageWithURLBagKey:](self->_serviceProxy, "loadPageWithURLBagKey:", v6);

}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[SKStorePageViewController setView:](self, "setView:", v3);
  -[SKStorePageViewController _addRemoteView](self, "_addRemoteView");

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  if (SKAllowsLandscapePhone())
    return 26;
  return 2;
}

- (void)_didFinishWithResult:(id)a3 error:(id)a4
{
  id v6;

  v6 = a4;
  -[SKStorePageViewController _didLoadWithResult:error:](self, "_didLoadWithResult:error:", objc_msgSend(a3, "BOOLValue"), v6);

}

- (void)_showProductPageWithItemIdentifier:(id)a3
{
  id v4;
  SKStoreProductViewController *v5;
  SKStoreProductViewController *productPageViewController;
  void *v7;
  SKStoreProductViewController *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  if (!self->_productPageViewController)
  {
    v5 = objc_alloc_init(SKStoreProductViewController);
    productPageViewController = self->_productPageViewController;
    self->_productPageViewController = v5;

    -[SKStoreProductViewController setDelegate:](self->_productPageViewController, "setDelegate:", self);
    objc_initWeak(&location, self);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v4, CFSTR("id"), 0);
    v8 = self->_productPageViewController;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__SKStorePageViewController__showProductPageWithItemIdentifier___block_invoke;
    v9[3] = &unk_1E5B27D40;
    objc_copyWeak(&v10, &location);
    -[SKStoreProductViewController loadProductWithParameters:completionBlock:](v8, "loadProductWithParameters:completionBlock:", v7, v9);
    -[SKStorePageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_productPageViewController, 1, 0);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }

}

void __64__SKStorePageViewController__showProductPageWithItemIdentifier___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_dismissProductPageViewController");

  }
}

- (void)_addRemoteView
{
  void *v3;
  id v4;

  if (self->_remoteViewController)
  {
    if (-[SKStorePageViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SKStorePageViewController view](self, "view");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[SKRemoteStorePageViewController view](self->_remoteViewController, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      objc_msgSend(v3, "setFrame:");
      objc_msgSend(v3, "setAutoresizingMask:", 18);
      objc_msgSend(v4, "addSubview:", v3);

    }
  }
}

- (void)_didLoadWithResult:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _UIAsyncInvocation *cancelRequest;
  id v9;
  _UIAsyncInvocation *v10;
  void (**loadBlock)(id, _BOOL8, _QWORD);
  id v12;
  id v13;

  v4 = a3;
  v6 = a4;
  v13 = v6;
  if (v4)
  {
    -[SKStorePageViewController _addRemoteView](self, "_addRemoteView");
  }
  else
  {
    v7 = v6;
    cancelRequest = self->_cancelRequest;
    if (!cancelRequest)
      goto LABEL_6;
    v9 = (id)-[_UIAsyncInvocation invoke](cancelRequest, "invoke", v7);
    v10 = self->_cancelRequest;
    self->_cancelRequest = 0;

  }
  v7 = v13;
LABEL_6:
  loadBlock = (void (**)(id, _BOOL8, _QWORD))self->_loadBlock;
  if (loadBlock)
  {
    ((void (**)(id, _BOOL8, id))loadBlock)[2](loadBlock, v4, v13);
    v12 = self->_loadBlock;
    self->_loadBlock = 0;

    v7 = v13;
  }

}

- (void)_dismissProductPageViewController
{
  SKStoreProductViewController *productPageViewController;

  -[SKStoreProductViewController dismissViewControllerAnimated:completion:](self->_productPageViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  -[SKStoreProductViewController setDelegate:](self->_productPageViewController, "setDelegate:", 0);
  productPageViewController = self->_productPageViewController;
  self->_productPageViewController = 0;

}

- (void)_prepareToLoadWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id loadBlock;
  id v7;
  id v8;

  v4 = a3;
  if (self->_loadBlock != v4)
  {
    v7 = v4;
    v5 = (void *)objc_msgSend(v4, "copy");
    loadBlock = self->_loadBlock;
    self->_loadBlock = v5;

    v4 = v7;
  }
  if (!self->_cancelRequest && !self->_remoteViewController)
  {
    v8 = v4;
    -[SKStorePageViewController _requestRemoteViewController](self, "_requestRemoteViewController");
    v4 = v8;
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
  v7[2] = __57__SKStorePageViewController__requestRemoteViewController__block_invoke;
  v7[3] = &unk_1E5B268B8;
  v7[4] = self;
  -[SKStorePageViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", v7, 10.0);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __57__SKStorePageViewController__requestRemoteViewController__block_invoke_2;
  v6[3] = &unk_1E5B26AD0;
  v6[4] = self;
  +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SKRemoteStorePageViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("ServiceStorePageViewController"), CFSTR("com.apple.ios.StoreKitUIService"), v6);
  v4 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v4;

}

uint64_t __57__SKStorePageViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  SSError();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didLoadWithResult:error:", 0, v2);

  return 0;
}

void __57__SKStorePageViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setStorePageViewController:");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 1000);
    objc_msgSend(*(id *)(v7 + 992), "serviceViewControllerProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInvocationTarget:", v9);

    objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
    objc_msgSend(*(id *)(a1 + 32), "_addRemoteView");
  }
  else
  {
    NSLog(CFSTR("Could not request view controller: %@"), v6);
    objc_msgSend(*(id *)(a1 + 32), "_didLoadWithResult:error:", 0, v6);
    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 968);
  *(_QWORD *)(v10 + 968) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_productPageViewController, 0);
  objc_storeStrong(&self->_loadBlock, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);
}

@end
