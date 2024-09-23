@implementation ServiceComposeReviewViewController

- (void)dealloc
{
  objc_super v3;

  -[ServiceAlertController setDelegate:](self->_alertController, "setDelegate:", 0);
  -[SKUIComposeReviewViewController setDelegate:](self->_underlyingViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ServiceComposeReviewViewController;
  -[ServiceComposeReviewViewController dealloc](&v3, "dealloc");
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIServiceComposeReviewViewController);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIClientComposeReviewViewController);
}

- (void)loadView
{
  SKUIComposeReviewViewController *underlyingViewController;
  SKUIComposeReviewViewController *v4;
  SKUIComposeReviewViewController *v5;
  id v6;
  void *v7;
  id v8;

  v8 = objc_alloc_init((Class)UIView);
  underlyingViewController = self->_underlyingViewController;
  if (!underlyingViewController)
  {
    v4 = (SKUIComposeReviewViewController *)objc_alloc_init((Class)SKUIComposeReviewViewController);
    v5 = self->_underlyingViewController;
    self->_underlyingViewController = v4;

    -[SKUIComposeReviewViewController setDelegate:](self->_underlyingViewController, "setDelegate:", self);
    v6 = objc_alloc_init((Class)SUClientInterface);
    -[SKUIComposeReviewViewController setClientInterface:](self->_underlyingViewController, "setClientInterface:", v6);
    -[ServiceComposeReviewViewController addChildViewController:](self, "addChildViewController:", self->_underlyingViewController);

    underlyingViewController = self->_underlyingViewController;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKUIComposeReviewViewController view](underlyingViewController, "view"));
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v8, "addSubview:", v7);
  -[ServiceComposeReviewViewController setView:](self, "setView:", v8);

}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  -[ServiceComposeReviewViewController _hostAuditToken](self, "_hostAuditToken");
  v8 = v10;
  v9 = v11;
  if (sub_10000F240(&v8, CFSTR("com.apple.ios.StoreKit.compose-review"))
    || (v8 = v10, v9 = v11, sub_10000F240(&v8, kSSITunesStorePrivateEntitlement)))
  {
    v3 = 0;
    v4 = 1;
  }
  else
  {
    v5 = SSError(SSErrorDomain, 107, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v4 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceComposeReviewViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v6, "didPrepareWithResult:error:", v7, v3);

}

- (void)alertController:(id)a3 alertDidFinishWithButton:(id)a4
{
  if (self->_dismissAfterDialog)
  {
    self->_dismissAfterDialog = 0;
    -[ServiceComposeReviewViewController _dismissWithError:](self, "_dismissWithError:", 0, a4);
  }
}

- (void)composeReviewViewController:(id)a3 didFailWithDialog:(id)a4
{
  if (a4)
  {
    self->_dismissAfterDialog = 1;
    -[ServiceComposeReviewViewController _presentAlertForDialog:](self, "_presentAlertForDialog:", a4);
  }
  else
  {
    -[ServiceComposeReviewViewController _dismissWithError:](self, "_dismissWithError:", 0);
  }
}

- (void)composeReviewViewController:(id)a3 presentDialog:(id)a4
{
  -[ServiceComposeReviewViewController _presentAlertForDialog:](self, "_presentAlertForDialog:", a4);
}

- (BOOL)composeReviewViewController:(id)a3 shouldSubmitReview:(id)a4
{
  float v5;
  float v6;
  void *v7;

  objc_msgSend(a4, "rating", a3);
  v6 = v5;
  if (v5 < 0.00000011921)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceComposeReviewViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
    objc_msgSend(v7, "promptForStarRating");

  }
  return v6 >= 0.00000011921;
}

- (void)composeReviewViewControllerDidCancel:(id)a3
{
  -[ServiceComposeReviewViewController _dismissWithError:](self, "_dismissWithError:", 0);
}

- (void)composeReviewViewControllerDidSubmit:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ServiceComposeReviewViewController _clientViewControllerProxy](self, "_clientViewControllerProxy", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  objc_msgSend(v4, "didFinishWithResult:error:", v3, 0);

}

- (void)finishStarRatingPromptWithRating:(id)a3
{
  SKUIComposeReviewViewController *underlyingViewController;

  if (a3)
  {
    underlyingViewController = self->_underlyingViewController;
    objc_msgSend(a3, "floatValue");
    -[SKUIComposeReviewViewController setRating:](underlyingViewController, "setRating:");
    -[SKUIComposeReviewViewController submitReview](self->_underlyingViewController, "submitReview");
  }
}

- (void)loadReviewWithURL:(id)a3
{
  id v4;
  void *v5;
  SKUIComposeReviewViewController *underlyingViewController;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self));
  underlyingViewController = self->_underlyingViewController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000236AC;
  v8[3] = &unk_100049EB0;
  v9 = v5;
  v7 = v5;
  -[SKUIComposeReviewViewController loadReviewWithURL:completionBlock:](underlyingViewController, "loadReviewWithURL:completionBlock:", v4, v8);

}

- (void)clientKeyboardFrameChanged:(CGRect)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRect:](NSValue, "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = SKUIRemoteKeyboardFrameChangedNotification;
    v7 = SKUIRemoteKeyboardFrameKey;
    v8 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
    objc_msgSend(v4, "postNotificationName:object:userInfo:", v5, 0, v6);

  }
}

- (void)_dismissWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ServiceComposeReviewViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  objc_msgSend(v6, "didFinishWithResult:error:", v5, v4);

}

- (void)_presentAlertForDialog:(id)a3
{
  id v4;
  ServiceAlertController *alertController;
  ServiceAlertController *v6;
  void *v7;
  ServiceAlertController *v8;
  ServiceAlertController *v9;
  id v10;

  v4 = a3;
  alertController = self->_alertController;
  v10 = v4;
  if (!alertController)
  {
    v6 = [ServiceAlertController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceComposeReviewViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
    v8 = -[ServiceAlertController initWithRemoteViewControllerProxy:](v6, "initWithRemoteViewControllerProxy:", v7);
    v9 = self->_alertController;
    self->_alertController = v8;

    -[ServiceAlertController setDelegate:](self->_alertController, "setDelegate:", self);
    v4 = v10;
    alertController = self->_alertController;
  }
  -[ServiceAlertController presentAlertForDialog:](alertController, "presentAlertForDialog:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingViewController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
