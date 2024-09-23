@implementation CEMSystemEnergySaverDeclaration_PowerSettings

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Display Sleep Timer");
  v6[1] = CFSTR("Disk Sleep Timer");
  v6[2] = CFSTR("System Sleep Timer");
  v6[3] = CFSTR("Reduce Processor Speed");
  v6[4] = CFSTR("Dynamic Power Step");
  v6[5] = CFSTR("Wake on LAN");
  v6[6] = CFSTR("Wake On Modem Ring");
  v6[7] = CFSTR("Automatic Restart On Power Loss");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithDisplaySleepTimer:(id)a3 withDiskSleepTimer:(id)a4 withSystemSleepTimer:(id)a5 withReduceProcessorSpeed:(id)a6 withDynamicPowerStep:(id)a7 withWakeOnLAN:(id)a8 withWakeOnModemRing:(id)a9 withAutomaticRestartOnPowerLoss:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setPayloadDisplaySleepTimer:", v23);

  objc_msgSend(v24, "setPayloadDiskSleepTimer:", v22);
  objc_msgSend(v24, "setPayloadSystemSleepTimer:", v21);

  objc_msgSend(v24, "setPayloadReduceProcessorSpeed:", v20);
  objc_msgSend(v24, "setPayloadDynamicPowerStep:", v19);

  objc_msgSend(v24, "setPayloadWakeOnLAN:", v18);
  objc_msgSend(v24, "setPayloadWakeOnModemRing:", v17);

  objc_msgSend(v24, "setPayloadAutomaticRestartOnPowerLoss:", v16);
  return v24;
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
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSNumber *v13;
  id v14;
  NSNumber *payloadDisplaySleepTimer;
  NSNumber *v16;
  NSNumber *payloadDiskSleepTimer;
  NSNumber *v18;
  NSNumber *payloadSystemSleepTimer;
  NSNumber *v20;
  NSNumber *payloadReduceProcessorSpeed;
  NSNumber *v22;
  NSNumber *payloadDynamicPowerStep;
  NSNumber *v24;
  NSNumber *payloadWakeOnLAN;
  NSNumber *v26;
  NSNumber *payloadWakeOnModemRing;
  NSNumber *v28;
  NSNumber *payloadAutomaticRestartOnPowerLoss;
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

  +[CEMSystemEnergySaverDeclaration_PowerSettings allowedPayloadKeys](CEMSystemEnergySaverDeclaration_PowerSettings, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v38 = 0;
  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Display Sleep Timer"), 0, 0, &v38);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v38;
  payloadDisplaySleepTimer = self->_payloadDisplaySleepTimer;
  self->_payloadDisplaySleepTimer = v13;

  if (!v14)
  {
    v37 = 0;
    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Disk Sleep Timer"), 0, 0, &v37);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v37;
    payloadDiskSleepTimer = self->_payloadDiskSleepTimer;
    self->_payloadDiskSleepTimer = v16;

    if (!v14)
    {
      v36 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("System Sleep Timer"), 0, 0, &v36);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v36;
      payloadSystemSleepTimer = self->_payloadSystemSleepTimer;
      self->_payloadSystemSleepTimer = v18;

      if (!v14)
      {
        v35 = 0;
        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Reduce Processor Speed"), 0, 0, &v35);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v35;
        payloadReduceProcessorSpeed = self->_payloadReduceProcessorSpeed;
        self->_payloadReduceProcessorSpeed = v20;

        if (!v14)
        {
          v34 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Dynamic Power Step"), 0, 0, &v34);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v34;
          payloadDynamicPowerStep = self->_payloadDynamicPowerStep;
          self->_payloadDynamicPowerStep = v22;

          if (!v14)
          {
            v33 = 0;
            -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Wake on LAN"), 0, 0, &v33);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v33;
            payloadWakeOnLAN = self->_payloadWakeOnLAN;
            self->_payloadWakeOnLAN = v24;

            if (!v14)
            {
              v32 = 0;
              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Wake On Modem Ring"), 0, 0, &v32);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v32;
              payloadWakeOnModemRing = self->_payloadWakeOnModemRing;
              self->_payloadWakeOnModemRing = v26;

              if (!v14)
              {
                v31 = 0;
                -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Automatic Restart On Power Loss"), 0, 0, &v31);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v31;
                payloadAutomaticRestartOnPowerLoss = self->_payloadAutomaticRestartOnPowerLoss;
                self->_payloadAutomaticRestartOnPowerLoss = v28;

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
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Display Sleep Timer"), self->_payloadDisplaySleepTimer, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Disk Sleep Timer"), self->_payloadDiskSleepTimer, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("System Sleep Timer"), self->_payloadSystemSleepTimer, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Reduce Processor Speed"), self->_payloadReduceProcessorSpeed, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Dynamic Power Step"), self->_payloadDynamicPowerStep, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Wake on LAN"), self->_payloadWakeOnLAN, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Wake On Modem Ring"), self->_payloadWakeOnModemRing, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Automatic Restart On Power Loss"), self->_payloadAutomaticRestartOnPowerLoss, 0, 0);
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CEMSystemEnergySaverDeclaration_PowerSettings;
  v4 = -[CEMPayloadBase copyWithZone:](&v22, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadDisplaySleepTimer, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadDiskSleepTimer, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadSystemSleepTimer, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadReduceProcessorSpeed, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadDynamicPowerStep, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_payloadWakeOnLAN, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_payloadWakeOnModemRing, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_payloadAutomaticRestartOnPowerLoss, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  return v4;
}

- (NSNumber)payloadDisplaySleepTimer
{
  return self->_payloadDisplaySleepTimer;
}

- (void)setPayloadDisplaySleepTimer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadDiskSleepTimer
{
  return self->_payloadDiskSleepTimer;
}

- (void)setPayloadDiskSleepTimer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadSystemSleepTimer
{
  return self->_payloadSystemSleepTimer;
}

- (void)setPayloadSystemSleepTimer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadReduceProcessorSpeed
{
  return self->_payloadReduceProcessorSpeed;
}

- (void)setPayloadReduceProcessorSpeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadDynamicPowerStep
{
  return self->_payloadDynamicPowerStep;
}

- (void)setPayloadDynamicPowerStep:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)payloadWakeOnLAN
{
  return self->_payloadWakeOnLAN;
}

- (void)setPayloadWakeOnLAN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadWakeOnModemRing
{
  return self->_payloadWakeOnModemRing;
}

- (void)setPayloadWakeOnModemRing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadAutomaticRestartOnPowerLoss
{
  return self->_payloadAutomaticRestartOnPowerLoss;
}

- (void)setPayloadAutomaticRestartOnPowerLoss:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAutomaticRestartOnPowerLoss, 0);
  objc_storeStrong((id *)&self->_payloadWakeOnModemRing, 0);
  objc_storeStrong((id *)&self->_payloadWakeOnLAN, 0);
  objc_storeStrong((id *)&self->_payloadDynamicPowerStep, 0);
  objc_storeStrong((id *)&self->_payloadReduceProcessorSpeed, 0);
  objc_storeStrong((id *)&self->_payloadSystemSleepTimer, 0);
  objc_storeStrong((id *)&self->_payloadDiskSleepTimer, 0);
  objc_storeStrong((id *)&self->_payloadDisplaySleepTimer, 0);
}

@end
