@implementation CEMSystemNotificationsDeclaration_NotificationSettingsItem

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[12];

  v6[11] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("BundleIdentifier");
  v6[1] = CFSTR("NotificationsEnabled");
  v6[2] = CFSTR("ShowInNotificationCenter");
  v6[3] = CFSTR("ShowInLockScreen");
  v6[4] = CFSTR("AlertType");
  v6[5] = CFSTR("BadgesEnabled");
  v6[6] = CFSTR("SoundsEnabled");
  v6[7] = CFSTR("ShowInCarPlay");
  v6[8] = CFSTR("EmergencyEnabled");
  v6[9] = CFSTR("CriticalAlertEnabled");
  v6[10] = CFSTR("GroupingType");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithBundleIdentifier:(id)a3 withNotificationsEnabled:(id)a4 withShowInNotificationCenter:(id)a5 withShowInLockScreen:(id)a6 withAlertType:(id)a7 withBadgesEnabled:(id)a8 withSoundsEnabled:(id)a9 withShowInCarPlay:(id)a10 withEmergencyEnabled:(id)a11 withCriticalAlertEnabled:(id)a12 withGroupingType:(id)a13
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
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v41;
  id v42;
  id v43;

  v43 = a13;
  v42 = a12;
  v41 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setPayloadBundleIdentifier:", v25);

  v27 = (void *)MEMORY[0x24BDBD1C8];
  if (v24)
    v28 = v24;
  else
    v28 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v26, "setPayloadNotificationsEnabled:", v28, a3);

  if (v23)
    v29 = v23;
  else
    v29 = v27;
  objc_msgSend(v26, "setPayloadShowInNotificationCenter:", v29);

  if (v22)
    v30 = v22;
  else
    v30 = v27;
  objc_msgSend(v26, "setPayloadShowInLockScreen:", v30);

  if (v21)
    v31 = v21;
  else
    v31 = &unk_24C69CE78;
  objc_msgSend(v26, "setPayloadAlertType:", v31);

  if (v20)
    v32 = v20;
  else
    v32 = v27;
  objc_msgSend(v26, "setPayloadBadgesEnabled:", v32);

  if (v19)
    v33 = v19;
  else
    v33 = v27;
  objc_msgSend(v26, "setPayloadSoundsEnabled:", v33);

  if (v18)
    v34 = v18;
  else
    v34 = v27;
  objc_msgSend(v26, "setPayloadShowInCarPlay:", v34);

  v35 = (void *)MEMORY[0x24BDBD1C0];
  if (v41)
    v36 = v41;
  else
    v36 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v26, "setPayloadEmergencyEnabled:", v36);

  if (v42)
    v37 = v42;
  else
    v37 = v35;
  objc_msgSend(v26, "setPayloadCriticalAlertEnabled:", v37);

  if (v43)
    v38 = v43;
  else
    v38 = &unk_24C69CE90;
  objc_msgSend(v26, "setPayloadGroupingType:", v38);

  return v26;
}

