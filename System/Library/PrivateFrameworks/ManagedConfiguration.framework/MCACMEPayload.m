@implementation MCACMEPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.security.acme"));
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

  return MCLocalizedFormat(CFSTR("ACME_REQUEST_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("ACME_REQUEST_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (BOOL)isRoot
{
  return 0;
}

- (BOOL)isIdentity
{
  return 1;
}

- (MCACMEPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCACMEPayload *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v23;
  NSString *directoryURLString;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSString *clientIdentifier;
  uint64_t v32;
  NSString *keyType;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSArray *subject;
  NSArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  NSDictionary *subjectAltName;
  id v62;
  void *v63;
  uint64_t v64;
  id v65;
  NSArray *extendedKeyUsage;
  NSArray *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  id v71;
  unint64_t keySize;
  const __CFString *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSArray *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  id obj;
  id obja;
  id v86;
  id v87;
  void *v88;
  uint64_t v89;
  MCACMEPayload *v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  id v97[2];
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  objc_super v117;
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  id v121;
  _BYTE v122[128];
  _QWORD v123[4];
  _QWORD v124[4];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v117.receiver = self;
  v117.super_class = (Class)MCACMEPayload;
  v10 = -[MCCertificatePayload initWithDictionary:profile:outError:](&v117, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_14;
  v116 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("HardwareBound"), 1, &v116);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v116;
  if (v12)
    goto LABEL_3;
  v10->_isHardwareBound = objc_msgSend(v11, "BOOLValue");
  if ((objc_msgSend(v9, "isStub") & 1) != 0)
  {
    v12 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v115 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("DirectoryURL"), 1, &v115);
  v23 = objc_claimAutoreleasedReturnValue();
  v12 = v115;
  directoryURLString = v10->_directoryURLString;
  v10->_directoryURLString = (NSString *)v23;

  if (v12)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10->_directoryURLString);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25
    && (objc_msgSend(v25, "scheme"),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v28 = objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("https")),
        v27,
        !v28))
  {
    v29 = 0;
  }
  else
  {
    +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("DirectoryURL"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v114 = v29;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ClientIdentifier"), 1, &v114);
  v30 = objc_claimAutoreleasedReturnValue();
  v12 = v114;

  clientIdentifier = v10->_clientIdentifier;
  v10->_clientIdentifier = (NSString *)v30;

  if (v12
    || (v113 = 0,
        objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("KeyType"), 1, &v113), v32 = objc_claimAutoreleasedReturnValue(), v12 = v113, keyType = v10->_keyType, v10->_keyType = (NSString *)v32, keyType, v12))
  {

LABEL_3:
LABEL_4:
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    v14 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      v16 = (void *)objc_opt_class();
      v17 = v16;
      objc_msgSend(v11, "MCVerboseDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v119 = v16;
      v120 = 2114;
      v121 = v18;
      _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
    goto LABEL_9;
  }
  if (!-[NSString isEqualToString:](v10->_keyType, "isEqualToString:", CFSTR("RSA"))
    && !-[NSString isEqualToString:](v10->_keyType, "isEqualToString:", CFSTR("ECSECPrimeRandom")))
  {
    +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("KeyType"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_87;
  }
  v112 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("KeySize"), 1, &v112);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v112;
  if (!v12)
  {
    v88 = v34;
    v35 = objc_msgSend(v34, "integerValue");
    if (v35 < 0)
    {
      +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("KeySize"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_85:
      v34 = v88;
      goto LABEL_86;
    }
    v10->_keySize = v35;
    v111 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Subject"), 1, &v111);
    v36 = objc_claimAutoreleasedReturnValue();
    v12 = v111;
    subject = v10->_subject;
    v10->_subject = (NSArray *)v36;

    v34 = v88;
    if (!v12)
    {
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v38 = v10->_subject;
      v39 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v108;
        v78 = *(_QWORD *)v108;
        do
        {
          v77 = v39;
          v41 = 0;
          do
          {
            if (*(_QWORD *)v108 != v40)
            {
              v42 = v41;
              objc_enumerationMutation(v38);
              v41 = v42;
            }
            v82 = v41;
            v43 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v41);
            v103 = 0u;
            v104 = 0u;
            v105 = 0u;
            v106 = 0u;
            v44 = v43;
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v103, v126, 16);
            if (v45)
            {
              v46 = *(_QWORD *)v104;
              v79 = v38;
              v76 = *(_QWORD *)v104;
              obj = v44;
              while (2)
              {
                v75 = v45;
                v47 = 0;
                do
                {
                  if (*(_QWORD *)v104 != v46)
                    objc_enumerationMutation(obj);
                  v80 = v47;
                  v48 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v47);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Subject"));
                    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_77:

                    goto LABEL_85;
                  }
                  v101 = 0u;
                  v102 = 0u;
                  v99 = 0u;
                  v100 = 0u;
                  v86 = v48;
                  v49 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v99, v125, 16);
                  if (v49)
                  {
                    v50 = v49;
                    v89 = *(_QWORD *)v100;
                    while (2)
                    {
                      for (i = 0; i != v50; ++i)
                      {
                        if (*(_QWORD *)v100 != v89)
                          objc_enumerationMutation(v86);
                        v52 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v52, "length"))
                        {
                          +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Subject"));
                          v12 = (id)objc_claimAutoreleasedReturnValue();

                          goto LABEL_77;
                        }
                      }
                      v50 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v99, v125, 16);
                      if (v50)
                        continue;
                      break;
                    }
                  }

                  v47 = v80 + 1;
                  v46 = v76;
                }
                while (v80 + 1 != v75);
                v44 = obj;
                v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v126, 16);
                v46 = v76;
                v38 = v79;
                if (v45)
                  continue;
                break;
              }
            }

            v41 = v82 + 1;
            v40 = v78;
          }
          while (v82 + 1 != v77);
          v39 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
          v40 = v78;
        }
        while (v39);
      }

      v98 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SubjectAltName"), 0, &v98);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v98;
      if (v12)
        goto LABEL_84;
      obja = v11;
      v87 = v53;
      v54 = objc_msgSend(v53, "mutableCopy");
      v123[0] = CFSTR("dNSName");
      v124[0] = objc_opt_class();
      v123[1] = CFSTR("ntPrincipalName");
      v124[1] = objc_opt_class();
      v123[2] = CFSTR("rfc822Name");
      v124[2] = objc_opt_class();
      v123[3] = CFSTR("uniformResourceIdentifier");
      v124[3] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, v123, 4);
      v55 = objc_claimAutoreleasedReturnValue();
      v97[1] = 0;
      v56 = (void *)v54;
      v57 = (void *)v54;
      v58 = (void *)v55;
      objc_msgSend(v57, "MCMutableDictionaryContainingValidatedKeysAndClasses:removeKeys:outError:");
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = 0;
      subjectAltName = v10->_subjectAltName;
      v90 = v10;
      v10->_subjectAltName = (NSDictionary *)v59;

      v62 = v60;
      if (v60)
      {
LABEL_83:

        v12 = v62;
        v11 = obja;
        v10 = v90;
        v53 = v87;
LABEL_84:

        goto LABEL_85;
      }
      v97[0] = 0;
      v81 = v8;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("UsageFlags"), 0, v97);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v97[0];
      if (v62)
        goto LABEL_82;
      v90->_usageFlags = objc_msgSend(v63, "unsignedIntValue");
      v96 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ExtendedKeyUsage"), 0, &v96);
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = v96;
      extendedKeyUsage = v90->_extendedKeyUsage;
      v90->_extendedKeyUsage = (NSArray *)v64;

      v62 = v65;
      if (v65)
      {
LABEL_82:

        v8 = v81;
        goto LABEL_83;
      }
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v67 = v90->_extendedKeyUsage;
      v68 = -[NSArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v92, v122, 16);
      if (v68)
      {
        v69 = v68;
        v83 = *(_QWORD *)v93;
        while (2)
        {
          for (j = 0; j != v69; ++j)
          {
            if (*(_QWORD *)v93 != v83)
              objc_enumerationMutation(v67);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * j), "length"))
            {
              +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("ExtendedKeyUsage"));
              v71 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_80;
            }
          }
          v69 = -[NSArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v92, v122, 16);
          if (v69)
            continue;
          break;
        }
      }

      v91 = 0;
      objc_msgSend(v81, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Attest"), 0, &v91);
      v67 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v71 = v91;
      if (v71)
        goto LABEL_80;
      v90->_attest = -[NSArray BOOLValue](v67, "BOOLValue");
      if (!v90->_isHardwareBound)
        goto LABEL_104;
      if (!-[NSString isEqualToString:](v90->_keyType, "isEqualToString:", CFSTR("ECSECPrimeRandom")))
      {
        v73 = CFSTR("KeyType");
        goto LABEL_101;
      }
      if ((v90->_keySize | 0x80) == 0x180)
      {
LABEL_104:
        if (-[NSString isEqualToString:](v90->_keyType, "isEqualToString:", CFSTR("RSA")))
        {
          keySize = v90->_keySize;
          if ((keySize & 7) != 0 || keySize - 4097 <= 0xFFFFFFFFFFFFF3FELL)
            goto LABEL_73;
        }
        else if (-[NSString isEqualToString:](v90->_keyType, "isEqualToString:", CFSTR("ECSECPrimeRandom")))
        {
          v74 = v90->_keySize;
          if (v74 > 383)
          {
            if (v74 != 384 && v74 != 521)
              goto LABEL_73;
          }
          else if (v74 != 192 && v74 != 256)
          {
            goto LABEL_73;
          }
        }
        if (!v90->_attest || v90->_isHardwareBound)
        {
          v62 = 0;
          goto LABEL_81;
        }
        v73 = CFSTR("Attest");
        goto LABEL_101;
      }
LABEL_73:
      v73 = CFSTR("KeySize");
LABEL_101:
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", v73);
      v71 = (id)objc_claimAutoreleasedReturnValue();
LABEL_80:
      v62 = v71;
LABEL_81:

      goto LABEL_82;
    }
  }
