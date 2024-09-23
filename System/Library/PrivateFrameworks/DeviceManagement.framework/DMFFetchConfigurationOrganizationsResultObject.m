@implementation DMFFetchConfigurationOrganizationsResultObject

- (id)description
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("organizationsByIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DMFObjectDescriptionWithProperties(self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchConfigurationOrganizationsResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchConfigurationOrganizationsResultObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *organizationsByIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFFetchConfigurationOrganizationsResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("organizationsByIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    organizationsByIdentifier = v5->_organizationsByIdentifier;
    v5->_organizationsByIdentifier = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchConfigurationOrganizationsResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchConfigurationOrganizationsResultObject organizationsByIdentifier](self, "organizationsByIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("organizationsByIdentifier"));

}

- (NSDictionary)organizationsByIdentifier
{
  return self->_organizationsByIdentifier;
}

- (void)setOrganizationsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_organizationsByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationsByIdentifier, 0);
}

@end
