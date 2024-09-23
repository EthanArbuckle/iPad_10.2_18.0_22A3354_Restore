@implementation AMSUIEngagementCardWrapperViewController

- (AMSUIEngagementCardWrapperViewController)initWithViewController:(id)a3
{
  id v5;
  AMSUIEngagementCardWrapperViewController *v6;
  AMSUIEngagementCardWrapperViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIEngagementCardWrapperViewController;
  v6 = -[AMSUIEngagementCardWrapperViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewController, a3);

  return v7;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSUIEngagementCardWrapperViewController;
  -[AMSUIEngagementCardWrapperViewController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BEBD7A0]);
  -[AMSUIEngagementCardWrapperViewController viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRootViewController:", v4);

  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRequestedContentSize:", 3);

  -[AMSUIEngagementCardWrapperViewController setChildNavigationController:](self, "setChildNavigationController:", v5);
  -[AMSUIEngagementCardWrapperViewController childNavigationController](self, "childNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonViewController setChildViewController:](self, "setChildViewController:", v7);

}

- (void)viewWillLayoutSubviews
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMSUIEngagementCardWrapperViewController;
  -[AMSUIEngagementCardWrapperViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUIEngagementCardWrapperViewController childNavigationController](self, "childNavigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
  if (a3 == 5)
  {
    PRXIsPad();
    PRXExpectedCardWidthForStyle();
  }
  else
  {
    if (a3 != 4)
      return;
    PRXCardDefaultSize();
  }
  -[AMSUIEngagementCardWrapperViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (BOOL)allowsPullToDismiss
{
  return 1;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (UINavigationController)childNavigationController
{
  return self->_childNavigationController;
}

- (void)setChildNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_childNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childNavigationController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
