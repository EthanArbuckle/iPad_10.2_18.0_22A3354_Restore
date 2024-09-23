@implementation MCProfileInfo

- (MCProfileInfo)initWithProfile:(id)a3
{
  id v4;
  MCProfileInfo *v5;
  uint64_t v6;
  NSString *friendlyName;
  uint64_t v8;
  NSString *profileDescription;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *UUID;
  uint64_t v14;
  NSString *organization;
  uint64_t v16;
  NSDate *expiryDate;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCProfileInfo;
  v5 = -[MCProfileInfo init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "friendlyName");
    v6 = objc_claimAutoreleasedReturnValue();
    friendlyName = v5->_friendlyName;
    v5->_friendlyName = (NSString *)v6;

    objc_msgSend(v4, "profileDescription");
    v8 = objc_claimAutoreleasedReturnValue();
    profileDescription = v5->_profileDescription;
    v5->_profileDescription = (NSString *)v8;

    objc_msgSend(v4, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "UUID");
    v12 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v12;

    objc_msgSend(v4, "organization");
    v14 = objc_claimAutoreleasedReturnValue();
    organization = v5->_organization;
    v5->_organization = (NSString *)v14;

    objc_msgSend(v4, "expiryDate");
    v16 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v16;

    objc_msgSend(v4, "installOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("isInstalledByDeclarativeManagement"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isInstalledByDeclarativeManagement = objc_msgSend(v19, "BOOLValue");

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *friendlyName;
  id v5;
  id v6;

  friendlyName = self->_friendlyName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", friendlyName, CFSTR("friendlyName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profileDescription, CFSTR("profileDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organization, CFSTR("organization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiryDate, CFSTR("expiryDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInstalledByDeclarativeManagement);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("isInstalledByDeclarativeManagement"));

}

- (MCProfileInfo)initWithCoder:(id)a3
{
  id v4;
  MCProfileInfo *v5;
  uint64_t v6;
  NSString *friendlyName;
  uint64_t v8;
  NSString *profileDescription;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *UUID;
  uint64_t v14;
  NSString *organization;
  uint64_t v16;
  NSDate *expiryDate;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MCProfileInfo;
  v5 = -[MCProfileInfo init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("friendlyName"));
    v6 = objc_claimAutoreleasedReturnValue();
    friendlyName = v5->_friendlyName;
    v5->_friendlyName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profileDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    profileDescription = v5->_profileDescription;
    v5->_profileDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v12 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organization"));
    v14 = objc_claimAutoreleasedReturnValue();
    organization = v5->_organization;
    v5->_organization = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiryDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isInstalledByDeclarativeManagement"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isInstalledByDeclarativeManagement = objc_msgSend(v18, "BOOLValue");

  }
  return v5;
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (void)setFriendlyName:(id)a3
{
  objc_storeStrong((id *)&self->_friendlyName, a3);
}

- (NSString)profileDescription
{
  return self->_profileDescription;
}

- (void)setProfileDescription:(id)a3
{
  objc_storeStrong((id *)&self->_profileDescription, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSString)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
  objc_storeStrong((id *)&self->_organization, a3);
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
  objc_storeStrong((id *)&self->_expiryDate, a3);
}

- (BOOL)isInstalledByDeclarativeManagement
{
  return self->_isInstalledByDeclarativeManagement;
}

- (void)setIsInstalledByDeclarativeManagement:(BOOL)a3
{
  self->_isInstalledByDeclarativeManagement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_profileDescription, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
}

@end
