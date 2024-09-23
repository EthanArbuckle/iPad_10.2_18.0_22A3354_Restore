@implementation _INPBBillDetailsValue

- (void)setAmountDue:(id)a3
{
  objc_storeStrong((id *)&self->_amountDue, a3);
}

- (BOOL)hasAmountDue
{
  return self->_amountDue != 0;
}

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
    return off_1E228CA28[a3 - 1];
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

- (void)setLateFee:(id)a3
{
  objc_storeStrong((id *)&self->_lateFee, a3);
}

- (BOOL)hasLateFee
{
  return self->_lateFee != 0;
}

- (void)setMinimumDue:(id)a3
{
  objc_storeStrong((id *)&self->_minimumDue, a3);
}

- (BOOL)hasMinimumDue
{
  return self->_minimumDue != 0;
}

- (void)setPaymentDate:(id)a3
{
  objc_storeStrong((id *)&self->_paymentDate, a3);
}

- (BOOL)hasPaymentDate
{
  return self->_paymentDate != 0;
}

- (void)setStatus:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_status = a3;
  }
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)statusAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1E228CAD8[a3 - 1];
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
  return _INPBBillDetailsValueReadFrom(self, (uint64_t)a3);
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
  -[_INPBBillDetailsValue amountDue](self, "amountDue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBBillDetailsValue amountDue](self, "amountDue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBBillDetailsValue billPayee](self, "billPayee");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBBillDetailsValue billPayee](self, "billPayee");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBBillDetailsValue hasBillType](self, "hasBillType"))
    PBDataWriterWriteInt32Field();
  -[_INPBBillDetailsValue dueDate](self, "dueDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBBillDetailsValue dueDate](self, "dueDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBBillDetailsValue lateFee](self, "lateFee");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBBillDetailsValue lateFee](self, "lateFee");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBBillDetailsValue minimumDue](self, "minimumDue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBBillDetailsValue minimumDue](self, "minimumDue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBBillDetailsValue paymentDate](self, "paymentDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBBillDetailsValue paymentDate](self, "paymentDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBBillDetailsValue hasStatus](self, "hasStatus"))
    PBDataWriterWriteInt32Field();
  -[_INPBBillDetailsValue valueMetadata](self, "valueMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v19;
  if (v16)
  {
    -[_INPBBillDetailsValue valueMetadata](self, "valueMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v17 = v19;
  }

}

- (_INPBBillDetailsValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBBillDetailsValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBBillDetailsValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBBillDetailsValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBBillDetailsValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBBillDetailsValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBBillDetailsValue *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v5 = -[_INPBBillDetailsValue init](+[_INPBBillDetailsValue allocWithZone:](_INPBBillDetailsValue, "allocWithZone:"), "init");
  v6 = -[_INPBCurrencyAmountValue copyWithZone:](self->_amountDue, "copyWithZone:", a3);
  -[_INPBBillDetailsValue setAmountDue:](v5, "setAmountDue:", v6);

  v7 = -[_INPBBillPayeeValue copyWithZone:](self->_billPayee, "copyWithZone:", a3);
  -[_INPBBillDetailsValue setBillPayee:](v5, "setBillPayee:", v7);

  if (-[_INPBBillDetailsValue hasBillType](self, "hasBillType"))
    -[_INPBBillDetailsValue setBillType:](v5, "setBillType:", -[_INPBBillDetailsValue billType](self, "billType"));
  v8 = -[_INPBDateTime copyWithZone:](self->_dueDate, "copyWithZone:", a3);
  -[_INPBBillDetailsValue setDueDate:](v5, "setDueDate:", v8);

  v9 = -[_INPBCurrencyAmountValue copyWithZone:](self->_lateFee, "copyWithZone:", a3);
  -[_INPBBillDetailsValue setLateFee:](v5, "setLateFee:", v9);

  v10 = -[_INPBCurrencyAmountValue copyWithZone:](self->_minimumDue, "copyWithZone:", a3);
  -[_INPBBillDetailsValue setMinimumDue:](v5, "setMinimumDue:", v10);

  v11 = -[_INPBDateTime copyWithZone:](self->_paymentDate, "copyWithZone:", a3);
  -[_INPBBillDetailsValue setPaymentDate:](v5, "setPaymentDate:", v11);

  if (-[_INPBBillDetailsValue hasStatus](self, "hasStatus"))
    -[_INPBBillDetailsValue setStatus:](v5, "setStatus:", -[_INPBBillDetailsValue status](self, "status"));
  v12 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBBillDetailsValue setValueMetadata:](v5, "setValueMetadata:", v12);

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
  int billType;
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
  int v39;
  int status;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  BOOL v46;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  -[_INPBBillDetailsValue amountDue](self, "amountDue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "amountDue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBBillDetailsValue amountDue](self, "amountDue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBBillDetailsValue amountDue](self, "amountDue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "amountDue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_45;
  }
  else
  {

  }
  -[_INPBBillDetailsValue billPayee](self, "billPayee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "billPayee");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBBillDetailsValue billPayee](self, "billPayee");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBBillDetailsValue billPayee](self, "billPayee");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "billPayee");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_45;
  }
  else
  {

  }
  v17 = -[_INPBBillDetailsValue hasBillType](self, "hasBillType");
  if (v17 != objc_msgSend(v4, "hasBillType"))
    goto LABEL_45;
  if (-[_INPBBillDetailsValue hasBillType](self, "hasBillType"))
  {
    if (objc_msgSend(v4, "hasBillType"))
    {
      billType = self->_billType;
      if (billType != objc_msgSend(v4, "billType"))
        goto LABEL_45;
    }
  }
  -[_INPBBillDetailsValue dueDate](self, "dueDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBBillDetailsValue dueDate](self, "dueDate");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBBillDetailsValue dueDate](self, "dueDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dueDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_45;
  }
  else
  {

  }
  -[_INPBBillDetailsValue lateFee](self, "lateFee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lateFee");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBBillDetailsValue lateFee](self, "lateFee");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBBillDetailsValue lateFee](self, "lateFee");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lateFee");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_45;
  }
  else
  {

  }
  -[_INPBBillDetailsValue minimumDue](self, "minimumDue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumDue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBBillDetailsValue minimumDue](self, "minimumDue");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBBillDetailsValue minimumDue](self, "minimumDue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minimumDue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_45;
  }
  else
  {

  }
  -[_INPBBillDetailsValue paymentDate](self, "paymentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_44;
  -[_INPBBillDetailsValue paymentDate](self, "paymentDate");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_INPBBillDetailsValue paymentDate](self, "paymentDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_45;
  }
  else
  {

  }
  v39 = -[_INPBBillDetailsValue hasStatus](self, "hasStatus");
  if (v39 != objc_msgSend(v4, "hasStatus"))
    goto LABEL_45;
  if (-[_INPBBillDetailsValue hasStatus](self, "hasStatus"))
  {
    if (objc_msgSend(v4, "hasStatus"))
    {
      status = self->_status;
      if (status != objc_msgSend(v4, "status"))
        goto LABEL_45;
    }
  }
  -[_INPBBillDetailsValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBBillDetailsValue valueMetadata](self, "valueMetadata");
    v41 = objc_claimAutoreleasedReturnValue();
    if (!v41)
    {

LABEL_48:
      v46 = 1;
      goto LABEL_46;
    }
    v42 = (void *)v41;
    -[_INPBBillDetailsValue valueMetadata](self, "valueMetadata");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if ((v45 & 1) != 0)
      goto LABEL_48;
  }
  else
  {
LABEL_44:

  }
