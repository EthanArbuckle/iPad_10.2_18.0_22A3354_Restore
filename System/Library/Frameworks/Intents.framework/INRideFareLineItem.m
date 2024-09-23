@implementation INRideFareLineItem

- (INRideFareLineItem)initWithTitle:(NSString *)title price:(NSDecimalNumber *)price currencyCode:(NSString *)currencyCode
{
  NSString *v8;
  NSDecimalNumber *v9;
  NSString *v10;
  INRideFareLineItem *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  NSDecimalNumber *v15;
  uint64_t v16;
  NSString *v17;
  objc_super v19;

  v8 = title;
  v9 = price;
  v10 = currencyCode;
  v19.receiver = self;
  v19.super_class = (Class)INRideFareLineItem;
  v11 = -[INRideFareLineItem init](&v19, sel_init);
  if (v11)
  {
    v12 = -[NSString copy](v8, "copy");
    v13 = v11->_title;
    v11->_title = (NSString *)v12;

    v14 = -[NSDecimalNumber copy](v9, "copy");
    v15 = v11->_price;
    v11->_price = (NSDecimalNumber *)v14;

    v16 = -[NSString copy](v10, "copy");
    v17 = v11->_currencyCode;
    v11->_currencyCode = (NSString *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSDecimalNumber hash](self->_price, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_currencyCode, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *title;
  NSDecimalNumber *price;
  NSString *currencyCode;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    title = self->_title;
    v9 = 0;
    if (title == (NSString *)v5[1] || -[NSString isEqual:](title, "isEqual:"))
    {
      price = self->_price;
      if (price == (NSDecimalNumber *)v5[2] || -[NSDecimalNumber isEqual:](price, "isEqual:"))
      {
        currencyCode = self->_currencyCode;
        if (currencyCode == (NSString *)v5[3] || -[NSString isEqual:](currencyCode, "isEqual:"))
          v9 = 1;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (INRideFareLineItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  INRideFareLineItem *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("price"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[INRideFareLineItem initWithTitle:price:currencyCode:](self, "initWithTitle:price:currencyCode:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_price, CFSTR("price"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));

}

- (NSString)description
{
  return (NSString *)-[INRideFareLineItem descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INRideFareLineItem;
  -[INRideFareLineItem description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRideFareLineItem _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *title;
  void *v4;
  NSDecimalNumber *price;
  void *v6;
  NSString *currencyCode;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("title");
  title = self->_title;
  v4 = title;
  if (!title)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("price");
  price = self->_price;
  v6 = price;
  if (!price)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("currencyCode");
  currencyCode = self->_currencyCode;
  v8 = currencyCode;
  if (!currencyCode)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (currencyCode)
  {
    if (price)
      goto LABEL_9;
LABEL_12:

    if (title)
      return v9;
LABEL_13:

    return v9;
  }

  if (!price)
    goto LABEL_12;
LABEL_9:
  if (!title)
    goto LABEL_13;
  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (NSDecimalNumber)price
{
  return self->_price;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
