@implementation CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Domains");
  v6[1] = CFSTR("DomainAction");
  v6[2] = CFSTR("RequiredDNSServers");
  v6[3] = CFSTR("RequiredURLStringProbe");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithDomains:(id)a3 withDomainAction:(id)a4 withRequiredDNSServers:(id)a5 withRequiredURLStringProbe:(id)a6
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
  objc_msgSend(v13, "setPayloadDomains:", v12);

  objc_msgSend(v13, "setPayloadDomainAction:", v11);
  objc_msgSend(v13, "setPayloadRequiredDNSServers:", v10);

  objc_msgSend(v13, "setPayloadRequiredURLStringProbe:", v9);
  return v13;
}

+ (id)buildRequiredOnlyWithDomains:(id)a3 withDomainAction:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadDomains:", v6);

  objc_msgSend(v7, "setPayloadDomainAction:", v5);
  return v7;
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
  NSArray *v13;
  id v14;
  NSArray *payloadDomains;
  NSString *v16;
  NSString *payloadDomainAction;
  NSArray *v18;
  NSArray *payloadRequiredDNSServers;
  NSString *v20;
  NSString *payloadRequiredURLStringProbe;
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

  +[CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters allowedPayloadKeys](CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("Domains"), &__block_literal_global_432, 1, 0, &v26);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadDomains = self->_payloadDomains;
  self->_payloadDomains = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DomainAction"), 1, 0, &v25);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadDomainAction = self->_payloadDomainAction;
    self->_payloadDomainAction = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("RequiredDNSServers"), &__block_literal_global_433, 0, 0, &v24);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadRequiredDNSServers = self->_payloadRequiredDNSServers;
      self->_payloadRequiredDNSServers = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RequiredURLStringProbe"), 0, 0, &v23);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadRequiredURLStringProbe = self->_payloadRequiredURLStringProbe;
        self->_payloadRequiredURLStringProbe = v20;

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
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("Domains"), self->_payloadDomains, &__block_literal_global_434, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DomainAction"), self->_payloadDomainAction, 1, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("RequiredDNSServers"), self->_payloadRequiredDNSServers, &__block_literal_global_435, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("RequiredURLStringProbe"), self->_payloadRequiredURLStringProbe, 0, 0);
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
  v14.super_class = (Class)CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters;
  v4 = -[CEMPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadDomains, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadDomainAction, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_payloadRequiredDNSServers, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadRequiredURLStringProbe, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSArray)payloadDomains
{
  return self->_payloadDomains;
}

- (void)setPayloadDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadDomainAction
{
  return self->_payloadDomainAction;
}

- (void)setPayloadDomainAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadRequiredDNSServers
{
  return self->_payloadRequiredDNSServers;
}

- (void)setPayloadRequiredDNSServers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadRequiredURLStringProbe
{
  return self->_payloadRequiredURLStringProbe;
}

- (void)setPayloadRequiredURLStringProbe:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRequiredURLStringProbe, 0);
  objc_storeStrong((id *)&self->_payloadRequiredDNSServers, 0);
  objc_storeStrong((id *)&self->_payloadDomainAction, 0);
  objc_storeStrong((id *)&self->_payloadDomains, 0);
}

@end
