@implementation CBWindowRepresentation

+ (id)windowRepresentationForIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);

  return v5;
}

- (CBWindowRepresentation)initWithIdentifier:(id)a3
{
  id v5;
  CBWindowRepresentation *v6;
  CBWindowRepresentation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBWindowRepresentation;
  v6 = -[CBWindowRepresentation init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowRepresentation identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p -> %@>"), v3, self, v4));

  return (NSString *)v5;
}

- (void)setBackgroundTunnel:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  self->_backgroundTunnel = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CBWindowRepresentation windowManager](self, "windowManager"));
  objc_msgSend(v5, "window:changedBackgroundTunnel:", self, v3);

}

- (void)dismissViewControllerAnimated:(BOOL)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowRepresentation windowManager](self, "windowManager", a3));
  objc_msgSend(v4, "windowWillDismiss:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CBWindowRepresentation windowManager](self, "windowManager"));
  objc_msgSend(v5, "windowDidDismiss:", self);

}

- (void)viewControllerDidDismiss
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowRepresentation windowManager](self, "windowManager"));
  objc_msgSend(v3, "windowWillDismiss:", self);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CBWindowRepresentation windowManager](self, "windowManager"));
  objc_msgSend(v4, "windowDidDismiss:", self);

}

- (void)willLaunchApp
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CBWindowRepresentation windowManager](self, "windowManager"));
  objc_msgSend(v3, "windowWillAppear:", self);

}

- (void)didLaunchApp
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CBWindowRepresentation windowManager](self, "windowManager"));
  objc_msgSend(v3, "windowDidAppear:", self);

}

- (double)windowLevel
{
  return self->_windowLevel;
}

- (void)setWindowLevel:(double)a3
{
  self->_windowLevel = a3;
}

- (BOOL)backgroundTunnel
{
  return self->_backgroundTunnel;
}

- (CBWindowDelegate)windowManager
{
  return (CBWindowDelegate *)objc_loadWeakRetained((id *)&self->_windowManager);
}

- (void)setWindowManager:(id)a3
{
  objc_storeWeak((id *)&self->_windowManager, a3);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (unint64_t)windowManagerLayer
{
  return self->_windowManagerLayer;
}

- (void)setWindowManagerLayer:(unint64_t)a3
{
  self->_windowManagerLayer = a3;
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

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_windowManager);
}

@end
