@implementation CEMNetworkGlobalHTTPProxyDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.network.proxy.http.global");
}

+ (id)profileType
{
  return CFSTR("com.apple.proxy.http.global");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("ProxyType");
  v6[1] = CFSTR("ProxyServer");
  v6[2] = CFSTR("ProxyServerPort");
  v6[3] = CFSTR("ProxyUsername");
  v6[4] = CFSTR("ProxyPassword");
  v6[5] = CFSTR("ProxyPACURL");
  v6[6] = CFSTR("ProxyPACFallbackAllowed");
  v6[7] = CFSTR("ProxyCaptiveLoginAllowed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
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
  return 1;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withProxyType:(id)a4 withProxyServer:(id)a5 withProxyServerPort:(id)a6 withProxyUsername:(id)a7 withProxyPassword:(id)a8 withProxyPACURL:(id)a9 withProxyPACFallbackAllowed:(id)a10 withProxyCaptiveLoginAllowed:(id)a11
{
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  id v31;
  id v33;

  v16 = a3;
  v17 = a11;
  v18 = a10;
  v19 = v16;
  v33 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = (__CFString *)a4;
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setDeclarationType:", CFSTR("com.apple.configuration.network.proxy.http.global"));
  if (v19)
  {
    objc_msgSend(v25, "setDeclarationIdentifier:", v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDeclarationIdentifier:", v27);

    v19 = 0;
  }
  if (v24)
    v28 = v24;
  else
    v28 = CFSTR("Manual");
  objc_msgSend(v25, "setPayloadProxyType:", v28);

  objc_msgSend(v25, "setPayloadProxyServer:", v23);
  objc_msgSend(v25, "setPayloadProxyServerPort:", v22);

  objc_msgSend(v25, "setPayloadProxyUsername:", v21);
  objc_msgSend(v25, "setPayloadProxyPassword:", v20);

  objc_msgSend(v25, "setPayloadProxyPACURL:", v33);
  v29 = (void *)MEMORY[0x24BDBD1C0];
  if (v18)
    v30 = v18;
  else
    v30 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v25, "setPayloadProxyPACFallbackAllowed:", v30);

  if (v17)
    v31 = v17;
  else
    v31 = v29;
  objc_msgSend(v25, "setPayloadProxyCaptiveLoginAllowed:", v31);

  objc_msgSend(v25, "updateServerHash");
  return v25;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withProxyServer:(id)a4 withProxyServerPort:(id)a5 withProxyPACURL:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.network.proxy.http.global"));
  if (v9)
  {
    objc_msgSend(v13, "setDeclarationIdentifier:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDeclarationIdentifier:", v15);

  }
  objc_msgSend(v13, "setPayloadProxyServer:", v12);

  objc_msgSend(v13, "setPayloadProxyServerPort:", v11);
  objc_msgSend(v13, "setPayloadProxyPACURL:", v10);

  objc_msgSend(v13, "updateServerHash");
  return v13;
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
  NSString *payloadProxyType;
  NSString *v16;
  NSString *payloadProxyServer;
  NSNumber *v18;
  NSNumber *payloadProxyServerPort;
  NSString *v20;
  NSString *payloadProxyUsername;
  NSString *v22;
  NSString *payloadProxyPassword;
  NSString *v24;
  NSString *payloadProxyPACURL;
  NSNumber *v26;
  NSNumber *payloadProxyPACFallbackAllowed;
  NSNumber *v28;
  NSNumber *payloadProxyCaptiveLoginAllowed;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkGlobalHTTPProxyDeclaration allowedPayloadKeys](CEMNetworkGlobalHTTPProxyDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v38 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyType"), 0, CFSTR("Manual"), &v38);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v38;
  payloadProxyType = self->_payloadProxyType;
  self->_payloadProxyType = v13;

  if (!v14)
  {
    v37 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyServer"), 1, 0, &v37);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v37;
    payloadProxyServer = self->_payloadProxyServer;
    self->_payloadProxyServer = v16;

    if (!v14)
    {
      v36 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyServerPort"), 1, 0, &v36);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v36;
      payloadProxyServerPort = self->_payloadProxyServerPort;
      self->_payloadProxyServerPort = v18;

      if (!v14)
      {
        v35 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyUsername"), 0, 0, &v35);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v35;
        payloadProxyUsername = self->_payloadProxyUsername;
        self->_payloadProxyUsername = v20;

        if (!v14)
        {
          v34 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyPassword"), 0, 0, &v34);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v34;
          payloadProxyPassword = self->_payloadProxyPassword;
          self->_payloadProxyPassword = v22;

          if (!v14)
          {
            v33 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyPACURL"), 1, 0, &v33);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v33;
            payloadProxyPACURL = self->_payloadProxyPACURL;
            self->_payloadProxyPACURL = v24;

            if (!v14)
            {
              v32 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyPACFallbackAllowed"), 0, MEMORY[0x24BDBD1C0], &v32);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v32;
              payloadProxyPACFallbackAllowed = self->_payloadProxyPACFallbackAllowed;
              self->_payloadProxyPACFallbackAllowed = v26;

              if (!v14)
              {
                v31 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyCaptiveLoginAllowed"), 0, MEMORY[0x24BDBD1C0], &v31);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v31;
                payloadProxyCaptiveLoginAllowed = self->_payloadProxyCaptiveLoginAllowed;
                self->_payloadProxyCaptiveLoginAllowed = v28;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyType"), self->_payloadProxyType, 0, CFSTR("Manual"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyServer"), self->_payloadProxyServer, 1, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyServerPort"), self->_payloadProxyServerPort, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyUsername"), self->_payloadProxyUsername, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyPassword"), self->_payloadProxyPassword, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyPACURL"), self->_payloadProxyPACURL, 1, 0);
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyPACFallbackAllowed"), self->_payloadProxyPACFallbackAllowed, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyCaptiveLoginAllowed"), self->_payloadProxyCaptiveLoginAllowed, 0, v5);
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CEMNetworkGlobalHTTPProxyDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v22, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadProxyType, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadProxyServer, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadProxyServerPort, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSString copy](self->_payloadProxyUsername, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_payloadProxyPassword, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadProxyPACURL, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadProxyPACFallbackAllowed, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadProxyCaptiveLoginAllowed, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  return v4;
}

- (NSString)payloadProxyType
{
  return self->_payloadProxyType;
}

- (void)setPayloadProxyType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadProxyServer
{
  return self->_payloadProxyServer;
}

- (void)setPayloadProxyServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadProxyServerPort
{
  return self->_payloadProxyServerPort;
}

- (void)setPayloadProxyServerPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadProxyUsername
{
  return self->_payloadProxyUsername;
}

- (void)setPayloadProxyUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadProxyPassword
{
  return self->_payloadProxyPassword;
}

- (void)setPayloadProxyPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadProxyPACURL
{
  return self->_payloadProxyPACURL;
}

- (void)setPayloadProxyPACURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadProxyPACFallbackAllowed
{
  return self->_payloadProxyPACFallbackAllowed;
}

- (void)setPayloadProxyPACFallbackAllowed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadProxyCaptiveLoginAllowed
{
  return self->_payloadProxyCaptiveLoginAllowed;
}

- (void)setPayloadProxyCaptiveLoginAllowed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProxyCaptiveLoginAllowed, 0);
  objc_storeStrong((id *)&self->_payloadProxyPACFallbackAllowed, 0);
  objc_storeStrong((id *)&self->_payloadProxyPACURL, 0);
  objc_storeStrong((id *)&self->_payloadProxyPassword, 0);
  objc_storeStrong((id *)&self->_payloadProxyUsername, 0);
  objc_storeStrong((id *)&self->_payloadProxyServerPort, 0);
  objc_storeStrong((id *)&self->_payloadProxyServer, 0);
  objc_storeStrong((id *)&self->_payloadProxyType, 0);
}

@end
