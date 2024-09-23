@implementation _INPBPaymentRecord

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (BOOL)hasCurrencyAmount
{
  return self->_currencyAmount != 0;
}

- (void)setFeeAmount:(id)a3
{
  objc_storeStrong((id *)&self->_feeAmount, a3);
}

- (BOOL)hasFeeAmount
{
  return self->_feeAmount != 0;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (BOOL)hasNote
{
  return self->_note != 0;
}

- (void)setPayee:(id)a3
{
  objc_storeStrong((id *)&self->_payee, a3);
}

- (BOOL)hasPayee
{
  return self->_payee != 0;
}

- (void)setPayer:(id)a3
{
  objc_storeStrong((id *)&self->_payer, a3);
}

- (BOOL)hasPayer
{
  return self->_payer != 0;
}

- (void)setPaymentMethod:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethod, a3);
}

- (BOOL)hasPaymentMethod
{
  return self->_paymentMethod != 0;
}

- (void)setStatus:(int)a3
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
    self->_status = a3;
  }
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)statusAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1E228B4A8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PENDING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CANCELED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNPAID")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPaymentRecordReadFrom(self, (uint64_t)a3);
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[_INPBPaymentRecord currencyAmount](self, "currencyAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBPaymentRecord currencyAmount](self, "currencyAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPaymentRecord feeAmount](self, "feeAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBPaymentRecord feeAmount](self, "feeAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPaymentRecord note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBPaymentRecord note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPaymentRecord payee](self, "payee");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBPaymentRecord payee](self, "payee");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPaymentRecord payer](self, "payer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBPaymentRecord payer](self, "payer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPaymentRecord paymentMethod](self, "paymentMethod");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBPaymentRecord paymentMethod](self, "paymentMethod");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBPaymentRecord hasStatus](self, "hasStatus"))
    PBDataWriterWriteInt32Field();

}

- (_INPBPaymentRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPaymentRecord *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPaymentRecord *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPaymentRecord *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPaymentRecord initWithData:](self, "initWithData:", v6);

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
  -[_INPBPaymentRecord data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPaymentRecord *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = -[_INPBPaymentRecord init](+[_INPBPaymentRecord allocWithZone:](_INPBPaymentRecord, "allocWithZone:"), "init");
  v6 = -[_INPBCurrencyAmount copyWithZone:](self->_currencyAmount, "copyWithZone:", a3);
  -[_INPBPaymentRecord setCurrencyAmount:](v5, "setCurrencyAmount:", v6);

  v7 = -[_INPBCurrencyAmount copyWithZone:](self->_feeAmount, "copyWithZone:", a3);
  -[_INPBPaymentRecord setFeeAmount:](v5, "setFeeAmount:", v7);

  v8 = -[_INPBString copyWithZone:](self->_note, "copyWithZone:", a3);
  -[_INPBPaymentRecord setNote:](v5, "setNote:", v8);

  v9 = -[_INPBContact copyWithZone:](self->_payee, "copyWithZone:", a3);
  -[_INPBPaymentRecord setPayee:](v5, "setPayee:", v9);

  v10 = -[_INPBContact copyWithZone:](self->_payer, "copyWithZone:", a3);
  -[_INPBPaymentRecord setPayer:](v5, "setPayer:", v10);

  v11 = -[_INPBPaymentMethodValue copyWithZone:](self->_paymentMethod, "copyWithZone:", a3);
  -[_INPBPaymentRecord setPaymentMethod:](v5, "setPaymentMethod:", v11);

  if (-[_INPBPaymentRecord hasStatus](self, "hasStatus"))
    -[_INPBPaymentRecord setStatus:](v5, "setStatus:", -[_INPBPaymentRecord status](self, "status"));
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
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  BOOL v37;
  int v39;
  int status;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[_INPBPaymentRecord currencyAmount](self, "currencyAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBPaymentRecord currencyAmount](self, "currencyAmount");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBPaymentRecord currencyAmount](self, "currencyAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currencyAmount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBPaymentRecord feeAmount](self, "feeAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feeAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBPaymentRecord feeAmount](self, "feeAmount");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBPaymentRecord feeAmount](self, "feeAmount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "feeAmount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBPaymentRecord note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBPaymentRecord note](self, "note");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBPaymentRecord note](self, "note");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "note");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBPaymentRecord payee](self, "payee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payee");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBPaymentRecord payee](self, "payee");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBPaymentRecord payee](self, "payee");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payee");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBPaymentRecord payer](self, "payer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBPaymentRecord payer](self, "payer");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBPaymentRecord payer](self, "payer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBPaymentRecord paymentMethod](self, "paymentMethod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentMethod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  -[_INPBPaymentRecord paymentMethod](self, "paymentMethod");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBPaymentRecord paymentMethod](self, "paymentMethod");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentMethod");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_32;
  }
  else
  {

  }
  v39 = -[_INPBPaymentRecord hasStatus](self, "hasStatus");
  if (v39 == objc_msgSend(v4, "hasStatus"))
  {
    if (!-[_INPBPaymentRecord hasStatus](self, "hasStatus")
      || !objc_msgSend(v4, "hasStatus")
      || (status = self->_status, status == objc_msgSend(v4, "status")))
    {
      v37 = 1;
      goto LABEL_33;
    }
  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[_INPBCurrencyAmount hash](self->_currencyAmount, "hash");
  v4 = -[_INPBCurrencyAmount hash](self->_feeAmount, "hash");
  v5 = -[_INPBString hash](self->_note, "hash");
  v6 = -[_INPBContact hash](self->_payee, "hash");
  v7 = -[_INPBContact hash](self->_payer, "hash");
  v8 = -[_INPBPaymentMethodValue hash](self->_paymentMethod, "hash");
  if (-[_INPBPaymentRecord hasStatus](self, "hasStatus"))
    v9 = 2654435761 * self->_status;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBPaymentRecord currencyAmount](self, "currencyAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currencyAmount"));

  -[_INPBPaymentRecord feeAmount](self, "feeAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("feeAmount"));

  -[_INPBPaymentRecord note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("note"));

  -[_INPBPaymentRecord payee](self, "payee");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("payee"));

  -[_INPBPaymentRecord payer](self, "payer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("payer"));

  -[_INPBPaymentRecord paymentMethod](self, "paymentMethod");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("paymentMethod"));

  if (-[_INPBPaymentRecord hasStatus](self, "hasStatus"))
  {
    v16 = -[_INPBPaymentRecord status](self, "status");
    if ((v16 - 1) >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E228B4A8[(v16 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("status"));

  }
  return v3;
}

- (_INPBCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (_INPBCurrencyAmount)feeAmount
{
  return self->_feeAmount;
}

- (_INPBString)note
{
  return self->_note;
}

- (_INPBContact)payee
{
  return self->_payee;
}

- (_INPBContact)payer
{
  return self->_payer;
}

- (_INPBPaymentMethodValue)paymentMethod
{
  return self->_paymentMethod;
}

- (int)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_payer, 0);
  objc_storeStrong((id *)&self->_payee, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_feeAmount, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
