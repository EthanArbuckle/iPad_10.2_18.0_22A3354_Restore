@implementation CEMSystemAirPlaySettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.airplay.settings");
}

+ (id)profileType
{
  return &stru_24C63AAC0;
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("forceAirPlayOutgoingRequestsPairingPassword");
  v6[1] = CFSTR("forceAirPlayIncomingRequestsPairingPassword");
  v6[2] = CFSTR("allowAirPlayIncomingRequests");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("forceAirPlayOutgoingRequestsPairingPassword");
  v6[1] = CFSTR("forceAirPlayIncomingRequestsPairingPassword");
  v6[2] = CFSTR("allowAirPlayIncomingRequests");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withForceAirPlayOutgoingRequestsPairingPassword:(id)a4 withForceAirPlayIncomingRequestsPairingPassword:(id)a5 withAllowAirPlayIncomingRequests:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.system.airplay.settings"));
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
  v16 = (void *)MEMORY[0x24BDBD1C0];
  if (v12)
    v17 = v12;
  else
    v17 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v13, "setPayloadForceAirPlayOutgoingRequestsPairingPassword:", v17);

  if (v11)
    v18 = v11;
  else
    v18 = v16;
  objc_msgSend(v13, "setPayloadForceAirPlayIncomingRequestsPairingPassword:", v18);

  if (v10)
    v19 = v10;
  else
    v19 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v13, "setPayloadAllowAirPlayIncomingRequests:", v19);

  objc_msgSend(v13, "updateServerHash");
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.system.airplay.settings"));
  if (v3)
  {
    objc_msgSend(v4, "setDeclarationIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeclarationIdentifier:", v6);

  }
  objc_msgSend(v4, "updateServerHash");

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
  NSNumber *v13;
  id v14;
  NSNumber *payloadForceAirPlayOutgoingRequestsPairingPassword;
  NSNumber *v16;
  NSNumber *payloadForceAirPlayIncomingRequestsPairingPassword;
  NSNumber *v18;
  NSNumber *payloadAllowAirPlayIncomingRequests;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemAirPlaySettingsDeclaration allowedPayloadKeys](CEMSystemAirPlaySettingsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("forceAirPlayOutgoingRequestsPairingPassword"), 0, MEMORY[0x24BDBD1C0], &v23);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadForceAirPlayOutgoingRequestsPairingPassword = self->_payloadForceAirPlayOutgoingRequestsPairingPassword;
  self->_payloadForceAirPlayOutgoingRequestsPairingPassword = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("forceAirPlayIncomingRequestsPairingPassword"), 0, MEMORY[0x24BDBD1C0], &v22);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadForceAirPlayIncomingRequestsPairingPassword = self->_payloadForceAirPlayIncomingRequestsPairingPassword;
    self->_payloadForceAirPlayIncomingRequestsPairingPassword = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAirPlayIncomingRequests"), 0, MEMORY[0x24BDBD1C8], &v21);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadAllowAirPlayIncomingRequests = self->_payloadAllowAirPlayIncomingRequests;
      self->_payloadAllowAirPlayIncomingRequests = v18;

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
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("forceAirPlayOutgoingRequestsPairingPassword"), self->_payloadForceAirPlayOutgoingRequestsPairingPassword, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("forceAirPlayIncomingRequestsPairingPassword"), self->_payloadForceAirPlayIncomingRequestsPairingPassword, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAirPlayIncomingRequests"), self->_payloadAllowAirPlayIncomingRequests, 0, MEMORY[0x24BDBD1C8]);
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEMSystemAirPlaySettingsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadForceAirPlayOutgoingRequestsPairingPassword, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadForceAirPlayIncomingRequestsPairingPassword, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowAirPlayIncomingRequests, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSNumber)payloadForceAirPlayOutgoingRequestsPairingPassword
{
  return self->_payloadForceAirPlayOutgoingRequestsPairingPassword;
}

- (void)setPayloadForceAirPlayOutgoingRequestsPairingPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadForceAirPlayIncomingRequestsPairingPassword
{
  return self->_payloadForceAirPlayIncomingRequestsPairingPassword;
}

- (void)setPayloadForceAirPlayIncomingRequestsPairingPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowAirPlayIncomingRequests
{
  return self->_payloadAllowAirPlayIncomingRequests;
}

- (void)setPayloadAllowAirPlayIncomingRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowAirPlayIncomingRequests, 0);
  objc_storeStrong((id *)&self->_payloadForceAirPlayIncomingRequestsPairingPassword, 0);
  objc_storeStrong((id *)&self->_payloadForceAirPlayOutgoingRequestsPairingPassword, 0);
}

@end
