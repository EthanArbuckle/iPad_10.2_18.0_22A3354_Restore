@implementation CEMDeviceListRestrictionsCommand_Status

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("GlobalRestrictions");
  v6[1] = CFSTR("ProfileRestrictions");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (NSSet)allowedReasons
{
  return (NSSet *)(id)objc_opt_new();
}

+ (id)buildWithGlobalRestrictions:(id)a3 withProfileRestrictions:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStatusGlobalRestrictions:", v6);

  objc_msgSend(v7, "setStatusProfileRestrictions:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithGlobalRestrictions:(id)a3 withProfileRestrictions:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStatusGlobalRestrictions:", v6);

  objc_msgSend(v7, "setStatusProfileRestrictions:", v5);
  return v7;
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
  CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary *v15;
  CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary *statusGlobalRestrictions;
  CEMDeviceListRestrictionsCommand_StatusProfileRestrictions *v17;
  CEMDeviceListRestrictionsCommand_StatusProfileRestrictions *statusProfileRestrictions;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMDeviceListRestrictionsCommand_Status allowedStatusKeys](CEMDeviceListRestrictionsCommand_Status, "allowedStatusKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_11;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v21 = 0;
    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("GlobalRestrictions"), objc_opt_class(), 1, 0, &v21);
    v15 = (CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    statusGlobalRestrictions = self->_statusGlobalRestrictions;
    self->_statusGlobalRestrictions = v15;

    if (!v12)
    {
      v20 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("ProfileRestrictions"), objc_opt_class(), 1, 0, &v20);
      v17 = (CEMDeviceListRestrictionsCommand_StatusProfileRestrictions *)objc_claimAutoreleasedReturnValue();
      v12 = v20;
      statusProfileRestrictions = self->_statusProfileRestrictions;
      self->_statusProfileRestrictions = v17;

    }
    v14 = v12 == 0;
    if (a4 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v14 = 0;
      *a4 = v12;
    }
  }

LABEL_11:
  return v14;
}

- (id)serializePayload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("GlobalRestrictions"), self->_statusGlobalRestrictions, &__block_literal_global_13, 1, 0);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("ProfileRestrictions"), self->_statusProfileRestrictions, &__block_literal_global_93, 1, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary)statusGlobalRestrictions
{
  return self->_statusGlobalRestrictions;
}

- (void)setStatusGlobalRestrictions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CEMDeviceListRestrictionsCommand_StatusProfileRestrictions)statusProfileRestrictions
{
  return self->_statusProfileRestrictions;
}

- (void)setStatusProfileRestrictions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProfileRestrictions, 0);
  objc_storeStrong((id *)&self->_statusGlobalRestrictions, 0);
}

@end
