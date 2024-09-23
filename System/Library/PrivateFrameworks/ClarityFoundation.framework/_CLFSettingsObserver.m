@implementation _CLFSettingsObserver

- (_CLFSettingsObserver)initWithSettings:(id)a3 settingsSelector:(SEL)a4
{
  id v6;
  _CLFSettingsObserver *v7;
  _CLFSettingsObserver *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CLFSettingsObserver;
  v7 = -[_CLFSettingsObserver init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_settings, v6);
    v8->_settingsSelector = a4;
  }

  return v8;
}

- (void)invalidate
{
  const char *v3;
  void *v4;
  id v5;

  -[_CLFSettingsObserver settings](self, "settings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[_CLFSettingsObserver settingsSelector](self, "settingsSelector");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterUpdateBlockForRetrieveSelector:withListenerID:", v3, v4);

}

- (CLFBaseSettings)settings
{
  return (CLFBaseSettings *)objc_loadWeakRetained((id *)&self->_settings);
}

- (void)setSettings:(id)a3
{
  objc_storeWeak((id *)&self->_settings, a3);
}

- (SEL)settingsSelector
{
  return self->_settingsSelector;
}

- (void)setSettingsSelector:(SEL)a3
{
  self->_settingsSelector = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settings);
}

@end
