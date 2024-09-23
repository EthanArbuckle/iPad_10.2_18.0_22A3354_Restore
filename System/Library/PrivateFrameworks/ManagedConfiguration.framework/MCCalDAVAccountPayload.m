@implementation MCCalDAVAccountPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.caldav.account"));
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

  return MCLocalizedFormat(CFSTR("CALDAV_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("CALDAV_ACCOUNT_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCCalDAVAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCCalDAVAccountPayload *v10;
  uint64_t v11;
  id v12;
  NSString *accountDescription;
  uint64_t v14;
  NSString *username;
  uint64_t v16;
  NSString *principalURL;
  uint64_t v18;
  NSNumber *useSSLNum;
  NSNumber *v20;
  uint64_t v21;
  NSNumber *v22;
  uint64_t v23;
  NSNumber *portNum;
  uint64_t v25;
  NSString *VPNUUID;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v38;
  NSString *hostname;
  uint64_t v40;
  NSString *accountPersistentUUID;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSString *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v58.receiver = self;
  v58.super_class = (Class)MCCalDAVAccountPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v58, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_19;
  v57 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("CalDAVAccountDescription"), 0, &v57);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v57;
  accountDescription = v10->_accountDescription;
  v10->_accountDescription = (NSString *)v11;

  if (v12)
    goto LABEL_10;
  v56 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("CalDAVUsername"), 0, &v56);
  v14 = objc_claimAutoreleasedReturnValue();
  v12 = v56;
  username = v10->_username;
  v10->_username = (NSString *)v14;

  if (v12)
    goto LABEL_10;
  v55 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("CalDAVPrincipalURL"), 0, &v55);
  v16 = objc_claimAutoreleasedReturnValue();
  v12 = v55;
  principalURL = v10->_principalURL;
  v10->_principalURL = (NSString *)v16;

  if (v12)
    goto LABEL_10;
  v54 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("CalDAVUseSSL"), 0, &v54);
  v18 = objc_claimAutoreleasedReturnValue();
  v12 = v54;
  useSSLNum = v10->_useSSLNum;
  v10->_useSSLNum = (NSNumber *)v18;

  if (v12)
    goto LABEL_10;
  v20 = v10->_useSSLNum;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v10->_useSSLNum;
    v10->_useSSLNum = (NSNumber *)v21;

    v20 = v10->_useSSLNum;
  }
  v10->_useSSL = -[NSNumber BOOLValue](v20, "BOOLValue");
  v53 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("CalDAVPort"), 0, &v53);
  v23 = objc_claimAutoreleasedReturnValue();
  v12 = v53;
  portNum = v10->_portNum;
  v10->_portNum = (NSNumber *)v23;

  if (v12)
    goto LABEL_10;
  v10->_port = -[NSNumber intValue](v10->_portNum, "intValue");
  v52 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("VPNUUID"), 0, &v52);
  v25 = objc_claimAutoreleasedReturnValue();
  v12 = v52;
  VPNUUID = v10->_VPNUUID;
  v10->_VPNUUID = (NSString *)v25;

  if (v12)
    goto LABEL_10;
  if ((objc_msgSend(v9, "isStub") & 1) != 0)
  {
    v49 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("CalDAVHostName"), 0, &v49);
    v38 = objc_claimAutoreleasedReturnValue();
    v12 = v49;
    hostname = v10->_hostname;
    v10->_hostname = (NSString *)v38;

    if (v12)
      goto LABEL_10;
    v48 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("CalDAVAccountPersistentUUID"), 0, &v48);
    v40 = objc_claimAutoreleasedReturnValue();
    v12 = v48;
    accountPersistentUUID = v10->_accountPersistentUUID;
    v10->_accountPersistentUUID = (NSString *)v40;

    if (v12)
      goto LABEL_10;
    v47 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ACAccountIdentifier"), 0, &v47);
    v42 = objc_claimAutoreleasedReturnValue();
    v12 = v47;
    v43 = 152;
  }
  else
  {
    v51 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("CalDAVHostName"), 1, &v51);
    v44 = objc_claimAutoreleasedReturnValue();
    v12 = v51;
    v45 = v10->_hostname;
    v10->_hostname = (NSString *)v44;

    if (v12)
    {
LABEL_10:
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (a5)
        *a5 = objc_retainAutorelease(v27);
      v29 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v30 = v29;
        v31 = (void *)objc_opt_class();
        v32 = v31;
        objc_msgSend(v28, "MCVerboseDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v31;
        v61 = 2114;
        v62 = v33;
        _os_log_impl(&dword_19ECC4000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v10 = 0;
      goto LABEL_15;
    }
    v50 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("CalDAVPassword"), 0, &v50);
    v42 = objc_claimAutoreleasedReturnValue();
    v12 = v50;
    v43 = 112;
  }
  v46 = *(Class *)((char *)&v10->super.super.isa + v43);
  *(Class *)((char *)&v10->super.super.isa + v43) = (Class)v42;

  if (v12)
    goto LABEL_10;
