@implementation CEMNetworkVPNDeclaration_PPP

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[12];

  v6[11] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("AuthName");
  v6[1] = CFSTR("AuthPassword");
  v6[2] = CFSTR("TokenCard");
  v6[3] = CFSTR("CommRemoteAddress");
  v6[4] = CFSTR("AuthEAPPlugins");
  v6[5] = CFSTR("AuthProtocol");
  v6[6] = CFSTR("CCPMPPE40Enabled");
  v6[7] = CFSTR("CCPMPPE128Enabled");
  v6[8] = CFSTR("CCPEnabled");
  v6[9] = CFSTR("DisconnectOnIdle");
  v6[10] = CFSTR("DisconnectOnIdleTimer");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithAuthName:(id)a3 withAuthPassword:(id)a4 withTokenCard:(id)a5 withCommRemoteAddress:(id)a6 withAuthEAPPlugins:(id)a7 withAuthProtocol:(id)a8 withCCPMPPE40Enabled:(id)a9 withCCPMPPE128Enabled:(id)a10 withCCPEnabled:(id)a11 withDisconnectOnIdle:(id)a12 withDisconnectOnIdleTimer:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v31;
  id v32;
  id v33;

  v33 = a13;
  v18 = a12;
  v32 = a11;
  v31 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setPayloadAuthName:", v25);

  objc_msgSend(v26, "setPayloadAuthPassword:", v24);
  if (v23)
    v27 = v23;
  else
    v27 = &unk_24C69CD58;
  objc_msgSend(v26, "setPayloadTokenCard:", v27, a3);

  objc_msgSend(v26, "setPayloadCommRemoteAddress:", v22);
  objc_msgSend(v26, "setPayloadAuthEAPPlugins:", v21);

  objc_msgSend(v26, "setPayloadAuthProtocol:", v20);
  objc_msgSend(v26, "setPayloadCCPMPPE40Enabled:", v19);

  objc_msgSend(v26, "setPayloadCCPMPPE128Enabled:", v31);
  objc_msgSend(v26, "setPayloadCCPEnabled:", v32);

  if (v18)
    v28 = v18;
  else
    v28 = &unk_24C69CD58;
  objc_msgSend(v26, "setPayloadDisconnectOnIdle:", v28);

  objc_msgSend(v26, "setPayloadDisconnectOnIdleTimer:", v33);
  return v26;
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
  NSNumber *v18;
  NSNumber *payloadTokenCard;
  NSString *v20;
  NSString *payloadCommRemoteAddress;
  NSArray *v22;
  NSArray *payloadAuthEAPPlugins;
  NSArray *v24;
  NSArray *payloadAuthProtocol;
  NSNumber *v26;
  NSNumber *payloadCCPMPPE40Enabled;
  NSNumber *v28;
  NSNumber *payloadCCPMPPE128Enabled;
  NSNumber *v30;
  NSNumber *payloadCCPEnabled;
  NSNumber *v32;
  NSNumber *payloadDisconnectOnIdle;
  NSNumber *v34;
  NSNumber *payloadDisconnectOnIdleTimer;
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

  +[CEMNetworkVPNDeclaration_PPP allowedPayloadKeys](CEMNetworkVPNDeclaration_PPP, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v47 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthName"), 0, 0, &v47);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v47;
  payloadAuthName = self->_payloadAuthName;
  self->_payloadAuthName = v13;

  if (!v14)
  {
    v46 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthPassword"), 0, 0, &v46);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v46;
    payloadAuthPassword = self->_payloadAuthPassword;
    self->_payloadAuthPassword = v16;

    if (!v14)
    {
      v45 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("TokenCard"), 0, &unk_24C69CD58, &v45);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v45;
      payloadTokenCard = self->_payloadTokenCard;
      self->_payloadTokenCard = v18;

      if (!v14)
      {
        v44 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CommRemoteAddress"), 0, 0, &v44);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v44;
        payloadCommRemoteAddress = self->_payloadCommRemoteAddress;
        self->_payloadCommRemoteAddress = v20;

        if (!v14)
        {
          v43 = 0;
          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("AuthEAPPlugins"), &__block_literal_global_487, 0, 0, &v43);
          v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v14 = v43;
          payloadAuthEAPPlugins = self->_payloadAuthEAPPlugins;
          self->_payloadAuthEAPPlugins = v22;

          if (!v14)
          {
            v42 = 0;
            -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("AuthProtocol"), &__block_literal_global_488, 0, 0, &v42);
            v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v14 = v42;
            payloadAuthProtocol = self->_payloadAuthProtocol;
            self->_payloadAuthProtocol = v24;

            if (!v14)
            {
              v41 = 0;
              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CCPMPPE40Enabled"), 0, 0, &v41);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v41;
              payloadCCPMPPE40Enabled = self->_payloadCCPMPPE40Enabled;
              self->_payloadCCPMPPE40Enabled = v26;

              if (!v14)
              {
                v40 = 0;
                -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CCPMPPE128Enabled"), 0, 0, &v40);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v40;
                payloadCCPMPPE128Enabled = self->_payloadCCPMPPE128Enabled;
                self->_payloadCCPMPPE128Enabled = v28;

                if (!v14)
                {
                  v39 = 0;
                  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CCPEnabled"), 0, 0, &v39);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v39;
                  payloadCCPEnabled = self->_payloadCCPEnabled;
                  self->_payloadCCPEnabled = v30;

                  if (!v14)
                  {
                    v38 = 0;
                    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisconnectOnIdle"), 0, &unk_24C69CD58, &v38);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v38;
                    payloadDisconnectOnIdle = self->_payloadDisconnectOnIdle;
                    self->_payloadDisconnectOnIdle = v32;

                    if (!v14)
                    {
                      v37 = 0;
                      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisconnectOnIdleTimer"), 0, 0, &v37);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v37;
                      payloadDisconnectOnIdleTimer = self->_payloadDisconnectOnIdleTimer;
                      self->_payloadDisconnectOnIdleTimer = v34;

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
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AuthName"), self->_payloadAuthName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AuthPassword"), self->_payloadAuthPassword, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("TokenCard"), self->_payloadTokenCard, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CommRemoteAddress"), self->_payloadCommRemoteAddress, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("AuthEAPPlugins"), self->_payloadAuthEAPPlugins, &__block_literal_global_489, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("AuthProtocol"), self->_payloadAuthProtocol, &__block_literal_global_490, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CCPMPPE40Enabled"), self->_payloadCCPMPPE40Enabled, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CCPMPPE128Enabled"), self->_payloadCCPMPPE128Enabled, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CCPEnabled"), self->_payloadCCPEnabled, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisconnectOnIdle"), self->_payloadDisconnectOnIdle, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisconnectOnIdleTimer"), self->_payloadDisconnectOnIdleTimer, 0, 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
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
  v28.super_class = (Class)CEMNetworkVPNDeclaration_PPP;
  v4 = -[CEMPayloadBase copyWithZone:](&v28, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadAuthName, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadAuthPassword, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadTokenCard, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadCommRemoteAddress, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSArray copy](self->_payloadAuthEAPPlugins, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSArray copy](self->_payloadAuthProtocol, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_payloadCCPMPPE40Enabled, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_payloadCCPMPPE128Enabled, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_payloadCCPEnabled, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_payloadDisconnectOnIdle, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSNumber copy](self->_payloadDisconnectOnIdleTimer, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

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

- (NSNumber)payloadTokenCard
{
  return self->_payloadTokenCard;
}

- (void)setPayloadTokenCard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadCommRemoteAddress
{
  return self->_payloadCommRemoteAddress;
}

- (void)setPayloadCommRemoteAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)payloadAuthEAPPlugins
{
  return self->_payloadAuthEAPPlugins;
}

- (void)setPayloadAuthEAPPlugins:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)payloadAuthProtocol
{
  return self->_payloadAuthProtocol;
}

- (void)setPayloadAuthProtocol:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadCCPMPPE40Enabled
{
  return self->_payloadCCPMPPE40Enabled;
}

- (void)setPayloadCCPMPPE40Enabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadCCPMPPE128Enabled
{
  return self->_payloadCCPMPPE128Enabled;
}

- (void)setPayloadCCPMPPE128Enabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadCCPEnabled
{
  return self->_payloadCCPEnabled;
}

- (void)setPayloadCCPEnabled:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdleTimer, 0);
  objc_storeStrong((id *)&self->_payloadDisconnectOnIdle, 0);
  objc_storeStrong((id *)&self->_payloadCCPEnabled, 0);
  objc_storeStrong((id *)&self->_payloadCCPMPPE128Enabled, 0);
  objc_storeStrong((id *)&self->_payloadCCPMPPE40Enabled, 0);
  objc_storeStrong((id *)&self->_payloadAuthProtocol, 0);
  objc_storeStrong((id *)&self->_payloadAuthEAPPlugins, 0);
  objc_storeStrong((id *)&self->_payloadCommRemoteAddress, 0);
  objc_storeStrong((id *)&self->_payloadTokenCard, 0);
  objc_storeStrong((id *)&self->_payloadAuthPassword, 0);
  objc_storeStrong((id *)&self->_payloadAuthName, 0);
}

@end
