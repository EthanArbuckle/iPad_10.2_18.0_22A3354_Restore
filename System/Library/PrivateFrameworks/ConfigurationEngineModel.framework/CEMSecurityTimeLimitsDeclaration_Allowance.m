@implementation CEMSecurityTimeLimitsDeclaration_Allowance

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("enabled");
  v6[1] = CFSTR("rangeType");
  v6[2] = CFSTR("start");
  v6[3] = CFSTR("end");
  v6[4] = CFSTR("secondsPerDay");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 withRangeType:(id)a4 withStart:(id)a5 withEnd:(id)a6 withSecondsPerDay:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setPayloadEnabled:", v15);

  objc_msgSend(v16, "setPayloadRangeType:", v14);
  objc_msgSend(v16, "setPayloadStart:", v13);

  objc_msgSend(v16, "setPayloadEnd:", v12);
  objc_msgSend(v16, "setPayloadSecondsPerDay:", v11);

  return v16;
}

+ (id)buildRequiredOnlyWithEnabled:(id)a3 withRangeType:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadEnabled:", v6);

  objc_msgSend(v7, "setPayloadRangeType:", v5);
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
  NSNumber *payloadEnabled;
  NSNumber *v16;
  NSNumber *payloadRangeType;
  NSString *v18;
  NSString *payloadStart;
  NSString *v20;
  NSString *payloadEnd;
  NSNumber *v22;
  NSNumber *payloadSecondsPerDay;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSecurityTimeLimitsDeclaration_Allowance allowedPayloadKeys](CEMSecurityTimeLimitsDeclaration_Allowance, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("enabled"), 1, 0, &v29);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadEnabled = self->_payloadEnabled;
  self->_payloadEnabled = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("rangeType"), 1, 0, &v28);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadRangeType = self->_payloadRangeType;
    self->_payloadRangeType = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("start"), 0, 0, &v27);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadStart = self->_payloadStart;
      self->_payloadStart = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("end"), 0, 0, &v26);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadEnd = self->_payloadEnd;
        self->_payloadEnd = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("secondsPerDay"), 0, 0, &v25);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadSecondsPerDay = self->_payloadSecondsPerDay;
          self->_payloadSecondsPerDay = v22;

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
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("enabled"), self->_payloadEnabled, 1, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("rangeType"), self->_payloadRangeType, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("start"), self->_payloadStart, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("end"), self->_payloadEnd, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("secondsPerDay"), self->_payloadSecondsPerDay, 0, 0);
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMSecurityTimeLimitsDeclaration_Allowance;
  v4 = -[CEMPayloadBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadEnabled, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadRangeType, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadStart, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadEnd, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadSecondsPerDay, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSNumber)payloadEnabled
{
  return self->_payloadEnabled;
}

- (void)setPayloadEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadRangeType
{
  return self->_payloadRangeType;
}

- (void)setPayloadRangeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadStart
{
  return self->_payloadStart;
}

- (void)setPayloadStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadEnd
{
  return self->_payloadEnd;
}

- (void)setPayloadEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadSecondsPerDay
{
  return self->_payloadSecondsPerDay;
}

- (void)setPayloadSecondsPerDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSecondsPerDay, 0);
  objc_storeStrong((id *)&self->_payloadEnd, 0);
  objc_storeStrong((id *)&self->_payloadStart, 0);
  objc_storeStrong((id *)&self->_payloadRangeType, 0);
  objc_storeStrong((id *)&self->_payloadEnabled, 0);
}

@end
