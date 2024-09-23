@implementation HMAccessorySelectionSettingItem

- (HMAccessorySelectionSettingItem)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMAccessorySelectionSettingItem)initWithTitle:(id)a3
{
  id v4;
  HMAccessorySelectionSettingItem *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *title;
  HMAccessorySelectionSettingItem *v11;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)HMAccessorySelectionSettingItem;
    v5 = -[HMAccessorySelectionSettingItem init](&v13, sel_init);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getUUIDBytes:", v5->_identifierUUIDBytes);

      v7 = (void *)MEMORY[0x1E0D28630];
      v8 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(v7, "hmf_cachedInstanceForString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      title = v5->_title;
      v5->_title = (NSString *)v9;

    }
    self = v5;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSUUID)identifier
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_identifierUUIDBytes);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMAccessorySelectionSettingItem title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessorySelectionSettingItem *v4;
  HMAccessorySelectionSettingItem *v5;
  HMAccessorySelectionSettingItem *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMAccessorySelectionSettingItem *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMAccessorySelectionSettingItem title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySelectionSettingItem title](v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMAccessorySelectionSettingItem localizedTitle](self, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySelectionSettingItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)keyPath
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[HMAccessorySelectionSettingItem setting](self, "setting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMAccessorySelectionSettingItem title](self, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(".%@"), v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return (NSString *)v6;
}

- (NSString)localizedTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[HMAccessorySelectionSettingItem keyPath](self, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMAccessorySettings localizationKeyForKeyPath:](HMAccessorySettings, "localizationKeyForKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMLocalization sharedManager](HMLocalization, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getLocalizedString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", v4) & 1) != 0)
  {
    -[HMAccessorySelectionSettingItem title](self, "title");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (HMAccessorySelectionSettingItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMAccessorySelectionSettingItem *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMAccessorySelectionSettingItem initWithTitle:](self, "initWithTitle:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getUUIDBytes:", v6->_identifierUUIDBytes);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMAccessorySelectionSettingItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.identifier"));

  -[HMAccessorySelectionSettingItem title](self, "title");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.title"));

}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HMAccessorySelectionSetting)setting
{
  return (HMAccessorySelectionSetting *)objc_loadWeakRetained((id *)&self->_setting);
}

- (void)setSetting:(id)a3
{
  objc_storeWeak((id *)&self->_setting, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setting);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
