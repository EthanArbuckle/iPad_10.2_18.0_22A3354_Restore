@implementation CEMNetworkWiFiDeclaration_EAPClientConfiguration

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[22];

  v6[21] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("AcceptEAPTypes");
  v6[1] = CFSTR("UserName");
  v6[2] = CFSTR("UserPassword");
  v6[3] = CFSTR("OneTimePassword");
  v6[4] = CFSTR("PayloadCertificateAnchorUUID");
  v6[5] = CFSTR("TLSTrustedCertificates");
  v6[6] = CFSTR("TLSTrustedServerNames");
  v6[7] = CFSTR("TLSAllowTrustExceptions");
  v6[8] = CFSTR("TLSCertificateIsRequired");
  v6[9] = CFSTR("TTLSInnerAuthentication");
  v6[10] = CFSTR("TLSMinimumVersion");
  v6[11] = CFSTR("TLSMaximumVersion");
  v6[12] = CFSTR("OuterIdentity");
  v6[13] = CFSTR("EAPFASTUsePAC");
  v6[14] = CFSTR("EAPFASTProvisionPAC");
  v6[15] = CFSTR("EAPFASTProvisionPACAnonymously");
  v6[16] = CFSTR("EAPSIMNumberOfRANDs");
  v6[17] = CFSTR("SystemModeCredentialsSource");
  v6[18] = CFSTR("SystemModeUseOpenDirectoryCredentials");
  v6[19] = CFSTR("OneTimeUserPassword");
  v6[20] = CFSTR("EAPSIMAKAEncryptedIdentityEnabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithAcceptEAPTypes:(id)a3 withUserName:(id)a4 withUserPassword:(id)a5 withOneTimePassword:(id)a6 withPayloadCertificateAnchorUUID:(id)a7 withTLSTrustedCertificates:(id)a8 withTLSTrustedServerNames:(id)a9 withTLSAllowTrustExceptions:(id)a10 withTLSCertificateIsRequired:(id)a11 withTTLSInnerAuthentication:(id)a12 withTLSMinimumVersion:(id)a13 withTLSMaximumVersion:(id)a14 withOuterIdentity:(id)a15 withEAPFASTUsePAC:(id)a16 withEAPFASTProvisionPAC:(id)a17 withEAPFASTProvisionPACAnonymously:(id)a18 withEAPSIMNumberOfRANDs:(id)a19 withSystemModeCredentialsSource:(id)a20 withSystemModeUseOpenDirectoryCredentials:(id)a21 withOneTimeUserPassword:(id)a22 withEAPSIMAKAEncryptedIdentityEnabled:(id)a23
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;

  v66 = a23;
  v65 = a22;
  v64 = a21;
  v63 = a20;
  v62 = a19;
  v61 = a18;
  v60 = a17;
  v59 = a16;
  v58 = a15;
  v57 = (__CFString *)a14;
  v56 = (__CFString *)a13;
  v55 = (__CFString *)a12;
  v23 = a11;
  v24 = a10;
  v25 = a9;
  v26 = a8;
  v27 = a7;
  v28 = a6;
  v29 = a5;
  v30 = a4;
  v31 = a3;
  v32 = (void *)objc_opt_new();
  objc_msgSend(v32, "setPayloadAcceptEAPTypes:", v31);

  objc_msgSend(v32, "setPayloadUserName:", v30);
  objc_msgSend(v32, "setPayloadUserPassword:", v29);

  v33 = (void *)MEMORY[0x24BDBD1C0];
  if (v28)
    v34 = v28;
  else
    v34 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v32, "setPayloadOneTimePassword:", v34);

  objc_msgSend(v32, "setPayloadPayloadCertificateAnchorUUID:", v27);
  objc_msgSend(v32, "setPayloadTLSTrustedCertificates:", v26);

  objc_msgSend(v32, "setPayloadTLSTrustedServerNames:", v25);
  v35 = (void *)MEMORY[0x24BDBD1C8];
  if (v24)
    v36 = v24;
  else
    v36 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v32, "setPayloadTLSAllowTrustExceptions:", v36);

  if (v23)
    v37 = v23;
  else
    v37 = v33;
  objc_msgSend(v32, "setPayloadTLSCertificateIsRequired:", v37);

  if (v55)
    v38 = v55;
  else
    v38 = CFSTR("MSCHAPv2");
  objc_msgSend(v32, "setPayloadTTLSInnerAuthentication:", v38);

  if (v56)
    v39 = v56;
  else
    v39 = CFSTR("1.0");
  objc_msgSend(v32, "setPayloadTLSMinimumVersion:", v39);

  if (v57)
    v40 = v57;
  else
    v40 = CFSTR("1.2");
  objc_msgSend(v32, "setPayloadTLSMaximumVersion:", v40);

  objc_msgSend(v32, "setPayloadOuterIdentity:", v58);
  if (v59)
    v41 = v59;
  else
    v41 = v33;
  objc_msgSend(v32, "setPayloadEAPFASTUsePAC:", v41);

  if (v60)
    v42 = v60;
  else
    v42 = v33;
  objc_msgSend(v32, "setPayloadEAPFASTProvisionPAC:", v42);

  if (v61)
    v43 = v61;
  else
    v43 = v33;
  objc_msgSend(v32, "setPayloadEAPFASTProvisionPACAnonymously:", v43);

  if (v62)
    v44 = v62;
  else
    v44 = &unk_24C69CDE8;
  objc_msgSend(v32, "setPayloadEAPSIMNumberOfRANDs:", v44);

  objc_msgSend(v32, "setPayloadSystemModeCredentialsSource:", v63);
  if (v64)
    v45 = v64;
  else
    v45 = v33;
  objc_msgSend(v32, "setPayloadSystemModeUseOpenDirectoryCredentials:", v45);

  if (v65)
    v46 = v65;
  else
    v46 = v33;
  objc_msgSend(v32, "setPayloadOneTimeUserPassword:", v46);

  if (v66)
    v47 = v66;
  else
    v47 = v35;
  objc_msgSend(v32, "setPayloadEAPSIMAKAEncryptedIdentityEnabled:", v47);

  return v32;
}

