@implementation CEMSystemEnergySaverDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.energysaver");
}

+ (id)profileType
{
  return CFSTR("com.apple.MCX");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("com.apple.EnergySaver.desktop.ACPower");
  v6[1] = CFSTR("com.apple.EnergySaver.portable.ACPower");
  v6[2] = CFSTR("com.apple.EnergySaver.portable.BatteryPower");
  v6[3] = CFSTR("com.apple.EnergySaver.desktop.Schedule");
  v6[4] = CFSTR("SleepDisabled");
  v6[5] = CFSTR("DestroyFVKeyOnStandby");
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
  return 1;
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

+ (id)buildWithIdentifier:(id)a3 withComappleEnergySaverdesktopACPower:(id)a4 withComappleEnergySaverportableACPower:(id)a5 withComappleEnergySaverportableBatteryPower:(id)a6 withComappleEnergySaverdesktopSchedule:(id)a7 withSleepDisabled:(id)a8 withDestroyFVKeyOnStandby:(id)a9
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

  v14 = a3;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setDeclarationType:", CFSTR("com.apple.configuration.system.energysaver"));
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
  objc_msgSend(v21, "setPayloadComappleEnergySaverdesktopACPower:", v20);

  objc_msgSend(v21, "setPayloadComappleEnergySaverportableACPower:", v19);
  objc_msgSend(v21, "setPayloadComappleEnergySaverportableBatteryPower:", v18);

  objc_msgSend(v21, "setPayloadComappleEnergySaverdesktopSchedule:", v17);
  v24 = (void *)MEMORY[0x24BDBD1C0];
  if (v16)
    v25 = v16;
  else
    v25 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v21, "setPayloadSleepDisabled:", v25);

  if (v15)
    v26 = v15;
  else
    v26 = v24;
  objc_msgSend(v21, "setPayloadDestroyFVKeyOnStandby:", v26);

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
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.system.energysaver"));
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
  CEMSystemEnergySaverDeclaration_PowerSettings *v13;
  id v14;
  CEMSystemEnergySaverDeclaration_PowerSettings *payloadComappleEnergySaverdesktopACPower;
  CEMSystemEnergySaverDeclaration_PowerSettings *v16;
  CEMSystemEnergySaverDeclaration_PowerSettings *payloadComappleEnergySaverportableACPower;
  CEMSystemEnergySaverDeclaration_PowerSettings *v18;
  CEMSystemEnergySaverDeclaration_PowerSettings *payloadComappleEnergySaverportableBatteryPower;
  CEMSystemEnergySaverDeclaration_EnergySaverSchedule *v20;
  CEMSystemEnergySaverDeclaration_EnergySaverSchedule *payloadComappleEnergySaverdesktopSchedule;
  NSNumber *v22;
  NSNumber *payloadSleepDisabled;
  NSNumber *v24;
  NSNumber *payloadDestroyFVKeyOnStandby;
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

  +[CEMSystemEnergySaverDeclaration allowedPayloadKeys](CEMSystemEnergySaverDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v32 = 0;
  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("com.apple.EnergySaver.desktop.ACPower"), objc_opt_class(), 0, 0, &v32);
  v13 = (CEMSystemEnergySaverDeclaration_PowerSettings *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  payloadComappleEnergySaverdesktopACPower = self->_payloadComappleEnergySaverdesktopACPower;
  self->_payloadComappleEnergySaverdesktopACPower = v13;

  if (!v14)
  {
    v31 = 0;
    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("com.apple.EnergySaver.portable.ACPower"), objc_opt_class(), 0, 0, &v31);
    v16 = (CEMSystemEnergySaverDeclaration_PowerSettings *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    payloadComappleEnergySaverportableACPower = self->_payloadComappleEnergySaverportableACPower;
    self->_payloadComappleEnergySaverportableACPower = v16;

    if (!v14)
    {
      v30 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("com.apple.EnergySaver.portable.BatteryPower"), objc_opt_class(), 0, 0, &v30);
      v18 = (CEMSystemEnergySaverDeclaration_PowerSettings *)objc_claimAutoreleasedReturnValue();
      v14 = v30;
      payloadComappleEnergySaverportableBatteryPower = self->_payloadComappleEnergySaverportableBatteryPower;
      self->_payloadComappleEnergySaverportableBatteryPower = v18;

      if (!v14)
      {
        v29 = 0;
        -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("com.apple.EnergySaver.desktop.Schedule"), objc_opt_class(), 0, 0, &v29);
        v20 = (CEMSystemEnergySaverDeclaration_EnergySaverSchedule *)objc_claimAutoreleasedReturnValue();
        v14 = v29;
        payloadComappleEnergySaverdesktopSchedule = self->_payloadComappleEnergySaverdesktopSchedule;
        self->_payloadComappleEnergySaverdesktopSchedule = v20;

        if (!v14)
        {
          v28 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SleepDisabled"), 0, MEMORY[0x24BDBD1C0], &v28);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v28;
          payloadSleepDisabled = self->_payloadSleepDisabled;
          self->_payloadSleepDisabled = v22;

          if (!v14)
          {
            v27 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DestroyFVKeyOnStandby"), 0, MEMORY[0x24BDBD1C0], &v27);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v27;
            payloadDestroyFVKeyOnStandby = self->_payloadDestroyFVKeyOnStandby;
            self->_payloadDestroyFVKeyOnStandby = v24;

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
  id v4;
  void *v5;
  CEMSystemEnergySaverDeclaration_PowerSettings *payloadComappleEnergySaverdesktopACPower;
  uint64_t v7;
  id v8;
  CEMSystemEnergySaverDeclaration_PowerSettings *payloadComappleEnergySaverportableACPower;
  id v10;
  CEMSystemEnergySaverDeclaration_PowerSettings *payloadComappleEnergySaverportableBatteryPower;
  id v12;
  CEMSystemEnergySaverDeclaration_EnergySaverSchedule *payloadComappleEnergySaverdesktopSchedule;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  payloadComappleEnergySaverdesktopACPower = self->_payloadComappleEnergySaverdesktopACPower;
  v7 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v27[3] = &unk_24C638560;
  v8 = v4;
  v28 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("com.apple.EnergySaver.desktop.ACPower"), payloadComappleEnergySaverdesktopACPower, v27, 0, 0);
  payloadComappleEnergySaverportableACPower = self->_payloadComappleEnergySaverportableACPower;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v25[3] = &unk_24C638560;
  v10 = v8;
  v26 = v10;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("com.apple.EnergySaver.portable.ACPower"), payloadComappleEnergySaverportableACPower, v25, 0, 0);
  payloadComappleEnergySaverportableBatteryPower = self->_payloadComappleEnergySaverportableBatteryPower;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v23[3] = &unk_24C638560;
  v12 = v10;
  v24 = v12;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("com.apple.EnergySaver.portable.BatteryPower"), payloadComappleEnergySaverportableBatteryPower, v23, 0, 0);
  payloadComappleEnergySaverdesktopSchedule = self->_payloadComappleEnergySaverdesktopSchedule;
  v18 = v7;
  v19 = 3221225472;
  v20 = __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_4;
  v21 = &unk_24C638560;
  v22 = v12;
  v14 = v12;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("com.apple.EnergySaver.desktop.Schedule"), payloadComappleEnergySaverdesktopSchedule, &v18, 0, 0);
  v15 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("SleepDisabled"), self->_payloadSleepDisabled, 0, MEMORY[0x24BDBD1C0], v18, v19, v20, v21);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("DestroyFVKeyOnStandby"), self->_payloadDestroyFVKeyOnStandby, 0, v15);
  v16 = (void *)objc_msgSend(v5, "copy");

  return v16;
}

