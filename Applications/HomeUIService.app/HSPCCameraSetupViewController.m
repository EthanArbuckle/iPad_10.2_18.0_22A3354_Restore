@implementation HSPCCameraSetupViewController

- (HSPCCameraSetupViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD *v11;
  HSPCCameraSetupViewController *v12;
  HSPCCameraSetupViewController *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addedAccessory"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100020D44;
  v21[3] = &unk_1000A1BC0;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cameraProfiles"));
  v22 = v10;
  v11 = objc_retainBlock(v21);
  v20.receiver = self;
  v20.super_class = (Class)HSPCCameraSetupViewController;
  v12 = -[HSPCMVVMShellViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:](&v20, "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", 2, v11, &stru_1000A1C00);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_config, a4);
    objc_storeStrong((id *)&v13->_coordinator, a3);
    v14 = HULocalizedString(CFSTR("HUProximityCardCameraSetupCard"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[HSPCCameraSetupViewController setTitle:](v13, "setTitle:", v15);

    v16 = HULocalizedString(CFSTR("HUProximityCardCameraSetupCardSubtitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[HSPCCameraSetupViewController setSubtitle:](v13, "setSubtitle:", v17);

    v18 = -[HSPCCameraSetupViewController addProminentButtonWithTitleKey:target:futureSelector:](v13, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v13, "commitConfiguration");
    -[HSPCCameraSetupViewController addLearnMoreButtonWithTarget:action:userInfo:](v13, "addLearnMoreButtonWithTarget:action:userInfo:", v13, "launchCameraRecordingLearnMore", 0);
  }

  return v13;
}

- (void)launchCameraRecordingLearnMore
{
  id v3;

  v3 = objc_alloc_init((Class)HUCameraRecordingLearnMoreViewController);
  -[HSPCCameraSetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8158);
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
