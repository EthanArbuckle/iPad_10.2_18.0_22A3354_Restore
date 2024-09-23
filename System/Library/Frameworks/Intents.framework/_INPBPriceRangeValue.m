@implementation _INPBPriceRangeValue

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

- (void)setMaximumPrice:(id)a3
{
  objc_storeStrong((id *)&self->_maximumPrice, a3);
}

- (BOOL)hasMaximumPrice
{
  return self->_maximumPrice != 0;
}

- (void)setMinimumPrice:(id)a3
{
  objc_storeStrong((id *)&self->_minimumPrice, a3);
}

- (BOOL)hasMinimumPrice
{
  return self->_minimumPrice != 0;
}

- (void)setValueMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_valueMetadata, a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPriceRangeValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_INPBPriceRangeValue currencyCode](self, "currencyCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBPriceRangeValue maximumPrice](self, "maximumPrice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBPriceRangeValue maximumPrice](self, "maximumPrice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPriceRangeValue minimumPrice](self, "minimumPrice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBPriceRangeValue minimumPrice](self, "minimumPrice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPriceRangeValue valueMetadata](self, "valueMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBPriceRangeValue valueMetadata](self, "valueMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBPriceRangeValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPriceRangeValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPriceRangeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPriceRangeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPriceRangeValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBPriceRangeValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPriceRangeValue *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v5 = -[_INPBPriceRangeValue init](+[_INPBPriceRangeValue allocWithZone:](_INPBPriceRangeValue, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  -[_INPBPriceRangeValue setCurrencyCode:](v5, "setCurrencyCode:", v6);

  v7 = -[_INPBDecimalNumberValue copyWithZone:](self->_maximumPrice, "copyWithZone:", a3);
  -[_INPBPriceRangeValue setMaximumPrice:](v5, "setMaximumPrice:", v7);

  v8 = -[_INPBDecimalNumberValue copyWithZone:](self->_minimumPrice, "copyWithZone:", a3);
  -[_INPBPriceRangeValue setMinimumPrice:](v5, "setMinimumPrice:", v8);

  v9 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBPriceRangeValue setValueMetadata:](v5, "setValueMetadata:", v9);

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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBPriceRangeValue currencyCode](self, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBPriceRangeValue currencyCode](self, "currencyCode");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBPriceRangeValue currencyCode](self, "currencyCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currencyCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBPriceRangeValue maximumPrice](self, "maximumPrice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumPrice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBPriceRangeValue maximumPrice](self, "maximumPrice");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBPriceRangeValue maximumPrice](self, "maximumPrice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maximumPrice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBPriceRangeValue minimumPrice](self, "minimumPrice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumPrice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBPriceRangeValue minimumPrice](self, "minimumPrice");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBPriceRangeValue minimumPrice](self, "minimumPrice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minimumPrice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBPriceRangeValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBPriceRangeValue valueMetadata](self, "valueMetadata");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBPriceRangeValue valueMetadata](self, "valueMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_currencyCode, "hash");
  v4 = -[_INPBDecimalNumberValue hash](self->_maximumPrice, "hash") ^ v3;
  v5 = -[_INPBDecimalNumberValue hash](self->_minimumPrice, "hash");
  return v4 ^ v5 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
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
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_currencyCode)
  {
    -[_INPBPriceRangeValue currencyCode](self, "currencyCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currencyCode"));

  }
  -[_INPBPriceRangeValue maximumPrice](self, "maximumPrice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("maximumPrice"));

  -[_INPBPriceRangeValue minimumPrice](self, "minimumPrice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("minimumPrice"));

  -[_INPBPriceRangeValue valueMetadata](self, "valueMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("valueMetadata"));

  return v3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (_INPBDecimalNumberValue)maximumPrice
{
  return self->_maximumPrice;
}

- (_INPBDecimalNumberValue)minimumPrice
{
  return self->_minimumPrice;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_minimumPrice, 0);
  objc_storeStrong((id *)&self->_maximumPrice, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
