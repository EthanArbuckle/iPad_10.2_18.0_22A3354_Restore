@implementation HSPCSiriForEveryoneViewController

- (HSPCSiriForEveryoneViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  HSPCSiriForEveryoneViewController *v12;
  HSPCSiriForEveryoneViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)UIImageView);
  v9 = HUImageNamed(CFSTR("SiriForEveryone-SiriEndpoints-Light"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v8, "initWithImage:", v10);

  objc_msgSend(v11, "setContentMode:", 2);
  v27.receiver = self;
  v27.super_class = (Class)HSPCSiriForEveryoneViewController;
  v12 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:](&v27, "initWithCenterContentView:", v11);
  v13 = v12;
  if (v12)
  {
    -[HSPCSiriForEveryoneViewController setConfig:](v12, "setConfig:", v7);
    -[HSPCSiriForEveryoneViewController setCoordinator:](v13, "setCoordinator:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriForEveryoneViewController config](v13, "config"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "home"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "users"));
    v17 = objc_msgSend(v16, "count");

    v18 = HULocalizedString(CFSTR("HUSiriEndpointSetup_SiriForEveryone_Title"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[HSPCSiriForEveryoneViewController setTitle:](v13, "setTitle:", v19);

    v20 = HULocalizedString(CFSTR("HUSiriEndpointSetup_SiriForEveryone_ContinueButtonTitle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = -[HSPCSiriForEveryoneViewController addProminentButtonWithLocalizedTitle:target:futureSelector:](v13, "addProminentButtonWithLocalizedTitle:target:futureSelector:", v21, v13, "_enableMultiUser");

    if (v17)
      v23 = CFSTR("HUSiriEndpointSetup_SiriForEveryone_MultipleUserHomeSubtitle");
    else
      v23 = CFSTR("HUSiriEndpointSetup_SiriForEveryone_SingleUserHomeSubtitle");
    v24 = HULocalizedString(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[HSPCSiriForEveryoneViewController setSubtitle:](v13, "setSubtitle:", v25);

  }
  return v13;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8170);
}

- (id)_enableMultiUser
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD v16[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriForEveryoneViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "home"));

  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10002123C;
  v14 = &unk_1000A16F0;
  v15 = v4;
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", &v11));
  v16[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriForEveryoneViewController commitConfiguration](self, "commitConfiguration", v11, v12, v13, v14));
  v16[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture chainFutures:](NAFuture, "chainFutures:", v8));

  return v9;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
