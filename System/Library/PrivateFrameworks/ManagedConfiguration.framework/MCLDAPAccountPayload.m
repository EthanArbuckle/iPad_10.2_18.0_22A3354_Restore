@implementation MCLDAPAccountPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.ldap.account"));
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("LDAP_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("LDAP_ACCOUNT_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCLDAPAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCLDAPAccountPayload *v10;
  uint64_t v11;
  id v12;
  NSString *accountDescription;
  uint64_t v14;
  NSString *username;
  uint64_t v16;
  NSString *hostname;
  uint64_t v18;
  NSNumber *useSSLNum;
  uint64_t v20;
  NSArray *searchSettings;
  uint64_t v22;
  NSString *accountPersistentUUID;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSString *VPNUUID;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v49.receiver = self;
  v49.super_class = (Class)MCLDAPAccountPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v49, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_22;
  v48 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("LDAPAccountDescription"), 0, &v48);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v48;
  accountDescription = v10->_accountDescription;
  v10->_accountDescription = (NSString *)v11;

  if (v12)
    goto LABEL_13;
  v47 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("LDAPAccountUserName"), 0, &v47);
  v14 = objc_claimAutoreleasedReturnValue();
  v12 = v47;
  username = v10->_username;
  v10->_username = (NSString *)v14;

  if (v12)
    goto LABEL_13;
  v46 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("LDAPAccountHostName"), 1, &v46);
  v16 = objc_claimAutoreleasedReturnValue();
  v12 = v46;
  hostname = v10->_hostname;
  v10->_hostname = (NSString *)v16;

  if (v12)
    goto LABEL_13;
  v45 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("LDAPAccountUseSSL"), 0, &v45);
  v18 = objc_claimAutoreleasedReturnValue();
  v12 = v45;
  useSSLNum = v10->_useSSLNum;
  v10->_useSSLNum = (NSNumber *)v18;

  if (v12)
    goto LABEL_13;
  v10->_useSSL = -[NSNumber BOOLValue](v10->_useSSLNum, "BOOLValue");
  v44 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("LDAPSearchSettings"), 0, &v44);
  v20 = objc_claimAutoreleasedReturnValue();
  v12 = v44;
  searchSettings = v10->_searchSettings;
  v10->_searchSettings = (NSArray *)v20;

  if (v12)
    goto LABEL_13;
  if ((objc_msgSend(v9, "isStub") & 1) != 0)
  {
    v42 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("LDAPAccountPersistentUUID"), 0, &v42);
    v22 = objc_claimAutoreleasedReturnValue();
    v12 = v42;
    accountPersistentUUID = v10->_accountPersistentUUID;
    v10->_accountPersistentUUID = (NSString *)v22;

    if (v12)
    {
LABEL_13:
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (a5)
        *a5 = objc_retainAutorelease(v29);
      v31 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v32 = v31;
        v33 = (void *)objc_opt_class();
        v34 = v33;
        objc_msgSend(v30, "MCVerboseDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v33;
        v52 = 2114;
        v53 = v35;
        _os_log_impl(&dword_19ECC4000, v32, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v10 = 0;
      goto LABEL_18;
    }
    v41 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ACAccountIdentifier"), 0, &v41);
    v24 = objc_claimAutoreleasedReturnValue();
    v12 = v41;
    v25 = 152;
  }
  else
  {
    v43 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("LDAPAccountPassword"), 0, &v43);
    v24 = objc_claimAutoreleasedReturnValue();
    v12 = v43;
    v25 = 112;
  }
  v26 = *(Class *)((char *)&v10->super.super.isa + v25);
  *(Class *)((char *)&v10->super.super.isa + v25) = (Class)v24;

  if (v12)
    goto LABEL_13;
  v40 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("VPNUUID"), 0, &v40);
  v27 = objc_claimAutoreleasedReturnValue();
  v12 = v40;
  VPNUUID = v10->_VPNUUID;
  v10->_VPNUUID = (NSString *)v27;

  if (v12)
    goto LABEL_13;
