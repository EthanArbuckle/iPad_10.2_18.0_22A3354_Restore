@implementation INPaymentRecord

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INPaymentRecord payee](self, "payee");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_intents_cacheableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  -[INPaymentRecord payer](self, "payer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_intents_cacheableObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v7);

  -[INPaymentRecord paymentMethod](self, "paymentMethod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_intents_cacheableObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v9);

  if (objc_msgSend(v3, "count"))
    v10 = v3;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[INPaymentRecord payee](self, "payee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  -[INPaymentRecord payer](self, "payer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_intents_updateContainerWithCache:", v4);

  -[INPaymentRecord paymentMethod](self, "paymentMethod");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_intents_updateContainerWithCache:", v4);

}

- (INPaymentRecord)initWithPayee:(INPerson *)payee payer:(INPerson *)payer currencyAmount:(INCurrencyAmount *)currencyAmount paymentMethod:(INPaymentMethod *)paymentMethod note:(NSString *)note status:(INPaymentStatus)status feeAmount:(INCurrencyAmount *)feeAmount
{
  INPerson *v15;
  INPerson *v16;
  INCurrencyAmount *v17;
  INPaymentMethod *v18;
  NSString *v19;
  INCurrencyAmount *v20;
  INPaymentRecord *v21;
  uint64_t v22;
  INPerson *v23;
  uint64_t v24;
  INPerson *v25;
  uint64_t v26;
  INCurrencyAmount *v27;
  uint64_t v28;
  NSString *v29;
  uint64_t v30;
  INPaymentMethod *v31;
  uint64_t v32;
  INCurrencyAmount *v33;
  objc_super v35;

  v15 = payee;
  v16 = payer;
  v17 = currencyAmount;
  v18 = paymentMethod;
  v19 = note;
  v20 = feeAmount;
  v35.receiver = self;
  v35.super_class = (Class)INPaymentRecord;
  v21 = -[INPaymentRecord init](&v35, sel_init);
  if (v21)
  {
    v22 = -[INPerson copy](v15, "copy");
    v23 = v21->_payee;
    v21->_payee = (INPerson *)v22;

    v24 = -[INPerson copy](v16, "copy");
    v25 = v21->_payer;
    v21->_payer = (INPerson *)v24;

    v26 = -[INCurrencyAmount copy](v17, "copy");
    v27 = v21->_currencyAmount;
    v21->_currencyAmount = (INCurrencyAmount *)v26;

    v28 = -[NSString copy](v19, "copy");
    v29 = v21->_note;
    v21->_note = (NSString *)v28;

    v21->_status = status;
    v30 = -[INPaymentMethod copy](v18, "copy");
    v31 = v21->_paymentMethod;
    v21->_paymentMethod = (INPaymentMethod *)v30;

    v32 = -[INCurrencyAmount copy](v20, "copy");
    v33 = v21->_feeAmount;
    v21->_feeAmount = (INCurrencyAmount *)v32;

  }
  return v21;
}

- (INPaymentRecord)initWithPayee:(INPerson *)payee payer:(INPerson *)payer currencyAmount:(INCurrencyAmount *)currencyAmount paymentMethod:(INPaymentMethod *)paymentMethod note:(NSString *)note status:(INPaymentStatus)status
{
  return -[INPaymentRecord initWithPayee:payer:currencyAmount:paymentMethod:note:status:feeAmount:](self, "initWithPayee:payer:currencyAmount:paymentMethod:note:status:feeAmount:", payee, payer, currencyAmount, paymentMethod, note, status, 0);
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[INPerson hash](self->_payee, "hash");
  v4 = -[INPerson hash](self->_payer, "hash") ^ v3;
  v5 = -[INCurrencyAmount hash](self->_currencyAmount, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_note, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  v9 = -[INPaymentMethod hash](self->_paymentMethod, "hash");
  v10 = v8 ^ v9 ^ -[INCurrencyAmount hash](self->_feeAmount, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  INPaymentRecord *v4;
  INPaymentRecord *v5;
  INPerson *payee;
  INPerson *payer;
  INCurrencyAmount *currencyAmount;
  NSString *note;
  INPaymentMethod *paymentMethod;
  INCurrencyAmount *feeAmount;
  BOOL v12;

  v4 = (INPaymentRecord *)a3;
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
      payee = self->_payee;
      v12 = 0;
      if (payee == v5->_payee || -[INPerson isEqual:](payee, "isEqual:"))
      {
        payer = self->_payer;
        if (payer == v5->_payer || -[INPerson isEqual:](payer, "isEqual:"))
        {
          currencyAmount = self->_currencyAmount;
          if (currencyAmount == v5->_currencyAmount || -[INCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
          {
            note = self->_note;
            if ((note == v5->_note || -[NSString isEqual:](note, "isEqual:"))
              && self->_status == v5->_status)
            {
              paymentMethod = self->_paymentMethod;
              if (paymentMethod == v5->_paymentMethod || -[INPaymentMethod isEqual:](paymentMethod, "isEqual:"))
              {
                feeAmount = self->_feeAmount;
                if (feeAmount == v5->_feeAmount || -[INCurrencyAmount isEqual:](feeAmount, "isEqual:"))
                  v12 = 1;
              }
            }
          }
        }
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (INPaymentRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  INPaymentRecord *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payee"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("note"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentMethod"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feeAmount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[INPaymentRecord initWithPayee:payer:currencyAmount:paymentMethod:note:status:feeAmount:](self, "initWithPayee:payer:currencyAmount:paymentMethod:note:status:feeAmount:", v5, v6, v7, v10, v8, v9, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  INPerson *payee;
  id v5;

  payee = self->_payee;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", payee, CFSTR("payee"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payer, CFSTR("payer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyAmount, CFSTR("currencyAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_note, CFSTR("note"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentMethod, CFSTR("paymentMethod"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_feeAmount, CFSTR("feeAmount"));

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
  unint64_t v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_payee);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("payee"));

  objc_msgSend(v6, "encodeObject:", self->_payer);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("payer"));

  objc_msgSend(v6, "encodeObject:", self->_currencyAmount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("currencyAmount"));

  objc_msgSend(v6, "encodeObject:", self->_note);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("note"));

  v12 = self->_status - 1;
  if (v12 > 4)
    v13 = CFSTR("unknown");
  else
    v13 = *(&off_1E228A690 + v12);
  v14 = v13;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("status"));

  objc_msgSend(v6, "encodeObject:", self->_paymentMethod);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("paymentMethod"));

  objc_msgSend(v6, "encodeObject:", self->_feeAmount);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("feeAmount"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INPaymentRecord descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INPaymentRecord;
  -[INPaymentRecord description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPaymentRecord _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t payee;
  INPerson *payer;
  uint64_t v5;
  INCurrencyAmount *currencyAmount;
  uint64_t v7;
  NSString *note;
  void *v9;
  void *v10;
  INPaymentMethod *paymentMethod;
  void *v12;
  INCurrencyAmount *feeAmount;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[7];
  _QWORD v23[9];

  v23[7] = *MEMORY[0x1E0C80C00];
  payee = (uint64_t)self->_payee;
  v21 = payee;
  v22[0] = CFSTR("payee");
  if (!payee)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    payee = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)payee;
  v23[0] = payee;
  v22[1] = CFSTR("payer");
  payer = self->_payer;
  v5 = (uint64_t)payer;
  if (!payer)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v5;
  v23[1] = v5;
  v22[2] = CFSTR("currencyAmount");
  currencyAmount = self->_currencyAmount;
  v7 = (uint64_t)currencyAmount;
  if (!currencyAmount)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v7;
  v23[2] = v7;
  v22[3] = CFSTR("note");
  note = self->_note;
  v9 = note;
  if (!note)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v7, v19, v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[3] = v9;
  v22[4] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v10;
  v22[5] = CFSTR("paymentMethod");
  paymentMethod = self->_paymentMethod;
  v12 = paymentMethod;
  if (!paymentMethod)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[5] = v12;
  v22[6] = CFSTR("feeAmount");
  feeAmount = self->_feeAmount;
  v14 = feeAmount;
  if (!feeAmount)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (feeAmount)
  {
    if (paymentMethod)
      goto LABEL_15;
  }
  else
  {

    if (paymentMethod)
      goto LABEL_15;
  }

LABEL_15:
  if (note)
  {
    if (currencyAmount)
      goto LABEL_17;
LABEL_24:

    if (payer)
      goto LABEL_18;
    goto LABEL_25;
  }

  if (!currencyAmount)
    goto LABEL_24;
LABEL_17:
  if (payer)
    goto LABEL_18;
LABEL_25:

LABEL_18:
  if (!v21)

  return v15;
}

- (INPerson)payee
{
  return self->_payee;
}

- (INPerson)payer
{
  return self->_payer;
}

- (INCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (NSString)note
{
  return self->_note;
}

- (INPaymentStatus)status
{
  return self->_status;
}

- (INPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (INCurrencyAmount)feeAmount
{
  return self->_feeAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feeAmount, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_payer, 0);
  objc_storeStrong((id *)&self->_payee, 0);
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
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v31;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = (objc_class *)a1;
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("payee"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("payer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("currencyAmount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("note"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("status"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = INPaymentStatusWithString(v21);

    v23 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("paymentMethod"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("feeAmount"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)objc_msgSend([v31 alloc], "initWithPayee:payer:currencyAmount:paymentMethod:note:status:feeAmount:", v11, v14, v17, v25, v20, v22, v28);
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

@end
