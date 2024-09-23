@implementation HSPCAccessoryUpdateViewController

- (HSPCAccessoryUpdateViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  HSPCAccessoryUpdateViewController *v8;
  HSPCAccessoryUpdateViewController *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  objc_super v17;

  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HSPCAccessoryUpdateViewController;
  v8 = -[HSPCCenterIconViewController initWithCoordinator:config:](&v17, "initWithCoordinator:config:", a3, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_config, a4);
    v10 = HULocalizedString(CFSTR("HUAccessoryUpdateAvailableTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[HSPCAccessoryUpdateViewController setTitle:](v9, "setTitle:", v11);

    v12 = HULocalizedString(CFSTR("HUProximityCardAccessoryUpdateAvailableSubtitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[HSPCAccessoryUpdateViewController setSubtitle:](v9, "setSubtitle:", v13);

    v14 = -[HSPCAccessoryUpdateViewController addProminentButtonWithTitleKey:target:futureSelector:](v9, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUInstallUpdateTitle"), v9, "handleInstallUpdate");
    v15 = -[HSPCAccessoryUpdateViewController addOptionalButtonWithTitleKey:target:futureSelector:](v9, "addOptionalButtonWithTitleKey:target:futureSelector:", CFSTR("HUNotNowTitle"), v9, "handleNotNowButtonTapped");
  }

  return v9;
}

- (id)iconDescriptor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  v8 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v3));

  v5 = objc_alloc((Class)HFImageIconDescriptor);
  v6 = objc_msgSend(v5, "initWithSystemImageNamed:configuration:", HFSymbolIconIdentifierInstallUpdate, v4);

  return v6;
}

- (id)handleInstallUpdate
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAccessoryUpdateViewController config](self, "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "addedAccessory"));
  v4 = objc_msgSend(v3, "hf_startSoftwareUpdate");

  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8B48);
}

- (id)handleNotNowButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAccessoryUpdateViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "home"));
  if ((objc_msgSend(v4, "hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAccessoryUpdateViewController config](self, "config"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
    v7 = objc_msgSend(v6, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAccessoryUpdateViewController displayAutomaticUpdatesAlert](self, "displayAutomaticUpdatesAlert"));
      return v8;
    }
  }
  else
  {

  }
  v9 = HFLogForCategory(58);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAccessoryUpdateViewController config](self, "config"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "home"));
    v13 = objc_msgSend(v12, "hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAccessoryUpdateViewController config](self, "config"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "home"));
    v17 = 136315650;
    v18 = "-[HSPCAccessoryUpdateViewController handleNotNowButtonTapped]";
    v19 = 1024;
    v20 = v13;
    v21 = 1024;
    v22 = objc_msgSend(v15, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Did not display automatic software updates popup: hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter - [%d], hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled - [%d]", (uint8_t *)&v17, 0x18u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8B48));
  return v8;
}

- (id)displayAutomaticUpdatesAlert
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100050F64;
  v3[3] = &unk_1000A16F0;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v3));
}

- (id)config
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

@end
