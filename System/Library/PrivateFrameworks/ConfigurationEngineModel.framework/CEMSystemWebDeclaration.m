@implementation CEMSystemWebDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.web");
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
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("forceLimitAdTracking");
  v6[1] = CFSTR("safariAllowAutoFill");
  v6[2] = CFSTR("safariForceFraudWarning");
  v6[3] = CFSTR("safariAllowJavaScript");
  v6[4] = CFSTR("safariAllowPopups");
  v6[5] = CFSTR("safariAcceptCookies");
  v6[6] = CFSTR("forceAuthenticationBeforeAutoFill");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
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
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("forceLimitAdTracking");
  v6[1] = CFSTR("safariAllowAutoFill");
  v6[2] = CFSTR("safariForceFraudWarning");
  v6[3] = CFSTR("safariAllowJavaScript");
  v6[4] = CFSTR("safariAllowPopups");
  v6[5] = CFSTR("safariAcceptCookies");
  v6[6] = CFSTR("forceAuthenticationBeforeAutoFill");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
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
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withForceLimitAdTracking:(id)a4 withSafariAllowAutoFill:(id)a5 withSafariForceFraudWarning:(id)a6 withSafariAllowJavaScript:(id)a7 withSafariAllowPopups:(id)a8 withSafariAcceptCookies:(id)a9 withForceAuthenticationBeforeAutoFill:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v35;

  v15 = a3;
  v35 = a10;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setDeclarationType:", CFSTR("com.apple.configuration.system.web"));
  if (v15)
  {
    objc_msgSend(v22, "setDeclarationIdentifier:", v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDeclarationIdentifier:", v24);

  }
  v25 = (void *)MEMORY[0x24BDBD1C0];
  if (v21)
    v26 = v21;
  else
    v26 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v22, "setPayloadForceLimitAdTracking:", v26);

  v27 = (void *)MEMORY[0x24BDBD1C8];
  if (v20)
    v28 = v20;
  else
    v28 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v22, "setPayloadSafariAllowAutoFill:", v28);

  if (v19)
    v29 = v19;
  else
    v29 = v25;
  objc_msgSend(v22, "setPayloadSafariForceFraudWarning:", v29);

  if (v18)
    v30 = v18;
  else
    v30 = v27;
  objc_msgSend(v22, "setPayloadSafariAllowJavaScript:", v30);

  if (v17)
    v31 = v17;
  else
    v31 = v27;
  objc_msgSend(v22, "setPayloadSafariAllowPopups:", v31);

  if (v16)
    v32 = v16;
  else
    v32 = &unk_24C69DA28;
  objc_msgSend(v22, "setPayloadSafariAcceptCookies:", v32);

  if (v35)
    v33 = v35;
  else
    v33 = v25;
  objc_msgSend(v22, "setPayloadForceAuthenticationBeforeAutoFill:", v33);

  objc_msgSend(v22, "updateServerHash");
  return v22;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.system.web"));
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
  NSNumber *payloadForceLimitAdTracking;
  NSNumber *v16;
  NSNumber *payloadSafariAllowAutoFill;
  NSNumber *v18;
  NSNumber *payloadSafariForceFraudWarning;
  NSNumber *v20;
  NSNumber *payloadSafariAllowJavaScript;
  NSNumber *v22;
  NSNumber *payloadSafariAllowPopups;
  NSNumber *v24;
  NSNumber *payloadSafariAcceptCookies;
  NSNumber *v26;
  NSNumber *payloadForceAuthenticationBeforeAutoFill;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemWebDeclaration allowedPayloadKeys](CEMSystemWebDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v35 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("forceLimitAdTracking"), 0, MEMORY[0x24BDBD1C0], &v35);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v35;
  payloadForceLimitAdTracking = self->_payloadForceLimitAdTracking;
  self->_payloadForceLimitAdTracking = v13;

  if (!v14)
  {
    v34 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("safariAllowAutoFill"), 0, MEMORY[0x24BDBD1C8], &v34);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v34;
    payloadSafariAllowAutoFill = self->_payloadSafariAllowAutoFill;
    self->_payloadSafariAllowAutoFill = v16;

    if (!v14)
    {
      v33 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("safariForceFraudWarning"), 0, MEMORY[0x24BDBD1C0], &v33);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v33;
      payloadSafariForceFraudWarning = self->_payloadSafariForceFraudWarning;
      self->_payloadSafariForceFraudWarning = v18;

      if (!v14)
      {
        v32 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("safariAllowJavaScript"), 0, MEMORY[0x24BDBD1C8], &v32);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v32;
        payloadSafariAllowJavaScript = self->_payloadSafariAllowJavaScript;
        self->_payloadSafariAllowJavaScript = v20;

        if (!v14)
        {
          v31 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("safariAllowPopups"), 0, MEMORY[0x24BDBD1C8], &v31);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v31;
          payloadSafariAllowPopups = self->_payloadSafariAllowPopups;
          self->_payloadSafariAllowPopups = v22;

          if (!v14)
          {
            v30 = 0;
            -[CEMPayloadBase loadFloatFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadFloatFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("safariAcceptCookies"), 0, &unk_24C69DA28, &v30);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v30;
            payloadSafariAcceptCookies = self->_payloadSafariAcceptCookies;
            self->_payloadSafariAcceptCookies = v24;

            if (!v14)
            {
              v29 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("forceAuthenticationBeforeAutoFill"), 0, MEMORY[0x24BDBD1C0], &v29);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v29;
              payloadForceAuthenticationBeforeAutoFill = self->_payloadForceAuthenticationBeforeAutoFill;
              self->_payloadForceAuthenticationBeforeAutoFill = v26;

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
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("forceLimitAdTracking"), self->_payloadForceLimitAdTracking, 0, MEMORY[0x24BDBD1C0]);
  v6 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("safariAllowAutoFill"), self->_payloadSafariAllowAutoFill, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("safariForceFraudWarning"), self->_payloadSafariForceFraudWarning, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("safariAllowJavaScript"), self->_payloadSafariAllowJavaScript, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("safariAllowPopups"), self->_payloadSafariAllowPopups, 0, v6);
  -[CEMPayloadBase serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeFloatIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("safariAcceptCookies"), self->_payloadSafariAcceptCookies, 0, &unk_24C69DA28);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("forceAuthenticationBeforeAutoFill"), self->_payloadForceAuthenticationBeforeAutoFill, 0, v5);
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
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CEMSystemWebDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v20, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadForceLimitAdTracking, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadSafariAllowAutoFill, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadSafariForceFraudWarning, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadSafariAllowJavaScript, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadSafariAllowPopups, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadSafariAcceptCookies, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadForceAuthenticationBeforeAutoFill, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  return v4;
}

