@implementation LSSettingsStoreConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSSettingsStoreConfiguration)initWithEndpoint:(id)a3
{
  id v5;
  LSSettingsStoreConfiguration *v6;
  LSSettingsStoreConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSSettingsStoreConfiguration;
  v6 = -[LSSettingsStoreConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_endpoint, a3);

  return v7;
}

- (LSSettingsStoreConfiguration)initWithCoder:(id)a3
{
  id v4;
  LSSettingsStoreConfiguration *v5;
  uint64_t v6;
  NSXPCListenerEndpoint *endpoint;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSSettingsStoreConfiguration;
  v5 = -[LSSettingsStoreConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
    v6 = objc_claimAutoreleasedReturnValue();
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSXPCListenerEndpoint *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_endpoint, CFSTR("endpoint"));
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
