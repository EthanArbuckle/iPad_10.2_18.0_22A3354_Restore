@implementation FHPaymentRingSuggestionRequest

- (FHPaymentRingSuggestionRequest)initWithcurrentStatement:(id)a3 previousStatement:(id)a4 previousStatementPaymentsSum:(id)a5 currentStatementPaymentsSum:(id)a6 statementPurchasesSum:(id)a7 merchantCategoryTransactionSums:(id)a8 paymentDetails:(id)a9
{
  id v16;
  id v17;
  FHPaymentRingSuggestionRequest *v18;
  FHPaymentRingSuggestionRequest *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)FHPaymentRingSuggestionRequest;
  v18 = -[FHPaymentRingSuggestionRequest init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_currentStatement, a3);
    objc_storeStrong((id *)&v19->_previousStatement, a4);
    objc_storeStrong((id *)&v19->_previousStatementPaymentsSum, a5);
    objc_storeStrong((id *)&v19->_currentStatementPaymentsSum, a6);
    objc_storeStrong((id *)&v19->_statementPurchasesSum, a7);
    objc_storeStrong((id *)&v19->_merchantCategoryTransactionSums, a8);
    objc_storeStrong((id *)&v19->_paymentDetails, a9);
  }

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  -[FHPaymentRingSuggestionRequest currentStatement](self, "currentStatement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[FHPaymentRingSuggestionRequest previousStatement](self, "previousStatement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 17 * (17 * v4 + objc_msgSend(v5, "hash"));

  -[FHPaymentRingSuggestionRequest previousStatementPaymentsSum](self, "previousStatementPaymentsSum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 17 * (v6 + objc_msgSend(v7, "hash"));

  -[FHPaymentRingSuggestionRequest currentStatementPaymentsSum](self, "currentStatementPaymentsSum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 17 * (v8 + objc_msgSend(v9, "hash"));

  -[FHPaymentRingSuggestionRequest statementPurchasesSum](self, "statementPurchasesSum");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 17 * (v10 + objc_msgSend(v11, "hash"));

  -[FHPaymentRingSuggestionRequest merchantCategoryTransactionSums](self, "merchantCategoryTransactionSums");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 17 * (v12 + objc_msgSend(v13, "hash"));

  -[FHPaymentRingSuggestionRequest paymentDetails](self, "paymentDetails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 + objc_msgSend(v15, "hash") + 410338673;

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  FHPaymentRingSuggestionRequest *v4;
  FHPaymentRingSuggestionRequest *v5;
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
  int v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = (FHPaymentRingSuggestionRequest *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v17 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[FHPaymentRingSuggestionRequest currentStatement](self, "currentStatement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHPaymentRingSuggestionRequest currentStatement](v5, "currentStatement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[FHPaymentRingSuggestionRequest previousStatement](self, "previousStatement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHPaymentRingSuggestionRequest previousStatement](v5, "previousStatement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        -[FHPaymentRingSuggestionRequest previousStatementPaymentsSum](self, "previousStatementPaymentsSum");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHPaymentRingSuggestionRequest previousStatementPaymentsSum](v5, "previousStatementPaymentsSum");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11))
        {
          -[FHPaymentRingSuggestionRequest currentStatementPaymentsSum](self, "currentStatementPaymentsSum");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHPaymentRingSuggestionRequest currentStatementPaymentsSum](v5, "currentStatementPaymentsSum");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqual:", v13))
          {
            v24 = v12;
            -[FHPaymentRingSuggestionRequest statementPurchasesSum](self, "statementPurchasesSum");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[FHPaymentRingSuggestionRequest statementPurchasesSum](v5, "statementPurchasesSum");
            v25 = v14;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "isEqual:"))
            {
              -[FHPaymentRingSuggestionRequest merchantCategoryTransactionSums](self, "merchantCategoryTransactionSums");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[FHPaymentRingSuggestionRequest merchantCategoryTransactionSums](v5, "merchantCategoryTransactionSums");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v15;
              v16 = objc_msgSend(v15, "isEqual:");
              v12 = v24;
              if (v16)
              {
                -[FHPaymentRingSuggestionRequest paymentDetails](self, "paymentDetails");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[FHPaymentRingSuggestionRequest paymentDetails](v5, "paymentDetails");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v20, "isEqual:", v19);

              }
              else
              {
                v17 = 0;
              }

            }
            else
            {
              v17 = 0;
              v12 = v24;
            }

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentStatement: '%@'; "), self->_currentStatement);
  objc_msgSend(v3, "appendFormat:", CFSTR("previousStatement: '%@'; "), self->_previousStatement);
  objc_msgSend(v3, "appendFormat:", CFSTR("previousStatementPaymentsSum: '%@'; "), self->_previousStatementPaymentsSum);
  objc_msgSend(v3, "appendFormat:", CFSTR("currentStatementPaymentsSum: '%@'; "), self->_currentStatementPaymentsSum);
  objc_msgSend(v3, "appendFormat:", CFSTR("statementPurchasesSum: '%@'; "), self->_statementPurchasesSum);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCategoryTransactionSums: '%@'; "),
    self->_merchantCategoryTransactionSums);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentDetails: '%@'; "), self->_paymentDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (FHStatementDetails)currentStatement
{
  return self->_currentStatement;
}

- (void)setCurrentStatement:(id)a3
{
  objc_storeStrong((id *)&self->_currentStatement, a3);
}

- (FHStatementDetails)previousStatement
{
  return self->_previousStatement;
}

- (void)setPreviousStatement:(id)a3
{
  objc_storeStrong((id *)&self->_previousStatement, a3);
}

- (NSDecimalNumber)previousStatementPaymentsSum
{
  return self->_previousStatementPaymentsSum;
}

- (void)setPreviousStatementPaymentsSum:(id)a3
{
  objc_storeStrong((id *)&self->_previousStatementPaymentsSum, a3);
}

- (NSDecimalNumber)currentStatementPaymentsSum
{
  return self->_currentStatementPaymentsSum;
}

- (void)setCurrentStatementPaymentsSum:(id)a3
{
  objc_storeStrong((id *)&self->_currentStatementPaymentsSum, a3);
}

- (NSDecimalNumber)statementPurchasesSum
{
  return self->_statementPurchasesSum;
}

- (void)setStatementPurchasesSum:(id)a3
{
  objc_storeStrong((id *)&self->_statementPurchasesSum, a3);
}

- (NSDictionary)merchantCategoryTransactionSums
{
  return self->_merchantCategoryTransactionSums;
}

- (void)setMerchantCategoryTransactionSums:(id)a3
{
  objc_storeStrong((id *)&self->_merchantCategoryTransactionSums, a3);
}

- (NSArray)paymentDetails
{
  return self->_paymentDetails;
}

- (void)setPaymentDetails:(id)a3
{
  objc_storeStrong((id *)&self->_paymentDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDetails, 0);
  objc_storeStrong((id *)&self->_merchantCategoryTransactionSums, 0);
  objc_storeStrong((id *)&self->_statementPurchasesSum, 0);
  objc_storeStrong((id *)&self->_currentStatementPaymentsSum, 0);
  objc_storeStrong((id *)&self->_previousStatementPaymentsSum, 0);
  objc_storeStrong((id *)&self->_previousStatement, 0);
  objc_storeStrong((id *)&self->_currentStatement, 0);
}

@end
