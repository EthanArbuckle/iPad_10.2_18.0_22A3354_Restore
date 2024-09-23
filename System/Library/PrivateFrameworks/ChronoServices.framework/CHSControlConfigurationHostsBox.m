@implementation CHSControlConfigurationHostsBox

- (CHSControlConfigurationHostsBox)initWithConfigurationsByHost:(id)a3
{
  id v5;
  CHSControlConfigurationHostsBox *v6;
  CHSControlConfigurationHostsBox *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSControlConfigurationHostsBox;
  v6 = -[CHSControlConfigurationHostsBox init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configurationsByHost, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_configurationsByHost, CFSTR("c"));
}

- (CHSControlConfigurationHostsBox)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CHSControlConfigurationHostsBox *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("c"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self = -[CHSControlConfigurationHostsBox initWithConfigurationsByHost:](self, "initWithConfigurationsByHost:", v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDictionary)configurationsByHost
{
  return self->_configurationsByHost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationsByHost, 0);
}

@end
