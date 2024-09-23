@implementation NEDNSProxyProviderProtocol

- (NEDNSProxyProviderProtocol)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEDNSProxyProviderProtocol;
  return -[NEVPNProtocol initWithType:](&v3, sel_initWithType_, 6);
}

- (NEDNSProxyProviderProtocol)initWithPluginType:(id)a3
{
  id v4;
  NEDNSProxyProviderProtocol *v5;
  NEDNSProxyProviderProtocol *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NEDNSProxyProviderProtocol;
  v5 = -[NEVPNProtocol initWithType:](&v8, sel_initWithType_, 6);
  v6 = v5;
  if (v5)
    -[NEDNSProxyProviderProtocol setPluginType:](v5, "setPluginType:", v4);

  return v6;
}

- (NEDNSProxyProviderProtocol)initWithCoder:(id)a3
{
  id v4;
  NEDNSProxyProviderProtocol *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *providerConfiguration;
  uint64_t v15;
  NSString *providerBundleIdentifier;
  uint64_t v17;
  NSString *designatedRequirement;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NEDNSProxyProviderProtocol;
  v5 = -[NEVPNProtocol initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PluginType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEDNSProxyProviderProtocol setPluginType:](v5, "setPluginType:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("ProviderConfiguration"));
    v13 = objc_claimAutoreleasedReturnValue();
    providerConfiguration = v5->_providerConfiguration;
    v5->_providerConfiguration = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProviderBundleIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProviderDesignatedRequirement"));
    v17 = objc_claimAutoreleasedReturnValue();
    designatedRequirement = v5->_designatedRequirement;
    v5->_designatedRequirement = (NSString *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NEDNSProxyProviderProtocol;
  v4 = a3;
  -[NEVPNProtocol encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[NEDNSProxyProviderProtocol pluginType](self, "pluginType", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PluginType"));

  -[NEDNSProxyProviderProtocol providerConfiguration](self, "providerConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ProviderConfiguration"));

  -[NEDNSProxyProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ProviderBundleIdentifier"));

  -[NEDNSProxyProviderProtocol designatedRequirement](self, "designatedRequirement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ProviderDesignatedRequirement"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEDNSProxyProviderProtocol;
  v4 = -[NEVPNProtocol copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[NEDNSProxyProviderProtocol pluginType](self, "pluginType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPluginType:", v5);

  -[NEDNSProxyProviderProtocol providerConfiguration](self, "providerConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProviderConfiguration:", v6);

  -[NEDNSProxyProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProviderBundleIdentifier:", v7);

  -[NEDNSProxyProviderProtocol designatedRequirement](self, "designatedRequirement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDesignatedRequirement:", v8);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NEDNSProxyProviderProtocol pluginType](self, "pluginType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing plugin type"), v4);

  return v5 != 0;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v15.receiver = self;
  v15.super_class = (Class)NEDNSProxyProviderProtocol;
  -[NEVPNProtocol descriptionWithIndent:options:](&v15, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  -[NEDNSProxyProviderProtocol pluginType](self, "pluginType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("pluginType"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEDNSProxyProviderProtocol providerConfiguration](self, "providerConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  a4 |= 8uLL;
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("providerConfiguration"), v5, a4);

  -[NEDNSProxyProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("providerBundleIdentifier"), v5, a4);

  -[NEDNSProxyProviderProtocol designatedRequirement](self, "designatedRequirement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("designatedRequirement"), v5, a4);

  return v9;
}

- (NSDictionary)providerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration
{
  objc_setProperty_atomic_copy(self, a2, providerConfiguration, 176);
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier
{
  objc_setProperty_atomic_copy(self, a2, providerBundleIdentifier, 184);
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setPluginType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (NSString)designatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDesignatedRequirement:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_designatedRequirement, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_providerConfiguration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
