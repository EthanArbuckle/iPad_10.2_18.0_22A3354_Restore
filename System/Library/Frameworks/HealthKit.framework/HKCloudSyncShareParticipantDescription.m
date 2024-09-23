@implementation HKCloudSyncShareParticipantDescription

- (HKCloudSyncShareParticipantDescription)initWithIdentity:(id)a3 role:(id)a4 acceptanceStatus:(id)a5 permission:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKCloudSyncShareParticipantDescription *v14;
  uint64_t v15;
  NSString *identity;
  uint64_t v17;
  NSString *role;
  uint64_t v19;
  NSString *acceptanceStatus;
  uint64_t v21;
  NSString *permission;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKCloudSyncShareParticipantDescription;
  v14 = -[HKCloudSyncShareParticipantDescription init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identity = v14->_identity;
    v14->_identity = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    role = v14->_role;
    v14->_role = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    acceptanceStatus = v14->_acceptanceStatus;
    v14->_acceptanceStatus = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    permission = v14->_permission;
    v14->_permission = (NSString *)v21;

  }
  return v14;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Identity: %@, Role: %@, Status: %@, Permission: %@"), self->_identity, self->_role, self->_acceptanceStatus, self->_permission);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identity;
  id v5;

  identity = self->_identity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identity, CFSTR("Identity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_role, CFSTR("Role"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_acceptanceStatus, CFSTR("AcceptanceStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_permission, CFSTR("Permission"));

}

- (HKCloudSyncShareParticipantDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKCloudSyncShareParticipantDescription *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Role"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AcceptanceStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Permission"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HKCloudSyncShareParticipantDescription initWithIdentity:role:acceptanceStatus:permission:](self, "initWithIdentity:role:acceptanceStatus:permission:", v5, v6, v7, v8);
  return v9;
}

- (NSString)identity
{
  return self->_identity;
}

- (NSString)role
{
  return self->_role;
}

- (NSString)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (NSString)permission
{
  return self->_permission;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permission, 0);
  objc_storeStrong((id *)&self->_acceptanceStatus, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
