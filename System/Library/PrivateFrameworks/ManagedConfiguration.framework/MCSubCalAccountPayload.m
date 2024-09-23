@implementation MCSubCalAccountPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.subscribedcalendar.account"));
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

  return MCLocalizedFormat(CFSTR("SUBCAL_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("SUBCAL_ACCOUNT_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCSubCalAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCSubCalAccountPayload *v10;
  uint64_t v11;
  id v12;
  NSString *accountDescription;
  uint64_t v14;
  NSString *username;
  uint64_t v16;
  NSNumber *useSSLNum;
  uint64_t v18;
  NSString *VPNUUID;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v31;
  NSString *hostname;
  uint64_t v33;
  NSString *accountPersistentUUID;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSString *v38;
  void *v39;
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
  v49.super_class = (Class)MCSubCalAccountPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v49, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_15;
  v48 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("SubCalAccountDescription"), 0, &v48);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v48;
  accountDescription = v10->_accountDescription;
  v10->_accountDescription = (NSString *)v11;

  if (v12)
    goto LABEL_6;
  v47 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("SubCalAccountUsername"), 0, &v47);
  v14 = objc_claimAutoreleasedReturnValue();
  v12 = v47;
  username = v10->_username;
  v10->_username = (NSString *)v14;

  if (v12)
    goto LABEL_6;
  v46 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SubCalAccountUseSSL"), 0, &v46);
  v16 = objc_claimAutoreleasedReturnValue();
  v12 = v46;
  useSSLNum = v10->_useSSLNum;
  v10->_useSSLNum = (NSNumber *)v16;

  if (v12)
    goto LABEL_6;
  v10->_useSSL = -[NSNumber BOOLValue](v10->_useSSLNum, "BOOLValue");
  v45 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("VPNUUID"), 0, &v45);
  v18 = objc_claimAutoreleasedReturnValue();
  v12 = v45;
  VPNUUID = v10->_VPNUUID;
  v10->_VPNUUID = (NSString *)v18;

  if (v12)
    goto LABEL_6;
  if ((objc_msgSend(v9, "isStub") & 1) != 0)
  {
    v42 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("SubCalAccountHostName"), 0, &v42);
    v31 = objc_claimAutoreleasedReturnValue();
    v12 = v42;
    hostname = v10->_hostname;
    v10->_hostname = (NSString *)v31;

    if (v12)
      goto LABEL_6;
    v41 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("SubCalAccountPersistentUUID"), 0, &v41);
    v33 = objc_claimAutoreleasedReturnValue();
    v12 = v41;
    accountPersistentUUID = v10->_accountPersistentUUID;
    v10->_accountPersistentUUID = (NSString *)v33;

    if (v12)
      goto LABEL_6;
    v40 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ACAccountIdentifier"), 0, &v40);
    v35 = objc_claimAutoreleasedReturnValue();
    v12 = v40;
    v36 = 144;
  }
  else
  {
    v44 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("SubCalAccountHostName"), 1, &v44);
    v37 = objc_claimAutoreleasedReturnValue();
    v12 = v44;
    v38 = v10->_hostname;
    v10->_hostname = (NSString *)v37;

    if (v12)
    {
LABEL_6:
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (a5)
        *a5 = objc_retainAutorelease(v20);
      v22 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v23 = v22;
        v24 = (void *)objc_opt_class();
        v25 = v24;
        objc_msgSend(v21, "MCVerboseDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v24;
        v52 = 2114;
        v53 = v26;
        _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v10 = 0;
      goto LABEL_11;
    }
    v43 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("SubCalAccountPassword"), 0, &v43);
    v35 = objc_claimAutoreleasedReturnValue();
    v12 = v43;
    v36 = 112;
  }
  v39 = *(Class *)((char *)&v10->super.super.isa + v36);
  *(Class *)((char *)&v10->super.super.isa + v36) = (Class)v35;

  if (v12)
    goto LABEL_6;
