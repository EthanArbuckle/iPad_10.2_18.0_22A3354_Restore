@implementation CPSRestrictedAccessRequest

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_restrictionType, CFSTR("restrictionType"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_approversAppleAccountAltDSIDs, CFSTR("approversAppleAccountAltDSIDs"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSRestrictedAccessRequest)initWithCoder:(id)a3
{
  id v4;
  CPSRestrictedAccessRequest *v5;
  void *v6;
  uint64_t v7;
  NSArray *approversAppleAccountAltDSIDs;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSRestrictedAccessRequest;
  v5 = -[CPSRestrictedAccessRequest init](&v10, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v6, CFSTR("approversAppleAccountAltDSIDs"));
    v7 = objc_claimAutoreleasedReturnValue();
    approversAppleAccountAltDSIDs = v5->_approversAppleAccountAltDSIDs;
    v5->_approversAppleAccountAltDSIDs = (NSArray *)v7;

    v5->_restrictionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("restrictionType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *approversAppleAccountAltDSIDs;
  id v5;

  approversAppleAccountAltDSIDs = self->_approversAppleAccountAltDSIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", approversAppleAccountAltDSIDs, CFSTR("approversAppleAccountAltDSIDs"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_restrictionType, CFSTR("restrictionType"));

}

- (CPSRestrictedAccessRequest)initWithXPCDictionary:(id)a3
{
  id v4;
  CPSRestrictedAccessRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *approversAppleAccountAltDSIDs;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPSRestrictedAccessRequest;
  v5 = -[CPSRestrictedAccessRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE0BEC8], "coderWithMessage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeCollectionOfClass:containingClass:forKey:", v7, v8, CFSTR("approversAppleAccountAltDSIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    approversAppleAccountAltDSIDs = v5->_approversAppleAccountAltDSIDs;
    v5->_approversAppleAccountAltDSIDs = (NSArray *)v9;

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restrictionType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_restrictionType = objc_msgSend(v11, "integerValue");

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE0BEC8], "coderWithMessage:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_approversAppleAccountAltDSIDs, CFSTR("approversAppleAccountAltDSIDs"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_restrictionType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("restrictionType"));

}

- (int64_t)authType
{
  return 10;
}

- (int64_t)restrictionType
{
  return self->_restrictionType;
}

- (void)setRestrictionType:(int64_t)a3
{
  self->_restrictionType = a3;
}

- (NSArray)approversAppleAccountAltDSIDs
{
  return self->_approversAppleAccountAltDSIDs;
}

- (void)setApproversAppleAccountAltDSIDs:(id)a3
{
  objc_storeStrong((id *)&self->_approversAppleAccountAltDSIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_approversAppleAccountAltDSIDs, 0);
}

@end