LABEL_86:

LABEL_87:
  if (v12)
    goto LABEL_4;
LABEL_10:
  if (objc_msgSend(v8, "count"))
  {
    v19 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      -[MCPayload friendlyName](v10, "friendlyName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v119 = v21;
      v120 = 2114;
      v121 = v8;
      _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_14:
  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCACMEPayload;
  -[MCCertificatePayload stubDictionary](&v6, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isHardwareBound);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("HardwareBound"));

  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCACMEPayload;
  -[MCCertificatePayload verboseDescription](&v6, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_directoryURLString)
    objc_msgSend(v4, "appendFormat:", CFSTR("DirectoryURL  : %@\n"), self->_directoryURLString);
  if (self->_clientIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("Identifier    : %@\n"), self->_clientIdentifier);
  if (self->_keyType)
    objc_msgSend(v4, "appendFormat:", CFSTR("KeyType       : %@\n"), self->_keyType);
  if (self->_keySize)
    objc_msgSend(v4, "appendFormat:", CFSTR("KeySize       : %lu\n"), self->_keySize);
  if (self->_isHardwareBound)
    objc_msgSend(v4, "appendFormat:", CFSTR("HardwareBound : %i\n"), 1);
  if (self->_subject)
    objc_msgSend(v4, "appendFormat:", CFSTR("Subject       : %@\n"), self->_subject);
  if (self->_subjectAltName)
    objc_msgSend(v4, "appendFormat:", CFSTR("SAN           : %@\n"), self->_subjectAltName);
  if (self->_usageFlags)
    objc_msgSend(v4, "appendFormat:", CFSTR("UsageFlags    : %u\n"), self->_usageFlags);
  if (self->_extendedKeyUsage)
    objc_msgSend(v4, "appendFormat:", CFSTR("EKU           : %@\n"), self->_extendedKeyUsage);
  return v4;
}

