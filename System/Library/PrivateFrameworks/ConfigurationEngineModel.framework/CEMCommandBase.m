@implementation CEMCommandBase

+ (id)commandForPayload:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("Type"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("(nil)");
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  if (+[CEMRegisteredTypeResolver registeredClassWithIdentifier:](CEMRegisteredTypeResolver, "registeredClassWithIdentifier:", v9))
  {
    v10 = (id)objc_opt_new();
    v17 = 0;
    objc_msgSend(v10, "loadCommandFromDictionary:error:", v5, &v17);
    v11 = v17;
    v12 = v11;
    if (!v11)
    {
      v10 = v10;
      v15 = v10;
      goto LABEL_12;
    }
    if (!a4)
    {
      v15 = 0;
      goto LABEL_12;
    }
    v13 = objc_retainAutorelease(v11);
    v12 = v13;
  }
  else
  {
    if (!a4)
    {
      v15 = 0;
      goto LABEL_13;
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not match command type: %@"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = 0;
  *a4 = v13;
LABEL_12:

LABEL_13:
  return v15;
}

+ (id)commandForData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[CEMCommandBase commandForPayload:error:](CEMCommandBase, "commandForPayload:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)executionLevel
{
  return 2;
}

- (BOOL)loadCommandFromDictionary:(id)a3 error:(id *)a4
{
  id v6;
  NSString *v7;
  id v8;
  NSString *commandType;
  NSString *v10;
  NSString *commandIdentifier;
  NSString *v12;
  NSString *commandDescription;
  NSNumber *v14;
  NSNumber *commandRequiresNetworkTether;
  BOOL v16;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v6 = a3;
  v27 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Type"), 1, 0, &v27);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  commandType = self->_commandType;
  self->_commandType = v7;

  if (v8)
    goto LABEL_5;
  v26 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Identifier"), 1, 0, &v26);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v26;
  commandIdentifier = self->_commandIdentifier;
  self->_commandIdentifier = v10;

  if (v8)
    goto LABEL_5;
  v25 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Description"), 0, 0, &v25);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  commandDescription = self->_commandDescription;
  self->_commandDescription = v12;

  if (v8
    || (v24 = 0,
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RequiresNetworkTether"), 0, MEMORY[0x24BDBD1C0], &v24), v14 = (NSNumber *)objc_claimAutoreleasedReturnValue(), v8 = v24, commandRequiresNetworkTether = self->_commandRequiresNetworkTether, self->_commandRequiresNetworkTether = v14, commandRequiresNetworkTether, v8))
  {
LABEL_5:
    v16 = 0;
    if (a4)
    {
LABEL_6:
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
    }
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Payload"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = (void *)MEMORY[0x24BDBD1B8];
    if (v18)
      v20 = (void *)v18;
    v21 = v20;

    v23 = 0;
    -[CEMPayloadBase loadPayload:error:](self, "loadPayload:error:", v21, &v23);

    v22 = v23;
    v8 = v22;
    v16 = v22 == 0;
    if (a4 && v22)
      goto LABEL_6;
  }

  return v16;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Type"), self->_commandType, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Identifier"), self->_commandIdentifier, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Description"), self->_commandDescription, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("RequiresNetworkTether"), self->_commandRequiresNetworkTether, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializePayloadWithAssetProviders:](self, "serializePayloadWithAssetProviders:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Payload"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (id)serializeAsDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDD1770];
  -[CEMCommandBase serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMCommandBase;
  v4 = -[CEMPayloadBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_commandType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_commandIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_commandDescription, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_commandRequiresNetworkTether, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[CEMAnyPayload copy](self->_commandPayload, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)commandIdentifier
{
  return self->_commandIdentifier;
}

- (void)setCommandIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)commandDescription
{
  return self->_commandDescription;
}

- (void)setCommandDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)commandRequiresNetworkTether
{
  return self->_commandRequiresNetworkTether;
}

- (void)setCommandRequiresNetworkTether:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CEMAnyPayload)commandPayload
{
  return self->_commandPayload;
}

- (void)setCommandPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandPayload, 0);
  objc_storeStrong((id *)&self->_commandRequiresNetworkTether, 0);
  objc_storeStrong((id *)&self->_commandDescription, 0);
  objc_storeStrong((id *)&self->_commandIdentifier, 0);
  objc_storeStrong((id *)&self->_commandType, 0);
}

@end
