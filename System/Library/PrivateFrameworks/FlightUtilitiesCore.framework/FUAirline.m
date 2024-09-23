@implementation FUAirline

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[FUAirline IATACode](self, "IATACode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "IATACode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[FUAirline IATACode](self, "IATACode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "IATACode");
      v37 = v10;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqual:"))
      {
        v11 = 0;
        goto LABEL_29;
      }
    }
    -[FUAirline FAACode](self, "FAACode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "FAACode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 != v13)
    {
      -[FUAirline FAACode](self, "FAACode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "FAACode");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "isEqual:", v3))
      {
        v11 = 0;
LABEL_27:

LABEL_28:
        if (v8 == v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    -[FUAirline name](self, "name");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v14;
    if (v14 == v35)
    {
      v32 = v3;
    }
    else
    {
      -[FUAirline name](self, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        v11 = 0;
        v19 = (void *)v35;
        v18 = v36;
LABEL_25:

LABEL_26:
        if (v12 == v13)
          goto LABEL_28;
        goto LABEL_27;
      }
      v32 = v3;
    }
    -[FUAirline phoneNumber](self, "phoneNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == v17)
    {
      v29 = v5;
      v30 = v13;
    }
    else
    {
      -[FUAirline phoneNumber](self, "phoneNumber");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "phoneNumber");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isEqual:"))
      {
        v11 = 0;
        goto LABEL_23;
      }
      v29 = v5;
      v30 = v13;
    }
    -[FUAirline URL](self, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

      v11 = 1;
    }
    else
    {
      v22 = (void *)v21;
      -[FUAirline URL](self, "URL");
      v27 = v4;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URL");
      v28 = v12;
      v24 = v16;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v23, "isEqual:", v25);

      v16 = v24;
      v12 = v28;

      v4 = v27;
    }
    v5 = v29;
    v13 = v30;
    if (v16 == v17)
    {
LABEL_24:

      v19 = (void *)v35;
      v18 = v36;
      v3 = v32;
      if (v36 == (void *)v35)
        goto LABEL_26;
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }
  v11 = 0;
LABEL_31:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[FUAirline IATACode](self, "IATACode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIATACode:", v6);

  -[FUAirline FAACode](self, "FAACode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setFAACode:", v8);

  -[FUAirline name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setName:", v10);

  -[FUAirline phoneNumber](self, "phoneNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setPhoneNumber:", v12);

  -[FUAirline URL](self, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setURL:", v14);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FUAirline name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUAirline IATACode](self, "IATACode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Airline: %@ (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[FUAirline IATACode](self, "IATACode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FUAirline IATACode](self, "IATACode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("IATACode"));

  }
  -[FUAirline FAACode](self, "FAACode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FUAirline FAACode](self, "FAACode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("FAACode"));

  }
  -[FUAirline name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FUAirline name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("name"));

  }
  -[FUAirline phoneNumber](self, "phoneNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FUAirline phoneNumber](self, "phoneNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("phoneNumber"));

  }
  -[FUAirline URL](self, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FUAirline URL](self, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("URL"));

  }
}

- (FUAirline)initWithCoder:(id)a3
{
  id v4;
  FUAirline *v5;
  uint64_t v6;
  NSString *IATACode;
  uint64_t v8;
  NSString *FAACode;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *phoneNumber;
  uint64_t v14;
  NSURL *URL;
  FUAirline *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FUAirline;
  v5 = -[FUAirline init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IATACode"));
    v6 = objc_claimAutoreleasedReturnValue();
    IATACode = v5->_IATACode;
    v5->_IATACode = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FAACode"));
    v8 = objc_claimAutoreleasedReturnValue();
    FAACode = v5->_FAACode;
    v5->_FAACode = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v12 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v14 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v14;

    v16 = v5;
  }

  return v5;
}

- (NSString)IATACode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIATACode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)FAACode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFAACode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_FAACode, 0);
  objc_storeStrong((id *)&self->_IATACode, 0);
}

@end
