@implementation VSUserAccount

- (VSUserAccount)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

+ (VSUserAccount)new
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The %@ initializer is not available."), v4);

  return 0;
}

- (VSUserAccount)initWithAccountType:(VSUserAccountType)accountType updateURL:(NSURL *)url
{
  NSURL *v6;
  VSUserAccount *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = url;
  v13.receiver = self;
  v13.super_class = (Class)VSUserAccount;
  v7 = -[VSUserAccount init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("VSUserAccount initialized without a bundle."));
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    commonInit_0(v7, accountType, v6, 0, v11);
  }

  return v7;
}

- (VSUserAccount)initWithAccountType:(int64_t)a3 updateURL:(id)a4 sourceType:(int64_t)a5 sourceIdentifier:(id)a6
{
  id v10;
  id v11;
  VSUserAccount *v12;
  VSUserAccount *v13;
  objc_super v15;

  v10 = a4;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)VSUserAccount;
  v12 = -[VSUserAccount init](&v15, sel_init);
  v13 = v12;
  if (v12)
    commonInit_0(v12, a3, v10, (void *)a5, v11);

  return v13;
}

- (void)setTierIdentifiers:(NSArray *)tierIdentifiers
{
  NSArray *v4;
  NSArray *v5;

  v4 = (NSArray *)-[NSArray copy](tierIdentifiers, "copy");
  v5 = self->_tierIdentifiers;
  self->_tierIdentifiers = v4;

}

- (void)setDeviceIdentifier:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  -[VSUserAccount deviceIdentifier](self, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_storeStrong((id *)&self->_deviceIdentifier, a3);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VSUserAccount)initWithCoder:(id)a3
{
  id v4;
  VSUserAccount *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  VSUserAccount *v25;
  NSObject *v26;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  v5 = -[VSUserAccount initWithAccountType:updateURL:sourceType:sourceIdentifier:](self, "initWithAccountType:updateURL:sourceType:sourceIdentifier:", 0, 0, 0, &stru_1E93A8CC0);
  if (!v5)
  {
LABEL_6:
    v25 = v5;
    goto LABEL_10;
  }
  -[VSUserAccount setSourceType:](v5, "setSourceType:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("sourceType")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[VSUserAccount setSourceIdentifier:](v5, "setSourceIdentifier:", v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fromCurrentDevice"));
    if (v8)
      -[VSUserAccount setDeviceIdentifier:](v5, "setDeviceIdentifier:", v8);
    -[VSUserAccount setDeviceCategory:](v5, "setDeviceCategory:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("deviceCategory")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keychainItemHash"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setKeychainItemHash:](v5, "setKeychainItemHash:", objc_msgSend(v10, "unsignedIntegerValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setUpdateURL:](v5, "setUpdateURL:", v11);

    -[VSUserAccount setRequiresSystemTrust:](v5, "setRequiresSystemTrust:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresSystemTrust")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountProviderIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setAccountProviderIdentifier:](v5, "setAccountProviderIdentifier:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setIdentifier:](v5, "setIdentifier:", v13);

    -[VSUserAccount setAccountType:](v5, "setAccountType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accountType")));
    -[VSUserAccount setSignedOut:](v5, "setSignedOut:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("signedOut")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionBillingCycleEndDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setSubscriptionBillingCycleEndDate:](v5, "setSubscriptionBillingCycleEndDate:", v14);

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("tierIdentifiers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setTierIdentifiers:](v5, "setTierIdentifiers:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setBillingIdentifier:](v5, "setBillingIdentifier:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationData"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setAuthenticationData:](v5, "setAuthenticationData:", v17);

    -[VSUserAccount setFromCurrentDevice:](v5, "setFromCurrentDevice:", v9);
    -[VSUserAccount setIsDeveloperCreated:](v5, "setIsDeveloperCreated:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("developerCreated")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("created"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setCreated:](v5, "setCreated:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modified"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setModified:](v5, "setModified:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setDeviceName:](v5, "setDeviceName:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifierIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setModifierIdentifier:](v5, "setModifierIdentifier:", v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifierType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setModifierType:](v5, "setModifierType:", v22);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("api"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setApi:](v5, "setApi:", v23);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleSubscription"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSUserAccount setAppleSubscription:](v5, "setAppleSubscription:", v24);

    goto LABEL_6;
  }
  VSErrorLogObject();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    -[VSUserAccount initWithCoder:].cold.1(v26);

  v25 = 0;
