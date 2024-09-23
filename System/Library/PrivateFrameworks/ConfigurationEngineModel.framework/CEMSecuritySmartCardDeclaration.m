@implementation CEMSecuritySmartCardDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.security.smartcard");
}

+ (id)profileType
{
  return CFSTR("com.apple.security.smartcard");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("UserPairing");
  v6[1] = CFSTR("allowSmartCard");
  v6[2] = CFSTR("checkCertificateTrust");
  v6[3] = CFSTR("oneCardPerUser");
  v6[4] = CFSTR("tokenRemovalAction");
  v6[5] = CFSTR("enforceSmartCard");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
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

+ (id)buildWithIdentifier:(id)a3 withUserPairing:(id)a4 withAllowSmartCard:(id)a5 withCheckCertificateTrust:(id)a6 withOneCardPerUser:(id)a7 withTokenRemovalAction:(id)a8 withEnforceSmartCard:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;

  v14 = a3;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setDeclarationType:", CFSTR("com.apple.configuration.security.smartcard"));
  if (v14)
  {
    objc_msgSend(v21, "setDeclarationIdentifier:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDeclarationIdentifier:", v23);

  }
  v24 = (void *)MEMORY[0x24BDBD1C8];
  if (v20)
    v25 = v20;
  else
    v25 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v21, "setPayloadUserPairing:", v25);

  if (v19)
    v26 = v19;
  else
    v26 = v24;
  objc_msgSend(v21, "setPayloadAllowSmartCard:", v26);

  if (v18)
    v27 = v18;
  else
    v27 = &unk_24C69CE48;
  objc_msgSend(v21, "setPayloadCheckCertificateTrust:", v27);

  v28 = (void *)MEMORY[0x24BDBD1C0];
  if (v17)
    v29 = v17;
  else
    v29 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v21, "setPayloadOneCardPerUser:", v29);

  if (v16)
    v30 = v16;
  else
    v30 = &unk_24C69CE48;
  objc_msgSend(v21, "setPayloadTokenRemovalAction:", v30);

  if (v15)
    v31 = v15;
  else
    v31 = v28;
  objc_msgSend(v21, "setPayloadEnforceSmartCard:", v31);

  objc_msgSend(v21, "updateServerHash");
  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.security.smartcard"));
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
  NSNumber *payloadUserPairing;
  NSNumber *v16;
  NSNumber *payloadAllowSmartCard;
  NSNumber *v18;
  NSNumber *payloadCheckCertificateTrust;
  NSNumber *v20;
  NSNumber *payloadOneCardPerUser;
  NSNumber *v22;
  NSNumber *payloadTokenRemovalAction;
  NSNumber *v24;
  NSNumber *payloadEnforceSmartCard;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSecuritySmartCardDeclaration allowedPayloadKeys](CEMSecuritySmartCardDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v32 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UserPairing"), 0, MEMORY[0x24BDBD1C8], &v32);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  payloadUserPairing = self->_payloadUserPairing;
  self->_payloadUserPairing = v13;

  if (!v14)
  {
    v31 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowSmartCard"), 0, MEMORY[0x24BDBD1C8], &v31);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    payloadAllowSmartCard = self->_payloadAllowSmartCard;
    self->_payloadAllowSmartCard = v16;

    if (!v14)
    {
      v30 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("checkCertificateTrust"), 0, &unk_24C69CE48, &v30);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v30;
      payloadCheckCertificateTrust = self->_payloadCheckCertificateTrust;
      self->_payloadCheckCertificateTrust = v18;

      if (!v14)
      {
        v29 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("oneCardPerUser"), 0, MEMORY[0x24BDBD1C0], &v29);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v29;
        payloadOneCardPerUser = self->_payloadOneCardPerUser;
        self->_payloadOneCardPerUser = v20;

        if (!v14)
        {
          v28 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("tokenRemovalAction"), 0, &unk_24C69CE48, &v28);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v28;
          payloadTokenRemovalAction = self->_payloadTokenRemovalAction;
          self->_payloadTokenRemovalAction = v22;

          if (!v14)
          {
            v27 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("enforceSmartCard"), 0, MEMORY[0x24BDBD1C0], &v27);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v27;
            payloadEnforceSmartCard = self->_payloadEnforceSmartCard;
            self->_payloadEnforceSmartCard = v24;

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
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("UserPairing"), self->_payloadUserPairing, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowSmartCard"), self->_payloadAllowSmartCard, 0, v5);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("checkCertificateTrust"), self->_payloadCheckCertificateTrust, 0, &unk_24C69CE48);
  v6 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("oneCardPerUser"), self->_payloadOneCardPerUser, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("tokenRemovalAction"), self->_payloadTokenRemovalAction, 0, &unk_24C69CE48);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("enforceSmartCard"), self->_payloadEnforceSmartCard, 0, v6);
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CEMSecuritySmartCardDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadUserPairing, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowSmartCard, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadCheckCertificateTrust, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadOneCardPerUser, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadTokenRemovalAction, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadEnforceSmartCard, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSNumber)payloadUserPairing
{
  return self->_payloadUserPairing;
}

- (void)setPayloadUserPairing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowSmartCard
{
  return self->_payloadAllowSmartCard;
}

- (void)setPayloadAllowSmartCard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadCheckCertificateTrust
{
  return self->_payloadCheckCertificateTrust;
}

- (void)setPayloadCheckCertificateTrust:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadOneCardPerUser
{
  return self->_payloadOneCardPerUser;
}

- (void)setPayloadOneCardPerUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadTokenRemovalAction
{
  return self->_payloadTokenRemovalAction;
}

- (void)setPayloadTokenRemovalAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadEnforceSmartCard
{
  return self->_payloadEnforceSmartCard;
}

- (void)setPayloadEnforceSmartCard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEnforceSmartCard, 0);
  objc_storeStrong((id *)&self->_payloadTokenRemovalAction, 0);
  objc_storeStrong((id *)&self->_payloadOneCardPerUser, 0);
  objc_storeStrong((id *)&self->_payloadCheckCertificateTrust, 0);
  objc_storeStrong((id *)&self->_payloadAllowSmartCard, 0);
  objc_storeStrong((id *)&self->_payloadUserPairing, 0);
}

@end
