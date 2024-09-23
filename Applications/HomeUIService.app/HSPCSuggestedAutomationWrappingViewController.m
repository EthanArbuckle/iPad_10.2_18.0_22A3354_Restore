@implementation HSPCSuggestedAutomationWrappingViewController

- (HSPCSuggestedAutomationWrappingViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCSuggestedAutomationsViewController *v9;
  id v10;
  void *v11;
  id v12;
  HSPCSuggestedAutomationWrappingViewController *v13;
  HSPCSuggestedAutomationWrappingViewController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v9 = -[HSPCSuggestedAutomationsViewController initWithCoordinator:config:]([HSPCSuggestedAutomationsViewController alloc], "initWithCoordinator:config:", v7, v8);
  -[HSPCSuggestedAutomationWrappingViewController setMvvmController:](self, "setMvvmController:", v9);
  v10 = objc_alloc((Class)PRXScrollableContentView);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsViewController tableView](v9, "tableView"));
  v12 = objc_msgSend(v10, "initWithCardStyle:scrollView:", 0, v11);

  v21.receiver = self;
  v21.super_class = (Class)HSPCSuggestedAutomationWrappingViewController;
  v13 = -[HSPCSuggestedAutomationWrappingViewController initWithContentView:](&v21, "initWithContentView:", v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_config, a4);
    objc_storeStrong((id *)&v14->_coordinator, a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accessoryCategoryOrPrimaryServiceType"));
    v17 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardSuggestedAutomationsCardTitle"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[HSPCSuggestedAutomationWrappingViewController setTitle:](v14, "setTitle:", v18);

    v19 = -[HSPCSuggestedAutomationWrappingViewController addProminentButtonWithTitleKey:target:futureSelector:](v14, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v14, "commitConfiguration");
  }

  return v14;
}

- (id)commitConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationWrappingViewController mvvmController](self, "mvvmController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commitConfiguration"));

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSPCSuggestedAutomationWrappingViewController;
  -[HSPCSuggestedAutomationWrappingViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationWrappingViewController mvvmController](self, "mvvmController"));
  -[HSPCSuggestedAutomationWrappingViewController addChildViewController:](self, "addChildViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationWrappingViewController mvvmController](self, "mvvmController"));
  objc_msgSend(v4, "didMoveToParentViewController:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HSPCSuggestedAutomationWrappingViewController;
  -[HSPCSuggestedAutomationWrappingViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationWrappingViewController mvvmController](self, "mvvmController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));
  objc_msgSend(v5, "layoutIfNeeded");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationWrappingViewController contentView](self, "contentView"));
  objc_msgSend(v6, "setNeedsUpdateConstraints");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationWrappingViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  -[HSPCSuggestedAutomationWrappingViewController updatePreferredContentSizeForCardWidth:](self, "updatePreferredContentSizeForCardWidth:", v8);

}

- (id)hu_preloadContent
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationWrappingViewController mvvmController](self, "mvvmController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hu_preloadContent"));

  return v3;
}

- (id)shouldSkip
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationWrappingViewController mvvmController](self, "mvvmController"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v4, a2);

  if ((a2 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationWrappingViewController mvvmController](self, "mvvmController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shouldSkip"));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanFalse));
  }
  return v6;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HSPCSuggestedAutomationsViewController)mvvmController
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
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
