@implementation IRAirPlaySettings

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__IRAirPlaySettings_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, block);
  return (id)shared_sharedInstance_0;
}

void __27__IRAirPlaySettings_shared__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)shared_sharedInstance_0;
  shared_sharedInstance_0 = (uint64_t)v1;

}

- (IRAirPlaySettings)init
{
  IRAirPlaySettings *v2;
  IRAirPlaySettings *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IRAirPlaySettings;
  v2 = -[IRAirPlaySettings init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IRAirPlaySettings setIsAutoRoutingSettingEnabledInternal:](v2, "setIsAutoRoutingSettingEnabledInternal:", 1);
    -[IRAirPlaySettings setIsRoutePredictionSettingEnabledInternal:](v3, "setIsRoutePredictionSettingEnabledInternal:", 1);
  }
  return v3;
}

- (BOOL)isAutoRoutingSettingEnabled
{
  BOOL v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("EnableAutoRouting"), CFSTR("com.apple.coremedia"), &keyExistsAndHasValidFormat))
  {
    v3 = 1;
  }
  else
  {
    v3 = keyExistsAndHasValidFormat == 0;
  }
  v4 = v3;
  if (-[IRAirPlaySettings isAutoRoutingSettingEnabledInternal](self, "isAutoRoutingSettingEnabledInternal") != (_DWORD)v4)
  {
    -[IRAirPlaySettings setIsAutoRoutingSettingEnabledInternal:](self, "setIsAutoRoutingSettingEnabledInternal:", v4);
    v5 = (void *)*MEMORY[0x24BE5B278];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B278], OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      v7 = v5;
      objc_msgSend(v6, "numberWithBool:", -[IRAirPlaySettings isAutoRoutingSettingEnabledInternal](self, "isAutoRoutingSettingEnabledInternal"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#airplay-settings, autoRoutingSettingEnabled: %@", buf, 0xCu);

    }
  }
  return -[IRAirPlaySettings isAutoRoutingSettingEnabledInternal](self, "isAutoRoutingSettingEnabledInternal");
}

- (BOOL)isRoutePredictionSettingEnabled
{
  BOOL v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("EnableRoutePrediction"), CFSTR("com.apple.coremedia"), &keyExistsAndHasValidFormat))
  {
    v3 = 1;
  }
  else
  {
    v3 = keyExistsAndHasValidFormat == 0;
  }
  v4 = v3;
  if (-[IRAirPlaySettings isRoutePredictionSettingEnabledInternal](self, "isRoutePredictionSettingEnabledInternal") != (_DWORD)v4)
  {
    -[IRAirPlaySettings setIsRoutePredictionSettingEnabledInternal:](self, "setIsRoutePredictionSettingEnabledInternal:", v4);
    v5 = (void *)*MEMORY[0x24BE5B278];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B278], OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      v7 = v5;
      objc_msgSend(v6, "numberWithBool:", -[IRAirPlaySettings isRoutePredictionSettingEnabledInternal](self, "isRoutePredictionSettingEnabledInternal"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#airplay-settings, routePredictionSettingEnabled: %@", buf, 0xCu);

    }
  }
  return -[IRAirPlaySettings isRoutePredictionSettingEnabledInternal](self, "isRoutePredictionSettingEnabledInternal")
      || -[IRAirPlaySettings isAutoRoutingSettingEnabledInternal](self, "isAutoRoutingSettingEnabledInternal");
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRAirPlaySettings isAutoRoutingSettingEnabledInternal](self, "isAutoRoutingSettingEnabledInternal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRAirPlaySettings isRoutePredictionSettingEnabledInternal](self, "isRoutePredictionSettingEnabledInternal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IRAirPlaySettings: autoRoutingSettingEnabled: %@, routePredictionSettingEnabled: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAutoRoutingSettingEnabledInternal
{
  return self->_isAutoRoutingSettingEnabledInternal;
}

- (void)setIsAutoRoutingSettingEnabledInternal:(BOOL)a3
{
  self->_isAutoRoutingSettingEnabledInternal = a3;
}

- (BOOL)isRoutePredictionSettingEnabledInternal
{
  return self->_isRoutePredictionSettingEnabledInternal;
}

- (void)setIsRoutePredictionSettingEnabledInternal:(BOOL)a3
{
  self->_isRoutePredictionSettingEnabledInternal = a3;
}

@end
