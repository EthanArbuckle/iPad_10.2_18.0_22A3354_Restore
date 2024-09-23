@implementation CEMCredentialSCEPDeclaration_SCEP

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[14];

  v6[13] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("URL");
  v6[1] = CFSTR("Name");
  v6[2] = CFSTR("Subject");
  v6[3] = CFSTR("Keysize");
  v6[4] = CFSTR("Key Type");
  v6[5] = CFSTR("Key Usage");
  v6[6] = CFSTR("CAFingerprint");
  v6[7] = CFSTR("Retries");
  v6[8] = CFSTR("RetryDelay");
  v6[9] = CFSTR("SubjectAltName");
  v6[10] = CFSTR("KeyIsExtractable");
  v6[11] = CFSTR("ChallengeCredential");
  v6[12] = CFSTR("AllowAllAppsAccess");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithURL:(id)a3 withName:(id)a4 withSubject:(id)a5 withKeysize:(id)a6 withKeyType:(id)a7 withKeyUsage:(id)a8 withCAFingerprint:(id)a9 withRetries:(id)a10 withRetryDelay:(id)a11 withSubjectAltName:(id)a12 withKeyIsExtractable:(id)a13 withChallengeCredential:(id)a14 withAllowAllAppsAccess:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v39;
  id v40;
  id v41;
  id v42;

  v42 = a15;
  v41 = a14;
  v40 = a13;
  v39 = a12;
  v19 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = (__CFString *)a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "setPayloadURL:", v27);

  objc_msgSend(v28, "setPayloadName:", v26);
  objc_msgSend(v28, "setPayloadSubject:", v25);

  if (v24)
    v29 = v24;
  else
    v29 = &unk_24C69CCB0;
  objc_msgSend(v28, "setPayloadKeysize:", v29);

  if (v23)
    v30 = v23;
  else
    v30 = CFSTR("RSA");
  objc_msgSend(v28, "setPayloadKeyType:", v30);

  if (v22)
    v31 = v22;
  else
    v31 = &unk_24C69CCC8;
  objc_msgSend(v28, "setPayloadKeyUsage:", v31);

  objc_msgSend(v28, "setPayloadCAFingerprint:", v21);
  if (v20)
    v32 = v20;
  else
    v32 = &unk_24C69CCE0;
  objc_msgSend(v28, "setPayloadRetries:", v32);

  if (v19)
    v33 = v19;
  else
    v33 = &unk_24C69CCF8;
  objc_msgSend(v28, "setPayloadRetryDelay:", v33);

  objc_msgSend(v28, "setPayloadSubjectAltName:", v39);
  if (v40)
    v34 = v40;
  else
    v34 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v28, "setPayloadKeyIsExtractable:", v34);

  objc_msgSend(v28, "setPayloadChallengeCredential:", v41);
  if (v42)
    v35 = v42;
  else
    v35 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v28, "setPayloadAllowAllAppsAccess:", v35);

  return v28;
}

+ (id)buildRequiredOnlyWithURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadURL:", v3);

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSString *v13;
  id v14;
  NSString *payloadURL;
  NSString *v16;
  NSString *payloadName;
  NSArray *v18;
  NSArray *payloadSubject;
  NSNumber *v20;
  NSNumber *payloadKeysize;
  NSString *v22;
  NSString *payloadKeyType;
  NSNumber *v24;
  NSNumber *payloadKeyUsage;
  NSData *v26;
  NSData *payloadCAFingerprint;
  NSNumber *v28;
  NSNumber *payloadRetries;
  NSNumber *v30;
  NSNumber *payloadRetryDelay;
  CEMCredentialSCEPDeclaration_SCEPSubjectAltName *v32;
  CEMCredentialSCEPDeclaration_SCEPSubjectAltName *payloadSubjectAltName;
  NSNumber *v34;
  NSNumber *payloadKeyIsExtractable;
  NSString *v36;
  NSString *payloadChallengeCredential;
  NSNumber *v38;
  NSNumber *payloadAllowAllAppsAccess;
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
  id v51;
  id v52;
  id v53;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMCredentialSCEPDeclaration_SCEP allowedPayloadKeys](CEMCredentialSCEPDeclaration_SCEP, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v53 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("URL"), 1, 0, &v53);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v53;
  payloadURL = self->_payloadURL;
  self->_payloadURL = v13;

  if (!v14)
  {
    v52 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Name"), 0, 0, &v52);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v52;
    payloadName = self->_payloadName;
    self->_payloadName = v16;

    if (!v14)
    {
      v51 = 0;
      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("Subject"), &__block_literal_global_10, 0, 0, &v51);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = v51;
      payloadSubject = self->_payloadSubject;
      self->_payloadSubject = v18;

      if (!v14)
      {
        v50 = 0;
        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Keysize"), 0, &unk_24C69CCB0, &v50);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v50;
        payloadKeysize = self->_payloadKeysize;
        self->_payloadKeysize = v20;

        if (!v14)
        {
          v49 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Key Type"), 0, CFSTR("RSA"), &v49);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v49;
          payloadKeyType = self->_payloadKeyType;
          self->_payloadKeyType = v22;

          if (!v14)
          {
            v48 = 0;
            -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Key Usage"), 0, &unk_24C69CCC8, &v48);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v48;
            payloadKeyUsage = self->_payloadKeyUsage;
            self->_payloadKeyUsage = v24;

            if (!v14)
            {
              v47 = 0;
              -[CEMPayloadBase loadDataFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadDataFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CAFingerprint"), 0, 0, &v47);
              v26 = (NSData *)objc_claimAutoreleasedReturnValue();
              v14 = v47;
              payloadCAFingerprint = self->_payloadCAFingerprint;
              self->_payloadCAFingerprint = v26;

              if (!v14)
              {
                v46 = 0;
                -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Retries"), 0, &unk_24C69CCE0, &v46);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v46;
                payloadRetries = self->_payloadRetries;
                self->_payloadRetries = v28;

                if (!v14)
                {
                  v45 = 0;
                  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RetryDelay"), 0, &unk_24C69CCF8, &v45);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v45;
                  payloadRetryDelay = self->_payloadRetryDelay;
                  self->_payloadRetryDelay = v30;

                  if (!v14)
                  {
                    v44 = 0;
                    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("SubjectAltName"), objc_opt_class(), 0, 0, &v44);
                    v32 = (CEMCredentialSCEPDeclaration_SCEPSubjectAltName *)objc_claimAutoreleasedReturnValue();
                    v14 = v44;
                    payloadSubjectAltName = self->_payloadSubjectAltName;
                    self->_payloadSubjectAltName = v32;

                    if (!v14)
                    {
                      v43 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("KeyIsExtractable"), 0, MEMORY[0x24BDBD1C8], &v43);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v43;
                      payloadKeyIsExtractable = self->_payloadKeyIsExtractable;
                      self->_payloadKeyIsExtractable = v34;

                      if (!v14)
                      {
                        v42 = 0;
                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ChallengeCredential"), 0, 0, &v42);
                        v36 = (NSString *)objc_claimAutoreleasedReturnValue();
                        v14 = v42;
                        payloadChallengeCredential = self->_payloadChallengeCredential;
                        self->_payloadChallengeCredential = v36;

                        if (!v14)
                        {
                          v41 = 0;
                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AllowAllAppsAccess"), 0, MEMORY[0x24BDBD1C0], &v41);
                          v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v14 = v41;
                          payloadAllowAllAppsAccess = self->_payloadAllowAllAppsAccess;
                          self->_payloadAllowAllAppsAccess = v38;

                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  CEMCredentialSCEPDeclaration_SCEPSubjectAltName *payloadSubjectAltName;
  id v7;
  NSString *payloadChallengeCredential;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("URL"), self->_payloadURL, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Name"), self->_payloadName, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Subject"), self->_payloadSubject, &__block_literal_global_124, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Keysize"), self->_payloadKeysize, 0, &unk_24C69CCB0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Key Type"), self->_payloadKeyType, 0, CFSTR("RSA"));
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Key Usage"), self->_payloadKeyUsage, 0, &unk_24C69CCC8);
  -[CEMPayloadBase serializeDataIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeDataIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CAFingerprint"), self->_payloadCAFingerprint, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Retries"), self->_payloadRetries, 0, &unk_24C69CCE0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("RetryDelay"), self->_payloadRetryDelay, 0, &unk_24C69CCF8);
  payloadSubjectAltName = self->_payloadSubjectAltName;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __72__CEMCredentialSCEPDeclaration_SCEP_serializePayloadWithAssetProviders___block_invoke_2;
  v15 = &unk_24C638560;
  v7 = v4;
  v16 = v7;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("SubjectAltName"), payloadSubjectAltName, &v12, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("KeyIsExtractable"), self->_payloadKeyIsExtractable, 0, MEMORY[0x24BDBD1C8]);
  payloadChallengeCredential = self->_payloadChallengeCredential;
  if (payloadChallengeCredential)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", self->_payloadChallengeCredential);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("ChallengeCredential"), payloadChallengeCredential, v9, &stru_24C63AAC0, v12, v13, v14, v15);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("ChallengeCredential"), 0, 0, &stru_24C63AAC0, v12, v13, v14, v15);
  }
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AllowAllAppsAccess"), self->_payloadAllowAllAppsAccess, 0, MEMORY[0x24BDBD1C0]);
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)CEMCredentialSCEPDeclaration_SCEP;
  v4 = -[CEMPayloadBase copyWithZone:](&v32, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadURL, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadName, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_payloadSubject, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadKeysize, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_payloadKeyType, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_payloadKeyUsage, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSData copy](self->_payloadCAFingerprint, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_payloadRetries, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_payloadRetryDelay, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[CEMCredentialSCEPDeclaration_SCEPSubjectAltName copy](self->_payloadSubjectAltName, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSNumber copy](self->_payloadKeyIsExtractable, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSString copy](self->_payloadChallengeCredential, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  v29 = -[NSNumber copy](self->_payloadAllowAllAppsAccess, "copy");
  v30 = (void *)v4[14];
  v4[14] = v29;

  return v4;
}

- (NSString)payloadURL
{
  return self->_payloadURL;
}

- (void)setPayloadURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadName
{
  return self->_payloadName;
}

- (void)setPayloadName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadSubject
{
  return self->_payloadSubject;
}

- (void)setPayloadSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadKeysize
{
  return self->_payloadKeysize;
}

- (void)setPayloadKeysize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)payloadKeyType
{
  return self->_payloadKeyType;
}

- (void)setPayloadKeyType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)payloadKeyUsage
{
  return self->_payloadKeyUsage;
}

- (void)setPayloadKeyUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)payloadCAFingerprint
{
  return self->_payloadCAFingerprint;
}

- (void)setPayloadCAFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadRetries
{
  return self->_payloadRetries;
}

- (void)setPayloadRetries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadRetryDelay
{
  return self->_payloadRetryDelay;
}

- (void)setPayloadRetryDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CEMCredentialSCEPDeclaration_SCEPSubjectAltName)payloadSubjectAltName
{
  return self->_payloadSubjectAltName;
}