- (id)subtitle1Description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;

  -[MCCertificatePayload issuer](self, "issuer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MCPayload profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isStub");

    if (v7)
      v8 = CFSTR("ISSUED_BY_MISSING");
    else
      v8 = CFSTR("IDENTITY_INSTALL_DESCRIPTION_UNKNOWN");
    MCLocalizedString(v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v5;

  return v9;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  char v5;
  MCKeyValue *v6;
  NSString *directoryURLString;
  void *v8;
  MCKeyValue *v9;
  MCKeyValue *v10;
  void *v11;
  void *v12;
  MCKeyValue *v13;
  MCKeyValue *v14;
  NSString *keyType;
  void *v16;
  MCKeyValue *v17;
  void *v18;
  void *v19;
  void *v20;
  MCKeyValue *v21;
  void *v22;
  MCKeyValue *v23;
  MCKeyValue *v24;
  void *v25;
  void *v26;
  MCKeyValue *v27;
  void *v28;
  void *v29;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[MCPayload profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStub");

  if ((v5 & 1) == 0)
  {
    if (self->_directoryURLString)
    {
      v6 = [MCKeyValue alloc];
      directoryURLString = self->_directoryURLString;
      MCLocalizedString(CFSTR("URL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MCKeyValue initWithLocalizedString:localizedKey:](v6, "initWithLocalizedString:localizedKey:", directoryURLString, v8);

      objc_msgSend(v3, "addObject:", v9);
    }
    if (self->super.super._identifier)
    {
      v10 = [MCKeyValue alloc];
      MCLocalizedString(CFSTR("PRESENT"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedString(CFSTR("CLIENT_IDENTIFIER"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[MCKeyValue initWithLocalizedString:localizedKey:](v10, "initWithLocalizedString:localizedKey:", v11, v12);

      objc_msgSend(v3, "addObject:", v13);
    }
    if (self->_keyType)
    {
      v14 = [MCKeyValue alloc];
      keyType = self->_keyType;
      MCLocalizedString(CFSTR("KEY_TYPE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[MCKeyValue initWithLocalizedString:localizedKey:](v14, "initWithLocalizedString:localizedKey:", keyType, v16);

      objc_msgSend(v3, "addObject:", v17);
    }
    v18 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_keySize);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringFromNumber:numberStyle:", v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("KEY_SIZE"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MCKeyValue initWithLocalizedString:localizedKey:](v21, "initWithLocalizedString:localizedKey:", v20, v22);

    objc_msgSend(v3, "addObject:", v23);
  }
  v24 = [MCKeyValue alloc];
  MCLocalizedStringForBool(self->_isHardwareBound);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedString(CFSTR("HARDWARE_BOUND"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[MCKeyValue initWithLocalizedString:localizedKey:](v24, "initWithLocalizedString:localizedKey:", v25, v26);

  objc_msgSend(v3, "addObject:", v27);
  +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (BOOL)isHardwareBound
{
  return self->_isHardwareBound;
}

- (NSString)directoryURLString
{
  return self->_directoryURLString;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)keyType
{
  return self->_keyType;
}

- (unint64_t)keySize
{
  return self->_keySize;
}

- (NSArray)subject
{
  return self->_subject;
}

- (NSDictionary)subjectAltName
{
  return self->_subjectAltName;
}

- (unsigned)usageFlags
{
  return self->_usageFlags;
}

- (NSArray)extendedKeyUsage
{
  return self->_extendedKeyUsage;
}

- (BOOL)attest
{
  return self->_attest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedKeyUsage, 0);
  objc_storeStrong((id *)&self->_subjectAltName, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_keyType, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_directoryURLString, 0);
}

@end
