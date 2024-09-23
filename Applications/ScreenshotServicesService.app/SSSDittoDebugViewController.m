@implementation SSSDittoDebugViewController

+ (void)prepareForDebugging
{
  SSSDebugAssetManager *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[SSScreenshotAssetManager sharedAssetManager](SSScreenshotAssetManager, "sharedAssetManager"));
  v2 = objc_opt_new(SSSDebugAssetManager);
  objc_msgSend(v3, "setBackend:", v2);

}

- (void)dittoRootViewController:(id)a3 willTransitionToState:(unint64_t)a4 changeBlock:(id)a5
{
  (*((void (**)(id))a5 + 2))(a5);
}

- (void)dittoRootViewController:(id)a3 willShowShowSharingUIWithBlock:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)dittoRootViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)dittoRootViewController:(id)a3 wantsBackground:(BOOL)a4 duration:(double)a5
{
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  if (a4)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2));
  else
    v7 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001620C;
  v9[3] = &unk_100091B98;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, a5);

}

- (void)dittoRootViewControllerDidDismiss:(id)a3
{
  -[SSSDittoDebugViewController removeDittoRootViewController](self, "removeDittoRootViewController", a3);
}

- (SSSDittoRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)createDittoRootViewControllerIfNecessary
{
  SSSDittoRootViewController *v3;
  SSSDittoRootViewController *rootViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!self->_rootViewController)
  {
    v3 = objc_alloc_init(SSSDittoRootViewController);
    rootViewController = self->_rootViewController;
    self->_rootViewController = v3;

    -[SSSDittoRootViewController setDelegate:](self->_rootViewController, "setDelegate:", self);
    -[SSSDittoDebugViewController addChildViewController:](self, "addChildViewController:", self->_rootViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self->_rootViewController, "view"));
    objc_msgSend(v5, "addSubview:", v6);

    -[SSSDittoRootViewController didMoveToParentViewController:](self->_rootViewController, "didMoveToParentViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self->_rootViewController, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugViewController view](self, "view"));
    objc_msgSend(v8, "bounds");
    objc_msgSend(v7, "setFrame:");

    v9 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self->_rootViewController, "view"));
    objc_msgSend(v9, "setHidden:", 1);

  }
}

