@implementation CEMNetworkCellularDeclaration_APNsItem

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Name");
  v6[1] = CFSTR("AuthenticationType");
  v6[2] = CFSTR("Username");
  v6[3] = CFSTR("Password");
  v6[4] = CFSTR("ProxyServer");
  v6[5] = CFSTR("ProxyPort");
  v6[6] = CFSTR("DefaultProtocolMask");
  v6[7] = CFSTR("AllowedProtocolMask");
  v6[8] = CFSTR("AllowedProtocolMaskInRoaming");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithName:(id)a3 withAuthenticationType:(id)a4 withUsername:(id)a5 withPassword:(id)a6 withProxyServer:(id)a7 withProxyPort:(id)a8 withDefaultProtocolMask:(id)a9 withAllowedProtocolMask:(id)a10 withAllowedProtocolMaskInRoaming:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  id v24;
  void *v25;
  const __CFString *v26;
  id v28;

  v28 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = (__CFString *)a4;
  v24 = a3;
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setPayloadName:", v24);

  if (v23)
    v26 = v23;
  else
    v26 = CFSTR("PAP");
  objc_msgSend(v25, "setPayloadAuthenticationType:", v26);

  objc_msgSend(v25, "setPayloadUsername:", v22);
  objc_msgSend(v25, "setPayloadPassword:", v21);

  objc_msgSend(v25, "setPayloadProxyServer:", v20);
  objc_msgSend(v25, "setPayloadProxyPort:", v19);

  objc_msgSend(v25, "setPayloadDefaultProtocolMask:", v18);
  objc_msgSend(v25, "setPayloadAllowedProtocolMask:", v17);

  objc_msgSend(v25, "setPayloadAllowedProtocolMaskInRoaming:", v28);
  return v25;
}

+ (id)buildRequiredOnlyWithName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadName:", v3);

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
  NSString *payloadName;
  NSString *v16;
  NSString *payloadAuthenticationType;
  NSString *v18;
  NSString *payloadUsername;
  NSString *v20;
  NSString *payloadPassword;
  NSString *v22;
  NSString *payloadProxyServer;
  NSNumber *v24;
  NSNumber *payloadProxyPort;
  NSNumber *v26;
  NSNumber *payloadDefaultProtocolMask;
  NSNumber *v28;
  NSNumber *payloadAllowedProtocolMask;
  NSNumber *v30;
  NSNumber *payloadAllowedProtocolMaskInRoaming;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkCellularDeclaration_APNsItem allowedPayloadKeys](CEMNetworkCellularDeclaration_APNsItem, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v41 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Name"), 1, 0, &v41);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v41;
  payloadName = self->_payloadName;
  self->_payloadName = v13;

  if (!v14)
  {
    v40 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthenticationType"), 0, CFSTR("PAP"), &v40);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v40;
    payloadAuthenticationType = self->_payloadAuthenticationType;
    self->_payloadAuthenticationType = v16;

    if (!v14)
    {
      v39 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Username"), 0, 0, &v39);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v39;
      payloadUsername = self->_payloadUsername;
      self->_payloadUsername = v18;

      if (!v14)
      {
        v38 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Password"), 0, 0, &v38);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v38;
        payloadPassword = self->_payloadPassword;
        self->_payloadPassword = v20;

        if (!v14)
        {
          v37 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyServer"), 0, 0, &v37);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v37;
          payloadProxyServer = self->_payloadProxyServer;
          self->_payloadProxyServer = v22;

          if (!v14)
          {
            v36 = 0;
            -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ProxyPort"), 0, 0, &v36);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v36;
            payloadProxyPort = self->_payloadProxyPort;
            self->_payloadProxyPort = v24;

            if (!v14)
            {
              v35 = 0;
              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DefaultProtocolMask"), 0, 0, &v35);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v35;
              payloadDefaultProtocolMask = self->_payloadDefaultProtocolMask;
              self->_payloadDefaultProtocolMask = v26;

              if (!v14)
              {
                v34 = 0;
                -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AllowedProtocolMask"), 0, 0, &v34);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v34;
                payloadAllowedProtocolMask = self->_payloadAllowedProtocolMask;
                self->_payloadAllowedProtocolMask = v28;

                if (!v14)
                {
                  v33 = 0;
                  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AllowedProtocolMaskInRoaming"), 0, 0, &v33);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v33;
                  payloadAllowedProtocolMaskInRoaming = self->_payloadAllowedProtocolMaskInRoaming;
                  self->_payloadAllowedProtocolMaskInRoaming = v30;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Name"), self->_payloadName, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AuthenticationType"), self->_payloadAuthenticationType, 0, CFSTR("PAP"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Username"), self->_payloadUsername, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Password"), self->_payloadPassword, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyServer"), self->_payloadProxyServer, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ProxyPort"), self->_payloadProxyPort, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DefaultProtocolMask"), self->_payloadDefaultProtocolMask, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AllowedProtocolMask"), self->_payloadAllowedProtocolMask, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AllowedProtocolMaskInRoaming"), self->_payloadAllowedProtocolMaskInRoaming, 0, 0);
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CEMNetworkCellularDeclaration_APNsItem;
  v4 = -[CEMPayloadBase copyWithZone:](&v24, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadName, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadAuthenticationType, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadUsername, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadPassword, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_payloadProxyServer, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_payloadProxyPort, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_payloadDefaultProtocolMask, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_payloadAllowedProtocolMask, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_payloadAllowedProtocolMaskInRoaming, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  return v4;
}

- (NSString)payloadName
{
  return self->_payloadName;
}

- (void)setPayloadName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadAuthenticationType
{
  return self->_payloadAuthenticationType;
}

- (void)setPayloadAuthenticationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadUsername
{
  return self->_payloadUsername;
}

- (void)setPayloadUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)payloadProxyServer
{
  return self->_payloadProxyServer;
}

- (void)setPayloadProxyServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)payloadProxyPort
{
  return self->_payloadProxyPort;
}

- (void)setPayloadProxyPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadDefaultProtocolMask
{
  return self->_payloadDefaultProtocolMask;
}

- (void)setPayloadDefaultProtocolMask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadAllowedProtocolMask
{
  return self->_payloadAllowedProtocolMask;
}

- (void)setPayloadAllowedProtocolMask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowedProtocolMaskInRoaming
{
  return self->_payloadAllowedProtocolMaskInRoaming;
}

- (void)setPayloadAllowedProtocolMaskInRoaming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowedProtocolMaskInRoaming, 0);
  objc_storeStrong((id *)&self->_payloadAllowedProtocolMask, 0);
  objc_storeStrong((id *)&self->_payloadDefaultProtocolMask, 0);
  objc_storeStrong((id *)&self->_payloadProxyPort, 0);
  objc_storeStrong((id *)&self->_payloadProxyServer, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadUsername, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationType, 0);
  objc_storeStrong((id *)&self->_payloadName, 0);
}

@end
