@implementation CEMDeviceInformationCommand_Status

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("QueryResponses");
  v6[1] = CFSTR("ErrorResponses");
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

+ (id)buildWithQueryResponses:(id)a3 withErrorResponses:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStatusQueryResponses:", v6);

  objc_msgSend(v7, "setStatusErrorResponses:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithQueryResponses:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setStatusQueryResponses:", v3);

  return v4;
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
  CEMDeviceInformationCommand_StatusQueryResponses *v15;
  CEMDeviceInformationCommand_StatusQueryResponses *statusQueryResponses;
  CEMDeviceInformationCommand_StatusErrorResponses *v17;
  CEMDeviceInformationCommand_StatusErrorResponses *statusErrorResponses;
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

  +[CEMDeviceInformationCommand_Status allowedStatusKeys](CEMDeviceInformationCommand_Status, "allowedStatusKeys");
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
    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("QueryResponses"), objc_opt_class(), 1, 0, &v21);
    v15 = (CEMDeviceInformationCommand_StatusQueryResponses *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    statusQueryResponses = self->_statusQueryResponses;
    self->_statusQueryResponses = v15;

    if (!v12)
    {
      v20 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("ErrorResponses"), objc_opt_class(), 0, 0, &v20);
      v17 = (CEMDeviceInformationCommand_StatusErrorResponses *)objc_claimAutoreleasedReturnValue();
      v12 = v20;
      statusErrorResponses = self->_statusErrorResponses;
      self->_statusErrorResponses = v17;

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
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("QueryResponses"), self->_statusQueryResponses, &__block_literal_global_212, 1, 0);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("ErrorResponses"), self->_statusErrorResponses, &__block_literal_global_213, 0, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (CEMDeviceInformationCommand_StatusQueryResponses)statusQueryResponses
{
  return self->_statusQueryResponses;
}

- (void)setStatusQueryResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CEMDeviceInformationCommand_StatusErrorResponses)statusErrorResponses
{
  return self->_statusErrorResponses;
}

- (void)setStatusErrorResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusErrorResponses, 0);
  objc_storeStrong((id *)&self->_statusQueryResponses, 0);
}

@end
