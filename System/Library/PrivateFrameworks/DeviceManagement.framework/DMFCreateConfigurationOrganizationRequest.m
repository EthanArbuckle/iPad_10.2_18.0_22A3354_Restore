@implementation DMFCreateConfigurationOrganizationRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF47A8;
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

- (DMFCreateConfigurationOrganizationRequest)initWithCoder:(id)a3
{
  id v4;
  DMFCreateConfigurationOrganizationRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *organizationType;
  void *v9;
  uint64_t v10;
  NSString *organizationIdentifier;
  void *v12;
  uint64_t v13;
  NSString *organizationDisplayName;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMFCreateConfigurationOrganizationRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("organizationType"));
    v7 = objc_claimAutoreleasedReturnValue();
    organizationType = v5->_organizationType;
    v5->_organizationType = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("organizationIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("organizationDisplayName"));
    v13 = objc_claimAutoreleasedReturnValue();
    organizationDisplayName = v5->_organizationDisplayName;
    v5->_organizationDisplayName = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMFCreateConfigurationOrganizationRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[DMFCreateConfigurationOrganizationRequest organizationType](self, "organizationType", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("organizationType"));

  -[DMFCreateConfigurationOrganizationRequest organizationIdentifier](self, "organizationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("organizationIdentifier"));

  -[DMFCreateConfigurationOrganizationRequest organizationDisplayName](self, "organizationDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("organizationDisplayName"));

}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)organizationDisplayName
{
  return self->_organizationDisplayName;
}

- (void)setOrganizationDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)organizationType
{
  return self->_organizationType;
}

- (void)setOrganizationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationType, 0);
  objc_storeStrong((id *)&self->_organizationDisplayName, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end
