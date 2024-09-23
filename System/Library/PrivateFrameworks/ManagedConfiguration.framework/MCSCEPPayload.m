@implementation MCSCEPPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.security.scep"));
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

  return MCLocalizedFormat(CFSTR("SCEP_ENROLLMENT_REQUEST_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("SCEP_ENROLLMENT_REQUEST_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (BOOL)isRoot
{
  return 0;
}

- (BOOL)isIdentity
{
  return 1;
}

- (MCSCEPPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCSCEPPayload *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *URLString;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  int v51;
  uint64_t v52;
  NSString *CAInstanceName;
  uint64_t v54;
  NSString *challenge;
  uint64_t v56;
  NSArray *subject;
  uint64_t v58;
  NSDictionary *subjectAltName;
  uint64_t v60;
  NSData *CAFingerprint;
  uint64_t v62;
  NSArray *CACaps;
  void *v64;
  int v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
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
  objc_super v107;
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  id v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v107.receiver = self;
  v107.super_class = (Class)MCSCEPPayload;
  v10 = -[MCCertificatePayload initWithDictionary:profile:outError:](&v107, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_48;
  if ((objc_msgSend(v9, "isStub") & 1) == 0)
  {
    v106 = 0;
    +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadContent"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v106);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v106;
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v15 = v14;
    if (v12)
    {

      goto LABEL_43;
    }
    v105 = 0;
    +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v14, CFSTR("URL"), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v105);
    v16 = objc_claimAutoreleasedReturnValue();
    v12 = v105;
    URLString = v10->_URLString;
    v10->_URLString = (NSString *)v16;

    v94 = v15;
    objc_msgSend(v15, "objectForKey:", CFSTR("Keysize"));
    v18 = objc_claimAutoreleasedReturnValue();
    v93 = (void *)v18;
    if (v18)
    {
      v26 = (void *)v18;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v34 = objc_msgSend(v26, "intValue");
        v10->_keySize = v34;
        if (v34 == 1024)
        {
          v42 = v94;
        }
        else
        {
          v42 = v94;
          if (v34 != 2048 && v34 != 4096)
          {
            v90 = (void *)MEMORY[0x1E0CB35C8];
            MCErrorArray(CFSTR("ERROR_PROFILE_FIELD_INVALID_VALUE_P_FIELD"), v35, v36, v37, v38, v39, v40, v41, CFSTR("Keysize"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2004, v43, CFSTR("MCFatalError"));
            v91 = objc_claimAutoreleasedReturnValue();

            v12 = (id)v91;
          }
        }
        if (v12)
        {
          v51 = 2;
          goto LABEL_38;
        }
        v104 = 0;
        +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v42, CFSTR("Name"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v104);
        v52 = objc_claimAutoreleasedReturnValue();
        v50 = v104;
        CAInstanceName = v10->_CAInstanceName;
        v10->_CAInstanceName = (NSString *)v52;

        if (!v50)
        {
          v103 = 0;
          +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v42, CFSTR("Challenge"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v103);
          v54 = objc_claimAutoreleasedReturnValue();
          v50 = v103;
          challenge = v10->_challenge;
          v10->_challenge = (NSString *)v54;

          if (!v50)
          {
            v102 = 0;
            +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v42, CFSTR("Subject"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v102);
            v56 = objc_claimAutoreleasedReturnValue();
            v50 = v102;
            subject = v10->_subject;
            v10->_subject = (NSArray *)v56;

            if (!v50)
            {
              v101 = 0;
              +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v42, CFSTR("SubjectAltName"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v101);
              v58 = objc_claimAutoreleasedReturnValue();
              v50 = v101;
              subjectAltName = v10->_subjectAltName;
              v10->_subjectAltName = (NSDictionary *)v58;

              if (!v50)
              {
                v100 = 0;
                +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v42, CFSTR("CAFingerprint"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v100);
                v60 = objc_claimAutoreleasedReturnValue();
                v50 = v100;
                CAFingerprint = v10->_CAFingerprint;
                v10->_CAFingerprint = (NSData *)v60;

                if (!v50)
                {
                  v99 = 0;
                  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v42, CFSTR("GetCACaps"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v99);
                  v62 = objc_claimAutoreleasedReturnValue();
                  v50 = v99;
                  CACaps = v10->_CACaps;
                  v10->_CACaps = (NSArray *)v62;

                  if (!v50)
                  {
                    v98 = 0;
                    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v42, CFSTR("Key Usage"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v98);
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    v50 = v98;
                    v92 = v64;
                    if (v64)
                    {
                      v65 = objc_msgSend(v64, "unsignedIntValue");
                      v10->_usageFlags = v65;
                      if ((v65 & 0xFFFFFFFA) != 0)
                      {
                        v66 = (void *)MEMORY[0x1E0CB35C8];
                        objc_msgSend(v9, "friendlyName");
                        v12 = (id)objc_claimAutoreleasedReturnValue();
                        MCErrorArray(CFSTR("SCEP_ERROR_INVALID_USAGE_FLAG_P_FIELD"), v67, v68, v69, v70, v71, v72, v73, v12);
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v66, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCSCEPErrorDomain"), 22000, v74, CFSTR("MCFatalError"));
                        v75 = objc_claimAutoreleasedReturnValue();

                        v51 = 2;
                        v50 = (id)v75;
                        v42 = v94;
                        goto LABEL_58;
                      }
                      v42 = v94;
                      if (v50)
                        goto LABEL_27;
LABEL_33:
                      v97 = 0;
                      +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v42, CFSTR("Retries"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v97);
                      v12 = (id)objc_claimAutoreleasedReturnValue();
                      v76 = v97;
                      if (v76)
                      {
                        v50 = v76;
                        goto LABEL_35;
                      }
                      if (v12)
                        v88 = objc_msgSend(v12, "unsignedIntValue");
                      else
                        v88 = 3;
                      v10->_retries = v88;
                      v96 = 0;
                      +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v42, CFSTR("RetryDelay"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v96);
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      v50 = v96;
                      if (v50)
                      {
                        v51 = 2;
                      }
                      else
                      {
                        if (v74)
                          v89 = objc_msgSend(v74, "unsignedIntValue");
                        else
                          v89 = 10;
                        v51 = 0;
                        v10->_retryDelay = v89;
                      }
LABEL_58:

                      goto LABEL_36;
                    }
                    v42 = v94;
                  }
                }
              }
            }
          }
        }
        v92 = 0;
        v10->_usageFlags = 1;
        if (v50)
        {
LABEL_27:
          v12 = 0;
LABEL_35:
          v51 = 2;
LABEL_36:
          v47 = v92;
          goto LABEL_37;
        }
        goto LABEL_33;
      }
      v49 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), v27, v28, v29, v30, v31, v32, v33, CFSTR("Keysize"));
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = v49;
      v47 = (void *)v45;
      v48 = 2003;
    }
    else
    {
      v44 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), v19, v20, v21, v22, v23, v24, v25, CFSTR("Keysize"));
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = v44;
      v47 = (void *)v45;
      v48 = 2002;
    }
    objc_msgSend(v46, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), v48, v45, CFSTR("MCFatalError"));
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v51 = 2;
    v42 = v94;
