@implementation FHPaymentRingData

- (FHPaymentRingData)initWithTransactionDate:(id)a3 transactionAmount:(id)a4 paymentAmountCategory:(unint64_t)a5
{
  id v9;
  id v10;
  FHPaymentRingData *v11;
  FHPaymentRingData *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FHPaymentRingData;
  v11 = -[FHPaymentRingData init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_transactionDate, a3);
    objc_storeStrong((id *)&v12->_transactionAmount, a4);
    v12->_paymentAmountCategory = a5;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[FHPaymentRingData transactionAmount](self, "transactionAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[FHPaymentRingData transactionDate](self, "transactionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 17 * (17 * v4 + objc_msgSend(v5, "hash"));

  return v6 + -[FHPaymentRingData paymentAmountCategory](self, "paymentAmountCategory") + 4913;
}

- (BOOL)isEqual:(id)a3
{
  FHPaymentRingData *v4;
  FHPaymentRingData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  unint64_t v11;

  v4 = (FHPaymentRingData *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[FHPaymentRingData transactionDate](self, "transactionDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHPaymentRingData transactionDate](v5, "transactionDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[FHPaymentRingData transactionAmount](self, "transactionAmount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHPaymentRingData transactionAmount](v5, "transactionAmount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
      {
        v11 = -[FHPaymentRingData paymentAmountCategory](self, "paymentAmountCategory");
        v10 = v11 == -[FHPaymentRingData paymentAmountCategory](v5, "paymentAmountCategory");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionDate: '%@'; "), self->_transactionDate);
  FHPaymentRingSuggestionCategoryToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentAmountCategory: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("transactionAmount: '%@'; "), self->_transactionAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)paymentAmountCategory
{
  return self->_paymentAmountCategory;
}

- (void)setPaymentAmountCategory:(unint64_t)a3
{
  self->_paymentAmountCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
}

@end
