@implementation CEMSecuritySingleSignOnDeclaration_Kerberos

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("PrincipalName");
  v6[1] = CFSTR("PayloadCertificateUUID");
  v6[2] = CFSTR("Realm");
  v6[3] = CFSTR("URLPrefixMatches");
  v6[4] = CFSTR("AppIdentifierMatches");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithPrincipalName:(id)a3 withPayloadCertificateUUID:(id)a4 withRealm:(id)a5 withURLPrefixMatches:(id)a6 withAppIdentifierMatches:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setPayloadPrincipalName:", v15);

  objc_msgSend(v16, "setPayloadPayloadCertificateUUID:", v14);
  objc_msgSend(v16, "setPayloadRealm:", v13);

  objc_msgSend(v16, "setPayloadURLPrefixMatches:", v12);
  objc_msgSend(v16, "setPayloadAppIdentifierMatches:", v11);

  return v16;
}

+ (id)buildRequiredOnlyWithRealm:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadRealm:", v3);

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
  NSString *payloadPrincipalName;
  NSString *v16;
  NSString *payloadPayloadCertificateUUID;
  NSString *v18;
  NSString *payloadRealm;
  NSArray *v20;
  NSArray *payloadURLPrefixMatches;
  NSArray *v22;
  NSArray *payloadAppIdentifierMatches;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSecuritySingleSignOnDeclaration_Kerberos allowedPayloadKeys](CEMSecuritySingleSignOnDeclaration_Kerberos, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PrincipalName"), 0, 0, &v29);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadPrincipalName = self->_payloadPrincipalName;
  self->_payloadPrincipalName = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PayloadCertificateUUID"), 0, 0, &v28);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadPayloadCertificateUUID = self->_payloadPayloadCertificateUUID;
    self->_payloadPayloadCertificateUUID = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Realm"), 1, 0, &v27);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadRealm = self->_payloadRealm;
      self->_payloadRealm = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("URLPrefixMatches"), &__block_literal_global_36, 0, 0, &v26);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadURLPrefixMatches = self->_payloadURLPrefixMatches;
        self->_payloadURLPrefixMatches = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("AppIdentifierMatches"), &__block_literal_global_109, 0, 0, &v25);
          v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadAppIdentifierMatches = self->_payloadAppIdentifierMatches;
          self->_payloadAppIdentifierMatches = v22;

        }
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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("PrincipalName"), self->_payloadPrincipalName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("PayloadCertificateUUID"), self->_payloadPayloadCertificateUUID, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Realm"), self->_payloadRealm, 1, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("URLPrefixMatches"), self->_payloadURLPrefixMatches, &__block_literal_global_111, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("AppIdentifierMatches"), self->_payloadAppIdentifierMatches, &__block_literal_global_112, 0, 0);
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
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMSecuritySingleSignOnDeclaration_Kerberos;
  v4 = -[CEMPayloadBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadPrincipalName, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadPayloadCertificateUUID, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadRealm, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSArray copy](self->_payloadURLPrefixMatches, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSArray copy](self->_payloadAppIdentifierMatches, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)payloadPrincipalName
{
  return self->_payloadPrincipalName;
}

- (void)setPayloadPrincipalName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadPayloadCertificateUUID
{
  return self->_payloadPayloadCertificateUUID;
}

- (void)setPayloadPayloadCertificateUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadRealm
{
  return self->_payloadRealm;
}

- (void)setPayloadRealm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)payloadURLPrefixMatches
{
  return self->_payloadURLPrefixMatches;
}

- (void)setPayloadURLPrefixMatches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)payloadAppIdentifierMatches
{
  return self->_payloadAppIdentifierMatches;
}

- (void)setPayloadAppIdentifierMatches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAppIdentifierMatches, 0);
  objc_storeStrong((id *)&self->_payloadURLPrefixMatches, 0);
  objc_storeStrong((id *)&self->_payloadRealm, 0);
  objc_storeStrong((id *)&self->_payloadPayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadPrincipalName, 0);
}

@end
