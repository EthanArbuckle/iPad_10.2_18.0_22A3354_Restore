@implementation FMFPlacemark

- (FMFPlacemark)initWithLocality:(id)a3 administrativeArea:(id)a4 country:(id)a5 state:(id)a6 streetAddress:(id)a7 streetName:(id)a8
{
  id v15;
  id v16;
  id v17;
  FMFPlacemark *v18;
  FMFPlacemark *v19;
  uint64_t v20;
  NSArray *formattedAddressLines;
  uint64_t v22;
  NSArray *v23;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v26 = a4;
  v15 = a5;
  v16 = a6;
  v25 = a7;
  v17 = a8;
  v18 = -[FMFPlacemark init](self, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_administrativeArea, a4);
    objc_storeStrong((id *)&v19->_country, a5);
    v20 = objc_opt_new();
    formattedAddressLines = v19->_formattedAddressLines;
    v19->_formattedAddressLines = (NSArray *)v20;

    objc_storeStrong((id *)&v19->_locality, a3);
    objc_storeStrong((id *)&v19->_state, a6);
    objc_storeStrong((id *)&v19->_streetAddress, a7);
    objc_storeStrong((id *)&v19->_streetName, a8);
    v28[0] = v17;
    v28[1] = v27;
    v28[2] = v16;
    v28[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4, v25, v26);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v19->_formattedAddressLines;
    v19->_formattedAddressLines = (NSArray *)v22;

  }
  return v19;
}

- (FMFPlacemark)initWithDictionary:(id)a3
{
  id v4;
  FMFPlacemark *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *formattedAddressLines;
  NSArray *v18;
  uint64_t v19;
  NSArray *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;

  v4 = a3;
  v5 = -[FMFPlacemark init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("administrativeArea"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("administrativeArea"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (v8)
      v9 = v8;
    else
      v9 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_administrativeArea, v9);
    if (v6 != v7)

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("country"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("country"));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (v12)
      v13 = v12;
    else
      v13 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_country, v13);
    if (v10 != v11)

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formattedAddressLines"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v15)
    {
      v19 = objc_opt_new();
      formattedAddressLines = v5->_formattedAddressLines;
      v5->_formattedAddressLines = (NSArray *)v19;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formattedAddressLines"));
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
      formattedAddressLines = v16;
      if (v16)
        v18 = v16;
      else
        v18 = (NSArray *)objc_opt_new();
      v20 = v5->_formattedAddressLines;
      v5->_formattedAddressLines = v18;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locality"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 == v22)
    {
      v23 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locality"));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (v23)
      v24 = v23;
    else
      v24 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_locality, v24);
    if (v21 != v22)

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stateCode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 == v26)
    {
      v27 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stateCode"));
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (v27)
      v28 = v27;
    else
      v28 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_state, v28);
    if (v25 != v26)

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streetAddress"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 == v30)
    {
      v31 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streetAddress"));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (v31)
      v32 = v31;
    else
      v32 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_streetAddress, v32);
    if (v29 != v30)

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streetName"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 == v34)
    {
      v35 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streetName"));
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (v35)
      v36 = v35;
    else
      v36 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_streetName, v36);
    if (v33 != v34)

  }
  return v5;
}

