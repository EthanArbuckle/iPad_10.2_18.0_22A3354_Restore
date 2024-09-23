@implementation HSPCLockAccessUpdateViewController

- (HSPCLockAccessUpdateViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  HULockAccessUpdateViewController *v11;
  HULockAccessUpdateViewController *lockAccessUpdateViewController;
  HSPCLockAccessUpdateViewController *v13;
  HSPCLockAccessUpdateViewController *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc((Class)HULockAccessUpdateViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
  v11 = (HULockAccessUpdateViewController *)objc_msgSend(v9, "initWithHome:", v10);
  lockAccessUpdateViewController = self->_lockAccessUpdateViewController;
  self->_lockAccessUpdateViewController = v11;

  v31.receiver = self;
  v31.super_class = (Class)HSPCLockAccessUpdateViewController;
  v13 = -[HSPCLockAccessUpdateViewController initWithContentView:](&v31, "initWithContentView:", 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_config, a4);
    objc_storeStrong((id *)&v14->_coordinator, a3);
    v15 = sub_1000593D8(CFSTR("HSLockAccessUpdate_Title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[HSPCLockAccessUpdateViewController setTitle:](v14, "setTitle:", v16);

    v17 = sub_1000593D8(CFSTR("HSLockAccessUpdate_Description"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[HSPCLockAccessUpdateViewController setSubtitle:](v14, "setSubtitle:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
    v27 = sub_1000594F0(CFSTR("HSLockAccessUpdate_Enable_Format"), CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = -[HSPCLockAccessUpdateViewController addProminentButtonWithLocalizedTitle:target:futureSelector:](v14, "addProminentButtonWithLocalizedTitle:target:futureSelector:", v28, v14, "commitConfiguration");

  }
  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  _QWORD v39[4];

  v38.receiver = self;
  v38.super_class = (Class)HSPCLockAccessUpdateViewController;
  -[HSPCLockAccessUpdateViewController viewDidLoad](&v38, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController lockAccessUpdateViewController](self, "lockAccessUpdateViewController"));
  -[HSPCLockAccessUpdateViewController addChildViewController:](self, "addChildViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController lockAccessUpdateViewController](self, "lockAccessUpdateViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
  objc_msgSend(v4, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController lockAccessUpdateViewController](self, "lockAccessUpdateViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController lockAccessUpdateViewController](self, "lockAccessUpdateViewController"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController contentView](self, "contentView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mainContentGuide"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v32));
  v39[0] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController lockAccessUpdateViewController](self, "lockAccessUpdateViewController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "mainContentGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v25));
  v39[1] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController lockAccessUpdateViewController](self, "lockAccessUpdateViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mainContentGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v9));
  v39[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController lockAccessUpdateViewController](self, "lockAccessUpdateViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mainContentGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v16));
  v39[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A7F30);
}

- (id)hu_preloadContent
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCLockAccessUpdateViewController lockAccessUpdateViewController](self, "lockAccessUpdateViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hu_preloadContent"));

  return v3;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HULockAccessUpdateViewController)lockAccessUpdateViewController
{
  return self->_lockAccessUpdateViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockAccessUpdateViewController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
