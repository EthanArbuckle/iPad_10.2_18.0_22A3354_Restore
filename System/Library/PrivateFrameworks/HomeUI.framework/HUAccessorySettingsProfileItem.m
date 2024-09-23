@implementation HUAccessorySettingsProfileItem

- (HUAccessorySettingsProfileItem)initWithProfile:(id)a3 setting:(id)a4
{
  id v8;
  id v9;
  HUAccessorySettingsProfileItem *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsProfileItem.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("setting"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HUAccessorySettingsProfileItem;
  v10 = -[HUAccessorySettingsProfileItem init](&v14, sel_init);
  if (v10)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("HUAccessorySettingsProfileItem.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

    }
    objc_storeStrong((id *)&v10->_profile, a3);
    objc_storeStrong((id *)&v10->_setting, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HUAccessorySettingsProfileItem profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySettingsProfileItem setting](self, "setting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithProfile:setting:", v5, v6);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (NSUUID)uniqueIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HUAccessorySettingsProfileItem profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithUUIDString:", v5);

  return (NSUUID *)v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = objc_alloc_init(MEMORY[0x1E0D31578]);
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HUAccessorySettingsProfileItem setting](self, "setting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObjects:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30B80]);

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30B78]);

  -[HUAccessorySettingsProfileItem profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HUAccessorySettingsProfileItem profile](self, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30D18]);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (MCProfile)profile
{
  return self->_profile;
}

- (HMSetting)setting
{
  return self->_setting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
