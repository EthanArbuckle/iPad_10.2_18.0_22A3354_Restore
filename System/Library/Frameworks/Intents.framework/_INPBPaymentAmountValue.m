@implementation _INPBPaymentAmountValue

- (void)setAmountType:(int)a3
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
    self->_amountType = a3;
  }
}

- (BOOL)hasAmountType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAmountType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)amountTypeAsString:(int)a3
{
  if ((a3 - 1) < 6)
    return off_1E228E228[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAmountType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MINIMUM_DUE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AMOUNT_DUE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENT_BALANCE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAXIMUM_TRANSFER_AMOUNT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MINIMUM_TRANSFER_AMOUNT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("STATEMENT_BALANCE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPaymentAmountValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBPaymentAmountValue hasAmountType](self, "hasAmountType"))
    PBDataWriterWriteInt32Field();
  -[_INPBPaymentAmountValue value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBPaymentAmountValue value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBPaymentAmountValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPaymentAmountValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPaymentAmountValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPaymentAmountValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPaymentAmountValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBPaymentAmountValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPaymentAmountValue *v5;
  id v6;

  v5 = -[_INPBPaymentAmountValue init](+[_INPBPaymentAmountValue allocWithZone:](_INPBPaymentAmountValue, "allocWithZone:"), "init");
  if (-[_INPBPaymentAmountValue hasAmountType](self, "hasAmountType"))
    -[_INPBPaymentAmountValue setAmountType:](v5, "setAmountType:", -[_INPBPaymentAmountValue amountType](self, "amountType"));
  v6 = -[_INPBCurrencyAmountValue copyWithZone:](self->_value, "copyWithZone:", a3);
  -[_INPBPaymentAmountValue setValue:](v5, "setValue:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int amountType;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBPaymentAmountValue hasAmountType](self, "hasAmountType");
    if (v5 == objc_msgSend(v4, "hasAmountType"))
    {
      if (!-[_INPBPaymentAmountValue hasAmountType](self, "hasAmountType")
        || !objc_msgSend(v4, "hasAmountType")
        || (amountType = self->_amountType, amountType == objc_msgSend(v4, "amountType")))
      {
        -[_INPBPaymentAmountValue value](self, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[_INPBPaymentAmountValue value](self, "value");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_14:
            v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          -[_INPBPaymentAmountValue value](self, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

        }
      }
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;

  if (-[_INPBPaymentAmountValue hasAmountType](self, "hasAmountType"))
    v3 = 2654435761 * self->_amountType;
  else
    v3 = 0;
  return -[_INPBCurrencyAmountValue hash](self->_value, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBPaymentAmountValue hasAmountType](self, "hasAmountType"))
  {
    v4 = -[_INPBPaymentAmountValue amountType](self, "amountType");
    if ((v4 - 1) >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E228E228[(v4 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("amountType"));

  }
  -[_INPBPaymentAmountValue value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("value"));

  return v3;
}

- (int)amountType
{
  return self->_amountType;
}

- (_INPBCurrencyAmountValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