LABEL_18:
  if (objc_msgSend(v8, "count"))
  {
    v36 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v37 = v36;
      -[MCPayload friendlyName](v10, "friendlyName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v38;
      v52 = 2114;
      v53 = v8;
      _os_log_impl(&dword_19ECC4000, v37, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_22:
  return v10;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  const __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCLDAPAccountPayload;
  -[MCPayload verboseDescription](&v7, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_accountDescription)
    objc_msgSend(v4, "appendFormat:", CFSTR("\naccountDescription: %@"), self->_accountDescription);
  if (self->_hostname)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nhostname: %@"), self->_hostname);
  if (self->_username)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nusername: %@"), self->_username);
  if (self->_password)
    objc_msgSend(v4, "appendFormat:", CFSTR("\npassword: (set)"));
  if (self->_useSSL)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("\nuseSSL: %@"), v5);
  if (self->_searchSettings)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nSearchSettings: %@"), self->_searchSettings);
  if (self->_accountPersistentUUID)
    objc_msgSend(v4, "appendFormat:", CFSTR("\naccountPersistentUUID: %@"), self->_accountPersistentUUID);
  if (self->_VPNUUID)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nVPNUUID: %@"), self->_VPNUUID);
  if (self->_acAccountIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nACAccount Identifier: %@"), self->_acAccountIdentifier);
  return v4;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSString *accountDescription;
  NSString *hostname;
  NSString *username;
  NSString *accountPersistentUUID;
  void *v9;
  NSArray *searchSettings;
  NSDictionary *communicationServiceRules;
  NSString *VPNUUID;
  NSString *acAccountIdentifier;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MCLDAPAccountPayload;
  -[MCPayload stubDictionary](&v15, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accountDescription = self->_accountDescription;
  if (accountDescription)
    objc_msgSend(v3, "setObject:forKey:", accountDescription, CFSTR("LDAPAccountDescription"));
  hostname = self->_hostname;
  if (hostname)
    objc_msgSend(v4, "setObject:forKey:", hostname, CFSTR("LDAPAccountHostName"));
  username = self->_username;
  if (username)
    objc_msgSend(v4, "setObject:forKey:", username, CFSTR("LDAPAccountUserName"));
  accountPersistentUUID = self->_accountPersistentUUID;
  if (accountPersistentUUID)
    objc_msgSend(v4, "setObject:forKey:", accountPersistentUUID, CFSTR("LDAPAccountPersistentUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useSSL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("LDAPAccountUseSSL"));

  searchSettings = self->_searchSettings;
  if (searchSettings)
    objc_msgSend(v4, "setObject:forKey:", searchSettings, CFSTR("LDAPSearchSettings"));
  communicationServiceRules = self->_communicationServiceRules;
  if (communicationServiceRules)
    objc_msgSend(v4, "setObject:forKey:", communicationServiceRules, CFSTR("CommunicationServiceRules"));
  VPNUUID = self->_VPNUUID;
  if (VPNUUID)
    objc_msgSend(v4, "setObject:forKey:", VPNUUID, CFSTR("VPNUUID"));
  acAccountIdentifier = self->_acAccountIdentifier;
  if (acAccountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", acAccountIdentifier, CFSTR("ACAccountIdentifier"));
  return v4;
}

- (id)restrictions
{
  void *v2;
  void *v3;

  -[MCLDAPAccountPayload communicationServiceRules](self, "communicationServiceRules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCCommunicationServiceRulesUtilities restrictionsForValidatedCommunicationServiceRules:](MCCommunicationServiceRulesUtilities, "restrictionsForValidatedCommunicationServiceRules:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)subtitle1Label
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[MCLDAPAccountPayload hostname](self, "hostname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = CFSTR("LDAP_SERVER_NAME_COLON");
  else
    v3 = CFSTR("LDAP_SERVER_NAME_MISSING");
  MCLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subtitle2Label
{
  void *v3;
  void *v4;
  void *v5;

  -[MCLDAPAccountPayload username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCLDAPAccountPayload hostname](self, "hostname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      MCLocalizedString(CFSTR("LDAP_USERNAME_COLON"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)subtitle2Description
{
  void *v3;
  void *v4;
  void *v5;

  -[MCLDAPAccountPayload username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCLDAPAccountPayload hostname](self, "hostname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MCLDAPAccountPayload username](self, "username");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  MCKeyValue *v5;
  NSString *accountDescription;
  void *v7;
  MCKeyValue *v8;
  MCKeyValue *v9;
  NSString *hostname;
  void *v11;
  MCKeyValue *v12;
  MCKeyValue *v13;
  NSString *username;
  void *v15;
  MCKeyValue *v16;
  MCKeyValue *v17;
  void *v18;
  void *v19;
  MCKeyValue *v20;
  MCKeyValue *v21;
  void *v22;
  void *v23;
  MCKeyValue *v24;
  MCKeyValue *v25;
  NSString *VPNUUID;
  void *v27;
  MCKeyValue *v28;
  void *v29;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  if (self->_accountDescription)
  {
    v5 = [MCKeyValue alloc];
    accountDescription = self->_accountDescription;
    MCLocalizedString(CFSTR("ACCOUNT_DESCRIPTION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCKeyValue initWithLocalizedString:localizedKey:](v5, "initWithLocalizedString:localizedKey:", accountDescription, v7);

    objc_msgSend(v4, "addObject:", v8);
  }
  if (self->_hostname)
  {
    v9 = [MCKeyValue alloc];
    hostname = self->_hostname;
    MCLocalizedString(CFSTR("URL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MCKeyValue initWithLocalizedString:localizedKey:](v9, "initWithLocalizedString:localizedKey:", hostname, v11);

    objc_msgSend(v4, "addObject:", v12);
  }
  if (self->_username)
  {
    v13 = [MCKeyValue alloc];
    username = self->_username;
    MCLocalizedString(CFSTR("USERNAME"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MCKeyValue initWithLocalizedString:localizedKey:](v13, "initWithLocalizedString:localizedKey:", username, v15);

    objc_msgSend(v4, "addObject:", v16);
  }
  if (self->_password)
  {
    v17 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("PASSWORD"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MCKeyValue initWithLocalizedString:localizedKey:](v17, "initWithLocalizedString:localizedKey:", v18, v19);

    objc_msgSend(v4, "addObject:", v20);
  }
  if (self->_useSSLNum)
  {
    v21 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_useSSLNum, "BOOLValue"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("USES_SSL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCKeyValue initWithLocalizedString:localizedKey:](v21, "initWithLocalizedString:localizedKey:", v22, v23);

    objc_msgSend(v4, "addObject:", v24);
  }
  if (self->_VPNUUID)
  {
    v25 = [MCKeyValue alloc];
    VPNUUID = self->_VPNUUID;
    MCLocalizedString(CFSTR("ACCOUNT_VPNUUID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[MCKeyValue initWithLocalizedString:localizedKey:](v25, "initWithLocalizedString:localizedKey:", VPNUUID, v27);

    objc_msgSend(v4, "addObject:", v28);
  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (BOOL)containsSensitiveUserInformation
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCLDAPAccountPayload;
  if (-[MCPayload containsSensitiveUserInformation](&v6, sel_containsSensitiveUserInformation))
    return 1;
  -[MCLDAPAccountPayload password](self, "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (BOOL)useSSL
{
  return self->_useSSL;
}

- (NSArray)searchSettings
{
  return self->_searchSettings;
}

- (NSString)accountPersistentUUID
{
  return self->_accountPersistentUUID;
}

- (void)setAccountPersistentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)VPNUUID
{
  return self->_VPNUUID;
}

- (NSString)acAccountIdentifier
{
  return self->_acAccountIdentifier;
}

- (void)setAcAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_acAccountIdentifier, a3);
}

- (NSDictionary)communicationServiceRules
{
  return self->_communicationServiceRules;
}

- (NSNumber)useSSLNum
{
  return self->_useSSLNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useSSLNum, 0);
  objc_storeStrong((id *)&self->_communicationServiceRules, 0);
  objc_storeStrong((id *)&self->_acAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
  objc_storeStrong((id *)&self->_accountPersistentUUID, 0);
  objc_storeStrong((id *)&self->_searchSettings, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
}

- (NSArray)contactsAccountIdentifiers
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_acAccountIdentifier)
  {
    v4[0] = self->_acAccountIdentifier;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

@end
