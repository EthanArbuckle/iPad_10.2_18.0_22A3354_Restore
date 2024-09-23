@implementation CEMNSExtensionsMappingsNSExtensionsCommand_StatusExtensionsItem

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Identifier");
  v6[1] = CFSTR("ExtensionPoint");
  v6[2] = CFSTR("DisplayName");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setStatusIdentifier:", v9);

  objc_msgSend(v10, "setStatusExtensionPoint:", v8);
  objc_msgSend(v10, "setStatusDisplayName:", v7);

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setStatusIdentifier:", v9);

  objc_msgSend(v10, "setStatusExtensionPoint:", v8);
  objc_msgSend(v10, "setStatusDisplayName:", v7);

  return v10;
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
  NSString *v15;
  NSString *statusIdentifier;
  NSString *v17;
  NSString *statusExtensionPoint;
  NSString *v19;
  NSString *statusDisplayName;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNSExtensionsMappingsNSExtensionsCommand_StatusExtensionsItem allowedStatusKeys](CEMNSExtensionsMappingsNSExtensionsCommand_StatusExtensionsItem, "allowedStatusKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_12;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v24 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Identifier"), 1, 0, &v24);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = v24;
    statusIdentifier = self->_statusIdentifier;
    self->_statusIdentifier = v15;

    if (!v12)
    {
      v23 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ExtensionPoint"), 1, 0, &v23);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      v12 = v23;
      statusExtensionPoint = self->_statusExtensionPoint;
      self->_statusExtensionPoint = v17;

      if (!v12)
      {
        v22 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisplayName"), 1, 0, &v22);
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = v22;
        statusDisplayName = self->_statusDisplayName;
        self->_statusDisplayName = v19;

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

LABEL_12:
  return v14;
}

- (id)serializePayload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Identifier"), self->_statusIdentifier, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ExtensionPoint"), self->_statusExtensionPoint, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DisplayName"), self->_statusDisplayName, 1, 0);
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEMNSExtensionsMappingsNSExtensionsCommand_StatusExtensionsItem;
  v4 = -[CEMPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_statusExtensionPoint, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_statusDisplayName, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)statusIdentifier
{
  return self->_statusIdentifier;
}

- (void)setStatusIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)statusExtensionPoint
{
  return self->_statusExtensionPoint;
}

- (void)setStatusExtensionPoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)statusDisplayName
{
  return self->_statusDisplayName;
}

- (void)setStatusDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDisplayName, 0);
  objc_storeStrong((id *)&self->_statusExtensionPoint, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end