- (void)removeDittoRootViewController
{
  void *v3;
  SSSDittoRootViewController *rootViewController;

  -[SSSDittoRootViewController setDelegate:](self->_rootViewController, "setDelegate:", 0);
  -[SSSDittoRootViewController willMoveToParentViewController:](self->_rootViewController, "willMoveToParentViewController:", 0);
  -[SSSDittoRootViewController removeFromParentViewController](self->_rootViewController, "removeFromParentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self->_rootViewController, "view"));
  objc_msgSend(v3, "removeFromSuperview");

  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;

}

- (void)_addScreenshotWithPDF:(id)a3 visibleRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  id v20;
  SSDebugEnvironmentElement *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIImage *ImageFromCurrentImageContext;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  SSDebugEnvironmentElement *v32;
  CGSize v33;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = objc_alloc_init((Class)SSEnvironmentDescription);
  objc_msgSend(v10, "setPresentationMode:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v16, "scale");
  v18 = v17;

  objc_msgSend(v10, "setImagePixelSize:", v13 * v18, v15 * v18);
  objc_msgSend(v10, "setImageScale:", v18);
  if (v9)
  {
    v19 = objc_alloc_init((Class)SSHarvestedApplicationMetadata);
    objc_msgSend(v19, "setCanGenerateDocument:", 1);
    v20 = objc_alloc_init((Class)SSHarvestedApplicationDocument);
    objc_msgSend(v20, "setPDFData:", v9);
    objc_msgSend(v20, "setPDFPage:", 0);
    objc_msgSend(v20, "setPDFVisibleRect:", x, y, width, height);
    v21 = objc_alloc_init(SSDebugEnvironmentElement);
    -[SSDebugEnvironmentElement setMetadata:](v21, "setMetadata:", v19);
    -[SSDebugEnvironmentElement setDocument:](v21, "setDocument:", v20);
    v32 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    objc_msgSend(v10, "setDebugElements:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "createScreenshotWithEnvironmentDescription:", v10));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "window"));

  v33.width = v13;
  v33.height = v15;
  UIGraphicsBeginImageContextWithOptions(v33, 1, v18);
  objc_msgSend(v26, "bounds");
  objc_msgSend(v26, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v28 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  objc_msgSend(v24, "setBackingImage:", v28);
  -[SSSDittoRootViewController screenshotReceived:completion:](self->_rootViewController, "screenshotReceived:completion:", v24, &stru_100091CB8);
  v29 = objc_alloc_init((Class)SSImageIdentifierUpdate);
  objc_msgSend(v29, "setImageIdentifier:", CFSTR("test"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  objc_msgSend(v29, "setEnvironmentDescriptionIdentifier:", v30);

  objc_msgSend(v29, "setSuccess:", 1);
  objc_msgSend(v24, "_harvestPDFIfNecessary");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
  objc_msgSend(v31, "processImageIdentifierUpdate:", v29);

}

- (void)dittoDebugView:(id)a3 requestsPresentationOfViewController:(id)a4
{
  -[SSSDittoDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)_addScreenshots
{
  void *v3;
  void *v4;
  uint64_t v5;
  CGSize size;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[7];
  CGPoint origin;
  CGSize v16;

  -[SSSDittoDebugViewController createDittoRootViewControllerIfNecessary](self, "createDittoRootViewControllerIfNecessary");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self->_rootViewController, "view"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugViewController debugView](self, "debugView"));
  v5 = (uint64_t)objc_msgSend(v4, "numberOfScreenshotsToAdd");

  size = CGRectZero.size;
  origin = CGRectZero.origin;
  v16 = size;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugViewController debugView](self, "debugView"));
  v8 = objc_msgSend(v7, "shouldIncludePDF");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugViewController debugView](self, "debugView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "generatePDF:", &origin));

  }
  else
  {
    v10 = 0;
  }
  -[SSSDittoDebugViewController _addScreenshotWithPDF:visibleRect:](self, "_addScreenshotWithPDF:visibleRect:", v10, origin, v16);
  if (v5 >= 2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugViewController debugView](self, "debugView"));
    objc_msgSend(v11, "advanceScrollOffset");

    v12 = 0;
    do
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10001685C;
      v14[3] = &unk_100091CE0;
      v14[4] = self;
      v14[5] = v12;
      v14[6] = v5;
      v13 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v14, (double)v12++ + 1.0);
    }
    while (v5 - 1 != v12);
  }

}

- (void)loadView
{
  SSSDittoDebugView *v3;
  id v4;

  v3 = objc_opt_new(SSSDittoDebugView);
  -[SSSDittoDebugViewController setView:](self, "setView:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugViewController debugView](self, "debugView"));
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)viewDidLoad
{
  UIVisualEffectView *v3;
  UIVisualEffectView *backgroundView;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSSDittoDebugViewController;
  -[SSSDittoDebugViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (UIVisualEffectView *)objc_alloc_init((Class)UIVisualEffectView);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  -[UIVisualEffectView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", self->_backgroundView);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugViewController debugView](self, "debugView"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016A14;
  v7[3] = &unk_100091920;
  v7[4] = self;
  objc_msgSend(v6, "setBlockToRunForAddScreenshotsButton:", v7);

}

- (void)viewWillLayoutSubviews
{
  UIVisualEffectView *backgroundView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSDittoDebugViewController;
  -[SSSDittoDebugViewController viewWillLayoutSubviews](&v5, "viewWillLayoutSubviews");
  backgroundView = self->_backgroundView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  -[UIVisualEffectView setFrame:](backgroundView, "setFrame:");

}

- (SSSViewControllerManager)viewControllerManager
{
  return (SSSViewControllerManager *)objc_loadWeakRetained((id *)&self->viewControllerManager);
}

- (void)setViewControllerManager:(id)a3
{
  objc_storeWeak((id *)&self->viewControllerManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->viewControllerManager);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end
