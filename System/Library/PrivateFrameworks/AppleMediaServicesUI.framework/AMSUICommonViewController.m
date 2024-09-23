@implementation AMSUICommonViewController

- (AMSUICommonViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonViewController;
  return -[AMSUICommonViewController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[AMSUICommonViewController _unregisterNotifications](self, "_unregisterNotifications");
  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonViewController;
  -[AMSUICommonViewController dealloc](&v3, sel_dealloc);
}

- (AMSUICommonView)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonViewController;
  -[AMSUICommonViewController view](&v3, sel_view);
  return (AMSUICommonView *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setView:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonViewController;
  -[AMSUICommonViewController setView:](&v3, sel_setView_, a3);
}

- (void)setChildViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v16 = a3;
  -[AMSUICommonViewController addChildViewController:](self, "addChildViewController:", v16);
  -[AMSUICommonViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[AMSUICommonViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v16, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  objc_msgSend(v16, "didMoveToParentViewController:", self);
}

- (void)unsetChildViewController:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "willMoveToParentViewController:", 0);
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(v4, "removeFromParentViewController");
}

- (void)loadView
{
  AMSUICommonView *v3;

  v3 = objc_alloc_init(AMSUICommonView);
  -[AMSUICommonViewController setView:](self, "setView:", v3);

}

@end
