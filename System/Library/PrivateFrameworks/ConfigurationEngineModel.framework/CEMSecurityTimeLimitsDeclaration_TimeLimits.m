@implementation CEMSecurityTimeLimitsDeclaration_TimeLimits

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("weekday-allowance");
  v6[1] = CFSTR("weekday-curfew");
  v6[2] = CFSTR("weekend-allowance");
  v6[3] = CFSTR("weekend-curfew");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithWeekdayAllowance:(id)a3 withWeekdayCurfew:(id)a4 withWeekendAllowance:(id)a5 withWeekendCurfew:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadWeekdayAllowance:", v12);

  objc_msgSend(v13, "setPayloadWeekdayCurfew:", v11);
  objc_msgSend(v13, "setPayloadWeekendAllowance:", v10);

  objc_msgSend(v13, "setPayloadWeekendCurfew:", v9);
  return v13;
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
  CEMSecurityTimeLimitsDeclaration_Allowance *v13;
  id v14;
  CEMSecurityTimeLimitsDeclaration_Allowance *payloadWeekdayAllowance;
  CEMSecurityTimeLimitsDeclaration_Allowance *v16;
  CEMSecurityTimeLimitsDeclaration_Allowance *payloadWeekdayCurfew;
  CEMSecurityTimeLimitsDeclaration_Allowance *v18;
  CEMSecurityTimeLimitsDeclaration_Allowance *payloadWeekendAllowance;
  CEMSecurityTimeLimitsDeclaration_Allowance *v20;
  CEMSecurityTimeLimitsDeclaration_Allowance *payloadWeekendCurfew;
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

  +[CEMSecurityTimeLimitsDeclaration_TimeLimits allowedPayloadKeys](CEMSecurityTimeLimitsDeclaration_TimeLimits, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("weekday-allowance"), objc_opt_class(), 0, 0, &v26);
  v13 = (CEMSecurityTimeLimitsDeclaration_Allowance *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadWeekdayAllowance = self->_payloadWeekdayAllowance;
  self->_payloadWeekdayAllowance = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("weekday-curfew"), objc_opt_class(), 0, 0, &v25);
    v16 = (CEMSecurityTimeLimitsDeclaration_Allowance *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadWeekdayCurfew = self->_payloadWeekdayCurfew;
    self->_payloadWeekdayCurfew = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("weekend-allowance"), objc_opt_class(), 0, 0, &v24);
      v18 = (CEMSecurityTimeLimitsDeclaration_Allowance *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadWeekendAllowance = self->_payloadWeekendAllowance;
      self->_payloadWeekendAllowance = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("weekend-curfew"), objc_opt_class(), 0, 0, &v23);
        v20 = (CEMSecurityTimeLimitsDeclaration_Allowance *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadWeekendCurfew = self->_payloadWeekendCurfew;
        self->_payloadWeekendCurfew = v20;

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
  CEMSecurityTimeLimitsDeclaration_Allowance *payloadWeekdayAllowance;
  uint64_t v7;
  id v8;
  CEMSecurityTimeLimitsDeclaration_Allowance *payloadWeekdayCurfew;
  id v10;
  CEMSecurityTimeLimitsDeclaration_Allowance *payloadWeekendAllowance;
  id v12;
  CEMSecurityTimeLimitsDeclaration_Allowance *payloadWeekendCurfew;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  payloadWeekdayAllowance = self->_payloadWeekdayAllowance;
  v7 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke;
  v26[3] = &unk_24C638560;
  v8 = v4;
  v27 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("weekday-allowance"), payloadWeekdayAllowance, v26, 0, 0);
  payloadWeekdayCurfew = self->_payloadWeekdayCurfew;
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_2;
  v24[3] = &unk_24C638560;
  v10 = v8;
  v25 = v10;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("weekday-curfew"), payloadWeekdayCurfew, v24, 0, 0);
  payloadWeekendAllowance = self->_payloadWeekendAllowance;
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_3;
  v22[3] = &unk_24C638560;
  v12 = v10;
  v23 = v12;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("weekend-allowance"), payloadWeekendAllowance, v22, 0, 0);
  payloadWeekendCurfew = self->_payloadWeekendCurfew;
  v17 = v7;
  v18 = 3221225472;
  v19 = __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_4;
  v20 = &unk_24C638560;
  v21 = v12;
  v14 = v12;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("weekend-curfew"), payloadWeekendCurfew, &v17, 0, 0);
  v15 = (void *)objc_msgSend(v5, "copy", v17, v18, v19, v20);

  return v15;
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
  v14.super_class = (Class)CEMSecurityTimeLimitsDeclaration_TimeLimits;
  v4 = -[CEMPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[CEMSecurityTimeLimitsDeclaration_Allowance copy](self->_payloadWeekdayAllowance, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[CEMSecurityTimeLimitsDeclaration_Allowance copy](self->_payloadWeekdayCurfew, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[CEMSecurityTimeLimitsDeclaration_Allowance copy](self->_payloadWeekendAllowance, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[CEMSecurityTimeLimitsDeclaration_Allowance copy](self->_payloadWeekendCurfew, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekdayAllowance
{
  return self->_payloadWeekdayAllowance;
}

- (void)setPayloadWeekdayAllowance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekdayCurfew
{
  return self->_payloadWeekdayCurfew;
}

- (void)setPayloadWeekdayCurfew:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekendAllowance
{
  return self->_payloadWeekendAllowance;
}

- (void)setPayloadWeekendAllowance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekendCurfew
{
  return self->_payloadWeekendCurfew;
}

- (void)setPayloadWeekendCurfew:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadWeekendCurfew, 0);
  objc_storeStrong((id *)&self->_payloadWeekendAllowance, 0);
  objc_storeStrong((id *)&self->_payloadWeekdayCurfew, 0);
  objc_storeStrong((id *)&self->_payloadWeekdayAllowance, 0);
}

@end
