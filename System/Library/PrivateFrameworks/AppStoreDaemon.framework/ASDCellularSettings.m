@implementation ASDCellularSettings

+ (id)settingsForIdentity:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "defaultsKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithDefaultsKey:", v6);
  return v7;
}

- (ASDCellularSettings)initWithDefaultsKey:(id)a3
{
  id v5;
  ASDCellularSettings *v6;
  ASDCellularSettings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDCellularSettings;
  v6 = -[ASDCellularSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_defaultsKey, a3);

  return v7;
}

- (BOOL)allowAutomaticDownloads
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AllowAutoDownloadOnCellular"), CFSTR("com.apple.itunesstored"), 0) != 0;
}

- (void)setAllowAutomaticDownloads:(BOOL)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("AllowAutoDownloadOnCellular"), v3, CFSTR("com.apple.itunesstored"));

}

- (int64_t)cellularDataPrompt
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[ASDCellularSettings _cellularSettings](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", self->_defaultsKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CellularDataPrompt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Always")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("OverLimit")) & 1) != 0)
  {
    v6 = 0;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Never")))
  {
    v6 = 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_cellularSettings
{
  if (a1)
    a1 = (void *)CFPreferencesCopyValue(CFSTR("CellularSettings"), CFSTR("com.apple.appstored"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  return a1;
}

- (void)setCellularDataPrompt:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ASDCellularSettings _cellularSettings](self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", self->_defaultsKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v8);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v5);
  objc_msgSend(v6, "setObject:forKey:", v7, self->_defaultsKey);
  if ((unint64_t)a3 <= 2)
    objc_msgSend(v7, "setObject:forKey:", off_1E37BE788[a3], CFSTR("CellularDataPrompt"));
  CFPreferencesSetAppValue(CFSTR("CellularSettings"), v6, CFSTR("com.apple.appstored"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsKey, 0);
}

@end
