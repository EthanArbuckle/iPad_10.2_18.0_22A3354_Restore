@implementation SGPostalAddressComponents

- (SGPostalAddressComponents)initWithStreet:(id)a3 subLocality:(id)a4 city:(id)a5 subAdministrativeArea:(id)a6 state:(id)a7 postalCode:(id)a8 country:(id)a9 isoCountryCode:(id)a10
{
  id v17;
  SGPostalAddressComponents *v18;
  SGPostalAddressComponents *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)SGPostalAddressComponents;
  v18 = -[SGPostalAddressComponents init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_street, a3);
    objc_storeStrong((id *)&v19->_subLocality, a4);
    objc_storeStrong((id *)&v19->_city, a5);
    objc_storeStrong((id *)&v19->_subAdministrativeArea, a6);
    objc_storeStrong((id *)&v19->_state, a7);
    objc_storeStrong((id *)&v19->_postalCode, a8);
    objc_storeStrong((id *)&v19->_country, a9);
    objc_storeStrong((id *)&v19->_isoCountryCode, a10);
  }

  return v19;
}

- (SGPostalAddressComponents)initWithCoder:(id)a3
{
  id v4;
  SGPostalAddressComponents *v5;
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
  NSString *isoCountryCode;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SGPostalAddressComponents;
  v5 = -[SGPostalAddressComponents init](&v31, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("street"));
    v7 = objc_claimAutoreleasedReturnValue();
    street = v5->_street;
    v5->_street = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("subLocality"));
    v10 = objc_claimAutoreleasedReturnValue();
    subLocality = v5->_subLocality;
    v5->_subLocality = (NSString *)v10;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("city"));
    v13 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (NSString *)v13;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("subAdministrativeArea"));
    v16 = objc_claimAutoreleasedReturnValue();
    subAdministrativeArea = v5->_subAdministrativeArea;
    v5->_subAdministrativeArea = (NSString *)v16;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("state"));
    v19 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v19;

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("postalCode"));
    v22 = objc_claimAutoreleasedReturnValue();
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v22;

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("country"));
    v25 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v25;

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("isoCountryCode"));
    v28 = objc_claimAutoreleasedReturnValue();
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *street;
  id v5;

  street = self->_street;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", street, CFSTR("street"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subLocality, CFSTR("subLocality"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_city, CFSTR("city"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subAdministrativeArea, CFSTR("subAdministrativeArea"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalCode, CFSTR("postalCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_country, CFSTR("country"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isoCountryCode, CFSTR("isoCountryCode"));

}

- (BOOL)isEqual:(id)a3
{
  SGPostalAddressComponents *v4;
  SGPostalAddressComponents *v5;
  BOOL v6;

  v4 = (SGPostalAddressComponents *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGPostalAddressComponents isEqualToPostalAddressComponents:](self, "isEqualToPostalAddressComponents:", v5);

  return v6;
}

- (BOOL)isEqualToPostalAddressComponents:(id)a3
{
  id *v4;
  NSString *street;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *subLocality;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSString *city;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  NSString *subAdministrativeArea;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  NSString *state;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  char v29;
  NSString *postalCode;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  char v34;
  NSString *country;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  char v39;
  char v40;
  NSString *v42;
  NSString *v43;

  v4 = (id *)a3;
  street = self->_street;
  v6 = (NSString *)v4[1];
  if (street == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = street;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_27;
  }
  subLocality = self->_subLocality;
  v11 = (NSString *)v4[2];
  if (subLocality == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = subLocality;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_27;
  }
  city = self->_city;
  v16 = (NSString *)v4[3];
  if (city == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = city;
    v19 = -[NSString isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_27;
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  v21 = (NSString *)v4[4];
  if (subAdministrativeArea == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = subAdministrativeArea;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_27;
  }
  state = self->_state;
  v26 = (NSString *)v4[5];
  if (state == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = state;
    v29 = -[NSString isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_27;
  }
  postalCode = self->_postalCode;
  v31 = (NSString *)v4[6];
  if (postalCode == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = postalCode;
    v34 = -[NSString isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_27;
  }
  country = self->_country;
  v36 = (NSString *)v4[7];
  if (country == v36)
  {

  }
  else
  {
    v37 = v36;
    v38 = country;
    v39 = -[NSString isEqual:](v38, "isEqual:", v37);

    if ((v39 & 1) == 0)
    {
LABEL_27:
      v40 = 0;
      goto LABEL_28;
    }
  }
  v42 = self->_isoCountryCode;
  v43 = v42;
  if (v42 == v4[8])
    v40 = 1;
  else
    v40 = -[NSString isEqual:](v42, "isEqual:");

LABEL_28:
  return v40;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_street, "hash");
  v4 = -[NSString hash](self->_city, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_postalCode, "hash") - v4 + 32 * v4;
  return -[NSString hash](self->_country, "hash") - v5 + 32 * v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@/%@/%@/%@/%@/%@/%@"), self->_street, self->_subLocality, self->_city, self->_subAdministrativeArea, self->_state, self->_postalCode, self->_country, self->_isoCountryCode);
}

- (NSString)street
{
  return self->_street;
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_street, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)components:(id)a3 city:(id)a4 state:(id)a5 postalCode:(id)a6 country:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  SGPostalAddressComponents *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[SGPostalAddressComponents initWithStreet:subLocality:city:subAdministrativeArea:state:postalCode:country:isoCountryCode:]([SGPostalAddressComponents alloc], "initWithStreet:subLocality:city:subAdministrativeArea:state:postalCode:country:isoCountryCode:", v15, 0, v14, 0, v13, v12, v11, 0);

  return v16;
}

+ (id)components:(id)a3 subLocality:(id)a4 city:(id)a5 subAdministrativeArea:(id)a6 state:(id)a7 postalCode:(id)a8 country:(id)a9 isoCountryCode:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SGPostalAddressComponents *v24;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = -[SGPostalAddressComponents initWithStreet:subLocality:city:subAdministrativeArea:state:postalCode:country:isoCountryCode:]([SGPostalAddressComponents alloc], "initWithStreet:subLocality:city:subAdministrativeArea:state:postalCode:country:isoCountryCode:", v23, v22, v21, v20, v19, v18, v17, v16);

  return v24;
}

@end
