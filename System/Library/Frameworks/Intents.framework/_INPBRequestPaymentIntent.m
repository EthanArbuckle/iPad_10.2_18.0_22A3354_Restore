@implementation _INPBRequestPaymentIntent

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (BOOL)hasCurrencyAmount
{
  return self->_currencyAmount != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (BOOL)hasNote
{
  return self->_note != 0;
}

- (void)setPayer:(id)a3
{
  objc_storeStrong((id *)&self->_payer, a3);
}

- (BOOL)hasPayer
{
  return self->_payer != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRequestPaymentIntentReadFrom(self, (uint64_t)a3);
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
  void *v11;
  id v12;

  v12 = a3;
  -[_INPBRequestPaymentIntent currencyAmount](self, "currencyAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBRequestPaymentIntent currencyAmount](self, "currencyAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRequestPaymentIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBRequestPaymentIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRequestPaymentIntent note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBRequestPaymentIntent note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRequestPaymentIntent payer](self, "payer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBRequestPaymentIntent payer](self, "payer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBRequestPaymentIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRequestPaymentIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRequestPaymentIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRequestPaymentIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRequestPaymentIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBRequestPaymentIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRequestPaymentIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = -[_INPBRequestPaymentIntent init](+[_INPBRequestPaymentIntent allocWithZone:](_INPBRequestPaymentIntent, "allocWithZone:"), "init");
  v6 = -[_INPBCurrencyAmount copyWithZone:](self->_currencyAmount, "copyWithZone:", a3);
  -[_INPBRequestPaymentIntent setCurrencyAmount:](v5, "setCurrencyAmount:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBRequestPaymentIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = -[_INPBString copyWithZone:](self->_note, "copyWithZone:", a3);
  -[_INPBRequestPaymentIntent setNote:](v5, "setNote:", v8);

  v9 = -[_INPBContact copyWithZone:](self->_payer, "copyWithZone:", a3);
  -[_INPBRequestPaymentIntent setPayer:](v5, "setPayer:", v9);

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
  -[_INPBRequestPaymentIntent currencyAmount](self, "currencyAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBRequestPaymentIntent currencyAmount](self, "currencyAmount");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRequestPaymentIntent currencyAmount](self, "currencyAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currencyAmount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBRequestPaymentIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBRequestPaymentIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRequestPaymentIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBRequestPaymentIntent note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBRequestPaymentIntent note](self, "note");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBRequestPaymentIntent note](self, "note");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "note");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBRequestPaymentIntent payer](self, "payer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRequestPaymentIntent payer](self, "payer");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBRequestPaymentIntent payer](self, "payer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payer");
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[_INPBCurrencyAmount hash](self->_currencyAmount, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  v5 = -[_INPBString hash](self->_note, "hash");
  return v4 ^ v5 ^ -[_INPBContact hash](self->_payer, "hash");
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
  -[_INPBRequestPaymentIntent currencyAmount](self, "currencyAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currencyAmount"));

  -[_INPBRequestPaymentIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  -[_INPBRequestPaymentIntent note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("note"));

  -[_INPBRequestPaymentIntent payer](self, "payer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("payer"));

  return v3;
}

- (_INPBCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBString)note
{
  return self->_note;
}

- (_INPBContact)payer
{
  return self->_payer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payer, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
