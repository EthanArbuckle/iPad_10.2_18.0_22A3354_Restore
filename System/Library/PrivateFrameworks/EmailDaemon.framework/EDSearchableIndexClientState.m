@implementation EDSearchableIndexClientState

+ (id)clientStateFromData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (EDSearchableIndexClientState)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  EDSearchableIndexClientState *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("build"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)EDSearchableIndexClientState;
    v8 = -[EDSearchableIndexClientState init](&v12, sel_init);
    if (v8)
    {
      v8->_transaction = objc_msgSend(v5, "longLongValue");
      if (v7)
        -[EDSearchableIndexClientState setSystemBuildVersion:](v8, "setSystemBuildVersion:", v7);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(v9, "dateWithTimeIntervalSince1970:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDSearchableIndexClientState setTransactionDate:](v8, "setTransactionDate:", v10);

      }
    }
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (void)setTransactionDate:(id)a3
{
  objc_storeStrong((id *)&self->_transactionDate, a3);
}

- (void)setSystemBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_transactionValue, 0);
}

- (int64_t)transaction
{
  return self->_transaction;
}

+ (id)transactionAttributeKey
{
  if (transactionAttributeKey_onceToken != -1)
    dispatch_once(&transactionAttributeKey_onceToken, &__block_literal_global_61);
  return (id)transactionAttributeKey_key;
}

void __55__EDSearchableIndexClientState_transactionAttributeKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mail_transaction"), 1, 0, 0, 0);
  v1 = (void *)transactionAttributeKey_key;
  transactionAttributeKey_key = v0;

}

+ (id)clientState
{
  return objc_alloc_init((Class)a1);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "ef_posixLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ssZ"));
  objc_msgSend(v3, "stringFromDate:", self->_transactionDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> version=%@ date=%@ transaction=%lld"), objc_opt_class(), self, self->_systemBuildVersion, v5, self->_transaction);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (EDSearchableIndexClientState)init
{
  EDSearchableIndexClientState *v2;
  void *v3;
  uint64_t v4;
  NSString *systemBuildVersion;
  NSDate *v6;
  NSDate *transactionDate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EDSearchableIndexClientState;
  v2 = -[EDSearchableIndexClientState init](&v9, sel_init);
  if (v2)
  {
    EFSystemBuildVersion();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "copy");
    systemBuildVersion = v2->_systemBuildVersion;
    v2->_systemBuildVersion = (NSString *)v4;

    v6 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    transactionDate = v2->_transactionDate;
    v2->_transactionDate = v6;

  }
  return v2;
}

- (id)archiveRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_transaction);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("transaction"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSince1970](self->_transactionDate, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("date"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_systemBuildVersion, CFSTR("build"));
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setTransaction:(int64_t)a3
{
  self->_transaction = a3;
}

- (NSNumber)transactionValue
{
  NSNumber *transactionValue;
  NSNumber *v4;
  NSNumber *v5;

  transactionValue = self->_transactionValue;
  if (!transactionValue)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_transaction);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_transactionValue;
    self->_transactionValue = v4;

    transactionValue = self->_transactionValue;
  }
  return transactionValue;
}

- (void)addTransactionValueToAttributeSet:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EDSearchableIndexClientState transactionValue](self, "transactionValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "transactionAttributeKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forCustomKey:", v4, v5);

  }
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

@end
