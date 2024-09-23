@implementation HSPCNameZonesViewController

+ (id)applicableServicesForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_primaryService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_visibleServices"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_childServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObjectsFromSet:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_filter:", &stru_1000A2E68));
  v9 = HFLogForCategory(58);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "+[HSPCNameZonesViewController applicableServicesForAccessory:]";
    v14 = 2048;
    v15 = objc_msgSend(v7, "count");
    v16 = 2048;
    v17 = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s found %ld total services, %ld should be shown to user", (uint8_t *)&v12, 0x20u);
  }

  return v8;
}

- (HSPCNameZonesViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  HSPCNameZonesViewController *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCNameZonesViewController;
  v4 = -[HSPCNameServicesViewController initWithCoordinator:config:](&v8, "initWithCoordinator:config:", a3, a4);
  if (v4)
  {
    v5 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryNameSprinklerZonesTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[HSPCNameZonesViewController setTitle:](v4, "setTitle:", v6);

    -[HSPCNameZonesViewController setSubtitle:](v4, "setSubtitle:", 0);
  }
  return v4;
}

- (BOOL)shouldServiceStartEnabled:(id)a3
{
  return objc_msgSend(a3, "configurationState") == (id)3;
}

@end
