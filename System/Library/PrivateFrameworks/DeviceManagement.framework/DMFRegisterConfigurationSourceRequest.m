@implementation DMFRegisterConfigurationSourceRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4C40;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFRegisterConfigurationSourceRequest)initWithCoder:(id)a3
{
  id v4;
  DMFRegisterConfigurationSourceRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *configurationSourceName;
  void *v9;
  uint64_t v10;
  NSString *organizationIdentifier;
  void *v12;
  uint64_t v13;
  NSString *machServiceName;
  void *v15;
  uint64_t v16;
  NSXPCListenerEndpoint *listenerEndpoint;
  void *v18;
  uint64_t v19;
  DMFReportingRequirements *reportingRequirements;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMFRegisterConfigurationSourceRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("configurationSourceName"));
    v7 = objc_claimAutoreleasedReturnValue();
    configurationSourceName = v5->_configurationSourceName;
    v5->_configurationSourceName = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("organizationIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("machServiceName"));
    v13 = objc_claimAutoreleasedReturnValue();
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("listenerEndpoint"));
    v16 = objc_claimAutoreleasedReturnValue();
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("reportingRequirements"));
    v19 = objc_claimAutoreleasedReturnValue();
    reportingRequirements = v5->_reportingRequirements;
    v5->_reportingRequirements = (DMFReportingRequirements *)v19;

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
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DMFRegisterConfigurationSourceRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[DMFRegisterConfigurationSourceRequest configurationSourceName](self, "configurationSourceName", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("configurationSourceName"));

  -[DMFRegisterConfigurationSourceRequest organizationIdentifier](self, "organizationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("organizationIdentifier"));

  -[DMFRegisterConfigurationSourceRequest machServiceName](self, "machServiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("machServiceName"));

  -[DMFRegisterConfigurationSourceRequest listenerEndpoint](self, "listenerEndpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("listenerEndpoint"));

  -[DMFRegisterConfigurationSourceRequest reportingRequirements](self, "reportingRequirements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("reportingRequirements"));

}

- (NSString)configurationSourceName
{
  return self->_configurationSourceName;
}

- (void)setConfigurationSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_listenerEndpoint, a3);
}

- (DMFReportingRequirements)reportingRequirements
{
  return self->_reportingRequirements;
}

- (void)setReportingRequirements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingRequirements, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationSourceName, 0);
}

@end