- (FMFPlacemark)initWithCoder:(id)a3
{
  id v4;
  FMFPlacemark *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *formattedAddressLines;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;

  v4 = a3;
  v5 = -[FMFPlacemark init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("administrativeArea"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_administrativeArea, v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("country"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_country, v11);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("formattedAddressLines"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v17 = v15;
    else
      v17 = (NSArray *)objc_opt_new();
    formattedAddressLines = v5->_formattedAddressLines;
    v5->_formattedAddressLines = v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locality"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (__CFString *)v19;
    else
      v21 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_locality, v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateCode"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = (__CFString *)v22;
    else
      v24 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_state, v24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streetAddress"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = (__CFString *)v25;
    else
      v27 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_streetAddress, v27);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streetName"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
      v30 = (__CFString *)v28;
    else
      v30 = &stru_1EA4F34A0;
    objc_storeStrong((id *)&v5->_streetName, v30);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *administrativeArea;
  id v5;

  administrativeArea = self->_administrativeArea;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", administrativeArea, CFSTR("administrativeArea"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_country, CFSTR("country"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formattedAddressLines, CFSTR("formattedAddressLines"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locality, CFSTR("locality"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("stateCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_streetAddress, CFSTR("streetAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_streetName, CFSTR("streetName"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)formattedAddress
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[FMFPlacemark formattedAddressLines](self, "formattedAddressLines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1EA4F34A0;
  v5 = v3;

  return v5;
}

- (id)dictionaryValue
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_administrativeArea, CFSTR("administrativeArea"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_country, CFSTR("country"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_formattedAddressLines, CFSTR("formattedAddressLines"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_locality, CFSTR("locality"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_streetName, CFSTR("streetName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_streetAddress, CFSTR("streetAddress"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_state, CFSTR("stateCode"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setAdministrativeArea:", self->_administrativeArea);
  objc_msgSend(v4, "setCountry:", self->_country);
  objc_msgSend(v4, "setFormattedAddressLines:", self->_formattedAddressLines);
  objc_msgSend(v4, "setLocality:", self->_locality);
  objc_msgSend(v4, "setState:", self->_state);
  objc_msgSend(v4, "setStreetAddress:", self->_streetAddress);
  objc_msgSend(v4, "setStreetName:", self->_streetName);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[FMFPlacemark administrativeArea](self, "administrativeArea");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "administrativeArea");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[FMFPlacemark country](self, "country");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "country");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[FMFPlacemark formattedAddressLines](self, "formattedAddressLines");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "formattedAddressLines");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToArray:", v11))
        {
          -[FMFPlacemark locality](self, "locality");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "locality");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v12;
          if (objc_msgSend(v12, "isEqualToString:", v25))
          {
            -[FMFPlacemark state](self, "state");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "state");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v13;
            if (objc_msgSend(v13, "isEqualToString:", v23))
            {
              -[FMFPlacemark streetAddress](self, "streetAddress");
              v14 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "streetAddress");
              v15 = objc_claimAutoreleasedReturnValue();
              v22 = (void *)v14;
              v16 = (void *)v14;
              v17 = (void *)v15;
              if (objc_msgSend(v16, "isEqualToString:", v15))
              {
                -[FMFPlacemark streetName](self, "streetName");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "streetName");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v21, "isEqualToString:", v20);

              }
              else
              {
                v18 = 0;
              }

            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  -[FMFPlacemark administrativeArea](self, "administrativeArea");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FMFPlacemark country](self, "country");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[FMFPlacemark formattedAddressLines](self, "formattedAddressLines");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[FMFPlacemark locality](self, "locality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[FMFPlacemark state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[FMFPlacemark streetAddress](self, "streetAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[FMFPlacemark streetName](self, "streetName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
  objc_storeStrong((id *)&self->_locality, a3);
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeArea, a3);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_storeStrong((id *)&self->_country, a3);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)streetAddress
{
  return self->_streetAddress;
}

- (void)setStreetAddress:(id)a3
{
  objc_storeStrong((id *)&self->_streetAddress, a3);
}

- (NSString)streetName
{
  return self->_streetName;
}

- (void)setStreetName:(id)a3
{
  objc_storeStrong((id *)&self->_streetName, a3);
}

- (NSArray)formattedAddressLines
{
  return self->_formattedAddressLines;
}

- (void)setFormattedAddressLines:(id)a3
{
  objc_storeStrong((id *)&self->_formattedAddressLines, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedAddressLines, 0);
  objc_storeStrong((id *)&self->_streetName, 0);
  objc_storeStrong((id *)&self->_streetAddress, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
}

@end
