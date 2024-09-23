@implementation CEMSecurityInformationCommand_StatusSecurityInfo

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[15];

  v6[14] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("HardwareEncryptionCaps");
  v6[1] = CFSTR("PasscodePresent");
  v6[2] = CFSTR("PasscodeCompliant");
  v6[3] = CFSTR("PasscodeCompliantWithProfiles");
  v6[4] = CFSTR("PasscodeLockGracePeriod");
  v6[5] = CFSTR("PasscodeLockGracePeriodEnforced");
  v6[6] = CFSTR("FDE_Enabled");
  v6[7] = CFSTR("FDE_HasPersonalRecoveryKey");
  v6[8] = CFSTR("FDE_HasInstitutionalRecoveryKey");
  v6[9] = CFSTR("FDE_PersonalRecoveryKeyCMS");
  v6[10] = CFSTR("FDE_PersonalRecoveryKeyDeviceKey");
  v6[11] = CFSTR("SystemIntegrityProtectionEnabled");
  v6[12] = CFSTR("FirewallSettings");
  v6[13] = CFSTR("FirmwarePasswordStatus");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithHardwareEncryptionCaps:(id)a3 withPasscodePresent:(id)a4 withPasscodeCompliant:(id)a5 withPasscodeCompliantWithProfiles:(id)a6 withPasscodeLockGracePeriod:(id)a7 withPasscodeLockGracePeriodEnforced:(id)a8 withFDEEnabled:(id)a9 withFDEHasPersonalRecoveryKey:(id)a10 withFDEHasInstitutionalRecoveryKey:(id)a11 withFDEPersonalRecoveryKeyCMS:(id)a12 withFDEPersonalRecoveryKeyDeviceKey:(id)a13 withSystemIntegrityProtectionEnabled:(id)a14 withFirewallSettings:(id)a15 withFirmwarePasswordStatus:(id)a16
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v37 = a16;
  v36 = a15;
  v19 = a14;
  v35 = a13;
  v34 = a12;
  v33 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "setStatusHardwareEncryptionCaps:", v27);

  objc_msgSend(v28, "setStatusPasscodePresent:", v26);
  objc_msgSend(v28, "setStatusPasscodeCompliant:", v25);

  objc_msgSend(v28, "setStatusPasscodeCompliantWithProfiles:", v24);
  objc_msgSend(v28, "setStatusPasscodeLockGracePeriod:", v23);

  objc_msgSend(v28, "setStatusPasscodeLockGracePeriodEnforced:", v22);
  objc_msgSend(v28, "setStatusFDEEnabled:", v21);

  objc_msgSend(v28, "setStatusFDEHasPersonalRecoveryKey:", v20);
  objc_msgSend(v28, "setStatusFDEHasInstitutionalRecoveryKey:", v33);

  objc_msgSend(v28, "setStatusFDEPersonalRecoveryKeyCMS:", v34);
  objc_msgSend(v28, "setStatusFDEPersonalRecoveryKeyDeviceKey:", v35);

  objc_msgSend(v28, "setStatusSystemIntegrityProtectionEnabled:", v19);
  objc_msgSend(v28, "setStatusFirewallSettings:", v36);

  objc_msgSend(v28, "setStatusFirmwarePasswordStatus:", v37);
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
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSNumber *v15;
  NSNumber *statusHardwareEncryptionCaps;
  NSNumber *v17;
  NSNumber *statusPasscodePresent;
  NSNumber *v19;
  NSNumber *statusPasscodeCompliant;
  NSNumber *v21;
  NSNumber *statusPasscodeCompliantWithProfiles;
  NSNumber *v23;
  NSNumber *statusPasscodeLockGracePeriod;
  NSNumber *v25;
  NSNumber *statusPasscodeLockGracePeriodEnforced;
  NSNumber *v27;
  NSNumber *statusFDEEnabled;
  NSNumber *v29;
  NSNumber *statusFDEHasPersonalRecoveryKey;
  NSNumber *v31;
  NSNumber *statusFDEHasInstitutionalRecoveryKey;
  NSData *v33;
  NSData *statusFDEPersonalRecoveryKeyCMS;
  NSString *v35;
  NSString *statusFDEPersonalRecoveryKeyDeviceKey;
  NSNumber *v37;
  NSNumber *statusSystemIntegrityProtectionEnabled;
  CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings *v39;
  CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings *statusFirewallSettings;
  CEMSecurityInformationCommand_StatusSecurityInfoFirmwarePasswordStatus *v41;
  CEMSecurityInformationCommand_StatusSecurityInfoFirmwarePasswordStatus *statusFirmwarePasswordStatus;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSecurityInformationCommand_StatusSecurityInfo allowedStatusKeys](CEMSecurityInformationCommand_StatusSecurityInfo, "allowedStatusKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_23;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v58 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v59[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v57 = 0;
    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HardwareEncryptionCaps"), 0, 0, &v57);
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v12 = v57;
    statusHardwareEncryptionCaps = self->_statusHardwareEncryptionCaps;
    self->_statusHardwareEncryptionCaps = v15;

    if (!v12)
    {
      v56 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PasscodePresent"), 0, 0, &v56);
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v12 = v56;
      statusPasscodePresent = self->_statusPasscodePresent;
      self->_statusPasscodePresent = v17;

      if (!v12)
      {
        v55 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PasscodeCompliant"), 0, 0, &v55);
        v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v12 = v55;
        statusPasscodeCompliant = self->_statusPasscodeCompliant;
        self->_statusPasscodeCompliant = v19;

        if (!v12)
        {
          v54 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PasscodeCompliantWithProfiles"), 0, 0, &v54);
          v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v12 = v54;
          statusPasscodeCompliantWithProfiles = self->_statusPasscodeCompliantWithProfiles;
          self->_statusPasscodeCompliantWithProfiles = v21;

          if (!v12)
          {
            v53 = 0;
            -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PasscodeLockGracePeriod"), 0, 0, &v53);
            v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v12 = v53;
            statusPasscodeLockGracePeriod = self->_statusPasscodeLockGracePeriod;
            self->_statusPasscodeLockGracePeriod = v23;

            if (!v12)
            {
              v52 = 0;
              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PasscodeLockGracePeriodEnforced"), 0, 0, &v52);
              v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v12 = v52;
              statusPasscodeLockGracePeriodEnforced = self->_statusPasscodeLockGracePeriodEnforced;
              self->_statusPasscodeLockGracePeriodEnforced = v25;

              if (!v12)
              {
                v51 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FDE_Enabled"), 0, 0, &v51);
                v27 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v12 = v51;
                statusFDEEnabled = self->_statusFDEEnabled;
                self->_statusFDEEnabled = v27;

                if (!v12)
                {
                  v50 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FDE_HasPersonalRecoveryKey"), 0, 0, &v50);
                  v29 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v12 = v50;
                  statusFDEHasPersonalRecoveryKey = self->_statusFDEHasPersonalRecoveryKey;
                  self->_statusFDEHasPersonalRecoveryKey = v29;

                  if (!v12)
                  {
                    v49 = 0;
                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FDE_HasInstitutionalRecoveryKey"), 0, 0, &v49);
                    v31 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v12 = v49;
                    statusFDEHasInstitutionalRecoveryKey = self->_statusFDEHasInstitutionalRecoveryKey;
                    self->_statusFDEHasInstitutionalRecoveryKey = v31;

                    if (!v12)
                    {
                      v48 = 0;
                      -[CEMPayloadBase loadDataFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadDataFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FDE_PersonalRecoveryKeyCMS"), 0, 0, &v48);
                      v33 = (NSData *)objc_claimAutoreleasedReturnValue();
                      v12 = v48;
                      statusFDEPersonalRecoveryKeyCMS = self->_statusFDEPersonalRecoveryKeyCMS;
                      self->_statusFDEPersonalRecoveryKeyCMS = v33;

                      if (!v12)
                      {
                        v47 = 0;
                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FDE_PersonalRecoveryKeyDeviceKey"), 0, 0, &v47);
                        v35 = (NSString *)objc_claimAutoreleasedReturnValue();
                        v12 = v47;
                        statusFDEPersonalRecoveryKeyDeviceKey = self->_statusFDEPersonalRecoveryKeyDeviceKey;
                        self->_statusFDEPersonalRecoveryKeyDeviceKey = v35;

                        if (!v12)
                        {
                          v46 = 0;
                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SystemIntegrityProtectionEnabled"), 0, 0, &v46);
                          v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v12 = v46;
                          statusSystemIntegrityProtectionEnabled = self->_statusSystemIntegrityProtectionEnabled;
                          self->_statusSystemIntegrityProtectionEnabled = v37;

                          if (!v12)
                          {
                            v45 = 0;
                            -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("FirewallSettings"), objc_opt_class(), 0, 0, &v45);
                            v39 = (CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings *)objc_claimAutoreleasedReturnValue();
                            v12 = v45;
                            statusFirewallSettings = self->_statusFirewallSettings;
                            self->_statusFirewallSettings = v39;

                            if (!v12)
                            {
                              v44 = 0;
                              -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("FirmwarePasswordStatus"), objc_opt_class(), 0, 0, &v44);
                              v41 = (CEMSecurityInformationCommand_StatusSecurityInfoFirmwarePasswordStatus *)objc_claimAutoreleasedReturnValue();
                              v12 = v44;
                              statusFirmwarePasswordStatus = self->_statusFirmwarePasswordStatus;
                              self->_statusFirmwarePasswordStatus = v41;

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
      }
    }
    v14 = v12 == 0;
    if (a4 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v14 = 0;
      *a4 = v12;
    }
  }

LABEL_23:
  return v14;
}

- (id)serializePayload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("HardwareEncryptionCaps"), self->_statusHardwareEncryptionCaps, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("PasscodePresent"), self->_statusPasscodePresent, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("PasscodeCompliant"), self->_statusPasscodeCompliant, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("PasscodeCompliantWithProfiles"), self->_statusPasscodeCompliantWithProfiles, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("PasscodeLockGracePeriod"), self->_statusPasscodeLockGracePeriod, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("PasscodeLockGracePeriodEnforced"), self->_statusPasscodeLockGracePeriodEnforced, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("FDE_Enabled"), self->_statusFDEEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("FDE_HasPersonalRecoveryKey"), self->_statusFDEHasPersonalRecoveryKey, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("FDE_HasInstitutionalRecoveryKey"), self->_statusFDEHasInstitutionalRecoveryKey, 0, 0);
  -[CEMPayloadBase serializeDataIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeDataIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("FDE_PersonalRecoveryKeyCMS"), self->_statusFDEPersonalRecoveryKeyCMS, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("FDE_PersonalRecoveryKeyDeviceKey"), self->_statusFDEPersonalRecoveryKeyDeviceKey, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("SystemIntegrityProtectionEnabled"), self->_statusSystemIntegrityProtectionEnabled, 0, 0);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("FirewallSettings"), self->_statusFirewallSettings, &__block_literal_global_127_1, 0, 0);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("FirmwarePasswordStatus"), self->_statusFirmwarePasswordStatus, &__block_literal_global_128_0, 0, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
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
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CEMSecurityInformationCommand_StatusSecurityInfo;
  v4 = -[CEMPayloadBase copyWithZone:](&v34, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_statusHardwareEncryptionCaps, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_statusPasscodePresent, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_statusPasscodeCompliant, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_statusPasscodeCompliantWithProfiles, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_statusPasscodeLockGracePeriod, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_statusPasscodeLockGracePeriodEnforced, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_statusFDEEnabled, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_statusFDEHasPersonalRecoveryKey, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_statusFDEHasInstitutionalRecoveryKey, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSData copy](self->_statusFDEPersonalRecoveryKeyCMS, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSString copy](self->_statusFDEPersonalRecoveryKeyDeviceKey, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSNumber copy](self->_statusSystemIntegrityProtectionEnabled, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  v29 = -[CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings copy](self->_statusFirewallSettings, "copy");
  v30 = (void *)v4[14];
  v4[14] = v29;

  v31 = -[CEMSecurityInformationCommand_StatusSecurityInfoFirmwarePasswordStatus copy](self->_statusFirmwarePasswordStatus, "copy");
  v32 = (void *)v4[15];
  v4[15] = v31;

  return v4;
}

- (NSNumber)statusHardwareEncryptionCaps
{
  return self->_statusHardwareEncryptionCaps;
}

- (void)setStatusHardwareEncryptionCaps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)statusPasscodePresent
{
  return self->_statusPasscodePresent;
}

- (void)setStatusPasscodePresent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)statusPasscodeCompliant
{
  return self->_statusPasscodeCompliant;
}

- (void)setStatusPasscodeCompliant:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)statusPasscodeCompliantWithProfiles
{
  return self->_statusPasscodeCompliantWithProfiles;
}

- (void)setStatusPasscodeCompliantWithProfiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)statusPasscodeLockGracePeriod
{
  return self->_statusPasscodeLockGracePeriod;
}

- (void)setStatusPasscodeLockGracePeriod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)statusPasscodeLockGracePeriodEnforced
{
  return self->_statusPasscodeLockGracePeriodEnforced;
}

- (void)setStatusPasscodeLockGracePeriodEnforced:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)statusFDEEnabled
{
  return self->_statusFDEEnabled;
}

- (void)setStatusFDEEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)statusFDEHasPersonalRecoveryKey
{
  return self->_statusFDEHasPersonalRecoveryKey;
}

