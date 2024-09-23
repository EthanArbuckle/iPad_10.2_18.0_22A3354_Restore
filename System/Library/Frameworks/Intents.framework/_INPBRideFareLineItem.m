@implementation _INPBRideFareLineItem

- (void)setCurrencyCode:(id)a3
{
  NSString *v4;
  NSString *currencyCode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  currencyCode = self->_currencyCode;
  self->_currencyCode = v4;

}

- (BOOL)hasCurrencyCode
{
  return self->_currencyCode != 0;
}

- (void)setPrice:(id)a3
{
  objc_storeStrong((id *)&self->_price, a3);
}

- (BOOL)hasPrice
{
  return self->_price != 0;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideFareLineItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_INPBRideFareLineItem currencyCode](self, "currencyCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBRideFareLineItem price](self, "price");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBRideFareLineItem price](self, "price");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideFareLineItem title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }

}

- (_INPBRideFareLineItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRideFareLineItem *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRideFareLineItem *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRideFareLineItem *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRideFareLineItem initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBRideFareLineItem data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRideFareLineItem *v5;
  void *v6;
  id v7;
  void *v8;

  v5 = -[_INPBRideFareLineItem init](+[_INPBRideFareLineItem allocWithZone:](_INPBRideFareLineItem, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  -[_INPBRideFareLineItem setCurrencyCode:](v5, "setCurrencyCode:", v6);

  v7 = -[_INPBDecimalNumberValue copyWithZone:](self->_price, "copyWithZone:", a3);
  -[_INPBRideFareLineItem setPrice:](v5, "setPrice:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  -[_INPBRideFareLineItem setTitle:](v5, "setTitle:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBRideFareLineItem currencyCode](self, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBRideFareLineItem currencyCode](self, "currencyCode");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRideFareLineItem currencyCode](self, "currencyCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currencyCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBRideFareLineItem price](self, "price");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "price");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBRideFareLineItem price](self, "price");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRideFareLineItem price](self, "price");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "price");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBRideFareLineItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRideFareLineItem title](self, "title");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBRideFareLineItem title](self, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_currencyCode, "hash");
  v4 = -[_INPBDecimalNumberValue hash](self->_price, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_title, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_currencyCode)
  {
    -[_INPBRideFareLineItem currencyCode](self, "currencyCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currencyCode"));

  }
  -[_INPBRideFareLineItem price](self, "price");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("price"));

  if (self->_title)
  {
    -[_INPBRideFareLineItem title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("title"));

  }
  return v3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (_INPBDecimalNumberValue)price
{
  return self->_price;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
