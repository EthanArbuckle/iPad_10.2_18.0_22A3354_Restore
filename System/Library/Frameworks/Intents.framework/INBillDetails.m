@implementation INBillDetails

- (INBillDetails)initWithBillType:(INBillType)billType paymentStatus:(INPaymentStatus)paymentStatus billPayee:(INBillPayee *)billPayee amountDue:(INCurrencyAmount *)amountDue minimumDue:(INCurrencyAmount *)minimumDue lateFee:(INCurrencyAmount *)lateFee dueDate:(NSDateComponents *)dueDate paymentDate:(NSDateComponents *)paymentDate
{
  INBillPayee *v16;
  INCurrencyAmount *v17;
  INCurrencyAmount *v18;
  INCurrencyAmount *v19;
  NSDateComponents *v20;
  NSDateComponents *v21;
  INBillDetails *v22;
  uint64_t v23;
  INBillPayee *v24;
  uint64_t v25;
  INCurrencyAmount *v26;
  uint64_t v27;
  INCurrencyAmount *v28;
  uint64_t v29;
  INCurrencyAmount *v30;
  uint64_t v31;
  NSDateComponents *v32;
  uint64_t v33;
  NSDateComponents *v34;
  objc_super v36;

  v16 = billPayee;
  v17 = amountDue;
  v18 = minimumDue;
  v19 = lateFee;
  v20 = dueDate;
  v21 = paymentDate;
  v36.receiver = self;
  v36.super_class = (Class)INBillDetails;
  v22 = -[INBillDetails init](&v36, sel_init);
  if (v22)
  {
    v23 = -[INBillPayee copy](v16, "copy");
    v24 = v22->_billPayee;
    v22->_billPayee = (INBillPayee *)v23;

    v25 = -[INCurrencyAmount copy](v17, "copy");
    v26 = v22->_amountDue;
    v22->_amountDue = (INCurrencyAmount *)v25;

    v27 = -[INCurrencyAmount copy](v18, "copy");
    v28 = v22->_minimumDue;
    v22->_minimumDue = (INCurrencyAmount *)v27;

    v29 = -[INCurrencyAmount copy](v19, "copy");
    v30 = v22->_lateFee;
    v22->_lateFee = (INCurrencyAmount *)v29;

    v31 = -[NSDateComponents copy](v20, "copy");
    v32 = v22->_dueDate;
    v22->_dueDate = (NSDateComponents *)v31;

    v33 = -[NSDateComponents copy](v21, "copy");
    v34 = v22->_paymentDate;
    v22->_paymentDate = (NSDateComponents *)v33;

    v22->_billType = billType;
    v22->_paymentStatus = paymentStatus;
  }

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  v3 = -[INBillPayee hash](self->_billPayee, "hash");
  v4 = -[INCurrencyAmount hash](self->_amountDue, "hash") ^ v3;
  v5 = -[INCurrencyAmount hash](self->_minimumDue, "hash");
  v6 = v4 ^ v5 ^ -[INCurrencyAmount hash](self->_lateFee, "hash");
  v7 = -[NSDateComponents hash](self->_dueDate, "hash");
  v8 = v6 ^ v7 ^ -[NSDateComponents hash](self->_paymentDate, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_billType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_paymentStatus);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  INBillDetails *v4;
  INBillDetails *v5;
  INBillPayee *billPayee;
  INCurrencyAmount *amountDue;
  INCurrencyAmount *minimumDue;
  INCurrencyAmount *lateFee;
  NSDateComponents *dueDate;
  NSDateComponents *paymentDate;
  BOOL v12;

  v4 = (INBillDetails *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      billPayee = self->_billPayee;
      v12 = (billPayee == v5->_billPayee || -[INBillPayee isEqual:](billPayee, "isEqual:"))
         && ((amountDue = self->_amountDue, amountDue == v5->_amountDue)
          || -[INCurrencyAmount isEqual:](amountDue, "isEqual:"))
         && ((minimumDue = self->_minimumDue, minimumDue == v5->_minimumDue)
          || -[INCurrencyAmount isEqual:](minimumDue, "isEqual:"))
         && ((lateFee = self->_lateFee, lateFee == v5->_lateFee) || -[INCurrencyAmount isEqual:](lateFee, "isEqual:"))
         && ((dueDate = self->_dueDate, dueDate == v5->_dueDate)
          || -[NSDateComponents isEqual:](dueDate, "isEqual:"))
         && ((paymentDate = self->_paymentDate, paymentDate == v5->_paymentDate)
          || -[NSDateComponents isEqual:](paymentDate, "isEqual:"))
         && self->_billType == v5->_billType
         && self->_paymentStatus == v5->_paymentStatus;

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (INBillDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  INBillDetails *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billPayee"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountDue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumDue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lateFee"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("billType"));
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentStatus"));

  v13 = -[INBillDetails initWithBillType:paymentStatus:billPayee:amountDue:minimumDue:lateFee:dueDate:paymentDate:](self, "initWithBillType:paymentStatus:billPayee:amountDue:minimumDue:lateFee:dueDate:paymentDate:", v11, v12, v5, v6, v7, v8, v9, v10);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  INBillPayee *billPayee;
  id v5;

  billPayee = self->_billPayee;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", billPayee, CFSTR("billPayee"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amountDue, CFSTR("amountDue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimumDue, CFSTR("minimumDue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lateFee, CFSTR("lateFee"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dueDate, CFSTR("dueDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentDate, CFSTR("paymentDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_billType, CFSTR("billType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_paymentStatus, CFSTR("paymentStatus"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;
  unint64_t v17;
  __CFString *v18;
  __CFString *v19;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_billPayee);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("billPayee"));

  objc_msgSend(v6, "encodeObject:", self->_amountDue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("amountDue"));

  objc_msgSend(v6, "encodeObject:", self->_minimumDue);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("minimumDue"));

  objc_msgSend(v6, "encodeObject:", self->_lateFee);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("lateFee"));

  objc_msgSend(v6, "encodeObject:", self->_dueDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("dueDate"));

  objc_msgSend(v6, "encodeObject:", self->_paymentDate);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("paymentDate"));
  v14 = self->_billType - 1;
  if (v14 > 0x15)
    v15 = CFSTR("unknown");
  else
    v15 = off_1E228D0B0[v14];
  v16 = v15;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("billType"));

  v17 = self->_paymentStatus - 1;
  if (v17 > 4)
    v18 = CFSTR("unknown");
  else
    v18 = *(&off_1E228A690 + v17);
  v19 = v18;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, CFSTR("paymentStatus"));

  return v7;
}

