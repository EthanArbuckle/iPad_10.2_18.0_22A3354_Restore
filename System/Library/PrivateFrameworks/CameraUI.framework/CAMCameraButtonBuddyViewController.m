@implementation CAMCameraButtonBuddyViewController

- (CAMCameraButtonBuddyViewController)init
{
  CAMCameraButtonBuddyViewController *v2;
  CAMCameraButtonBuddyViewController *v3;
  CAMOnboardingBuddyViewManager *v4;
  CAMOnboardingBuddyViewManager *onboardingManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMCameraButtonBuddyViewController;
  v2 = -[CAMCameraButtonBuddyViewController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_assetsLoaded = 0;
    v4 = objc_alloc_init(CAMOnboardingBuddyViewManager);
    onboardingManager = v3->__onboardingManager;
    v3->__onboardingManager = v4;

  }
  return v3;
}

- (void)viewDidLoad
{
  _QWORD v3[4];
  id v4;
  id location;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMCameraButtonBuddyViewController;
  -[CAMCameraButtonBuddyViewController viewDidLoad](&v6, sel_viewDidLoad);
  if (-[CAMCameraButtonBuddyViewController assetsLoaded](self, "assetsLoaded"))
  {
    -[CAMCameraButtonBuddyViewController composeInterface](self, "composeInterface");
  }
  else
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __49__CAMCameraButtonBuddyViewController_viewDidLoad__block_invoke;
    v3[3] = &unk_1EA329490;
    objc_copyWeak(&v4, &location);
    -[CAMCameraButtonBuddyViewController loadAssetsWithCompletion:](self, "loadAssetsWithCompletion:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __49__CAMCameraButtonBuddyViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "composeInterface");

}

- (void)composeInterface
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[CAMCameraButtonBuddyViewController _onboardingManager](self, "_onboardingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createViewControllerWithDelegate:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraButtonBuddyViewController set_introViewController:](self, "set_introViewController:", v4);

  -[CAMCameraButtonBuddyViewController _introViewController](self, "_introViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraButtonBuddyViewController addChildViewController:](self, "addChildViewController:", v5);

  -[CAMCameraButtonBuddyViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  -[CAMCameraButtonBuddyViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  -[CAMCameraButtonBuddyViewController _introViewController](self, "_introViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", 0.0, -v9, v12, v9 + v14);

  -[CAMCameraButtonBuddyViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraButtonBuddyViewController _introViewController](self, "_introViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v19);

  -[CAMCameraButtonBuddyViewController _introViewController](self, "_introViewController");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "didMoveToParentViewController:", self);

}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)loadAssetsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  id v10;
  id location;

  v4 = (void (**)(_QWORD))a3;
  -[CAMCameraButtonBuddyViewController _onboardingManager](self, "_onboardingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "modelLoadingStatus");

  if (v6 == 2)
  {
    v4[2](v4);
  }
  else
  {
    objc_initWeak(&location, self);
    -[CAMCameraButtonBuddyViewController _onboardingManager](self, "_onboardingManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__CAMCameraButtonBuddyViewController_loadAssetsWithCompletion___block_invoke;
    v8[3] = &unk_1EA3294B8;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    objc_msgSend(v7, "createViewModel:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

uint64_t __63__CAMCameraButtonBuddyViewController_loadAssetsWithCompletion___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  id WeakRetained;

  if (a2 == 2)
  {
    v2 = result;
    WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    objc_msgSend(WeakRetained, "setAssetsLoaded:", 1);

    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

- (void)cameraButtonBuddyViewControllerDidFinish:(id)a3
{
  id v4;

  -[CAMCameraButtonBuddyViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraButtonBuddyViewControllerDidFinish:", self);

}

- (CAMCameraButtonBuddyViewControllerDelegate)delegate
{
  return (CAMCameraButtonBuddyViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)assetsLoaded
{
  return self->_assetsLoaded;
}

- (void)setAssetsLoaded:(BOOL)a3
{
  self->_assetsLoaded = a3;
}

- (UIViewController)_introViewController
{
  return self->__introViewController;
}

- (void)set_introViewController:(id)a3
{
  objc_storeStrong((id *)&self->__introViewController, a3);
}

- (CAMOnboardingBuddyViewManager)_onboardingManager
{
  return self->__onboardingManager;
}

- (void)set_onboardingManager:(id)a3
{
  objc_storeStrong((id *)&self->__onboardingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__onboardingManager, 0);
  objc_storeStrong((id *)&self->__introViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
