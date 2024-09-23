@implementation HSPCMVVMShellViewController

- (HSPCMVVMShellViewController)initWithTableViewStyle:(int64_t)a3 moduleCreator:(id)a4 moduleControllerBuilder:(id)a5
{
  id v8;
  id v9;
  HUPRXItemModuleTableViewController *v10;
  id v11;
  void *v12;
  id v13;
  HSPCMVVMShellViewController *v14;
  HSPCMVVMShellViewController *v15;
  objc_super v17;

  v8 = a5;
  v9 = a4;
  v10 = -[HUPRXItemModuleTableViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:]([HUPRXItemModuleTableViewController alloc], "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", a3, v9, v8);

  v11 = objc_alloc((Class)PRXScrollableContentView);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HUPRXItemModuleTableViewController tableView](v10, "tableView"));
  v13 = objc_msgSend(v11, "initWithCardStyle:scrollView:", 0, v12);

  v17.receiver = self;
  v17.super_class = (Class)HSPCMVVMShellViewController;
  v14 = -[HSPCMVVMShellViewController initWithContentView:](&v17, "initWithContentView:", v13);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_mvvmController, v10);

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSPCMVVMShellViewController;
  -[HSPCMVVMShellViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCMVVMShellViewController mvvmController](self, "mvvmController"));
  -[HSPCMVVMShellViewController addChildViewController:](self, "addChildViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCMVVMShellViewController mvvmController](self, "mvvmController"));
  objc_msgSend(v4, "didMoveToParentViewController:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HSPCMVVMShellViewController;
  -[HSPCMVVMShellViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCMVVMShellViewController mvvmController](self, "mvvmController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundView"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

  if (objc_msgSend(v5, "style") == (id)2)
  {
    objc_msgSend(v5, "_setTopPadding:", 0.0);
    objc_msgSend(v5, "_setBottomPadding:", 0.0);
  }
  -[HSPCMVVMShellViewController performPRXLayoutPass](self, "performPRXLayoutPass");

}

- (void)performPRXLayoutPass
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCMVVMShellViewController mvvmController](self, "mvvmController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));
  objc_msgSend(v4, "layoutIfNeeded");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCMVVMShellViewController contentView](self, "contentView"));
  objc_msgSend(v5, "setNeedsUpdateConstraints");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[HSPCMVVMShellViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  -[HSPCMVVMShellViewController updatePreferredContentSizeForCardWidth:](self, "updatePreferredContentSizeForCardWidth:", v6);

}

- (HUPRXItemModuleTableViewController)mvvmController
{
  return self->_mvvmController;
}

- (void)setMvvmController:(id)a3
{
  objc_storeStrong((id *)&self->_mvvmController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mvvmController, 0);
}

@end
