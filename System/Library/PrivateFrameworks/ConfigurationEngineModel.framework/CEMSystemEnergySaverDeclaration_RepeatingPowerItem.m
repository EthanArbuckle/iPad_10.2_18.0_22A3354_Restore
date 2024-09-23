@implementation CEMSystemEnergySaverDeclaration_RepeatingPowerItem

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("eventtype");
  v6[1] = CFSTR("weekdays");
  v6[2] = CFSTR("time");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithEventtype:(id)a3 withWeekdays:(id)a4 withTime:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setPayloadEventtype:", v9);

  objc_msgSend(v10, "setPayloadWeekdays:", v8);
  objc_msgSend(v10, "setPayloadTime:", v7);

  return v10;
}

+ (id)buildRequiredOnlyWithEventtype:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadEventtype:", v3);

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
  NSString *payloadEventtype;
  NSNumber *v16;
  NSNumber *payloadWeekdays;
  NSNumber *v18;
  NSNumber *payloadTime;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemEnergySaverDeclaration_RepeatingPowerItem allowedPayloadKeys](CEMSystemEnergySaverDeclaration_RepeatingPowerItem, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("eventtype"), 1, 0, &v23);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadEventtype = self->_payloadEventtype;
  self->_payloadEventtype = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("weekdays"), 0, 0, &v22);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadWeekdays = self->_payloadWeekdays;
    self->_payloadWeekdays = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("time"), 0, 0, &v21);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadTime = self->_payloadTime;
      self->_payloadTime = v18;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("eventtype"), self->_payloadEventtype, 1, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("weekdays"), self->_payloadWeekdays, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("time"), self->_payloadTime, 0, 0);
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEMSystemEnergySaverDeclaration_RepeatingPowerItem;
  v4 = -[CEMPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadEventtype, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadWeekdays, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadTime, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadEventtype
{
  return self->_payloadEventtype;
}

- (void)setPayloadEventtype:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadWeekdays
{
  return self->_payloadWeekdays;
}

- (void)setPayloadWeekdays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadTime
{
  return self->_payloadTime;
}

- (void)setPayloadTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTime, 0);
  objc_storeStrong((id *)&self->_payloadWeekdays, 0);
  objc_storeStrong((id *)&self->_payloadEventtype, 0);
}

@end
