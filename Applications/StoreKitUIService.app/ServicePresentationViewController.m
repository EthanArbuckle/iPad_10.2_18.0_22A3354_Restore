@implementation ServicePresentationViewController

- (ServicePresentationViewController)initWithChildViewController:(id)a3 animated:(BOOL)a4 presentationBounds:(CGRect)a5 proxyHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  ServicePresentationViewController *v16;
  ServicePresentationViewController *v17;
  objc_super v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ServicePresentationViewController;
  v16 = -[ServicePresentationViewController init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_childViewController, a3);
    v17->_animated = a4;
    v17->_presentationBounds.origin.x = x;
    v17->_presentationBounds.origin.y = y;
    v17->_presentationBounds.size.width = width;
    v17->_presentationBounds.size.height = height;
    objc_storeWeak((id *)&v17->_proxyHandler, v15);
    -[ServicePresentationViewController setModalPresentationStyle:](v17, "setModalPresentationStyle:", 5);
  }

  return v17;
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init((Class)UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  -[ServicePresentationViewController setView:](self, "setView:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ServicePresentationViewController;
  -[ServicePresentationViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePresentationViewController presentationController](self, "presentationController"));
  objc_msgSend(v4, "_setContainerIgnoresDirectTouchEvents:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ServicePresentationViewController;
  -[ServicePresentationViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[ServicePresentationViewController _presentChildViewController](self, "_presentChildViewController");
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[ServicePresentationViewController setChildViewController:](self, "setChildViewController:", 0);
  v9[1] = 3221225472;
  v9[2] = sub_10000EED8;
  v9[3] = &unk_1000496C0;
  v9[4] = self;
  v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)ServicePresentationViewController;
  v9[0] = _NSConcreteStackBlock;
  v7 = v6;
  -[ServicePresentationViewController dismissViewControllerWithTransition:completion:](&v8, "dismissViewControllerWithTransition:completion:", v4, v9);

}

- (void)_presentChildViewController
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePresentationViewController childViewController](self, "childViewController"));
  if (v3)
  {
    v4 = v3;
    -[ServicePresentationViewController _correctPopover:](self, "_correctPopover:", v3);
    -[ServicePresentationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, -[ServicePresentationViewController animated](self, "animated"), 0);
    v3 = v4;
  }

}

- (void)_correctPopover:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  void *v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat rect;
  void *rect_8;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  rect_8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "popoverPresentationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(rect_8, "sourceView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  if (rect_8 && v4 && v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
    objc_msgSend(v4, "frame");
    objc_msgSend(v6, "convertRect:toView:", v5);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePresentationViewController view](self, "view"));
    objc_msgSend(v15, "bounds");
    v17 = v16;
    -[ServicePresentationViewController presentationBounds](self, "presentationBounds");
    v19 = v8 + v17 - v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePresentationViewController view](self, "view"));
    objc_msgSend(v20, "bounds");
    v22 = v21;
    -[ServicePresentationViewController presentationBounds](self, "presentationBounds");
    v24 = v10 + v22 - v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePresentationViewController view](self, "view"));
    objc_msgSend(rect_8, "setSourceView:", v25);

    objc_msgSend(rect_8, "sourceRect");
    rect = v26;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v33 = v19;
    v38.origin.x = v19;
    v38.origin.y = v24;
    v38.size.width = v12;
    v38.size.height = v14;
    MinX = CGRectGetMinX(v38);
    v39.origin.x = v33;
    v39.origin.y = v24;
    v39.size.width = v12;
    v39.size.height = v14;
    MinY = CGRectGetMinY(v39);
    v40.origin.x = rect;
    v40.origin.y = v28;
    v40.size.width = v30;
    v40.size.height = v32;
    v41 = CGRectOffset(v40, MinX, MinY);
    objc_msgSend(rect_8, "setSourceRect:", v41.origin.x, v41.origin.y, v41.size.width, v41.size.height);
  }

}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_childViewController, a3);
}

- (CGRect)presentationBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentationBounds.origin.x;
  y = self->_presentationBounds.origin.y;
  width = self->_presentationBounds.size.width;
  height = self->_presentationBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentationBounds:(CGRect)a3
{
  self->_presentationBounds = a3;
}

- (ServiceBridgedPresentationControllerProxy)proxyHandler
{
  return (ServiceBridgedPresentationControllerProxy *)objc_loadWeakRetained((id *)&self->_proxyHandler);
}

- (void)setProxyHandler:(id)a3
{
  objc_storeWeak((id *)&self->_proxyHandler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxyHandler);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end
