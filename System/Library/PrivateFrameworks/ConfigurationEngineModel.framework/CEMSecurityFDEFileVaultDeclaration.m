@implementation CEMSecurityFDEFileVaultDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.security.fde.filevault");
}

+ (id)profileType
{
  return CFSTR("com.apple.MCX.FileVault2");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Enable");
  v6[1] = CFSTR("Defer");
  v6[2] = CFSTR("UserEntersMissingInfo");
  v6[3] = CFSTR("UseRecoveryKey");
  v6[4] = CFSTR("ShowRecoveryKey");
  v6[5] = CFSTR("OutputPath");
  v6[6] = CFSTR("Username");
  v6[7] = CFSTR("Password");
  v6[8] = CFSTR("UseKeychain");
  v6[9] = CFSTR("DeferForceAtUserLoginMaxBypassAttempts");
  v6[10] = CFSTR("DeferDontAskAtUserLogout");
  v6[11] = CFSTR("CertificateIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 12);
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
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withEnable:(id)a4 withDefer:(id)a5 withUserEntersMissingInfo:(id)a6 withUseRecoveryKey:(id)a7 withShowRecoveryKey:(id)a8 withOutputPath:(id)a9 withUsername:(id)a10 withPassword:(id)a11 withUseKeychain:(id)a12 withDeferForceAtUserLoginMaxBypassAttempts:(id)a13 withDeferDontAskAtUserLogout:(id)a14 withCertificateIdentifier:(id)a15
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
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;

  v48 = a3;
  v47 = a15;
  v46 = a14;
  v45 = a13;
  v17 = a12;
  v44 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = v48;
  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setDeclarationType:", CFSTR("com.apple.configuration.security.fde.filevault"));
  if (v48)
  {
    objc_msgSend(v26, "setDeclarationIdentifier:", v48);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v43 = v17;
    v28 = v19;
    v29 = v18;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDeclarationIdentifier:", v30);

    v18 = v29;
    v19 = v28;
    v17 = v43;

    v25 = 0;
  }
  objc_msgSend(v26, "setPayloadEnable:", v24, a6);

  v31 = (void *)MEMORY[0x24BDBD1C0];
  if (v23)
    v32 = v23;
  else
    v32 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v26, "setPayloadDefer:", v32);

  if (v22)
    v33 = v22;
  else
    v33 = v31;
  objc_msgSend(v26, "setPayloadUserEntersMissingInfo:", v33);

  v34 = (void *)MEMORY[0x24BDBD1C8];
  if (v21)
    v35 = v21;
  else
    v35 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v26, "setPayloadUseRecoveryKey:", v35);

  if (v20)
    v36 = v20;
  else
    v36 = v34;
  objc_msgSend(v26, "setPayloadShowRecoveryKey:", v36);

  objc_msgSend(v26, "setPayloadOutputPath:", v19);
  objc_msgSend(v26, "setPayloadUsername:", v18);

  objc_msgSend(v26, "setPayloadPassword:", v44);
  if (v17)
    v37 = v17;
  else
    v37 = v31;
  objc_msgSend(v26, "setPayloadUseKeychain:", v37);

  objc_msgSend(v26, "setPayloadDeferForceAtUserLoginMaxBypassAttempts:", v45);
  if (v46)
    v38 = v46;
  else
    v38 = v31;
  objc_msgSend(v26, "setPayloadDeferDontAskAtUserLogout:", v38);

  objc_msgSend(v26, "setPayloadCertificateIdentifier:", v47);
  objc_msgSend(v26, "updateServerHash");

  return v26;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEnable:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.security.fde.filevault"));
  if (v5)
  {
    objc_msgSend(v7, "setDeclarationIdentifier:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeclarationIdentifier:", v9);

  }
  objc_msgSend(v7, "setPayloadEnable:", v6);

  objc_msgSend(v7, "updateServerHash");
  return v7;
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
  NSString *payloadEnable;
  NSNumber *v16;
  NSNumber *payloadDefer;
  NSNumber *v18;
  NSNumber *payloadUserEntersMissingInfo;
  NSNumber *v20;
  NSNumber *payloadUseRecoveryKey;
  NSNumber *v22;
  NSNumber *payloadShowRecoveryKey;
  NSString *v24;
  NSString *payloadOutputPath;
  NSString *v26;
  NSString *payloadUsername;
  NSString *v28;
  NSString *payloadPassword;
  NSNumber *v30;
  NSNumber *payloadUseKeychain;
  NSNumber *v32;
  NSNumber *payloadDeferForceAtUserLoginMaxBypassAttempts;
  NSNumber *v34;
  NSNumber *payloadDeferDontAskAtUserLogout;
  NSString *v36;
  NSString *payloadCertificateIdentifier;
  id v39;
  id v40;
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

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSecurityFDEFileVaultDeclaration allowedPayloadKeys](CEMSecurityFDEFileVaultDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v50 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Enable"), 1, 0, &v50);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v50;
  payloadEnable = self->_payloadEnable;
  self->_payloadEnable = v13;

  if (!v14)
  {
    v49 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Defer"), 0, MEMORY[0x24BDBD1C0], &v49);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v49;
    payloadDefer = self->_payloadDefer;
    self->_payloadDefer = v16;

    if (!v14)
    {
      v48 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UserEntersMissingInfo"), 0, MEMORY[0x24BDBD1C0], &v48);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v48;
      payloadUserEntersMissingInfo = self->_payloadUserEntersMissingInfo;
      self->_payloadUserEntersMissingInfo = v18;

      if (!v14)
      {
        v47 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UseRecoveryKey"), 0, MEMORY[0x24BDBD1C8], &v47);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v47;
        payloadUseRecoveryKey = self->_payloadUseRecoveryKey;
        self->_payloadUseRecoveryKey = v20;

        if (!v14)
        {
          v46 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ShowRecoveryKey"), 0, MEMORY[0x24BDBD1C8], &v46);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v46;
          payloadShowRecoveryKey = self->_payloadShowRecoveryKey;
          self->_payloadShowRecoveryKey = v22;

          if (!v14)
          {
            v45 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OutputPath"), 0, 0, &v45);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v45;
            payloadOutputPath = self->_payloadOutputPath;
            self->_payloadOutputPath = v24;

            if (!v14)
            {
              v44 = 0;
              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Username"), 0, 0, &v44);
              v26 = (NSString *)objc_claimAutoreleasedReturnValue();
              v14 = v44;
              payloadUsername = self->_payloadUsername;
              self->_payloadUsername = v26;

              if (!v14)
              {
                v43 = 0;
                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Password"), 0, 0, &v43);
                v28 = (NSString *)objc_claimAutoreleasedReturnValue();
                v14 = v43;
                payloadPassword = self->_payloadPassword;
                self->_payloadPassword = v28;

                if (!v14)
                {
                  v42 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UseKeychain"), 0, MEMORY[0x24BDBD1C0], &v42);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v42;
                  payloadUseKeychain = self->_payloadUseKeychain;
                  self->_payloadUseKeychain = v30;

                  if (!v14)
                  {
                    v41 = 0;
                    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DeferForceAtUserLoginMaxBypassAttempts"), 0, 0, &v41);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v41;
                    payloadDeferForceAtUserLoginMaxBypassAttempts = self->_payloadDeferForceAtUserLoginMaxBypassAttempts;
                    self->_payloadDeferForceAtUserLoginMaxBypassAttempts = v32;

                    if (!v14)
                    {
                      v40 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DeferDontAskAtUserLogout"), 0, MEMORY[0x24BDBD1C0], &v40);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v40;
                      payloadDeferDontAskAtUserLogout = self->_payloadDeferDontAskAtUserLogout;
                      self->_payloadDeferDontAskAtUserLogout = v34;

                      if (!v14)
                      {
                        v39 = 0;
                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CertificateIdentifier"), 0, 0, &v39);
                        v36 = (NSString *)objc_claimAutoreleasedReturnValue();
                        v14 = v39;
                        payloadCertificateIdentifier = self->_payloadCertificateIdentifier;
                        self->_payloadCertificateIdentifier = v36;

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
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Enable"), self->_payloadEnable, 1, 0);
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Defer"), self->_payloadDefer, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("UserEntersMissingInfo"), self->_payloadUserEntersMissingInfo, 0, v5);
  v6 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("UseRecoveryKey"), self->_payloadUseRecoveryKey, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ShowRecoveryKey"), self->_payloadShowRecoveryKey, 0, v6);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("OutputPath"), self->_payloadOutputPath, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Username"), self->_payloadUsername, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Password"), self->_payloadPassword, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("UseKeychain"), self->_payloadUseKeychain, 0, v5);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DeferForceAtUserLoginMaxBypassAttempts"), self->_payloadDeferForceAtUserLoginMaxBypassAttempts, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DeferDontAskAtUserLogout"), self->_payloadDeferDontAskAtUserLogout, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CertificateIdentifier"), self->_payloadCertificateIdentifier, 0, 0);
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
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
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CEMSecurityFDEFileVaultDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v30, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadEnable, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadDefer, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadUserEntersMissingInfo, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadUseRecoveryKey, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadShowRecoveryKey, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadOutputPath, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSString copy](self->_payloadUsername, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSString copy](self->_payloadPassword, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadUseKeychain, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSNumber copy](self->_payloadDeferForceAtUserLoginMaxBypassAttempts, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[NSNumber copy](self->_payloadDeferDontAskAtUserLogout, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSString copy](self->_payloadCertificateIdentifier, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  return v4;
}

- (NSString)payloadEnable
{
  return self->_payloadEnable;
}

- (void)setPayloadEnable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadDefer
{
  return self->_payloadDefer;
}

- (void)setPayloadDefer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadUserEntersMissingInfo
{
  return self->_payloadUserEntersMissingInfo;
}

- (void)setPayloadUserEntersMissingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadUseRecoveryKey
{
  return self->_payloadUseRecoveryKey;
}

- (void)setPayloadUseRecoveryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadShowRecoveryKey
{
  return self->_payloadShowRecoveryKey;
}

- (void)setPayloadShowRecoveryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadOutputPath
{
  return self->_payloadOutputPath;
}

- (void)setPayloadOutputPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)payloadUsername
{
  return self->_payloadUsername;
}

- (void)setPayloadUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadUseKeychain
{
  return self->_payloadUseKeychain;
}

- (void)setPayloadUseKeychain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadDeferForceAtUserLoginMaxBypassAttempts
{
  return self->_payloadDeferForceAtUserLoginMaxBypassAttempts;
}

- (void)setPayloadDeferForceAtUserLoginMaxBypassAttempts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)payloadDeferDontAskAtUserLogout
{
  return self->_payloadDeferDontAskAtUserLogout;
}

- (void)setPayloadDeferDontAskAtUserLogout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)payloadCertificateIdentifier
{
  return self->_payloadCertificateIdentifier;
}

- (void)setPayloadCertificateIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCertificateIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDeferDontAskAtUserLogout, 0);
  objc_storeStrong((id *)&self->_payloadDeferForceAtUserLoginMaxBypassAttempts, 0);
  objc_storeStrong((id *)&self->_payloadUseKeychain, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadUsername, 0);
  objc_storeStrong((id *)&self->_payloadOutputPath, 0);
  objc_storeStrong((id *)&self->_payloadShowRecoveryKey, 0);
  objc_storeStrong((id *)&self->_payloadUseRecoveryKey, 0);
  objc_storeStrong((id *)&self->_payloadUserEntersMissingInfo, 0);
  objc_storeStrong((id *)&self->_payloadDefer, 0);
  objc_storeStrong((id *)&self->_payloadEnable, 0);
}

@end
