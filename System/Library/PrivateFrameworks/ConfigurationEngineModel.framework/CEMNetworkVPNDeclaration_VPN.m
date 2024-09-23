@implementation CEMNetworkVPNDeclaration_VPN

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[15];

  v6[14] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("AuthName");
  v6[1] = CFSTR("AuthPassword");
  v6[2] = CFSTR("AuthenticationMethod");
  v6[3] = CFSTR("PayloadCertificateUUID");
  v6[4] = CFSTR("OnDemandEnabled");
  v6[5] = CFSTR("OnDemandMatchDomainsAlways");
  v6[6] = CFSTR("OnDemandMatchDomainsNever");
  v6[7] = CFSTR("OnDemandMatchDomainsOnRetry");
  v6[8] = CFSTR("OnDemandRules");
  v6[9] = CFSTR("DisconnectOnIdle");
  v6[10] = CFSTR("DisconnectOnIdleTimer");
  v6[11] = CFSTR("RemoteAddress");
  v6[12] = CFSTR("Password");
  v6[13] = CFSTR("ProviderBundleIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithAuthName:(id)a3 withAuthPassword:(id)a4 withAuthenticationMethod:(id)a5 withPayloadCertificateUUID:(id)a6 withOnDemandEnabled:(id)a7 withOnDemandMatchDomainsAlways:(id)a8 withOnDemandMatchDomainsNever:(id)a9 withOnDemandMatchDomainsOnRetry:(id)a10 withOnDemandRules:(id)a11 withDisconnectOnIdle:(id)a12 withDisconnectOnIdleTimer:(id)a13 withRemoteAddress:(id)a14 withPassword:(id)a15 withProviderBundleIdentifier:(id)a16
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __CFString *v25;
  id v26;
  id v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v40 = a16;
  v39 = a15;
  v38 = a14;
  v37 = a13;
  v19 = a12;
  v36 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = (__CFString *)a5;
  v26 = a4;
  v27 = a3;
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "setPayloadAuthName:", v27);

  objc_msgSend(v28, "setPayloadAuthPassword:", v26);
  if (v25)
    v29 = v25;
  else
    v29 = CFSTR("Password");
  objc_msgSend(v28, "setPayloadAuthenticationMethod:", v29);

  objc_msgSend(v28, "setPayloadPayloadCertificateUUID:", v24);
  if (v23)
    v30 = v23;
  else
    v30 = &unk_24C69CD58;
  objc_msgSend(v28, "setPayloadOnDemandEnabled:", v30);

  objc_msgSend(v28, "setPayloadOnDemandMatchDomainsAlways:", v22);
  objc_msgSend(v28, "setPayloadOnDemandMatchDomainsNever:", v21);

  objc_msgSend(v28, "setPayloadOnDemandMatchDomainsOnRetry:", v20);
  objc_msgSend(v28, "setPayloadOnDemandRules:", v36);

  if (v19)
    v31 = v19;
  else
    v31 = &unk_24C69CD58;
  objc_msgSend(v28, "setPayloadDisconnectOnIdle:", v31);

  objc_msgSend(v28, "setPayloadDisconnectOnIdleTimer:", v37);
  objc_msgSend(v28, "setPayloadRemoteAddress:", v38);

  objc_msgSend(v28, "setPayloadPassword:", v39);
  objc_msgSend(v28, "setPayloadProviderBundleIdentifier:", v40);

  return v28;
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
  NSString *payloadAuthName;
  NSString *v16;
  NSString *payloadAuthPassword;
  NSString *v18;
  NSString *payloadAuthenticationMethod;
  NSString *v20;
  NSString *payloadPayloadCertificateUUID;
  NSNumber *v22;
  NSNumber *payloadOnDemandEnabled;
  NSArray *v24;
  NSArray *payloadOnDemandMatchDomainsAlways;
  NSArray *v26;
  NSArray *payloadOnDemandMatchDomainsNever;
  NSArray *v28;
  NSArray *payloadOnDemandMatchDomainsOnRetry;
  NSArray *v30;
  NSArray *payloadOnDemandRules;
  NSNumber *v32;
  NSNumber *payloadDisconnectOnIdle;
  NSNumber *v34;
  NSNumber *payloadDisconnectOnIdleTimer;
  NSString *v36;
  NSString *payloadRemoteAddress;
  NSString *v38;
  NSString *payloadPassword;
  NSString *v40;
  NSString *payloadProviderBundleIdentifier;
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
  id v54;
  id v55;
  id v56;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkVPNDeclaration_VPN allowedPayloadKeys](CEMNetworkVPNDeclaration_VPN, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v56 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthName"), 0, 0, &v56);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v56;
  payloadAuthName = self->_payloadAuthName;
  self->_payloadAuthName = v13;

  if (!v14)
  {
    v55 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthPassword"), 0, 0, &v55);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v55;
    payloadAuthPassword = self->_payloadAuthPassword;
    self->_payloadAuthPassword = v16;

    if (!v14)
    {
      v54 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthenticationMethod"), 0, CFSTR("Password"), &v54);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v54;
      payloadAuthenticationMethod = self->_payloadAuthenticationMethod;
      self->_payloadAuthenticationMethod = v18;

      if (!v14)
      {
        v53 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PayloadCertificateUUID"), 0, 0, &v53);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v53;
        payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
        self->_payloadPayloadCertificateUUID = v20;

        if (!v14)
        {
          v52 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OnDemandEnabled"), 0, &unk_24C69CD58, &v52);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v52;
          payloadOnDemandEnabled = self->_payloadOnDemandEnabled;
          self->_payloadOnDemandEnabled = v22;

          if (!v14)
          {
            v51 = 0;
            -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("OnDemandMatchDomainsAlways"), &__block_literal_global_23, 0, 0, &v51);
            v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v14 = v51;
            payloadOnDemandMatchDomainsAlways = self->_payloadOnDemandMatchDomainsAlways;
            self->_payloadOnDemandMatchDomainsAlways = v24;

            if (!v14)
            {
              v50 = 0;
              -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("OnDemandMatchDomainsNever"), &__block_literal_global_267, 0, 0, &v50);
              v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
              v14 = v50;
              payloadOnDemandMatchDomainsNever = self->_payloadOnDemandMatchDomainsNever;
              self->_payloadOnDemandMatchDomainsNever = v26;

              if (!v14)
              {
                v49 = 0;
                -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("OnDemandMatchDomainsOnRetry"), &__block_literal_global_268, 0, 0, &v49);
                v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
                v14 = v49;
                payloadOnDemandMatchDomainsOnRetry = self->_payloadOnDemandMatchDomainsOnRetry;
                self->_payloadOnDemandMatchDomainsOnRetry = v28;

                if (!v14)
                {
                  v48 = 0;
                  -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("OnDemandRules"), objc_opt_class(), 0, 0, 0, &v48);
                  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
                  v14 = v48;
                  payloadOnDemandRules = self->_payloadOnDemandRules;
                  self->_payloadOnDemandRules = v30;

                  if (!v14)
                  {
                    v47 = 0;
                    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisconnectOnIdle"), 0, &unk_24C69CD58, &v47);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v47;
                    payloadDisconnectOnIdle = self->_payloadDisconnectOnIdle;
                    self->_payloadDisconnectOnIdle = v32;

                    if (!v14)
                    {
                      v46 = 0;
                      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisconnectOnIdleTimer"), 0, 0, &v46);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v46;
                      payloadDisconnectOnIdleTimer = self->_payloadDisconnectOnIdleTimer;
                      self->_payloadDisconnectOnIdleTimer = v34;

                      if (!v14)
                      {
                        v45 = 0;
                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RemoteAddress"), 0, 0, &v45);
                        v36 = (NSString *)objc_claimAutoreleasedReturnValue();
                        v14 = v45;
                        payloadRemoteAddress = self->_payloadRemoteAddress;
                        self->_payloadRemoteAddress = v36;

                        if (!v14)
                        {
                          v44 = 0;
                          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Password"), 0, 0, &v44);
                          v38 = (NSString *)objc_claimAutoreleasedReturnValue();
                          v14 = v44;
                          payloadPassword = self->_payloadPassword;
                          self->_payloadPassword = v38;

                          if (!v14)
                          {
                            v43 = 0;
                            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProviderBundleIdentifier"), 0, 0, &v43);
                            v40 = (NSString *)objc_claimAutoreleasedReturnValue();
                            v14 = v43;
                            payloadProviderBundleIdentifier = self->_payloadProviderBundleIdentifier;
                            self->_payloadProviderBundleIdentifier = v40;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AuthName"), self->_payloadAuthName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AuthPassword"), self->_payloadAuthPassword, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AuthenticationMethod"), self->_payloadAuthenticationMethod, 0, CFSTR("Password"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("PayloadCertificateUUID"), self->_payloadPayloadCertificateUUID, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("OnDemandEnabled"), self->_payloadOnDemandEnabled, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("OnDemandMatchDomainsAlways"), self->_payloadOnDemandMatchDomainsAlways, &__block_literal_global_271, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("OnDemandMatchDomainsNever"), self->_payloadOnDemandMatchDomainsNever, &__block_literal_global_272, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("OnDemandMatchDomainsOnRetry"), self->_payloadOnDemandMatchDomainsOnRetry, &__block_literal_global_273, 0, 0);
  payloadOnDemandRules = self->_payloadOnDemandRules;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__CEMNetworkVPNDeclaration_VPN_serializePayloadWithAssetProviders___block_invoke_4;
  v10[3] = &unk_24C639340;
  v11 = v4;
  v7 = v4;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("OnDemandRules"), payloadOnDemandRules, v10, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisconnectOnIdle"), self->_payloadDisconnectOnIdle, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DisconnectOnIdleTimer"), self->_payloadDisconnectOnIdleTimer, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("RemoteAddress"), self->_payloadRemoteAddress, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Password"), self->_payloadPassword, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ProviderBundleIdentifier"), self->_payloadProviderBundleIdentifier, 0, 0);
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
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CEMNetworkVPNDeclaration_VPN;
  v4 = -[CEMPayloadBase copyWithZone:](&v34, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadAuthName, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadAuthPassword, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadAuthenticationMethod, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadPayloadCertificateUUID, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadOnDemandEnabled, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSArray copy](self->_payloadOnDemandMatchDomainsAlways, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSArray copy](self->_payloadOnDemandMatchDomainsNever, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSArray copy](self->_payloadOnDemandMatchDomainsOnRetry, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSArray copy](self->_payloadOnDemandRules, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_payloadDisconnectOnIdle, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSNumber copy](self->_payloadDisconnectOnIdleTimer, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSString copy](self->_payloadRemoteAddress, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  v29 = -[NSString copy](self->_payloadPassword, "copy");
  v30 = (void *)v4[14];
  v4[14] = v29;

  v31 = -[NSString copy](self->_payloadProviderBundleIdentifier, "copy");
  v32 = (void *)v4[15];
  v4[15] = v31;

  return v4;
}

- (NSString)payloadAuthName
{
  return self->_payloadAuthName;
}

- (void)setPayloadAuthName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadAuthPassword
{
  return self->_payloadAuthPassword;
}

- (void)setPayloadAuthPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadAuthenticationMethod
{
  return self->_payloadAuthenticationMethod;
}

- (void)setPayloadAuthenticationMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadPayloadCertificateUUID
{
  return self->_payloadPayloadCertificateUUID;
}

- (void)setPayloadPayloadCertificateUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadOnDemandEnabled
{
  return self->_payloadOnDemandEnabled;
}

- (void)setPayloadOnDemandEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)payloadOnDemandMatchDomainsAlways
{
  return self->_payloadOnDemandMatchDomainsAlways;
}

- (void)setPayloadOnDemandMatchDomainsAlways:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)payloadOnDemandMatchDomainsNever
{
  return self->_payloadOnDemandMatchDomainsNever;
}

- (void)setPayloadOnDemandMatchDomainsNever:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)payloadOnDemandMatchDomainsOnRetry
{
  return self->_payloadOnDemandMatchDomainsOnRetry;
}

- (void)setPayloadOnDemandMatchDomainsOnRetry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)payloadOnDemandRules
{
  return self->_payloadOnDemandRules;
}

- (void)setPayloadOnDemandRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadDisconnectOnIdle
{
  return self->_payloadDisconnectOnIdle;
}

- (void)setPayloadDisconnectOnIdle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadDisconnectOnIdleTimer
{
  return self->_payloadDisconnectOnIdleTimer;
}

- (void)setPayloadDisconnectOnIdleTimer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadRemoteAddress
{
  return self->_payloadRemoteAddress;
}

- (void)setPayloadRemoteAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)payloadProviderBundleIdentifier
{
  return self->_payloadProviderBundleIdentifier;
}

- (void)setPayloadProviderBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProviderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadRemoteAddress, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdleTimer, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdle, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandRules, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsOnRetry, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsNever, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchDomainsAlways, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandEnabled, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);
  objc_storeStrong((id *)&self->_payloadAuthPassword, 0);
  objc_storeStrong((id *)&self->_payloadAuthName, 0);
}

@end