LABEL_15:
  if (objc_msgSend(v8, "count"))
  {
    v34 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v35 = v34;
      -[MCPayload friendlyName](v10, "friendlyName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v36;
      v61 = 2114;
      v62 = v8;
      _os_log_impl(&dword_19ECC4000, v35, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_19:
  return v10;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCCalDAVAccountPayload;
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
  if (self->_principalURL)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nprincipalURL          : %@"), self->_principalURL);
  if (self->_useSSL)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nuseSSL                : %@"), CFSTR("YES"));
  if (self->_port)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nport                  : %d"), self->_port);
  if (self->_VPNUUID)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nVPNUUID               : %@"), self->_VPNUUID);
  if (self->_accountPersistentUUID)
    objc_msgSend(v4, "appendFormat:", CFSTR("\naccountPersistentUUID : %@"), self->_accountPersistentUUID);
  if (self->_acAccountIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("\naACAccount Identifier : %@"), self->_acAccountIdentifier);
  return v4;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSString *accountDescription;
  NSString *hostname;
  NSString *username;
  NSString *principalURL;
  void *v9;
  void *v10;
  NSString *VPNUUID;
  NSString *accountPersistentUUID;
  NSString *acAccountIdentifier;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MCCalDAVAccountPayload;
  -[MCPayload stubDictionary](&v15, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accountDescription = self->_accountDescription;
  if (accountDescription)
    objc_msgSend(v3, "setObject:forKey:", accountDescription, CFSTR("CalDAVAccountDescription"));
  hostname = self->_hostname;
  if (hostname)
    objc_msgSend(v4, "setObject:forKey:", hostname, CFSTR("CalDAVHostName"));
  username = self->_username;
  if (username)
    objc_msgSend(v4, "setObject:forKey:", username, CFSTR("CalDAVUsername"));
  principalURL = self->_principalURL;
  if (principalURL)
    objc_msgSend(v4, "setObject:forKey:", principalURL, CFSTR("CalDAVPrincipalURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useSSL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("CalDAVUseSSL"));

  if (self->_port)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("CalDAVPort"));

  }
  VPNUUID = self->_VPNUUID;
  if (VPNUUID)
    objc_msgSend(v4, "setObject:forKey:", VPNUUID, CFSTR("VPNUUID"));
  accountPersistentUUID = self->_accountPersistentUUID;
  if (accountPersistentUUID)
    objc_msgSend(v4, "setObject:forKey:", accountPersistentUUID, CFSTR("CalDAVAccountPersistentUUID"));
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

  -[MCCalDAVAccountPayload hostname](self, "hostname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = CFSTR("CALDAV_SERVER_NAME_COLON");
  else
    v3 = CFSTR("CALDAV_SERVER_NAME_MISSING");
  MCLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subtitle2Label
{
  void *v3;
  void *v4;
  void *v5;

  -[MCCalDAVAccountPayload username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCCalDAVAccountPayload hostname](self, "hostname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      MCLocalizedString(CFSTR("CALDAV_USERNAME_COLON"));
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

  -[MCCalDAVAccountPayload username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCCalDAVAccountPayload hostname](self, "hostname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MCCalDAVAccountPayload username](self, "username");
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
  NSString *principalURL;
  void *v22;
  MCKeyValue *v23;
  MCKeyValue *v24;
  void *v25;
  void *v26;
  MCKeyValue *v27;
  NSNumber *portNum;
  void *v29;
  MCKeyValue *v30;
  void *v31;
  MCKeyValue *v32;
  MCKeyValue *v33;
  NSString *VPNUUID;
  void *v35;
  MCKeyValue *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
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
    MCLocalizedString(CFSTR("SERVER"));
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
  if (self->_principalURL)
  {
    v20 = [MCKeyValue alloc];
    principalURL = self->_principalURL;
    MCLocalizedString(CFSTR("PRINCIPAL_URL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MCKeyValue initWithLocalizedString:localizedKey:](v20, "initWithLocalizedString:localizedKey:", principalURL, v22);

    objc_msgSend(v3, "addObject:", v23);
  }
  if (self->_useSSLNum)
  {
    v24 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_useSSLNum, "BOOLValue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("USES_SSL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[MCKeyValue initWithLocalizedString:localizedKey:](v24, "initWithLocalizedString:localizedKey:", v25, v26);

    objc_msgSend(v3, "addObject:", v27);
  }
  portNum = self->_portNum;
  if (portNum)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), -[NSNumber intValue](portNum, "intValue"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PORT"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[MCKeyValue initWithLocalizedString:localizedKey:](v30, "initWithLocalizedString:localizedKey:", v29, v31);

    objc_msgSend(v3, "addObject:", v32);
  }
  if (self->_VPNUUID)
  {
    v33 = [MCKeyValue alloc];
    VPNUUID = self->_VPNUUID;
    MCLocalizedString(CFSTR("ACCOUNT_VPNUUID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[MCKeyValue initWithLocalizedString:localizedKey:](v33, "initWithLocalizedString:localizedKey:", VPNUUID, v35);

    objc_msgSend(v3, "addObject:", v36);
  }
  if (objc_msgSend(v3, "count")
    && (+[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3),
        (v37 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v38 = (void *)v37;
    v41[0] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (BOOL)containsSensitiveUserInformation
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCCalDAVAccountPayload;
  if (-[MCPayload containsSensitiveUserInformation](&v6, sel_containsSensitiveUserInformation))
    return 1;
  -[MCCalDAVAccountPayload password](self, "password");
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)principalURL
{
  return self->_principalURL;
}

- (BOOL)useSSL
{
  return self->_useSSL;
}

- (int)port
{
  return self->_port;
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

- (NSNumber)useSSLNum
{
  return self->_useSSLNum;
}

- (NSNumber)portNum
{
  return self->_portNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portNum, 0);
  objc_storeStrong((id *)&self->_useSSLNum, 0);
  objc_storeStrong((id *)&self->_acAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
  objc_storeStrong((id *)&self->_accountPersistentUUID, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
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