- (void)setStatusFDEHasPersonalRecoveryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)statusFDEHasInstitutionalRecoveryKey
{
  return self->_statusFDEHasInstitutionalRecoveryKey;
}

- (void)setStatusFDEHasInstitutionalRecoveryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)statusFDEPersonalRecoveryKeyCMS
{
  return self->_statusFDEPersonalRecoveryKeyCMS;
}

- (void)setStatusFDEPersonalRecoveryKeyCMS:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)statusFDEPersonalRecoveryKeyDeviceKey
{
  return self->_statusFDEPersonalRecoveryKeyDeviceKey;
}

- (void)setStatusFDEPersonalRecoveryKeyDeviceKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)statusSystemIntegrityProtectionEnabled
{
  return self->_statusSystemIntegrityProtectionEnabled;
}

- (void)setStatusSystemIntegrityProtectionEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings)statusFirewallSettings
{
  return self->_statusFirewallSettings;
}

- (void)setStatusFirewallSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CEMSecurityInformationCommand_StatusSecurityInfoFirmwarePasswordStatus)statusFirmwarePasswordStatus
{
  return self->_statusFirmwarePasswordStatus;
}

- (void)setStatusFirmwarePasswordStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusFirmwarePasswordStatus, 0);
  objc_storeStrong((id *)&self->_statusFirewallSettings, 0);
  objc_storeStrong((id *)&self->_statusSystemIntegrityProtectionEnabled, 0);
  objc_storeStrong((id *)&self->_statusFDEPersonalRecoveryKeyDeviceKey, 0);
  objc_storeStrong((id *)&self->_statusFDEPersonalRecoveryKeyCMS, 0);
  objc_storeStrong((id *)&self->_statusFDEHasInstitutionalRecoveryKey, 0);
  objc_storeStrong((id *)&self->_statusFDEHasPersonalRecoveryKey, 0);
  objc_storeStrong((id *)&self->_statusFDEEnabled, 0);
  objc_storeStrong((id *)&self->_statusPasscodeLockGracePeriodEnforced, 0);
  objc_storeStrong((id *)&self->_statusPasscodeLockGracePeriod, 0);
  objc_storeStrong((id *)&self->_statusPasscodeCompliantWithProfiles, 0);
  objc_storeStrong((id *)&self->_statusPasscodeCompliant, 0);
  objc_storeStrong((id *)&self->_statusPasscodePresent, 0);
  objc_storeStrong((id *)&self->_statusHardwareEncryptionCaps, 0);
}

@end
