@implementation CEMCredentialSCEPDeclaration_SCEPSubjectAltName

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("rfc822Name");
  v6[1] = CFSTR("dNSName");
  v6[2] = CFSTR("uniformResourceIdentifier");
  v6[3] = CFSTR("ntPrincipalName");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithRfc822Name:(id)a3 withDNSName:(id)a4 withUniformResourceIdentifier:(id)a5 withNtPrincipalName:(id)a6
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
  objc_msgSend(v13, "setPayloadRfc822Name:", v12);

  objc_msgSend(v13, "setPayloadDNSName:", v11);
  objc_msgSend(v13, "setPayloadUniformResourceIdentifier:", v10);

  objc_msgSend(v13, "setPayloadNtPrincipalName:", v9);
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
  NSString *v13;
  id v14;
  NSString *payloadRfc822Name;
  NSString *v16;
  NSString *payloadDNSName;
  NSString *v18;
  NSString *payloadUniformResourceIdentifier;
  NSString *v20;
  NSString *payloadNtPrincipalName;
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

  +[CEMCredentialSCEPDeclaration_SCEPSubjectAltName allowedPayloadKeys](CEMCredentialSCEPDeclaration_SCEPSubjectAltName, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("rfc822Name"), 0, 0, &v26);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadRfc822Name = self->_payloadRfc822Name;
  self->_payloadRfc822Name = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("dNSName"), 0, 0, &v25);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadDNSName = self->_payloadDNSName;
    self->_payloadDNSName = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("uniformResourceIdentifier"), 0, 0, &v24);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadUniformResourceIdentifier = self->_payloadUniformResourceIdentifier;
      self->_payloadUniformResourceIdentifier = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ntPrincipalName"), 0, 0, &v23);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadNtPrincipalName = self->_payloadNtPrincipalName;
        self->_payloadNtPrincipalName = v20;

      }
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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("rfc822Name"), self->_payloadRfc822Name, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("dNSName"), self->_payloadDNSName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("uniformResourceIdentifier"), self->_payloadUniformResourceIdentifier, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ntPrincipalName"), self->_payloadNtPrincipalName, 0, 0);
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
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMCredentialSCEPDeclaration_SCEPSubjectAltName;
  v4 = -[CEMPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadRfc822Name, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadDNSName, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadUniformResourceIdentifier, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadNtPrincipalName, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadRfc822Name
{
  return self->_payloadRfc822Name;
}

- (void)setPayloadRfc822Name:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadDNSName
{
  return self->_payloadDNSName;
}

- (void)setPayloadDNSName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadUniformResourceIdentifier
{
  return self->_payloadUniformResourceIdentifier;
}

- (void)setPayloadUniformResourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadNtPrincipalName
{
  return self->_payloadNtPrincipalName;
}

- (void)setPayloadNtPrincipalName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNtPrincipalName, 0);
  objc_storeStrong((id *)&self->_payloadUniformResourceIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDNSName, 0);
  objc_storeStrong((id *)&self->_payloadRfc822Name, 0);
}

@end
