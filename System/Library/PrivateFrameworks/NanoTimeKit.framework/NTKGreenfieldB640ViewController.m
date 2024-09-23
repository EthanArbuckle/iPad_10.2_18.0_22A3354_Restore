@implementation NTKGreenfieldB640ViewController

- (NTKGreenfieldB640ViewController)initWithUrl:(id)a3 sourceApplicationBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  NTKGreenfieldB640ViewController *v9;
  NTKGreenfieldB640ViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKGreenfieldB640ViewController;
  v9 = -[NTKGreenfieldB640ViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_sourceApplicationBundleIdentifier, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NTKGreenfieldCompanionLoadingViewController *v10;
  NTKGreenfieldCompanionLoadingViewController *loadingViewController;
  UINavigationController *v12;
  UINavigationController *hiddenNavigationController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NTKGreenfieldB640Manager *v18;
  NTKGreenfieldB640Manager *b640Manager;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NTKGreenfieldB640ViewController;
  -[NTKGreenfieldB640ViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[NTKGreenfieldB640ViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModalInPresentation:", 1);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "configureWithTransparentBackground");
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundEffect:", v5);

  -[NTKGreenfieldB640ViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStandardAppearance:", v4);

  BPSBackgroundColor();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldB640ViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10 = objc_alloc_init(NTKGreenfieldCompanionLoadingViewController);
  loadingViewController = self->_loadingViewController;
  self->_loadingViewController = v10;

  v12 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_loadingViewController);
  hiddenNavigationController = self->_hiddenNavigationController;
  self->_hiddenNavigationController = v12;

  -[UINavigationController setNavigationBarHidden:animated:](self->_hiddenNavigationController, "setNavigationBarHidden:animated:", 1, 0);
  -[NTKGreenfieldB640ViewController addChildViewController:](self, "addChildViewController:", self->_hiddenNavigationController);
  -[NTKGreenfieldB640ViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController view](self->_hiddenNavigationController, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[UINavigationController didMoveToParentViewController:](self->_hiddenNavigationController, "didMoveToParentViewController:", self);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__didTapCancelButton);
  -[NTKGreenfieldB640ViewController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLeftBarButtonItem:animated:", v16, 0);

  v18 = objc_alloc_init(NTKGreenfieldB640Manager);
  b640Manager = self->_b640Manager;
  self->_b640Manager = v18;

  -[NTKGreenfieldB640Manager setDelegate:](self->_b640Manager, "setDelegate:", self);
  -[NTKGreenfieldB640Manager decodeUrl:sourceApplicationBundleIdentifier:](self->_b640Manager, "decodeUrl:sourceApplicationBundleIdentifier:", self->_url, self->_sourceApplicationBundleIdentifier);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldB640ViewController;
  -[NTKGreenfieldB640ViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[NTKGreenfieldB640Manager addedFaceID](self->_b640Manager, "addedFaceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("NTKGreenfieldAddWatchFaceManagerDidAddFaceNotification"), v4);

  }
  -[NTKGreenfieldB640Manager handleDidExitGreenfieldB640Flow](self->_b640Manager, "handleDidExitGreenfieldB640Flow");

}

- (void)_didTapCancelButton
{
  -[NTKGreenfieldB640ViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)greenfieldB640ContentViewController:(id)a3 handleButtonActionEvent:(int64_t)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v6 = a3;
  switch(a4)
  {
    case 2:
      v8 = v6;
LABEL_7:
      -[NTKGreenfieldB640ViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      goto LABEL_8;
    case 1:
      v8 = v6;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "didTapOnLoadingFaceLibraryButton:", self);

      goto LABEL_7;
    case 0:
      v8 = v6;
      -[NTKGreenfieldB640Manager handleAddToMyFacesAction](self->_b640Manager, "handleAddToMyFacesAction");
LABEL_8:
      v6 = v8;
      break;
  }

}

- (void)greenfieldB640ContentViewController:(id)a3 handleWatchFaceSelectedEventAtIndex:(int64_t)a4
{
  -[NTKGreenfieldB640Manager handleWatchFaceSelectedActionWithSelectedIndex:](self->_b640Manager, "handleWatchFaceSelectedActionWithSelectedIndex:", a4);
}

- (void)didStartDecodingWatchFaces:(id)a3
{
  id v3;

  v3 = -[UINavigationController popToRootViewControllerAnimated:](self->_hiddenNavigationController, "popToRootViewControllerAnimated:", 1);
}

- (void)greenfieldB640WatchFacesManager:(id)a3 updateStateToSelectWatchFacesState:(id)a4
{
  NTKGreenfieldB640ContentViewController *contentViewController;
  id v6;
  NTKGreenfieldB640ContentViewController *v7;
  NTKGreenfieldB640ContentViewController *v8;

  contentViewController = self->_contentViewController;
  if (!contentViewController)
  {
    v6 = a4;
    v7 = -[NTKGreenfieldB640ContentViewController initForAddWatchFacesStateWithGreenfieldB640Model:]([NTKGreenfieldB640ContentViewController alloc], "initForAddWatchFacesStateWithGreenfieldB640Model:", v6);

    v8 = self->_contentViewController;
    self->_contentViewController = v7;

    -[NTKGreenfieldB640ContentViewController setGreenfieldB640delegate:](self->_contentViewController, "setGreenfieldB640delegate:", self);
    contentViewController = self->_contentViewController;
  }
  -[UINavigationController pushViewController:animated:](self->_hiddenNavigationController, "pushViewController:animated:", contentViewController, 0);
}

- (void)didFinishAddingWatchFaceToLibrary:(id)a3
{
  -[NTKGreenfieldB640ViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)greenfieldB640WatchFacesManager:(id)a3 updateStateToError:(id)a4
{
  id v5;
  void *v6;
  id v7;
  UINavigationController *hiddenNavigationController;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[NTKGreenfieldB640ContentViewController initForErrorStateWithGreenfieldB640Model:]([NTKGreenfieldB640ContentViewController alloc], "initForErrorStateWithGreenfieldB640Model:", v5);
    objc_msgSend(v7, "setGreenfieldB640delegate:", self);
    hiddenNavigationController = self->_hiddenNavigationController;
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController setViewControllers:animated:](hiddenNavigationController, "setViewControllers:animated:", v9, 0);

  }
  else
  {
    -[NTKGreenfieldB640ViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)greenfieldB640WatchFacesManager:(id)a3 didSelectWatchFaceAtIndex:(int64_t)a4
{
  -[NTKGreenfieldB640ContentViewController handleWatchFaceSelectedAtIndex:](self->_contentViewController, "handleWatchFaceSelectedAtIndex:", a4);
}

- (void)greenfieldB640WatchFacesManager:(id)a3 didSelectWatchFaceWithError:(id)a4
{
  -[NTKGreenfieldB640ContentViewController handleWatchFaceSelectedWithError:](self->_contentViewController, "handleWatchFaceSelectedWithError:", a4);
}

- (NTKGreenfieldB640ViewControllerDelegate)delegate
{
  return (NTKGreenfieldB640ViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_b640Manager, 0);
  objc_storeStrong((id *)&self->_hiddenNavigationController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
}

@end