+ (id)buildRequiredOnlyWithAcceptEAPTypes:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadAcceptEAPTypes:", v3);

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
  NSArray *v13;
  id v14;
  NSArray *payloadAcceptEAPTypes;
  NSString *v16;
  NSString *payloadUserName;
  NSString *v18;
  NSString *payloadUserPassword;
  NSNumber *v20;
  NSNumber *payloadOneTimePassword;
  NSArray *v22;
  NSArray *payloadPayloadCertificateAnchorUUID;
  NSArray *v24;
  NSArray *payloadTLSTrustedCertificates;
  NSArray *v26;
  NSArray *payloadTLSTrustedServerNames;
  NSNumber *v28;
  NSNumber *payloadTLSAllowTrustExceptions;
  NSNumber *v30;
  NSNumber *payloadTLSCertificateIsRequired;
  NSString *v32;
  NSString *payloadTTLSInnerAuthentication;
  NSString *v34;
  NSString *payloadTLSMinimumVersion;
  NSString *v36;
  NSString *payloadTLSMaximumVersion;
  NSString *v38;
  NSString *payloadOuterIdentity;
  NSNumber *v40;
  NSNumber *payloadEAPFASTUsePAC;
  NSNumber *v42;
  NSNumber *payloadEAPFASTProvisionPAC;
  NSNumber *v44;
  NSNumber *payloadEAPFASTProvisionPACAnonymously;
  NSNumber *v46;
  NSNumber *payloadEAPSIMNumberOfRANDs;
  NSString *v48;
  NSString *payloadSystemModeCredentialsSource;
  NSNumber *v50;
  NSNumber *payloadSystemModeUseOpenDirectoryCredentials;
  NSNumber *v52;
  NSNumber *payloadOneTimeUserPassword;
  NSNumber *v54;
  NSNumber *payloadEAPSIMAKAEncryptedIdentityEnabled;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkWiFiDeclaration_EAPClientConfiguration allowedPayloadKeys](CEMNetworkWiFiDeclaration_EAPClientConfiguration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v77 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("AcceptEAPTypes"), &__block_literal_global_373, 1, 0, &v77);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = v77;
  payloadAcceptEAPTypes = self->_payloadAcceptEAPTypes;
  self->_payloadAcceptEAPTypes = v13;

  if (!v14)
  {
    v76 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UserName"), 0, 0, &v76);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v76;
    payloadUserName = self->_payloadUserName;
    self->_payloadUserName = v16;

    if (!v14)
    {
      v75 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UserPassword"), 0, 0, &v75);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v75;
      payloadUserPassword = self->_payloadUserPassword;
      self->_payloadUserPassword = v18;

      if (!v14)
      {
        v74 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OneTimePassword"), 0, MEMORY[0x24BDBD1C0], &v74);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v74;
        payloadOneTimePassword = self->_payloadOneTimePassword;
        self->_payloadOneTimePassword = v20;

        if (!v14)
        {
          v73 = 0;
          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("PayloadCertificateAnchorUUID"), &__block_literal_global_375_0, 0, 0, &v73);
          v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v14 = v73;
          payloadPayloadCertificateAnchorUUID = self->_payloadPayloadCertificateAnchorUUID;
          self->_payloadPayloadCertificateAnchorUUID = v22;

          if (!v14)
          {
            v72 = 0;
            -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("TLSTrustedCertificates"), &__block_literal_global_376_0, 0, 0, &v72);
            v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v14 = v72;
            payloadTLSTrustedCertificates = self->_payloadTLSTrustedCertificates;
            self->_payloadTLSTrustedCertificates = v24;

            if (!v14)
            {
              v71 = 0;
              -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("TLSTrustedServerNames"), &__block_literal_global_377_0, 0, 0, &v71);
              v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
              v14 = v71;
              payloadTLSTrustedServerNames = self->_payloadTLSTrustedServerNames;
              self->_payloadTLSTrustedServerNames = v26;

              if (!v14)
              {
                v70 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("TLSAllowTrustExceptions"), 0, MEMORY[0x24BDBD1C8], &v70);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v70;
                payloadTLSAllowTrustExceptions = self->_payloadTLSAllowTrustExceptions;
                self->_payloadTLSAllowTrustExceptions = v28;

                if (!v14)
                {
                  v69 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("TLSCertificateIsRequired"), 0, MEMORY[0x24BDBD1C0], &v69);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v69;
                  payloadTLSCertificateIsRequired = self->_payloadTLSCertificateIsRequired;
                  self->_payloadTLSCertificateIsRequired = v30;

                  if (!v14)
                  {
                    v68 = 0;
                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("TTLSInnerAuthentication"), 0, CFSTR("MSCHAPv2"), &v68);
                    v32 = (NSString *)objc_claimAutoreleasedReturnValue();
                    v14 = v68;
                    payloadTTLSInnerAuthentication = self->_payloadTTLSInnerAuthentication;
                    self->_payloadTTLSInnerAuthentication = v32;

                    if (!v14)
                    {
                      v67 = 0;
                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("TLSMinimumVersion"), 0, CFSTR("1.0"), &v67);
                      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
                      v14 = v67;
                      payloadTLSMinimumVersion = self->_payloadTLSMinimumVersion;
                      self->_payloadTLSMinimumVersion = v34;

                      if (!v14)
                      {
                        v66 = 0;
                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("TLSMaximumVersion"), 0, CFSTR("1.2"), &v66);
                        v36 = (NSString *)objc_claimAutoreleasedReturnValue();
                        v14 = v66;
                        payloadTLSMaximumVersion = self->_payloadTLSMaximumVersion;
                        self->_payloadTLSMaximumVersion = v36;

                        if (!v14)
                        {
                          v65 = 0;
                          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OuterIdentity"), 0, 0, &v65);
                          v38 = (NSString *)objc_claimAutoreleasedReturnValue();
                          v14 = v65;
                          payloadOuterIdentity = self->_payloadOuterIdentity;
                          self->_payloadOuterIdentity = v38;

                          if (!v14)
                          {
                            v64 = 0;
                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EAPFASTUsePAC"), 0, MEMORY[0x24BDBD1C0], &v64);
                            v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                            v14 = v64;
                            payloadEAPFASTUsePAC = self->_payloadEAPFASTUsePAC;
                            self->_payloadEAPFASTUsePAC = v40;

                            if (!v14)
                            {
                              v63 = 0;
                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EAPFASTProvisionPAC"), 0, MEMORY[0x24BDBD1C0], &v63);
                              v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                              v14 = v63;
                              payloadEAPFASTProvisionPAC = self->_payloadEAPFASTProvisionPAC;
                              self->_payloadEAPFASTProvisionPAC = v42;

                              if (!v14)
                              {
                                v62 = 0;
                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EAPFASTProvisionPACAnonymously"), 0, MEMORY[0x24BDBD1C0], &v62);
                                v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                v14 = v62;
                                payloadEAPFASTProvisionPACAnonymously = self->_payloadEAPFASTProvisionPACAnonymously;
                                self->_payloadEAPFASTProvisionPACAnonymously = v44;

                                if (!v14)
                                {
                                  v61 = 0;
                                  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EAPSIMNumberOfRANDs"), 0, &unk_24C69CDE8, &v61);
                                  v46 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                  v14 = v61;
                                  payloadEAPSIMNumberOfRANDs = self->_payloadEAPSIMNumberOfRANDs;
                                  self->_payloadEAPSIMNumberOfRANDs = v46;

                                  if (!v14)
                                  {
                                    v60 = 0;
                                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SystemModeCredentialsSource"), 0, 0, &v60);
                                    v48 = (NSString *)objc_claimAutoreleasedReturnValue();
                                    v14 = v60;
                                    payloadSystemModeCredentialsSource = self->_payloadSystemModeCredentialsSource;
                                    self->_payloadSystemModeCredentialsSource = v48;

                                    if (!v14)
                                    {
                                      v59 = 0;
                                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SystemModeUseOpenDirectoryCredentials"), 0, MEMORY[0x24BDBD1C0], &v59);
                                      v50 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                      v14 = v59;
                                      payloadSystemModeUseOpenDirectoryCredentials = self->_payloadSystemModeUseOpenDirectoryCredentials;
                                      self->_payloadSystemModeUseOpenDirectoryCredentials = v50;

                                      if (!v14)
                                      {
                                        v58 = 0;
                                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OneTimeUserPassword"), 0, MEMORY[0x24BDBD1C0], &v58);
                                        v52 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                        v14 = v58;
                                        payloadOneTimeUserPassword = self->_payloadOneTimeUserPassword;
                                        self->_payloadOneTimeUserPassword = v52;

                                        if (!v14)
                                        {
                                          v57 = 0;
                                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EAPSIMAKAEncryptedIdentityEnabled"), 0, MEMORY[0x24BDBD1C8], &v57);
                                          v54 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                          v14 = v57;
                                          payloadEAPSIMAKAEncryptedIdentityEnabled = self->_payloadEAPSIMAKAEncryptedIdentityEnabled;
                                          self->_payloadEAPSIMAKAEncryptedIdentityEnabled = v54;

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
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("AcceptEAPTypes"), self->_payloadAcceptEAPTypes, &__block_literal_global_378, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("UserName"), self->_payloadUserName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("UserPassword"), self->_payloadUserPassword, 0, 0);
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("OneTimePassword"), self->_payloadOneTimePassword, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("PayloadCertificateAnchorUUID"), self->_payloadPayloadCertificateAnchorUUID, &__block_literal_global_379, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("TLSTrustedCertificates"), self->_payloadTLSTrustedCertificates, &__block_literal_global_380, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("TLSTrustedServerNames"), self->_payloadTLSTrustedServerNames, &__block_literal_global_381, 0, 0);
  v6 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("TLSAllowTrustExceptions"), self->_payloadTLSAllowTrustExceptions, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("TLSCertificateIsRequired"), self->_payloadTLSCertificateIsRequired, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("TTLSInnerAuthentication"), self->_payloadTTLSInnerAuthentication, 0, CFSTR("MSCHAPv2"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("TLSMinimumVersion"), self->_payloadTLSMinimumVersion, 0, CFSTR("1.0"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("TLSMaximumVersion"), self->_payloadTLSMaximumVersion, 0, CFSTR("1.2"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("OuterIdentity"), self->_payloadOuterIdentity, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EAPFASTUsePAC"), self->_payloadEAPFASTUsePAC, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EAPFASTProvisionPAC"), self->_payloadEAPFASTProvisionPAC, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EAPFASTProvisionPACAnonymously"), self->_payloadEAPFASTProvisionPACAnonymously, 0, v5);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EAPSIMNumberOfRANDs"), self->_payloadEAPSIMNumberOfRANDs, 0, &unk_24C69CDE8);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("SystemModeCredentialsSource"), self->_payloadSystemModeCredentialsSource, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("SystemModeUseOpenDirectoryCredentials"), self->_payloadSystemModeUseOpenDirectoryCredentials, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("OneTimeUserPassword"), self->_payloadOneTimeUserPassword, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EAPSIMAKAEncryptedIdentityEnabled"), self->_payloadEAPSIMAKAEncryptedIdentityEnabled, 0, v6);
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
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)CEMNetworkWiFiDeclaration_EAPClientConfiguration;
  v4 = -[CEMPayloadBase copyWithZone:](&v48, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadAcceptEAPTypes, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadUserName, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadUserPassword, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadOneTimePassword, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSArray copy](self->_payloadPayloadCertificateAnchorUUID, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSArray copy](self->_payloadTLSTrustedCertificates, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSArray copy](self->_payloadTLSTrustedServerNames, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_payloadTLSAllowTrustExceptions, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_payloadTLSCertificateIsRequired, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSString copy](self->_payloadTTLSInnerAuthentication, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSString copy](self->_payloadTLSMinimumVersion, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSString copy](self->_payloadTLSMaximumVersion, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  v29 = -[NSString copy](self->_payloadOuterIdentity, "copy");
  v30 = (void *)v4[14];
  v4[14] = v29;

  v31 = -[NSNumber copy](self->_payloadEAPFASTUsePAC, "copy");
  v32 = (void *)v4[15];
  v4[15] = v31;

  v33 = -[NSNumber copy](self->_payloadEAPFASTProvisionPAC, "copy");
  v34 = (void *)v4[16];
  v4[16] = v33;

  v35 = -[NSNumber copy](self->_payloadEAPFASTProvisionPACAnonymously, "copy");
  v36 = (void *)v4[17];
  v4[17] = v35;

  v37 = -[NSNumber copy](self->_payloadEAPSIMNumberOfRANDs, "copy");
  v38 = (void *)v4[18];
  v4[18] = v37;

  v39 = -[NSString copy](self->_payloadSystemModeCredentialsSource, "copy");
  v40 = (void *)v4[19];
  v4[19] = v39;

  v41 = -[NSNumber copy](self->_payloadSystemModeUseOpenDirectoryCredentials, "copy");
  v42 = (void *)v4[20];
  v4[20] = v41;

  v43 = -[NSNumber copy](self->_payloadOneTimeUserPassword, "copy");
  v44 = (void *)v4[21];
  v4[21] = v43;

  v45 = -[NSNumber copy](self->_payloadEAPSIMAKAEncryptedIdentityEnabled, "copy");
  v46 = (void *)v4[22];
  v4[22] = v45;

  return v4;
}

- (NSArray)payloadAcceptEAPTypes
{
  return self->_payloadAcceptEAPTypes;
}

- (void)setPayloadAcceptEAPTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadUserName
{
  return self->_payloadUserName;
}

- (void)setPayloadUserName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadUserPassword
{
  return self->_payloadUserPassword;
}

- (void)setPayloadUserPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadOneTimePassword
{
  return self->_payloadOneTimePassword;
}

- (void)setPayloadOneTimePassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)payloadPayloadCertificateAnchorUUID
{
  return self->_payloadPayloadCertificateAnchorUUID;
}

- (void)setPayloadPayloadCertificateAnchorUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)payloadTLSTrustedCertificates
{
  return self->_payloadTLSTrustedCertificates;
}

- (void)setPayloadTLSTrustedCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)payloadTLSTrustedServerNames
{
  return self->_payloadTLSTrustedServerNames;
}

- (void)setPayloadTLSTrustedServerNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadTLSAllowTrustExceptions
{
  return self->_payloadTLSAllowTrustExceptions;
}

- (void)setPayloadTLSAllowTrustExceptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadTLSCertificateIsRequired
{
  return self->_payloadTLSCertificateIsRequired;
}

- (void)setPayloadTLSCertificateIsRequired:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadTTLSInnerAuthentication
{
  return self->_payloadTTLSInnerAuthentication;
}

- (void)setPayloadTTLSInnerAuthentication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadTLSMinimumVersion
{
  return self->_payloadTLSMinimumVersion;
}

- (void)setPayloadTLSMinimumVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadTLSMaximumVersion
{
  return self->_payloadTLSMaximumVersion;
}

- (void)setPayloadTLSMaximumVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadOuterIdentity
{
  return self->_payloadOuterIdentity;
}

- (void)setPayloadOuterIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadEAPFASTUsePAC
{
  return self->_payloadEAPFASTUsePAC;
}

- (void)setPayloadEAPFASTUsePAC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadEAPFASTProvisionPAC
{
  return self->_payloadEAPFASTProvisionPAC;
}

- (void)setPayloadEAPFASTProvisionPAC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadEAPFASTProvisionPACAnonymously
{
  return self->_payloadEAPFASTProvisionPACAnonymously;
}

- (void)setPayloadEAPFASTProvisionPACAnonymously:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadEAPSIMNumberOfRANDs
{
  return self->_payloadEAPSIMNumberOfRANDs;
}

- (void)setPayloadEAPSIMNumberOfRANDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)payloadSystemModeCredentialsSource
{
  return self->_payloadSystemModeCredentialsSource;
}

- (void)setPayloadSystemModeCredentialsSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)payloadSystemModeUseOpenDirectoryCredentials
{
  return self->_payloadSystemModeUseOpenDirectoryCredentials;
}

- (void)setPayloadSystemModeUseOpenDirectoryCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)payloadOneTimeUserPassword
{
  return self->_payloadOneTimeUserPassword;
}

- (void)setPayloadOneTimeUserPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)payloadEAPSIMAKAEncryptedIdentityEnabled
{
  return self->_payloadEAPSIMAKAEncryptedIdentityEnabled;
}

- (void)setPayloadEAPSIMAKAEncryptedIdentityEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEAPSIMAKAEncryptedIdentityEnabled, 0);
  objc_storeStrong((id *)&self->_payloadOneTimeUserPassword, 0);
  objc_storeStrong((id *)&self->_payloadSystemModeUseOpenDirectoryCredentials, 0);
  objc_storeStrong((id *)&self->_payloadSystemModeCredentialsSource, 0);
  objc_storeStrong((id *)&self->_payloadEAPSIMNumberOfRANDs, 0);
  objc_storeStrong((id *)&self->_payloadEAPFASTProvisionPACAnonymously, 0);
  objc_storeStrong((id *)&self->_payloadEAPFASTProvisionPAC, 0);
  objc_storeStrong((id *)&self->_payloadEAPFASTUsePAC, 0);
  objc_storeStrong((id *)&self->_payloadOuterIdentity, 0);
  objc_storeStrong((id *)&self->_payloadTLSMaximumVersion, 0);
  objc_storeStrong((id *)&self->_payloadTLSMinimumVersion, 0);
  objc_storeStrong((id *)&self->_payloadTTLSInnerAuthentication, 0);
  objc_storeStrong((id *)&self->_payloadTLSCertificateIsRequired, 0);
  objc_storeStrong((id *)&self->_payloadTLSAllowTrustExceptions, 0);
  objc_storeStrong((id *)&self->_payloadTLSTrustedServerNames, 0);
  objc_storeStrong((id *)&self->_payloadTLSTrustedCertificates, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateAnchorUUID, 0);
  objc_storeStrong((id *)&self->_payloadOneTimePassword, 0);
  objc_storeStrong((id *)&self->_payloadUserPassword, 0);
  objc_storeStrong((id *)&self->_payloadUserName, 0);
  objc_storeStrong((id *)&self->_payloadAcceptEAPTypes, 0);
}

@end
