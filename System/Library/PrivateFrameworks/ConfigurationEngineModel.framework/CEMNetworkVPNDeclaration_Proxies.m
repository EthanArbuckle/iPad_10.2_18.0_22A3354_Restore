@implementation CEMNetworkVPNDeclaration_Proxies

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("HTTPEnable");
  v6[1] = CFSTR("HTTPPort");
  v6[2] = CFSTR("HTTPProxy");
  v6[3] = CFSTR("HTTPProxyPassword");
  v6[4] = CFSTR("HTTPProxyUsername");
  v6[5] = CFSTR("HTTPSEnable");
  v6[6] = CFSTR("HTTPSPort");
  v6[7] = CFSTR("HTTPSProxy");
  v6[8] = CFSTR("ProxyAutoConfigEnable");
  v6[9] = CFSTR("ProxyAutoDiscoveryEnable");
  v6[10] = CFSTR("ProxyAutoConfigURLString");
  v6[11] = CFSTR("SupplementalMatchDomains");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithHTTPEnable:(id)a3 withHTTPPort:(id)a4 withHTTPProxy:(id)a5 withHTTPProxyPassword:(id)a6 withHTTPProxyUsername:(id)a7 withHTTPSEnable:(id)a8 withHTTPSPort:(id)a9 withHTTPSProxy:(id)a10 withProxyAutoConfigEnable:(id)a11 withProxyAutoDiscoveryEnable:(id)a12 withProxyAutoConfigURLString:(id)a13 withSupplementalMatchDomains:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v34;
  id v35;
  id v36;
  id v37;

  v37 = a14;
  v36 = a13;
  v19 = a12;
  v35 = a11;
  v34 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  v27 = (void *)objc_opt_new();
  v28 = v27;
  if (v26)
    v29 = v26;
  else
    v29 = &unk_24C69CD58;
  objc_msgSend(v27, "setPayloadHTTPEnable:", v29, CEMNetworkVPNDeclaration_Proxies);

  objc_msgSend(v28, "setPayloadHTTPPort:", v25);
  objc_msgSend(v28, "setPayloadHTTPProxy:", v24);

  objc_msgSend(v28, "setPayloadHTTPProxyPassword:", v23);
  objc_msgSend(v28, "setPayloadHTTPProxyUsername:", v22);

  if (v21)
    v30 = v21;
  else
    v30 = &unk_24C69CD58;
  objc_msgSend(v28, "setPayloadHTTPSEnable:", v30);

  objc_msgSend(v28, "setPayloadHTTPSPort:", v20);
  objc_msgSend(v28, "setPayloadHTTPSProxy:", v34);

  objc_msgSend(v28, "setPayloadProxyAutoConfigEnable:", v35);
  if (v19)
    v31 = v19;
  else
    v31 = &unk_24C69CD70;
  objc_msgSend(v28, "setPayloadProxyAutoDiscoveryEnable:", v31);

  objc_msgSend(v28, "setPayloadProxyAutoConfigURLString:", v36);
  objc_msgSend(v28, "setPayloadSupplementalMatchDomains:", v37);

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
  NSNumber *v13;
  id v14;
  NSNumber *payloadHTTPEnable;
  NSNumber *v16;
  NSNumber *payloadHTTPPort;
  NSString *v18;
  NSString *payloadHTTPProxy;
  NSString *v20;
  NSString *payloadHTTPProxyPassword;
  NSString *v22;
  NSString *payloadHTTPProxyUsername;
  NSNumber *v24;
  NSNumber *payloadHTTPSEnable;
  NSNumber *v26;
  NSNumber *payloadHTTPSPort;
  NSString *v28;
  NSString *payloadHTTPSProxy;
  NSNumber *v30;
  NSNumber *payloadProxyAutoConfigEnable;
  NSNumber *v32;
  NSNumber *payloadProxyAutoDiscoveryEnable;
  NSString *v34;
  NSString *payloadProxyAutoConfigURLString;
  NSArray *v36;
  NSArray *payloadSupplementalMatchDomains;
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

  +[CEMNetworkVPNDeclaration_Proxies allowedPayloadKeys](CEMNetworkVPNDeclaration_Proxies, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v50 = 0;
  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HTTPEnable"), 0, &unk_24C69CD58, &v50);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v50;
  payloadHTTPEnable = self->_payloadHTTPEnable;
  self->_payloadHTTPEnable = v13;

  if (!v14)
  {
    v49 = 0;
    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HTTPPort"), 0, 0, &v49);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v49;
    payloadHTTPPort = self->_payloadHTTPPort;
    self->_payloadHTTPPort = v16;

    if (!v14)
    {
      v48 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HTTPProxy"), 0, 0, &v48);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v48;
      payloadHTTPProxy = self->_payloadHTTPProxy;
      self->_payloadHTTPProxy = v18;

      if (!v14)
      {
        v47 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HTTPProxyPassword"), 0, 0, &v47);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v47;
        payloadHTTPProxyPassword = self->_payloadHTTPProxyPassword;
        self->_payloadHTTPProxyPassword = v20;

        if (!v14)
        {
          v46 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HTTPProxyUsername"), 0, 0, &v46);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v46;
          payloadHTTPProxyUsername = self->_payloadHTTPProxyUsername;
          self->_payloadHTTPProxyUsername = v22;

          if (!v14)
          {
            v45 = 0;
            -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HTTPSEnable"), 0, &unk_24C69CD58, &v45);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v45;
            payloadHTTPSEnable = self->_payloadHTTPSEnable;
            self->_payloadHTTPSEnable = v24;

            if (!v14)
            {
              v44 = 0;
              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HTTPSPort"), 0, 0, &v44);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v44;
              payloadHTTPSPort = self->_payloadHTTPSPort;
              self->_payloadHTTPSPort = v26;

              if (!v14)
              {
                v43 = 0;
                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HTTPSProxy"), 0, 0, &v43);
                v28 = (NSString *)objc_claimAutoreleasedReturnValue();
                v14 = v43;
                payloadHTTPSProxy = self->_payloadHTTPSProxy;
                self->_payloadHTTPSProxy = v28;

                if (!v14)
                {
                  v42 = 0;
                  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyAutoConfigEnable"), 0, 0, &v42);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v42;
                  payloadProxyAutoConfigEnable = self->_payloadProxyAutoConfigEnable;
                  self->_payloadProxyAutoConfigEnable = v30;

                  if (!v14)
                  {
                    v41 = 0;
                    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyAutoDiscoveryEnable"), 0, &unk_24C69CD70, &v41);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v41;
                    payloadProxyAutoDiscoveryEnable = self->_payloadProxyAutoDiscoveryEnable;
                    self->_payloadProxyAutoDiscoveryEnable = v32;

                    if (!v14)
                    {
                      v40 = 0;
                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyAutoConfigURLString"), 0, 0, &v40);
                      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
                      v14 = v40;
                      payloadProxyAutoConfigURLString = self->_payloadProxyAutoConfigURLString;
                      self->_payloadProxyAutoConfigURLString = v34;

                      if (!v14)
                      {
                        v39 = 0;
                        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("SupplementalMatchDomains"), &__block_literal_global_839, 0, 0, &v39);
                        v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        v14 = v39;
                        payloadSupplementalMatchDomains = self->_payloadSupplementalMatchDomains;
                        self->_payloadSupplementalMatchDomains = v36;

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
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HTTPEnable"), self->_payloadHTTPEnable, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HTTPPort"), self->_payloadHTTPPort, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HTTPProxy"), self->_payloadHTTPProxy, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HTTPProxyPassword"), self->_payloadHTTPProxyPassword, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HTTPProxyUsername"), self->_payloadHTTPProxyUsername, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HTTPSEnable"), self->_payloadHTTPSEnable, 0, &unk_24C69CD58);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HTTPSPort"), self->_payloadHTTPSPort, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HTTPSProxy"), self->_payloadHTTPSProxy, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyAutoConfigEnable"), self->_payloadProxyAutoConfigEnable, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyAutoDiscoveryEnable"), self->_payloadProxyAutoDiscoveryEnable, 0, &unk_24C69CD70);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyAutoConfigURLString"), self->_payloadProxyAutoConfigURLString, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("SupplementalMatchDomains"), self->_payloadSupplementalMatchDomains, &__block_literal_global_840, 0, 0);
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
  uint64_t v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CEMNetworkVPNDeclaration_Proxies;
  v4 = -[CEMPayloadBase copyWithZone:](&v30, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadHTTPEnable, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadHTTPPort, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadHTTPProxy, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadHTTPProxyPassword, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_payloadHTTPProxyUsername, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_payloadHTTPSEnable, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_payloadHTTPSPort, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSString copy](self->_payloadHTTPSProxy, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_payloadProxyAutoConfigEnable, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_payloadProxyAutoDiscoveryEnable, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSString copy](self->_payloadProxyAutoConfigURLString, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSArray copy](self->_payloadSupplementalMatchDomains, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  return v4;
}

- (NSNumber)payloadHTTPEnable
{
  return self->_payloadHTTPEnable;
}

- (void)setPayloadHTTPEnable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadHTTPPort
{
  return self->_payloadHTTPPort;
}

- (void)setPayloadHTTPPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadHTTPProxy
{
  return self->_payloadHTTPProxy;
}

- (void)setPayloadHTTPProxy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadHTTPProxyPassword
{
  return self->_payloadHTTPProxyPassword;
}

- (void)setPayloadHTTPProxyPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)payloadHTTPProxyUsername
{
  return self->_payloadHTTPProxyUsername;
}

- (void)setPayloadHTTPProxyUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)payloadHTTPSEnable
{
  return self->_payloadHTTPSEnable;
}

- (void)setPayloadHTTPSEnable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadHTTPSPort
{
  return self->_payloadHTTPSPort;
}

- (void)setPayloadHTTPSPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)payloadHTTPSProxy
{
  return self->_payloadHTTPSProxy;
}

- (void)setPayloadHTTPSProxy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadProxyAutoConfigEnable
{
  return self->_payloadProxyAutoConfigEnable;
}

- (void)setPayloadProxyAutoConfigEnable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadProxyAutoDiscoveryEnable
{
  return self->_payloadProxyAutoDiscoveryEnable;
}

- (void)setPayloadProxyAutoDiscoveryEnable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadProxyAutoConfigURLString
{
  return self->_payloadProxyAutoConfigURLString;
}

- (void)setPayloadProxyAutoConfigURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)payloadSupplementalMatchDomains
{
  return self->_payloadSupplementalMatchDomains;
}

- (void)setPayloadSupplementalMatchDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSupplementalMatchDomains, 0);
  objc_storeStrong((id *)&self->_payloadProxyAutoConfigURLString, 0);
  objc_storeStrong((id *)&self->_payloadProxyAutoDiscoveryEnable, 0);
  objc_storeStrong((id *)&self->_payloadProxyAutoConfigEnable, 0);
  objc_storeStrong((id *)&self->_payloadHTTPSProxy, 0);
  objc_storeStrong((id *)&self->_payloadHTTPSPort, 0);
  objc_storeStrong((id *)&self->_payloadHTTPSEnable, 0);
  objc_storeStrong((id *)&self->_payloadHTTPProxyUsername, 0);
  objc_storeStrong((id *)&self->_payloadHTTPProxyPassword, 0);
  objc_storeStrong((id *)&self->_payloadHTTPProxy, 0);
  objc_storeStrong((id *)&self->_payloadHTTPPort, 0);
  objc_storeStrong((id *)&self->_payloadHTTPEnable, 0);
}

@end
