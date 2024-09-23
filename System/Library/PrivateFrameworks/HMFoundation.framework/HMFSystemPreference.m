@implementation HMFSystemPreference

- (HMFSystemPreference)initWithKey:(id)a3 options:(unint64_t)a4 domain:(id)a5 defaultValue:(id)a6 parent:(id)a7
{
  id v12;
  HMFSystemPreference *v13;
  void *v14;
  HMFSystemPreference *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  objc_super v20;

  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMFSystemPreference;
  v13 = -[HMFPreference initWithKey:options:defaultValue:parent:](&v20, sel_initWithKey_options_defaultValue_parent_, a3, a4, a6, a7);
  if (v13)
  {
    if (v12)
      v14 = (void *)objc_msgSend(v12, "copy");
    else
      v14 = (void *)*MEMORY[0x1E0C9B248];
    objc_storeStrong((id *)&v13->_domain, v14);
    if (v12)

    v15 = v13;
    -[HMFPreference key](v15, "key");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[HMFSystemPreference domain](v15, "domain");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)CFPreferencesCopyAppValue(v16, v17);

    if (v18)
    {
      -[HMFPreference setValue:](v15, "setValue:", v18);

    }
  }

  return v13;
}

- (HMFSystemPreference)initWithKey:(id)a3 options:(unint64_t)a4 defaultValue:(id)a5 parent:(id)a6
{
  return -[HMFSystemPreference initWithKey:options:domain:defaultValue:parent:](self, "initWithKey:options:domain:defaultValue:parent:", a3, a4, 0, a5, a6);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (HMFSystemPreference)initWithKey:(id)a3 options:(unint64_t)a4 domain:(id)a5 defaultValue:(id)a6
{
  return -[HMFSystemPreference initWithKey:options:domain:defaultValue:parent:](self, "initWithKey:options:domain:defaultValue:parent:", a3, a4, a5, a6, 0);
}

- (NSString)propertyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMFSystemPreference domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFPreference key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFPreference value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(", Domain = %@, Key = %@, Value = %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
