@implementation MDMProvisioningProfile

- (MDMProvisioningProfile)initWithProfile:(void *)a3
{
  MDMProvisioningProfile *v4;
  uint64_t v5;
  NSString *uuid;
  void *v7;
  uint64_t v8;
  NSString *allowedAppIDEntitlement;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MDMProvisioningProfile;
  v4 = -[MDMProvisioningProfile init](&v11, sel_init);
  if (v4)
  {
    if (a3)
    {
      v5 = objc_msgSend((id)MISProvisioningProfileGetUUID(), "copy");
      uuid = v4->_uuid;
      v4->_uuid = (NSString *)v5;

      objc_msgSend((id)MISProvisioningProfileGetEntitlements(), "valueForKey:", CFSTR("application-identifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      allowedAppIDEntitlement = v4->_allowedAppIDEntitlement;
      v4->_allowedAppIDEntitlement = (NSString *)v8;

      v4->_isAppleInternal = MISProvisioningProfileIsAppleInternalProfile() != 0;
      v4->_isBeta = MISProvisioningProfileGrantsEntitlement() != 0;
      v4->_isFreePP = MISProvisioningProfileIsForLocalProvisioning() != 0;
      v4->_isUniversalPP = MISProvisioningProfileProvisionsAllDevices() != 0;
    }
    else
    {
      NSLog(CFSTR("MDMProvisioningProfile cannot init a nil provisioning profile reference"));
    }
  }
  return v4;
}

- (BOOL)allowsAppIDEntitlement:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;

  v4 = a3;
  if (-[MDMProvisioningProfile isAppleInternal](self, "isAppleInternal"))
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "length")
         && (-[MDMProvisioningProfile allowedAppIDEntitlement](self, "allowedAppIDEntitlement"),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             v7 = objc_msgSend(v6, "length"),
             v6,
             v7))
  {
    -[MDMProvisioningProfile allowedAppIDEntitlement](self, "allowedAppIDEntitlement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasSuffix:", CFSTR("*"));

    -[MDMProvisioningProfile allowedAppIDEntitlement](self, "allowedAppIDEntitlement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v12 = objc_msgSend(v10, "length");
      v13 = v12 - objc_msgSend(CFSTR("*"), "length");

      -[MDMProvisioningProfile allowedAppIDEntitlement](self, "allowedAppIDEntitlement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "substringToIndex:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v4, "hasPrefix:", v11);
    }
    else
    {
      v15 = objc_msgSend(v4, "isEqualToString:", v10);
    }
    v5 = v15;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)allowedAppIDEntitlement
{
  return self->_allowedAppIDEntitlement;
}

- (BOOL)isAppleInternal
{
  return self->_isAppleInternal;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (BOOL)isFreePP
{
  return self->_isFreePP;
}

- (BOOL)isUniversalPP
{
  return self->_isUniversalPP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedAppIDEntitlement, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
