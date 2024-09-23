@implementation CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("restrictedBool");
  v6[1] = CFSTR("restrictedValue");
  v6[2] = CFSTR("intersection");
  v6[3] = CFSTR("union");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithRestrictedBool:(id)a3 withRestrictedValue:(id)a4 withIntersection:(id)a5 withUnion:(id)a6
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
  objc_msgSend(v13, "setStatusRestrictedBool:", v12);

  objc_msgSend(v13, "setStatusRestrictedValue:", v11);
  objc_msgSend(v13, "setStatusIntersection:", v10);

  objc_msgSend(v13, "setStatusUnion:", v9);
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
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  CEMDeviceListRestrictionsCommand_StatusBooleanDictionary *v15;
  CEMDeviceListRestrictionsCommand_StatusBooleanDictionary *statusRestrictedBool;
  CEMDeviceListRestrictionsCommand_StatusValueDictionary *v17;
  CEMDeviceListRestrictionsCommand_StatusValueDictionary *statusRestrictedValue;
  CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary *v19;
  CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary *statusIntersection;
  CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary *v21;
  CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary *statusUnion;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary allowedStatusKeys](CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary, "allowedStatusKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_13;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v27 = 0;
    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("restrictedBool"), objc_opt_class(), 0, 0, &v27);
    v15 = (CEMDeviceListRestrictionsCommand_StatusBooleanDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = v27;
    statusRestrictedBool = self->_statusRestrictedBool;
    self->_statusRestrictedBool = v15;

    if (!v12)
    {
      v26 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("restrictedValue"), objc_opt_class(), 0, 0, &v26);
      v17 = (CEMDeviceListRestrictionsCommand_StatusValueDictionary *)objc_claimAutoreleasedReturnValue();
      v12 = v26;
      statusRestrictedValue = self->_statusRestrictedValue;
      self->_statusRestrictedValue = v17;

      if (!v12)
      {
        v25 = 0;
        -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("intersection"), objc_opt_class(), 0, 0, &v25);
        v19 = (CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary *)objc_claimAutoreleasedReturnValue();
        v12 = v25;
        statusIntersection = self->_statusIntersection;
        self->_statusIntersection = v19;

        if (!v12)
        {
          v24 = 0;
          -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("union"), objc_opt_class(), 0, 0, &v24);
          v21 = (CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary *)objc_claimAutoreleasedReturnValue();
          v12 = v24;
          statusUnion = self->_statusUnion;
          self->_statusUnion = v21;

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

LABEL_13:
  return v14;
}

- (id)serializePayload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("restrictedBool"), self->_statusRestrictedBool, &__block_literal_global_126, 0, 0);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("restrictedValue"), self->_statusRestrictedValue, &__block_literal_global_127_0, 0, 0);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("intersection"), self->_statusIntersection, &__block_literal_global_128, 0, 0);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("union"), self->_statusUnion, &__block_literal_global_129, 0, 0);
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary;
  v4 = -[CEMPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[CEMDeviceListRestrictionsCommand_StatusBooleanDictionary copy](self->_statusRestrictedBool, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[CEMDeviceListRestrictionsCommand_StatusValueDictionary copy](self->_statusRestrictedValue, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary copy](self->_statusIntersection, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary copy](self->_statusUnion, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (CEMDeviceListRestrictionsCommand_StatusBooleanDictionary)statusRestrictedBool
{
  return self->_statusRestrictedBool;
}

- (void)setStatusRestrictedBool:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CEMDeviceListRestrictionsCommand_StatusValueDictionary)statusRestrictedValue
{
  return self->_statusRestrictedValue;
}

- (void)setStatusRestrictedValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary)statusIntersection
{
  return self->_statusIntersection;
}

- (void)setStatusIntersection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary)statusUnion
{
  return self->_statusUnion;
}

- (void)setStatusUnion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUnion, 0);
  objc_storeStrong((id *)&self->_statusIntersection, 0);
  objc_storeStrong((id *)&self->_statusRestrictedValue, 0);
  objc_storeStrong((id *)&self->_statusRestrictedBool, 0);
}

@end
