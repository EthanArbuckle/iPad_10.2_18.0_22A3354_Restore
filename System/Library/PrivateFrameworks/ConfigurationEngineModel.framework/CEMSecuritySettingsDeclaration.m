@implementation CEMSecuritySettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.security.settings");
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
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowUntrustedTLSPrompt");
  v6[1] = CFSTR("allowOTAPKIUpdates");
  v6[2] = CFSTR("forceEncryptedBackup");
  v6[3] = CFSTR("allowEraseContentAndSettings");
  v6[4] = CFSTR("allowEnablingRestrictions");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
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
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowUntrustedTLSPrompt");
  v6[1] = CFSTR("allowOTAPKIUpdates");
  v6[2] = CFSTR("forceEncryptedBackup");
  v6[3] = CFSTR("allowEraseContentAndSettings");
  v6[4] = CFSTR("allowEnablingRestrictions");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
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

+ (id)buildWithIdentifier:(id)a3 withAllowUntrustedTLSPrompt:(id)a4 withAllowOTAPKIUpdates:(id)a5 withForceEncryptedBackup:(id)a6 withAllowEraseContentAndSettings:(id)a7 withAllowEnablingRestrictions:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v13 = a3;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setDeclarationType:", CFSTR("com.apple.configuration.security.settings"));
  if (v13)
  {
    objc_msgSend(v19, "setDeclarationIdentifier:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDeclarationIdentifier:", v21);

  }
  v22 = (void *)MEMORY[0x24BDBD1C8];
  if (v18)
    v23 = v18;
  else
    v23 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v19, "setPayloadAllowUntrustedTLSPrompt:", v23);

  if (v17)
    v24 = v17;
  else
    v24 = v22;
  objc_msgSend(v19, "setPayloadAllowOTAPKIUpdates:", v24);

  if (v16)
    v25 = v16;
  else
    v25 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v19, "setPayloadForceEncryptedBackup:", v25);

  if (v15)
    v26 = v15;
  else
    v26 = v22;
  objc_msgSend(v19, "setPayloadAllowEraseContentAndSettings:", v26);

  if (v14)
    v27 = v14;
  else
    v27 = v22;
  objc_msgSend(v19, "setPayloadAllowEnablingRestrictions:", v27);

  objc_msgSend(v19, "updateServerHash");
  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.security.settings"));
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
  NSNumber *payloadAllowUntrustedTLSPrompt;
  NSNumber *v16;
  NSNumber *payloadAllowOTAPKIUpdates;
  NSNumber *v18;
  NSNumber *payloadForceEncryptedBackup;
  NSNumber *v20;
  NSNumber *payloadAllowEraseContentAndSettings;
  NSNumber *v22;
  NSNumber *payloadAllowEnablingRestrictions;
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

  +[CEMSecuritySettingsDeclaration allowedPayloadKeys](CEMSecuritySettingsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowUntrustedTLSPrompt"), 0, MEMORY[0x24BDBD1C8], &v29);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadAllowUntrustedTLSPrompt = self->_payloadAllowUntrustedTLSPrompt;
  self->_payloadAllowUntrustedTLSPrompt = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowOTAPKIUpdates"), 0, MEMORY[0x24BDBD1C8], &v28);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadAllowOTAPKIUpdates = self->_payloadAllowOTAPKIUpdates;
    self->_payloadAllowOTAPKIUpdates = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("forceEncryptedBackup"), 0, MEMORY[0x24BDBD1C0], &v27);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadForceEncryptedBackup = self->_payloadForceEncryptedBackup;
      self->_payloadForceEncryptedBackup = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowEraseContentAndSettings"), 0, MEMORY[0x24BDBD1C8], &v26);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadAllowEraseContentAndSettings = self->_payloadAllowEraseContentAndSettings;
        self->_payloadAllowEraseContentAndSettings = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowEnablingRestrictions"), 0, MEMORY[0x24BDBD1C8], &v25);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadAllowEnablingRestrictions = self->_payloadAllowEnablingRestrictions;
          self->_payloadAllowEnablingRestrictions = v22;

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
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowUntrustedTLSPrompt"), self->_payloadAllowUntrustedTLSPrompt, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowOTAPKIUpdates"), self->_payloadAllowOTAPKIUpdates, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("forceEncryptedBackup"), self->_payloadForceEncryptedBackup, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowEraseContentAndSettings"), self->_payloadAllowEraseContentAndSettings, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowEnablingRestrictions"), self->_payloadAllowEnablingRestrictions, 0, v5);
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMSecuritySettingsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowUntrustedTLSPrompt, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowOTAPKIUpdates, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadForceEncryptedBackup, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadAllowEraseContentAndSettings, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadAllowEnablingRestrictions, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  return v4;
}

- (NSNumber)payloadAllowUntrustedTLSPrompt
{
  return self->_payloadAllowUntrustedTLSPrompt;
}

- (void)setPayloadAllowUntrustedTLSPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowOTAPKIUpdates
{
  return self->_payloadAllowOTAPKIUpdates;
}

- (void)setPayloadAllowOTAPKIUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadForceEncryptedBackup
{
  return self->_payloadForceEncryptedBackup;
}

- (void)setPayloadForceEncryptedBackup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadAllowEraseContentAndSettings
{
  return self->_payloadAllowEraseContentAndSettings;
}

- (void)setPayloadAllowEraseContentAndSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadAllowEnablingRestrictions
{
  return self->_payloadAllowEnablingRestrictions;
}

- (void)setPayloadAllowEnablingRestrictions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowEnablingRestrictions, 0);
  objc_storeStrong((id *)&self->_payloadAllowEraseContentAndSettings, 0);
  objc_storeStrong((id *)&self->_payloadForceEncryptedBackup, 0);
  objc_storeStrong((id *)&self->_payloadAllowOTAPKIUpdates, 0);
  objc_storeStrong((id *)&self->_payloadAllowUntrustedTLSPrompt, 0);
}

@end
