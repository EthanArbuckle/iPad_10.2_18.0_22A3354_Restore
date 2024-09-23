@implementation INBalanceAmount

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;

  v5 = a3;
  objc_msgSend(v5, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INBalanceAmount currencyCode](self, "currencyCode");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[INBalanceAmount amount](self, "amount"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v10, "setNumberStyle:", 2);
    -[INBalanceAmount currencyCode](self, "currencyCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCurrencyCode:", v11);

    objc_msgSend(v10, "setLocale:", v6);
    -[INBalanceAmount amount](self, "amount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromNumber:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[INBalanceAmount balanceType](self, "balanceType") == INBalanceTypeUnknown
      || (-[INBalanceAmount amount](self, "amount"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          !v14))
    {
      v16 = 0;
      goto LABEL_9;
    }
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[INBalanceAmount amount](self, "amount");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    INBalanceTypeGetLocalizedName(-[INBalanceAmount balanceType](self, "balanceType"), v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "initWithFormat:locale:", CFSTR("%@ %@"), v6, v10, v12);
  }
  v16 = (void *)v13;

LABEL_9:
  return v16;
}

- (INBalanceAmount)initWithAmount:(NSDecimalNumber *)amount balanceType:(INBalanceType)balanceType
{
  NSDecimalNumber *v6;
  INBalanceAmount *v7;
  INBalanceAmount *v8;
  uint64_t v9;
  NSDecimalNumber *v10;
  NSString *currencyCode;
  objc_super v13;

  v6 = amount;
  if (balanceType == INBalanceTypeMoney)
  {
    NSLog((NSString *)CFSTR("Initializing INBalanceAmount with INBalanceTypeMoney not allowed. Use initWithAmount:currencyCode: instead"));
    v7 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)INBalanceAmount;
    v8 = -[INBalanceAmount init](&v13, sel_init);
    if (v8)
    {
      v9 = -[NSDecimalNumber copy](v6, "copy");
      v10 = v8->_amount;
      v8->_amount = (NSDecimalNumber *)v9;

      currencyCode = v8->_currencyCode;
      v8->_balanceType = balanceType;
      v8->_currencyCode = 0;

    }
    self = v8;
    v7 = self;
  }

  return v7;
}

- (INBalanceAmount)initWithAmount:(NSDecimalNumber *)amount currencyCode:(NSString *)currencyCode
{
  NSDecimalNumber *v6;
  NSString *v7;
  INBalanceAmount *v8;
  uint64_t v9;
  NSDecimalNumber *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v14;

  v6 = amount;
  v7 = currencyCode;
  v14.receiver = self;
  v14.super_class = (Class)INBalanceAmount;
  v8 = -[INBalanceAmount init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSDecimalNumber copy](v6, "copy");
    v10 = v8->_amount;
    v8->_amount = (NSDecimalNumber *)v9;

    v8->_balanceType = 1;
    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v11;

  }
  return v8;
}

- (INBalanceAmount)initWithAmount:(id)a3 balanceType:(int64_t)a4 currencyCode:(id)a5
{
  id v8;
  id v9;
  INBalanceAmount *v10;
  uint64_t v11;
  NSDecimalNumber *amount;
  uint64_t v13;
  NSString *currencyCode;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INBalanceAmount;
  v10 = -[INBalanceAmount init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    amount = v10->_amount;
    v10->_amount = (NSDecimalNumber *)v11;

    v10->_balanceType = a4;
    v13 = objc_msgSend(v9, "copy");
    currencyCode = v10->_currencyCode;
    v10->_currencyCode = (NSString *)v13;

  }
  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSString *currencyCode;
  int64_t v5;

  v3 = -[NSDecimalNumber hash](self->_amount, "hash");
  currencyCode = self->_currencyCode;
  v5 = self->_balanceType ^ v3;
  return v5 ^ -[NSString hash](currencyCode, "hash");
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
    if ((amount == (NSDecimalNumber *)v5[1] || -[NSDecimalNumber isEqual:](amount, "isEqual:"))
      && self->_balanceType == v5[2])
    {
      currencyCode = self->_currencyCode;
      if (currencyCode == (NSString *)v5[3] || -[NSString isEqual:](currencyCode, "isEqual:"))
        v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (INBalanceAmount)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  INBalanceAmount *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("balanceType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[INBalanceAmount initWithAmount:balanceType:currencyCode:](self, "initWithAmount:balanceType:currencyCode:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_balanceType, CFSTR("balanceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));

}

- (id)description
{
  return -[INBalanceAmount descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INBalanceAmount;
  -[INBalanceAmount description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INBalanceAmount _dictionaryRepresentation](self, "_dictionaryRepresentation");
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
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  NSString *currencyCode;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("amount");
  amount = self->_amount;
  v4 = amount;
  if (!amount)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("balanceType");
  v5 = self->_balanceType - 1;
  if (v5 > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E228BA50[v5];
  v7 = v6;
  v13[1] = v7;
  v12[2] = CFSTR("currencyCode");
  currencyCode = self->_currencyCode;
  v9 = currencyCode;
  if (!currencyCode)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!currencyCode)

  if (!amount)
  return v10;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (INBalanceType)balanceType
{
  return self->_balanceType;
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

@end
