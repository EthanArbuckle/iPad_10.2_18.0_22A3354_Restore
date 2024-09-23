@implementation CEMManagementStateCommand_Status

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Commands");
  v6[1] = CFSTR("Declarations");
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

+ (id)buildWithCommands:(id)a3 withDeclarations:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStatusCommands:", v6);

  objc_msgSend(v7, "setStatusDeclarations:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithCommands:(id)a3 withDeclarations:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStatusCommands:", v6);

  objc_msgSend(v7, "setStatusDeclarations:", v5);
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
  NSArray *v15;
  NSArray *statusCommands;
  NSArray *v17;
  NSArray *statusDeclarations;
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

  +[CEMManagementStateCommand_Status allowedStatusKeys](CEMManagementStateCommand_Status, "allowedStatusKeys");
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
    -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("Commands"), &__block_literal_global_17, 1, 0, &v21);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    statusCommands = self->_statusCommands;
    self->_statusCommands = v15;

    if (!v12)
    {
      v20 = 0;
      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("Declarations"), &__block_literal_global_78_0, 1, 0, &v20);
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v12 = v20;
      statusDeclarations = self->_statusDeclarations;
      self->_statusDeclarations = v17;

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
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v3, CFSTR("Commands"), self->_statusCommands, &__block_literal_global_80, 1, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v3, CFSTR("Declarations"), self->_statusDeclarations, &__block_literal_global_81, 1, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSArray)statusCommands
{
  return self->_statusCommands;
}

- (void)setStatusCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)statusDeclarations
{
  return self->_statusDeclarations;
}

- (void)setStatusDeclarations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDeclarations, 0);
  objc_storeStrong((id *)&self->_statusCommands, 0);
}

@end
