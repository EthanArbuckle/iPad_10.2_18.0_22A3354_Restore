@implementation CNPostalAddress

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0D13A08];
  -[CNPostalAddress street](self, "street");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPostalAddress subLocality](self, "subLocality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPostalAddress city](self, "city");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPostalAddress subAdministrativeArea](self, "subAdministrativeArea");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPostalAddress state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPostalAddress postalCode](self, "postalCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPostalAddress country](self, "country");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPostalAddress ISOCountryCode](self, "ISOCountryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForObject:withNamesAndObjects:", self, CFSTR("street"), v4, CFSTR("subLocality"), v5, CFSTR("city"), v6, CFSTR("subAdministrativeArea"), v7, CFSTR("state"), v8, CFSTR("postalCode"), v9, CFSTR("country"), v10, CFSTR("countryCode"), v11,
    0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)street
{
  if (self->_street)
    return self->_street;
  else
    return (NSString *)&stru_1E29FF900;
}

- (NSString)city
{
  if (self->_city)
    return self->_city;
  else
    return (NSString *)&stru_1E29FF900;
}

- (NSString)state
{
  if (self->_state)
    return self->_state;
  else
    return (NSString *)&stru_1E29FF900;
}

- (NSString)postalCode
{
  if (self->_postalCode)
    return self->_postalCode;
  else
    return (NSString *)&stru_1E29FF900;
}

- (NSString)country
{
  if (self->_country)
    return self->_country;
  else
    return (NSString *)&stru_1E29FF900;
}

- (NSString)subLocality
{
  if (self->_subLocality)
    return self->_subLocality;
  else
    return (NSString *)&stru_1E29FF900;
}

- (NSString)subAdministrativeArea
{
  if (self->_subAdministrativeArea)
    return self->_subAdministrativeArea;
  else
    return (NSString *)&stru_1E29FF900;
}

- (NSString)formattedAddress
{
  return self->_formattedAddress;
}

- (NSString)ISOCountryCode
{
  if (self->_ISOCountryCode)
    return self->_ISOCountryCode;
  else
    return (NSString *)&stru_1E29FF900;
}

- (CNPostalAddress)initWithCoder:(id)a3
{
  id v4;
  CNPostalAddress *v5;
  void *v6;
  uint64_t v7;
  NSString *street;
  void *v9;
  uint64_t v10;
  NSString *subLocality;
  void *v12;
  uint64_t v13;
  NSString *city;
  void *v15;
  uint64_t v16;
  NSString *subAdministrativeArea;
  void *v18;
  uint64_t v19;
  NSString *state;
  void *v21;
  uint64_t v22;
  NSString *postalCode;
  void *v24;
  uint64_t v25;
  NSString *country;
  void *v27;
  uint64_t v28;
  NSString *ISOCountryCode;
  void *v30;
  uint64_t v31;
  NSString *formattedAddress;
  CNPostalAddress *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CNPostalAddress;
  v5 = -[CNPostalAddress init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_street"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    street = v5->_street;
    v5->_street = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subLocality"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    subLocality = v5->_subLocality;
    v5->_subLocality = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_city"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    city = v5->_city;
    v5->_city = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subAdministrativeArea"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    subAdministrativeArea = v5->_subAdministrativeArea;
    v5->_subAdministrativeArea = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_state"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    state = v5->_state;
    v5->_state = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_postalCode"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_country"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    country = v5->_country;
    v5->_country = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ISOCountryCode"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    ISOCountryCode = v5->_ISOCountryCode;
    v5->_ISOCountryCode = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_formattedAddress"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    formattedAddress = v5->_formattedAddress;
    v5->_formattedAddress = (NSString *)v31;

    v33 = v5;
  }

  return v5;
}

- (void)setStreet:(id)a3
{
  NSString *v4;
  NSString *street;

  if (self->_street != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    street = self->_street;
    self->_street = v4;

  }
}

- (void)setCity:(id)a3
{
  NSString *v4;
  NSString *city;

  if (self->_city != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    city = self->_city;
    self->_city = v4;

  }
}

- (void)setState:(id)a3
{
  NSString *v4;
  NSString *state;

  if (self->_state != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    state = self->_state;
    self->_state = v4;

  }
}

- (void)setPostalCode:(id)a3
{
  NSString *v4;
  NSString *postalCode;

  if (self->_postalCode != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    postalCode = self->_postalCode;
    self->_postalCode = v4;

  }
}

- (void)setISOCountryCode:(id)a3
{
  NSString *v4;
  NSString *ISOCountryCode;

  if (self->_ISOCountryCode != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    ISOCountryCode = self->_ISOCountryCode;
    self->_ISOCountryCode = v4;

  }
}

