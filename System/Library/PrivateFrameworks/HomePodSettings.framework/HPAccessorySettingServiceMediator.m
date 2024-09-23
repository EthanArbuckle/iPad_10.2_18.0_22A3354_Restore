@implementation HPAccessorySettingServiceMediator

- (HPAccessorySettingServiceMediator)initWithInterface:(id)a3
{
  id v4;
  HPAccessorySettingServiceMediator *v5;
  HPAccessorySettingServiceMediator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HPAccessorySettingServiceMediator;
  v5 = -[HPAccessorySettingServiceMediator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_settingsInterface, v4);

  return v6;
}

- (void)notifyDidUpdateSetting:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HPAccessorySettingServiceMediator settingsInterface](self, "settingsInterface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notifyDidUpdateSetting:forKeyPath:", v7, v6);

}

- (void)didUpdateHH2State:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  _HPSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v3;
    _os_log_impl(&dword_22DF16000, v5, OS_LOG_TYPE_DEFAULT, "Posting notification OptedToHH2State changed. OptedToHH2 %d", buf, 8u);
  }

  -[HPAccessorySettingServiceMediator settingsInterface](self, "settingsInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMigrationToHH2Complete:", v3);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3, CFSTR("optedtohh2state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("com.apple.homepodsettings.optedtohh2state"), 0, v9);

}

- (HPSAccessorySettingService)settingsInterface
{
  return (HPSAccessorySettingService *)objc_loadWeakRetained((id *)&self->_settingsInterface);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsInterface);
}

@end
