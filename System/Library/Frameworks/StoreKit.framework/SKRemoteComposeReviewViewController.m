@implementation SKRemoteComposeReviewViewController

- (SKRemoteComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SKRemoteComposeReviewViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKRemoteComposeReviewViewController;
  v4 = -[SKRemoteComposeReviewViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__keyboardVisibilityDidChangeNotification_, *MEMORY[0x1E0DC4E68], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__keyboardVisibilityDidChangeNotification_, *MEMORY[0x1E0DC4E70], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E68], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E70], 0);

  v4.receiver = self;
  v4.super_class = (Class)SKRemoteComposeReviewViewController;
  -[_UIRemoteViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_composeReviewViewController);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "shouldAutorotateToInterfaceOrientation:", a3);

  return a3;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECA1020);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECAA948);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  SKComposeReviewViewController **p_composeReviewViewController;
  id v4;
  id WeakRetained;

  p_composeReviewViewController = &self->_composeReviewViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_composeReviewViewController);
  objc_msgSend(WeakRetained, "_tearDownAfterError:", v4);

}

- (void)_keyboardVisibilityDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[SKRemoteComposeReviewViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "CGRectValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:fromView:", v15, v7, v9, v11, v13);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

  }
  else
  {
    v17 = *MEMORY[0x1E0C9D648];
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "clientKeyboardFrameChanged:", v17, v19, v21, v23);

}

- (void)didFinishWithResult:(id)a3 error:(id)a4
{
  SKComposeReviewViewController **p_composeReviewViewController;
  id v6;
  id v7;
  uint64_t v8;
  id WeakRetained;

  p_composeReviewViewController = &self->_composeReviewViewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_composeReviewViewController);
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(WeakRetained, "_didFinishWithResult:error:", v8, v6);
}

- (void)didPrepareWithResult:(id)a3 error:(id)a4
{
  SKComposeReviewViewController **p_composeReviewViewController;
  id v6;
  id v7;
  uint64_t v8;
  id WeakRetained;

  p_composeReviewViewController = &self->_composeReviewViewController;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_composeReviewViewController);
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(WeakRetained, "_didPrepareWithResult:error:", v8, v6);
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
  v6 = __58__SKRemoteComposeReviewViewController_promptForStarRating__block_invoke;
  v7 = &unk_1E5B275C8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setCompletion:", &v4);
  -[SKRemoteComposeReviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0, v4, v5, v6, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __58__SKRemoteComposeReviewViewController_promptForStarRating__block_invoke(uint64_t a1, char a2, float a3)
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

- (SKComposeReviewViewController)composeReviewViewController
{
  return (SKComposeReviewViewController *)objc_loadWeakRetained((id *)&self->_composeReviewViewController);
}

- (void)setComposeReviewViewController:(id)a3
{
  objc_storeWeak((id *)&self->_composeReviewViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_composeReviewViewController);
}

@end
