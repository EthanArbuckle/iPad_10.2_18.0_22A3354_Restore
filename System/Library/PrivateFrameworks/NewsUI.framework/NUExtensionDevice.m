@implementation NUExtensionDevice

- (NUExtensionDevice)initWithScreen:(id)a3 hostViewController:(id)a4
{
  id v7;
  id v8;
  NUExtensionDevice *v9;
  NUExtensionDevice *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUExtensionDevice;
  v9 = -[NUExtensionDevice init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_screen, a3);
    objc_storeWeak((id *)&v10->_hostViewController, v8);
  }

  return v10;
}

- (BOOL)isSplitScreen
{
  void *v3;
  void *v4;
  void *v5;
  double Width;
  void *v7;
  BOOL v8;
  CGRect v10;
  CGRect v11;

  -[NUExtensionDevice hostViewController](self, "hostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  Width = CGRectGetWidth(v10);
  -[NUExtensionDevice screen](self, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = Width != CGRectGetWidth(v11);

  return v8;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (UIViewController)hostViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end
