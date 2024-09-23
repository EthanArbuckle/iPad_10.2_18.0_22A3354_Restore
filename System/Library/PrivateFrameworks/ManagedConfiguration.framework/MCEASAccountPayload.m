@implementation MCEASAccountPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.eas.account"));
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

  return MCLocalizedFormat(CFSTR("EAS_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("EAS_ACCOUNT_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCEASAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCEASAccountPayload *v10;
  MCEASAccountPayload *v11;
  uint64_t v12;
  NSString *accountDescription;
  uint64_t v14;
  id v15;
  NSString *username;
  uint64_t v17;
  NSString *emailAddress;
  uint64_t v19;
  NSNumber *useSSL;
  uint64_t v21;
  NSNumber *useOAuth;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v34;
  NSString *OAuthSignInURL;
  void *v36;
  uint64_t v37;
  NSString *OAuthTokenRequestURL;
  void *v39;
  uint64_t v40;
  NSNumber *mailNumberOfPastDaysToSync;
  uint64_t v42;
  NSNumber *syncDefaultFoldersOnlyNum;
  void *v44;
  uint64_t v45;
  NSDictionary *communicationServiceRules;
  uint64_t v47;
  NSNumber *enableMailNum;
  uint64_t v49;
  NSNumber *enableContactsNum;
  uint64_t v51;
  NSNumber *enableCalendarsNum;
  uint64_t v53;
  NSNumber *enableRemindersNum;
  uint64_t v55;
  NSNumber *enableNotesNum;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSNumber *enableMailUserOverridableNum;
  uint64_t v66;
  NSNumber *enableContactsUserOverridableNum;
  uint64_t v68;
  NSNumber *enableCalendarsUserOverridableNum;
  uint64_t v70;
  NSNumber *enableRemindersUserOverridableNum;
  uint64_t v72;
  NSNumber *enableNotesUserOverridableNum;
  uint64_t v74;
  NSString *hostname;
  uint64_t v76;
  NSString *accountPersistentUUID;
  uint64_t v78;
  NSData *certificatePersistentID;
  uint64_t v80;
  NSString *acAccountIdentifier;
  const __CFString *v82;
  void *v83;
  void *v84;
  _BOOL8 v85;
  uint64_t v86;
  NSString *v87;
  uint64_t v88;
  NSString *password;
  uint64_t v90;
  NSData *embeddedCertificate;
  uint64_t v92;
  NSString *embeddedCertificateName;
  uint64_t v94;
  NSString *embeddedCertificatePassword;
  uint64_t v96;
  NSString *certificateUUID;
  void *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  objc_super v131;
  uint8_t buf[4];
  void *v133;
  __int16 v134;
  id v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v131.receiver = self;
  v131.super_class = (Class)MCEASAccountPayload;
  v10 = -[MCEmailAccountPayloadBase initWithDictionary:profile:outError:](&v131, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  v11 = v10;
  if (!v10)
    goto LABEL_15;
  -[MCPayload displayName](v10, "displayName");
  v12 = objc_claimAutoreleasedReturnValue();
  accountDescription = v11->_accountDescription;
  v11->_accountDescription = (NSString *)v12;

  v130 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("UserName"), 0, &v130);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v130;
  username = v11->_username;
  v11->_username = (NSString *)v14;

  if (v15)
    goto LABEL_6;
  v129 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("EmailAddress"), 0, &v129);
  v17 = objc_claimAutoreleasedReturnValue();
  v15 = v129;
  emailAddress = v11->_emailAddress;
  v11->_emailAddress = (NSString *)v17;

  if (v15)
    goto LABEL_6;
  v128 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SSL"), 0, &v128);
  v19 = objc_claimAutoreleasedReturnValue();
  v15 = v128;
  useSSL = v11->_useSSL;
  v11->_useSSL = (NSNumber *)v19;

  if (v15)
    goto LABEL_6;
  v127 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("OAuth"), 0, &v127);
  v21 = objc_claimAutoreleasedReturnValue();
  v15 = v127;
  useOAuth = v11->_useOAuth;
  v11->_useOAuth = (NSNumber *)v21;

  if (v15)
    goto LABEL_6;
  if (-[NSNumber BOOLValue](v11->_useOAuth, "BOOLValue"))
  {
    v126 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OAuthSignInURL"), 0, &v126);
    v34 = objc_claimAutoreleasedReturnValue();
    v15 = v126;
    OAuthSignInURL = v11->_OAuthSignInURL;
    v11->_OAuthSignInURL = (NSString *)v34;

    if (!v15)
    {
      if (v11->_OAuthSignInURL)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v36)
        {
          v82 = CFSTR("OAuthSignInURL");
          goto LABEL_50;
        }
      }
      v125 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OAuthTokenRequestURL"), 0, &v125);
      v37 = objc_claimAutoreleasedReturnValue();
      v15 = v125;
      OAuthTokenRequestURL = v11->_OAuthTokenRequestURL;
      v11->_OAuthTokenRequestURL = (NSString *)v37;

      if (!v15)
      {
        if (!v11->_OAuthTokenRequestURL)
          goto LABEL_23;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
          goto LABEL_23;
        v82 = CFSTR("OAuthTokenRequestURL");
LABEL_50:
        +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", v82);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_53;
      }
    }
