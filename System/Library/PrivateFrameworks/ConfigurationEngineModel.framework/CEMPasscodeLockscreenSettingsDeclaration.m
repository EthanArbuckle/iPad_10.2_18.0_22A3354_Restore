@implementation CEMPasscodeLockscreenSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.passcode.lockscreen");
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
  v6[0] = CFSTR("allowVoiceDialing");
  v6[1] = CFSTR("allowAssistantWhileLocked");
  v6[2] = CFSTR("allowLockScreenTodayView");
  v6[3] = CFSTR("allowPassbookWhileLocked");
  v6[4] = CFSTR("allowLockScreenNotificationsView");
  v6[5] = CFSTR("allowLockScreenControlCenter");
  v6[6] = CFSTR("allowLockScreenWiFiModification");
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
  v6[0] = CFSTR("allowVoiceDialing");
  v6[1] = CFSTR("allowAssistantWhileLocked");
  v6[2] = CFSTR("allowLockScreenTodayView");
  v6[3] = CFSTR("allowPassbookWhileLocked");
  v6[4] = CFSTR("allowLockScreenNotificationsView");
  v6[5] = CFSTR("allowLockScreenControlCenter");
  v6[6] = CFSTR("allowLockScreenWiFiModification");
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

+ (id)buildWithIdentifier:(id)a3 withAllowVoiceDialing:(id)a4 withAllowAssistantWhileLocked:(id)a5 withAllowLockScreenTodayView:(id)a6 withAllowPassbookWhileLocked:(id)a7 withAllowLockScreenNotificationsView:(id)a8 withAllowLockScreenControlCenter:(id)a9 withAllowLockScreenWiFiModification:(id)a10
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
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v34;

  v15 = a3;
  v34 = a10;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setDeclarationType:", CFSTR("com.apple.configuration.passcode.lockscreen"));
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
  v25 = (void *)MEMORY[0x24BDBD1C8];
  if (v21)
    v26 = v21;
  else
    v26 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v22, "setPayloadAllowVoiceDialing:", v26);

  if (v20)
    v27 = v20;
  else
    v27 = v25;
  objc_msgSend(v22, "setPayloadAllowAssistantWhileLocked:", v27);

  if (v19)
    v28 = v19;
  else
    v28 = v25;
  objc_msgSend(v22, "setPayloadAllowLockScreenTodayView:", v28);

  if (v18)
    v29 = v18;
  else
    v29 = v25;
  objc_msgSend(v22, "setPayloadAllowPassbookWhileLocked:", v29);

  if (v17)
    v30 = v17;
  else
    v30 = v25;
  objc_msgSend(v22, "setPayloadAllowLockScreenNotificationsView:", v30);

  if (v16)
    v31 = v16;
  else
    v31 = v25;
  objc_msgSend(v22, "setPayloadAllowLockScreenControlCenter:", v31);

  if (v34)
    v32 = v34;
  else
    v32 = v25;
  objc_msgSend(v22, "setPayloadAllowLockScreenWiFiModification:", v32);

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
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.passcode.lockscreen"));
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
  NSNumber *payloadAllowVoiceDialing;
  NSNumber *v16;
  NSNumber *payloadAllowAssistantWhileLocked;
  NSNumber *v18;
  NSNumber *payloadAllowLockScreenTodayView;
  NSNumber *v20;
  NSNumber *payloadAllowPassbookWhileLocked;
  NSNumber *v22;
  NSNumber *payloadAllowLockScreenNotificationsView;
  NSNumber *v24;
  NSNumber *payloadAllowLockScreenControlCenter;
  NSNumber *v26;
  NSNumber *payloadAllowLockScreenWiFiModification;
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

  +[CEMPasscodeLockscreenSettingsDeclaration allowedPayloadKeys](CEMPasscodeLockscreenSettingsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v35 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowVoiceDialing"), 0, MEMORY[0x24BDBD1C8], &v35);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v35;
  payloadAllowVoiceDialing = self->_payloadAllowVoiceDialing;
  self->_payloadAllowVoiceDialing = v13;

  if (!v14)
  {
    v34 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAssistantWhileLocked"), 0, MEMORY[0x24BDBD1C8], &v34);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v34;
    payloadAllowAssistantWhileLocked = self->_payloadAllowAssistantWhileLocked;
    self->_payloadAllowAssistantWhileLocked = v16;

    if (!v14)
    {
      v33 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowLockScreenTodayView"), 0, MEMORY[0x24BDBD1C8], &v33);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v33;
      payloadAllowLockScreenTodayView = self->_payloadAllowLockScreenTodayView;
      self->_payloadAllowLockScreenTodayView = v18;

      if (!v14)
      {
        v32 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowPassbookWhileLocked"), 0, MEMORY[0x24BDBD1C8], &v32);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v32;
        payloadAllowPassbookWhileLocked = self->_payloadAllowPassbookWhileLocked;
        self->_payloadAllowPassbookWhileLocked = v20;

        if (!v14)
        {
          v31 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowLockScreenNotificationsView"), 0, MEMORY[0x24BDBD1C8], &v31);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v31;
          payloadAllowLockScreenNotificationsView = self->_payloadAllowLockScreenNotificationsView;
          self->_payloadAllowLockScreenNotificationsView = v22;

          if (!v14)
          {
            v30 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowLockScreenControlCenter"), 0, MEMORY[0x24BDBD1C8], &v30);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v30;
            payloadAllowLockScreenControlCenter = self->_payloadAllowLockScreenControlCenter;
            self->_payloadAllowLockScreenControlCenter = v24;

            if (!v14)
            {
              v29 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowLockScreenWiFiModification"), 0, MEMORY[0x24BDBD1C8], &v29);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v29;
              payloadAllowLockScreenWiFiModification = self->_payloadAllowLockScreenWiFiModification;
              self->_payloadAllowLockScreenWiFiModification = v26;

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
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowVoiceDialing"), self->_payloadAllowVoiceDialing, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAssistantWhileLocked"), self->_payloadAllowAssistantWhileLocked, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowLockScreenTodayView"), self->_payloadAllowLockScreenTodayView, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowPassbookWhileLocked"), self->_payloadAllowPassbookWhileLocked, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowLockScreenNotificationsView"), self->_payloadAllowLockScreenNotificationsView, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowLockScreenControlCenter"), self->_payloadAllowLockScreenControlCenter, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowLockScreenWiFiModification"), self->_payloadAllowLockScreenWiFiModification, 0, v5);
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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CEMPasscodeLockscreenSettingsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v20, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowVoiceDialing, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowAssistantWhileLocked, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowLockScreenTodayView, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadAllowPassbookWhileLocked, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadAllowLockScreenNotificationsView, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadAllowLockScreenControlCenter, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadAllowLockScreenWiFiModification, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  return v4;
}

- (NSNumber)payloadAllowVoiceDialing
{
  return self->_payloadAllowVoiceDialing;
}

- (void)setPayloadAllowVoiceDialing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowAssistantWhileLocked
{
  return self->_payloadAllowAssistantWhileLocked;
}

- (void)setPayloadAllowAssistantWhileLocked:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowLockScreenTodayView
{
  return self->_payloadAllowLockScreenTodayView;
}

- (void)setPayloadAllowLockScreenTodayView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadAllowPassbookWhileLocked
{
  return self->_payloadAllowPassbookWhileLocked;
}

- (void)setPayloadAllowPassbookWhileLocked:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadAllowLockScreenNotificationsView
{
  return self->_payloadAllowLockScreenNotificationsView;
}

- (void)setPayloadAllowLockScreenNotificationsView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadAllowLockScreenControlCenter
{
  return self->_payloadAllowLockScreenControlCenter;
}

- (void)setPayloadAllowLockScreenControlCenter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadAllowLockScreenWiFiModification
{
  return self->_payloadAllowLockScreenWiFiModification;
}

- (void)setPayloadAllowLockScreenWiFiModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowLockScreenWiFiModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowLockScreenControlCenter, 0);
  objc_storeStrong((id *)&self->_payloadAllowLockScreenNotificationsView, 0);
  objc_storeStrong((id *)&self->_payloadAllowPassbookWhileLocked, 0);
  objc_storeStrong((id *)&self->_payloadAllowLockScreenTodayView, 0);
  objc_storeStrong((id *)&self->_payloadAllowAssistantWhileLocked, 0);
  objc_storeStrong((id *)&self->_payloadAllowVoiceDialing, 0);
}

@end
