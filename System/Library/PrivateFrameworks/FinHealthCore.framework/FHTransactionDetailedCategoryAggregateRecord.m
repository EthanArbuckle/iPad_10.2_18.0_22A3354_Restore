@implementation FHTransactionDetailedCategoryAggregateRecord

- (FHTransactionDetailedCategoryAggregateRecord)initWithMapsCategory:(id)a3 amountSpent:(id)a4 countryCode:(id)a5 transactionCount:(unint64_t)a6 regularTransactionRatio:(double)a7
{
  id v13;
  id v14;
  id v15;
  FHTransactionDetailedCategoryAggregateRecord *v16;
  FHTransactionDetailedCategoryAggregateRecord *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FHTransactionDetailedCategoryAggregateRecord;
  v16 = -[FHTransactionDetailedCategoryAggregateRecord init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_mapsCategory, a3);
    objc_storeStrong((id *)&v17->_amountSpent, a4);
    objc_storeStrong((id *)&v17->_countryCode, a5);
    v17->_transactionCount = a6;
    v17->_regularTransactionRatio = a7;
  }

  return v17;
}

- (void)addRecord:(id)a3
{
  NSString *mapsCategory;
  void *v5;
  NSDecimalNumber *amountSpent;
  void *v7;
  void *v8;
  double regularTransactionRatio;
  double transactionCount;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      mapsCategory = self->_mapsCategory;
      objc_msgSend(v13, "mapsCategory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(mapsCategory) = -[NSString isEqualToString:](mapsCategory, "isEqualToString:", v5);

      if ((_DWORD)mapsCategory)
      {
        amountSpent = self->_amountSpent;
        objc_msgSend(v13, "amountSpent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDecimalNumber decimalNumberByAdding:](amountSpent, "decimalNumberByAdding:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHTransactionDetailedCategoryAggregateRecord setAmountSpent:](self, "setAmountSpent:", v8);

        regularTransactionRatio = self->_regularTransactionRatio;
        transactionCount = (double)self->_transactionCount;
        v11 = (double)(unint64_t)objc_msgSend(v13, "transactionCount");
        objc_msgSend(v13, "regularTransactionRatio");
        -[FHTransactionDetailedCategoryAggregateRecord setRegularTransactionRatio:](self, "setRegularTransactionRatio:", (v12 * v11 + transactionCount * regularTransactionRatio)/ (double)(objc_msgSend(v13, "transactionCount") + self->_transactionCount));
        -[FHTransactionDetailedCategoryAggregateRecord setTransactionCount:](self, "setTransactionCount:", objc_msgSend(v13, "transactionCount") + self->_transactionCount);
        -[FHTransactionDetailedCategoryAggregateRecord setCountryCode:](self, "setCountryCode:", 0);
      }
    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  FHTransactionDetailedCategoryAggregateRecord *v4;
  FHTransactionDetailedCategoryAggregateRecord *v5;
  NSString *mapsCategory;
  void *v7;
  NSDecimalNumber *amountSpent;
  void *v9;
  NSString *countryCode;
  void *v11;
  unint64_t transactionCount;
  double regularTransactionRatio;
  double v14;
  BOOL v15;

  v4 = (FHTransactionDetailedCategoryAggregateRecord *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v15 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    mapsCategory = self->_mapsCategory;
    -[FHTransactionDetailedCategoryAggregateRecord mapsCategory](v5, "mapsCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](mapsCategory, "isEqualToString:", v7))
    {
      amountSpent = self->_amountSpent;
      -[FHTransactionDetailedCategoryAggregateRecord amountSpent](v5, "amountSpent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDecimalNumber isEqualToNumber:](amountSpent, "isEqualToNumber:", v9))
      {
        countryCode = self->_countryCode;
        -[FHTransactionDetailedCategoryAggregateRecord countryCode](v5, "countryCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](countryCode, "isEqualToString:", v11)
          && (transactionCount = self->_transactionCount,
              transactionCount == -[FHTransactionDetailedCategoryAggregateRecord transactionCount](v5, "transactionCount")))
        {
          regularTransactionRatio = self->_regularTransactionRatio;
          -[FHTransactionDetailedCategoryAggregateRecord regularTransactionRatio](v5, "regularTransactionRatio");
          v15 = regularTransactionRatio == v14;
        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_mapsCategory, "hash");
  v4 = -[NSDecimalNumber hash](self->_amountSpent, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_countryCode, "hash");
  return (unint64_t)(self->_regularTransactionRatio
                          + (double)(31 * (self->_transactionCount - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4))
                                   + 28629151));
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("mapsCategory"), self->_mapsCategory);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("amountSpent"), self->_amountSpent);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("countryCode"), self->_countryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("transactionCount"), self->_transactionCount);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%f'; "),
    CFSTR("regularTransactionRatio"),
    *(_QWORD *)&self->_regularTransactionRatio);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *mapsCategory;
  id v5;

  mapsCategory = self->_mapsCategory;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mapsCategory, CFSTR("mapsCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amountSpent, CFSTR("amountSpent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transactionCount, CFSTR("transactionCount"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("regularTransactionRatio"), self->_regularTransactionRatio);

}

- (FHTransactionDetailedCategoryAggregateRecord)initWithCoder:(id)a3
{
  id v4;
  FHTransactionDetailedCategoryAggregateRecord *v5;
  uint64_t v6;
  NSString *mapsCategory;
  uint64_t v8;
  NSDecimalNumber *amountSpent;
  uint64_t v10;
  NSString *countryCode;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FHTransactionDetailedCategoryAggregateRecord;
  v5 = -[FHTransactionDetailedCategoryAggregateRecord init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapsCategory"));
    v6 = objc_claimAutoreleasedReturnValue();
    mapsCategory = v5->_mapsCategory;
    v5->_mapsCategory = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountSpent"));
    v8 = objc_claimAutoreleasedReturnValue();
    amountSpent = v5->_amountSpent;
    v5->_amountSpent = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    v5->_transactionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionCount"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("regularTransactionRatio"));
    v5->_regularTransactionRatio = v12;
  }

  return v5;
}

- (NSString)mapsCategory
{
  return self->_mapsCategory;
}

- (void)setMapsCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDecimalNumber)amountSpent
{
  return self->_amountSpent;
}

- (void)setAmountSpent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(unint64_t)a3
{
  self->_transactionCount = a3;
}

- (double)regularTransactionRatio
{
  return self->_regularTransactionRatio;
}

- (void)setRegularTransactionRatio:(double)a3
{
  self->_regularTransactionRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_amountSpent, 0);
  objc_storeStrong((id *)&self->_mapsCategory, 0);
}

@end
