@implementation HUConfigurationWrapperViewController

- (HUConfigurationWrapperViewController)initWithContentViewController:(id)a3 configurationDelegate:(id)a4
{
  id v7;
  id v8;
  HUConfigurationWrapperViewController *v9;
  HUConfigurationWrapperViewController *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  UIBarButtonItem *backButtonItem;
  uint64_t v18;
  UIBarButtonItem *nextButtonItem;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUConfigurationWrapperViewController;
  v9 = -[HUConfigurationWrapperViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentViewController, a3);
    -[HUConfigurationWrapperViewController protocolConformingContentViewController](v10, "protocolConformingContentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[HUConfigurationWrapperViewController protocolConformingContentViewController](v10, "protocolConformingContentViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegate:", v10);

    }
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_isFinalStep = 0;
    v14 = objc_alloc(MEMORY[0x1E0CEA380]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUBackTitle"), CFSTR("HUBackTitle"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithTitle:style:target:action:", v15, 0, 0, 0);
    backButtonItem = v10->_backButtonItem;
    v10->_backButtonItem = (UIBarButtonItem *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithTitle:style:target:action:", 0, 2, v10, sel__nextAction_);
    nextButtonItem = v10->_nextButtonItem;
    v10->_nextButtonItem = (UIBarButtonItem *)v18;

  }
  return v10;
}

- (HUConfigurationWrapperViewController)initWithContentViewController:(id)a3
{
  return -[HUConfigurationWrapperViewController initWithContentViewController:configurationDelegate:](self, "initWithContentViewController:configurationDelegate:", a3, 0);
}

- (void)setIsFinalStep:(BOOL)a3
{
  self->_isFinalStep = a3;
  -[HUConfigurationWrapperViewController _updateNextButton](self, "_updateNextButton");
}

- (id)title
{
  void *v2;
  void *v3;

  -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[6];

  v41[4] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)HUConfigurationWrapperViewController;
  -[HUConfigurationWrapperViewController viewDidLoad](&v40, sel_viewDidLoad);
  -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUConfigurationWrapperViewController addChildViewController:](self, "addChildViewController:", v3);

  -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUConfigurationWrapperViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v8);

  v28 = (void *)MEMORY[0x1E0CB3718];
  -[HUConfigurationWrapperViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v34;
  -[HUConfigurationWrapperViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v27;
  -[HUConfigurationWrapperViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v10;
  -[HUConfigurationWrapperViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v17);

  -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "didMoveToParentViewController:", self);

  -[HUConfigurationWrapperViewController backButtonItem](self, "backButtonItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUConfigurationWrapperViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackBarButtonItem:", v19);

  -[HUConfigurationWrapperViewController nextButtonItem](self, "nextButtonItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUConfigurationWrapperViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setRightBarButtonItem:", v21);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUConfigurationWrapperViewController;
  -[HUConfigurationWrapperViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[HUConfigurationWrapperViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerWillAppear:", self);

  -[HUConfigurationWrapperViewController _updateNextButton](self, "_updateNextButton");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUConfigurationWrapperViewController;
  -[HUConfigurationWrapperViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (-[HUConfigurationWrapperViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[HUConfigurationWrapperViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUConfigurationWrapperViewController _backAction:](self, "_backAction:", v5);

  }
}

- (id)hu_preloadContent
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF230988))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
    objc_msgSend(v4, "hu_preloadContent");
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HUConfigurationContentViewController)protocolConformingContentViewController
{
  void *v2;
  void *v3;
  HUConfigurationContentViewController *v4;

  -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF348090))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)_canGoNext
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  -[HUConfigurationWrapperViewController finishFuture](self, "finishFuture");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HUConfigurationWrapperViewController finishFuture](self, "finishFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFinished");

    if (!v6)
      return 0;
  }
  -[HUConfigurationWrapperViewController protocolConformingContentViewController](self, "protocolConformingContentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
    return 1;
  -[HUConfigurationWrapperViewController protocolConformingContentViewController](self, "protocolConformingContentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canFinishConfiguration");

  return v10;
}

