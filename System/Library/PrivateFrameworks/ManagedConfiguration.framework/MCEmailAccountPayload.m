@implementation MCEmailAccountPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.mail.managed"));
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

  return MCLocalizedFormat(CFSTR("EMAIL_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("EMAIL_ACCOUNT_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCEmailAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCEmailAccountPayload *v10;
  uint64_t v11;
  id v12;
  NSString *emailAccountType;
  uint64_t v14;
  NSString *incomingMailServerAuthentication;
  uint64_t v16;
  NSString *incomingMailServerHostname;
  uint64_t v18;
  NSString *outgoingMailServerAuthentication;
  uint64_t v20;
  NSString *outgoingMailServerHostname;
  uint64_t v22;
  NSString *incomingACAccountIdentifier;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString *v27;
  NSString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSString *v32;
  NSString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  NSString *v37;
  uint64_t v38;
  NSString *v39;
  NSString *v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSString *v44;
  uint64_t v45;
  NSString *incomingPassword;
  void *v47;
  uint64_t v48;
  NSString *emailAccountDescription;
  uint64_t v50;
  NSString *emailAddress;
  uint64_t v52;
  NSString *emailAccountName;
  uint64_t v54;
  NSString *incomingMailServerUsername;
  uint64_t v56;
  NSNumber *incomingMailServerPortNumber;
  uint64_t v58;
  NSNumber *incomingMailServerUseSSLNum;
  uint64_t v60;
  NSString *incomingMailServerIMAPPathPrefix;
  uint64_t v62;
  NSNumber *outgoingPasswordSameAsIncomingPasswordNum;
  uint64_t v64;
  NSString *outgoingMailServerUsername;
  uint64_t v66;
  NSNumber *outgoingMailServerPortNumber;
  uint64_t v68;
  NSNumber *outgoingMailServerUseSSLNum;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
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
  objc_super v109;
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  id v113;
  _QWORD v114[5];
  _QWORD v115[5];
  _QWORD v116[5];

  v116[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v109.receiver = self;
  v109.super_class = (Class)MCEmailAccountPayload;
  v10 = -[MCEmailAccountPayloadBase initWithDictionary:profile:outError:](&v109, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_38;
  if ((objc_msgSend(v9, "isStub") & 1) != 0)
  {
    v98 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("EmailAccountType"), 0, &v98);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v98;
    emailAccountType = v10->_emailAccountType;
    v10->_emailAccountType = (NSString *)v11;

    if (v12)
      goto LABEL_29;
    v97 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("IncomingMailServerAuthentication"), 0, &v97);
    v14 = objc_claimAutoreleasedReturnValue();
    v12 = v97;
    incomingMailServerAuthentication = v10->_incomingMailServerAuthentication;
    v10->_incomingMailServerAuthentication = (NSString *)v14;

    if (v12)
      goto LABEL_29;
    v96 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("IncomingMailServerHostName"), 0, &v96);
    v16 = objc_claimAutoreleasedReturnValue();
    v12 = v96;
    incomingMailServerHostname = v10->_incomingMailServerHostname;
    v10->_incomingMailServerHostname = (NSString *)v16;

    if (v12)
      goto LABEL_29;
    v95 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OutgoingMailServerAuthentication"), 0, &v95);
    v18 = objc_claimAutoreleasedReturnValue();
    v12 = v95;
    outgoingMailServerAuthentication = v10->_outgoingMailServerAuthentication;
    v10->_outgoingMailServerAuthentication = (NSString *)v18;

    if (v12)
      goto LABEL_29;
    v94 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OutgoingMailServerHostName"), 0, &v94);
    v20 = objc_claimAutoreleasedReturnValue();
    v12 = v94;
    outgoingMailServerHostname = v10->_outgoingMailServerHostname;
    v10->_outgoingMailServerHostname = (NSString *)v20;

    if (v12)
      goto LABEL_29;
    v93 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("IncomingACAccountIdentifier"), 0, &v93);
    v22 = objc_claimAutoreleasedReturnValue();
    v12 = v93;
    incomingACAccountIdentifier = v10->_incomingACAccountIdentifier;
    v10->_incomingACAccountIdentifier = (NSString *)v22;

    if (v12)
      goto LABEL_29;
    v92 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OutgoingACAccountIdentifier"), 0, &v92);
    v24 = objc_claimAutoreleasedReturnValue();
    v12 = v92;
    v25 = 360;
  }
  else
  {
    v108 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("EmailAccountType"), 1, &v108);
    v26 = objc_claimAutoreleasedReturnValue();
    v12 = v108;
    v27 = v10->_emailAccountType;
    v10->_emailAccountType = (NSString *)v26;

    if (v12)
      goto LABEL_29;
    v28 = v10->_emailAccountType;
    v116[0] = CFSTR("EmailTypePOP");
    v116[1] = CFSTR("EmailTypeIMAP");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0;
    +[MCProfile checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:](MCProfile, "checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:", v28, v29, CFSTR("EmailAccountType"), CFSTR("MCPayloadErrorDomain"), 2004, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v107);
    v30 = v107;

    v106 = v30;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("IncomingMailServerAuthentication"), 1, &v106);
    v31 = objc_claimAutoreleasedReturnValue();
    v12 = v106;

    v32 = v10->_incomingMailServerAuthentication;
    v10->_incomingMailServerAuthentication = (NSString *)v31;

    if (v12)
      goto LABEL_29;
    v33 = v10->_incomingMailServerAuthentication;
    v115[0] = CFSTR("EmailAuthNone");
    v115[1] = CFSTR("EmailAuthPassword");
    v115[2] = CFSTR("EmailAuthCRAMMD5");
    v115[3] = CFSTR("EmailAuthNTLM");
    v115[4] = CFSTR("EmailAuthHTTPMD5");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = 0;
    +[MCProfile checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:](MCProfile, "checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:", v33, v34, CFSTR("IncomingMailServerAuthentication"), CFSTR("MCPayloadErrorDomain"), 2004, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v105);
    v35 = v105;

    v104 = v35;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("IncomingMailServerHostName"), 1, &v104);
    v36 = objc_claimAutoreleasedReturnValue();
    v12 = v104;

    v37 = v10->_incomingMailServerHostname;
    v10->_incomingMailServerHostname = (NSString *)v36;

    if (v12)
      goto LABEL_29;
    v103 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OutgoingMailServerAuthentication"), 1, &v103);
    v38 = objc_claimAutoreleasedReturnValue();
    v12 = v103;
    v39 = v10->_outgoingMailServerAuthentication;
    v10->_outgoingMailServerAuthentication = (NSString *)v38;

    if (v12)
      goto LABEL_29;
    v40 = v10->_outgoingMailServerAuthentication;
    v114[0] = CFSTR("EmailAuthNone");
    v114[1] = CFSTR("EmailAuthPassword");
    v114[2] = CFSTR("EmailAuthCRAMMD5");
    v114[3] = CFSTR("EmailAuthNTLM");
    v114[4] = CFSTR("EmailAuthHTTPMD5");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 5);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = 0;
    +[MCProfile checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:](MCProfile, "checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:", v40, v41, CFSTR("OutgoingMailServerAuthentication"), CFSTR("MCPayloadErrorDomain"), 2004, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v102);
    v42 = v102;

    v101 = v42;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OutgoingMailServerHostName"), 1, &v101);
    v43 = objc_claimAutoreleasedReturnValue();
    v12 = v101;

    v44 = v10->_outgoingMailServerHostname;
    v10->_outgoingMailServerHostname = (NSString *)v43;

    if (v12)
      goto LABEL_29;
    v100 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("IncomingPassword"), 0, &v100);
    v45 = objc_claimAutoreleasedReturnValue();
    v12 = v100;
    incomingPassword = v10->_incomingPassword;
    v10->_incomingPassword = (NSString *)v45;

    if (v12)
      goto LABEL_29;
    v99 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OutgoingPassword"), 0, &v99);
    v24 = objc_claimAutoreleasedReturnValue();
    v12 = v99;
    v25 = 296;
  }
  v47 = *(Class *)((char *)&v10->super.super.super.isa + v25);
  *(Class *)((char *)&v10->super.super.super.isa + v25) = (Class)v24;

  if (v12)
    goto LABEL_29;
  v91 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("EmailAccountDescription"), 0, &v91);
  v48 = objc_claimAutoreleasedReturnValue();
  v12 = v91;
  emailAccountDescription = v10->_emailAccountDescription;
  v10->_emailAccountDescription = (NSString *)v48;

  if (v12)
    goto LABEL_29;
  v90 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("EmailAddress"), 0, &v90);
  v50 = objc_claimAutoreleasedReturnValue();
  v12 = v90;
  emailAddress = v10->_emailAddress;
  v10->_emailAddress = (NSString *)v50;

  if (v12)
    goto LABEL_29;
  v89 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("EmailAccountName"), 0, &v89);
  v52 = objc_claimAutoreleasedReturnValue();
  v12 = v89;
  emailAccountName = v10->_emailAccountName;
  v10->_emailAccountName = (NSString *)v52;

  if (v12)
    goto LABEL_29;
  v88 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("IncomingMailServerUsername"), 0, &v88);
  v54 = objc_claimAutoreleasedReturnValue();
  v12 = v88;
  incomingMailServerUsername = v10->_incomingMailServerUsername;
  v10->_incomingMailServerUsername = (NSString *)v54;

  if (v12)
    goto LABEL_29;
  v87 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("IncomingMailServerPortNumber"), 0, &v87);
  v56 = objc_claimAutoreleasedReturnValue();
  v12 = v87;
  incomingMailServerPortNumber = v10->_incomingMailServerPortNumber;
  v10->_incomingMailServerPortNumber = (NSNumber *)v56;

  if (v12)
    goto LABEL_29;
  v86 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("IncomingMailServerUseSSL"), 0, &v86);
  v58 = objc_claimAutoreleasedReturnValue();
  v12 = v86;
  incomingMailServerUseSSLNum = v10->_incomingMailServerUseSSLNum;
  v10->_incomingMailServerUseSSLNum = (NSNumber *)v58;

  if (v12)
    goto LABEL_29;
  v10->_incomingMailServerUseSSL = -[NSNumber BOOLValue](v10->_incomingMailServerUseSSLNum, "BOOLValue");
  v85 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("IncomingMailServerIMAPPathPrefix"), 0, &v85);
  v60 = objc_claimAutoreleasedReturnValue();
  v12 = v85;
  incomingMailServerIMAPPathPrefix = v10->_incomingMailServerIMAPPathPrefix;
  v10->_incomingMailServerIMAPPathPrefix = (NSString *)v60;

  if (v12)
    goto LABEL_29;
  v84 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("OutgoingPasswordSameAsIncomingPassword"), 0, &v84);
  v62 = objc_claimAutoreleasedReturnValue();
  v12 = v84;
  outgoingPasswordSameAsIncomingPasswordNum = v10->_outgoingPasswordSameAsIncomingPasswordNum;
  v10->_outgoingPasswordSameAsIncomingPasswordNum = (NSNumber *)v62;

  if (v12)
    goto LABEL_29;
  v10->_outgoingPasswordSameAsIncomingPassword = -[NSNumber BOOLValue](v10->_outgoingPasswordSameAsIncomingPasswordNum, "BOOLValue");
  v83 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OutgoingMailServerUsername"), 0, &v83);
  v64 = objc_claimAutoreleasedReturnValue();
  v12 = v83;
  outgoingMailServerUsername = v10->_outgoingMailServerUsername;
  v10->_outgoingMailServerUsername = (NSString *)v64;

  if (v12)
    goto LABEL_29;
  v82 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("OutgoingMailServerPortNumber"), 0, &v82);
  v66 = objc_claimAutoreleasedReturnValue();
  v12 = v82;
  outgoingMailServerPortNumber = v10->_outgoingMailServerPortNumber;
  v10->_outgoingMailServerPortNumber = (NSNumber *)v66;

  if (v12
    || (v81 = 0,
        objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("OutgoingMailServerUseSSL"), 0, &v81), v68 = objc_claimAutoreleasedReturnValue(), v12 = v81, outgoingMailServerUseSSLNum = v10->_outgoingMailServerUseSSLNum, v10->_outgoingMailServerUseSSLNum = (NSNumber *)v68, outgoingMailServerUseSSLNum, v12))
  {
LABEL_29:
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (a5)
      *a5 = objc_retainAutorelease(v70);
    v72 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v73 = v72;
      v74 = (void *)objc_opt_class();
      v75 = v74;
      objc_msgSend(v71, "MCVerboseDescription");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v111 = v74;
      v112 = 2114;
      v113 = v76;
      _os_log_impl(&dword_19ECC4000, v73, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
    goto LABEL_34;
  }
  v10->_outgoingMailServerUseSSL = -[NSNumber BOOLValue](v10->_outgoingMailServerUseSSLNum, "BOOLValue");
LABEL_34:
  if (objc_msgSend(v8, "count"))
  {
    v77 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v78 = v77;
      -[MCPayload friendlyName](v10, "friendlyName");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v111 = v79;
      v112 = 2114;
      v113 = v8;
      _os_log_impl(&dword_19ECC4000, v78, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_38:
  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSString *emailAccountDescription;
  NSString *emailAccountType;
  NSString *incomingMailServerHostname;
  NSString *emailAddress;
  NSString *emailAccountName;
  NSString *incomingMailServerAuthentication;
  NSString *v11;
  NSNumber *incomingMailServerPortNumber;
  NSNumber *incomingMailServerUseSSLNum;
  NSString *incomingMailServerUsername;
  NSString *incomingMailServerIMAPPathPrefix;
  NSString *incomingACAccountIdentifier;
  NSString *outgoingMailServerAuthentication;
  NSString *outgoingMailServerHostname;
  NSNumber *outgoingMailServerPortNumber;
  NSNumber *outgoingMailServerUseSSLNum;
  NSString *outgoingMailServerUsername;
  NSNumber *outgoingPasswordSameAsIncomingPasswordNum;
  NSString *outgoingACAccountIdentifier;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MCEmailAccountPayload;
  -[MCEmailAccountPayloadBase stubDictionary](&v25, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  emailAccountDescription = self->_emailAccountDescription;
  if (emailAccountDescription)
    objc_msgSend(v3, "setObject:forKey:", emailAccountDescription, CFSTR("EmailAccountDescription"));
  emailAccountType = self->_emailAccountType;
  if (emailAccountType)
    objc_msgSend(v4, "setObject:forKey:", emailAccountType, CFSTR("EmailAccountType"));
  incomingMailServerHostname = self->_incomingMailServerHostname;
  if (incomingMailServerHostname)
    objc_msgSend(v4, "setObject:forKey:", incomingMailServerHostname, CFSTR("IncomingMailServerHostName"));
  emailAddress = self->_emailAddress;
  if (emailAddress)
    objc_msgSend(v4, "setObject:forKey:", emailAddress, CFSTR("EmailAddress"));
  emailAccountName = self->_emailAccountName;
  if (emailAccountName)
    objc_msgSend(v4, "setObject:forKey:", emailAccountName, CFSTR("EmailAccountName"));
  incomingMailServerAuthentication = self->_incomingMailServerAuthentication;
  if (incomingMailServerAuthentication)
    objc_msgSend(v4, "setObject:forKey:", incomingMailServerAuthentication, CFSTR("IncomingMailServerAuthentication"));
  v11 = self->_incomingMailServerHostname;
  if (v11)
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("IncomingMailServerHostName"));
  incomingMailServerPortNumber = self->_incomingMailServerPortNumber;
  if (incomingMailServerPortNumber)
    objc_msgSend(v4, "setObject:forKey:", incomingMailServerPortNumber, CFSTR("IncomingMailServerPortNumber"));
  incomingMailServerUseSSLNum = self->_incomingMailServerUseSSLNum;
  if (incomingMailServerUseSSLNum)
    objc_msgSend(v4, "setObject:forKey:", incomingMailServerUseSSLNum, CFSTR("IncomingMailServerUseSSL"));
  incomingMailServerUsername = self->_incomingMailServerUsername;
  if (incomingMailServerUsername)
    objc_msgSend(v4, "setObject:forKey:", incomingMailServerUsername, CFSTR("IncomingMailServerUsername"));
  incomingMailServerIMAPPathPrefix = self->_incomingMailServerIMAPPathPrefix;
  if (incomingMailServerIMAPPathPrefix)
    objc_msgSend(v4, "setObject:forKey:", incomingMailServerIMAPPathPrefix, CFSTR("IncomingMailServerIMAPPathPrefix"));
  incomingACAccountIdentifier = self->_incomingACAccountIdentifier;
  if (incomingACAccountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", incomingACAccountIdentifier, CFSTR("IncomingACAccountIdentifier"));
  outgoingMailServerAuthentication = self->_outgoingMailServerAuthentication;
  if (outgoingMailServerAuthentication)
    objc_msgSend(v4, "setObject:forKey:", outgoingMailServerAuthentication, CFSTR("OutgoingMailServerAuthentication"));
  outgoingMailServerHostname = self->_outgoingMailServerHostname;
  if (outgoingMailServerHostname)
    objc_msgSend(v4, "setObject:forKey:", outgoingMailServerHostname, CFSTR("OutgoingMailServerHostName"));
  outgoingMailServerPortNumber = self->_outgoingMailServerPortNumber;
  if (outgoingMailServerPortNumber)
    objc_msgSend(v4, "setObject:forKey:", outgoingMailServerPortNumber, CFSTR("OutgoingMailServerPortNumber"));
  outgoingMailServerUseSSLNum = self->_outgoingMailServerUseSSLNum;
  if (outgoingMailServerUseSSLNum)
    objc_msgSend(v4, "setObject:forKey:", outgoingMailServerUseSSLNum, CFSTR("OutgoingMailServerUseSSL"));
  outgoingMailServerUsername = self->_outgoingMailServerUsername;
  if (outgoingMailServerUsername)
    objc_msgSend(v4, "setObject:forKey:", outgoingMailServerUsername, CFSTR("OutgoingMailServerUsername"));
  outgoingPasswordSameAsIncomingPasswordNum = self->_outgoingPasswordSameAsIncomingPasswordNum;
  if (outgoingPasswordSameAsIncomingPasswordNum)
    objc_msgSend(v4, "setObject:forKey:", outgoingPasswordSameAsIncomingPasswordNum, CFSTR("OutgoingPasswordSameAsIncomingPassword"));
  outgoingACAccountIdentifier = self->_outgoingACAccountIdentifier;
  if (outgoingACAccountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", outgoingACAccountIdentifier, CFSTR("OutgoingACAccountIdentifier"));
  return v4;
}

- (id)verboseDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSNumber *incomingMailServerPortNumber;
  void *v9;
  void *v10;
  NSNumber *outgoingMailServerPortNumber;
  void *v12;
  objc_super v14;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v14.receiver = self;
  v14.super_class = (Class)MCEmailAccountPayload;
  -[MCEmailAccountPayloadBase verboseDescription](&v14, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n"), v4);

  -[MCPayload profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isStub");

  if ((v7 & 1) == 0)
  {
    if (self->_emailAccountDescription)
      objc_msgSend(v5, "appendFormat:", CFSTR("Acct Desc  : %@\n"), self->_emailAccountDescription);
    if (self->_emailAccountName)
      objc_msgSend(v5, "appendFormat:", CFSTR("Name       : %@\n"), self->_emailAccountName);
    if (self->_emailAccountType)
      objc_msgSend(v5, "appendFormat:", CFSTR("Type       : %@\n"), self->_emailAccountType);
    if (self->_emailAddress)
      objc_msgSend(v5, "appendFormat:", CFSTR("Address    : %@\n"), self->_emailAddress);
    if (self->_incomingMailServerAuthentication)
      objc_msgSend(v5, "appendFormat:", CFSTR("Incoming server auth     : %@\n"), self->_incomingMailServerAuthentication);
    if (self->_incomingMailServerHostname)
      objc_msgSend(v5, "appendFormat:", CFSTR("Incoming server hostname : %@\n"), self->_incomingMailServerHostname);
    incomingMailServerPortNumber = self->_incomingMailServerPortNumber;
    if (incomingMailServerPortNumber)
      objc_msgSend(v5, "appendFormat:", CFSTR("Incoming server port     : %u\n"), -[NSNumber unsignedIntValue](incomingMailServerPortNumber, "unsignedIntValue"));
    MCStringForBool(self->_incomingMailServerUseSSL);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Incoming server uses SSL : %@\n"), v9);

    if (self->_incomingMailServerUsername)
      objc_msgSend(v5, "appendFormat:", CFSTR("Incoming server username : %@\n"), self->_incomingMailServerUsername);
    if (self->_incomingMailServerIMAPPathPrefix)
      objc_msgSend(v5, "appendFormat:", CFSTR("Incoming server IMAP pfx : %@\n"), self->_incomingMailServerIMAPPathPrefix);
    if (self->_incomingPassword)
      objc_msgSend(v5, "appendFormat:", CFSTR("Incoming server password : (set)\n"));
    if (self->_incomingACAccountIdentifier)
      objc_msgSend(v5, "appendFormat:", CFSTR("Incoming ACAccount Identifier : %@\n"), self->_incomingACAccountIdentifier);
    if (self->_outgoingPassword)
      objc_msgSend(v5, "appendFormat:", CFSTR("Outgoing server password : (set)\n"));
    MCStringForBool(self->_outgoingPasswordSameAsIncomingPassword);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Outgoing pwd same as incoming: %@\n"), v10);

    if (self->_outgoingMailServerAuthentication)
      objc_msgSend(v5, "appendFormat:", CFSTR("Outgoing server auth     : %@\n"), self->_outgoingMailServerAuthentication);
    if (self->_outgoingMailServerHostname)
      objc_msgSend(v5, "appendFormat:", CFSTR("Outgoing server hostname : %@\n"), self->_outgoingMailServerHostname);
    outgoingMailServerPortNumber = self->_outgoingMailServerPortNumber;
    if (outgoingMailServerPortNumber)
      objc_msgSend(v5, "appendFormat:", CFSTR("Outgoing server port     : %u\n"), -[NSNumber unsignedIntValue](outgoingMailServerPortNumber, "unsignedIntValue"));
    MCStringForBool(self->_outgoingMailServerUseSSL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Outgoing server uses SSL : %@\n"), v12);

    if (self->_outgoingMailServerUsername)
      objc_msgSend(v5, "appendFormat:", CFSTR("Outgoing server username : %@\n"), self->_outgoingMailServerUsername);
    if (self->_outgoingACAccountIdentifier)
      objc_msgSend(v5, "appendFormat:", CFSTR("Outgoing ACAccount Identifier : %@\n"), self->_outgoingACAccountIdentifier);
  }
  return v5;
}

- (id)subtitle1Label
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[MCEmailAccountPayload _emailAccountTypeLocalizedString](self, "_emailAccountTypeLocalizedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = CFSTR("EMAIL_ACCOUNT_TYPE_COLON");
  else
    v3 = CFSTR("EMAIL_ACCOUNT_ACCOUNT_TYPE_MISSING");
  MCLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subtitle2Label
{
  void *v3;
  void *v4;
  void *v5;

  -[MCEmailAccountPayload incomingMailServerHostname](self, "incomingMailServerHostname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCEmailAccountPayload _emailAccountTypeLocalizedString](self, "_emailAccountTypeLocalizedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SERVER_COLON"));
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

  -[MCEmailAccountPayload incomingMailServerHostname](self, "incomingMailServerHostname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[MCEmailAccountPayload _emailAccountTypeLocalizedString](self, "_emailAccountTypeLocalizedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MCEmailAccountPayload incomingMailServerHostname](self, "incomingMailServerHostname");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)_emailAccountTypeLocalizedString
{
  void *v2;
  int v3;
  __CFString *v4;

  -[MCEmailAccountPayload emailAccountType](self, "emailAccountType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("EmailTypeIMAP"));

  if (v3)
    v4 = CFSTR("EMAIL_ACCOUNT_TYPE_IMAP");
  else
    v4 = CFSTR("EMAIL_ACCOUNT_TYPE_POP");
  MCLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_authenticationTypeLocalizedString:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;

  v3 = a3;
  MCLocalizedString(CFSTR("AUTHENTICATION_TYPE_NONE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAuthPassword")) & 1) != 0)
  {
    v5 = CFSTR("AUTHENTICATION_TYPE_PASSWORD");
LABEL_9:
    MCLocalizedString(v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAuthCRAMMD5")) & 1) != 0)
  {
    v5 = CFSTR("AUTHENTICATION_TYPE_CRAMMD5");
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAuthNTLM")) & 1) != 0)
  {
    v5 = CFSTR("AUTHENTICATION_TYPE_NTLM");
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAuthHTTPMD5")))
  {
    v5 = CFSTR("AUTHENTICATION_TYPE_HTTPMD5");
    goto LABEL_9;
  }
LABEL_10:

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  MCKeyValue *v5;
  NSString *emailAccountDescription;
  void *v7;
  MCKeyValue *v8;
  MCKeyValue *v9;
  NSString *emailAccountName;
  void *v11;
  MCKeyValue *v12;
  MCKeyValue *v13;
  void *v14;
  void *v15;
  MCKeyValue *v16;
  MCKeyValue *v17;
  NSString *emailAddress;
  void *v19;
  MCKeyValue *v20;
  void *v21;
  uint64_t v22;
  MCKeyValue *v23;
  NSString *incomingMailServerHostname;
  void *v25;
  MCKeyValue *v26;
  MCKeyValue *v27;
  NSString *incomingMailServerUsername;
  void *v29;
  MCKeyValue *v30;
  MCKeyValue *v31;
  void *v32;
  void *v33;
  MCKeyValue *v34;
  MCKeyValue *v35;
  void *v36;
  void *v37;
  MCKeyValue *v38;
  MCKeyValue *v39;
  void *v40;
  void *v41;
  MCKeyValue *v42;
  void *v43;
  MCKeyValue *v44;
  void *v45;
  MCKeyValue *v46;
  MCKeyValue *v47;
  NSString *incomingMailServerIMAPPathPrefix;
  void *v49;
  MCKeyValue *v50;
  MCKeyValueSection *v51;
  void *v52;
  MCKeyValueSection *v53;
  uint64_t v54;
  MCKeyValue *v55;
  NSString *outgoingMailServerHostname;
  void *v57;
  MCKeyValue *v58;
  MCKeyValue *v59;
  NSString *outgoingMailServerUsername;
  void *v61;
  MCKeyValue *v62;
  MCKeyValue *v63;
  void *v64;
  void *v65;
  MCKeyValue *v66;
  MCKeyValue *v67;
  void *v68;
  void *v69;
  MCKeyValue *v70;
  MCKeyValue *v71;
  void *v72;
  void *v73;
  MCKeyValue *v74;
  MCKeyValue *v75;
  void *v76;
  void *v77;
  MCKeyValue *v78;
  void *v79;
  MCKeyValue *v80;
  void *v81;
  MCKeyValue *v82;
  MCKeyValueSection *v83;
  void *v84;
  MCKeyValueSection *v85;
  void *v86;
  objc_super v88;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  if (self->_emailAccountDescription)
  {
    v5 = [MCKeyValue alloc];
    emailAccountDescription = self->_emailAccountDescription;
    MCLocalizedString(CFSTR("ACCOUNT_DESCRIPTION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCKeyValue initWithLocalizedString:localizedKey:](v5, "initWithLocalizedString:localizedKey:", emailAccountDescription, v7);

    objc_msgSend(v4, "addObject:", v8);
  }
  if (self->_emailAccountName)
  {
    v9 = [MCKeyValue alloc];
    emailAccountName = self->_emailAccountName;
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_NAME"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MCKeyValue initWithLocalizedString:localizedKey:](v9, "initWithLocalizedString:localizedKey:", emailAccountName, v11);

    objc_msgSend(v4, "addObject:", v12);
  }
  if (self->_emailAccountType)
  {
    v13 = [MCKeyValue alloc];
    -[MCEmailAccountPayload _emailAccountTypeLocalizedString](self, "_emailAccountTypeLocalizedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("TYPE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MCKeyValue initWithLocalizedString:localizedKey:](v13, "initWithLocalizedString:localizedKey:", v14, v15);

    objc_msgSend(v4, "addObject:", v16);
  }
  if (self->_emailAddress)
  {
    v17 = [MCKeyValue alloc];
    emailAddress = self->_emailAddress;
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_ADDRESS"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MCKeyValue initWithLocalizedString:localizedKey:](v17, "initWithLocalizedString:localizedKey:", emailAddress, v19);

    objc_msgSend(v4, "addObject:", v20);
  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

    v22 = objc_opt_new();
    v4 = (void *)v22;
  }
  if (self->_incomingMailServerHostname)
  {
    v23 = [MCKeyValue alloc];
    incomingMailServerHostname = self->_incomingMailServerHostname;
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_HOSTNAME"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[MCKeyValue initWithLocalizedString:localizedKey:](v23, "initWithLocalizedString:localizedKey:", incomingMailServerHostname, v25);

    objc_msgSend(v4, "addObject:", v26);
  }
  if (self->_incomingMailServerUsername)
  {
    v27 = [MCKeyValue alloc];
    incomingMailServerUsername = self->_incomingMailServerUsername;
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_USERNAME"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MCKeyValue initWithLocalizedString:localizedKey:](v27, "initWithLocalizedString:localizedKey:", incomingMailServerUsername, v29);

    objc_msgSend(v4, "addObject:", v30);
  }
  if (self->_incomingMailServerAuthentication)
  {
    v31 = [MCKeyValue alloc];
    -[MCEmailAccountPayload _authenticationTypeLocalizedString:](self, "_authenticationTypeLocalizedString:", self->_incomingMailServerAuthentication);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_AUTHENTICATION"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[MCKeyValue initWithLocalizedString:localizedKey:](v31, "initWithLocalizedString:localizedKey:", v32, v33);

    objc_msgSend(v4, "addObject:", v34);
  }
  if (self->_incomingPassword)
  {
    v35 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PASSWORD_SET"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_PASSWORD"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[MCKeyValue initWithLocalizedString:localizedKey:](v35, "initWithLocalizedString:localizedKey:", v36, v37);

    objc_msgSend(v4, "addObject:", v38);
  }
  if (self->_incomingMailServerUseSSLNum)
  {
    v39 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_incomingMailServerUseSSLNum, "BOOLValue"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SSL"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[MCKeyValue initWithLocalizedString:localizedKey:](v39, "initWithLocalizedString:localizedKey:", v40, v41);

    objc_msgSend(v4, "addObject:", v42);
  }
  if (self->_incomingMailServerPortNumber)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_incomingMailServerPortNumber);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_PORT"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[MCKeyValue initWithLocalizedString:localizedKey:](v44, "initWithLocalizedString:localizedKey:", v43, v45);

    objc_msgSend(v4, "addObject:", v46);
  }
  if (self->_incomingMailServerIMAPPathPrefix)
  {
    v47 = [MCKeyValue alloc];
    incomingMailServerIMAPPathPrefix = self->_incomingMailServerIMAPPathPrefix;
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_IMAP_PATH_PREFIX"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[MCKeyValue initWithLocalizedString:localizedKey:](v47, "initWithLocalizedString:localizedKey:", incomingMailServerIMAPPathPrefix, v49);

    objc_msgSend(v4, "addObject:", v50);
  }
  if (objc_msgSend(v4, "count"))
  {
    v51 = [MCKeyValueSection alloc];
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_INCOMING_MAIL_SERVER"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[MCKeyValueSection initWithSectionTitle:footer:keyValues:](v51, "initWithSectionTitle:footer:keyValues:", v52, 0, v4);

    objc_msgSend(v3, "addObject:", v53);
    v54 = objc_opt_new();

    v4 = (void *)v54;
  }
  if (self->_outgoingMailServerHostname)
  {
    v55 = [MCKeyValue alloc];
    outgoingMailServerHostname = self->_outgoingMailServerHostname;
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_HOSTNAME"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[MCKeyValue initWithLocalizedString:localizedKey:](v55, "initWithLocalizedString:localizedKey:", outgoingMailServerHostname, v57);

    objc_msgSend(v4, "addObject:", v58);
  }
  if (self->_outgoingMailServerUsername)
  {
    v59 = [MCKeyValue alloc];
    outgoingMailServerUsername = self->_outgoingMailServerUsername;
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_USERNAME"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[MCKeyValue initWithLocalizedString:localizedKey:](v59, "initWithLocalizedString:localizedKey:", outgoingMailServerUsername, v61);

    objc_msgSend(v4, "addObject:", v62);
  }
  if (self->_outgoingMailServerAuthentication)
  {
    v63 = [MCKeyValue alloc];
    -[MCEmailAccountPayload _authenticationTypeLocalizedString:](self, "_authenticationTypeLocalizedString:", self->_outgoingMailServerAuthentication);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_AUTHENTICATION"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[MCKeyValue initWithLocalizedString:localizedKey:](v63, "initWithLocalizedString:localizedKey:", v64, v65);

    objc_msgSend(v4, "addObject:", v66);
  }
  if (self->_outgoingPassword)
  {
    v67 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PASSWORD_SET"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_PASSWORD"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = -[MCKeyValue initWithLocalizedString:localizedKey:](v67, "initWithLocalizedString:localizedKey:", v68, v69);

    objc_msgSend(v4, "addObject:", v70);
  }
  if (self->_outgoingPasswordSameAsIncomingPasswordNum)
  {
    v71 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_outgoingPasswordSameAsIncomingPasswordNum, "BOOLValue"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_OUTGOING_PASSWORD_SAME_AS_INCOMING"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = -[MCKeyValue initWithLocalizedString:localizedKey:](v71, "initWithLocalizedString:localizedKey:", v72, v73);

    objc_msgSend(v4, "addObject:", v74);
  }
  if (self->_outgoingMailServerUseSSLNum)
  {
    v75 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_outgoingMailServerUseSSLNum, "BOOLValue"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_SSL"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = -[MCKeyValue initWithLocalizedString:localizedKey:](v75, "initWithLocalizedString:localizedKey:", v76, v77);

    objc_msgSend(v4, "addObject:", v78);
  }
  if (self->_outgoingMailServerPortNumber)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_outgoingMailServerPortNumber);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_PORT"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = -[MCKeyValue initWithLocalizedString:localizedKey:](v80, "initWithLocalizedString:localizedKey:", v79, v81);

    objc_msgSend(v4, "addObject:", v82);
  }
  if (objc_msgSend(v4, "count"))
  {
    v83 = [MCKeyValueSection alloc];
    MCLocalizedString(CFSTR("EMAIL_ACCOUNT_OUTGOING_MAIL_SERVER"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = -[MCKeyValueSection initWithSectionTitle:footer:keyValues:](v83, "initWithSectionTitle:footer:keyValues:", v84, 0, v4);

    objc_msgSend(v3, "addObject:", v85);
  }
  v88.receiver = self;
  v88.super_class = (Class)MCEmailAccountPayload;
  -[MCEmailAccountPayloadBase payloadDescriptionKeyValueSections](&v88, sel_payloadDescriptionKeyValueSections);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v86, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", v86);
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

+ (id)profileNameFromAccountTag:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("|"), 4);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = &stru_1E41E70C8;
  }
  else
  {
    objc_msgSend(v3, "substringWithRange:", v4 + 1, objc_msgSend(v3, "length") + ~v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)containsSensitiveUserInformation
{
  BOOL v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCEmailAccountPayload;
  if (-[MCEmailAccountPayloadBase containsSensitiveUserInformation](&v7, sel_containsSensitiveUserInformation))
    return 1;
  -[MCEmailAccountPayload incomingPassword](self, "incomingPassword");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = 1;
  }
  else
  {
    -[MCEmailAccountPayload outgoingPassword](self, "outgoingPassword");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 != 0;

  }
  return v3;
}

- (NSString)emailAccountDescription
{
  return self->_emailAccountDescription;
}

- (NSString)emailAccountName
{
  return self->_emailAccountName;
}

- (NSString)emailAccountType
{
  return self->_emailAccountType;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSString)incomingMailServerAuthentication
{
  return self->_incomingMailServerAuthentication;
}

- (NSString)incomingMailServerHostname
{
  return self->_incomingMailServerHostname;
}

- (NSNumber)incomingMailServerPortNumber
{
  return self->_incomingMailServerPortNumber;
}

- (BOOL)incomingMailServerUseSSL
{
  return self->_incomingMailServerUseSSL;
}

- (NSString)incomingMailServerUsername
{
  return self->_incomingMailServerUsername;
}

- (NSString)incomingMailServerIMAPPathPrefix
{
  return self->_incomingMailServerIMAPPathPrefix;
}

- (NSString)incomingPassword
{
  return self->_incomingPassword;
}

- (NSString)incomingACAccountIdentifier
{
  return self->_incomingACAccountIdentifier;
}

- (void)setIncomingACAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_incomingACAccountIdentifier, a3);
}

- (NSString)outgoingPassword
{
  return self->_outgoingPassword;
}

- (BOOL)outgoingPasswordSameAsIncomingPassword
{
  return self->_outgoingPasswordSameAsIncomingPassword;
}

- (NSString)outgoingMailServerAuthentication
{
  return self->_outgoingMailServerAuthentication;
}

- (NSString)outgoingMailServerHostname
{
  return self->_outgoingMailServerHostname;
}

- (NSNumber)outgoingMailServerPortNumber
{
  return self->_outgoingMailServerPortNumber;
}

- (BOOL)outgoingMailServerUseSSL
{
  return self->_outgoingMailServerUseSSL;
}

- (NSString)outgoingMailServerUsername
{
  return self->_outgoingMailServerUsername;
}

- (NSString)outgoingACAccountIdentifier
{
  return self->_outgoingACAccountIdentifier;
}

- (void)setOutgoingACAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingACAccountIdentifier, a3);
}

- (NSNumber)incomingMailServerUseSSLNum
{
  return self->_incomingMailServerUseSSLNum;
}

- (NSNumber)outgoingPasswordSameAsIncomingPasswordNum
{
  return self->_outgoingPasswordSameAsIncomingPasswordNum;
}

- (NSNumber)outgoingMailServerUseSSLNum
{
  return self->_outgoingMailServerUseSSLNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingMailServerUseSSLNum, 0);
  objc_storeStrong((id *)&self->_outgoingPasswordSameAsIncomingPasswordNum, 0);
  objc_storeStrong((id *)&self->_incomingMailServerUseSSLNum, 0);
  objc_storeStrong((id *)&self->_outgoingACAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_incomingACAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_outgoingMailServerUsername, 0);
  objc_storeStrong((id *)&self->_outgoingMailServerPortNumber, 0);
  objc_storeStrong((id *)&self->_outgoingMailServerHostname, 0);
  objc_storeStrong((id *)&self->_outgoingMailServerAuthentication, 0);
  objc_storeStrong((id *)&self->_outgoingPassword, 0);
  objc_storeStrong((id *)&self->_incomingPassword, 0);
  objc_storeStrong((id *)&self->_incomingMailServerIMAPPathPrefix, 0);
  objc_storeStrong((id *)&self->_incomingMailServerUsername, 0);
  objc_storeStrong((id *)&self->_incomingMailServerPortNumber, 0);
  objc_storeStrong((id *)&self->_incomingMailServerHostname, 0);
  objc_storeStrong((id *)&self->_incomingMailServerAuthentication, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_emailAccountType, 0);
  objc_storeStrong((id *)&self->_emailAccountName, 0);
  objc_storeStrong((id *)&self->_emailAccountDescription, 0);
}

- (id)mailAccountIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_incomingACAccountIdentifier)
    objc_msgSend(v3, "addObject:");
  if (self->_outgoingACAccountIdentifier)
    objc_msgSend(v4, "addObject:");
  if (objc_msgSend(v4, "count"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

@end
