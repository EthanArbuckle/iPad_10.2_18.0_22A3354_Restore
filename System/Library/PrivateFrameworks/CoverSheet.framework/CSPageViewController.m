@implementation CSPageViewController

- (int64_t)participantState
{
  if (-[CSCoverSheetViewControllerBase isDisappeared](self, "isDisappeared"))
    return 1;
  else
    return 2;
}

- (void)aggregateBehavior:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSPageViewController;
  -[CSPresentationViewController aggregateBehavior:](&v3, sel_aggregateBehavior_, a3);
}

- (CSPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSPageViewController;
  return -[CSPresentationViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (id)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSPageViewController;
  -[CSPageViewController view](&v3, sel_view);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)willTransitionToVisible:(BOOL)a3
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will transition to visible %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)didTransitionToVisible:(BOOL)a3
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ did transition to visible %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

- (int64_t)requestedDismissalType
{
  return 0;
}

- (id)requestedDismissalSettings
{
  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  -[CSPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPageViewController:", self);

  v4.receiver = self;
  v4.super_class = (Class)CSPageViewController;
  -[CSPresentationViewController viewDidLoad](&v4, sel_viewDidLoad);
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)aggregateAppearance:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSPageViewController;
  -[CSPresentationViewController aggregateAppearance:](&v3, sel_aggregateAppearance_, a3);
}

- (int64_t)presentationAltitude
{
  return 2;
}

+ (BOOL)isAvailableForConfiguration
{
  return 1;
}

+ (unint64_t)requiredCapabilities
{
  return 0;
}

- (void)handleAction:(id)a3 fromSender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type") == 1
    && (-[CSPresentationViewController contentViewControllers](self, "contentViewControllers"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsObject:", v7),
        v8,
        v9))
  {
    -[CSPresentationViewController dismissContentViewController:animated:](self, "dismissContentViewController:animated:", v7, 1);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CSPageViewController;
    -[CSCoverSheetViewControllerBase handleAction:fromSender:](&v10, sel_handleAction_fromSender_, v6, v7);
  }

}

- (CSLayoutStrategy)layoutStrategy
{
  return self->_layoutStrategy;
}

- (void)setLayoutStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_layoutStrategy, a3);
}

- (CSCoverSheetViewControllerProtocol)coverSheetViewController
{
  return (CSCoverSheetViewControllerProtocol *)objc_loadWeakRetained((id *)&self->_coverSheetViewController);
}

- (void)setCoverSheetViewController:(id)a3
{
  objc_storeWeak((id *)&self->_coverSheetViewController, a3);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutStrategy, 0);
  objc_destroyWeak((id *)&self->_coverSheetViewController);
}

@end
