@implementation _INPBSearchForBillsIntent

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
    return off_1E22901F8[a3 - 1];
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

- (void)setDueDateRange:(id)a3
{
  objc_storeStrong((id *)&self->_dueDateRange, a3);
}

- (BOOL)hasDueDateRange
{
  return self->_dueDateRange != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setPaymentDateRange:(id)a3
{
  objc_storeStrong((id *)&self->_paymentDateRange, a3);
}

- (BOOL)hasPaymentDateRange
{
  return self->_paymentDateRange != 0;
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
    return off_1E22902A8[a3 - 1];
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
  return _INPBSearchForBillsIntentReadFrom(self, (uint64_t)a3);
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
  -[_INPBSearchForBillsIntent billPayee](self, "billPayee");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSearchForBillsIntent billPayee](self, "billPayee");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSearchForBillsIntent hasBillType](self, "hasBillType"))
    PBDataWriterWriteInt32Field();
  -[_INPBSearchForBillsIntent dueDateRange](self, "dueDateRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSearchForBillsIntent dueDateRange](self, "dueDateRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForBillsIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBSearchForBillsIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForBillsIntent paymentDateRange](self, "paymentDateRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBSearchForBillsIntent paymentDateRange](self, "paymentDateRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSearchForBillsIntent hasStatus](self, "hasStatus"))
    PBDataWriterWriteInt32Field();

}

- (_INPBSearchForBillsIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchForBillsIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchForBillsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchForBillsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchForBillsIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSearchForBillsIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchForBillsIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = -[_INPBSearchForBillsIntent init](+[_INPBSearchForBillsIntent allocWithZone:](_INPBSearchForBillsIntent, "allocWithZone:"), "init");
  v6 = -[_INPBBillPayeeValue copyWithZone:](self->_billPayee, "copyWithZone:", a3);
  -[_INPBSearchForBillsIntent setBillPayee:](v5, "setBillPayee:", v6);

  if (-[_INPBSearchForBillsIntent hasBillType](self, "hasBillType"))
    -[_INPBSearchForBillsIntent setBillType:](v5, "setBillType:", -[_INPBSearchForBillsIntent billType](self, "billType"));
  v7 = -[_INPBDateTimeRange copyWithZone:](self->_dueDateRange, "copyWithZone:", a3);
  -[_INPBSearchForBillsIntent setDueDateRange:](v5, "setDueDateRange:", v7);

  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSearchForBillsIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  v9 = -[_INPBDateTimeRange copyWithZone:](self->_paymentDateRange, "copyWithZone:", a3);
  -[_INPBSearchForBillsIntent setPaymentDateRange:](v5, "setPaymentDateRange:", v9);

  if (-[_INPBSearchForBillsIntent hasStatus](self, "hasStatus"))
    -[_INPBSearchForBillsIntent setStatus:](v5, "setStatus:", -[_INPBSearchForBillsIntent status](self, "status"));
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
  BOOL v29;
  int v31;
  int status;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[_INPBSearchForBillsIntent billPayee](self, "billPayee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "billPayee");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBSearchForBillsIntent billPayee](self, "billPayee");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSearchForBillsIntent billPayee](self, "billPayee");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "billPayee");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_26;
  }
  else
  {

  }
  v12 = -[_INPBSearchForBillsIntent hasBillType](self, "hasBillType");
  if (v12 != objc_msgSend(v4, "hasBillType"))
    goto LABEL_26;
  if (-[_INPBSearchForBillsIntent hasBillType](self, "hasBillType"))
  {
    if (objc_msgSend(v4, "hasBillType"))
    {
      billType = self->_billType;
      if (billType != objc_msgSend(v4, "billType"))
        goto LABEL_26;
    }
  }
  -[_INPBSearchForBillsIntent dueDateRange](self, "dueDateRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dueDateRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBSearchForBillsIntent dueDateRange](self, "dueDateRange");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBSearchForBillsIntent dueDateRange](self, "dueDateRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dueDateRange");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBSearchForBillsIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBSearchForBillsIntent intentMetadata](self, "intentMetadata");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBSearchForBillsIntent intentMetadata](self, "intentMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBSearchForBillsIntent paymentDateRange](self, "paymentDateRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentDateRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_25:

    goto LABEL_26;
  }
  -[_INPBSearchForBillsIntent paymentDateRange](self, "paymentDateRange");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBSearchForBillsIntent paymentDateRange](self, "paymentDateRange");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentDateRange");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_26;
  }
  else
  {

  }
  v31 = -[_INPBSearchForBillsIntent hasStatus](self, "hasStatus");
  if (v31 == objc_msgSend(v4, "hasStatus"))
  {
    if (!-[_INPBSearchForBillsIntent hasStatus](self, "hasStatus")
      || !objc_msgSend(v4, "hasStatus")
      || (status = self->_status, status == objc_msgSend(v4, "status")))
    {
      v29 = 1;
      goto LABEL_27;
    }
  }
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[_INPBBillPayeeValue hash](self->_billPayee, "hash");
  if (-[_INPBSearchForBillsIntent hasBillType](self, "hasBillType"))
    v4 = 2654435761 * self->_billType;
  else
    v4 = 0;
  v5 = -[_INPBDateTimeRange hash](self->_dueDateRange, "hash");
  v6 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v7 = -[_INPBDateTimeRange hash](self->_paymentDateRange, "hash");
  if (-[_INPBSearchForBillsIntent hasStatus](self, "hasStatus"))
    v8 = 2654435761 * self->_status;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
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
  uint64_t v14;
  __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSearchForBillsIntent billPayee](self, "billPayee");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("billPayee"));

  if (-[_INPBSearchForBillsIntent hasBillType](self, "hasBillType"))
  {
    v6 = -[_INPBSearchForBillsIntent billType](self, "billType");
    if ((v6 - 1) >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E22901F8[(v6 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("billType"));

  }
  -[_INPBSearchForBillsIntent dueDateRange](self, "dueDateRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dueDateRange"));

  -[_INPBSearchForBillsIntent intentMetadata](self, "intentMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("intentMetadata"));

  -[_INPBSearchForBillsIntent paymentDateRange](self, "paymentDateRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("paymentDateRange"));

  if (-[_INPBSearchForBillsIntent hasStatus](self, "hasStatus"))
  {
    v14 = -[_INPBSearchForBillsIntent status](self, "status");
    if ((v14 - 1) >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E22902A8[(v14 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("status"));

  }
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

- (_INPBDateTimeRange)dueDateRange
{
  return self->_dueDateRange;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDateTimeRange)paymentDateRange
{
  return self->_paymentDateRange;
}

- (int)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDateRange, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_dueDateRange, 0);
  objc_storeStrong((id *)&self->_billPayee, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
