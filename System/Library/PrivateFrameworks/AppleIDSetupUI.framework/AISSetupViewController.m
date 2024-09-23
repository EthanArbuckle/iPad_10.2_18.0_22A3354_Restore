@implementation AISSetupViewController

- (AISSetupViewController)initWithContext:(id)a3
{
  id v5;
  AISSetupViewController *v6;
  AISSetupViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AISSetupViewController;
  v6 = -[AISSetupViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_shouldAutoDismiss = 1;
  }

  return v7;
}

- (void)viewDidLoad
{
  __AISSetupViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  __AISSetupViewController *v9;
  __AISSetupViewController *viewController;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;
  _QWORD v57[8];

  v57[6] = *MEMORY[0x24BDAC8D0];
  v56.receiver = self;
  v56.super_class = (Class)AISSetupViewController;
  -[AISSetupViewController viewDidLoad](&v56, sel_viewDidLoad);
  v3 = [__AISSetupViewController alloc];
  -[AISSetupViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISSetupViewController dontSuggestUserAction](self, "dontSuggestUserAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISSetupViewController skipAction](self, "skipAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AISSetupViewController shouldAutoDismiss](self, "shouldAutoDismiss");
  -[AISSetupViewController reportHandler](self, "reportHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[__AISSetupViewController initWithContext:dontSuggestUserAction:skipAction:shouldAutoDismiss:reportHandler:](v3, "initWithContext:dontSuggestUserAction:skipAction:shouldAutoDismiss:reportHandler:", v4, v5, v6, v7, v8);
  viewController = self->_viewController;
  self->_viewController = v9;

  -[AISSetupViewController viewController](self, "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AISSetupViewController viewController](self, "viewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "willMoveToParentViewController:", self);

  -[AISSetupViewController addChildViewController:](self, "addChildViewController:", self->_viewController);
  -[AISSetupViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISSetupViewController viewController](self, "viewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v16);

  v39 = (void *)MEMORY[0x24BDD1628];
  -[AISSetupViewController viewController](self, "viewController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISSetupViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v50;
  -[AISSetupViewController viewController](self, "viewController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISSetupViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v44;
  -[AISSetupViewController viewController](self, "viewController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISSetupViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v37;
  -[AISSetupViewController viewController](self, "viewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISSetupViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57[3] = v31;
  -[AISSetupViewController viewController](self, "viewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISSetupViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v57[4] = v18;
  -[AISSetupViewController viewController](self, "viewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISSetupViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v57[5] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activateConstraints:", v25);

  -[AISSetupViewController viewController](self, "viewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "didMoveToParentViewController:", self);

  -[AISSetupViewController _updateAutoDismissal](self, "_updateAutoDismissal");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AISSetupViewController;
  -[AISSetupViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AISSetupViewController _updateAutoDismissal](self, "_updateAutoDismissal");
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AISSetupViewController;
  -[AISSetupViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  -[AISSetupViewController _updateAutoDismissal](self, "_updateAutoDismissal");
}

- (void)setShouldAutoDismiss:(BOOL)a3
{
  self->_shouldAutoDismiss = a3;
  -[AISSetupViewController _updateAutoDismissal](self, "_updateAutoDismissal");
}

- (void)_updateAutoDismissal
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  -[AISSetupViewController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[AISSetupViewController shouldAutoDismiss](self, "shouldAutoDismiss"))
    {
      -[AISSetupViewController navigationController](self, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 == 0;

    }
    else
    {
      v5 = 0;
    }
    -[AISSetupViewController viewController](self, "viewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldAutoDismiss:", v5);

  }
}

- (AISSetupContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (id)reportHandler
{
  return self->_reportHandler;
}

- (void)setReportHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (BOOL)shouldAutoDismiss
{
  return self->_shouldAutoDismiss;
}

- (UIAction)dontSuggestUserAction
{
  return self->_dontSuggestUserAction;
}

- (void)setDontSuggestUserAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (UIAction)skipAction
{
  return self->_skipAction;
}

- (void)setSkipAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (__AISSetupViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_skipAction, 0);
  objc_storeStrong((id *)&self->_dontSuggestUserAction, 0);
  objc_storeStrong(&self->_reportHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
