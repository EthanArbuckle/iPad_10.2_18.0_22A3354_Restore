@implementation FHPaymentRingSuggestionResponse

- (FHPaymentRingSuggestionResponse)initWithAmount:(id)a3 category:(unint64_t)a4
{
  id v6;
  FHPaymentRingSuggestionResponse *v7;
  uint64_t v8;
  NSDecimalNumber *amount;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FHPaymentRingSuggestionResponse;
  v7 = -[FHPaymentRingSuggestionResponse init](&v11, sel_init);
  if (v7)
  {
    +[FHPaymentRingSuggestionResponse roundingAmount:](FHPaymentRingSuggestionResponse, "roundingAmount:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    amount = v7->_amount;
    v7->_amount = (NSDecimalNumber *)v8;

    v7->_category = a4;
  }

  return v7;
}

+ (id)roundingAmount:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1520];
  v4 = a3;
  objc_msgSend(v3, "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 2, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decimalNumberByRoundingAccordingToBehavior:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  NSDecimalNumber *amount;
  void *v6;
  unint64_t category;
  int64_t v8;

  v4 = a3;
  amount = self->_amount;
  objc_msgSend(v4, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDecimalNumber compare:](amount, "compare:", v6))
  {
    category = self->_category;
    v8 = category == objc_msgSend(v4, "category");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[FHPaymentRingSuggestionResponse amount](self, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = 17 * (17 * v4 + -[FHPaymentRingSuggestionResponse category](self, "category"));
  return v5 + -[FHPaymentRingSuggestionResponse priority](self, "priority") + 4913;
}

- (BOOL)isEqual:(id)a3
{
  FHPaymentRingSuggestionResponse *v4;
  FHPaymentRingSuggestionResponse *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int64_t v9;
  BOOL v10;

  v4 = (FHPaymentRingSuggestionResponse *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[FHPaymentRingSuggestionResponse amount](self, "amount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHPaymentRingSuggestionResponse amount](v5, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7)
      && (v8 = -[FHPaymentRingSuggestionResponse category](self, "category"),
          v8 == -[FHPaymentRingSuggestionResponse category](v5, "category")))
    {
      v9 = -[FHPaymentRingSuggestionResponse priority](self, "priority");
      v10 = v9 == -[FHPaymentRingSuggestionResponse priority](v5, "priority");
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
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  FHPaymentRingSuggestionCategoryToString(self->_category);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("category: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("priority: %ld; "), self->_priority);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
