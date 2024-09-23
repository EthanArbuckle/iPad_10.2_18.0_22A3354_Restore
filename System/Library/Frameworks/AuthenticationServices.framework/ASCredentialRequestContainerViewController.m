@implementation ASCredentialRequestContainerViewController

- (ASCredentialRequestContainerViewController)initWithRootViewController:(id)a3
{
  id v5;
  ASCredentialRequestContainerViewController *v6;
  ASCredentialRequestContainerViewController *v7;
  ASCredentialRequestContainerViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCredentialRequestContainerViewController;
  v6 = -[ASCredentialRequestContainerViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootViewController, a3);
    if (objc_msgSend(MEMORY[0x24BE0B290], "isPad"))
    {
      -[ASCredentialRequestContainerViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
      -[ASCredentialRequestContainerViewController setModalInPresentation:](v7, "setModalInPresentation:", 1);
    }
    else
    {
      -[ASCredentialRequestContainerViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 4);
      -[ASCredentialRequestContainerViewController setTransitioningDelegate:](v7, "setTransitioningDelegate:", v7);
    }
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *sheetHeightConstraint;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *sheetPresentedConstraint;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  _QWORD v46[5];

  v46[4] = *MEMORY[0x24BDAC8D0];
  v45.receiver = self;
  v45.super_class = (Class)ASCredentialRequestContainerViewController;
  -[ASCredentialRequestContainerViewController viewDidLoad](&v45, sel_viewDidLoad);
  -[ASCredentialRequestContainerViewController addChildViewController:](self, "addChildViewController:", self->_rootViewController);
  if (objc_msgSend(MEMORY[0x24BE0B290], "isPad"))
  {
    -[ASCredentialRequestContainerViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIViewController view](self->_rootViewController, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    -[UIViewController view](self->_rootViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAutoresizingMask:", 18);
  }
  else
  {
    -[UIViewController view](self->_rootViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }

  -[ASCredentialRequestContainerViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_rootViewController, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[UIViewController didMoveToParentViewController:](self->_rootViewController, "didMoveToParentViewController:", self);
  if (objc_msgSend(MEMORY[0x24BE0B290], "isPad"))
  {
    -[UIViewController preferredContentSize](self->_rootViewController, "preferredContentSize");
    -[ASCredentialRequestContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", 540.0);
  }
  if ((objc_msgSend(MEMORY[0x24BE0B290], "isPad") & 1) == 0)
  {
    -[UIViewController view](self->_rootViewController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestContainerViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v20) = 1144750080;
    objc_msgSend(v44, "setPriority:", v20);
    -[UIViewController view](self->_rootViewController, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController preferredContentSize](self->_rootViewController, "preferredContentSize");
    objc_msgSend(v22, "constraintEqualToConstant:", v23);
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    sheetHeightConstraint = self->_sheetHeightConstraint;
    self->_sheetHeightConstraint = v24;

    -[UIViewController view](self->_rootViewController, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestContainerViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    sheetPresentedConstraint = self->_sheetPresentedConstraint;
    self->_sheetPresentedConstraint = v30;

    v41 = (void *)MEMORY[0x24BDD1628];
    -[UIViewController view](self->_rootViewController, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestContainerViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v34;
    -[UIViewController view](self->_rootViewController, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestContainerViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v39;
    v46[2] = v44;
    v46[3] = self->_sheetHeightConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v40);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCredentialRequestContainerViewController;
  -[ASCredentialRequestContainerViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if ((objc_msgSend(MEMORY[0x24BE0B290], "isPad") & 1) == 0)
  {
    if (-[ASCredentialRequestContainerViewController isBeingPresented](self, "isBeingPresented"))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialRequestContainerViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v4);

      -[ASCredentialRequestContainerViewController transitionCoordinator](self, "transitionCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __61__ASCredentialRequestContainerViewController_viewWillAppear___block_invoke;
      v7[3] = &unk_24C9516B0;
      v7[4] = self;
      objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, 0);

    }
  }
}

void __61__ASCredentialRequestContainerViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setActive:", 1);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000))
  {
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setEffect:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.800000012);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v4);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCredentialRequestContainerViewController;
  -[ASCredentialRequestContainerViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if ((objc_msgSend(MEMORY[0x24BE0B290], "isPad") & 1) == 0)
  {
    if (-[ASCredentialRequestContainerViewController isBeingDismissed](self, "isBeingDismissed"))
    {
      -[ASCredentialRequestContainerViewController transitionCoordinator](self, "transitionCoordinator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __64__ASCredentialRequestContainerViewController_viewWillDisappear___block_invoke;
      v5[3] = &unk_24C9516B0;
      v5[4] = self;
      objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

    }
  }
}

void __64__ASCredentialRequestContainerViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setActive:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  if (v3)
  {
    objc_msgSend(v3, "setEffect:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (objc_msgSend(MEMORY[0x24BE0B290], "isPad"))
    return 30;
  else
    return 2;
}

- (void)setPaneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_paneDelegate, a3);
  -[ASCredentialRequestContainerViewController _setPaneDelegateForTopViewController](self, "_setPaneDelegateForTopViewController");
}

- (void)_setPaneDelegateForTopViewController
{
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;

  -[ASCredentialRequestContainerViewController rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ASCredentialRequestContainerViewController rootViewController](self, "rootViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestContainerViewController _setPaneDelegateForViewController:](self, "_setPaneDelegateForViewController:", v5);

  }
}

- (void)_setPaneDelegateForViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCredentialRequestContainerViewController paneDelegate](self, "paneDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestContainerViewController _setPaneDelegate:forViewController:](self, "_setPaneDelegate:forViewController:", v5, v4);

}

- (void)_clearPaneDelegateForViewController:(id)a3
{
  -[ASCredentialRequestContainerViewController _setPaneDelegate:forViewController:](self, "_setPaneDelegate:forViewController:", 0, a3);
}

- (void)_setPaneDelegate:(id)a3 forViewController:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setDelegate:", v6);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialRequestContainerViewController _clearPaneDelegateForViewController:](self, "_clearPaneDelegateForViewController:", v7);

  -[ASCredentialRequestContainerViewController _setPaneDelegateForViewController:](self, "_setPaneDelegateForViewController:", v8);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  UIViewController *v4;
  int v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  objc_super v11;

  v4 = (UIViewController *)a3;
  v11.receiver = self;
  v11.super_class = (Class)ASCredentialRequestContainerViewController;
  -[ASCredentialRequestContainerViewController preferredContentSizeDidChangeForChildContentContainer:](&v11, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  if (self->_rootViewController == v4)
  {
    v5 = objc_msgSend(MEMORY[0x24BE0B290], "isPad");
    -[UIViewController preferredContentSize](v4, "preferredContentSize");
    if (v5)
    {
      -[ASCredentialRequestContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", 540.0);
      if ((-[ASCredentialRequestContainerViewController isBeingPresented](self, "isBeingPresented") & 1) == 0)
      {
        -[ASCredentialRequestContainerViewController sheetPresentationController](self, "sheetPresentationController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "animateChanges:", &__block_literal_global_82);
LABEL_8:

      }
    }
    else
    {
      -[NSLayoutConstraint setConstant:](self->_sheetHeightConstraint, "setConstant:", v6);
      if ((-[ASCredentialRequestContainerViewController isBeingPresented](self, "isBeingPresented") & 1) == 0)
      {
        -[UIViewController transitionCoordinator](self->_rootViewController, "transitionCoordinator");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v8;
        if (v8)
        {
          v9[0] = MEMORY[0x24BDAC760];
          v9[1] = 3221225472;
          v9[2] = __100__ASCredentialRequestContainerViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3;
          v9[3] = &unk_24C951738;
          v9[4] = self;
          v10 = &__block_literal_global_83;
          objc_msgSend(v8, "animateAlongsideTransition:completion:", v9);

        }
        goto LABEL_8;
      }
    }
  }

}

void __100__ASCredentialRequestContainerViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "containerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForKey:", *MEMORY[0x24BEBE9A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForKey:", *MEMORY[0x24BEBE9B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

}

void __100__ASCredentialRequestContainerViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  if ((objc_msgSend(MEMORY[0x24BE0B290], "isPad", a3, a4, a5) & 1) != 0)
    return 0;
  else
    return -[ASCredentialRequestContainerViewControllerAnimator initWithPresenting:]([ASCredentialRequestContainerViewControllerAnimator alloc], "initWithPresenting:", 1);
}

- (id)animationControllerForDismissedController:(id)a3
{
  if ((objc_msgSend(MEMORY[0x24BE0B290], "isPad", a3) & 1) != 0)
    return 0;
  else
    return -[ASCredentialRequestContainerViewControllerAnimator initWithPresenting:]([ASCredentialRequestContainerViewControllerAnimator alloc], "initWithPresenting:", 0);
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (ASCredentialRequestPaneViewControllerDelegate)paneDelegate
{
  return (ASCredentialRequestPaneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_paneDelegate);
}

- (UIVisualEffectView)blurBackgroundView
{
  return self->_blurBackgroundView;
}

- (void)setBlurBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_blurBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurBackgroundView, 0);
  objc_destroyWeak((id *)&self->_paneDelegate);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_sheetPresentedConstraint, 0);
  objc_storeStrong((id *)&self->_sheetHeightConstraint, 0);
}

@end
