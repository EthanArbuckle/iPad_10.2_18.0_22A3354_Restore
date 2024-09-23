@implementation CEMAccountLDAPDeclaration_LDAPSearchSettingsItem

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("LDAPSearchSettingDescription");
  v6[1] = CFSTR("LDAPSearchSettingSearchBase");
  v6[2] = CFSTR("LDAPSearchSettingScope");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithLDAPSearchSettingDescription:(id)a3 withLDAPSearchSettingSearchBase:(id)a4 withLDAPSearchSettingScope:(id)a5
{
  __CFString *v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;

  v7 = (__CFString *)a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setPayloadLDAPSearchSettingDescription:", v9);

  objc_msgSend(v10, "setPayloadLDAPSearchSettingSearchBase:", v8);
  if (v7)
    v11 = v7;
  else
    v11 = CFSTR("LDAPSearchSettingScopeSubtree");
  objc_msgSend(v10, "setPayloadLDAPSearchSettingScope:", v11);

  return v10;
}

+ (id)buildRequiredOnlyWithLDAPSearchSettingSearchBase:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadLDAPSearchSettingSearchBase:", v3);

  return v4;
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
  NSString *v13;
  id v14;
  NSString *payloadLDAPSearchSettingDescription;
  NSString *v16;
  NSString *payloadLDAPSearchSettingSearchBase;
  NSString *v18;
  NSString *payloadLDAPSearchSettingScope;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMAccountLDAPDeclaration_LDAPSearchSettingsItem allowedPayloadKeys](CEMAccountLDAPDeclaration_LDAPSearchSettingsItem, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LDAPSearchSettingDescription"), 0, 0, &v23);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadLDAPSearchSettingDescription = self->_payloadLDAPSearchSettingDescription;
  self->_payloadLDAPSearchSettingDescription = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LDAPSearchSettingSearchBase"), 1, 0, &v22);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadLDAPSearchSettingSearchBase = self->_payloadLDAPSearchSettingSearchBase;
    self->_payloadLDAPSearchSettingSearchBase = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LDAPSearchSettingScope"), 0, CFSTR("LDAPSearchSettingScopeSubtree"), &v21);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadLDAPSearchSettingScope = self->_payloadLDAPSearchSettingScope;
      self->_payloadLDAPSearchSettingScope = v18;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("LDAPSearchSettingDescription"), self->_payloadLDAPSearchSettingDescription, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("LDAPSearchSettingSearchBase"), self->_payloadLDAPSearchSettingSearchBase, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("LDAPSearchSettingScope"), self->_payloadLDAPSearchSettingScope, 0, CFSTR("LDAPSearchSettingScopeSubtree"));
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEMAccountLDAPDeclaration_LDAPSearchSettingsItem;
  v4 = -[CEMPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadLDAPSearchSettingDescription, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadLDAPSearchSettingSearchBase, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadLDAPSearchSettingScope, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadLDAPSearchSettingDescription
{
  return self->_payloadLDAPSearchSettingDescription;
}

- (void)setPayloadLDAPSearchSettingDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadLDAPSearchSettingSearchBase
{
  return self->_payloadLDAPSearchSettingSearchBase;
}

- (void)setPayloadLDAPSearchSettingSearchBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadLDAPSearchSettingScope
{
  return self->_payloadLDAPSearchSettingScope;
}

- (void)setPayloadLDAPSearchSettingScope:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLDAPSearchSettingScope, 0);
  objc_storeStrong((id *)&self->_payloadLDAPSearchSettingSearchBase, 0);
  objc_storeStrong((id *)&self->_payloadLDAPSearchSettingDescription, 0);
}

@end
