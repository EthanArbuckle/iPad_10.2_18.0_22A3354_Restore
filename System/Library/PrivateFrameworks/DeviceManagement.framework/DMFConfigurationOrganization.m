@implementation DMFConfigurationOrganization

- (DMFConfigurationOrganization)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMFConfigurationOrganization;
  return -[DMFConfigurationOrganization init](&v3, sel_init);
}

- (id)description
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("displayName");
  v6[2] = CFSTR("type");
  v6[3] = CFSTR("active");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DMFObjectDescriptionWithProperties(self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("displayName");
  v6[2] = CFSTR("type");
  v6[3] = CFSTR("active");
  v6[4] = CFSTR("registeredConfigurationSources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DMFObjectDescriptionWithProperties(self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFConfigurationOrganization)initWithCoder:(id)a3
{
  id v4;
  DMFConfigurationOrganization *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *displayName;
  void *v12;
  uint64_t v13;
  NSString *type;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *registeredConfigurationSources;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMFConfigurationOrganization;
  v5 = -[DMFConfigurationOrganization init](&v22, sel_init);
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("type"));
    v13 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("active"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_active = objc_msgSend(v15, "BOOLValue");

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("registeredConfigurationSources"));
    v19 = objc_claimAutoreleasedReturnValue();
    registeredConfigurationSources = v5->_registeredConfigurationSources;
    v5->_registeredConfigurationSources = (NSArray *)v19;

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
  -[DMFConfigurationOrganization identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[DMFConfigurationOrganization displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[DMFConfigurationOrganization type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFConfigurationOrganization active](self, "active"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("active"));

  -[DMFConfigurationOrganization registeredConfigurationSources](self, "registeredConfigurationSources");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("registeredConfigurationSources"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (NSArray)registeredConfigurationSources
{
  return self->_registeredConfigurationSources;
}

- (void)setRegisteredConfigurationSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredConfigurationSources, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
