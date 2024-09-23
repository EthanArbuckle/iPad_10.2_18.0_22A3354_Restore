@implementation _SWBSActionResponseSettings

- (_SWBSActionResponseSettings)init
{
  _SWBSActionResponseSettings *v2;
  BSMutableSettings *v3;
  BSMutableSettings *mutableSettings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SWBSActionResponseSettings;
  v2 = -[_SWBSActionResponseSettings init](&v6, sel_init);
  if (v2)
  {
    v3 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E0D017D0]);
    mutableSettings = v2->_mutableSettings;
    v2->_mutableSettings = v3;

  }
  return v2;
}

- (id)bsSettings
{
  void *v2;
  void *v3;

  -[_SWBSActionResponseSettings mutableSettings](self, "mutableSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)setObject:(id)a3 forSetting:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[_SWBSActionResponseSettings mutableSettings](self, "mutableSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v6, a4);

}

- (void)setFlag:(BOOL)a3 forSetting:(unint64_t)a4
{
  id v5;

  -[_SWBSActionResponseSettings mutableSettings](self, "mutableSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFlag:forSetting:", BSSettingFlagForBool(), a4);

}

- (BSMutableSettings)mutableSettings
{
  return self->_mutableSettings;
}

- (void)setMutableSettings:(id)a3
{
  objc_storeStrong((id *)&self->_mutableSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSettings, 0);
}

@end
