@implementation NUApplicationDevice

- (NUApplicationDevice)initWithApplication:(id)a3 screen:(id)a4
{
  id v7;
  id v8;
  NUApplicationDevice *v9;
  NUApplicationDevice *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUApplicationDevice;
  v9 = -[NUApplicationDevice init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_application, a3);
    objc_storeStrong((id *)&v10->_screen, a4);
  }

  return v10;
}

- (BOOL)isSplitScreen
{
  void *v3;
  void *v4;
  double Width;
  void *v6;
  BOOL v7;
  CGRect v9;
  CGRect v10;

  -[NUApplicationDevice application](self, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v9);
  -[NUApplicationDevice screen](self, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = Width != CGRectGetWidth(v10);

  return v7;
}

- (UIApplication)application
{
  return self->_application;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
