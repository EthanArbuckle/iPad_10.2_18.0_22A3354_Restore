@implementation INCurrencyAmount

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v6, "setNumberStyle:", 2);
  -[INCurrencyAmount currencyCode](self, "currencyCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrencyCode:", v7);

  objc_msgSend(v6, "setLocale:", v5);
  -[INCurrencyAmount amount](self, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (INCurrencyAmount)initWithAmount:(NSDecimalNumber *)amount currencyCode:(NSString *)currencyCode
{
  NSDecimalNumber *v6;
  NSString *v7;
  INCurrencyAmount *v8;
  uint64_t v9;
  NSDecimalNumber *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v14;

  v6 = amount;
  v7 = currencyCode;
  v14.receiver = self;
  v14.super_class = (Class)INCurrencyAmount;
  v8 = -[INCurrencyAmount init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSDecimalNumber copy](v6, "copy");
    v10 = v8->_amount;
    v8->_amount = (NSDecimalNumber *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDecimalNumber hash](self->_amount, "hash");
  return -[NSString hash](self->_currencyCode, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSDecimalNumber *amount;
  NSString *currencyCode;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    amount = self->_amount;
    v8 = 0;
    if (amount == (NSDecimalNumber *)v5[1] || -[NSDecimalNumber isEqual:](amount, "isEqual:"))
    {
      currencyCode = self->_currencyCode;
      if (currencyCode == (NSString *)v5[2] || -[NSString isEqual:](currencyCode, "isEqual:"))
        v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (INCurrencyAmount)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INCurrencyAmount *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[INCurrencyAmount initWithAmount:currencyCode:](self, "initWithAmount:currencyCode:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));

}

- (NSString)description
{
  return (NSString *)-[INCurrencyAmount descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INCurrencyAmount;
  -[INCurrencyAmount description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCurrencyAmount _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSDecimalNumber *amount;
  void *v4;
  NSString *currencyCode;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("amount");
  amount = self->_amount;
  v4 = amount;
  if (!amount)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("currencyCode");
  v10[0] = v4;
  currencyCode = self->_currencyCode;
  v6 = currencyCode;
  if (!currencyCode)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!currencyCode)
  {

    if (amount)
      return v7;
LABEL_9:

    return v7;
  }
  if (!amount)
    goto LABEL_9;
  return v7;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v13 = v9;

    objc_msgSend(v13, "amount");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "doubleValue");
    objc_msgSend(v7, "numberWithDouble:");
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v12 = (void *)v15;

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v6;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v14 = v11;

    objc_msgSend(v14, "if_flatMap:", &__block_literal_global_28580);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[INCurrencyAmount amount](self, "amount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  objc_msgSend(v16, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "_intents_compareValue:relation:", v12, a4);

  return v19;
}

id __88__INCurrencyAmount_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v2, "amount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "doubleValue");
      objc_msgSend(v3, "numberWithDouble:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v2;
    }
    else
    {
      v5 = 0;
      v6 = 0;
      v4 = v2;
    }
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "if_arrayWithObjectIfNonNil:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
