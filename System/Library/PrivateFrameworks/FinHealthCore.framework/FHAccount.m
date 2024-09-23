@implementation FHAccount

- (BOOL)isEqual:(id)a3
{
  FHAccount *v4;
  FHAccount *v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
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

  v4 = (FHAccount *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v25 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[FHAccount accountID](self, "accountID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHAccount accountID](v5, "accountID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (FHEqualStrings(v6, v7)
      && (v8 = -[FHAccount sourceType](self, "sourceType"), v8 == -[FHAccount sourceType](v5, "sourceType"))
      && (v9 = -[FHAccount accountCategory](self, "accountCategory"),
          v9 == -[FHAccount accountCategory](v5, "accountCategory"))
      && (v10 = -[FHAccount accountType](self, "accountType"), v10 == -[FHAccount accountType](v5, "accountType")))
    {
      -[FHAccount accountDescription](self, "accountDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHAccount accountDescription](v5, "accountDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (FHEqualStrings(v11, v12)
        && (v13 = -[FHAccount accountStatus](self, "accountStatus"),
            v13 == -[FHAccount accountStatus](v5, "accountStatus")))
      {
        -[FHAccount currency](self, "currency");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHAccount currency](v5, "currency");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (FHEqualStrings(v14, v15))
        {
          -[FHAccount creditLimit](self, "creditLimit");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHAccount creditLimit](v5, "creditLimit");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (FHEqualObjects(v16, v17))
          {
            v38 = v16;
            -[FHAccount nextPaymentDate](self, "nextPaymentDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[FHAccount nextPaymentDate](v5, "nextPaymentDate");
            v40 = v18;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (FHEqualObjects(v18, v39))
            {
              -[FHAccount minimumPaymentAmount](self, "minimumPaymentAmount");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[FHAccount minimumPaymentAmount](v5, "minimumPaymentAmount");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v19;
              if (FHEqualObjects(v19, v36))
              {
                -[FHAccount overduePaymentAmount](self, "overduePaymentAmount");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[FHAccount overduePaymentAmount](v5, "overduePaymentAmount");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v20;
                if (FHEqualObjects(v20, v34))
                {
                  -[FHAccount accountBalance](self, "accountBalance");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FHAccount accountBalance](v5, "accountBalance");
                  v32 = v21;
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  if (FHEqualObjects(v21, v33))
                  {
                    -[FHAccount institutionName](self, "institutionName");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    -[FHAccount institutionName](v5, "institutionName");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = v22;
                    if (FHEqualStrings(v22, v30))
                    {
                      -[FHAccount institutionID](self, "institutionID");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      -[FHAccount institutionID](v5, "institutionID");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v29 = v23;
                      if (FHEqualStrings(v23, v28))
                      {
                        -[FHAccount uniqueAccountID](self, "uniqueAccountID");
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        -[FHAccount uniqueAccountID](v5, "uniqueAccountID");
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        v25 = FHEqualStrings(v27, v24);

                      }
                      else
                      {
                        v25 = 0;
                      }

                    }
                    else
                    {
                      v25 = 0;
                    }

                  }
                  else
                  {
                    v25 = 0;
                  }

                }
                else
                {
                  v25 = 0;
                }
                v16 = v38;

              }
              else
              {
                v25 = 0;
                v16 = v38;
              }

            }
            else
            {
              v25 = 0;
              v16 = v38;
            }

          }
          else
          {
            v25 = 0;
          }

        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("accountID"), self->_accountID);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("sourceType"), self->_sourceType);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("accountCategory"), self->_accountCategory);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("accountType"), self->_accountType);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("accountDescription"), self->_accountDescription);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("accountStatus"), self->_accountStatus);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("currency"), self->_currency);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("creditLimit"), self->_creditLimit);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("nextPaymentDate"), self->_nextPaymentDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("minimumPaymentAmount"), self->_minimumPaymentAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("overduePaymentAmount"), self->_overduePaymentAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("accountBalance"), self->_accountBalance);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("institutionName"), self->_institutionName);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("institutionID"), self->_institutionID);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("uniqueAccountID"), self->_uniqueAccountID);
  return v3;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (int64_t)accountCategory
{
  return self->_accountCategory;
}

- (void)setAccountCategory:(int64_t)a3
{
  self->_accountCategory = a3;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (void)setAccountDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)nextPaymentDate
{
  return self->_nextPaymentDate;
}

- (void)setNextPaymentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDecimalNumber)minimumPaymentAmount
{
  return self->_minimumPaymentAmount;
}

- (void)setMinimumPaymentAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDecimalNumber)overduePaymentAmount
{
  return self->_overduePaymentAmount;
}

- (void)setOverduePaymentAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDecimalNumber)accountBalance
{
  return self->_accountBalance;
}

- (void)setAccountBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)institutionName
{
  return self->_institutionName;
}

- (void)setInstitutionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)institutionID
{
  return self->_institutionID;
}

- (void)setInstitutionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)uniqueAccountID
{
  return self->_uniqueAccountID;
}

- (void)setUniqueAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueAccountID, 0);
  objc_storeStrong((id *)&self->_institutionID, 0);
  objc_storeStrong((id *)&self->_institutionName, 0);
  objc_storeStrong((id *)&self->_accountBalance, 0);
  objc_storeStrong((id *)&self->_overduePaymentAmount, 0);
  objc_storeStrong((id *)&self->_minimumPaymentAmount, 0);
  objc_storeStrong((id *)&self->_nextPaymentDate, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