+ (id)buildRequiredOnlyWithBundleIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadBundleIdentifier:", v3);

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
  NSString *payloadBundleIdentifier;
  NSNumber *v16;
  NSNumber *payloadNotificationsEnabled;
  NSNumber *v18;
  NSNumber *payloadShowInNotificationCenter;
  NSNumber *v20;
  NSNumber *payloadShowInLockScreen;
  NSNumber *v22;
  NSNumber *payloadAlertType;
  NSNumber *v24;
  NSNumber *payloadBadgesEnabled;
  NSNumber *v26;
  NSNumber *payloadSoundsEnabled;
  NSNumber *v28;
  NSNumber *payloadShowInCarPlay;
  NSNumber *v30;
  NSNumber *payloadEmergencyEnabled;
  NSNumber *v32;
  NSNumber *payloadCriticalAlertEnabled;
  NSNumber *v34;
  NSNumber *payloadGroupingType;
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

  +[CEMSystemNotificationsDeclaration_NotificationSettingsItem allowedPayloadKeys](CEMSystemNotificationsDeclaration_NotificationSettingsItem, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v47 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BundleIdentifier"), 1, 0, &v47);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v47;
  payloadBundleIdentifier = self->_payloadBundleIdentifier;
  self->_payloadBundleIdentifier = v13;

  if (!v14)
  {
    v46 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("NotificationsEnabled"), 0, MEMORY[0x24BDBD1C8], &v46);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v46;
    payloadNotificationsEnabled = self->_payloadNotificationsEnabled;
    self->_payloadNotificationsEnabled = v16;

    if (!v14)
    {
      v45 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ShowInNotificationCenter"), 0, MEMORY[0x24BDBD1C8], &v45);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v45;
      payloadShowInNotificationCenter = self->_payloadShowInNotificationCenter;
      self->_payloadShowInNotificationCenter = v18;

      if (!v14)
      {
        v44 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ShowInLockScreen"), 0, MEMORY[0x24BDBD1C8], &v44);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v44;
        payloadShowInLockScreen = self->_payloadShowInLockScreen;
        self->_payloadShowInLockScreen = v20;

        if (!v14)
        {
          v43 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AlertType"), 0, &unk_24C69CE78, &v43);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v43;
          payloadAlertType = self->_payloadAlertType;
          self->_payloadAlertType = v22;

          if (!v14)
          {
            v42 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BadgesEnabled"), 0, MEMORY[0x24BDBD1C8], &v42);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v42;
            payloadBadgesEnabled = self->_payloadBadgesEnabled;
            self->_payloadBadgesEnabled = v24;

            if (!v14)
            {
              v41 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SoundsEnabled"), 0, MEMORY[0x24BDBD1C8], &v41);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v41;
              payloadSoundsEnabled = self->_payloadSoundsEnabled;
              self->_payloadSoundsEnabled = v26;

              if (!v14)
              {
                v40 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ShowInCarPlay"), 0, MEMORY[0x24BDBD1C8], &v40);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v40;
                payloadShowInCarPlay = self->_payloadShowInCarPlay;
                self->_payloadShowInCarPlay = v28;

                if (!v14)
                {
                  v39 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EmergencyEnabled"), 0, MEMORY[0x24BDBD1C0], &v39);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v39;
                  payloadEmergencyEnabled = self->_payloadEmergencyEnabled;
                  self->_payloadEmergencyEnabled = v30;

                  if (!v14)
                  {
                    v38 = 0;
                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CriticalAlertEnabled"), 0, MEMORY[0x24BDBD1C0], &v38);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v38;
                    payloadCriticalAlertEnabled = self->_payloadCriticalAlertEnabled;
                    self->_payloadCriticalAlertEnabled = v32;

                    if (!v14)
                    {
                      v37 = 0;
                      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("GroupingType"), 0, &unk_24C69CE90, &v37);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v37;
                      payloadGroupingType = self->_payloadGroupingType;
                      self->_payloadGroupingType = v34;

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
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("BundleIdentifier"), self->_payloadBundleIdentifier, 1, 0);
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("NotificationsEnabled"), self->_payloadNotificationsEnabled, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ShowInNotificationCenter"), self->_payloadShowInNotificationCenter, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ShowInLockScreen"), self->_payloadShowInLockScreen, 0, v5);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AlertType"), self->_payloadAlertType, 0, &unk_24C69CE78);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("BadgesEnabled"), self->_payloadBadgesEnabled, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("SoundsEnabled"), self->_payloadSoundsEnabled, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ShowInCarPlay"), self->_payloadShowInCarPlay, 0, v5);
  v6 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EmergencyEnabled"), self->_payloadEmergencyEnabled, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CriticalAlertEnabled"), self->_payloadCriticalAlertEnabled, 0, v6);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("GroupingType"), self->_payloadGroupingType, 0, &unk_24C69CE90);
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
  v28.super_class = (Class)CEMSystemNotificationsDeclaration_NotificationSettingsItem;
  v4 = -[CEMPayloadBase copyWithZone:](&v28, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadBundleIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadNotificationsEnabled, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadShowInNotificationCenter, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadShowInLockScreen, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadAlertType, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_payloadBadgesEnabled, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_payloadSoundsEnabled, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_payloadShowInCarPlay, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_payloadEmergencyEnabled, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_payloadCriticalAlertEnabled, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSNumber copy](self->_payloadGroupingType, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  return v4;
}

- (NSString)payloadBundleIdentifier
{
  return self->_payloadBundleIdentifier;
}

- (void)setPayloadBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadNotificationsEnabled
{
  return self->_payloadNotificationsEnabled;
}

- (void)setPayloadNotificationsEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadShowInNotificationCenter
{
  return self->_payloadShowInNotificationCenter;
}

- (void)setPayloadShowInNotificationCenter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadShowInLockScreen
{
  return self->_payloadShowInLockScreen;
}

- (void)setPayloadShowInLockScreen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadAlertType
{
  return self->_payloadAlertType;
}

- (void)setPayloadAlertType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)payloadBadgesEnabled
{
  return self->_payloadBadgesEnabled;
}

- (void)setPayloadBadgesEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadSoundsEnabled
{
  return self->_payloadSoundsEnabled;
}

- (void)setPayloadSoundsEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadShowInCarPlay
{
  return self->_payloadShowInCarPlay;
}

- (void)setPayloadShowInCarPlay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadEmergencyEnabled
{
  return self->_payloadEmergencyEnabled;
}

- (void)setPayloadEmergencyEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadCriticalAlertEnabled
{
  return self->_payloadCriticalAlertEnabled;
}

- (void)setPayloadCriticalAlertEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadGroupingType
{
  return self->_payloadGroupingType;
}

- (void)setPayloadGroupingType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadGroupingType, 0);
  objc_storeStrong((id *)&self->_payloadCriticalAlertEnabled, 0);
  objc_storeStrong((id *)&self->_payloadEmergencyEnabled, 0);
  objc_storeStrong((id *)&self->_payloadShowInCarPlay, 0);
  objc_storeStrong((id *)&self->_payloadSoundsEnabled, 0);
  objc_storeStrong((id *)&self->_payloadBadgesEnabled, 0);
  objc_storeStrong((id *)&self->_payloadAlertType, 0);
  objc_storeStrong((id *)&self->_payloadShowInLockScreen, 0);
  objc_storeStrong((id *)&self->_payloadShowInNotificationCenter, 0);
  objc_storeStrong((id *)&self->_payloadNotificationsEnabled, 0);
  objc_storeStrong((id *)&self->_payloadBundleIdentifier, 0);
}

@end