LABEL_45:
  v46 = 0;
LABEL_46:

  return v46;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v3 = -[_INPBCurrencyAmountValue hash](self->_amountDue, "hash");
  v4 = -[_INPBBillPayeeValue hash](self->_billPayee, "hash");
  if (-[_INPBBillDetailsValue hasBillType](self, "hasBillType"))
    v5 = 2654435761 * self->_billType;
  else
    v5 = 0;
  v6 = -[_INPBDateTime hash](self->_dueDate, "hash");
  v7 = -[_INPBCurrencyAmountValue hash](self->_lateFee, "hash");
  v8 = -[_INPBCurrencyAmountValue hash](self->_minimumDue, "hash");
  v9 = -[_INPBDateTime hash](self->_paymentDate, "hash");
  if (-[_INPBBillDetailsValue hasStatus](self, "hasStatus"))
    v10 = 2654435761 * self->_status;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBBillDetailsValue amountDue](self, "amountDue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("amountDue"));

  -[_INPBBillDetailsValue billPayee](self, "billPayee");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("billPayee"));

  if (-[_INPBBillDetailsValue hasBillType](self, "hasBillType"))
  {
    v8 = -[_INPBBillDetailsValue billType](self, "billType");
    if ((v8 - 1) >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E228CA28[(v8 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("billType"));

  }
  -[_INPBBillDetailsValue dueDate](self, "dueDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("dueDate"));

  -[_INPBBillDetailsValue lateFee](self, "lateFee");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("lateFee"));

  -[_INPBBillDetailsValue minimumDue](self, "minimumDue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("minimumDue"));

  -[_INPBBillDetailsValue paymentDate](self, "paymentDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("paymentDate"));

  if (-[_INPBBillDetailsValue hasStatus](self, "hasStatus"))
  {
    v18 = -[_INPBBillDetailsValue status](self, "status");
    if ((v18 - 1) >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E228CAD8[(v18 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("status"));

  }
  -[_INPBBillDetailsValue valueMetadata](self, "valueMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("valueMetadata"));

  return v3;
}

- (_INPBCurrencyAmountValue)amountDue
{
  return self->_amountDue;
}

- (_INPBBillPayeeValue)billPayee
{
  return self->_billPayee;
}

- (int)billType
{
  return self->_billType;
}

- (_INPBDateTime)dueDate
{
  return self->_dueDate;
}

- (_INPBCurrencyAmountValue)lateFee
{
  return self->_lateFee;
}

- (_INPBCurrencyAmountValue)minimumDue
{
  return self->_minimumDue;
}

- (_INPBDateTime)paymentDate
{
  return self->_paymentDate;
}

- (int)status
{
  return self->_status;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
  objc_storeStrong((id *)&self->_lateFee, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_billPayee, 0);
  objc_storeStrong((id *)&self->_amountDue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
