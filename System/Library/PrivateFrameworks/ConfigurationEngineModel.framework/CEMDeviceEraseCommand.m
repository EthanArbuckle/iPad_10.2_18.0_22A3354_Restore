@implementation CEMDeviceEraseCommand

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Commands");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.command.device.erase");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("PreserveDataPlan");
  v6[1] = CFSTR("DisallowProximitySetup");
  v6[2] = CFSTR("PIN");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)executionLevel
{
  return 0;
}

+ (id)buildWithIdentifier:(id)a3 withPreserveDataPlan:(id)a4 withDisallowProximitySetup:(id)a5 withPIN:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setCommandType:", CFSTR("com.apple.command.device.erase"));
  if (v9)
  {
    objc_msgSend(v13, "setCommandIdentifier:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCommandIdentifier:", v15);

  }
  v16 = (void *)MEMORY[0x24BDBD1C0];
  if (v12)
    v17 = v12;
  else
    v17 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v13, "setPayloadPreserveDataPlan:", v17);

  if (v11)
    v18 = v11;
  else
    v18 = v16;
  objc_msgSend(v13, "setPayloadDisallowProximitySetup:", v18);

  objc_msgSend(v13, "setPayloadPIN:", v10);
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withPIN:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setCommandType:", CFSTR("com.apple.command.device.erase"));
  if (v5)
  {
    objc_msgSend(v7, "setCommandIdentifier:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCommandIdentifier:", v9);

  }
  objc_msgSend(v7, "setPayloadPIN:", v6);

  return v7;
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
  NSNumber *payloadPreserveDataPlan;
  NSNumber *v16;
  NSNumber *payloadDisallowProximitySetup;
  NSString *v18;
  NSString *payloadPIN;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMDeviceEraseCommand allowedPayloadKeys](CEMDeviceEraseCommand, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PreserveDataPlan"), 0, MEMORY[0x24BDBD1C0], &v23);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadPreserveDataPlan = self->_payloadPreserveDataPlan;
  self->_payloadPreserveDataPlan = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisallowProximitySetup"), 0, MEMORY[0x24BDBD1C0], &v22);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadDisallowProximitySetup = self->_payloadDisallowProximitySetup;
    self->_payloadDisallowProximitySetup = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PIN"), 1, 0, &v21);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadPIN = self->_payloadPIN;
      self->_payloadPIN = v18;

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
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("PreserveDataPlan"), self->_payloadPreserveDataPlan, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisallowProximitySetup"), self->_payloadDisallowProximitySetup, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("PIN"), self->_payloadPIN, 1, 0);
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEMDeviceEraseCommand;
  v4 = -[CEMCommandBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadPreserveDataPlan, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = -[NSNumber copy](self->_payloadDisallowProximitySetup, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  v9 = -[NSString copy](self->_payloadPIN, "copy");
  v10 = (void *)v4[9];
  v4[9] = v9;

  return v4;
}

- (NSNumber)payloadPreserveDataPlan
{
  return self->_payloadPreserveDataPlan;
}

- (void)setPayloadPreserveDataPlan:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadDisallowProximitySetup
{
  return self->_payloadDisallowProximitySetup;
}

- (void)setPayloadDisallowProximitySetup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)payloadPIN
{
  return self->_payloadPIN;
}

- (void)setPayloadPIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPIN, 0);
  objc_storeStrong((id *)&self->_payloadDisallowProximitySetup, 0);
  objc_storeStrong((id *)&self->_payloadPreserveDataPlan, 0);
}

@end
