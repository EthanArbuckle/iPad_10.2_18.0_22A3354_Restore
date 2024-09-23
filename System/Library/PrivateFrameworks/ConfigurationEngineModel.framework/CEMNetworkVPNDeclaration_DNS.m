@implementation CEMNetworkVPNDeclaration_DNS

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("ServerAddresses");
  v6[1] = CFSTR("SearchDomains");
  v6[2] = CFSTR("DomainName");
  v6[3] = CFSTR("SupplementalMatchDomains");
  v6[4] = CFSTR("SupplementalMatchDomainsNoSearch");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithServerAddresses:(id)a3 withSearchDomains:(id)a4 withDomainName:(id)a5 withSupplementalMatchDomains:(id)a6 withSupplementalMatchDomainsNoSearch:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setPayloadServerAddresses:", v15);

  objc_msgSend(v16, "setPayloadSearchDomains:", v14);
  objc_msgSend(v16, "setPayloadDomainName:", v13);

  objc_msgSend(v16, "setPayloadSupplementalMatchDomains:", v12);
  if (v11)
    v17 = v11;
  else
    v17 = &unk_24C69CD58;
  objc_msgSend(v16, "setPayloadSupplementalMatchDomainsNoSearch:", v17);

  return v16;
}

+ (id)buildRequiredOnlyWithServerAddresses:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadServerAddresses:", v3);

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
  NSArray *payloadServerAddresses;
  NSArray *v16;
  NSArray *payloadSearchDomains;
  NSString *v18;
  NSString *payloadDomainName;
  NSArray *v20;
  NSArray *payloadSupplementalMatchDomains;
  NSNumber *v22;
  NSNumber *payloadSupplementalMatchDomainsNoSearch;
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

  +[CEMNetworkVPNDeclaration_DNS allowedPayloadKeys](CEMNetworkVPNDeclaration_DNS, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("ServerAddresses"), &__block_literal_global_1023, 1, 0, &v29);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadServerAddresses = self->_payloadServerAddresses;
  self->_payloadServerAddresses = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("SearchDomains"), &__block_literal_global_1024, 0, 0, &v28);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadSearchDomains = self->_payloadSearchDomains;
    self->_payloadSearchDomains = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DomainName"), 0, 0, &v27);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadDomainName = self->_payloadDomainName;
      self->_payloadDomainName = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("SupplementalMatchDomains"), &__block_literal_global_1025, 0, 0, &v26);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadSupplementalMatchDomains = self->_payloadSupplementalMatchDomains;
        self->_payloadSupplementalMatchDomains = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SupplementalMatchDomainsNoSearch"), 0, &unk_24C69CD58, &v25);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadSupplementalMatchDomainsNoSearch = self->_payloadSupplementalMatchDomainsNoSearch;
          self->_payloadSupplementalMatchDomainsNoSearch = v22;

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
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("ServerAddresses"), self->_payloadServerAddresses, &__block_literal_global_1026, 1, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("SearchDomains"), self->_payloadSearchDomains, &__block_literal_global_1027, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DomainName"), self->_payloadDomainName, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("SupplementalMatchDomains"), self->_payloadSupplementalMatchDomains, &__block_literal_global_1028, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("SupplementalMatchDomainsNoSearch"), self->_payloadSupplementalMatchDomainsNoSearch, 0, &unk_24C69CD58);
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
  v16.super_class = (Class)CEMNetworkVPNDeclaration_DNS;
  v4 = -[CEMPayloadBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadServerAddresses, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_payloadSearchDomains, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadDomainName, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSArray copy](self->_payloadSupplementalMatchDomains, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadSupplementalMatchDomainsNoSearch, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSArray)payloadServerAddresses
{
  return self->_payloadServerAddresses;
}

- (void)setPayloadServerAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)payloadSearchDomains
{
  return self->_payloadSearchDomains;
}

- (void)setPayloadSearchDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadDomainName
{
  return self->_payloadDomainName;
}

- (void)setPayloadDomainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)payloadSupplementalMatchDomains
{
  return self->_payloadSupplementalMatchDomains;
}

- (void)setPayloadSupplementalMatchDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadSupplementalMatchDomainsNoSearch
{
  return self->_payloadSupplementalMatchDomainsNoSearch;
}

- (void)setPayloadSupplementalMatchDomainsNoSearch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSupplementalMatchDomainsNoSearch, 0);
  objc_storeStrong((id *)&self->_payloadSupplementalMatchDomains, 0);
  objc_storeStrong((id *)&self->_payloadDomainName, 0);
  objc_storeStrong((id *)&self->_payloadSearchDomains, 0);
  objc_storeStrong((id *)&self->_payloadServerAddresses, 0);
}

@end
