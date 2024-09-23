@implementation INPaymentAmount

- (INPaymentAmount)initWithAmountType:(INAmountType)amountType amount:(INCurrencyAmount *)amount
{
  INCurrencyAmount *v6;
  INPaymentAmount *v7;
  uint64_t v8;
  INCurrencyAmount *v9;
  objc_super v11;

  v6 = amount;
  v11.receiver = self;
  v11.super_class = (Class)INPaymentAmount;
  v7 = -[INPaymentAmount init](&v11, sel_init);
  if (v7)
  {
    v8 = -[INCurrencyAmount copy](v6, "copy");
    v9 = v7->_amount;
    v7->_amount = (INCurrencyAmount *)v8;

    v7->_amountType = amountType;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[INCurrencyAmount hash](self->_amount, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_amountType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  INPaymentAmount *v4;
  INPaymentAmount *v5;
  INCurrencyAmount *amount;
  BOOL v7;

  v4 = (INPaymentAmount *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      amount = self->_amount;
      v7 = (amount == v5->_amount || -[INCurrencyAmount isEqual:](amount, "isEqual:"))
        && self->_amountType == v5->_amountType;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INPaymentAmount)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  INPaymentAmount *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("amountType"));

  v7 = -[INPaymentAmount initWithAmountType:amount:](self, "initWithAmountType:amount:", v6, v5);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  INCurrencyAmount *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_amountType, CFSTR("amountType"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_amount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("amount"));
  v9 = self->_amountType - 1;
  if (v9 > 5)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E228D238[v9];
  v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("amountType"));

  return v7;
}

- (NSString)description
{
  return (NSString *)-[INPaymentAmount descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INPaymentAmount;
  -[INPaymentAmount description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPaymentAmount _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INCurrencyAmount *amount;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("amount");
  amount = self->_amount;
  v4 = amount;
  if (!amount)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[1] = CFSTR("amountType");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_amountType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!amount)
  return v6;
}

- (INCurrencyAmount)amount
{
  return self->_amount;
}

- (INAmountType)amountType
{
  return self->_amountType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
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
  void *v12;
  uint64_t v13;
  void *v14;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("amount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("amountType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = INAmountTypeWithString(v12);

    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAmountType:amount:", v13, v11);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[INPaymentAmount amount](self, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INPaymentAmount amount](self, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v7;
  }
  else
  {
    INAmountTypeGetLocalizedName(-[INPaymentAmount amountType](self, "amountType"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
