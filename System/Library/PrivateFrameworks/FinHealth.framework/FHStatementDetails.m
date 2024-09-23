@implementation FHStatementDetails

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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  -[FHStatementDetails statementIdentifier](self, "statementIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[FHStatementDetails openingDate](self, "openingDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 17 * (17 * v4 + objc_msgSend(v5, "hash"));

  -[FHStatementDetails closingDate](self, "closingDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 17 * (v6 + objc_msgSend(v7, "hash"));

  -[FHStatementDetails remainingStatementBalance](self, "remainingStatementBalance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 17 * (v8 + objc_msgSend(v9, "hash"));

  -[FHStatementDetails remainingMinimumPayment](self, "remainingMinimumPayment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 17 * (v10 + objc_msgSend(v11, "hash"));

  -[FHStatementDetails minimumDue](self, "minimumDue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 17 * (v12 + objc_msgSend(v13, "hash"));

  -[FHStatementDetails creditLimit](self, "creditLimit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 17 * (v14 + objc_msgSend(v15, "hash"));

  -[FHStatementDetails statementBalance](self, "statementBalance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 17 * (v16 + objc_msgSend(v17, "hash"));

  -[FHStatementDetails currentBalance](self, "currentBalance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 17 * (v18 + objc_msgSend(v19, "hash"));

  -[FHStatementDetails currentBalanceForMonthZero](self, "currentBalanceForMonthZero");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 17 * (v20 + objc_msgSend(v21, "hash"));

  -[FHStatementDetails currentStatementIdentifier](self, "currentStatementIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 17 * (v22 + objc_msgSend(v23, "hash"));

  v25 = 17 * (v24 + -[FHStatementDetails isMonthZero](self, "isMonthZero"));
  v26 = 17 * (v25 + -[FHStatementDetails isMonthOne](self, "isMonthOne"));
  return v26 + -[FHStatementDetails isMonthOfMerge](self, "isMonthOfMerge") + 0x25632BDBC201BE1;
}

- (BOOL)isEqual:(id)a3
{
  FHStatementDetails *v4;
  FHStatementDetails *v5;
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
  void *v19;
  void *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v4 = (FHStatementDetails *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v23) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[FHStatementDetails statementIdentifier](self, "statementIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHStatementDetails statementIdentifier](v5, "statementIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[FHStatementDetails openingDate](self, "openingDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHStatementDetails openingDate](v5, "openingDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        -[FHStatementDetails closingDate](self, "closingDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHStatementDetails closingDate](v5, "closingDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11))
        {
          -[FHStatementDetails remainingStatementBalance](self, "remainingStatementBalance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHStatementDetails remainingStatementBalance](v5, "remainingStatementBalance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqual:", v13))
          {
            v38 = v12;
            -[FHStatementDetails remainingMinimumPayment](self, "remainingMinimumPayment");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[FHStatementDetails remainingMinimumPayment](v5, "remainingMinimumPayment");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v14;
            if (objc_msgSend(v14, "isEqual:"))
            {
              -[FHStatementDetails minimumDue](self, "minimumDue");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[FHStatementDetails minimumDue](v5, "minimumDue");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v15;
              if (objc_msgSend(v15, "isEqual:"))
              {
                -[FHStatementDetails creditLimit](self, "creditLimit");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                -[FHStatementDetails creditLimit](v5, "creditLimit");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v16;
                if (objc_msgSend(v16, "isEqual:"))
                {
                  -[FHStatementDetails statementBalance](self, "statementBalance");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FHStatementDetails statementBalance](v5, "statementBalance");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = v17;
                  if (objc_msgSend(v17, "isEqual:"))
                  {
                    -[FHStatementDetails currentBalance](self, "currentBalance");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    -[FHStatementDetails currentBalance](v5, "currentBalance");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = v18;
                    if (objc_msgSend(v18, "isEqual:"))
                    {
                      -[FHStatementDetails currentBalanceForMonthZero](self, "currentBalanceForMonthZero");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      -[FHStatementDetails currentBalanceForMonthZero](v5, "currentBalanceForMonthZero");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v29 = v19;
                      if (objc_msgSend(v19, "isEqual:"))
                      {
                        -[FHStatementDetails currentStatementIdentifier](self, "currentStatementIdentifier");
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        -[FHStatementDetails currentStatementIdentifier](v5, "currentStatementIdentifier");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        v27 = v20;
                        if (objc_msgSend(v20, "isEqual:")
                          && (v21 = -[FHStatementDetails isMonthZero](self, "isMonthZero"),
                              v21 == -[FHStatementDetails isMonthZero](v5, "isMonthZero"))
                          && (v22 = -[FHStatementDetails isMonthOne](self, "isMonthOne"),
                              v22 == -[FHStatementDetails isMonthOne](v5, "isMonthOne")))
                        {
                          v25 = -[FHStatementDetails isMonthOfMerge](self, "isMonthOfMerge");
                          v23 = v25 ^ -[FHStatementDetails isMonthOfMerge](v5, "isMonthOfMerge") ^ 1;
                        }
                        else
                        {
                          LOBYTE(v23) = 0;
                        }
                        v12 = v38;

                      }
                      else
                      {
                        LOBYTE(v23) = 0;
                        v12 = v38;
                      }

                    }
                    else
                    {
                      LOBYTE(v23) = 0;
                      v12 = v38;
                    }

                  }
                  else
                  {
                    LOBYTE(v23) = 0;
                    v12 = v38;
                  }

                }
                else
                {
                  LOBYTE(v23) = 0;
                  v12 = v38;
                }

              }
              else
              {
                LOBYTE(v23) = 0;
                v12 = v38;
              }

            }
            else
            {
              LOBYTE(v23) = 0;
              v12 = v38;
            }

          }
          else
          {
            LOBYTE(v23) = 0;
          }

        }
        else
        {
          LOBYTE(v23) = 0;
        }

      }
      else
      {
        LOBYTE(v23) = 0;
      }

    }
    else
    {
      LOBYTE(v23) = 0;
    }

  }
  else
  {
    LOBYTE(v23) = 0;
  }

  return v23;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("statementIdentifier: '%@'; "), self->_statementIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("OpeningDate: '%@'; "), self->_openingDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("ClosingDate: '%@'; "), self->_closingDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("remainingStatementBalance: '%@'; "), self->_remainingStatementBalance);
  objc_msgSend(v3, "appendFormat:", CFSTR("remainingMinimumPayment: '%@'; "), self->_remainingMinimumPayment);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumDue: '%@'; "), self->_minimumDue);
  objc_msgSend(v3, "appendFormat:", CFSTR("creditLimit: '%@'; "), self->_creditLimit);
  objc_msgSend(v3, "appendFormat:", CFSTR("statementBalance: '%@'; "), self->_statementBalance);
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), self->_currentBalance);
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalanceForMonthZero: '%@'; "), self->_currentBalanceForMonthZero);
  objc_msgSend(v3, "appendFormat:", CFSTR("currentStatementIdentifier: '%@'; "), self->_currentStatementIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("isMonthZero: '%d'; "), self->_isMonthZero);
  objc_msgSend(v3, "appendFormat:", CFSTR("isMonthOne: '%d'; "), self->_isMonthOne);
  objc_msgSend(v3, "appendFormat:", CFSTR("isMonthOfMerge: '%d'; "), self->_isMonthOfMerge);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (void)setStatementIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_statementIdentifier, a3);
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (void)setOpeningDate:(id)a3
{
  objc_storeStrong((id *)&self->_openingDate, a3);
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (void)setClosingDate:(id)a3
{
  objc_storeStrong((id *)&self->_closingDate, a3);
}

- (NSDecimalNumber)remainingStatementBalance
{
  return self->_remainingStatementBalance;
}

- (void)setRemainingStatementBalance:(id)a3
{
  objc_storeStrong((id *)&self->_remainingStatementBalance, a3);
}

- (NSDecimalNumber)combinedBalance
{
  return self->_combinedBalance;
}

- (void)setCombinedBalance:(id)a3
{
  objc_storeStrong((id *)&self->_combinedBalance, a3);
}

- (NSDecimalNumber)remainingMinimumPayment
{
  return self->_remainingMinimumPayment;
}

- (void)setRemainingMinimumPayment:(id)a3
{
  objc_storeStrong((id *)&self->_remainingMinimumPayment, a3);
}

- (NSDecimalNumber)minimumDue
{
  return self->_minimumDue;
}

- (void)setMinimumDue:(id)a3
{
  objc_storeStrong((id *)&self->_minimumDue, a3);
}

- (NSDecimalNumber)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
  objc_storeStrong((id *)&self->_creditLimit, a3);
}

- (NSDecimalNumber)statementBalance
{
  return self->_statementBalance;
}

- (void)setStatementBalance:(id)a3
{
  objc_storeStrong((id *)&self->_statementBalance, a3);
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_storeStrong((id *)&self->_currentBalance, a3);
}

- (NSDecimalNumber)currentBalanceForMonthZero
{
  return self->_currentBalanceForMonthZero;
}

- (void)setCurrentBalanceForMonthZero:(id)a3
{
  objc_storeStrong((id *)&self->_currentBalanceForMonthZero, a3);
}

- (NSString)currentStatementIdentifier
{
  return self->_currentStatementIdentifier;
}

- (void)setCurrentStatementIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentStatementIdentifier, a3);
}

- (BOOL)isMonthZero
{
  return self->_isMonthZero;
}

- (void)setIsMonthZero:(BOOL)a3
{
  self->_isMonthZero = a3;
}

- (BOOL)isMonthOne
{
  return self->_isMonthOne;
}

- (void)setIsMonthOne:(BOOL)a3
{
  self->_isMonthOne = a3;
}

- (BOOL)isMonthOfMerge
{
  return self->_isMonthOfMerge;
}

- (void)setIsMonthOfMerge:(BOOL)a3
{
  self->_isMonthOfMerge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStatementIdentifier, 0);
  objc_storeStrong((id *)&self->_currentBalanceForMonthZero, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_statementBalance, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
  objc_storeStrong((id *)&self->_remainingMinimumPayment, 0);
  objc_storeStrong((id *)&self->_combinedBalance, 0);
  objc_storeStrong((id *)&self->_remainingStatementBalance, 0);
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
}

@end