LABEL_6:
    -[MCPayload malformedPayloadErrorWithError:](v11, "malformedPayloadErrorWithError:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a5)
      *a5 = objc_retainAutorelease(v23);
    v25 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      v27 = (void *)objc_opt_class();
      v28 = v27;
      objc_msgSend(v24, "MCVerboseDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v133 = v27;
      v134 = 2114;
      v135 = v29;
      _os_log_impl(&dword_19ECC4000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v11 = 0;
    goto LABEL_11;
  }
LABEL_23:
  v124 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("MailNumberOfPastDaysToSync"), 0, &v124);
  v40 = objc_claimAutoreleasedReturnValue();
  v15 = v124;
  mailNumberOfPastDaysToSync = v11->_mailNumberOfPastDaysToSync;
  v11->_mailNumberOfPastDaysToSync = (NSNumber *)v40;

  if (v15)
    goto LABEL_6;
  v123 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SyncDefaultFoldersOnly"), 0, &v123);
  v42 = objc_claimAutoreleasedReturnValue();
  v15 = v123;
  syncDefaultFoldersOnlyNum = v11->_syncDefaultFoldersOnlyNum;
  v11->_syncDefaultFoldersOnlyNum = (NSNumber *)v42;

  if (v15)
    goto LABEL_6;
  v11->_syncDefaultFoldersOnly = -[NSNumber BOOLValue](v11->_syncDefaultFoldersOnlyNum, "BOOLValue");
  v122 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("CommunicationServiceRules"), 0, &v122);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v122;
  if (v15)
    goto LABEL_52;
  v121 = 0;
  +[MCCommunicationServiceRulesUtilities validatedCommunicationServiceRules:outError:](MCCommunicationServiceRulesUtilities, "validatedCommunicationServiceRules:outError:", v44, &v121);
  v45 = objc_claimAutoreleasedReturnValue();
  v15 = v121;
  communicationServiceRules = v11->_communicationServiceRules;
  v11->_communicationServiceRules = (NSDictionary *)v45;

  if (v15)
    goto LABEL_52;
  v120 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnableMail"), 0, &v120);
  v47 = objc_claimAutoreleasedReturnValue();
  v15 = v120;
  enableMailNum = v11->_enableMailNum;
  v11->_enableMailNum = (NSNumber *)v47;

  if (v15)
    goto LABEL_52;
  v119 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnableContacts"), 0, &v119);
  v49 = objc_claimAutoreleasedReturnValue();
  v15 = v119;
  enableContactsNum = v11->_enableContactsNum;
  v11->_enableContactsNum = (NSNumber *)v49;

  if (v15)
    goto LABEL_52;
  v118 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnableCalendars"), 0, &v118);
  v51 = objc_claimAutoreleasedReturnValue();
  v15 = v118;
  enableCalendarsNum = v11->_enableCalendarsNum;
  v11->_enableCalendarsNum = (NSNumber *)v51;

  if (v15)
    goto LABEL_52;
  v117 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnableReminders"), 0, &v117);
  v53 = objc_claimAutoreleasedReturnValue();
  v15 = v117;
  enableRemindersNum = v11->_enableRemindersNum;
  v11->_enableRemindersNum = (NSNumber *)v53;

  if (v15)
    goto LABEL_52;
  v116 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnableNotes"), 0, &v116);
  v55 = objc_claimAutoreleasedReturnValue();
  v15 = v116;
  enableNotesNum = v11->_enableNotesNum;
  v11->_enableNotesNum = (NSNumber *)v55;

  if (v15)
    goto LABEL_52;
  if (-[MCEASAccountPayload enableMail](v11, "enableMail")
    || -[MCEASAccountPayload enableContacts](v11, "enableContacts")
    || -[MCEASAccountPayload enableCalendars](v11, "enableCalendars")
    || -[MCEASAccountPayload enableReminders](v11, "enableReminders")
    || -[MCEASAccountPayload enableNotes](v11, "enableNotes"))
  {
    v115 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnableMailUserOverridable"), 0, &v115);
    v64 = objc_claimAutoreleasedReturnValue();
    v15 = v115;
    enableMailUserOverridableNum = v11->_enableMailUserOverridableNum;
    v11->_enableMailUserOverridableNum = (NSNumber *)v64;

    if (v15)
      goto LABEL_52;
    v114 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnableContactsUserOverridable"), 0, &v114);
    v66 = objc_claimAutoreleasedReturnValue();
    v15 = v114;
    enableContactsUserOverridableNum = v11->_enableContactsUserOverridableNum;
    v11->_enableContactsUserOverridableNum = (NSNumber *)v66;

    if (v15)
      goto LABEL_52;
    v113 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnableCalendarsUserOverridable"), 0, &v113);
    v68 = objc_claimAutoreleasedReturnValue();
    v15 = v113;
    enableCalendarsUserOverridableNum = v11->_enableCalendarsUserOverridableNum;
    v11->_enableCalendarsUserOverridableNum = (NSNumber *)v68;

    if (v15)
      goto LABEL_52;
    v112 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnableRemindersUserOverridable"), 0, &v112);
    v70 = objc_claimAutoreleasedReturnValue();
    v15 = v112;
    enableRemindersUserOverridableNum = v11->_enableRemindersUserOverridableNum;
    v11->_enableRemindersUserOverridableNum = (NSNumber *)v70;

    if (v15)
      goto LABEL_52;
    v111 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnableNotesUserOverridable"), 0, &v111);
    v72 = objc_claimAutoreleasedReturnValue();
    v15 = v111;
    enableNotesUserOverridableNum = v11->_enableNotesUserOverridableNum;
    v11->_enableNotesUserOverridableNum = (NSNumber *)v72;

    if (v15)
      goto LABEL_52;
    if ((objc_msgSend(v9, "isStub") & 1) != 0)
    {
      v103 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Host"), 0, &v103);
      v74 = objc_claimAutoreleasedReturnValue();
      v15 = v103;
      hostname = v11->_hostname;
      v11->_hostname = (NSString *)v74;

      if (v15)
        goto LABEL_52;
      v102 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("EASAccountPersistentUUID"), 0, &v102);
      v76 = objc_claimAutoreleasedReturnValue();
      v15 = v102;
      accountPersistentUUID = v11->_accountPersistentUUID;
      v11->_accountPersistentUUID = (NSString *)v76;

      if (v15)
        goto LABEL_52;
      v101 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EASAccountCertificatePersistentID"), 0, &v101);
      v78 = objc_claimAutoreleasedReturnValue();
      v15 = v101;
      certificatePersistentID = v11->_certificatePersistentID;
      v11->_certificatePersistentID = (NSData *)v78;

      if (v15)
        goto LABEL_52;
      v100 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ACAccountIdentifier"), 0, &v100);
      v80 = objc_claimAutoreleasedReturnValue();
      v15 = v100;
      acAccountIdentifier = v11->_acAccountIdentifier;
      v11->_acAccountIdentifier = (NSString *)v80;

      if (v15)
        goto LABEL_52;
    }
    else
    {
      if (-[NSNumber BOOLValue](v11->_useOAuth, "BOOLValue"))
        v85 = v11->_OAuthSignInURL != 0;
      else
        v85 = 1;
      v110 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Host"), v85, &v110);
      v86 = objc_claimAutoreleasedReturnValue();
      v15 = v110;
      v87 = v11->_hostname;
      v11->_hostname = (NSString *)v86;

      if (v15)
        goto LABEL_52;
      v109 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Password"), 0, &v109);
      v88 = objc_claimAutoreleasedReturnValue();
      v15 = v109;
      password = v11->_password;
      v11->_password = (NSString *)v88;

      if (v15)
        goto LABEL_52;
      v108 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Certificate"), 0, &v108);
      v90 = objc_claimAutoreleasedReturnValue();
      v15 = v108;
      embeddedCertificate = v11->_embeddedCertificate;
      v11->_embeddedCertificate = (NSData *)v90;

      if (v15)
        goto LABEL_52;
      v107 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("CertificateName"), 0, &v107);
      v92 = objc_claimAutoreleasedReturnValue();
      v15 = v107;
      embeddedCertificateName = v11->_embeddedCertificateName;
      v11->_embeddedCertificateName = (NSString *)v92;

      if (v15)
        goto LABEL_52;
      v106 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("CertificatePassword"), 0, &v106);
      v94 = objc_claimAutoreleasedReturnValue();
      v15 = v106;
      embeddedCertificatePassword = v11->_embeddedCertificatePassword;
      v11->_embeddedCertificatePassword = (NSString *)v94;

      if (v15)
        goto LABEL_52;
      v105 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("PayloadCertificateUUID"), 0, &v105);
      v96 = objc_claimAutoreleasedReturnValue();
      v15 = v105;
      certificateUUID = v11->_certificateUUID;
      v11->_certificateUUID = (NSString *)v96;

      if (v15)
        goto LABEL_52;
      v104 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("OverridePreviousPassword"), 0, &v104);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = v104;
      if (v99)
      {
        v15 = v99;

        goto LABEL_52;
      }
      v11->_overridePreviousPassword = objc_msgSend(v98, "BOOLValue");

    }
    v15 = 0;
  }
  else
  {
    v83 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("EAS_NO_SERVICES_ENABLED"), v57, v58, v59, v60, v61, v62, v63, 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCEASErrorDomain"), 21009, v84, 0, CFSTR("MCFatalError"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_52:

LABEL_53:
  if (v15)
    goto LABEL_6;
LABEL_11:
  if (objc_msgSend(v8, "count"))
  {
    v30 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v31 = v30;
      -[MCPayload friendlyName](v11, "friendlyName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v133 = v32;
      v134 = 2114;
      v135 = v8;
      _os_log_impl(&dword_19ECC4000, v31, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_15:
  return v11;
}

- (BOOL)hasCertificate
{
  return self->_embeddedCertificate || self->_certificateUUID != 0;
}

- (BOOL)enableMail
{
  NSNumber *enableMailNum;

  enableMailNum = self->_enableMailNum;
  return !enableMailNum || -[NSNumber BOOLValue](enableMailNum, "BOOLValue");
}

- (BOOL)enableContacts
{
  NSNumber *enableContactsNum;

  enableContactsNum = self->_enableContactsNum;
  return !enableContactsNum || -[NSNumber BOOLValue](enableContactsNum, "BOOLValue");
}

- (BOOL)enableCalendars
{
  NSNumber *enableCalendarsNum;

  enableCalendarsNum = self->_enableCalendarsNum;
  return !enableCalendarsNum || -[NSNumber BOOLValue](enableCalendarsNum, "BOOLValue");
}

- (BOOL)enableReminders
{
  NSNumber *enableRemindersNum;

  enableRemindersNum = self->_enableRemindersNum;
  return !enableRemindersNum || -[NSNumber BOOLValue](enableRemindersNum, "BOOLValue");
}

- (BOOL)enableNotes
{
  NSNumber *enableNotesNum;

  enableNotesNum = self->_enableNotesNum;
  return !enableNotesNum || -[NSNumber BOOLValue](enableNotesNum, "BOOLValue");
}

- (BOOL)enableMailUserOverridable
{
  NSNumber *enableMailUserOverridableNum;

  enableMailUserOverridableNum = self->_enableMailUserOverridableNum;
  return !enableMailUserOverridableNum || -[NSNumber BOOLValue](enableMailUserOverridableNum, "BOOLValue");
}

- (BOOL)enableContactsUserOverridable
{
  NSNumber *enableContactsUserOverridableNum;

  enableContactsUserOverridableNum = self->_enableContactsUserOverridableNum;
  return !enableContactsUserOverridableNum || -[NSNumber BOOLValue](enableContactsUserOverridableNum, "BOOLValue");
}

- (BOOL)enableCalendarsUserOverridable
{
  NSNumber *enableCalendarsUserOverridableNum;

  enableCalendarsUserOverridableNum = self->_enableCalendarsUserOverridableNum;
  return !enableCalendarsUserOverridableNum || -[NSNumber BOOLValue](enableCalendarsUserOverridableNum, "BOOLValue");
}

- (BOOL)enableRemindersUserOverridable
{
  NSNumber *enableRemindersUserOverridableNum;

  enableRemindersUserOverridableNum = self->_enableRemindersUserOverridableNum;
  return !enableRemindersUserOverridableNum || -[NSNumber BOOLValue](enableRemindersUserOverridableNum, "BOOLValue");
}

- (BOOL)enableNotesUserOverridable
{
  NSNumber *enableNotesUserOverridableNum;

  enableNotesUserOverridableNum = self->_enableNotesUserOverridableNum;
  return !enableNotesUserOverridableNum || -[NSNumber BOOLValue](enableNotesUserOverridableNum, "BOOLValue");
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSNumber *mailNumberOfPastDaysToSync;
  NSNumber *enableMailNum;
  void *v13;
  NSNumber *enableContactsNum;
  void *v15;
  NSNumber *enableCalendarsNum;
  void *v17;
  NSNumber *enableRemindersNum;
  void *v19;
  NSNumber *enableNotesNum;
  void *v21;
  NSNumber *enableMailUserOverridableNum;
  void *v23;
  NSNumber *enableContactsUserOverridableNum;
  void *v25;
  NSNumber *enableCalendarsUserOverridableNum;
  void *v27;
  NSNumber *enableRemindersUserOverridableNum;
  void *v29;
  NSNumber *enableNotesUserOverridableNum;
  void *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)MCEASAccountPayload;
  -[MCEmailAccountPayloadBase verboseDescription](&v33, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_accountDescription)
    objc_msgSend(v4, "appendFormat:", CFSTR("Description : %@\n"), self->_accountDescription);
  if (self->_hostname)
    objc_msgSend(v4, "appendFormat:", CFSTR("Host        : %@\n"), self->_hostname);
  if (self->_username)
    objc_msgSend(v4, "appendFormat:", CFSTR("Username    : %@\n"), self->_username);
  if (self->_password)
    objc_msgSend(v4, "appendFormat:", CFSTR("Password    : (set)\n"));
  if (self->_emailAddress)
    objc_msgSend(v4, "appendFormat:", CFSTR("Email       : %@\n"), self->_emailAddress);
  -[MCEASAccountPayload useSSL](self, "useSSL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCEASAccountPayload useSSL](self, "useSSL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MCStringForBool(objc_msgSend(v6, "BOOLValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("useSSL      : %@\n"), v7);

  }
  -[MCEASAccountPayload useOAuth](self, "useOAuth");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCEASAccountPayload useOAuth](self, "useOAuth");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MCStringForBool(objc_msgSend(v9, "BOOLValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("useOAuth    : %@\n"), v10);

  }
  if (self->_OAuthSignInURL)
    objc_msgSend(v4, "appendFormat:", CFSTR("OAuthSignInURL: %@\n"), self->_OAuthSignInURL);
  if (self->_OAuthTokenRequestURL)
    objc_msgSend(v4, "appendFormat:", CFSTR("OAuthTokenRequestURL: %@\n"), self->_OAuthTokenRequestURL);
  mailNumberOfPastDaysToSync = self->_mailNumberOfPastDaysToSync;
  if (mailNumberOfPastDaysToSync)
    objc_msgSend(v4, "appendFormat:", CFSTR("Sync # days : %d\n"), -[NSNumber intValue](mailNumberOfPastDaysToSync, "intValue"));
  if (self->_embeddedCertificate)
    objc_msgSend(v4, "appendFormat:", CFSTR("Certificate : Embedded\n"));
  if (self->_certificateUUID)
    objc_msgSend(v4, "appendFormat:", CFSTR("Certificate : %@\n"), self->_certificateUUID);
  if (self->_certificatePersistentID)
    objc_msgSend(v4, "appendFormat:", CFSTR("Certificate : %@\n"), self->_certificatePersistentID);
  if (self->_accountPersistentUUID)
    objc_msgSend(v4, "appendFormat:", CFSTR("PersistentUUID: %@\n"), self->_accountPersistentUUID);
  if (self->_syncDefaultFoldersOnly)
    objc_msgSend(v4, "appendFormat:", CFSTR("SyncDefaultFoldersOnly : Yes\n"));
  if (self->_acAccountIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("ACAccountIdentifier : %@\n"), self->_acAccountIdentifier);
  enableMailNum = self->_enableMailNum;
  if (enableMailNum)
  {
    MCStringForBool(-[NSNumber BOOLValue](enableMailNum, "BOOLValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Enable Mail     : %@\n"), v13);

  }
  enableContactsNum = self->_enableContactsNum;
  if (enableContactsNum)
  {
    MCStringForBool(-[NSNumber BOOLValue](enableContactsNum, "BOOLValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Enable Contacts : %@\n"), v15);

  }
  enableCalendarsNum = self->_enableCalendarsNum;
  if (enableCalendarsNum)
  {
    MCStringForBool(-[NSNumber BOOLValue](enableCalendarsNum, "BOOLValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Enable Calendars: %@\n"), v17);

  }
  enableRemindersNum = self->_enableRemindersNum;
  if (enableRemindersNum)
  {
    MCStringForBool(-[NSNumber BOOLValue](enableRemindersNum, "BOOLValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Enable Reminders: %@\n"), v19);

  }
  enableNotesNum = self->_enableNotesNum;
  if (enableNotesNum)
  {
    MCStringForBool(-[NSNumber BOOLValue](enableNotesNum, "BOOLValue"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Enable Notes    : %@\n"), v21);

  }
  enableMailUserOverridableNum = self->_enableMailUserOverridableNum;
  if (enableMailUserOverridableNum)
  {
    MCStringForBool(-[NSNumber BOOLValue](enableMailUserOverridableNum, "BOOLValue"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Enable Mail is user-overridable     : %@\n"), v23);

  }
  enableContactsUserOverridableNum = self->_enableContactsUserOverridableNum;
  if (enableContactsUserOverridableNum)
  {
    MCStringForBool(-[NSNumber BOOLValue](enableContactsUserOverridableNum, "BOOLValue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Enable Contacts is user-overridable : %@\n"), v25);

  }
  enableCalendarsUserOverridableNum = self->_enableCalendarsUserOverridableNum;
  if (enableCalendarsUserOverridableNum)
  {
    MCStringForBool(-[NSNumber BOOLValue](enableCalendarsUserOverridableNum, "BOOLValue"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Enable Calendars is user-overridable: %@\n"), v27);

  }
  enableRemindersUserOverridableNum = self->_enableRemindersUserOverridableNum;
  if (enableRemindersUserOverridableNum)
  {
    MCStringForBool(-[NSNumber BOOLValue](enableRemindersUserOverridableNum, "BOOLValue"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Enable Reminders is user-overridable: %@\n"), v29);

  }
  enableNotesUserOverridableNum = self->_enableNotesUserOverridableNum;
  if (enableNotesUserOverridableNum)
  {
    MCStringForBool(-[NSNumber BOOLValue](enableNotesUserOverridableNum, "BOOLValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Enable Notes is user-overridable    : %@\n"), v31);

  }
  return v4;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSString *accountDescription;
  NSString *hostname;
  NSString *username;
  NSString *emailAddress;
  NSNumber *useSSL;
  NSNumber *useOAuth;
  NSString *OAuthSignInURL;
  NSString *OAuthTokenRequestURL;
  NSNumber *mailNumberOfPastDaysToSync;
  void *v14;
  NSString *accountPersistentUUID;
  NSString *acAccountIdentifier;
  NSData *certificatePersistentID;
  NSDictionary *communicationServiceRules;
  NSNumber *enableMailNum;
  NSNumber *enableContactsNum;
  NSNumber *enableCalendarsNum;
  NSNumber *enableRemindersNum;
  NSNumber *enableNotesNum;
  NSNumber *enableMailUserOverridableNum;
  NSNumber *enableContactsUserOverridableNum;
  NSNumber *enableCalendarsUserOverridableNum;
  NSNumber *enableRemindersUserOverridableNum;
  NSNumber *enableNotesUserOverridableNum;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)MCEASAccountPayload;
  -[MCEmailAccountPayloadBase stubDictionary](&v30, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accountDescription = self->_accountDescription;
  if (accountDescription)
    objc_msgSend(v3, "setObject:forKey:", accountDescription, CFSTR("PayloadDisplayName"));
  hostname = self->_hostname;
  if (hostname)
    objc_msgSend(v4, "setObject:forKey:", hostname, CFSTR("Host"));
  username = self->_username;
  if (username)
    objc_msgSend(v4, "setObject:forKey:", username, CFSTR("UserName"));
  emailAddress = self->_emailAddress;
  if (emailAddress)
    objc_msgSend(v4, "setObject:forKey:", emailAddress, CFSTR("EmailAddress"));
  useSSL = self->_useSSL;
  if (useSSL)
    objc_msgSend(v4, "setObject:forKey:", useSSL, CFSTR("SSL"));
  useOAuth = self->_useOAuth;
  if (useOAuth)
    objc_msgSend(v4, "setObject:forKey:", useOAuth, CFSTR("OAuth"));
  OAuthSignInURL = self->_OAuthSignInURL;
  if (OAuthSignInURL)
    objc_msgSend(v4, "setObject:forKey:", OAuthSignInURL, CFSTR("OAuthSignInURL"));
  OAuthTokenRequestURL = self->_OAuthTokenRequestURL;
  if (OAuthTokenRequestURL)
    objc_msgSend(v4, "setObject:forKey:", OAuthTokenRequestURL, CFSTR("OAuthTokenRequestURL"));
  mailNumberOfPastDaysToSync = self->_mailNumberOfPastDaysToSync;
  if (mailNumberOfPastDaysToSync)
    objc_msgSend(v4, "setObject:forKey:", mailNumberOfPastDaysToSync, CFSTR("MailNumberOfPastDaysToSync"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_syncDefaultFoldersOnly);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("SyncDefaultFoldersOnly"));

  accountPersistentUUID = self->_accountPersistentUUID;
  if (accountPersistentUUID)
    objc_msgSend(v4, "setObject:forKey:", accountPersistentUUID, CFSTR("EASAccountPersistentUUID"));
  acAccountIdentifier = self->_acAccountIdentifier;
  if (acAccountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", acAccountIdentifier, CFSTR("ACAccountIdentifier"));
  certificatePersistentID = self->_certificatePersistentID;
  if (certificatePersistentID)
    objc_msgSend(v4, "setObject:forKey:", certificatePersistentID, CFSTR("EASAccountCertificatePersistentID"));
  communicationServiceRules = self->_communicationServiceRules;
  if (communicationServiceRules)
    objc_msgSend(v4, "setObject:forKey:", communicationServiceRules, CFSTR("CommunicationServiceRules"));
  enableMailNum = self->_enableMailNum;
  if (enableMailNum)
    objc_msgSend(v4, "setObject:forKey:", enableMailNum, CFSTR("EnableMail"));
  enableContactsNum = self->_enableContactsNum;
  if (enableContactsNum)
    objc_msgSend(v4, "setObject:forKey:", enableContactsNum, CFSTR("EnableContacts"));
  enableCalendarsNum = self->_enableCalendarsNum;
  if (enableCalendarsNum)
    objc_msgSend(v4, "setObject:forKey:", enableCalendarsNum, CFSTR("EnableCalendars"));
  enableRemindersNum = self->_enableRemindersNum;
  if (enableRemindersNum)
    objc_msgSend(v4, "setObject:forKey:", enableRemindersNum, CFSTR("EnableReminders"));
  enableNotesNum = self->_enableNotesNum;
  if (enableNotesNum)
    objc_msgSend(v4, "setObject:forKey:", enableNotesNum, CFSTR("EnableNotes"));
  enableMailUserOverridableNum = self->_enableMailUserOverridableNum;
  if (enableMailUserOverridableNum)
    objc_msgSend(v4, "setObject:forKey:", enableMailUserOverridableNum, CFSTR("EnableMailUserOverridable"));
  enableContactsUserOverridableNum = self->_enableContactsUserOverridableNum;
  if (enableContactsUserOverridableNum)
    objc_msgSend(v4, "setObject:forKey:", enableContactsUserOverridableNum, CFSTR("EnableContactsUserOverridable"));
  enableCalendarsUserOverridableNum = self->_enableCalendarsUserOverridableNum;
  if (enableCalendarsUserOverridableNum)
    objc_msgSend(v4, "setObject:forKey:", enableCalendarsUserOverridableNum, CFSTR("EnableCalendarsUserOverridable"));
  enableRemindersUserOverridableNum = self->_enableRemindersUserOverridableNum;
  if (enableRemindersUserOverridableNum)
    objc_msgSend(v4, "setObject:forKey:", enableRemindersUserOverridableNum, CFSTR("EnableRemindersUserOverridable"));
  enableNotesUserOverridableNum = self->_enableNotesUserOverridableNum;
  if (enableNotesUserOverridableNum)
    objc_msgSend(v4, "setObject:forKey:", enableNotesUserOverridableNum, CFSTR("EnableNotesUserOverridable"));
  return v4;
}

- (id)restrictions
{
  void *v2;
  void *v3;

  -[MCEASAccountPayload communicationServiceRules](self, "communicationServiceRules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCCommunicationServiceRulesUtilities restrictionsForValidatedCommunicationServiceRules:](MCCommunicationServiceRulesUtilities, "restrictionsForValidatedCommunicationServiceRules:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)emailAddress
{
  NSString *emailAddress;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  emailAddress = self->_emailAddress;
  if (emailAddress)
  {
    v4 = (void *)-[NSString copy](emailAddress, "copy");
  }
  else
  {
    -[MCEASAccountPayload username](self, "username");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          -[MCEASAccountPayload hostname](self, "hostname"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[MCEASAccountPayload username](self, "username");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCEASAccountPayload hostname](self, "hostname");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@@%@"), v9, v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return (NSString *)v4;
}

- (id)subtitle1Label
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[MCEASAccountPayload hostname](self, "hostname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = CFSTR("EAS_SERVER_NAME_COLON");
  else
    v3 = CFSTR("EAS_SERVER_NAME_MISSING");
  MCLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subtitle2Label
{
  void *v3;
  void *v4;
  void *v5;

  -[MCEASAccountPayload emailAddress](self, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCEASAccountPayload hostname](self, "hostname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      MCLocalizedString(CFSTR("EAS_EMAIL_ADDRESS_COLON"));
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

  -[MCEASAccountPayload emailAddress](self, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCEASAccountPayload hostname](self, "hostname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MCEASAccountPayload emailAddress](self, "emailAddress");
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
  NSString *emailAddress;
  void *v10;
  MCKeyValue *v11;
  MCKeyValue *v12;
  NSString *hostname;
  void *v14;
  MCKeyValue *v15;
  MCKeyValue *v16;
  NSString *username;
  void *v18;
  MCKeyValue *v19;
  MCKeyValue *v20;
  void *v21;
  void *v22;
  MCKeyValue *v23;
  MCKeyValue *v24;
  void *v25;
  void *v26;
  MCKeyValue *v27;
  MCKeyValue *v28;
  void *v29;
  void *v30;
  MCKeyValue *v31;
  MCKeyValue *v32;
  NSString *OAuthSignInURL;
  void *v34;
  MCKeyValue *v35;
  MCKeyValue *v36;
  NSString *OAuthTokenRequestURL;
  void *v38;
  MCKeyValue *v39;
  void *v40;
  MCKeyValue *v41;
  void *v42;
  MCKeyValue *v43;
  MCKeyValue *v44;
  void *v45;
  void *v46;
  MCKeyValue *v47;
  MCKeyValue *v48;
  void *v49;
  void *v50;
  MCKeyValue *v51;
  MCKeyValue *v52;
  void *v53;
  void *v54;
  MCKeyValue *v55;
  MCKeyValue *v56;
  void *v57;
  void *v58;
  MCKeyValue *v59;
  MCKeyValue *v60;
  void *v61;
  void *v62;
  MCKeyValue *v63;
  MCKeyValue *v64;
  void *v65;
  void *v66;
  MCKeyValue *v67;
  MCKeyValue *v68;
  void *v69;
  void *v70;
  MCKeyValue *v71;
  MCKeyValue *v72;
  void *v73;
  void *v74;
  MCKeyValue *v75;
  MCKeyValue *v76;
  void *v77;
  void *v78;
  MCKeyValue *v79;
  MCKeyValue *v80;
  void *v81;
  void *v82;
  MCKeyValue *v83;
  MCKeyValue *v84;
  void *v85;
  void *v86;
  MCKeyValue *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  MCKeyValue *v91;
  void *v92;
  MCKeyValue *v93;
  void *v94;
  void *v95;
  void *v96;
  objc_super v98;

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
  if (self->_emailAddress)
  {
    v8 = [MCKeyValue alloc];
    emailAddress = self->_emailAddress;
    MCLocalizedString(CFSTR("EXCHANGE_EMAIL_ADDRESS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MCKeyValue initWithLocalizedString:localizedKey:](v8, "initWithLocalizedString:localizedKey:", emailAddress, v10);

    objc_msgSend(v3, "addObject:", v11);
  }
  if (self->_hostname)
  {
    v12 = [MCKeyValue alloc];
    hostname = self->_hostname;
    MCLocalizedString(CFSTR("HOSTNAME"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MCKeyValue initWithLocalizedString:localizedKey:](v12, "initWithLocalizedString:localizedKey:", hostname, v14);

    objc_msgSend(v3, "addObject:", v15);
  }
  if (self->_username)
  {
    v16 = [MCKeyValue alloc];
    username = self->_username;
    MCLocalizedString(CFSTR("USERNAME"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MCKeyValue initWithLocalizedString:localizedKey:](v16, "initWithLocalizedString:localizedKey:", username, v18);

    objc_msgSend(v3, "addObject:", v19);
  }
  if (self->_password)
  {
    v20 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("PASSWORD"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MCKeyValue initWithLocalizedString:localizedKey:](v20, "initWithLocalizedString:localizedKey:", v21, v22);

    objc_msgSend(v3, "addObject:", v23);
  }
  if (self->_useSSL)
  {
    v24 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_useSSL, "BOOLValue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("USES_SSL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[MCKeyValue initWithLocalizedString:localizedKey:](v24, "initWithLocalizedString:localizedKey:", v25, v26);

    objc_msgSend(v3, "addObject:", v27);
  }
  if (self->_useOAuth)
  {
    v28 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_useOAuth, "BOOLValue"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("USES_OAUTH"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[MCKeyValue initWithLocalizedString:localizedKey:](v28, "initWithLocalizedString:localizedKey:", v29, v30);

    objc_msgSend(v3, "addObject:", v31);
  }
  if (self->_OAuthSignInURL)
  {
    v32 = [MCKeyValue alloc];
    OAuthSignInURL = self->_OAuthSignInURL;
    MCLocalizedString(CFSTR("OAUTH_SIGN_IN_URL"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[MCKeyValue initWithLocalizedString:localizedKey:](v32, "initWithLocalizedString:localizedKey:", OAuthSignInURL, v34);

    objc_msgSend(v3, "addObject:", v35);
  }
  if (self->_OAuthTokenRequestURL)
  {
    v36 = [MCKeyValue alloc];
    OAuthTokenRequestURL = self->_OAuthTokenRequestURL;
    MCLocalizedString(CFSTR("OAUTH_TOKEN_REQUEST_URL"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[MCKeyValue initWithLocalizedString:localizedKey:](v36, "initWithLocalizedString:localizedKey:", OAuthTokenRequestURL, v38);

    objc_msgSend(v3, "addObject:", v39);
  }
  if (self->_mailNumberOfPastDaysToSync)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_mailNumberOfPastDaysToSync);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("EXCHANGE_PAST_DAYS_TO_SYNC"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[MCKeyValue initWithLocalizedString:localizedKey:](v41, "initWithLocalizedString:localizedKey:", v40, v42);

    objc_msgSend(v3, "addObject:", v43);
  }
  if (self->_syncDefaultFoldersOnlyNum)
  {
    v44 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_syncDefaultFoldersOnlyNum, "BOOLValue"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXCHANGE_SYNC_DEFAULT_FOLDERS_ONLY"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[MCKeyValue initWithLocalizedString:localizedKey:](v44, "initWithLocalizedString:localizedKey:", v45, v46);

    objc_msgSend(v3, "addObject:", v47);
  }
  if (self->_enableMailNum)
  {
    v48 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_enableMailNum, "BOOLValue"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXCHANGE_ENABLE_MAIL"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[MCKeyValue initWithLocalizedString:localizedKey:](v48, "initWithLocalizedString:localizedKey:", v49, v50);

    objc_msgSend(v3, "addObject:", v51);
  }
  if (self->_enableContactsNum)
  {
    v52 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_enableContactsNum, "BOOLValue"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXCHANGE_ENABLE_CONTACTS"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[MCKeyValue initWithLocalizedString:localizedKey:](v52, "initWithLocalizedString:localizedKey:", v53, v54);

    objc_msgSend(v3, "addObject:", v55);
  }
  if (self->_enableCalendarsNum)
  {
    v56 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_enableCalendarsNum, "BOOLValue"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXCHANGE_ENABLE_CALENDARS"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[MCKeyValue initWithLocalizedString:localizedKey:](v56, "initWithLocalizedString:localizedKey:", v57, v58);

    objc_msgSend(v3, "addObject:", v59);
  }
  if (self->_enableRemindersNum)
  {
    v60 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_enableRemindersNum, "BOOLValue"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXCHANGE_ENABLE_REMINDERS"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -[MCKeyValue initWithLocalizedString:localizedKey:](v60, "initWithLocalizedString:localizedKey:", v61, v62);

    objc_msgSend(v3, "addObject:", v63);
  }
  if (self->_enableNotesNum)
  {
    v64 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_enableNotesNum, "BOOLValue"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXCHANGE_ENABLE_NOTES"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[MCKeyValue initWithLocalizedString:localizedKey:](v64, "initWithLocalizedString:localizedKey:", v65, v66);

    objc_msgSend(v3, "addObject:", v67);
  }
  if (self->_enableMailUserOverridableNum)
  {
    v68 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_enableMailUserOverridableNum, "BOOLValue"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXCHANGE_ENABLE_MAIL_USER_OVERRIDABLE"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = -[MCKeyValue initWithLocalizedString:localizedKey:](v68, "initWithLocalizedString:localizedKey:", v69, v70);

    objc_msgSend(v3, "addObject:", v71);
  }
  if (self->_enableContactsUserOverridableNum)
  {
    v72 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_enableContactsUserOverridableNum, "BOOLValue"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXCHANGE_ENABLE_CONTACTS_USER_OVERRIDABLE"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = -[MCKeyValue initWithLocalizedString:localizedKey:](v72, "initWithLocalizedString:localizedKey:", v73, v74);

    objc_msgSend(v3, "addObject:", v75);
  }
  if (self->_enableCalendarsUserOverridableNum)
  {
    v76 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_enableCalendarsUserOverridableNum, "BOOLValue"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXCHANGE_ENABLE_CALENDARS_USER_OVERRIDABLE"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = -[MCKeyValue initWithLocalizedString:localizedKey:](v76, "initWithLocalizedString:localizedKey:", v77, v78);

    objc_msgSend(v3, "addObject:", v79);
  }
  if (self->_enableRemindersUserOverridableNum)
  {
    v80 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_enableRemindersUserOverridableNum, "BOOLValue"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXCHANGE_ENABLE_REMINDERS_USER_OVERRIDABLE"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = -[MCKeyValue initWithLocalizedString:localizedKey:](v80, "initWithLocalizedString:localizedKey:", v81, v82);

    objc_msgSend(v3, "addObject:", v83);
  }
  if (self->_enableNotesUserOverridableNum)
  {
    v84 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_enableNotesUserOverridableNum, "BOOLValue"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EXCHANGE_ENABLE_NOTES_USER_OVERRIDABLE"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = -[MCKeyValue initWithLocalizedString:localizedKey:](v84, "initWithLocalizedString:localizedKey:", v85, v86);

    objc_msgSend(v3, "addObject:", v87);
  }
  if (self->_certificatePersistentID)
  {
    -[MCPayload profile](self, "profile");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "subjectSummaryFromCertificateWithPersistentID:", self->_certificatePersistentID);
    v89 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_certificateUUID)
      goto LABEL_49;
    -[MCPayload profile](self, "profile");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "subjectSummaryFromCertificatePayloadWithUUID:", self->_certificateUUID);
    v89 = objc_claimAutoreleasedReturnValue();
  }
  v90 = (void *)v89;

  if (v90)
  {
    v91 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("EXCHANGE_CERTIFICATE"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = -[MCKeyValue initWithLocalizedString:localizedKey:](v91, "initWithLocalizedString:localizedKey:", v90, v92);

    objc_msgSend(v3, "addObject:", v93);
  }
LABEL_49:
  v94 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "addObject:", v95);

  }
  v98.receiver = self;
  v98.super_class = (Class)MCEASAccountPayload;
  -[MCEmailAccountPayloadBase payloadDescriptionKeyValueSections](&v98, sel_payloadDescriptionKeyValueSections);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "addObjectsFromArray:", v96);

  if (!objc_msgSend(v94, "count"))
  {

    v94 = 0;
  }

  return v94;
}

- (BOOL)containsSensitiveUserInformation
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCEASAccountPayload;
  if (-[MCEmailAccountPayloadBase containsSensitiveUserInformation](&v10, sel_containsSensitiveUserInformation))
    return 1;
  -[MCEASAccountPayload password](self, "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = 1;
  }
  else
  {
    -[MCEASAccountPayload embeddedCertificate](self, "embeddedCertificate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v3 = 1;
    }
    else
    {
      -[MCEASAccountPayload embeddedCertificateName](self, "embeddedCertificateName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v3 = 1;
      }
      else
      {
        -[MCEASAccountPayload embeddedCertificatePassword](self, "embeddedCertificatePassword");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v3 = 1;
        }
        else
        {
          -[MCEASAccountPayload certificateUUID](self, "certificateUUID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
            v3 = 1;
          else
            v3 = -[MCEASAccountPayload hasCertificate](self, "hasCertificate");

        }
      }

    }
  }

  return v3;
}

- (BOOL)mustNotUseSynchronizableCredential
{
  void *v3;
  char v4;
  void *v5;

  -[MCEASAccountPayload password](self, "password");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[MCEASAccountPayload useOAuth](self, "useOAuth");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "BOOLValue");

  }
  return v4;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)mailNumberOfPastDaysToSync
{
  return self->_mailNumberOfPastDaysToSync;
}

- (NSData)embeddedCertificate
{
  return self->_embeddedCertificate;
}

- (NSString)embeddedCertificateName
{
  return self->_embeddedCertificateName;
}

- (NSString)embeddedCertificatePassword
{
  return self->_embeddedCertificatePassword;
}

- (void)setEmbeddedCertificatePassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)certificateUUID
{
  return self->_certificateUUID;
}

- (NSString)accountPersistentUUID
{
  return self->_accountPersistentUUID;
}

- (void)setAccountPersistentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSData)certificatePersistentID
{
  return self->_certificatePersistentID;
}

- (void)setCertificatePersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_certificatePersistentID, a3);
}

- (BOOL)syncDefaultFoldersOnly
{
  return self->_syncDefaultFoldersOnly;
}

- (void)setSyncDefaultFoldersOnly:(BOOL)a3
{
  self->_syncDefaultFoldersOnly = a3;
}

- (NSString)acAccountIdentifier
{
  return self->_acAccountIdentifier;
}

- (void)setAcAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_acAccountIdentifier, a3);
}

- (NSNumber)useSSL
{
  return self->_useSSL;
}

- (void)setUseSSL:(id)a3
{
  objc_storeStrong((id *)&self->_useSSL, a3);
}

- (NSNumber)useOAuth
{
  return self->_useOAuth;
}

- (void)setUseOAuth:(id)a3
{
  objc_storeStrong((id *)&self->_useOAuth, a3);
}

- (NSString)OAuthSignInURL
{
  return self->_OAuthSignInURL;
}

- (void)setOAuthSignInURL:(id)a3
{
  objc_storeStrong((id *)&self->_OAuthSignInURL, a3);
}

- (NSString)OAuthTokenRequestURL
{
  return self->_OAuthTokenRequestURL;
}

- (void)setOAuthTokenRequestURL:(id)a3
{
  objc_storeStrong((id *)&self->_OAuthTokenRequestURL, a3);
}

- (NSDictionary)communicationServiceRules
{
  return self->_communicationServiceRules;
}

- (BOOL)overridePreviousPassword
{
  return self->_overridePreviousPassword;
}

- (NSNumber)syncDefaultFoldersOnlyNum
{
  return self->_syncDefaultFoldersOnlyNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncDefaultFoldersOnlyNum, 0);
  objc_storeStrong((id *)&self->_communicationServiceRules, 0);
  objc_storeStrong((id *)&self->_OAuthTokenRequestURL, 0);
  objc_storeStrong((id *)&self->_OAuthSignInURL, 0);
  objc_storeStrong((id *)&self->_useOAuth, 0);
  objc_storeStrong((id *)&self->_useSSL, 0);
  objc_storeStrong((id *)&self->_acAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_enableNotesUserOverridableNum, 0);
  objc_storeStrong((id *)&self->_enableRemindersUserOverridableNum, 0);
  objc_storeStrong((id *)&self->_enableCalendarsUserOverridableNum, 0);
  objc_storeStrong((id *)&self->_enableContactsUserOverridableNum, 0);
  objc_storeStrong((id *)&self->_enableMailUserOverridableNum, 0);
  objc_storeStrong((id *)&self->_enableNotesNum, 0);
  objc_storeStrong((id *)&self->_enableRemindersNum, 0);
  objc_storeStrong((id *)&self->_enableCalendarsNum, 0);
  objc_storeStrong((id *)&self->_enableContactsNum, 0);
  objc_storeStrong((id *)&self->_enableMailNum, 0);
  objc_storeStrong((id *)&self->_certificatePersistentID, 0);
  objc_storeStrong((id *)&self->_accountPersistentUUID, 0);
  objc_storeStrong((id *)&self->_certificateUUID, 0);
  objc_storeStrong((id *)&self->_embeddedCertificatePassword, 0);
  objc_storeStrong((id *)&self->_embeddedCertificateName, 0);
  objc_storeStrong((id *)&self->_embeddedCertificate, 0);
  objc_storeStrong((id *)&self->_mailNumberOfPastDaysToSync, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
}

- (id)mailAccountIdentifiers
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
  return v2;
}

- (id)contactsAccountIdentifiers
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
  return v2;
}

- (id)calendarAccountIdentifiers
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
  return v2;
}

@end
