@implementation CEMNetworkVPNDeclaration_IPSec

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[19];

  v6[18] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("RemoteAddress");
  v6[1] = CFSTR("AuthenticationMethod");
  v6[2] = CFSTR("XAuthName");
  v6[3] = CFSTR("XAuthPassword");
  v6[4] = CFSTR("XAuthEnabled");
  v6[5] = CFSTR("XAuthPasswordEncryption");
  v6[6] = CFSTR("LocalIdentifier");
  v6[7] = CFSTR("LocalIdentifierType");
  v6[8] = CFSTR("SharedSecret");
  v6[9] = CFSTR("PayloadCertificateUUID");
  v6[10] = CFSTR("PromptForVPNPIN");
  v6[11] = CFSTR("OnDemandEnabled");
  v6[12] = CFSTR("OnDemandMatchDomainsAlways");
  v6[13] = CFSTR("OnDemandMatchDomainsNever");
  v6[14] = CFSTR("OnDemandMatchDomainsOnRetry");
  v6[15] = CFSTR("OnDemandRules");
  v6[16] = CFSTR("DisconnectOnIdle");
  v6[17] = CFSTR("DisconnectOnIdleTimer");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithRemoteAddress:(id)a3 withAuthenticationMethod:(id)a4 withXAuthName:(id)a5 withXAuthPassword:(id)a6 withXAuthEnabled:(id)a7 withXAuthPasswordEncryption:(id)a8 withLocalIdentifier:(id)a9 withLocalIdentifierType:(id)a10 withSharedSecret:(id)a11 withPayloadCertificateUUID:(id)a12 withPromptForVPNPIN:(id)a13 withOnDemandEnabled:(id)a14 withOnDemandMatchDomainsAlways:(id)a15 withOnDemandMatchDomainsNever:(id)a16 withOnDemandMatchDomainsOnRetry:(id)a17 withOnDemandRules:(id)a18 withDisconnectOnIdle:(id)a19 withDisconnectOnIdleTimer:(id)a20
{
  id v20;
  __CFString *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __CFString *v27;
  id v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  id v32;
  void *v33;
  void *v34;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;

  v50 = a20;
  v49 = a19;
  v48 = a18;
  v47 = a17;
  v46 = a16;
  v45 = a15;
  v44 = a14;
  v20 = a13;
  v43 = a12;
  v42 = a11;
  v21 = (__CFString *)a10;
  v22 = a9;
  v23 = a8;
  v24 = a7;
  v25 = a6;
  v26 = a5;
  v27 = (__CFString *)a4;
  v28 = a3;
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setPayloadRemoteAddress:", v28);

  if (v27)
    v30 = v27;
  else
    v30 = CFSTR("SharedSecret");
  objc_msgSend(v29, "setPayloadAuthenticationMethod:", v30);

  objc_msgSend(v29, "setPayloadXAuthName:", v26);
  objc_msgSend(v29, "setPayloadXAuthPassword:", v25);

  objc_msgSend(v29, "setPayloadXAuthEnabled:", v24);
  objc_msgSend(v29, "setPayloadXAuthPasswordEncryption:", v23);

  objc_msgSend(v29, "setPayloadLocalIdentifier:", v22);
  if (v21)
    v31 = v21;
  else
    v31 = CFSTR("KeyID");
  objc_msgSend(v29, "setPayloadLocalIdentifierType:", v31);

  objc_msgSend(v29, "setPayloadSharedSecret:", v42);
  objc_msgSend(v29, "setPayloadPayloadCertificateUUID:", v43);

  if (v20)
    v32 = v20;
  else
    v32 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v29, "setPayloadPromptForVPNPIN:", v32);

  if (v44)
    v33 = v44;
  else
    v33 = &unk_24C69CD58;
  objc_msgSend(v29, "setPayloadOnDemandEnabled:", v33);

  objc_msgSend(v29, "setPayloadOnDemandMatchDomainsAlways:", v45);
  objc_msgSend(v29, "setPayloadOnDemandMatchDomainsNever:", v46);

  objc_msgSend(v29, "setPayloadOnDemandMatchDomainsOnRetry:", v47);
  objc_msgSend(v29, "setPayloadOnDemandRules:", v48);

  if (v49)
    v34 = v49;
  else
    v34 = &unk_24C69CD58;
  objc_msgSend(v29, "setPayloadDisconnectOnIdle:", v34);

  objc_msgSend(v29, "setPayloadDisconnectOnIdleTimer:", v50);
  return v29;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
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
  NSString *payloadRemoteAddress;
  NSString *v16;
  NSString *payloadAuthenticationMethod;
  NSString *v18;
  NSString *payloadXAuthName;
  NSString *v20;
  NSString *payloadXAuthPassword;
  NSNumber *v22;
  NSNumber *payloadXAuthEnabled;
  NSString *v24;
  NSString *payloadXAuthPasswordEncryption;
  NSString *v26;
  NSString *payloadLocalIdentifier;
  NSString *v28;
  NSString *payloadLocalIdentifierType;
  NSData *v30;
  NSData *payloadSharedSecret;
  NSString *v32;
  NSString *payloadPayloadCertificateUUID;
  NSNumber *v34;
  NSNumber *payloadPromptForVPNPIN;
  NSNumber *v36;
  NSNumber *payloadOnDemandEnabled;
  NSArray *v38;
  NSArray *payloadOnDemandMatchDomainsAlways;
  NSArray *v40;
  NSArray *payloadOnDemandMatchDomainsNever;
  NSArray *v42;
  NSArray *payloadOnDemandMatchDomainsOnRetry;
  NSArray *v44;
  NSArray *payloadOnDemandRules;
  NSNumber *v46;
  NSNumber *payloadDisconnectOnIdle;
  NSNumber *v48;
  NSNumber *payloadDisconnectOnIdleTimer;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
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

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkVPNDeclaration_IPSec allowedPayloadKeys](CEMNetworkVPNDeclaration_IPSec, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v68 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RemoteAddress"), 0, 0, &v68);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v68;
  payloadRemoteAddress = self->_payloadRemoteAddress;
  self->_payloadRemoteAddress = v13;

  if (!v14)
  {
    v67 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthenticationMethod"), 0, CFSTR("SharedSecret"), &v67);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v67;
    payloadAuthenticationMethod = self->_payloadAuthenticationMethod;
    self->_payloadAuthenticationMethod = v16;

    if (!v14)
    {
      v66 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("XAuthName"), 0, 0, &v66);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v66;
      payloadXAuthName = self->_payloadXAuthName;
      self->_payloadXAuthName = v18;

      if (!v14)
      {
        v65 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("XAuthPassword"), 0, 0, &v65);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v65;
        payloadXAuthPassword = self->_payloadXAuthPassword;
        self->_payloadXAuthPassword = v20;

        if (!v14)
        {
          v64 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("XAuthEnabled"), 0, 0, &v64);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v64;
          payloadXAuthEnabled = self->_payloadXAuthEnabled;
          self->_payloadXAuthEnabled = v22;

          if (!v14)
          {
            v63 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("XAuthPasswordEncryption"), 0, 0, &v63);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v63;
            payloadXAuthPasswordEncryption = self->_payloadXAuthPasswordEncryption;
            self->_payloadXAuthPasswordEncryption = v24;

            if (!v14)
            {
              v62 = 0;
              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LocalIdentifier"), 0, 0, &v62);
              v26 = (NSString *)objc_claimAutoreleasedReturnValue();
              v14 = v62;
              payloadLocalIdentifier = self->_payloadLocalIdentifier;
              self->_payloadLocalIdentifier = v26;

              if (!v14)
              {
                v61 = 0;
                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LocalIdentifierType"), 0, CFSTR("KeyID"), &v61);
                v28 = (NSString *)objc_claimAutoreleasedReturnValue();
                v14 = v61;
                payloadLocalIdentifierType = self->_payloadLocalIdentifierType;
                self->_payloadLocalIdentifierType = v28;

                if (!v14)
                {
                  v60 = 0;
                  -[CEMPayloadBase loadDataFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadDataFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SharedSecret"), 0, 0, &v60);
                  v30 = (NSData *)objc_claimAutoreleasedReturnValue();
                  v14 = v60;
                  payloadSharedSecret = self->_payloadSharedSecret;
                  self->_payloadSharedSecret = v30;

                  if (!v14)
                  {
                    v59 = 0;
                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PayloadCertificateUUID"), 0, 0, &v59);
                    v32 = (NSString *)objc_claimAutoreleasedReturnValue();
                    v14 = v59;
                    payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
                    self->_payloadPayloadCertificateUUID = v32;

                    if (!v14)
                    {
                      v58 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PromptForVPNPIN"), 0, MEMORY[0x24BDBD1C0], &v58);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v58;
                      payloadPromptForVPNPIN = self->_payloadPromptForVPNPIN;
                      self->_payloadPromptForVPNPIN = v34;

                      if (!v14)
                      {
                        v57 = 0;
                        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OnDemandEnabled"), 0, &unk_24C69CD58, &v57);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v57;
                        payloadOnDemandEnabled = self->_payloadOnDemandEnabled;
                        self->_payloadOnDemandEnabled = v36;

                        if (!v14)
                        {
                          v56 = 0;
                          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("OnDemandMatchDomainsAlways"), &__block_literal_global_551, 0, 0, &v56);
                          v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
                          v14 = v56;
                          payloadOnDemandMatchDomainsAlways = self->_payloadOnDemandMatchDomainsAlways;
                          self->_payloadOnDemandMatchDomainsAlways = v38;

                          if (!v14)
                          {
                            v55 = 0;
                            -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("OnDemandMatchDomainsNever"), &__block_literal_global_552, 0, 0, &v55);
                            v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
                            v14 = v55;
                            payloadOnDemandMatchDomainsNever = self->_payloadOnDemandMatchDomainsNever;
                            self->_payloadOnDemandMatchDomainsNever = v40;

                            if (!v14)
                            {
                              v54 = 0;
                              -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("OnDemandMatchDomainsOnRetry"), &__block_literal_global_553, 0, 0, &v54);
                              v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
                              v14 = v54;
                              payloadOnDemandMatchDomainsOnRetry = self->_payloadOnDemandMatchDomainsOnRetry;
                              self->_payloadOnDemandMatchDomainsOnRetry = v42;

                              if (!v14)
                              {
                                v53 = 0;
                                -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("OnDemandRules"), objc_opt_class(), 0, 0, 0, &v53);
                                v44 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                v14 = v53;
                                payloadOnDemandRules = self->_payloadOnDemandRules;
                                self->_payloadOnDemandRules = v44;

                                if (!v14)
                                {
                                  v52 = 0;
                                  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisconnectOnIdle"), 0, &unk_24C69CD58, &v52);
                                  v46 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                  v14 = v52;
                                  payloadDisconnectOnIdle = self->_payloadDisconnectOnIdle;
                                  self->_payloadDisconnectOnIdle = v46;

                                  if (!v14)
                                  {
                                    v51 = 0;
                                    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisconnectOnIdleTimer"), 0, 0, &v51);
                                    v48 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                    v14 = v51;
                                    payloadDisconnectOnIdleTimer = self->_payloadDisconnectOnIdleTimer;
                                    self->_payloadDisconnectOnIdleTimer = v48;

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
  id v4;
  void *v5;
  NSArray *payloadOnDemandRules;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("RemoteAddress"), self->_payloadRemoteAddress, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AuthenticationMethod"), self->_payloadAuthenticationMethod, 0, CFSTR("SharedSecret"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("XAuthName"), self->_payloadXAuthName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("XAuthPassword"), self->_payloadXAuthPassword, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("XAuthEnabled"), self->_payloadXAuthEnabled, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("XAuthPasswordEncryption"), self->_payloadXAuthPasswordEncryption, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("LocalIdentifier"), self->_payloadLocalIdentifier, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("LocalIdentifierType"), self->_payloadLocalIdentifierType, 0, CFSTR("KeyID"));
  -[CEMPayloadBase serializeDataIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeDataIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SharedSecret"), self->_payloadSharedSecret, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("PayloadCertificateUUID"), self->_payloadPayloadCertificateUUID, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("PromptForVPNPIN"), self->_payloadPromptForVPNPIN, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("OnDemandEnabled"), self->_payloadOnDemandEnabled, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("OnDemandMatchDomainsAlways"), self->_payloadOnDemandMatchDomainsAlways, &__block_literal_global_554, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("OnDemandMatchDomainsNever"), self->_payloadOnDemandMatchDomainsNever, &__block_literal_global_555, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("OnDemandMatchDomainsOnRetry"), self->_payloadOnDemandMatchDomainsOnRetry, &__block_literal_global_556, 0, 0);
  payloadOnDemandRules = self->_payloadOnDemandRules;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__CEMNetworkVPNDeclaration_IPSec_serializePayloadWithAssetProviders___block_invoke_4;
  v10[3] = &unk_24C639340;
  v11 = v4;
  v7 = v4;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("OnDemandRules"), payloadOnDemandRules, v10, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisconnectOnIdle"), self->_payloadDisconnectOnIdle, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisconnectOnIdleTimer"), self->_payloadDisconnectOnIdleTimer, 0, 0);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
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
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CEMNetworkVPNDeclaration_IPSec;
  v4 = -[CEMPayloadBase copyWithZone:](&v42, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadRemoteAddress, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadAuthenticationMethod, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadXAuthName, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadXAuthPassword, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadXAuthEnabled, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_payloadXAuthPasswordEncryption, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSString copy](self->_payloadLocalIdentifier, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSString copy](self->_payloadLocalIdentifierType, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSData copy](self->_payloadSharedSecret, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSString copy](self->_payloadPayloadCertificateUUID, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSNumber copy](self->_payloadPromptForVPNPIN, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSNumber copy](self->_payloadOnDemandEnabled, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  v29 = -[NSArray copy](self->_payloadOnDemandMatchDomainsAlways, "copy");
  v30 = (void *)v4[14];
  v4[14] = v29;

  v31 = -[NSArray copy](self->_payloadOnDemandMatchDomainsNever, "copy");
  v32 = (void *)v4[15];
  v4[15] = v31;

  v33 = -[NSArray copy](self->_payloadOnDemandMatchDomainsOnRetry, "copy");
  v34 = (void *)v4[16];
  v4[16] = v33;

  v35 = -[NSArray copy](self->_payloadOnDemandRules, "copy");
  v36 = (void *)v4[17];
  v4[17] = v35;

  v37 = -[NSNumber copy](self->_payloadDisconnectOnIdle, "copy");
  v38 = (void *)v4[18];
  v4[18] = v37;

  v39 = -[NSNumber copy](self->_payloadDisconnectOnIdleTimer, "copy");
  v40 = (void *)v4[19];
  v4[19] = v39;

  return v4;
}

- (NSString)payloadRemoteAddress
{
  return self->_payloadRemoteAddress;
}

- (void)setPayloadRemoteAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadAuthenticationMethod
{
  return self->_payloadAuthenticationMethod;
}

- (void)setPayloadAuthenticationMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadXAuthName
{
  return self->_payloadXAuthName;
}

- (void)setPayloadXAuthName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadXAuthPassword
{
  return self->_payloadXAuthPassword;
}

- (void)setPayloadXAuthPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadXAuthEnabled
{
  return self->_payloadXAuthEnabled;
}

- (void)setPayloadXAuthEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadXAuthPasswordEncryption
{
  return self->_payloadXAuthPasswordEncryption;
}

- (void)setPayloadXAuthPasswordEncryption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadLocalIdentifier
{
  return self->_payloadLocalIdentifier;
}

- (void)setPayloadLocalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)payloadLocalIdentifierType
{
  return self->_payloadLocalIdentifierType;
}

- (void)setPayloadLocalIdentifierType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)payloadSharedSecret
{
  return self->_payloadSharedSecret;
}

- (void)setPayloadSharedSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadPayloadCertificateUUID
{
  return self->_payloadPayloadCertificateUUID;
}

- (void)setPayloadPayloadCertificateUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadPromptForVPNPIN
{
  return self->_payloadPromptForVPNPIN;
}

- (void)setPayloadPromptForVPNPIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadOnDemandEnabled
{
  return self->_payloadOnDemandEnabled;
}

- (void)setPayloadOnDemandEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)payloadOnDemandMatchDomainsAlways
{
  return self->_payloadOnDemandMatchDomainsAlways;
}

- (void)setPayloadOnDemandMatchDomainsAlways:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)payloadOnDemandMatchDomainsNever
{
  return self->_payloadOnDemandMatchDomainsNever;
}

- (void)setPayloadOnDemandMatchDomainsNever:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)payloadOnDemandMatchDomainsOnRetry
{
  return self->_payloadOnDemandMatchDomainsOnRetry;
}

- (void)setPayloadOnDemandMatchDomainsOnRetry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)payloadOnDemandRules
{
  return self->_payloadOnDemandRules;
}

- (void)setPayloadOnDemandRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadDisconnectOnIdle
{
  return self->_payloadDisconnectOnIdle;
}

- (void)setPayloadDisconnectOnIdle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)payloadDisconnectOnIdleTimer
{
  return self->_payloadDisconnectOnIdleTimer;
}

- (void)setPayloadDisconnectOnIdleTimer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdleTimer, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdle, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandRules, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsOnRetry, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsNever, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsAlways, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandEnabled, 0);
  objc_storeStrong((id *)&self->_payloadPromptForVPNPIN, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadSharedSecret, 0);
  objc_storeStrong((id *)&self->_payloadLocalIdentifierType, 0);
  objc_storeStrong((id *)&self->_payloadLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadXAuthPasswordEncryption, 0);
  objc_storeStrong((id *)&self->_payloadXAuthEnabled, 0);
  objc_storeStrong((id *)&self->_payloadXAuthPassword, 0);
  objc_storeStrong((id *)&self->_payloadXAuthName, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);
  objc_storeStrong((id *)&self->_payloadRemoteAddress, 0);
}

@end
