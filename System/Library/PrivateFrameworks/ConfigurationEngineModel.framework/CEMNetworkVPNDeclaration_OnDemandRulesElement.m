@implementation CEMNetworkVPNDeclaration_OnDemandRulesElement

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("DNSDomainMatch");
  v6[1] = CFSTR("DNSServerAddressMatch");
  v6[2] = CFSTR("URLStringProbe");
  v6[3] = CFSTR("Action");
  v6[4] = CFSTR("ActionParameters");
  v6[5] = CFSTR("InterfaceTypeMatch");
  v6[6] = CFSTR("SSIDMatch");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithDNSDomainMatch:(id)a3 withDNSServerAddressMatch:(id)a4 withURLStringProbe:(id)a5 withAction:(id)a6 withActionParameters:(id)a7 withInterfaceTypeMatch:(id)a8 withSSIDMatch:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setPayloadDNSDomainMatch:", v21);

  objc_msgSend(v22, "setPayloadDNSServerAddressMatch:", v20);
  objc_msgSend(v22, "setPayloadURLStringProbe:", v19);

  objc_msgSend(v22, "setPayloadAction:", v18);
  objc_msgSend(v22, "setPayloadActionParameters:", v17);

  objc_msgSend(v22, "setPayloadInterfaceTypeMatch:", v16);
  objc_msgSend(v22, "setPayloadSSIDMatch:", v15);

  return v22;
}

+ (id)buildRequiredOnlyWithAction:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadAction:", v3);

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
  NSArray *v13;
  id v14;
  NSArray *payloadDNSDomainMatch;
  NSArray *v16;
  NSArray *payloadDNSServerAddressMatch;
  NSString *v18;
  NSString *payloadURLStringProbe;
  NSString *v20;
  NSString *payloadAction;
  CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters *v22;
  CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters *payloadActionParameters;
  NSString *v24;
  NSString *payloadInterfaceTypeMatch;
  NSArray *v26;
  NSArray *payloadSSIDMatch;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkVPNDeclaration_OnDemandRulesElement allowedPayloadKeys](CEMNetworkVPNDeclaration_OnDemandRulesElement, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v35 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("DNSDomainMatch"), &__block_literal_global_371, 0, 0, &v35);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = v35;
  payloadDNSDomainMatch = self->_payloadDNSDomainMatch;
  self->_payloadDNSDomainMatch = v13;

  if (!v14)
  {
    v34 = 0;
    -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("DNSServerAddressMatch"), &__block_literal_global_372, 0, 0, &v34);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = v34;
    payloadDNSServerAddressMatch = self->_payloadDNSServerAddressMatch;
    self->_payloadDNSServerAddressMatch = v16;

    if (!v14)
    {
      v33 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("URLStringProbe"), 0, 0, &v33);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v33;
      payloadURLStringProbe = self->_payloadURLStringProbe;
      self->_payloadURLStringProbe = v18;

      if (!v14)
      {
        v32 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Action"), 1, 0, &v32);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v32;
        payloadAction = self->_payloadAction;
        self->_payloadAction = v20;

        if (!v14)
        {
          v31 = 0;
          -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("ActionParameters"), objc_opt_class(), 0, 0, &v31);
          v22 = (CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters *)objc_claimAutoreleasedReturnValue();
          v14 = v31;
          payloadActionParameters = self->_payloadActionParameters;
          self->_payloadActionParameters = v22;

          if (!v14)
          {
            v30 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("InterfaceTypeMatch"), 0, 0, &v30);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v30;
            payloadInterfaceTypeMatch = self->_payloadInterfaceTypeMatch;
            self->_payloadInterfaceTypeMatch = v24;

            if (!v14)
            {
              v29 = 0;
              -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("SSIDMatch"), &__block_literal_global_374, 0, 0, &v29);
              v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
              v14 = v29;
              payloadSSIDMatch = self->_payloadSSIDMatch;
              self->_payloadSSIDMatch = v26;

            }
          }
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
  id v4;
  void *v5;
  CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters *payloadActionParameters;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("DNSDomainMatch"), self->_payloadDNSDomainMatch, &__block_literal_global_375, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("DNSServerAddressMatch"), self->_payloadDNSServerAddressMatch, &__block_literal_global_376, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("URLStringProbe"), self->_payloadURLStringProbe, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Action"), self->_payloadAction, 1, 0);
  payloadActionParameters = self->_payloadActionParameters;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __84__CEMNetworkVPNDeclaration_OnDemandRulesElement_serializePayloadWithAssetProviders___block_invoke_3;
  v10[3] = &unk_24C638560;
  v11 = v4;
  v7 = v4;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("ActionParameters"), payloadActionParameters, v10, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("InterfaceTypeMatch"), self->_payloadInterfaceTypeMatch, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("SSIDMatch"), self->_payloadSSIDMatch, &__block_literal_global_377, 0, 0);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CEMNetworkVPNDeclaration_OnDemandRulesElement;
  v4 = -[CEMPayloadBase copyWithZone:](&v20, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadDNSDomainMatch, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_payloadDNSServerAddressMatch, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadURLStringProbe, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadAction, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters copy](self->_payloadActionParameters, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_payloadInterfaceTypeMatch, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSArray copy](self->_payloadSSIDMatch, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  return v4;
}

- (NSArray)payloadDNSDomainMatch
{
  return self->_payloadDNSDomainMatch;
}

- (void)setPayloadDNSDomainMatch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)payloadDNSServerAddressMatch
{
  return self->_payloadDNSServerAddressMatch;
}

- (void)setPayloadDNSServerAddressMatch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadURLStringProbe
{
  return self->_payloadURLStringProbe;
}

- (void)setPayloadURLStringProbe:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadAction
{
  return self->_payloadAction;
}

- (void)setPayloadAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CEMNetworkVPNDeclaration_OnDemandRulesElementActionParameters)payloadActionParameters
{
  return self->_payloadActionParameters;
}

- (void)setPayloadActionParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadInterfaceTypeMatch
{
  return self->_payloadInterfaceTypeMatch;
}

- (void)setPayloadInterfaceTypeMatch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)payloadSSIDMatch
{
  return self->_payloadSSIDMatch;
}

- (void)setPayloadSSIDMatch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSSIDMatch, 0);
  objc_storeStrong((id *)&self->_payloadInterfaceTypeMatch, 0);
  objc_storeStrong((id *)&self->_payloadActionParameters, 0);
  objc_storeStrong((id *)&self->_payloadAction, 0);
  objc_storeStrong((id *)&self->_payloadURLStringProbe, 0);
  objc_storeStrong((id *)&self->_payloadDNSServerAddressMatch, 0);
  objc_storeStrong((id *)&self->_payloadDNSDomainMatch, 0);
}

@end
