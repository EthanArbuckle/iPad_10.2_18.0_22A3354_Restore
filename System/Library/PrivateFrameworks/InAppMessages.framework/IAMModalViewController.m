@implementation IAMModalViewController

- (IAMModalViewController)init
{
  IAMModalViewController *v2;
  IAMModalViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IAMModalViewController;
  v2 = -[IAMModalViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IAMModalViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 4);
  return v3;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[6];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)IAMModalViewController;
  -[IAMModalViewController viewDidLoad](&v33, sel_viewDidLoad);
  -[IAMModalViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[IAMModalViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMModalViewController addChildViewController:](self, "addChildViewController:", v3);

  -[IAMModalViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMModalViewController setContentView:](self, "setContentView:", v5);

  -[IAMModalViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", 1);

  -[IAMModalViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[IAMModalViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMModalViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  v23 = (void *)MEMORY[0x24BDD1628];
  -[IAMModalViewController contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMModalViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  -[IAMModalViewController contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leftAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMModalViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leftAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v22;
  -[IAMModalViewController contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMModalViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v12;
  -[IAMModalViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMModalViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v18);

  -[IAMModalViewController contentViewController](self, "contentViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "didMoveToParentViewController:", self);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void (**v8)(void);
  objc_super v9;

  v4 = a3;
  v6 = a4;
  -[IAMModalViewController viewControllerWillDismissBlock](self, "viewControllerWillDismissBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IAMModalViewController viewControllerWillDismissBlock](self, "viewControllerWillDismissBlock");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  v9.receiver = self;
  v9.super_class = (Class)IAMModalViewController;
  -[IAMModalViewController dismissViewControllerAnimated:completion:](&v9, sel_dismissViewControllerAnimated_completion_, v4, v6);

}

- (BOOL)shouldAutorotate
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  BOOL v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (objc_class *)MEMORY[0x24BDF70D8];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithPresentedViewController:presentingViewController:", v7, v9);

  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "_setShouldDismissWhenTappedOutside:", 1);
  objc_msgSend(v7, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "horizontalSizeClass") == 2)
  {
    objc_msgSend(v7, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom") == 1;

  }
  else
  {
    v13 = 0;
  }

  if (-[IAMModalViewController shouldPresentFullscreen](self, "shouldPresentFullscreen"))
  {
    objc_msgSend(MEMORY[0x24BDF7150], "_largeDetent");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __110__IAMModalViewController__presentationControllerForPresentedController_presentingController_sourceController___block_invoke;
    v18[3] = &__block_descriptor_33_e16_d16__0__UIView_8l;
    v19 = v13;
    objc_msgSend(MEMORY[0x24BDF7150], "_detentWithContainerViewBlock:", v18);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;
  v20[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setDetents:", v16);

  if (!v13)
  {
    objc_msgSend(v10, "_setWantsBottomAttachedInCompactHeight:", 1);
    objc_msgSend(v10, "_setWidthFollowsPreferredContentSizeWhenBottomAttached:", 1);
  }

  return v10;
}

double __110__IAMModalViewController__presentationControllerForPresentedController_presentingController_sourceController___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  if (*(_BYTE *)(a1 + 32))
    return 648.0;
  objc_msgSend(a2, "safeAreaInsets");
  return 500.0 - v3;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[IAMModalViewController metricsDelegate](self, "metricsDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[IAMModalViewController metricsDelegate](self, "metricsDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewController:didReportDismissalAction:", self, 1);

  }
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (IAMViewControllerMetricsDelegate)metricsDelegate
{
  return (IAMViewControllerMetricsDelegate *)objc_loadWeakRetained((id *)&self->_metricsDelegate);
}

- (void)setMetricsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_metricsDelegate, a3);
}

- (id)viewControllerWillDismissBlock
{
  return self->_viewControllerWillDismissBlock;
}

- (void)setViewControllerWillDismissBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (BOOL)shouldPresentFullscreen
{
  return self->_shouldPresentFullscreen;
}

- (void)setShouldPresentFullscreen:(BOOL)a3
{
  self->_shouldPresentFullscreen = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (BOOL)shouldUsePadLayout
{
  return self->_shouldUsePadLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong(&self->_viewControllerWillDismissBlock, 0);
  objc_destroyWeak((id *)&self->_metricsDelegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