LABEL_10:

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VSUserAccount sourceType](self, "sourceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt:forKey:", objc_msgSend(v5, "intValue"), CFSTR("sourceType"));

  -[VSUserAccount sourceIdentifier](self, "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sourceIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VSUserAccount deviceCategory](self, "deviceCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt:forKey:", objc_msgSend(v7, "intValue"), CFSTR("deviceCategory"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VSUserAccount keychainItemHash](self, "keychainItemHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("keychainItemHash"));

  -[VSUserAccount updateURL](self, "updateURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("updateURL"));

  objc_msgSend(v4, "encodeBool:forKey:", -[VSUserAccount requiresSystemTrust](self, "requiresSystemTrust"), CFSTR("requiresSystemTrust"));
  -[VSUserAccount accountProviderIdentifier](self, "accountProviderIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("accountProviderIdentifier"));

  -[VSUserAccount identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("identifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[VSUserAccount accountType](self, "accountType"), CFSTR("accountType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[VSUserAccount isSignedOut](self, "isSignedOut"), CFSTR("signedOut"));
  -[VSUserAccount subscriptionBillingCycleEndDate](self, "subscriptionBillingCycleEndDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("subscriptionBillingCycleEndDate"));

  -[VSUserAccount tierIdentifiers](self, "tierIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("tierIdentifiers"));

  -[VSUserAccount billingIdentifier](self, "billingIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("billingIdentifier"));

  -[VSUserAccount authenticationData](self, "authenticationData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("authenticationData"));

  objc_msgSend(v4, "encodeBool:forKey:", -[VSUserAccount isFromCurrentDevice](self, "isFromCurrentDevice"), CFSTR("fromCurrentDevice"));
  objc_msgSend(v4, "encodeBool:forKey:", -[VSUserAccount isDeveloperCreated](self, "isDeveloperCreated"), CFSTR("developerCreated"));
  -[VSUserAccount created](self, "created");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("created"));

  -[VSUserAccount modified](self, "modified");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("modified"));

  -[VSUserAccount deviceIdentifier](self, "deviceIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("deviceIdentifier"));

  -[VSUserAccount deviceName](self, "deviceName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("deviceName"));

  -[VSUserAccount modifierIdentifier](self, "modifierIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("modifierIdentifier"));

  -[VSUserAccount modifierType](self, "modifierType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("modifierType"));

  -[VSUserAccount api](self, "api");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("api"));

  -[VSUserAccount appleSubscription](self, "appleSubscription");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("appleSubscription"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[VSUserAccount componentsForPrinting:](self, "componentsForPrinting:", CFSTR(" = "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)VSUserAccount;
  -[VSUserAccount description](&v9, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[VSUserAccount sourceIdentifier](self, "sourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VSUserAccount sourceType](self, "sourceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[VSUserAccount deviceIdentifier](self, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ v4 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  VSUserAccount *v4;
  VSUserAccount *v5;
  VSUserAccount *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  VSUserAccount *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  char v17;

  v4 = (VSUserAccount *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v17 = 1;
  }
  else if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "raise:format:", v8, CFSTR("Unexpectedly, object was %@, instead of VSUserAccount."), v10);

      }
      v11 = v6;
      -[VSUserAccount sourceIdentifier](self, "sourceIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSUserAccount sourceIdentifier](v11, "sourceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v13)
        && (v14 = -[VSUserAccount sourceType](self, "sourceType"), v14 == -[VSUserAccount sourceType](v11, "sourceType")))
      {
        -[VSUserAccount deviceIdentifier](self, "deviceIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSUserAccount deviceIdentifier](v11, "deviceIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSUserAccount *v4;
  VSUserAccountType v5;
  void *v6;
  int64_t v7;
  void *v8;
  VSUserAccount *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = [VSUserAccount alloc];
  v5 = -[VSUserAccount accountType](self, "accountType");
  -[VSUserAccount updateURL](self, "updateURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VSUserAccount sourceType](self, "sourceType");
  -[VSUserAccount sourceIdentifier](self, "sourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VSUserAccount initWithAccountType:updateURL:sourceType:sourceIdentifier:](v4, "initWithAccountType:updateURL:sourceType:sourceIdentifier:", v5, v6, v7, v8);

  -[VSUserAccount setDeviceCategory:](v9, "setDeviceCategory:", -[VSUserAccount deviceCategory](self, "deviceCategory"));
  -[VSUserAccount setKeychainItemHash:](v9, "setKeychainItemHash:", -[VSUserAccount keychainItemHash](self, "keychainItemHash"));
  -[VSUserAccount setRequiresSystemTrust:](v9, "setRequiresSystemTrust:", -[VSUserAccount requiresSystemTrust](self, "requiresSystemTrust"));
  -[VSUserAccount accountProviderIdentifier](self, "accountProviderIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setAccountProviderIdentifier:](v9, "setAccountProviderIdentifier:", v10);

  -[VSUserAccount identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setIdentifier:](v9, "setIdentifier:", v11);

  -[VSUserAccount setSignedOut:](v9, "setSignedOut:", -[VSUserAccount isSignedOut](self, "isSignedOut"));
  -[VSUserAccount subscriptionBillingCycleEndDate](self, "subscriptionBillingCycleEndDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setSubscriptionBillingCycleEndDate:](v9, "setSubscriptionBillingCycleEndDate:", v12);

  -[VSUserAccount tierIdentifiers](self, "tierIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setTierIdentifiers:](v9, "setTierIdentifiers:", v13);

  -[VSUserAccount billingIdentifier](self, "billingIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setBillingIdentifier:](v9, "setBillingIdentifier:", v14);

  -[VSUserAccount authenticationData](self, "authenticationData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setAuthenticationData:](v9, "setAuthenticationData:", v15);

  -[VSUserAccount setIsDeveloperCreated:](v9, "setIsDeveloperCreated:", -[VSUserAccount isDeveloperCreated](self, "isDeveloperCreated"));
  -[VSUserAccount created](self, "created");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setCreated:](v9, "setCreated:", v16);

  -[VSUserAccount modified](self, "modified");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setModified:](v9, "setModified:", v17);

  -[VSUserAccount deviceIdentifier](self, "deviceIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setDeviceIdentifier:](v9, "setDeviceIdentifier:", v18);

  -[VSUserAccount deviceName](self, "deviceName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setDeviceName:](v9, "setDeviceName:", v19);

  -[VSUserAccount modifierIdentifier](self, "modifierIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setModifierIdentifier:](v9, "setModifierIdentifier:", v20);

  -[VSUserAccount modifierType](self, "modifierType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setModifierType:](v9, "setModifierType:", v21);

  -[VSUserAccount api](self, "api");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setApi:](v9, "setApi:", v22);

  -[VSUserAccount appleSubscription](self, "appleSubscription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setAppleSubscription:](v9, "setAppleSubscription:", v23);

  return v9;
}

- (void)setCreated:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *created;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (NSDate *)v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  created = self->_created;
  self->_created = v5;

}

- (void)setModified:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *modified;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (NSDate *)v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  modified = self->_modified;
  self->_modified = v5;

}

- (id)componentsForPrinting:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[VSUserAccount sourceIdentifier](self, "sourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("sourceIdentifier"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%ld"), CFSTR("sourceType"), v5, -[VSUserAccount sourceType](self, "sourceType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%ld"), CFSTR("deviceCategory"), v5, -[VSUserAccount deviceCategory](self, "deviceCategory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%ld"), CFSTR("keychainItemHash"), v5, -[VSUserAccount keychainItemHash](self, "keychainItemHash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[VSUserAccount updateURL](self, "updateURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("updateURL"), v5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v15);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%d"), CFSTR("requiresSystemTrust"), v5, -[VSUserAccount requiresSystemTrust](self, "requiresSystemTrust"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[VSUserAccount accountProviderIdentifier](self, "accountProviderIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("accountProviderIdentifier"), v5, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v19);

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[VSUserAccount identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("identifier"), v5, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v22);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%ld"), CFSTR("accountType"), v5, -[VSUserAccount accountType](self, "accountType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v23);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%d"), CFSTR("signedOut"), v5, -[VSUserAccount isSignedOut](self, "isSignedOut"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v24);

  v25 = (void *)MEMORY[0x1E0CB3940];
  -[VSUserAccount subscriptionBillingCycleEndDate](self, "subscriptionBillingCycleEndDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("subscriptionBillingCycleEndDate"), v5, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v27);

  v28 = (void *)MEMORY[0x1E0CB3940];
  -[VSUserAccount tierIdentifiers](self, "tierIdentifiers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("tierIdentifiers"), v5, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v30);

  v31 = (void *)MEMORY[0x1E0CB3940];
  -[VSUserAccount billingIdentifier](self, "billingIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("billingIdentifier"), v5, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v33);

  v34 = (void *)MEMORY[0x1E0CB3940];
  -[VSUserAccount authenticationData](self, "authenticationData");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("authenticationData"), v5, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v36);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%d"), CFSTR("isFromCurrentDevice"), v5, -[VSUserAccount isFromCurrentDevice](self, "isFromCurrentDevice"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v37);

  v38 = (void *)MEMORY[0x1E0CB3940];
  -[VSUserAccount created](self, "created");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("created"), v5, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v40);

  v41 = (void *)MEMORY[0x1E0CB3940];
  -[VSUserAccount modified](self, "modified");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("modified"), v5, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v43);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%d"), CFSTR("isDeveloperCreated"), v5, -[VSUserAccount isDeveloperCreated](self, "isDeveloperCreated"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v44);

  v45 = (void *)MEMORY[0x1E0CB3940];
  -[VSUserAccount appleSubscription](self, "appleSubscription");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("appleSubscription"), v5, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v47);
  return v6;
}

+ (int64_t)deviceCategoryFromDeviceType:(unint64_t)a3
{
  return a3 - 4 < 0xFFFFFFFFFFFFFFFDLL;
}

- (id)prettyPrint
{
  void *v2;
  void *v3;

  -[VSUserAccount componentsForPrinting:](self, "componentsForPrinting:", CFSTR(": "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)updateURL
{
  return self->_updateURL;
}

- (void)setUpdateURL:(NSURL *)updateURL
{
  objc_setProperty_nonatomic_copy(self, a2, updateURL, 16);
}

- (BOOL)requiresSystemTrust
{
  return self->_requiresSystemTrust;
}

- (void)setRequiresSystemTrust:(BOOL)requiresSystemTrust
{
  self->_requiresSystemTrust = requiresSystemTrust;
}

- (NSString)accountProviderIdentifier
{
  return self->_accountProviderIdentifier;
}

- (void)setAccountProviderIdentifier:(NSString *)accountProviderIdentifier
{
  objc_storeStrong((id *)&self->_accountProviderIdentifier, accountProviderIdentifier);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(NSString *)identifier
{
  objc_setProperty_nonatomic_copy(self, a2, identifier, 32);
}

- (VSUserAccountType)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(VSUserAccountType)accountType
{
  self->_accountType = accountType;
}

- (BOOL)isSignedOut
{
  return self->_signedOut;
}

- (void)setSignedOut:(BOOL)signedOut
{
  self->_signedOut = signedOut;
}

- (NSDate)subscriptionBillingCycleEndDate
{
  return self->_subscriptionBillingCycleEndDate;
}

- (void)setSubscriptionBillingCycleEndDate:(NSDate *)subscriptionBillingCycleEndDate
{
  objc_setProperty_nonatomic_copy(self, a2, subscriptionBillingCycleEndDate, 48);
}

- (NSArray)tierIdentifiers
{
  return self->_tierIdentifiers;
}

- (NSString)billingIdentifier
{
  return self->_billingIdentifier;
}

- (void)setBillingIdentifier:(NSString *)billingIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, billingIdentifier, 64);
}

- (NSString)authenticationData
{
  return self->_authenticationData;
}

- (void)setAuthenticationData:(NSString *)authenticationData
{
  objc_setProperty_nonatomic_copy(self, a2, authenticationData, 72);
}

- (BOOL)isFromCurrentDevice
{
  return self->_fromCurrentDevice;
}

- (void)setFromCurrentDevice:(BOOL)a3
{
  self->_fromCurrentDevice = a3;
}

- (VSOriginatingDeviceCategory)deviceCategory
{
  return self->_deviceCategory;
}

- (void)setDeviceCategory:(int64_t)a3
{
  self->_deviceCategory = a3;
}

- (VSAppleSubscription)appleSubscription
{
  return self->_appleSubscription;
}

- (void)setAppleSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_appleSubscription, a3);
}

- (NSDate)created
{
  return self->_created;
}

- (NSDate)modified
{
  return self->_modified;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIdentifier, a3);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (unint64_t)keychainItemHash
{
  return self->_keychainItemHash;
}

- (void)setKeychainItemHash:(unint64_t)a3
{
  self->_keychainItemHash = a3;
}

- (BOOL)isDeveloperCreated
{
  return self->_isDeveloperCreated;
}

- (void)setIsDeveloperCreated:(BOOL)a3
{
  self->_isDeveloperCreated = a3;
}

- (NSString)modifierIdentifier
{
  return self->_modifierIdentifier;
}

- (void)setModifierIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modifierIdentifier, a3);
}

- (NSString)modifierType
{
  return self->_modifierType;
}

- (void)setModifierType:(id)a3
{
  objc_storeStrong((id *)&self->_modifierType, a3);
}

- (NSString)api
{
  return self->_api;
}

- (void)setApi:(id)a3
{
  objc_storeStrong((id *)&self->_api, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_api, 0);
  objc_storeStrong((id *)&self->_modifierType, 0);
  objc_storeStrong((id *)&self->_modifierIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_appleSubscription, 0);
  objc_storeStrong((id *)&self->_authenticationData, 0);
  objc_storeStrong((id *)&self->_billingIdentifier, 0);
  objc_storeStrong((id *)&self->_tierIdentifiers, 0);
  objc_storeStrong((id *)&self->_subscriptionBillingCycleEndDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accountProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_updateURL, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D2419000, log, OS_LOG_TYPE_FAULT, "Every VSUserAccount should have a sourceIdentifier", v1, 2u);
}

@end
