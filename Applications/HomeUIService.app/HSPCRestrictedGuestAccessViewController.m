@implementation HSPCRestrictedGuestAccessViewController

- (HSPCRestrictedGuestAccessViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  HSPCRestrictedGuestAccessViewController *v9;
  HSPCRestrictedGuestAccessViewController *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  objc_super v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100046CF8;
  v20[3] = &unk_1000A1BC0;
  v7 = a4;
  v21 = v7;
  v8 = objc_retainBlock(v20);
  v19.receiver = self;
  v19.super_class = (Class)HSPCRestrictedGuestAccessViewController;
  v9 = -[HSPCMVVMShellViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:](&v19, "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", 2, v8, &stru_1000A2F68);
  v10 = v9;
  if (v9)
  {
    -[HSPCRestrictedGuestAccessViewController setConfig:](v9, "setConfig:", v7);
    -[HSPCRestrictedGuestAccessViewController setCoordinator:](v10, "setCoordinator:", v6);
    v11 = HULocalizedString(CFSTR("HURestrictedGuestAccess_AddAccessory_Title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[HSPCRestrictedGuestAccessViewController setTitle:](v10, "setTitle:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedAccessory"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hf_userFriendlyLocalizedLowercaseDescription"));
    v15 = HULocalizedStringWithFormat(CFSTR("HURestrictedGuestAccess_AddAccessory_Subtitle"), CFSTR("%@"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[HSPCRestrictedGuestAccessViewController setSubtitle:](v10, "setSubtitle:", v16, v14);

    v17 = -[HSPCRestrictedGuestAccessViewController addProminentButtonWithTitleKey:target:futureSelector:](v10, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v10, "commitConfiguration");
  }

  return v10;
}

- (id)commitConfiguration
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  const char *v6;

  v2 = HFLogForCategory(68);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HSPCRestrictedGuestAccessViewController commitConfiguration]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'continue' button", (uint8_t *)&v5, 0xCu);
  }

  return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A85A8));
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
