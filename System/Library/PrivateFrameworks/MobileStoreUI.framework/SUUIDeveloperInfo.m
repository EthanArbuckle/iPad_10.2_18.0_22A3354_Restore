@implementation SUUIDeveloperInfo

- (SUUIDeveloperInfo)initWithDeveloperDictionary:(id)a3
{
  id v4;
  SUUIDeveloperInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *businessRegistrationIdentifier;
  void *v9;
  uint64_t v10;
  NSString *ecommerceRegistrationIdentifier;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *emailAddress;
  uint64_t v16;
  NSString *phoneNumber;
  void *v18;
  uint64_t v19;
  void *tradeRepresentativeName;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *administrativeArea;
  void *v31;
  uint64_t v32;
  NSString *country;
  void *v34;
  uint64_t v35;
  NSString *isoCountryCode;
  void *v37;
  uint64_t v38;
  NSString *locality;
  void *v40;
  uint64_t v41;
  NSString *postalCode;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSArray *addressLines;
  objc_super v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)SUUIDeveloperInfo;
  v5 = -[SUUIDeveloperInfo init](&v49, sel_init);
  if (!v5)
    goto LABEL_43;
  objc_msgSend(v4, "objectForKey:", CFSTR("businessRegistrationId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "copy");
    businessRegistrationIdentifier = v5->_businessRegistrationIdentifier;
    v5->_businessRegistrationIdentifier = (NSString *)v7;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("eCommerceRegistrationId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v9, "copy");
    ecommerceRegistrationIdentifier = v5->_ecommerceRegistrationIdentifier;
    v5->_ecommerceRegistrationIdentifier = (NSString *)v10;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("person"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("emailAddress"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v13, "copy");
      emailAddress = v5->_emailAddress;
      v5->_emailAddress = (NSString *)v14;

    }
    objc_msgSend(v12, "objectForKey:", CFSTR("phoneNumber"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v9, "copy");
      phoneNumber = v5->_phoneNumber;
      v5->_phoneNumber = (NSString *)v16;

    }
    objc_msgSend(v12, "objectForKey:", CFSTR("tradeRep"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = objc_msgSend(v18, "copy");
      tradeRepresentativeName = v5->_tradeRepresentativeName;
      v5->_tradeRepresentativeName = (NSString *)v19;
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(v12, "objectForKey:", CFSTR("firstName"));
    tradeRepresentativeName = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("lastName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v50[0] = tradeRepresentativeName;
      v50[1] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR(" "));
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v5->_tradeRepresentativeName;
      v5->_tradeRepresentativeName = (NSString *)v23;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = tradeRepresentativeName;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_22:

          goto LABEL_23;
        }
        v25 = v21;
      }
      v26 = objc_msgSend(v25, "copy");
      v22 = v5->_tradeRepresentativeName;
      v5->_tradeRepresentativeName = (NSString *)v26;
    }

    goto LABEL_22;
  }
LABEL_24:
  objc_msgSend(v4, "objectForKey:", CFSTR("address"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v27, "objectForKey:", CFSTR("state"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = objc_msgSend(v28, "copy");
      administrativeArea = v5->_administrativeArea;
      v5->_administrativeArea = (NSString *)v29;

    }
    objc_msgSend(v27, "objectForKey:", CFSTR("country"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = objc_msgSend(v31, "copy");
      country = v5->_country;
      v5->_country = (NSString *)v32;

    }
    objc_msgSend(v27, "objectForKey:", CFSTR("countryCode"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = objc_msgSend(v34, "copy");
      isoCountryCode = v5->_isoCountryCode;
      v5->_isoCountryCode = (NSString *)v35;

    }
    objc_msgSend(v27, "objectForKey:", CFSTR("city"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = objc_msgSend(v37, "copy");
      locality = v5->_locality;
      v5->_locality = (NSString *)v38;

    }
    objc_msgSend(v27, "objectForKey:", CFSTR("zipCode"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = objc_msgSend(v40, "copy");
      postalCode = v5->_postalCode;
      v5->_postalCode = (NSString *)v41;

    }
    v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v27, "objectForKey:", CFSTR("addressLine1"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v43, "addObject:", v44);
    objc_msgSend(v4, "objectForKey:", CFSTR("addressLine2"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v43, "addObject:", v45);
    objc_msgSend(v4, "objectForKey:", CFSTR("addressLine3"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v43, "addObject:", v9);
    v46 = objc_msgSend(v43, "copy");
    addressLines = v5->_addressLines;
    v5->_addressLines = (NSArray *)v46;

  }
LABEL_43:

  return v5;
}

- (id)formattedAddressString
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = SUUIContactsFramework();
  v4 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("CNMutablePostalAddress"), v3));
  v5 = v4;
  if (self->_administrativeArea)
    objc_msgSend(v4, "setState:");
  if (self->_country)
    objc_msgSend(v5, "setCountry:");
  if (self->_isoCountryCode)
    objc_msgSend(v5, "setISOCountryCode:");
  if (self->_locality)
    objc_msgSend(v5, "setCity:");
  if (self->_postalCode)
    objc_msgSend(v5, "setPostalCode:");
  -[NSArray componentsJoinedByString:](self->_addressLines, "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v5, "setStreet:", v6);
  v7 = SUUIContactsFramework();
  objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("CNPostalAddressFormatter"), v7), "singleLineStringFromPostalAddress:addCountryName:", v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAddressLines:", self->_addressLines);
  objc_msgSend(v4, "setAdministrativeArea:", self->_administrativeArea);
  objc_msgSend(v4, "setBusinessRegistrationIdentifier:", self->_businessRegistrationIdentifier);
  objc_msgSend(v4, "setCountry:", self->_country);
  objc_msgSend(v4, "setECommerceRegistrationIdentifier:", self->_ecommerceRegistrationIdentifier);
  objc_msgSend(v4, "setEmailAddress:", self->_emailAddress);
  objc_msgSend(v4, "setISOCountryCode:", self->_isoCountryCode);
  objc_msgSend(v4, "setLocality:", self->_locality);
  objc_msgSend(v4, "setPhoneNumber:", self->_phoneNumber);
  objc_msgSend(v4, "setPostalCode:", self->_postalCode);
  objc_msgSend(v4, "setTradeName:", self->_tradeName);
  objc_msgSend(v4, "setTradeRepresentativeName:", self->_tradeRepresentativeName);
  return v4;
}

- (NSArray)addressLines
{
  return self->_addressLines;
}

- (void)setAddressLines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)businessRegistrationIdentifier
{
  return self->_businessRegistrationIdentifier;
}

- (void)setBusinessRegistrationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)ECommerceRegistrationIdentifier
{
  return self->_ecommerceRegistrationIdentifier;
}

- (void)setECommerceRegistrationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)ISOCountryCode
{
  return self->_isoCountryCode;
}

- (void)setISOCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)tradeName
{
  return self->_tradeName;
}

- (void)setTradeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)tradeRepresentativeName
{
  return self->_tradeRepresentativeName;
}

- (void)setTradeRepresentativeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_tradeRepresentativeName, 0);
  objc_storeStrong((id *)&self->_tradeName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_ecommerceRegistrationIdentifier, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_businessRegistrationIdentifier, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_addressLines, 0);
}

@end
