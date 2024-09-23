@implementation _INPBBalanceAmountValue

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (BOOL)hasCurrencyAmount
{
  return self->_currencyAmount != 0;
}

- (void)setCustomAmount:(id)a3
{
  objc_storeStrong((id *)&self->_customAmount, a3);
}

- (BOOL)hasCustomAmount
{
  return self->_customAmount != 0;
}

- (void)setType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_type = a3;
  }
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E228D3F8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONEY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POINTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MILES")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
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
  return _INPBBalanceAmountValueReadFrom(self, (uint64_t)a3);
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
  -[_INPBBalanceAmountValue currencyAmount](self, "currencyAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBBalanceAmountValue currencyAmount](self, "currencyAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBBalanceAmountValue customAmount](self, "customAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBBalanceAmountValue customAmount](self, "customAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBBalanceAmountValue hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();
  -[_INPBBalanceAmountValue valueMetadata](self, "valueMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[_INPBBalanceAmountValue valueMetadata](self, "valueMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

}

- (_INPBBalanceAmountValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBBalanceAmountValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBBalanceAmountValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBBalanceAmountValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBBalanceAmountValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBBalanceAmountValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBBalanceAmountValue *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBBalanceAmountValue init](+[_INPBBalanceAmountValue allocWithZone:](_INPBBalanceAmountValue, "allocWithZone:"), "init");
  v6 = -[_INPBCurrencyAmountValue copyWithZone:](self->_currencyAmount, "copyWithZone:", a3);
  -[_INPBBalanceAmountValue setCurrencyAmount:](v5, "setCurrencyAmount:", v6);

  v7 = -[_INPBDecimalNumberValue copyWithZone:](self->_customAmount, "copyWithZone:", a3);
  -[_INPBBalanceAmountValue setCustomAmount:](v5, "setCustomAmount:", v7);

  if (-[_INPBBalanceAmountValue hasType](self, "hasType"))
    -[_INPBBalanceAmountValue setType:](v5, "setType:", -[_INPBBalanceAmountValue type](self, "type"));
  v8 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBBalanceAmountValue setValueMetadata:](v5, "setValueMetadata:", v8);

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
  int v17;
  int type;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[_INPBBalanceAmountValue currencyAmount](self, "currencyAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBBalanceAmountValue currencyAmount](self, "currencyAmount");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBBalanceAmountValue currencyAmount](self, "currencyAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currencyAmount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBBalanceAmountValue customAmount](self, "customAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBBalanceAmountValue customAmount](self, "customAmount");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBBalanceAmountValue customAmount](self, "customAmount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customAmount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_21;
  }
  else
  {

  }
  v17 = -[_INPBBalanceAmountValue hasType](self, "hasType");
  if (v17 != objc_msgSend(v4, "hasType"))
    goto LABEL_21;
  if (-[_INPBBalanceAmountValue hasType](self, "hasType"))
  {
    if (objc_msgSend(v4, "hasType"))
    {
      type = self->_type;
      if (type != objc_msgSend(v4, "type"))
        goto LABEL_21;
    }
  }
  -[_INPBBalanceAmountValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBBalanceAmountValue valueMetadata](self, "valueMetadata");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBBalanceAmountValue valueMetadata](self, "valueMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[_INPBCurrencyAmountValue hash](self->_currencyAmount, "hash");
  v4 = -[_INPBDecimalNumberValue hash](self->_customAmount, "hash");
  if (-[_INPBBalanceAmountValue hasType](self, "hasType"))
    v5 = 2654435761 * self->_type;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBBalanceAmountValue currencyAmount](self, "currencyAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currencyAmount"));

  -[_INPBBalanceAmountValue customAmount](self, "customAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("customAmount"));

  if (-[_INPBBalanceAmountValue hasType](self, "hasType"))
  {
    v8 = -[_INPBBalanceAmountValue type](self, "type");
    if ((v8 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E228D3F8[(v8 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("type"));

  }
  -[_INPBBalanceAmountValue valueMetadata](self, "valueMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("valueMetadata"));

  return v3;
}

- (_INPBCurrencyAmountValue)currencyAmount
{
  return self->_currencyAmount;
}

- (_INPBDecimalNumberValue)customAmount
{
  return self->_customAmount;
}

- (int)type
{
  return self->_type;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_customAmount, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
