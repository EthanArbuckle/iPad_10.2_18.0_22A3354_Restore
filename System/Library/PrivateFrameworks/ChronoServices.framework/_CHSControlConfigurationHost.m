@implementation _CHSControlConfigurationHost

- (_CHSControlConfigurationHost)initWithIdentifier:(id)a3 configurations:(id)a4
{
  id v6;
  id v7;
  _CHSControlConfigurationHost *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSArray *configurations;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CHSControlConfigurationHost;
  v8 = -[_CHSControlConfigurationHost init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    configurations = v8->_configurations;
    v8->_configurations = (NSArray *)v11;

  }
  return v8;
}

- (NSString)identifier
{
  return (NSString *)(id)-[NSString copy](self->_identifier, "copy");
}

- (NSArray)controlConfigurations
{
  return (NSArray *)(id)-[NSArray copy](self->_configurations, "copy");
}

- (id)controlConfigurationsForApplicationContainerBundleIdentifier:(id)a3
{
  id v4;
  NSArray *configurations;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  configurations = self->_configurations;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93___CHSControlConfigurationHost_controlConfigurationsForApplicationContainerBundleIdentifier___block_invoke;
  v11[3] = &unk_1E2A5AFE0;
  v7 = v4;
  v12 = v7;
  objc_msgSend(v6, "predicateWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](configurations, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_CHSControlConfigurationHost initWithIdentifier:configurations:]([_CHSControlConfigurationHost alloc], "initWithIdentifier:configurations:", self->_identifier, self->_configurations);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
