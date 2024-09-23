@implementation CEMSystemEnergySaverDeclaration_EnergySaverSchedule

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("RepeatingPowerOn");
  v6[1] = CFSTR("RepeatingPowerOff");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithRepeatingPowerOn:(id)a3 withRepeatingPowerOff:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadRepeatingPowerOn:", v6);

  objc_msgSend(v7, "setPayloadRepeatingPowerOff:", v5);
  return v7;
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
  CEMSystemEnergySaverDeclaration_RepeatingPowerItem *v13;
  id v14;
  CEMSystemEnergySaverDeclaration_RepeatingPowerItem *payloadRepeatingPowerOn;
  CEMSystemEnergySaverDeclaration_RepeatingPowerItem *v16;
  CEMSystemEnergySaverDeclaration_RepeatingPowerItem *payloadRepeatingPowerOff;
  id v19;
  id v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemEnergySaverDeclaration_EnergySaverSchedule allowedPayloadKeys](CEMSystemEnergySaverDeclaration_EnergySaverSchedule, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v20 = 0;
  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("RepeatingPowerOn"), objc_opt_class(), 0, 0, &v20);
  v13 = (CEMSystemEnergySaverDeclaration_RepeatingPowerItem *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  payloadRepeatingPowerOn = self->_payloadRepeatingPowerOn;
  self->_payloadRepeatingPowerOn = v13;

  if (!v14)
  {
    v19 = 0;
    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("RepeatingPowerOff"), objc_opt_class(), 0, 0, &v19);
    v16 = (CEMSystemEnergySaverDeclaration_RepeatingPowerItem *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    payloadRepeatingPowerOff = self->_payloadRepeatingPowerOff;
    self->_payloadRepeatingPowerOff = v16;

  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  CEMSystemEnergySaverDeclaration_RepeatingPowerItem *payloadRepeatingPowerOn;
  uint64_t v7;
  id v8;
  CEMSystemEnergySaverDeclaration_RepeatingPowerItem *payloadRepeatingPowerOff;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  payloadRepeatingPowerOn = self->_payloadRepeatingPowerOn;
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __90__CEMSystemEnergySaverDeclaration_EnergySaverSchedule_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_24C638560;
  v8 = v4;
  v19 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("RepeatingPowerOn"), payloadRepeatingPowerOn, v18, 0, 0);
  payloadRepeatingPowerOff = self->_payloadRepeatingPowerOff;
  v13 = v7;
  v14 = 3221225472;
  v15 = __90__CEMSystemEnergySaverDeclaration_EnergySaverSchedule_serializePayloadWithAssetProviders___block_invoke_2;
  v16 = &unk_24C638560;
  v17 = v8;
  v10 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("RepeatingPowerOff"), payloadRepeatingPowerOff, &v13, 0, 0);
  v11 = (void *)objc_msgSend(v5, "copy", v13, v14, v15, v16);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CEMSystemEnergySaverDeclaration_EnergySaverSchedule;
  v4 = -[CEMPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[CEMSystemEnergySaverDeclaration_RepeatingPowerItem copy](self->_payloadRepeatingPowerOn, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[CEMSystemEnergySaverDeclaration_RepeatingPowerItem copy](self->_payloadRepeatingPowerOff, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (CEMSystemEnergySaverDeclaration_RepeatingPowerItem)payloadRepeatingPowerOn
{
  return self->_payloadRepeatingPowerOn;
}

- (void)setPayloadRepeatingPowerOn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CEMSystemEnergySaverDeclaration_RepeatingPowerItem)payloadRepeatingPowerOff
{
  return self->_payloadRepeatingPowerOff;
}

- (void)setPayloadRepeatingPowerOff:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRepeatingPowerOff, 0);
  objc_storeStrong((id *)&self->_payloadRepeatingPowerOn, 0);
}

@end