uint64_t __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __70__CEMSystemEnergySaverDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
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
  v18.super_class = (Class)CEMSystemEnergySaverDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[CEMSystemEnergySaverDeclaration_PowerSettings copy](self->_payloadComappleEnergySaverdesktopACPower, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[CEMSystemEnergySaverDeclaration_PowerSettings copy](self->_payloadComappleEnergySaverportableACPower, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[CEMSystemEnergySaverDeclaration_PowerSettings copy](self->_payloadComappleEnergySaverportableBatteryPower, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[CEMSystemEnergySaverDeclaration_EnergySaverSchedule copy](self->_payloadComappleEnergySaverdesktopSchedule, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadSleepDisabled, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadDestroyFVKeyOnStandby, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (CEMSystemEnergySaverDeclaration_PowerSettings)payloadComappleEnergySaverdesktopACPower
{
  return self->_payloadComappleEnergySaverdesktopACPower;
}

- (void)setPayloadComappleEnergySaverdesktopACPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CEMSystemEnergySaverDeclaration_PowerSettings)payloadComappleEnergySaverportableACPower
{
  return self->_payloadComappleEnergySaverportableACPower;
}

- (void)setPayloadComappleEnergySaverportableACPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CEMSystemEnergySaverDeclaration_PowerSettings)payloadComappleEnergySaverportableBatteryPower
{
  return self->_payloadComappleEnergySaverportableBatteryPower;
}

- (void)setPayloadComappleEnergySaverportableBatteryPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CEMSystemEnergySaverDeclaration_EnergySaverSchedule)payloadComappleEnergySaverdesktopSchedule
{
  return self->_payloadComappleEnergySaverdesktopSchedule;
}

- (void)setPayloadComappleEnergySaverdesktopSchedule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadSleepDisabled
{
  return self->_payloadSleepDisabled;
}

- (void)setPayloadSleepDisabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadDestroyFVKeyOnStandby
{
  return self->_payloadDestroyFVKeyOnStandby;
}

- (void)setPayloadDestroyFVKeyOnStandby:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDestroyFVKeyOnStandby, 0);
  objc_storeStrong((id *)&self->_payloadSleepDisabled, 0);
  objc_storeStrong((id *)&self->_payloadComappleEnergySaverdesktopSchedule, 0);
  objc_storeStrong((id *)&self->_payloadComappleEnergySaverportableBatteryPower, 0);
  objc_storeStrong((id *)&self->_payloadComappleEnergySaverportableACPower, 0);
  objc_storeStrong((id *)&self->_payloadComappleEnergySaverdesktopACPower, 0);
}

uint64_t __90__CEMSystemEnergySaverDeclaration_EnergySaverSchedule_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __90__CEMSystemEnergySaverDeclaration_EnergySaverSchedule_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

@end
