@implementation HSPCCenterIconViewController

- (HSPCCenterIconViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  id v8;
  HSPCCenterIconViewController *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)HUIconView), "initWithFrame:contentMode:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v8, "setIconSize:", 5);
  v9 = -[HSPCCenterIconViewController initWithCoordinator:config:iconView:](self, "initWithCoordinator:config:iconView:", v7, v6, v8);

  return v9;
}

- (HSPCCenterIconViewController)initWithCoordinator:(id)a3 config:(id)a4 iconView:(id)a5
{
  id v9;
  id v10;
  id v11;
  HSPCCenterIconViewController *v12;
  HSPCCenterIconViewController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HSPCCenterIconViewController;
  v12 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:](&v15, "initWithCenterContentView:", v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_config, a4);
    objc_storeStrong((id *)&v13->_coordinator, a3);
    objc_storeStrong((id *)&v13->_iconView, a5);
  }

  return v13;
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HSPCCenterIconViewController;
  -[HSPCFixedSizeCenterContentViewController viewDidLoad](&v9, "viewDidLoad");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController iconDescriptor](self, "iconDescriptor"));
  if (v4)
  {
    v5 = objc_opt_class(HUIconView, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCenterIconViewController iconView](self, "iconView"));
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend(v8, "updateWithIconDescriptor:displayStyle:animated:", v4, 1, 1);

  }
}

- (HFIconDescriptor)iconDescriptor
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSPCCenterIconViewController.m"), 58, CFSTR("Subclass to override."));

  return 0;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A7EA0);
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
