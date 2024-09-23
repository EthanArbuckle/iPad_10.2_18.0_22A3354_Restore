@implementation SSSDebugUICatalogViewController

- (SSSDebugUICatalogViewController)init
{
  SSSDebugUICatalogViewController *v2;
  uint64_t v3;
  NSMutableArray *allViewControllers;
  NSMutableArray *v5;
  SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSSDebugUICatalogViewController;
  v2 = -[SSSDebugUICatalogViewController initWithTransitionStyle:navigationOrientation:options:](&v8, "initWithTransitionStyle:navigationOrientation:options:", 1, 0, 0);
  v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  allViewControllers = v2->_allViewControllers;
  v2->_allViewControllers = (NSMutableArray *)v3;

  v5 = v2->_allViewControllers;
  v6 = objc_opt_new(SSSDebugUICatalogWaitingForImageIdentifierUpdatesViewController);
  -[NSMutableArray addObject:](v5, "addObject:", v6);

  -[SSSDebugUICatalogViewController setViewControllers:direction:animated:completion:](v2, "setViewControllers:direction:animated:completion:", v2->_allViewControllers, 0, 0, 0);
  -[SSSDebugUICatalogViewController setDelegate:](v2, "setDelegate:", v2);
  -[SSSDebugUICatalogViewController setDataSource:](v2, "setDataSource:", v2);
  -[SSSDebugUICatalogViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 5);
  return v2;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *backgroundView;
  void *v7;
  UIToolbar *v8;
  UIToolbar *toolbar;
  id v10;
  id v11;
  UIToolbar *v12;
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
  objc_super v44;
  _QWORD v45[2];

  v44.receiver = self;
  v44.super_class = (Class)SSSDebugUICatalogViewController;
  -[SSSDebugUICatalogViewController viewDidLoad](&v44, "viewDidLoad");
  v3 = objc_alloc((Class)UIVisualEffectView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1));
  v5 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:", v4);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogViewController view](self, "view"));
  objc_msgSend(v7, "insertSubview:atIndex:", self->_backgroundView, 0);

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (UIToolbar *)objc_alloc_init((Class)UIToolbar);
  toolbar = self->_toolbar;
  self->_toolbar = v8;

  -[UIToolbar setTranslatesAutoresizingMaskIntoConstraints:](self->_toolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v11 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_donePushed");
  objc_msgSend(v11, "setTitle:", CFSTR("Done"));
  v12 = self->_toolbar;
  v45[0] = v10;
  v45[1] = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 2));
  -[UIToolbar setItems:](v12, "setItems:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogViewController view](self, "view"));
  objc_msgSend(v14, "addSubview:", self->_toolbar);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_backgroundView, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v15, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_backgroundView, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  objc_msgSend(v15, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_backgroundView, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  objc_msgSend(v15, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_backgroundView, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
  objc_msgSend(v15, "addObject:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar leadingAnchor](self->_toolbar, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));
  objc_msgSend(v15, "addObject:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar trailingAnchor](self->_toolbar, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogViewController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v38));
  objc_msgSend(v15, "addObject:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar topAnchor](self->_toolbar, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDebugUICatalogViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v42));
  objc_msgSend(v15, "addObject:", v43);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);
}

- (void)_donePushed
{
  -[SSSDebugUICatalogViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_viewControllerAtIndex:(int64_t)a3
{
  void *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else if ((unint64_t)-[NSMutableArray count](self->_allViewControllers, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_allViewControllers, "objectAtIndex:", a3));
  }
  return v5;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  return -[SSSDebugUICatalogViewController _viewControllerAtIndex:](self, "_viewControllerAtIndex:", (char *)-[NSMutableArray indexOfObject:](self->_allViewControllers, "indexOfObject:", a4) + 1);
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  return -[SSSDebugUICatalogViewController _viewControllerAtIndex:](self, "_viewControllerAtIndex:", (char *)-[NSMutableArray indexOfObject:](self->_allViewControllers, "indexOfObject:", a4) - 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_allViewControllers, 0);
}

@end
