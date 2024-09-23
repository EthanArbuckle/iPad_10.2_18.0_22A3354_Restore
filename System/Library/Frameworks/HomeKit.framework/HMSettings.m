@implementation HMSettings

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMSettings owner](self, "owner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (id)longDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMSettings rootGroup](self, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "longDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ root: %@]"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMSettingGroup)rootGroup
{
  void *v2;
  void *v3;

  -[HMSettings owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMSettingGroup *)v3;
}

- (HMSettingsOwner)owner
{
  return (HMSettingsOwner *)objc_loadWeakRetained((id *)&self->_owner);
}

- (HMSettings)initWithSettingsOwner:(id)a3
{
  id v4;
  HMSettings *v5;
  HMSettings *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMSettings;
  v5 = -[HMSettings init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_owner, v4);

  return v6;
}

- (BOOL)isControllable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMSettings owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (HMSettingsDelegate)delegate
{
  void *v2;
  void *v3;

  -[HMSettings owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMSettingsDelegate *)v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMSettings rootGroup](self, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ root: %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
}

@end
