@implementation AXCACCorrectionsServiceViewController

- (AXCACCorrectionsServiceViewController)init
{
  AXCACCorrectionsServiceViewController *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  CACCorrectionsCollectionViewController *collectionViewController;
  id v11;
  CACPopoverPresentingViewController *popoverPresentingViewController;
  objc_super v14;
  void **v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v14.receiver = self;
  v14.super_class = (Class)AXCACCorrectionsServiceViewController;
  v2 = -[AXCACCorrectionsServiceViewController init](&v14, "init");
  if (v2)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v3 = (void *)qword_10002E758;
    v23 = qword_10002E758;
    if (!qword_10002E758)
    {
      v15 = _NSConcreteStackBlock;
      v16 = 3221225472;
      v17 = sub_1000063EC;
      v18 = &unk_100024770;
      v19 = &v20;
      sub_1000063EC((uint64_t)&v15);
      v3 = (void *)v21[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v20, 8);
    v5 = (void *)objc_opt_new(v4);
    objc_msgSend(v5, "setDelegate:", v2);
    v6 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v5);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v7 = (void *)qword_10002E768;
    v23 = qword_10002E768;
    if (!qword_10002E768)
    {
      v15 = _NSConcreteStackBlock;
      v16 = 3221225472;
      v17 = sub_1000064EC;
      v18 = &unk_100024770;
      v19 = &v20;
      sub_1000064EC((uint64_t)&v15);
      v7 = (void *)v21[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v20, 8);
    v9 = (void *)objc_opt_new(v8);
    objc_msgSend(v9, "setViewControllerInPopover:", v6);
    objc_msgSend(v9, "setPopoverPresentationDelegate:", v2);
    -[AXCACCorrectionsServiceViewController addChildViewController:](v2, "addChildViewController:", v9);
    collectionViewController = v2->_collectionViewController;
    v2->_collectionViewController = (CACCorrectionsCollectionViewController *)v5;
    v11 = v5;

    popoverPresentingViewController = v2->_popoverPresentingViewController;
    v2->_popoverPresentingViewController = (CACPopoverPresentingViewController *)v9;

  }
  return v2;
}

- (void)loadView
{
  UIView *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AXCACCorrectionsServiceViewController *v9;

  v3 = objc_opt_new(UIView);
  -[AXCACCorrectionsServiceViewController setView:](self, "setView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXCACCorrectionsServiceViewController popoverPresentingViewController](self, "popoverPresentingViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));

  -[UIView addSubview:](v3, "addSubview:", v5);
  -[UIView bounds](v3, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "setAlpha:", 0.0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005FE4;
  v7[3] = &unk_1000247B0;
  v8 = v5;
  v9 = self;
  v6 = v5;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.3);

}

- (void)_dismiss
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000060B4;
  v3[3] = &unk_100024748;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100006114;
  v2[3] = &unk_1000247D8;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v3, v2, 0.3);
}

- (void)correctionsCollectionViewController:(id)a3 didSelectItemWithText:(id)a4
{
  UIAccessibilityPostNotification(0x7EDu, a4);
  -[AXCACCorrectionsServiceViewController _dismiss](self, "_dismiss");
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  -[AXCACCorrectionsServiceViewController _dismiss](self, "_dismiss", a3);
  return 0;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
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
  NSString *v17;
  double x;
  double y;
  double width;
  double height;
  void *v22;
  void *v23;
  id v24;
  CGRect v25;

  v24 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", AXCACCorrectionsTextKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXCACCorrectionsServiceViewController collectionViewController](self, "collectionViewController"));
  objc_msgSend(v9, "setText:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AXCACCorrectionsAlternativesKey));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXCACCorrectionsServiceViewController collectionViewController](self, "collectionViewController"));
  objc_msgSend(v12, "setAlternatives:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", AXCACCorrectionsEmojisKey));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXCACCorrectionsServiceViewController collectionViewController](self, "collectionViewController"));
  objc_msgSend(v15, "setEmojis:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", AXCACCorrectionsRectKey));
  v25 = CGRectFromString(v17);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AXCACCorrectionsServiceViewController popoverPresentingViewController](self, "popoverPresentingViewController"));
  objc_msgSend(v22, "setPortraitUpSourceRect:", x, y, width, height);

  v23 = v24;
  if (v24)
  {
    (*((void (**)(id))v24 + 2))(v24);
    v23 = v24;
  }

}

- (CACCorrectionsCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void)setCollectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewController, a3);
}

- (CACPopoverPresentingViewController)popoverPresentingViewController
{
  return self->_popoverPresentingViewController;
}

- (void)setPopoverPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_popoverPresentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverPresentingViewController, 0);
  objc_storeStrong((id *)&self->_collectionViewController, 0);
}

@end
