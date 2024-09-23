@implementation CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("FirewallEnabled");
  v6[1] = CFSTR("BlockAllIncoming");
  v6[2] = CFSTR("StealthMode");
  v6[3] = CFSTR("Applications");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithFirewallEnabled:(id)a3 withBlockAllIncoming:(id)a4 withStealthMode:(id)a5 withApplications:(id)a6
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
  objc_msgSend(v13, "setStatusFirewallEnabled:", v12);

  objc_msgSend(v13, "setStatusBlockAllIncoming:", v11);
  objc_msgSend(v13, "setStatusStealthMode:", v10);

  objc_msgSend(v13, "setStatusApplications:", v9);
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
  NSNumber *v15;
  NSNumber *statusFirewallEnabled;
  NSNumber *v17;
  NSNumber *statusBlockAllIncoming;
  NSNumber *v19;
  NSNumber *statusStealthMode;
  NSArray *v21;
  NSArray *statusApplications;
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

  +[CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings allowedStatusKeys](CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings, "allowedStatusKeys");
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
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FirewallEnabled"), 0, 0, &v27);
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v12 = v27;
    statusFirewallEnabled = self->_statusFirewallEnabled;
    self->_statusFirewallEnabled = v15;

    if (!v12)
    {
      v26 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BlockAllIncoming"), 0, 0, &v26);
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v12 = v26;
      statusBlockAllIncoming = self->_statusBlockAllIncoming;
      self->_statusBlockAllIncoming = v17;

      if (!v12)
      {
        v25 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("StealthMode"), 0, 0, &v25);
        v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v12 = v25;
        statusStealthMode = self->_statusStealthMode;
        self->_statusStealthMode = v19;

        if (!v12)
        {
          v24 = 0;
          -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("Applications"), objc_opt_class(), 0, 0, 0, &v24);
          v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v12 = v24;
          statusApplications = self->_statusApplications;
          self->_statusApplications = v21;

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
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("FirewallEnabled"), self->_statusFirewallEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("BlockAllIncoming"), self->_statusBlockAllIncoming, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("StealthMode"), self->_statusStealthMode, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v3, CFSTR("Applications"), self->_statusApplications, &__block_literal_global_220, 0, 0);
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
  v14.super_class = (Class)CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings;
  v4 = -[CEMPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_statusFirewallEnabled, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_statusBlockAllIncoming, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_statusStealthMode, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSArray copy](self->_statusApplications, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSNumber)statusFirewallEnabled
{
  return self->_statusFirewallEnabled;
}

- (void)setStatusFirewallEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)statusBlockAllIncoming
{
  return self->_statusBlockAllIncoming;
}

- (void)setStatusBlockAllIncoming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)statusStealthMode
{
  return self->_statusStealthMode;
}

- (void)setStatusStealthMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)statusApplications
{
  return self->_statusApplications;
}

- (void)setStatusApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusApplications, 0);
  objc_storeStrong((id *)&self->_statusStealthMode, 0);
  objc_storeStrong((id *)&self->_statusBlockAllIncoming, 0);
  objc_storeStrong((id *)&self->_statusFirewallEnabled, 0);
}

@end