- (void)_updateNextButton
{
  _BOOL8 v3;
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;

  v3 = -[HUConfigurationWrapperViewController _canGoNext](self, "_canGoNext");
  -[HUConfigurationWrapperViewController nextButtonItem](self, "nextButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

  if (-[HUConfigurationWrapperViewController isFinalStep](self, "isFinalStep"))
    v5 = CFSTR("HUDoneTitle");
  else
    v5 = CFSTR("HUNextTitle");
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUConfigurationWrapperViewController nextButtonItem](self, "nextButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

}

- (void)_backAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUConfigurationWrapperViewController protocolConformingContentViewController](self, "protocolConformingContentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HUConfigurationWrapperViewController protocolConformingContentViewController](self, "protocolConformingContentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__HUConfigurationWrapperViewController__backAction___block_invoke;
  v11[3] = &unk_1E6F51B38;
  objc_copyWeak(&v12, &location);
  v10 = (id)objc_msgSend(v5, "addCompletionBlock:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __52__HUConfigurationWrapperViewController__backAction___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewControllerDidGoBack:", WeakRetained);

}

- (void)_nextAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v4 = a3;
  if (!-[HUConfigurationWrapperViewController _canGoNext](self, "_canGoNext"))
  {
    -[HUConfigurationWrapperViewController contentViewController](self, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Next action sent when we cannot go next for contentViewController %@"), v5);

  }
  -[HUConfigurationWrapperViewController finishFuture](self, "finishFuture");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        -[HUConfigurationWrapperViewController finishFuture](self, "finishFuture"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isFinished"),
        v8,
        v7,
        v9))
  {
    -[HUConfigurationWrapperViewController protocolConformingContentViewController](self, "protocolConformingContentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[HUConfigurationWrapperViewController protocolConformingContentViewController](self, "protocolConformingContentViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "finishConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUConfigurationWrapperViewController setFinishFuture:](self, "setFinishFuture:", v13);

      -[HUConfigurationWrapperViewController _updateNextButton](self, "_updateNextButton");
      objc_initWeak(&location, self);
      -[HUConfigurationWrapperViewController finishFuture](self, "finishFuture");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __52__HUConfigurationWrapperViewController__nextAction___block_invoke;
      v22[3] = &unk_1E6F51B60;
      objc_copyWeak(&v23, &location);
      v16 = (id)objc_msgSend(v14, "addSuccessBlock:", v22);

      -[HUConfigurationWrapperViewController finishFuture](self, "finishFuture");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v15;
      v20[1] = 3221225472;
      v20[2] = __52__HUConfigurationWrapperViewController__nextAction___block_invoke_2;
      v20[3] = &unk_1E6F51B38;
      objc_copyWeak(&v21, &location);
      v18 = (id)objc_msgSend(v17, "addCompletionBlock:", v20);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    else
    {
      -[HUConfigurationWrapperViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "viewController:didFinishWithConfigurationResults:", self, 0);

    }
  }

}

void __52__HUConfigurationWrapperViewController__nextAction___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController:didFinishWithConfigurationResults:", WeakRetained, v3);

}

void __52__HUConfigurationWrapperViewController__nextAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateNextButton");

}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isFinalStep
{
  return self->_isFinalStep;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (NAFuture)finishFuture
{
  return self->_finishFuture;
}

- (void)setFinishFuture:(id)a3
{
  objc_storeStrong((id *)&self->_finishFuture, a3);
}

- (UIBarButtonItem)backButtonItem
{
  return self->_backButtonItem;
}

- (void)setBackButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_backButtonItem, a3);
}

- (UIBarButtonItem)nextButtonItem
{
  return self->_nextButtonItem;
}

- (void)setNextButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_nextButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButtonItem, 0);
  objc_storeStrong((id *)&self->_backButtonItem, 0);
  objc_storeStrong((id *)&self->_finishFuture, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