- (NSNumber)payloadForceLimitAdTracking
{
  return self->_payloadForceLimitAdTracking;
}

- (void)setPayloadForceLimitAdTracking:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadSafariAllowAutoFill
{
  return self->_payloadSafariAllowAutoFill;
}

- (void)setPayloadSafariAllowAutoFill:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadSafariForceFraudWarning
{
  return self->_payloadSafariForceFraudWarning;
}

- (void)setPayloadSafariForceFraudWarning:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadSafariAllowJavaScript
{
  return self->_payloadSafariAllowJavaScript;
}

- (void)setPayloadSafariAllowJavaScript:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadSafariAllowPopups
{
  return self->_payloadSafariAllowPopups;
}

- (void)setPayloadSafariAllowPopups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadSafariAcceptCookies
{
  return self->_payloadSafariAcceptCookies;
}

- (void)setPayloadSafariAcceptCookies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadForceAuthenticationBeforeAutoFill
{
  return self->_payloadForceAuthenticationBeforeAutoFill;
}

- (void)setPayloadForceAuthenticationBeforeAutoFill:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadForceAuthenticationBeforeAutoFill, 0);
  objc_storeStrong((id *)&self->_payloadSafariAcceptCookies, 0);
  objc_storeStrong((id *)&self->_payloadSafariAllowPopups, 0);
  objc_storeStrong((id *)&self->_payloadSafariAllowJavaScript, 0);
  objc_storeStrong((id *)&self->_payloadSafariForceFraudWarning, 0);
  objc_storeStrong((id *)&self->_payloadSafariAllowAutoFill, 0);
  objc_storeStrong((id *)&self->_payloadForceLimitAdTracking, 0);
}

@end
