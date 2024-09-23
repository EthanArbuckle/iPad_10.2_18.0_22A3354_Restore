@implementation MCChaperonePayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.chaperone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
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

  return MCLocalizedFormat(CFSTR("CHAPERONE_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("CHAPERONE_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCChaperonePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  SecCertificateRef v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v45.receiver = self;
  v45.super_class = (Class)MCChaperonePayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v45, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (v10)
  {
    if (objc_msgSend(v9, "isStub"))
    {
      v44 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("AllowNonChaperonePairing"), 0, &v44);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v44;
      v13 = (void *)*((_QWORD *)v10 + 13);
      *((_QWORD *)v10 + 13) = v11;

      if (!v12)
      {
        *((_BYTE *)v10 + 96) = objc_msgSend(*((id *)v10 + 13), "BOOLValue");
        v43 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("PairingCertificate"), 0, &v43);
        v14 = objc_claimAutoreleasedReturnValue();
        v12 = v43;
        v15 = (void *)*((_QWORD *)v10 + 11);
        *((_QWORD *)v10 + 11) = v14;

        if (!v12)
          goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v10, "organization");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (v17)
      {
        v42 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("AllowNonChaperonePairing"), 0, &v42);
        v18 = objc_claimAutoreleasedReturnValue();
        v12 = v42;
        v19 = (void *)*((_QWORD *)v10 + 13);
        *((_QWORD *)v10 + 13) = v18;

        if (!v12)
        {
          *((_BYTE *)v10 + 96) = objc_msgSend(*((id *)v10 + 13), "BOOLValue");
          v41 = 0;
          objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("PairingCertificate"), 1, &v41);
          v20 = objc_claimAutoreleasedReturnValue();
          v12 = v41;
          v21 = (void *)*((_QWORD *)v10 + 11);
          *((_QWORD *)v10 + 11) = v20;

          if (!v12)
          {
            v22 = SecCertificateCreateWithData(0, *((CFDataRef *)v10 + 11));
            if (v22)
            {
              CFRelease(v22);
              goto LABEL_17;
            }
            v31 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v10, "friendlyName");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            MCErrorArray(CFSTR("CHAPERONE_BAD_CERT_DATA_P_PAYLOAD"), v33, v34, v35, v36, v37, v38, v39, v32);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCSupervisedErrorDomain"), 29003, v40, CFSTR("MCFatalError"));
            v12 = (id)objc_claimAutoreleasedReturnValue();

            if (!v12)
              goto LABEL_17;
          }
        }
      }
      else
      {
        +[MCProfile missingFieldErrorWithField:](MCProfile, "missingFieldErrorWithField:", CFSTR("PayloadOrganization"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_17;
      }
    }
    objc_msgSend(v10, "malformedPayloadErrorWithError:", v12);
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
      v47 = v27;
      v48 = 2114;
      v49 = v29;
      _os_log_impl(&dword_19ECC4000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
  }
LABEL_17:

  return (MCChaperonePayload *)v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSData *pairingCertificateData;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCChaperonePayload;
  -[MCPayload stubDictionary](&v8, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  pairingCertificateData = self->_pairingCertificateData;
  if (pairingCertificateData)
    objc_msgSend(v3, "setObject:forKey:", pairingCertificateData, CFSTR("PairingCertificate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_nonChaperonePairingAllowed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("AllowNonChaperonePairing"));

  return v4;
}

- (id)subtitle1Label
{
  void *v2;
  void *v3;

  -[MCPayload organization](self, "organization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    MCLocalizedString(CFSTR("CHAPERONE_DETAIL_ORG_COLON"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)subtitle2Label
{
  return MCLocalizedString(CFSTR("CHAPERONE_DETAIL_PAIRING_COLON"));
}

- (id)subtitle2Description
{
  __CFString *v2;

  if (self->_nonChaperonePairingAllowed)
    v2 = CFSTR("CHAPERONE_PAIRING_ALLOWED");
  else
    v2 = CFSTR("CHAPERONE_PAIRING_PROHIBITED");
  MCLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCChaperonePayload;
  -[MCPayload verboseDescription](&v8, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  MCStringForBool(self->_pairingCertificateData != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Pairing Cert present          : %@\n"), v5);

  MCStringForBool(self->_nonChaperonePairingAllowed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Non-Supervised pairing allowed: %@\n"), v6);

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  uint64_t v5;
  MCKeyValue *v6;
  void *v7;
  void *v8;
  MCKeyValue *v9;
  MCKeyValue *v10;
  void *v11;
  void *v12;
  MCKeyValue *v13;
  MCKeyValue *v14;
  void *v15;
  void *v16;
  MCKeyValue *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[MCPayload organization](self, "organization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = [MCKeyValue alloc];
    -[MCPayload organization](self, "organization");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("ORGANIZATION"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MCKeyValue initWithLocalizedString:localizedKey:](v6, "initWithLocalizedString:localizedKey:", v7, v8);

    objc_msgSend(v3, "addObject:", v9);
  }
  v10 = [MCKeyValue alloc];
  MCLocalizedStringForBool(self->_pairingCertificateData != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedString(CFSTR("PAIRING_CERTIFICATE_PRESENT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MCKeyValue initWithLocalizedString:localizedKey:](v10, "initWithLocalizedString:localizedKey:", v11, v12);
  objc_msgSend(v3, "addObject:", v13);

  if (self->_nonChaperonePairingAllowedNum)
  {
    v14 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_nonChaperonePairingAllowedNum, "BOOLValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("NON_SUPERVISED_PAIRING_ALLOWED"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MCKeyValue initWithLocalizedString:localizedKey:](v14, "initWithLocalizedString:localizedKey:", v15, v16);

    objc_msgSend(v3, "addObject:", v17);
  }
  +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSData)pairingCertificateData
{
  return self->_pairingCertificateData;
}

- (BOOL)nonChaperonePairingAllowed
{
  return self->_nonChaperonePairingAllowed;
}

- (NSNumber)nonChaperonePairingAllowedNum
{
  return self->_nonChaperonePairingAllowedNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonChaperonePairingAllowedNum, 0);
  objc_storeStrong((id *)&self->_pairingCertificateData, 0);
}

@end