- (void)setCountry:(id)a3
{
  NSString *v4;
  NSString *country;

  if (self->_country != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    country = self->_country;
    self->_country = v4;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedAddress, 0);
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_street, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *street;
  id v5;

  street = self->_street;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", street, CFSTR("_street"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subLocality, CFSTR("_subLocality"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_city, CFSTR("_city"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subAdministrativeArea, CFSTR("_subAdministrativeArea"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("_state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalCode, CFSTR("_postalCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_country, CFSTR("_country"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ISOCountryCode, CFSTR("_ISOCountryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formattedAddress, CFSTR("_formattedAddress"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (CNPostalAddress)postalAddressWithAddressBookDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  CNPostalAddress *v6;

  v3 = a3;
  if (v3)
  {
    +[CN postalAddressesDescription](CN, "postalAddressesDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CNLabeledValueValueFromABMultiValueValue:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CNPostalAddress *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = objc_alloc_init(CNPostalAddress);
  }

  return v6;
}

- (id)addressBookDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  +[CN postalAddressesDescription](CN, "postalAddressesDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ABMultiValueValueFromCNLabeledValueValue:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

+ (NSString)localizedStringForKey:(NSString *)key
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D13A98], "localizedStringForString:class:returningNilIfNotFound:", key, a1, 1);
}

+ (CNPostalAddress)postalAddressWithDictionaryRepresentation:(id)a3
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;

  v3 = a3;
  +[CN postalAddressFromDictionaryTransform](CN, "postalAddressFromDictionaryTransform");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v4)[2](v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNPostalAddress *)v5;
}

- (id)dictionaryRepresentation
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;

  +[CN postalAddressToDictionaryTransform](CN, "postalAddressToDictionaryTransform");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, CNPostalAddress *))v3)[2](v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CNPostalAddress)initWithPostalAddress:(id)a3
{
  id *v4;
  CNPostalAddress *v5;
  uint64_t v6;
  NSString *street;
  uint64_t v8;
  NSString *subLocality;
  uint64_t v10;
  NSString *city;
  uint64_t v12;
  NSString *subAdministrativeArea;
  uint64_t v14;
  NSString *state;
  uint64_t v16;
  NSString *postalCode;
  uint64_t v18;
  NSString *country;
  uint64_t v20;
  NSString *ISOCountryCode;
  uint64_t v22;
  NSString *formattedAddress;
  CNPostalAddress *v24;
  objc_super v26;

  v4 = (id *)a3;
  v26.receiver = self;
  v26.super_class = (Class)CNPostalAddress;
  v5 = -[CNPostalAddress init](&v26, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4[1], "copy");
    street = v5->_street;
    v5->_street = (NSString *)v6;

    v8 = objc_msgSend(v4[2], "copy");
    subLocality = v5->_subLocality;
    v5->_subLocality = (NSString *)v8;

    v10 = objc_msgSend(v4[3], "copy");
    city = v5->_city;
    v5->_city = (NSString *)v10;

    v12 = objc_msgSend(v4[4], "copy");
    subAdministrativeArea = v5->_subAdministrativeArea;
    v5->_subAdministrativeArea = (NSString *)v12;

    v14 = objc_msgSend(v4[5], "copy");
    state = v5->_state;
    v5->_state = (NSString *)v14;

    v16 = objc_msgSend(v4[6], "copy");
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v16;

    v18 = objc_msgSend(v4[7], "copy");
    country = v5->_country;
    v5->_country = (NSString *)v18;

    v20 = objc_msgSend(v4[8], "copy");
    ISOCountryCode = v5->_ISOCountryCode;
    v5->_ISOCountryCode = (NSString *)v20;

    v22 = objc_msgSend(v4[9], "copy");
    formattedAddress = v5->_formattedAddress;
    v5->_formattedAddress = (NSString *)v22;

    v24 = v5;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CNPostalAddress initWithPostalAddress:]([CNMutablePostalAddress alloc], "initWithPostalAddress:", self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD aBlock[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v4 = a3;
  v22 = (void *)MEMORY[0x1E0D13A40];
  v21 = objc_opt_class();
  v5 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __27__CNPostalAddress_isEqual___block_invoke;
  v37[3] = &unk_1E29F7D70;
  v37[4] = self;
  v38 = v4;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __27__CNPostalAddress_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v6 = v38;
  v36 = v6;
  v7 = _Block_copy(aBlock);
  v33[0] = v5;
  v33[1] = 3221225472;
  v33[2] = __27__CNPostalAddress_isEqual___block_invoke_3;
  v33[3] = &unk_1E29F7D70;
  v33[4] = self;
  v8 = v6;
  v34 = v8;
  v9 = _Block_copy(v33);
  v31[0] = v5;
  v31[1] = 3221225472;
  v31[2] = __27__CNPostalAddress_isEqual___block_invoke_4;
  v31[3] = &unk_1E29F7D70;
  v31[4] = self;
  v10 = v8;
  v32 = v10;
  v11 = _Block_copy(v31);
  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __27__CNPostalAddress_isEqual___block_invoke_5;
  v29[3] = &unk_1E29F7D70;
  v29[4] = self;
  v12 = v10;
  v30 = v12;
  v13 = _Block_copy(v29);
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __27__CNPostalAddress_isEqual___block_invoke_6;
  v27[3] = &unk_1E29F7D70;
  v27[4] = self;
  v14 = v12;
  v28 = v14;
  v15 = _Block_copy(v27);
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __27__CNPostalAddress_isEqual___block_invoke_7;
  v25[3] = &unk_1E29F7D70;
  v25[4] = self;
  v16 = v14;
  v26 = v16;
  v17 = _Block_copy(v25);
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __27__CNPostalAddress_isEqual___block_invoke_8;
  v23[3] = &unk_1E29F7D70;
  v23[4] = self;
  v24 = v16;
  v18 = v16;
  v19 = _Block_copy(v23);
  LOBYTE(self) = objc_msgSend(v22, "isObject:kindOfClass:andEqualToObject:withBlocks:", v18, v21, self, v37, v7, v9, v11, v13, v15, v17, v19, 0);

  return (char)self;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "street");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "street");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "subLocality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "subLocality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "city");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "city");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "subAdministrativeArea");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "subAdministrativeArea");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "postalCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "postalCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "country");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "country");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __27__CNPostalAddress_isEqual___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "ISOCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "ISOCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD aBlock[5];
  _QWORD v21[6];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  aBlock[4] = self;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __23__CNPostalAddress_hash__block_invoke;
  v21[3] = &unk_1E29F7D98;
  v21[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNPostalAddress_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v5 = _Block_copy(aBlock);
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __23__CNPostalAddress_hash__block_invoke_3;
  v19[3] = &unk_1E29F7D98;
  v19[4] = self;
  v6 = _Block_copy(v19);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __23__CNPostalAddress_hash__block_invoke_4;
  v18[3] = &unk_1E29F7D98;
  v18[4] = self;
  v7 = _Block_copy(v18);
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __23__CNPostalAddress_hash__block_invoke_5;
  v17[3] = &unk_1E29F7D98;
  v17[4] = self;
  v8 = _Block_copy(v17);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __23__CNPostalAddress_hash__block_invoke_6;
  v16[3] = &unk_1E29F7D98;
  v16[4] = self;
  v9 = _Block_copy(v16);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __23__CNPostalAddress_hash__block_invoke_7;
  v15[3] = &unk_1E29F7D98;
  v15[4] = self;
  v10 = _Block_copy(v15);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __23__CNPostalAddress_hash__block_invoke_8;
  v14[3] = &unk_1E29F7D98;
  v14[4] = self;
  v11 = _Block_copy(v14);
  v12 = objc_msgSend(v3, "hashWithBlocks:", v21, v5, v6, v7, v8, v9, v10, v11, 0);

  return v12;
}

