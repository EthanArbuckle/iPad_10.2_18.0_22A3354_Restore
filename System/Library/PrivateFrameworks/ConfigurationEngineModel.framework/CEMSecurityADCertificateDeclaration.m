@implementation CEMSecurityADCertificateDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.security.adcertificate");
}

+ (id)profileType
{
  return CFSTR("com.apple.ADCertificate.managed");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[12];

  v6[11] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("CertServer");
  v6[1] = CFSTR("CertTemplate");
  v6[2] = CFSTR("Description");
  v6[3] = CFSTR("CertificateRenewalTimeInterval");
  v6[4] = CFSTR("CertificateAuthority");
  v6[5] = CFSTR("CertificateAcquisitionMechanism");
  v6[6] = CFSTR("AllowAllAppsAccess");
  v6[7] = CFSTR("PromptForCredentials");
  v6[8] = CFSTR("KeyIsExtractable");
  v6[9] = CFSTR("Keysize");
  v6[10] = CFSTR("EnableAutoRenewal");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

- (BOOL)multipleAllowed
{
  return 1;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withCertServer:(id)a4 withCertTemplate:(id)a5 withDescription:(id)a6 withCertificateRenewalTimeInterval:(id)a7 withCertificateAuthority:(id)a8 withCertificateAcquisitionMechanism:(id)a9 withAllowAllAppsAccess:(id)a10 withPromptForCredentials:(id)a11 withKeyIsExtractable:(id)a12 withKeysize:(id)a13 withEnableAutoRenewal:(id)a14
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;

  v44 = a3;
  v43 = a14;
  v42 = a13;
  v41 = a12;
  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = v44;
  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setDeclarationType:", CFSTR("com.apple.configuration.security.adcertificate"));
  if (v44)
  {
    objc_msgSend(v26, "setDeclarationIdentifier:", v44);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v40 = v20;
    v28 = v17;
    v29 = v19;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDeclarationIdentifier:", v30);

    v19 = v29;
    v17 = v28;
    v20 = v40;

    v25 = 0;
  }
  objc_msgSend(v26, "setPayloadCertServer:", v24, a5);

  objc_msgSend(v26, "setPayloadCertTemplate:", v23);
  objc_msgSend(v26, "setPayloadDescription:", v22);

  objc_msgSend(v26, "setPayloadCertificateRenewalTimeInterval:", v21);
  objc_msgSend(v26, "setPayloadCertificateAuthority:", v20);

  objc_msgSend(v26, "setPayloadCertificateAcquisitionMechanism:", v19);
  v31 = (void *)MEMORY[0x24BDBD1C0];
  if (v18)
    v32 = v18;
  else
    v32 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v26, "setPayloadAllowAllAppsAccess:", v32);

  if (v17)
    v33 = v17;
  else
    v33 = v31;
  objc_msgSend(v26, "setPayloadPromptForCredentials:", v33);

  if (v41)
    v34 = v41;
  else
    v34 = v31;
  objc_msgSend(v26, "setPayloadKeyIsExtractable:", v34);

  if (v42)
    v35 = v42;
  else
    v35 = &unk_24C69CE30;
  objc_msgSend(v26, "setPayloadKeysize:", v35);

  if (v43)
    v36 = v43;
  else
    v36 = v31;
  objc_msgSend(v26, "setPayloadEnableAutoRenewal:", v36);

  objc_msgSend(v26, "updateServerHash");
  return v26;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withCertServer:(id)a4 withCertTemplate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.security.adcertificate"));
  if (v7)
  {
    objc_msgSend(v10, "setDeclarationIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeclarationIdentifier:", v12);

  }
  objc_msgSend(v10, "setPayloadCertServer:", v9);

  objc_msgSend(v10, "setPayloadCertTemplate:", v8);
  objc_msgSend(v10, "updateServerHash");

  return v10;
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
  NSString *payloadCertServer;
  NSString *v16;
  NSString *payloadCertTemplate;
  NSString *v18;
  NSString *payloadDescription;
  NSNumber *v20;
  NSNumber *payloadCertificateRenewalTimeInterval;
  NSString *v22;
  NSString *payloadCertificateAuthority;
  NSString *v24;
  NSString *payloadCertificateAcquisitionMechanism;
  NSNumber *v26;
  NSNumber *payloadAllowAllAppsAccess;
  NSNumber *v28;
  NSNumber *payloadPromptForCredentials;
  NSNumber *v30;
  NSNumber *payloadKeyIsExtractable;
  NSNumber *v32;
  NSNumber *payloadKeysize;
  NSNumber *v34;
  NSNumber *payloadEnableAutoRenewal;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSecurityADCertificateDeclaration allowedPayloadKeys](CEMSecurityADCertificateDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v47 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CertServer"), 1, 0, &v47);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v47;
  payloadCertServer = self->_payloadCertServer;
  self->_payloadCertServer = v13;

  if (!v14)
  {
    v46 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CertTemplate"), 1, 0, &v46);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v46;
    payloadCertTemplate = self->_payloadCertTemplate;
    self->_payloadCertTemplate = v16;

    if (!v14)
    {
      v45 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Description"), 0, 0, &v45);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v45;
      payloadDescription = self->_payloadDescription;
      self->_payloadDescription = v18;

      if (!v14)
      {
        v44 = 0;
        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CertificateRenewalTimeInterval"), 0, 0, &v44);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v44;
        payloadCertificateRenewalTimeInterval = self->_payloadCertificateRenewalTimeInterval;
        self->_payloadCertificateRenewalTimeInterval = v20;

        if (!v14)
        {
          v43 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CertificateAuthority"), 0, 0, &v43);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v43;
          payloadCertificateAuthority = self->_payloadCertificateAuthority;
          self->_payloadCertificateAuthority = v22;

          if (!v14)
          {
            v42 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CertificateAcquisitionMechanism"), 0, 0, &v42);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v42;
            payloadCertificateAcquisitionMechanism = self->_payloadCertificateAcquisitionMechanism;
            self->_payloadCertificateAcquisitionMechanism = v24;

            if (!v14)
            {
              v41 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AllowAllAppsAccess"), 0, MEMORY[0x24BDBD1C0], &v41);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v41;
              payloadAllowAllAppsAccess = self->_payloadAllowAllAppsAccess;
              self->_payloadAllowAllAppsAccess = v26;

              if (!v14)
              {
                v40 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PromptForCredentials"), 0, MEMORY[0x24BDBD1C0], &v40);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v40;
                payloadPromptForCredentials = self->_payloadPromptForCredentials;
                self->_payloadPromptForCredentials = v28;

                if (!v14)
                {
                  v39 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("KeyIsExtractable"), 0, MEMORY[0x24BDBD1C0], &v39);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v39;
                  payloadKeyIsExtractable = self->_payloadKeyIsExtractable;
                  self->_payloadKeyIsExtractable = v30;

                  if (!v14)
                  {
                    v38 = 0;
                    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Keysize"), 0, &unk_24C69CE30, &v38);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v38;
                    payloadKeysize = self->_payloadKeysize;
                    self->_payloadKeysize = v32;

                    if (!v14)
                    {
                      v37 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableAutoRenewal"), 0, MEMORY[0x24BDBD1C0], &v37);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v37;
                      payloadEnableAutoRenewal = self->_payloadEnableAutoRenewal;
                      self->_payloadEnableAutoRenewal = v34;

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
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CertServer"), self->_payloadCertServer, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CertTemplate"), self->_payloadCertTemplate, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Description"), self->_payloadDescription, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CertificateRenewalTimeInterval"), self->_payloadCertificateRenewalTimeInterval, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CertificateAuthority"), self->_payloadCertificateAuthority, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CertificateAcquisitionMechanism"), self->_payloadCertificateAcquisitionMechanism, 0, 0);
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AllowAllAppsAccess"), self->_payloadAllowAllAppsAccess, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("PromptForCredentials"), self->_payloadPromptForCredentials, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("KeyIsExtractable"), self->_payloadKeyIsExtractable, 0, v5);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Keysize"), self->_payloadKeysize, 0, &unk_24C69CE30);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EnableAutoRenewal"), self->_payloadEnableAutoRenewal, 0, v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
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
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CEMSecurityADCertificateDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v28, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadCertServer, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadCertTemplate, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_payloadDescription, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadCertificateRenewalTimeInterval, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_payloadCertificateAuthority, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadCertificateAcquisitionMechanism, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadAllowAllAppsAccess, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadPromptForCredentials, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadKeyIsExtractable, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSNumber copy](self->_payloadKeysize, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[NSNumber copy](self->_payloadEnableAutoRenewal, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  return v4;
}

- (NSString)payloadCertServer
{
  return self->_payloadCertServer;
}

- (void)setPayloadCertServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadCertTemplate
{
  return self->_payloadCertTemplate;
}

- (void)setPayloadCertTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadCertificateRenewalTimeInterval
{
  return self->_payloadCertificateRenewalTimeInterval;
}

- (void)setPayloadCertificateRenewalTimeInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadCertificateAuthority
{
  return self->_payloadCertificateAuthority;
}

- (void)setPayloadCertificateAuthority:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadCertificateAcquisitionMechanism
{
  return self->_payloadCertificateAcquisitionMechanism;
}

- (void)setPayloadCertificateAcquisitionMechanism:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadAllowAllAppsAccess
{
  return self->_payloadAllowAllAppsAccess;
}

- (void)setPayloadAllowAllAppsAccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadPromptForCredentials
{
  return self->_payloadPromptForCredentials;
}

- (void)setPayloadPromptForCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadKeyIsExtractable
{
  return self->_payloadKeyIsExtractable;
}

- (void)setPayloadKeyIsExtractable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadKeysize
{
  return self->_payloadKeysize;
}

- (void)setPayloadKeysize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)payloadEnableAutoRenewal
{
  return self->_payloadEnableAutoRenewal;
}

- (void)setPayloadEnableAutoRenewal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEnableAutoRenewal, 0);
  objc_storeStrong((id *)&self->_payloadKeysize, 0);
  objc_storeStrong((id *)&self->_payloadKeyIsExtractable, 0);
  objc_storeStrong((id *)&self->_payloadPromptForCredentials, 0);
  objc_storeStrong((id *)&self->_payloadAllowAllAppsAccess, 0);
  objc_storeStrong((id *)&self->_payloadCertificateAcquisitionMechanism, 0);
  objc_storeStrong((id *)&self->_payloadCertificateAuthority, 0);
  objc_storeStrong((id *)&self->_payloadCertificateRenewalTimeInterval, 0);
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_payloadCertTemplate, 0);
  objc_storeStrong((id *)&self->_payloadCertServer, 0);
}

@end
