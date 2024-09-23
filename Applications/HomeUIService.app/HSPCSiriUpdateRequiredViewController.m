@implementation HSPCSiriUpdateRequiredViewController

- (HSPCSiriUpdateRequiredViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  HSPCSiriUpdateRequiredViewController *v13;
  HSPCSiriUpdateRequiredViewController *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc((Class)UIImageView);
  v10 = HUImageNamed(CFSTR("Onboarding-UpdateSoftware"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v9, "initWithImage:", v11);

  objc_msgSend(v12, "setContentMode:", 2);
  v23.receiver = self;
  v23.super_class = (Class)HSPCSiriUpdateRequiredViewController;
  v13 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:](&v23, "initWithCenterContentView:", v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_config, a4);
    objc_storeStrong((id *)&v14->_coordinator, a3);
    v15 = HULocalizedString(CFSTR("HUSiriEndpointSetup_SiriUpdateRequired_Title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[HSPCSiriUpdateRequiredViewController setTitle:](v14, "setTitle:", v16);

    v17 = HULocalizedString(CFSTR("HUSiriEndpointSetup_SiriUpdateRequired_ContinueButtonTitle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = -[HSPCSiriUpdateRequiredViewController addProminentButtonWithLocalizedTitle:target:futureSelector:](v14, "addProminentButtonWithLocalizedTitle:target:futureSelector:", v18, v14, "commitConfiguration");

    v20 = HULocalizedString(CFSTR("HUSiriEndpointSetup_SiriUpdateRequired_Subtitle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[HSPCSiriUpdateRequiredViewController setSubtitle:](v14, "setSubtitle:", v21);

  }
  return v14;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A7F18);
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
