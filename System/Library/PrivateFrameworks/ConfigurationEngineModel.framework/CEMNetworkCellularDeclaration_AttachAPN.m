@implementation CEMNetworkCellularDeclaration_AttachAPN

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Name");
  v6[1] = CFSTR("AuthenticationType");
  v6[2] = CFSTR("Username");
  v6[3] = CFSTR("Password");
  v6[4] = CFSTR("AllowedProtocolMask");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithName:(id)a3 withAuthenticationType:(id)a4 withUsername:(id)a5 withPassword:(id)a6 withAllowedProtocolMask:(id)a7
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  id v15;
  void *v16;
  const __CFString *v17;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = (__CFString *)a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setPayloadName:", v15);

  if (v14)
    v17 = v14;
  else
    v17 = CFSTR("PAP");
  objc_msgSend(v16, "setPayloadAuthenticationType:", v17);

  objc_msgSend(v16, "setPayloadUsername:", v13);
  objc_msgSend(v16, "setPayloadPassword:", v12);

  objc_msgSend(v16, "setPayloadAllowedProtocolMask:", v11);
  return v16;
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
  NSNumber *v22;
  NSNumber *payloadAllowedProtocolMask;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkCellularDeclaration_AttachAPN allowedPayloadKeys](CEMNetworkCellularDeclaration_AttachAPN, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Name"), 1, 0, &v29);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadName = self->_payloadName;
  self->_payloadName = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AuthenticationType"), 0, CFSTR("PAP"), &v28);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadAuthenticationType = self->_payloadAuthenticationType;
    self->_payloadAuthenticationType = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Username"), 0, 0, &v27);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadUsername = self->_payloadUsername;
      self->_payloadUsername = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Password"), 0, 0, &v26);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadPassword = self->_payloadPassword;
        self->_payloadPassword = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AllowedProtocolMask"), 0, 0, &v25);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadAllowedProtocolMask = self->_payloadAllowedProtocolMask;
          self->_payloadAllowedProtocolMask = v22;

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
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AllowedProtocolMask"), self->_payloadAllowedProtocolMask, 0, 0);
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMNetworkCellularDeclaration_AttachAPN;
  v4 = -[CEMPayloadBase copyWithZone:](&v16, sel_copyWithZone_, a3);
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

  v13 = -[NSNumber copy](self->_payloadAllowedProtocolMask, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

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

- (NSNumber)payloadAllowedProtocolMask
{
  return self->_payloadAllowedProtocolMask;
}

- (void)setPayloadAllowedProtocolMask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowedProtocolMask, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadUsername, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationType, 0);
  objc_storeStrong((id *)&self->_payloadName, 0);
}

@end
