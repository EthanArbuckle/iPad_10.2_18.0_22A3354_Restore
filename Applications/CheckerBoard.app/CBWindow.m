@implementation CBWindow

- (NSString)description
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  NSString *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindow presentedView](self, "presentedView"));
  v5 = (objc_class *)objc_opt_class(v3, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p -> %@>"), objc_opt_class(self, v8), self, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (NSString *)v10;
}

- (CBWindow)init
{
  return -[CBWindow initWithBackgroundTunnel:](self, "initWithBackgroundTunnel:", 0);
}

- (CBWindow)initWithBackgroundTunnel:(BOOL)a3
{
  void *v5;
  CBWindow *v6;
  objc_super v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "_referenceBounds");
  v8.receiver = self;
  v8.super_class = (Class)CBWindow;
  v6 = -[CBWindow initWithFrame:](&v8, "initWithFrame:");

  if (v6)
  {
    v6->_backgroundTunnel = a3;
    v6->_dismissed = 0;
  }
  return v6;
}

- (void)setBackgroundTunnel:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_backgroundTunnel != a3)
  {
    v3 = a3;
    self->_backgroundTunnel = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CBWindow windowManager](self, "windowManager"));
    objc_msgSend(v5, "window:changedBackgroundTunnel:", self, v3);

  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = a3;
  if (!-[CBWindow dismissed](self, "dismissed"))
  {
    -[CBWindow setDismissed:](self, "setDismissed:", 1);
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindow windowManager](self, "windowManager"));
    objc_msgSend(v5, "windowWillDismiss:", self);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindow presentedView](self, "presentedView"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100026C4C;
    v7[3] = &unk_100075510;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", v3, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)viewControllerDidDismiss
{
  void *v3;
  id v4;

  if (!-[CBWindow dismissed](self, "dismissed"))
  {
    -[CBWindow setDismissed:](self, "setDismissed:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindow windowManager](self, "windowManager"));
    objc_msgSend(v3, "windowWillDismiss:", self);

    v4 = (id)objc_claimAutoreleasedReturnValue(-[CBWindow windowManager](self, "windowManager"));
    objc_msgSend(v4, "windowDidDismiss:", self);

  }
}

- (unint64_t)windowManagerLayer
{
  return self->_windowManagerLayer;
}

- (void)setWindowManagerLayer:(unint64_t)a3
{
  self->_windowManagerLayer = a3;
}

- (CBWindowDelegate)windowManager
{
  return (CBWindowDelegate *)objc_loadWeakRetained((id *)&self->_windowManager);
}

- (void)setWindowManager:(id)a3
{
  objc_storeWeak((id *)&self->_windowManager, a3);
}

- (BOOL)presentViewControllerWithStatusBarShown
{
  return self->_presentViewControllerWithStatusBarShown;
}

- (void)setPresentViewControllerWithStatusBarShown:(BOOL)a3
{
  self->_presentViewControllerWithStatusBarShown = a3;
}

- (double)previousStatusBarWindowLevel
{
  return self->_previousStatusBarWindowLevel;
}

- (void)setPreviousStatusBarWindowLevel:(double)a3
{
  self->_previousStatusBarWindowLevel = a3;
}

- (BOOL)isStatusBarHidden
{
  return self->_statusBarHidden;
}

- (void)setStatusBarHidden:(BOOL)a3
{
  self->_statusBarHidden = a3;
}

- (BOOL)backgroundTunnel
{
  return self->_backgroundTunnel;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (UIViewController)presentedView
{
  return self->_presentedView;
}

- (void)setPresentedView:(id)a3
{
  objc_storeStrong((id *)&self->_presentedView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedView, 0);
  objc_destroyWeak((id *)&self->_windowManager);
}

@end
