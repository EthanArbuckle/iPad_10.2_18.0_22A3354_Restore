@implementation FBSApplicationProvisioningProfile

- (FBSApplicationProvisioningProfile)initWithSignerIdentity:(id)a3 profile:(id)a4
{
  id v6;
  id v7;
  FBSApplicationProvisioningProfile *v8;
  uint64_t v9;
  NSString *signerIdentity;
  uint64_t v11;
  NSDate *expirationDate;
  void *v13;
  uint64_t v14;
  NSString *allowedApplicationIdentifierEntitlement;
  const __CFBoolean *Value;
  const __CFBoolean *v17;
  CFTypeID v18;
  uint64_t v19;
  NSString *UUID;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)FBSApplicationProvisioningProfile;
  v8 = -[FBSApplicationProvisioningProfile init](&v22, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    signerIdentity = v8->_signerIdentity;
    v8->_signerIdentity = (NSString *)v9;

    soft_MISProvisioningProfileGetExpirationDate((uint64_t)v7);
    v11 = objc_claimAutoreleasedReturnValue();
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v11;

    objc_msgSend((id)soft_MISProvisioningProfileGetEntitlements((uint64_t)v7), "valueForKey:", CFSTR("application-identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    allowedApplicationIdentifierEntitlement = v8->_allowedApplicationIdentifierEntitlement;
    v8->_allowedApplicationIdentifierEntitlement = (NSString *)v14;

    v8->_appleInternalProfile = soft_MISProvisioningProfileIsAppleInternalProfile((uint64_t)v7) != 0;
    v8->_beta = soft_MISProvisioningProfileGrantsEntitlement((uint64_t)v7, (uint64_t)CFSTR("beta-reports-active"), *MEMORY[0x1E0C9AE50]) != 0;
    Value = (const __CFBoolean *)soft_MISProfileGetValue((uint64_t)v7, (uint64_t)CFSTR("LocalProvision"));
    if (Value)
    {
      v17 = Value;
      v18 = CFGetTypeID(Value);
      if (v18 == CFBooleanGetTypeID())
        v8->_freeDeveloperProfile = CFBooleanGetValue(v17) != 0;
    }
    v8->_provisionsAllDevices = soft_MISProvisioningProfileProvisionsAllDevices((uint64_t)v7) != 0;
    v19 = objc_msgSend((id)soft_MISProvisioningProfileGetUUID((uint64_t)v7), "copy");
    UUID = v8->_UUID;
    v8->_UUID = (NSString *)v19;

  }
  return v8;
}

- (BOOL)allowsApplicationIdentifierEntitlement:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[FBSApplicationProvisioningProfile isAppleInternalProfile](self, "isAppleInternalProfile"))
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "length") && -[NSString length](self->_allowedApplicationIdentifierEntitlement, "length"))
  {
    if (-[NSString hasSuffix:](self->_allowedApplicationIdentifierEntitlement, "hasSuffix:", CFSTR("*")))
    {
      -[NSString substringToIndex:](self->_allowedApplicationIdentifierEntitlement, "substringToIndex:", -[NSString length](self->_allowedApplicationIdentifierEntitlement, "length")- objc_msgSend(CFSTR("*"), "length"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "hasPrefix:", v6);

    }
    else
    {
      v5 = objc_msgSend(v4, "isEqualToString:", self->_allowedApplicationIdentifierEntitlement);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  return -[FBSApplicationProvisioningProfile descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSApplicationProvisioningProfile succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSApplicationProvisioningProfile descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[FBSApplicationProvisioningProfile succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_signerIdentity, CFSTR("signerIdentity"));
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", self->_expirationDate, 3, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v6, CFSTR("expirationDate"), 1);

  return v4;
}

- (NSString)signerIdentity
{
  return self->_signerIdentity;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)isAppleInternalProfile
{
  return self->_appleInternalProfile;
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (BOOL)isFreeDeveloperProfile
{
  return self->_freeDeveloperProfile;
}

- (BOOL)provisionsAllDevices
{
  return self->_provisionsAllDevices;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_signerIdentity, 0);
  objc_storeStrong((id *)&self->_allowedApplicationIdentifierEntitlement, 0);
}

@end