LABEL_37:

    v12 = v50;
LABEL_38:

    if (v51)
      goto LABEL_42;
    goto LABEL_39;
  }
  v95 = 0;
  +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Keysize"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v95);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v95;
  v10->_keySize = objc_msgSend(v11, "unsignedIntValue");

  if (!v12)
  {
LABEL_39:
    if (objc_msgSend(v8, "count"))
    {
      v77 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v78 = v77;
        -[MCPayload friendlyName](v10, "friendlyName");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v109 = v79;
        v110 = 2114;
        v111 = v8;
        _os_log_impl(&dword_19ECC4000, v78, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);

      }
    }
LABEL_42:
    if (!v12)
      goto LABEL_48;
  }
LABEL_43:
  -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (a5)
    *a5 = objc_retainAutorelease(v80);
  v82 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v83 = v82;
    v84 = (void *)objc_opt_class();
    v85 = v84;
    objc_msgSend(v81, "MCVerboseDescription");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v109 = v84;
    v110 = 2114;
    v111 = v86;
    _os_log_impl(&dword_19ECC4000, v83, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

  }
  v10 = 0;
LABEL_48:

  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCSCEPPayload;
  -[MCCertificatePayload stubDictionary](&v6, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_keySize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Keysize"));

  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCSCEPPayload;
  -[MCCertificatePayload verboseDescription](&v8, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_URLString)
    objc_msgSend(v4, "appendFormat:", CFSTR("URL         : %@\n"), self->_URLString);
  if (self->_CAInstanceName)
    objc_msgSend(v4, "appendFormat:", CFSTR("CA Instance : %@\n"), self->_CAInstanceName);
  -[NSData MCHexString](self->_CAFingerprint, "MCHexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSData MCHexString](self->_CAFingerprint, "MCHexString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Fingerprint : %@\n"), v6);

  }
  if (self->_CACaps)
    objc_msgSend(v4, "appendFormat:", CFSTR("CA Caps     : %@\n"), self->_CACaps);
  if (self->_challenge)
    objc_msgSend(v4, "appendFormat:", CFSTR("Challenge   : (present)\n"));
  if (self->_subject)
    objc_msgSend(v4, "appendFormat:", CFSTR("Subject     : %@\n"), self->_subject);
  if (self->_subjectAltName)
    objc_msgSend(v4, "appendFormat:", CFSTR("Subject Alt : %@\n"), self->_subjectAltName);
  objc_msgSend(v4, "appendFormat:", CFSTR("Key size    : %u\n"), self->_keySize);
  objc_msgSend(v4, "appendFormat:", CFSTR("Retries     : %u\n"), self->_retries);
  objc_msgSend(v4, "appendFormat:", CFSTR("RetryDelay  : %u\n"), self->_retryDelay);
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  MCKeyValue *v4;
  NSString *URLString;
  void *v6;
  MCKeyValue *v7;
  MCKeyValue *v8;
  NSString *CAInstanceName;
  void *v10;
  MCKeyValue *v11;
  MCKeyValue *v12;
  NSData *CAFingerprint;
  void *v14;
  MCKeyValue *v15;
  MCKeyValue *v16;
  void *v17;
  void *v18;
  MCKeyValue *v19;
  void *v20;
  void *v21;
  void *v22;
  MCKeyValue *v23;
  void *v24;
  MCKeyValue *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (self->_URLString)
  {
    v4 = [MCKeyValue alloc];
    URLString = self->_URLString;
    MCLocalizedString(CFSTR("URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MCKeyValue initWithLocalizedString:localizedKey:](v4, "initWithLocalizedString:localizedKey:", URLString, v6);

    objc_msgSend(v3, "addObject:", v7);
  }
  if (self->_CAInstanceName)
  {
    v8 = [MCKeyValue alloc];
    CAInstanceName = self->_CAInstanceName;
    MCLocalizedString(CFSTR("CA_INSTANCE_NAME"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MCKeyValue initWithLocalizedString:localizedKey:](v8, "initWithLocalizedString:localizedKey:", CAInstanceName, v10);

    objc_msgSend(v3, "addObject:", v11);
  }
  if (self->_CAFingerprint)
  {
    v12 = [MCKeyValue alloc];
    CAFingerprint = self->_CAFingerprint;
    MCLocalizedString(CFSTR("CA_FINGERPRINT"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MCKeyValue initWithData:localizedKey:](v12, "initWithData:localizedKey:", CAFingerprint, v14);

    objc_msgSend(v3, "addObject:", v15);
  }
  if (self->_challenge)
  {
    v16 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("CHALLENGE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MCKeyValue initWithLocalizedString:localizedKey:](v16, "initWithLocalizedString:localizedKey:", v17, v18);

    objc_msgSend(v3, "addObject:", v19);
  }
  v20 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_keySize);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringFromNumber:numberStyle:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [MCKeyValue alloc];
  MCLocalizedString(CFSTR("KEY_SIZE"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[MCKeyValue initWithLocalizedString:localizedKey:](v23, "initWithLocalizedString:localizedKey:", v22, v24);
  objc_msgSend(v3, "addObject:", v25);

  +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (NSString)CAInstanceName
{
  return self->_CAInstanceName;
}

- (NSString)challenge
{
  return self->_challenge;
}

- (NSArray)subject
{
  return self->_subject;
}

- (unint64_t)keySize
{
  return self->_keySize;
}

- (int)usageFlags
{
  return self->_usageFlags;
}

- (NSData)CAFingerprint
{
  return self->_CAFingerprint;
}

- (NSArray)CACaps
{
  return self->_CACaps;
}

- (NSDictionary)subjectAltName
{
  return self->_subjectAltName;
}

- (unint64_t)retries
{
  return self->_retries;
}

- (unint64_t)retryDelay
{
  return self->_retryDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectAltName, 0);
  objc_storeStrong((id *)&self->_CACaps, 0);
  objc_storeStrong((id *)&self->_CAFingerprint, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_CAInstanceName, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
}

@end
