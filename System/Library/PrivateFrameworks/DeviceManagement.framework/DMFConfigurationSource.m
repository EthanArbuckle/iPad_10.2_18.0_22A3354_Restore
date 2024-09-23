@implementation DMFConfigurationSource

- (DMFConfigurationSource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMFConfigurationSource;
  return -[DMFConfigurationSource init](&v3, sel_init);
}

- (id)description
{
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("displayName");
  v6[2] = CFSTR("machServiceName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DMFObjectDescriptionWithProperties(self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("displayName");
  v6[2] = CFSTR("machServiceName");
  v6[3] = CFSTR("reportingRequirements");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DMFObjectDescriptionWithProperties(self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFConfigurationSource)initWithCoder:(id)a3
{
  id v4;
  DMFConfigurationSource *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *displayName;
  void *v12;
  uint64_t v13;
  NSString *organizationIdentifier;
  void *v15;
  uint64_t v16;
  NSString *machServiceName;
  void *v18;
  uint64_t v19;
  DMFReportingRequirements *reportingRequirements;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMFConfigurationSource;
  v5 = -[DMFConfigurationSource init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("displayName"));
    v10 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("organizationIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("machServiceName"));
    v16 = objc_claimAutoreleasedReturnValue();
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v16;

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
  id v9;

  v4 = a3;
  -[DMFConfigurationSource identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[DMFConfigurationSource displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[DMFConfigurationSource organizationIdentifier](self, "organizationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("organizationIdentifier"));

  -[DMFConfigurationSource machServiceName](self, "machServiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("machServiceName"));

  -[DMFConfigurationSource reportingRequirements](self, "reportingRequirements");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("reportingRequirements"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
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

- (DMFReportingRequirements)reportingRequirements
{
  return self->_reportingRequirements;
}

- (void)setReportingRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_reportingRequirements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingRequirements, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