uint64_t __23__CNPostalAddress_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "street");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "subLocality");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "city");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "subAdministrativeArea");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "postalCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_7(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "country");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __23__CNPostalAddress_hash__block_invoke_8(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "ISOCountryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (BOOL)isValid:(id *)a3
{
  id v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  if (isValid__cn_once_token_0_3 != -1)
    dispatch_once(&isValid__cn_once_token_0_3, &__block_literal_global_117);
  v5 = (id)isValid__cn_once_object_0_3;
  if (isValid__cn_once_token_1_3 != -1)
    dispatch_once(&isValid__cn_once_token_1_3, &__block_literal_global_47);
  v6 = isValid__cn_once_token_2_3;
  v7 = (id)isValid__cn_once_object_1_3;
  if (v6 != -1)
    dispatch_once(&isValid__cn_once_token_2_3, &__block_literal_global_49);
  v8 = +[CN areValidKeyPaths:forObject:expectedClasses:allowNil:error:](CN, "areValidKeyPaths:forObject:expectedClasses:allowNil:error:", v5, self, v7, isValid__cn_once_object_2_3, a3);

  return v8;
}

void __27__CNPostalAddress_isValid___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E2A406C8, "copy");
  v1 = (void *)isValid__cn_once_object_0_3;
  isValid__cn_once_object_0_3 = v0;

}

void __27__CNPostalAddress_isValid___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 9);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy", v3, v4, v5, v6, v7, v8, v9, v10);
  v2 = (void *)isValid__cn_once_object_1_3;
  isValid__cn_once_object_1_3 = v1;

}

void __27__CNPostalAddress_isValid___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E2A406E0, "copy");
  v1 = (void *)isValid__cn_once_object_2_3;
  isValid__cn_once_object_2_3 = v0;

}

- (void)setSubLocality:(id)a3
{
  NSString *v4;
  NSString *subLocality;

  if (self->_subLocality != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    subLocality = self->_subLocality;
    self->_subLocality = v4;

  }
}

- (void)setSubAdministrativeArea:(id)a3
{
  NSString *v4;
  NSString *subAdministrativeArea;

  if (self->_subAdministrativeArea != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    subAdministrativeArea = self->_subAdministrativeArea;
    self->_subAdministrativeArea = v4;

  }
}

- (void)setFormattedAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
