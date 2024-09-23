@implementation SKRemoteProductViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_productViewController);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "shouldAutorotateToInterfaceOrientation:", a3);

  return a3;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC9F5F0);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECAA888);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_productViewController);
  objc_msgSend(WeakRetained, "_resetRemoteViewController");

}

- (void)didFinish
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_productViewController);
  objc_msgSend(WeakRetained, "_didFinish");

}

- (void)didFinishDismissal
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_productViewController);
  objc_msgSend(WeakRetained, "_didFinishDismissal");

}

- (void)didFinishWithResult:(id)a3
{
  SKStoreProductViewController **p_productViewController;
  id v4;
  uint64_t v5;
  id WeakRetained;

  p_productViewController = &self->_productViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_productViewController);
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(WeakRetained, "_didFinishWithResult:", v5);
}

- (void)userDidInteractWithProduct:(id)a3
{
  SKStoreProductViewController **p_productViewController;
  id v4;
  uint64_t v5;
  id WeakRetained;

  p_productViewController = &self->_productViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_productViewController);
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(WeakRetained, "_userDidInteractWithProduct:", v5);
}

- (void)didReceiveTitle:(id)a3
{
  SKStoreProductViewController **p_productViewController;
  id v4;
  id WeakRetained;

  p_productViewController = &self->_productViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_productViewController);
  objc_msgSend(WeakRetained, "setTitle:", v4);

}

- (void)loadDidFinishWithResult:(id)a3 error:(id)a4
{
  SKStoreProductViewController **p_productViewController;
  id v6;
  id v7;
  uint64_t v8;
  id WeakRetained;

  p_productViewController = &self->_productViewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_productViewController);
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(WeakRetained, "_loadDidFinishWithResult:error:", v8, v6);
}

- (void)presentPageWithRequest:(id)a3 animated:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  SKStorePageRequest *v10;

  v6 = a4;
  v7 = a3;
  v10 = -[SKStorePageRequest initWithXPCEncoding:]([SKStorePageRequest alloc], "initWithXPCEncoding:", v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_productViewController);
  v9 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(WeakRetained, "_presentPageWithRequest:animated:", v10, v9);
}

- (void)promptForStarRating
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, char, float);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  +[SKStarRatingAlertController starRatingAlertController](SKStarRatingAlertController, "starRatingAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __52__SKRemoteProductViewController_promptForStarRating__block_invoke;
  v7 = &unk_1E5B275C8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setCompletion:", &v4);
  -[SKRemoteProductViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0, v4, v5, v6, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __52__SKRemoteProductViewController_promptForStarRating__block_invoke(uint64_t a1, char a2, float a3)
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serviceViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if ((a2 & 1) != 0)
  {
    *(float *)&v6 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishStarRatingPromptWithRating:", v8);

  }
  else
  {
    objc_msgSend(v5, "finishStarRatingPromptWithRating:", 0);
  }

}

- (void)setStatusBarHidden:(id)a3 withAnimation:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0DC3470];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedApplication");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = objc_msgSend(v6, "integerValue");
  objc_msgSend(v10, "setStatusBarHidden:withAnimation:", v8, v9);

}

- (void)setStatusBarStyle:(id)a3 animated:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0DC3470];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedApplication");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = objc_msgSend(v6, "BOOLValue");
  objc_msgSend(v10, "setStatusBarStyle:animated:", v8, v9);

}

- (SKStoreProductViewController)productViewController
{
  return (SKStoreProductViewController *)objc_loadWeakRetained((id *)&self->_productViewController);
}

- (void)setProductViewController:(id)a3
{
  objc_storeWeak((id *)&self->_productViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_productViewController);
}

@end
