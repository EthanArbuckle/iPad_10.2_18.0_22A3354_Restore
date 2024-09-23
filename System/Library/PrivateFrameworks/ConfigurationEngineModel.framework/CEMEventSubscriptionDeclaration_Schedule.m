@implementation CEMEventSubscriptionDeclaration_Schedule

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Frequency");
  v6[1] = CFSTR("LocalTime");
  v6[2] = CFSTR("Spread");
  v6[3] = CFSTR("Day");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithFrequency:(id)a3 withLocalTime:(id)a4 withSpread:(id)a5 withDay:(id)a6
{
  id v9;
  id v10;
  __CFString *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  v9 = a6;
  v10 = a5;
  v11 = (__CFString *)a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadFrequency:", v12);

  if (v11)
    v14 = v11;
  else
    v14 = CFSTR("00:00");
  objc_msgSend(v13, "setPayloadLocalTime:", v14);

  if (v10)
    v15 = v10;
  else
    v15 = &unk_24C69CD10;
  objc_msgSend(v13, "setPayloadSpread:", v15);

  if (v9)
    v16 = v9;
  else
    v16 = &unk_24C69CD28;
  objc_msgSend(v13, "setPayloadDay:", v16);

  return v13;
}

+ (id)buildRequiredOnlyWithFrequency:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadFrequency:", v3);

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
  NSString *payloadFrequency;
  NSString *v16;
  NSString *payloadLocalTime;
  NSNumber *v18;
  NSNumber *payloadSpread;
  NSNumber *v20;
  NSNumber *payloadDay;
  id v23;
  id v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMEventSubscriptionDeclaration_Schedule allowedPayloadKeys](CEMEventSubscriptionDeclaration_Schedule, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Frequency"), 1, 0, &v26);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadFrequency = self->_payloadFrequency;
  self->_payloadFrequency = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LocalTime"), 0, CFSTR("00:00"), &v25);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadLocalTime = self->_payloadLocalTime;
    self->_payloadLocalTime = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Spread"), 0, &unk_24C69CD10, &v24);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadSpread = self->_payloadSpread;
      self->_payloadSpread = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Day"), 0, &unk_24C69CD28, &v23);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadDay = self->_payloadDay;
        self->_payloadDay = v20;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Frequency"), self->_payloadFrequency, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("LocalTime"), self->_payloadLocalTime, 0, CFSTR("00:00"));
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Spread"), self->_payloadSpread, 0, &unk_24C69CD10);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Day"), self->_payloadDay, 0, &unk_24C69CD28);
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMEventSubscriptionDeclaration_Schedule;
  v4 = -[CEMPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadFrequency, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadLocalTime, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadSpread, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadDay, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadFrequency
{
  return self->_payloadFrequency;
}

- (void)setPayloadFrequency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadLocalTime
{
  return self->_payloadLocalTime;
}

- (void)setPayloadLocalTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadSpread
{
  return self->_payloadSpread;
}

- (void)setPayloadSpread:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadDay
{
  return self->_payloadDay;
}

- (void)setPayloadDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDay, 0);
  objc_storeStrong((id *)&self->_payloadSpread, 0);
  objc_storeStrong((id *)&self->_payloadLocalTime, 0);
  objc_storeStrong((id *)&self->_payloadFrequency, 0);
}

@end
