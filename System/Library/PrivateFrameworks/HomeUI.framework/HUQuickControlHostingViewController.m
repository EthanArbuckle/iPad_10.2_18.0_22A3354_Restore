@implementation HUQuickControlHostingViewController

- (HUQuickControlHostingViewController)initWithViewController:(id)a3 profile:(id)a4
{
  id v7;
  id v8;
  HUQuickControlHostingViewController *v9;
  HUQuickControlHostingViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlHostingViewController;
  v9 = -[HUQuickControlHostingViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a4);
    objc_storeStrong((id *)&v10->_contraption, a3);
  }

  return v10;
}

- (void)loadView
{
  _HUQuickControlControllableHostView *v3;
  _HUQuickControlControllableHostView *v4;
  id v5;

  v3 = [_HUQuickControlControllableHostView alloc];
  -[HUQuickControlHostingViewController profile](self, "profile");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[_HUQuickControlControllableHostView initWithProfile:](v3, "initWithProfile:", v5);
  -[HUQuickControlHostingViewController setView:](self, "setView:", v4);

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
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlHostingViewController;
  -[HUQuickControlHostingViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[HUQuickControlHostingViewController contraption](self, "contraption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlHostingViewController addChildViewController:](self, "addChildViewController:", v3);

  -[HUQuickControlHostingViewController contraption](self, "contraption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  -[HUQuickControlHostingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlHostingViewController contraption](self, "contraption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v8);

  -[HUQuickControlHostingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[HUQuickControlHostingViewController contraption](self, "contraption");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  -[HUQuickControlHostingViewController contraption](self, "contraption");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "didMoveToParentViewController:", self);

}

- (HUQuickControlViewProfile)profile
{
  return self->_profile;
}

- (UIViewController)contraption
{
  return self->_contraption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contraption, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
