@implementation CCUIModuleAlertViewController

- (CCUIModuleAlertViewController)initWithModuleIdentifier:(id)a3 presentationOptions:(id)a4
{
  return -[CCUIModuleAlertViewController initWithModuleIdentifier:presentationOptions:mainViewController:](self, "initWithModuleIdentifier:presentationOptions:mainViewController:", a3, a4, 0);
}

- (CCUIModuleAlertViewController)initWithModuleIdentifier:(id)a3 presentationOptions:(id)a4 mainViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CCUIModuleAlertViewController *v14;
  uint64_t v15;
  NSString *moduleIdentifier;
  uint64_t v17;
  CCSModulePresentationOptions *presentationOptions;
  CCUIContentModuleContainerViewController *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  CCUIContentModuleContainerViewController *moduleContainerViewController;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIModuleAlertViewController.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moduleIdentifier"));

  }
  objc_msgSend(v11, "moduleInstanceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loadAlertModuleWithBundleIdentifier:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIModuleAlertViewController.m"), 51, CFSTR("Unable to load module instance '%@'"), v9);

  }
  v36.receiver = self;
  v36.super_class = (Class)CCUIModuleAlertViewController;
  v14 = -[CCUIModuleAlertViewController initWithNibName:bundle:](&v36, sel_initWithNibName_bundle_, 0, 0);
  if (v14)
  {
    v15 = objc_msgSend(v9, "copy");
    moduleIdentifier = v14->_moduleIdentifier;
    v14->_moduleIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v10, "copy");
    presentationOptions = v14->_presentationOptions;
    v14->_presentationOptions = (CCSModulePresentationOptions *)v17;

    objc_storeStrong((id *)&v14->_moduleInstance, v13);
    v19 = [CCUIContentModuleContainerViewController alloc];
    -[CCUIModuleInstance metadata](v14->_moduleInstance, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "moduleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v10;
    v22 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[CCUIModuleInstance uniqueIdentifier](v14->_moduleInstance, "uniqueIdentifier");
    v33 = v11;
    v34 = v9;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithUUIDString:", v23);
    -[CCUIModuleInstance module](v14->_moduleInstance, "module");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D14780], "defaultAlertPresentationContext");
    v26 = v12;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[CCUIContentModuleContainerViewController initWithModuleIdentifier:uniqueIdentifier:contentModule:presentationContext:](v19, "initWithModuleIdentifier:uniqueIdentifier:contentModule:presentationContext:", v21, v24, v25, v27);
    moduleContainerViewController = v14->_moduleContainerViewController;
    v14->_moduleContainerViewController = (CCUIContentModuleContainerViewController *)v28;

    v12 = v26;
    v10 = v35;

    v11 = v33;
    v9 = v34;

    -[CCUIContentModuleContainerViewController setDelegate:](v14->_moduleContainerViewController, "setDelegate:", v14);
    -[CCUIModuleAlertViewController addChildViewController:](v14, "addChildViewController:", v14->_moduleContainerViewController);
  }

  return v14;
}

- (void)loadView
{
  id v3;

  v3 = (id)objc_opt_new();
  -[CCUIModuleAlertViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  MTMaterialView *v3;
  MTMaterialView *blurView;
  MTMaterialView *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UIView *v11;
  UIView *contentView;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CCUIModuleAlertViewController;
  -[CCUIModuleAlertViewController viewDidLoad](&v15, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D14790], "_auxiliaryMaterialView");
  v3 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  blurView = self->_blurView;
  self->_blurView = v3;

  v5 = self->_blurView;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMaterialView setGroupNameBase:](v5, "setGroupNameBase:", v7);

  -[MTMaterialView setWeighting:](self->_blurView, "setWeighting:", 0.0);
  -[MTMaterialView setAutoresizingMask:](self->_blurView, "setAutoresizingMask:", 18);
  -[CCUIModuleAlertViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_blurView);

  v9 = objc_alloc(MEMORY[0x1E0D147D8]);
  -[CCUIModuleAlertViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = (UIView *)objc_msgSend(v9, "initWithFrame:");
  contentView = self->_contentView;
  self->_contentView = v11;

  -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
  -[CCUIModuleAlertViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_contentView);

  -[CCUIContentModuleContainerViewController view](self->_moduleContainerViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_contentView, "addSubview:", v14);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIModuleAlertViewController;
  -[CCUIModuleAlertViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  if (!-[CCUIContentModuleContainerViewController isExpanded](self->_moduleContainerViewController, "isExpanded"))
  {
    -[CCUIContentModuleContainerViewController contentViewController](self->_moduleContainerViewController, "contentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || objc_msgSend(v3, "shouldBeginTransitionToExpandedContentModule"))
    {
      -[CCUIContentModuleContainerViewController setExpanded:](self->_moduleContainerViewController, "setExpanded:", 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v3, "willTransitionToExpandedContentMode:", 1);
      -[CCUIContentModuleContainerViewController transitionToExpandedMode:](self->_moduleContainerViewController, "transitionToExpandedMode:", 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v3, "didTransitionToExpandedContentMode:", 1);
    }

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIModuleAlertViewController;
  -[CCUIModuleAlertViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[MTMaterialView setContentReplacedWithSnapshot:](self->_blurView, "setContentReplacedWithSnapshot:", UIAccessibilityIsReduceTransparencyEnabled());
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIModuleAlertViewController;
  -[CCUIModuleAlertViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[MTMaterialView setContentReplacedWithSnapshot:](self->_blurView, "setContentReplacedWithSnapshot:", 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)moduleAlertView
{
  return (UIView *)-[CCUIContentModuleContainerViewController view](self->_moduleContainerViewController, "view");
}

- (double)backgroundViewWeighting
{
  double result;

  -[MTMaterialView weighting](self->_blurView, "weighting");
  return result;
}

- (void)setBackgroundViewWeighting:(double)a3
{
  -[MTMaterialView setWeighting:](self->_blurView, "setWeighting:", a3);
}

- (void)dismissModulePresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  -[CCUIContentModuleContainerViewController dismissModulePresentedContentAnimated:completion:](self->_moduleContainerViewController, "dismissModulePresentedContentAnimated:completion:", a3, a4);
}

- (CGRect)compactModeFrameForContentModuleContainerViewController:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[CCUIModuleAlertViewController compactModeSourceViewForContentModuleContainerViewController:](self, "compactModeSourceViewForContentModuleContainerViewController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)controlCenterGridSizeForContentModuleContainerViewController:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)contentModuleContainerViewController:(id)a3 canBeginInteractionWithModule:(id)a4
{
  return 1;
}

- (void)contentModuleContainerViewControllerDismissPresentedContent:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93__CCUIModuleAlertViewController_contentModuleContainerViewControllerDismissPresentedContent___block_invoke;
  v3[3] = &unk_1E8CFCE28;
  v3[4] = self;
  -[CCUIModuleAlertViewController dismissModulePresentedContentAnimated:completion:](self, "dismissModulePresentedContentAnimated:completion:", 1, v3);
}

void __93__CCUIModuleAlertViewController_contentModuleContainerViewControllerDismissPresentedContent___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  char v4;
  id v5;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1016));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1016));
      objc_msgSend(v5, "contentModuleAlertViewControllerNeedsDismissal:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (CCSModulePresentationOptions)presentationOptions
{
  return self->_presentationOptions;
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (CCUIModuleAlertViewControllerDelegate)delegate
{
  return (CCUIModuleAlertViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_moduleInstance, 0);
  objc_storeStrong((id *)&self->_moduleContainerViewController, 0);
}

@end
