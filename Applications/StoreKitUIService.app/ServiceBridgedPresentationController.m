@implementation ServiceBridgedPresentationController

+ (id)sharedController
{
  if (qword_1000632E0 != -1)
    dispatch_once(&qword_1000632E0, &stru_100049778);
  return (id)qword_1000632D8;
}

- (id)removeSavedViewController
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedPresentationController savedViewController](self, "savedViewController"));
  -[ServiceBridgedPresentationController setSavedViewController:](self, "setSavedViewController:", 0);
  return v3;
}

- (BOOL)saveViewController:(id)a3 animated:(BOOL)a4 presentationBounds:(CGRect)a5 proxyHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v11;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  ServicePresentationSafariViewController *v17;
  ServicePresentationSafariViewController *v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v13 = a3;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedPresentationController savedViewController](self, "savedViewController"));

  if (!v15)
  {
    v16 = objc_opt_class(SFSafariViewController);
    if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
      v17 = -[ServicePresentationSafariViewController initWithSafariViewController:proxyHandler:]([ServicePresentationSafariViewController alloc], "initWithSafariViewController:proxyHandler:", v13, v14);
    else
      v17 = -[ServicePresentationViewController initWithChildViewController:animated:presentationBounds:proxyHandler:]([ServicePresentationViewController alloc], "initWithChildViewController:animated:presentationBounds:proxyHandler:", v13, v11, v14, x, y, width, height);
    v18 = v17;
    -[ServiceBridgedPresentationController setSavedViewController:](self, "setSavedViewController:", v17);

  }
  return v15 == 0;
}

- (UIViewController)savedViewController
{
  return self->_savedViewController;
}

- (void)setSavedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_savedViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedViewController, 0);
}

@end
