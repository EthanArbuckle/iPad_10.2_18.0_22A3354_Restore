@implementation _INPBPayBillIntent

- (void)setBillPayee:(id)a3
{
  objc_storeStrong((id *)&self->_billPayee, a3);
}

- (BOOL)hasBillPayee
{
  return self->_billPayee != 0;
}

- (void)setBillType:(int)a3
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
    self->_billType = a3;
  }
}

- (BOOL)hasBillType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBillType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)billTypeAsString:(int)a3
{
  if ((a3 - 1) < 0x16)
    return off_1E228DD58[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBillType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTO_INSURANCE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CABLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_LEASE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_LOAN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CREDIT_CARD")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ELECTRICITY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GAS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GARBAGE_AND_RECYCLING")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_INSURANCE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_INSURANCE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERNET")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIFE_INSURANCE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORTGAGE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUSIC_STREAMING")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHONE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RENT")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEWER")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STUDENT_LOAN")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_TICKET")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TUITION")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UTILITIES")) & 1) != 0)
  {
    v4 = 21;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WATER")))
  {
    v4 = 22;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setDueDate:(id)a3
{
  objc_storeStrong((id *)&self->_dueDate, a3);
}

- (BOOL)hasDueDate
{
  return self->_dueDate != 0;
}

- (void)setFromAccount:(id)a3
{
  objc_storeStrong((id *)&self->_fromAccount, a3);
}

- (BOOL)hasFromAccount
{
  return self->_fromAccount != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setTransactionAmount:(id)a3
{
  objc_storeStrong((id *)&self->_transactionAmount, a3);
}

- (BOOL)hasTransactionAmount
{
  return self->_transactionAmount != 0;
}

- (void)setTransactionNote:(id)a3
{
  objc_storeStrong((id *)&self->_transactionNote, a3);
}

- (BOOL)hasTransactionNote
{
  return self->_transactionNote != 0;
}

- (void)setTransactionScheduledDate:(id)a3
{
  objc_storeStrong((id *)&self->_transactionScheduledDate, a3);
}

- (BOOL)hasTransactionScheduledDate
{
  return self->_transactionScheduledDate != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPayBillIntentReadFrom(self, (uint64_t)a3);
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
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[_INPBPayBillIntent billPayee](self, "billPayee");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBPayBillIntent billPayee](self, "billPayee");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBPayBillIntent hasBillType](self, "hasBillType"))
    PBDataWriterWriteInt32Field();
  -[_INPBPayBillIntent dueDate](self, "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBPayBillIntent dueDate](self, "dueDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPayBillIntent fromAccount](self, "fromAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBPayBillIntent fromAccount](self, "fromAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPayBillIntent intentMetadata](self, "intentMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBPayBillIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPayBillIntent transactionAmount](self, "transactionAmount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBPayBillIntent transactionAmount](self, "transactionAmount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPayBillIntent transactionNote](self, "transactionNote");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBPayBillIntent transactionNote](self, "transactionNote");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPayBillIntent transactionScheduledDate](self, "transactionScheduledDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v19;
  if (v16)
  {
    -[_INPBPayBillIntent transactionScheduledDate](self, "transactionScheduledDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v17 = v19;
  }

}

- (_INPBPayBillIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPayBillIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPayBillIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPayBillIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPayBillIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBPayBillIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPayBillIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v5 = -[_INPBPayBillIntent init](+[_INPBPayBillIntent allocWithZone:](_INPBPayBillIntent, "allocWithZone:"), "init");
  v6 = -[_INPBBillPayeeValue copyWithZone:](self->_billPayee, "copyWithZone:", a3);
  -[_INPBPayBillIntent setBillPayee:](v5, "setBillPayee:", v6);

  if (-[_INPBPayBillIntent hasBillType](self, "hasBillType"))
    -[_INPBPayBillIntent setBillType:](v5, "setBillType:", -[_INPBPayBillIntent billType](self, "billType"));
  v7 = -[_INPBDateTimeRange copyWithZone:](self->_dueDate, "copyWithZone:", a3);
  -[_INPBPayBillIntent setDueDate:](v5, "setDueDate:", v7);

  v8 = -[_INPBFinancialAccountValue copyWithZone:](self->_fromAccount, "copyWithZone:", a3);
  -[_INPBPayBillIntent setFromAccount:](v5, "setFromAccount:", v8);

  v9 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBPayBillIntent setIntentMetadata:](v5, "setIntentMetadata:", v9);

  v10 = -[_INPBPaymentAmountValue copyWithZone:](self->_transactionAmount, "copyWithZone:", a3);
  -[_INPBPayBillIntent setTransactionAmount:](v5, "setTransactionAmount:", v10);

  v11 = -[_INPBString copyWithZone:](self->_transactionNote, "copyWithZone:", a3);
  -[_INPBPayBillIntent setTransactionNote:](v5, "setTransactionNote:", v11);

  v12 = -[_INPBDateTimeRange copyWithZone:](self->_transactionScheduledDate, "copyWithZone:", a3);
  -[_INPBPayBillIntent setTransactionScheduledDate:](v5, "setTransactionScheduledDate:", v12);

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
  int v12;
  int billType;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  BOOL v44;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  -[_INPBPayBillIntent billPayee](self, "billPayee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "billPayee");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBPayBillIntent billPayee](self, "billPayee");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBPayBillIntent billPayee](self, "billPayee");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "billPayee");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_41;
  }
  else
  {

  }
  v12 = -[_INPBPayBillIntent hasBillType](self, "hasBillType");
  if (v12 != objc_msgSend(v4, "hasBillType"))
    goto LABEL_41;
  if (-[_INPBPayBillIntent hasBillType](self, "hasBillType"))
  {
    if (objc_msgSend(v4, "hasBillType"))
    {
      billType = self->_billType;
      if (billType != objc_msgSend(v4, "billType"))
        goto LABEL_41;
    }
  }
  -[_INPBPayBillIntent dueDate](self, "dueDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBPayBillIntent dueDate](self, "dueDate");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBPayBillIntent dueDate](self, "dueDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dueDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_41;
  }
  else
  {

  }
  -[_INPBPayBillIntent fromAccount](self, "fromAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBPayBillIntent fromAccount](self, "fromAccount");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBPayBillIntent fromAccount](self, "fromAccount");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fromAccount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_41;
  }
  else
  {

  }
  -[_INPBPayBillIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBPayBillIntent intentMetadata](self, "intentMetadata");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBPayBillIntent intentMetadata](self, "intentMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_41;
  }
  else
  {

  }
  -[_INPBPayBillIntent transactionAmount](self, "transactionAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBPayBillIntent transactionAmount](self, "transactionAmount");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBPayBillIntent transactionAmount](self, "transactionAmount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionAmount");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_41;
  }
  else
  {

  }
  -[_INPBPayBillIntent transactionNote](self, "transactionNote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBPayBillIntent transactionNote](self, "transactionNote");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_INPBPayBillIntent transactionNote](self, "transactionNote");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionNote");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_41;
  }
  else
  {

  }
  -[_INPBPayBillIntent transactionScheduledDate](self, "transactionScheduledDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionScheduledDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBPayBillIntent transactionScheduledDate](self, "transactionScheduledDate");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
    {

LABEL_44:
      v44 = 1;
      goto LABEL_42;
    }
    v40 = (void *)v39;
    -[_INPBPayBillIntent transactionScheduledDate](self, "transactionScheduledDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionScheduledDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if ((v43 & 1) != 0)
      goto LABEL_44;
  }
  else
  {
LABEL_40:

  }
LABEL_41:
  v44 = 0;
LABEL_42:

  return v44;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[_INPBBillPayeeValue hash](self->_billPayee, "hash");
  if (-[_INPBPayBillIntent hasBillType](self, "hasBillType"))
    v4 = 2654435761 * self->_billType;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[_INPBDateTimeRange hash](self->_dueDate, "hash");
  v7 = v5 ^ v6 ^ -[_INPBFinancialAccountValue hash](self->_fromAccount, "hash");
  v8 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v9 = v8 ^ -[_INPBPaymentAmountValue hash](self->_transactionAmount, "hash");
  v10 = v7 ^ v9 ^ -[_INPBString hash](self->_transactionNote, "hash");
  return v10 ^ -[_INPBDateTimeRange hash](self->_transactionScheduledDate, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBPayBillIntent billPayee](self, "billPayee");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("billPayee"));

  if (-[_INPBPayBillIntent hasBillType](self, "hasBillType"))
  {
    v6 = -[_INPBPayBillIntent billType](self, "billType");
    if ((v6 - 1) >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228DD58[(v6 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("billType"));

  }
  -[_INPBPayBillIntent dueDate](self, "dueDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dueDate"));

  -[_INPBPayBillIntent fromAccount](self, "fromAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("fromAccount"));

  -[_INPBPayBillIntent intentMetadata](self, "intentMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("intentMetadata"));

  -[_INPBPayBillIntent transactionAmount](self, "transactionAmount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("transactionAmount"));

  -[_INPBPayBillIntent transactionNote](self, "transactionNote");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("transactionNote"));

  -[_INPBPayBillIntent transactionScheduledDate](self, "transactionScheduledDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("transactionScheduledDate"));

  return v3;
}

- (_INPBBillPayeeValue)billPayee
{
  return self->_billPayee;
}

- (int)billType
{
  return self->_billType;
}

- (_INPBDateTimeRange)dueDate
{
  return self->_dueDate;
}

- (_INPBFinancialAccountValue)fromAccount
{
  return self->_fromAccount;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBPaymentAmountValue)transactionAmount
{
  return self->_transactionAmount;
}

- (_INPBString)transactionNote
{
  return self->_transactionNote;
}

- (_INPBDateTimeRange)transactionScheduledDate
{
  return self->_transactionScheduledDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionScheduledDate, 0);
  objc_storeStrong((id *)&self->_transactionNote, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_fromAccount, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_billPayee, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
