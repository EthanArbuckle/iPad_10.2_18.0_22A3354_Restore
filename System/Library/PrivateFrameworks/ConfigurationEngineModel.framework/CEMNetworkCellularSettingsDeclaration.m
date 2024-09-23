@implementation CEMNetworkCellularSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.network.cellular.settings");
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
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowDataRoaming");
  v6[1] = CFSTR("allowVoiceRoaming");
  v6[2] = CFSTR("allowPersonalHotspot");
  v6[3] = CFSTR("allowGlobalBackgroundFetchWhenRoaming");
  v6[4] = CFSTR("allowCellularPlanModification");
  v6[5] = CFSTR("allowAppCellularDataModification");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
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
  v6[0] = CFSTR("allowGlobalBackgroundFetchWhenRoaming");
  v6[1] = CFSTR("allowCellularPlanModification");
  v6[2] = CFSTR("allowAppCellularDataModification");
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

+ (id)buildWithIdentifier:(id)a3 withAllowDataRoaming:(id)a4 withAllowVoiceRoaming:(id)a5 withAllowPersonalHotspot:(id)a6 withAllowGlobalBackgroundFetchWhenRoaming:(id)a7 withAllowCellularPlanModification:(id)a8 withAllowAppCellularDataModification:(id)a9
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
  id v27;
  id v28;
  id v29;
  id v30;

  v14 = a3;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setDeclarationType:", CFSTR("com.apple.configuration.network.cellular.settings"));
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
  objc_msgSend(v21, "setPayloadAllowDataRoaming:", v25);

  if (v19)
    v26 = v19;
  else
    v26 = v24;
  objc_msgSend(v21, "setPayloadAllowVoiceRoaming:", v26);

  if (v18)
    v27 = v18;
  else
    v27 = v24;
  objc_msgSend(v21, "setPayloadAllowPersonalHotspot:", v27);

  if (v17)
    v28 = v17;
  else
    v28 = v24;
  objc_msgSend(v21, "setPayloadAllowGlobalBackgroundFetchWhenRoaming:", v28);

  if (v16)
    v29 = v16;
  else
    v29 = v24;
  objc_msgSend(v21, "setPayloadAllowCellularPlanModification:", v29);

  if (v15)
    v30 = v15;
  else
    v30 = v24;
  objc_msgSend(v21, "setPayloadAllowAppCellularDataModification:", v30);

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
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.network.cellular.settings"));
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
  NSNumber *payloadAllowDataRoaming;
  NSNumber *v16;
  NSNumber *payloadAllowVoiceRoaming;
  NSNumber *v18;
  NSNumber *payloadAllowPersonalHotspot;
  NSNumber *v20;
  NSNumber *payloadAllowGlobalBackgroundFetchWhenRoaming;
  NSNumber *v22;
  NSNumber *payloadAllowCellularPlanModification;
  NSNumber *v24;
  NSNumber *payloadAllowAppCellularDataModification;
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

  +[CEMNetworkCellularSettingsDeclaration allowedPayloadKeys](CEMNetworkCellularSettingsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v32 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowDataRoaming"), 0, MEMORY[0x24BDBD1C8], &v32);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  payloadAllowDataRoaming = self->_payloadAllowDataRoaming;
  self->_payloadAllowDataRoaming = v13;

  if (!v14)
  {
    v31 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowVoiceRoaming"), 0, MEMORY[0x24BDBD1C8], &v31);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    payloadAllowVoiceRoaming = self->_payloadAllowVoiceRoaming;
    self->_payloadAllowVoiceRoaming = v16;

    if (!v14)
    {
      v30 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowPersonalHotspot"), 0, MEMORY[0x24BDBD1C8], &v30);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v30;
      payloadAllowPersonalHotspot = self->_payloadAllowPersonalHotspot;
      self->_payloadAllowPersonalHotspot = v18;

      if (!v14)
      {
        v29 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowGlobalBackgroundFetchWhenRoaming"), 0, MEMORY[0x24BDBD1C8], &v29);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v29;
        payloadAllowGlobalBackgroundFetchWhenRoaming = self->_payloadAllowGlobalBackgroundFetchWhenRoaming;
        self->_payloadAllowGlobalBackgroundFetchWhenRoaming = v20;

        if (!v14)
        {
          v28 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowCellularPlanModification"), 0, MEMORY[0x24BDBD1C8], &v28);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v28;
          payloadAllowCellularPlanModification = self->_payloadAllowCellularPlanModification;
          self->_payloadAllowCellularPlanModification = v22;

          if (!v14)
          {
            v27 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAppCellularDataModification"), 0, MEMORY[0x24BDBD1C8], &v27);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v27;
            payloadAllowAppCellularDataModification = self->_payloadAllowAppCellularDataModification;
            self->_payloadAllowAppCellularDataModification = v24;

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
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowDataRoaming"), self->_payloadAllowDataRoaming, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowVoiceRoaming"), self->_payloadAllowVoiceRoaming, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowPersonalHotspot"), self->_payloadAllowPersonalHotspot, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowGlobalBackgroundFetchWhenRoaming"), self->_payloadAllowGlobalBackgroundFetchWhenRoaming, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowCellularPlanModification"), self->_payloadAllowCellularPlanModification, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAppCellularDataModification"), self->_payloadAllowAppCellularDataModification, 0, v5);
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CEMNetworkCellularSettingsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowDataRoaming, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowVoiceRoaming, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowPersonalHotspot, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadAllowGlobalBackgroundFetchWhenRoaming, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadAllowCellularPlanModification, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadAllowAppCellularDataModification, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSNumber)payloadAllowDataRoaming
{
  return self->_payloadAllowDataRoaming;
}

- (void)setPayloadAllowDataRoaming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowVoiceRoaming
{
  return self->_payloadAllowVoiceRoaming;
}

- (void)setPayloadAllowVoiceRoaming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowPersonalHotspot
{
  return self->_payloadAllowPersonalHotspot;
}

- (void)setPayloadAllowPersonalHotspot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadAllowGlobalBackgroundFetchWhenRoaming
{
  return self->_payloadAllowGlobalBackgroundFetchWhenRoaming;
}

- (void)setPayloadAllowGlobalBackgroundFetchWhenRoaming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadAllowCellularPlanModification
{
  return self->_payloadAllowCellularPlanModification;
}

- (void)setPayloadAllowCellularPlanModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadAllowAppCellularDataModification
{
  return self->_payloadAllowAppCellularDataModification;
}

- (void)setPayloadAllowAppCellularDataModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowAppCellularDataModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowCellularPlanModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowGlobalBackgroundFetchWhenRoaming, 0);
  objc_storeStrong((id *)&self->_payloadAllowPersonalHotspot, 0);
  objc_storeStrong((id *)&self->_payloadAllowVoiceRoaming, 0);
  objc_storeStrong((id *)&self->_payloadAllowDataRoaming, 0);
}

@end
