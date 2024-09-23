@implementation AISRepairViewController

- (AISRepairViewController)initWithContext:(id)a3
{
  id v5;
  AISRepairViewController *v6;
  AISRepairViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AISRepairViewController;
  v6 = -[AISRepairViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
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
  __AISRepairViewController *v3;
  void *v4;
  void *v5;
  __AISRepairViewController *v6;
  __AISRepairViewController *viewController;
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
  objc_super v53;
  _QWORD v54[8];

  v54[6] = *MEMORY[0x24BDAC8D0];
  v53.receiver = self;
  v53.super_class = (Class)AISRepairViewController;
  -[AISRepairViewController viewDidLoad](&v53, sel_viewDidLoad);
  v3 = [__AISRepairViewController alloc];
  -[AISRepairViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISRepairViewController reportHandler](self, "reportHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[__AISRepairViewController initWithContext:reportHandler:](v3, "initWithContext:reportHandler:", v4, v5);
  viewController = self->_viewController;
  self->_viewController = v6;

  -[AISRepairViewController viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AISRepairViewController viewController](self, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "willMoveToParentViewController:", self);

  -[AISRepairViewController addChildViewController:](self, "addChildViewController:", self->_viewController);
  -[AISRepairViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISRepairViewController viewController](self, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v13);

  v36 = (void *)MEMORY[0x24BDD1628];
  -[AISRepairViewController viewController](self, "viewController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISRepairViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v47;
  -[AISRepairViewController viewController](self, "viewController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISRepairViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v41;
  -[AISRepairViewController viewController](self, "viewController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISRepairViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v34;
  -[AISRepairViewController viewController](self, "viewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISRepairViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v28;
  -[AISRepairViewController viewController](self, "viewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISRepairViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v54[4] = v15;
  -[AISRepairViewController viewController](self, "viewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AISRepairViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v54[5] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v22);

  -[AISRepairViewController viewController](self, "viewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "didMoveToParentViewController:", self);

  -[AISRepairViewController _updateAutoDismissal](self, "_updateAutoDismissal");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AISRepairViewController;
  -[AISRepairViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AISRepairViewController _updateAutoDismissal](self, "_updateAutoDismissal");
}

- (void)setShouldAutoDismiss:(BOOL)a3
{
  self->_shouldAutoDismiss = a3;
  -[AISRepairViewController _updateAutoDismissal](self, "_updateAutoDismissal");
}

- (void)_updateAutoDismissal
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  -[AISRepairViewController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[AISRepairViewController shouldAutoDismiss](self, "shouldAutoDismiss"))
    {
      -[AISRepairViewController navigationController](self, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 == 0;

    }
    else
    {
      v5 = 0;
    }
    -[AISRepairViewController viewController](self, "viewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldAutoDismiss:", v5);

  }
}

- (AISRepairContext)context
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

- (__AISRepairViewController)viewController
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
  objc_storeStrong(&self->_reportHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
