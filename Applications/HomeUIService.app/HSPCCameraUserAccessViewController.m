@implementation HSPCCameraUserAccessViewController

- (HSPCCameraUserAccessViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCCameraUserAccessViewController *v9;
  HSPCCameraUserAccessViewController *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HSPCCameraUserAccessViewController;
  v9 = -[HSPCMVVMShellViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:](&v17, "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", 2, &stru_1000A32E0, &stru_1000A3300);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = HULocalizedString(CFSTR("HUCameraPermissionsSettingsHeader_Title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[HSPCCameraUserAccessViewController setTitle:](v10, "setTitle:", v12);

    v13 = HULocalizedString(CFSTR("HUCameraPermissionsSettingsHeader_Body"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[HSPCCameraUserAccessViewController setSubtitle:](v10, "setSubtitle:", v14);

    v15 = -[HSPCCameraUserAccessViewController addProminentButtonWithTitleKey:target:futureSelector:](v10, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v10, "commitConfiguration");
  }

  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8B30);
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