- (NSString)description
{
  return (NSString *)-[INBillDetails descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INBillDetails;
  -[INBillDetails description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INBillDetails _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t billPayee;
  INCurrencyAmount *amountDue;
  uint64_t v5;
  INCurrencyAmount *minimumDue;
  uint64_t v7;
  INCurrencyAmount *lateFee;
  uint64_t v9;
  NSDateComponents *dueDate;
  void *v11;
  NSDateComponents *paymentDate;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[8];
  _QWORD v24[10];

  v24[8] = *MEMORY[0x1E0C80C00];
  billPayee = (uint64_t)self->_billPayee;
  v22 = billPayee;
  v23[0] = CFSTR("billPayee");
  if (!billPayee)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    billPayee = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)billPayee;
  v24[0] = billPayee;
  v23[1] = CFSTR("amountDue");
  amountDue = self->_amountDue;
  v5 = (uint64_t)amountDue;
  if (!amountDue)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v5;
  v24[1] = v5;
  v23[2] = CFSTR("minimumDue");
  minimumDue = self->_minimumDue;
  v7 = (uint64_t)minimumDue;
  if (!minimumDue)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v7;
  v24[2] = v7;
  v23[3] = CFSTR("lateFee");
  lateFee = self->_lateFee;
  v9 = (uint64_t)lateFee;
  if (!lateFee)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v9;
  v24[3] = v9;
  v23[4] = CFSTR("dueDate");
  dueDate = self->_dueDate;
  v11 = dueDate;
  if (!dueDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v11;
  v23[5] = CFSTR("paymentDate");
  paymentDate = self->_paymentDate;
  v13 = paymentDate;
  if (!paymentDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[5] = v13;
  v23[6] = CFSTR("billType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_billType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v14;
  v23[7] = CFSTR("paymentStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_paymentStatus);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (paymentDate)
  {
    if (dueDate)
      goto LABEL_15;
  }
  else
  {

    if (dueDate)
    {
LABEL_15:
      if (lateFee)
        goto LABEL_16;
      goto LABEL_23;
    }
  }

  if (lateFee)
  {
LABEL_16:
    if (minimumDue)
      goto LABEL_17;
LABEL_24:

    if (amountDue)
      goto LABEL_18;
    goto LABEL_25;
  }
LABEL_23:

  if (!minimumDue)
    goto LABEL_24;
LABEL_17:
  if (amountDue)
    goto LABEL_18;
LABEL_25:

LABEL_18:
  if (!v22)

  return v16;
}

- (INBillPayee)billPayee
{
  return self->_billPayee;
}

- (void)setBillPayee:(INBillPayee *)billPayee
{
  objc_setProperty_nonatomic_copy(self, a2, billPayee, 8);
}

- (INCurrencyAmount)amountDue
{
  return self->_amountDue;
}

- (void)setAmountDue:(INCurrencyAmount *)amountDue
{
  objc_setProperty_nonatomic_copy(self, a2, amountDue, 16);
}

- (INCurrencyAmount)minimumDue
{
  return self->_minimumDue;
}

- (void)setMinimumDue:(INCurrencyAmount *)minimumDue
{
  objc_setProperty_nonatomic_copy(self, a2, minimumDue, 24);
}

- (INCurrencyAmount)lateFee
{
  return self->_lateFee;
}

- (void)setLateFee:(INCurrencyAmount *)lateFee
{
  objc_setProperty_nonatomic_copy(self, a2, lateFee, 32);
}

- (NSDateComponents)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(NSDateComponents *)dueDate
{
  objc_setProperty_nonatomic_copy(self, a2, dueDate, 40);
}

- (NSDateComponents)paymentDate
{
  return self->_paymentDate;
}

- (void)setPaymentDate:(NSDateComponents *)paymentDate
{
  objc_setProperty_nonatomic_copy(self, a2, paymentDate, 48);
}

- (INBillType)billType
{
  return self->_billType;
}

- (void)setBillType:(INBillType)billType
{
  self->_billType = billType;
}

- (INPaymentStatus)paymentStatus
{
  return self->_paymentStatus;
}

- (void)setPaymentStatus:(INPaymentStatus)paymentStatus
{
  self->_paymentStatus = paymentStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_lateFee, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
  objc_storeStrong((id *)&self->_amountDue, 0);
  objc_storeStrong((id *)&self->_billPayee, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  objc_class *v32;
  void *v33;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("billPayee"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (objc_class *)a1;
    v11 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("amountDue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minimumDue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lateFee"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dueDate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("paymentDate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("billType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = INBillTypeWithString(v26);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("paymentStatus"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = INPaymentStatusWithString(v28);

    v30 = (void *)objc_msgSend([v32 alloc], "initWithBillType:paymentStatus:billPayee:amountDue:minimumDue:lateFee:dueDate:paymentDate:", v27, v29, v33, v13, v16, v19, v22, v25);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

@end