LABEL_11:
  if (objc_msgSend(v8, "count"))
  {
    v27 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v28 = v27;
      -[MCPayload friendlyName](v10, "friendlyName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v29;
      v52 = 2114;
      v53 = v8;
      _os_log_impl(&dword_19ECC4000, v28, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_15:
  return v10;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCSubCalAccountPayload;
  -[MCPayload verboseDescription](&v6, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_accountDescription)
    objc_msgSend(v4, "appendFormat:", CFSTR("\naccountDescription    : %@"), self->_accountDescription);
  if (self->_hostname)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nURL                   : %@"), self->_hostname);
  if (self->_username)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nusername              : %@"), self->_username);
  if (self->_password)
    objc_msgSend(v4, "appendFormat:", CFSTR("\npassword              : (set)"));
  if (self->_useSSL)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nuseSSL                : %@"), CFSTR("YES"));
  if (self->_accountPersistentUUID)
    objc_msgSend(v4, "appendFormat:", CFSTR("\naccountPersistentUUID : %@"), self->_accountPersistentUUID);
  if (self->_VPNUUID)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nVPNUUID               : %@"), self->_VPNUUID);
  if (self->_acAccountIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nACAccountIdentifier   : %@"), self->_acAccountIdentifier);
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
  NSString *VPNUUID;
  NSString *acAccountIdentifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCSubCalAccountPayload;
  -[MCPayload stubDictionary](&v12, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accountDescription = self->_accountDescription;
  if (accountDescription)
    objc_msgSend(v3, "setObject:forKey:", accountDescription, CFSTR("SubCalAccountDescription"));
  hostname = self->_hostname;
  if (hostname)
    objc_msgSend(v4, "setObject:forKey:", hostname, CFSTR("SubCalAccountHostName"));
  username = self->_username;
  if (username)
    objc_msgSend(v4, "setObject:forKey:", username, CFSTR("SubCalAccountUsername"));
  accountPersistentUUID = self->_accountPersistentUUID;
  if (accountPersistentUUID)
    objc_msgSend(v4, "setObject:forKey:", accountPersistentUUID, CFSTR("SubCalAccountPersistentUUID"));
  VPNUUID = self->_VPNUUID;
  if (VPNUUID)
    objc_msgSend(v4, "setObject:forKey:", VPNUUID, CFSTR("VPNUUID"));
  acAccountIdentifier = self->_acAccountIdentifier;
  if (acAccountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", acAccountIdentifier, CFSTR("ACAccountIdentifier"));
  return v4;
}

- (id)subtitle1Label
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[MCSubCalAccountPayload hostname](self, "hostname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = CFSTR("SUBCAL_SERVER_NAME_COLON");
  else
    v3 = CFSTR("SUBCAL_SERVER_NAME_MISSING");
  MCLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subtitle2Label
{
  void *v3;
  void *v4;
  void *v5;

  -[MCSubCalAccountPayload username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCSubCalAccountPayload hostname](self, "hostname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      MCLocalizedString(CFSTR("SUBCAL_USERNAME_COLON"));
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

  -[MCSubCalAccountPayload username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCSubCalAccountPayload hostname](self, "hostname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MCSubCalAccountPayload username](self, "username");
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
  MCKeyValue *v4;
  NSString *accountDescription;
  void *v6;
  MCKeyValue *v7;
  MCKeyValue *v8;
  NSString *hostname;
  void *v10;
  MCKeyValue *v11;
  MCKeyValue *v12;
  NSString *username;
  void *v14;
  MCKeyValue *v15;
  MCKeyValue *v16;
  void *v17;
  void *v18;
  MCKeyValue *v19;
  MCKeyValue *v20;
  void *v21;
  void *v22;
  MCKeyValue *v23;
  MCKeyValue *v24;
  NSString *VPNUUID;
  void *v26;
  MCKeyValue *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (self->_accountDescription)
  {
    v4 = [MCKeyValue alloc];
    accountDescription = self->_accountDescription;
    MCLocalizedString(CFSTR("ACCOUNT_DESCRIPTION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MCKeyValue initWithLocalizedString:localizedKey:](v4, "initWithLocalizedString:localizedKey:", accountDescription, v6);

    objc_msgSend(v3, "addObject:", v7);
  }
  if (self->_hostname)
  {
    v8 = [MCKeyValue alloc];
    hostname = self->_hostname;
    MCLocalizedString(CFSTR("HOSTNAME"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MCKeyValue initWithLocalizedString:localizedKey:](v8, "initWithLocalizedString:localizedKey:", hostname, v10);

    objc_msgSend(v3, "addObject:", v11);
  }
  if (self->_username)
  {
    v12 = [MCKeyValue alloc];
    username = self->_username;
    MCLocalizedString(CFSTR("USERNAME"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MCKeyValue initWithLocalizedString:localizedKey:](v12, "initWithLocalizedString:localizedKey:", username, v14);

    objc_msgSend(v3, "addObject:", v15);
  }
  if (self->_password)
  {
    v16 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("PASSWORD"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MCKeyValue initWithLocalizedString:localizedKey:](v16, "initWithLocalizedString:localizedKey:", v17, v18);

    objc_msgSend(v3, "addObject:", v19);
  }
  if (self->_useSSLNum)
  {
    v20 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_useSSLNum, "BOOLValue"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("USES_SSL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MCKeyValue initWithLocalizedString:localizedKey:](v20, "initWithLocalizedString:localizedKey:", v21, v22);

    objc_msgSend(v3, "addObject:", v23);
  }
  if (self->_VPNUUID)
  {
    v24 = [MCKeyValue alloc];
    VPNUUID = self->_VPNUUID;
    MCLocalizedString(CFSTR("ACCOUNT_VPNUUID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[MCKeyValue initWithLocalizedString:localizedKey:](v24, "initWithLocalizedString:localizedKey:", VPNUUID, v26);

    objc_msgSend(v3, "addObject:", v27);
  }
  if (objc_msgSend(v3, "count")
    && (+[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3),
        (v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v29 = (void *)v28;
    v32[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (BOOL)containsSensitiveUserInformation
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCSubCalAccountPayload;
  if (-[MCPayload containsSensitiveUserInformation](&v6, sel_containsSensitiveUserInformation))
    return 1;
  -[MCSubCalAccountPayload password](self, "password");
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

- (NSString)password
{
  return self->_password;
}

- (BOOL)useSSL
{
  return self->_useSSL;
}

- (NSString)accountPersistentUUID
{
  return self->_accountPersistentUUID;
}

- (void)setAccountPersistentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
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

- (NSNumber)useSSLNum
{
  return self->_useSSLNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useSSLNum, 0);
  objc_storeStrong((id *)&self->_acAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
  objc_storeStrong((id *)&self->_accountPersistentUUID, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
}

- (NSArray)calendarAccountIdentifiers
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