- (void)setPayloadSubjectAltName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadKeyIsExtractable
{
  return self->_payloadKeyIsExtractable;
}

- (void)setPayloadKeyIsExtractable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadChallengeCredential
{
  return self->_payloadChallengeCredential;
}

- (void)setPayloadChallengeCredential:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadAllowAllAppsAccess
{
  return self->_payloadAllowAllAppsAccess;
}

- (void)setPayloadAllowAllAppsAccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowAllAppsAccess, 0);
  objc_storeStrong((id *)&self->_payloadChallengeCredential, 0);
  objc_storeStrong((id *)&self->_payloadKeyIsExtractable, 0);
  objc_storeStrong((id *)&self->_payloadSubjectAltName, 0);
  objc_storeStrong((id *)&self->_payloadRetryDelay, 0);
  objc_storeStrong((id *)&self->_payloadRetries, 0);
  objc_storeStrong((id *)&self->_payloadCAFingerprint, 0);
  objc_storeStrong((id *)&self->_payloadKeyUsage, 0);
  objc_storeStrong((id *)&self->_payloadKeyType, 0);
  objc_storeStrong((id *)&self->_payloadKeysize, 0);
  objc_storeStrong((id *)&self->_payloadSubject, 0);
  objc_storeStrong((id *)&self->_payloadName, 0);
  objc_storeStrong((id *)&self->_payloadURL, 0);
}

@end
