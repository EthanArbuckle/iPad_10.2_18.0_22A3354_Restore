@implementation CEMSecurityInformationCommand_Status

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("SecurityInfo");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (NSSet)allowedReasons
{
  return (NSSet *)(id)objc_opt_new();
}

+ (id)buildWithSecurityInfo:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setStatusSecurityInfo:", v3);

  return v4;
}

+ (id)buildRequiredOnlyWithSecurityInfo:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setStatusSecurityInfo:", v3);

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
  CEMSecurityInformationCommand_StatusSecurityInfo *v15;
  CEMSecurityInformationCommand_StatusSecurityInfo *statusSecurityInfo;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSecurityInformationCommand_Status allowedStatusKeys](CEMSecurityInformationCommand_Status, "allowedStatusKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_9;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v18 = 0;
    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("SecurityInfo"), objc_opt_class(), 1, 0, &v18);
    v15 = (CEMSecurityInformationCommand_StatusSecurityInfo *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    statusSecurityInfo = self->_statusSecurityInfo;
    self->_statusSecurityInfo = v15;

    v14 = v12 == 0;
    if (a4 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v14 = 0;
      *a4 = v12;
    }
  }

LABEL_9:
  return v14;
}

- (id)serializePayload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, CFSTR("SecurityInfo"), self->_statusSecurityInfo, &__block_literal_global_35, 1, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (CEMSecurityInformationCommand_StatusSecurityInfo)statusSecurityInfo
{
  return self->_statusSecurityInfo;
}

- (void)setStatusSecurityInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusSecurityInfo, 0);
}

@end
