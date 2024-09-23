@implementation MCGmailAccountPayload

+ (id)typeStrings
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.google-oauth");
  v3[1] = CFSTR("com.apple.gmail");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
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

  return MCLocalizedFormat(CFSTR("GOOGLE_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("GOOGLE_ACCOUNT_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCGmailAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCGmailAccountPayload *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSDictionary *communicationServiceRules;
  uint64_t v15;
  NSString *VPNUUID;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v28;
  NSString *accountName;
  uint64_t v30;
  NSString *accountDescription;
  uint64_t v32;
  NSString *emailAddress;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSString *v37;
  uint64_t v38;
  NSString *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v51.receiver = self;
  v51.super_class = (Class)MCGmailAccountPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v51, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_14;
  v50 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("CommunicationServiceRules"), 0, &v50);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v50;
  if (v12)
    goto LABEL_5;
  v49 = 0;
  +[MCCommunicationServiceRulesUtilities validatedCommunicationServiceRules:outError:](MCCommunicationServiceRulesUtilities, "validatedCommunicationServiceRules:outError:", v11, &v49);
  v13 = objc_claimAutoreleasedReturnValue();
  v12 = v49;
  communicationServiceRules = v10->_communicationServiceRules;
  v10->_communicationServiceRules = (NSDictionary *)v13;

  if (v12)
    goto LABEL_5;
  v48 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("VPNUUID"), 0, &v48);
  v15 = objc_claimAutoreleasedReturnValue();
  v12 = v48;
  VPNUUID = v10->_VPNUUID;
  v10->_VPNUUID = (NSString *)v15;

  if (v12)
    goto LABEL_5;
  if ((objc_msgSend(v9, "isStub") & 1) != 0)
  {
    v44 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("AccountName"), 0, &v44);
    v28 = objc_claimAutoreleasedReturnValue();
    v12 = v44;
    accountName = v10->_accountName;
    v10->_accountName = (NSString *)v28;

    if (v12)
      goto LABEL_5;
    v43 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("AccountDescription"), 0, &v43);
    v30 = objc_claimAutoreleasedReturnValue();
    v12 = v43;
    accountDescription = v10->_accountDescription;
    v10->_accountDescription = (NSString *)v30;

    if (v12)
      goto LABEL_5;
    v42 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("EmailAddress"), 0, &v42);
    v32 = objc_claimAutoreleasedReturnValue();
    v12 = v42;
    emailAddress = v10->_emailAddress;
    v10->_emailAddress = (NSString *)v32;

    if (v12)
      goto LABEL_5;
    v41 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ACAccountIdentifier"), 0, &v41);
    v34 = objc_claimAutoreleasedReturnValue();
    v12 = v41;
    v35 = 96;
  }
  else
  {
    v47 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("AccountName"), 0, &v47);
    v36 = objc_claimAutoreleasedReturnValue();
    v12 = v47;
    v37 = v10->_accountName;
    v10->_accountName = (NSString *)v36;

    if (v12)
      goto LABEL_5;
    v46 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("AccountDescription"), 0, &v46);
    v38 = objc_claimAutoreleasedReturnValue();
    v12 = v46;
    v39 = v10->_accountDescription;
    v10->_accountDescription = (NSString *)v38;

    if (v12)
      goto LABEL_5;
    v45 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("EmailAddress"), 1, &v45);
    v34 = objc_claimAutoreleasedReturnValue();
    v12 = v45;
    v35 = 120;
  }
  v40 = *(Class *)((char *)&v10->super.super.isa + v35);
  *(Class *)((char *)&v10->super.super.isa + v35) = (Class)v34;

  if (v12)
  {
LABEL_5:
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a5)
      *a5 = objc_retainAutorelease(v17);
    v19 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      v21 = (void *)objc_opt_class();
      v22 = v21;
      objc_msgSend(v18, "MCVerboseDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v21;
      v54 = 2114;
      v55 = v23;
      _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v24 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v25 = v24;
      -[MCPayload friendlyName](v10, "friendlyName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v26;
      v54 = 2114;
      v55 = v8;
      _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_14:
  return v10;
}

- (BOOL)mustInstallNonInteractively
{
  return 1;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSString *accountName;
  NSString *accountDescription;
  NSString *emailAddress;
  NSDictionary *communicationServiceRules;
  NSString *VPNUUID;
  NSString *acAccountIdentifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCGmailAccountPayload;
  -[MCPayload stubDictionary](&v12, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accountName = self->_accountName;
  if (accountName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", accountName, CFSTR("AccountName"));
  accountDescription = self->_accountDescription;
  if (accountDescription)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", accountDescription, CFSTR("AccountDescription"));
  emailAddress = self->_emailAddress;
  if (emailAddress)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", emailAddress, CFSTR("EmailAddress"));
  communicationServiceRules = self->_communicationServiceRules;
  if (communicationServiceRules)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", communicationServiceRules, CFSTR("CommunicationServiceRules"));
  VPNUUID = self->_VPNUUID;
  if (VPNUUID)
    objc_msgSend(v4, "setObject:forKey:", VPNUUID, CFSTR("VPNUUID"));
  acAccountIdentifier = self->_acAccountIdentifier;
  if (acAccountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", acAccountIdentifier, CFSTR("ACAccountIdentifier"));
  return v4;
}

- (id)verboseDescription
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)MCGmailAccountPayload;
  -[MCPayload verboseDescription](&v7, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n"), v4);

  if (-[NSString length](self->_accountDescription, "length"))
    objc_msgSend(v5, "appendFormat:", CFSTR("Acct Desc           : %@\n"), self->_accountDescription);
  if (-[NSString length](self->_accountName, "length"))
    objc_msgSend(v5, "appendFormat:", CFSTR("Name                : %@\n"), self->_accountName);
  if (-[NSString length](self->_emailAddress, "length"))
    objc_msgSend(v5, "appendFormat:", CFSTR("Email               : %@\n"), self->_emailAddress);
  if (self->_VPNUUID)
    objc_msgSend(v5, "appendFormat:", CFSTR("VPNUUID             : %@\n"), self->_VPNUUID);
  if (self->_acAccountIdentifier)
    objc_msgSend(v5, "appendFormat:", CFSTR("ACAccountIdentifier : %@\n"), self->_acAccountIdentifier);
  return v5;
}

- (id)restrictions
{
  void *v2;
  void *v3;

  -[MCGmailAccountPayload communicationServiceRules](self, "communicationServiceRules");
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

  -[MCGmailAccountPayload emailAddress](self, "emailAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = CFSTR("GOOGLE_ACCOUNT_EMAIL_COLON");
  else
    v3 = CFSTR("GOOGLE_ACCOUNT_EMAIL_MISSING");
  MCLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  MCKeyValue *v5;
  NSString *VPNUUID;
  void *v7;
  MCKeyValue *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  if (self->_VPNUUID)
  {
    v5 = [MCKeyValue alloc];
    VPNUUID = self->_VPNUUID;
    MCLocalizedString(CFSTR("ACCOUNT_VPNUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCKeyValue initWithLocalizedString:localizedKey:](v5, "initWithLocalizedString:localizedKey:", VPNUUID, v7);

    objc_msgSend(v4, "addObject:", v8);
  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
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

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSDictionary)communicationServiceRules
{
  return self->_communicationServiceRules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationServiceRules, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_acAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
}

- (NSArray)mailAccountIdentifiers
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
