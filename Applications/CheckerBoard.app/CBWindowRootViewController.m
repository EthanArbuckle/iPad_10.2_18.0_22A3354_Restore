@implementation CBWindowRootViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBWindowRootViewController;
  -[CBWindowRootViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowRootViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002691C;
  v9[3] = &unk_100075F18;
  objc_copyWeak(&v11, &location);
  v7 = v6;
  v10 = v7;
  v8.receiver = self;
  v8.super_class = (Class)CBWindowRootViewController;
  -[CBWindowRootViewController dismissViewControllerAnimated:completion:](&v8, "dismissViewControllerAnimated:completion:", v4, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (CBWindowLike)window
{
  return (CBWindowLike *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
}

@end
