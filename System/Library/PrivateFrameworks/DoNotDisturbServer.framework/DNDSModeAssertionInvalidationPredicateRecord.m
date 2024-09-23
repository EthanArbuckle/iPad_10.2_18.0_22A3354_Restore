@implementation DNDSModeAssertionInvalidationPredicateRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  id v5;
  DNDSModeAssertionInvalidationPredicateRecord *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionInvalidationPredicateRecord);
    objc_msgSend(v5, "bs_safeStringForKey:", a4->var8.var0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationPredicateRecord setPredicateType:](v6, "setPredicateType:", v7);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var8.var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationPredicateRecord setDate:](v6, "setDate:", v8);

    objc_msgSend(v5, "bs_safeArrayForKey:", a4->var8.var2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_filter:", &__block_literal_global_17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationPredicateRecord setClientIdentifiers:](v6, "setClientIdentifiers:", v10);

    objc_msgSend(v5, "bs_safeArrayForKey:", a4->var8.var3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "bs_filter:", &__block_literal_global_77);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationPredicateRecord setUUIDs:](v6, "setUUIDs:", v12);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

BOOL __85__DNDSModeAssertionInvalidationPredicateRecord_Dictionary__recordForDictionary_keys___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (uint64_t)v4;
    else
      v3 = 0;
  }

  return v3 != 0;
}

BOOL __85__DNDSModeAssertionInvalidationPredicateRecord_Dictionary__recordForDictionary_keys___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (uint64_t)v4;
    else
      v3 = 0;
  }

  return v3 != 0;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
  char v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationPredicateRecord predicateType](self, "predicateType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v8, a3->var8.var0);

  -[DNDSModeAssertionInvalidationPredicateRecord date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v9, a3->var8.var1);

  -[DNDSModeAssertionInvalidationPredicateRecord clientIdentifiers](self, "clientIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, a3->var8.var2);

  -[DNDSModeAssertionInvalidationPredicateRecord UUIDs](self, "UUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v11, a3->var8.var3);

  if ((v4 & 1) != 0)
  {
    -[DNDSModeAssertionInvalidationPredicateRecord date](self, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Local"), a3->var8.var1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v12, v13);

  }
  return v7;
}

+ (id)recordForInvalidationPredicate:(id)a3
{
  id v3;
  DNDSModeAssertionInvalidationPredicateRecord *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(DNDSModeAssertionInvalidationPredicateRecord);
    v5 = objc_msgSend(v3, "predicateType");
    objc_msgSend(MEMORY[0x1E0CB3940], "dnds_stringForPredicateType:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationPredicateRecord setPredicateType:](v4, "setPredicateType:", v6);

    switch(v5)
    {
      case 3:
        objc_msgSend(v3, "UUIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bs_mapNoNulls:", &__block_literal_global_272);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[DNDSModeAssertionInvalidationPredicateRecord setUUIDs:](v4, "setUUIDs:", v8);
        goto LABEL_9;
      case 2:
        objc_msgSend(v3, "clientIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionInvalidationPredicateRecord setClientIdentifiers:](v4, "setClientIdentifiers:", v8);
        goto LABEL_9;
      case 1:
        v7 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "dnds_numberWithDate:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionInvalidationPredicateRecord setDate:](v4, "setDate:", v9);

LABEL_9:
        break;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __79__DNDSModeAssertionInvalidationPredicateRecord_recordForInvalidationPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)DNDSLogAssertionStore;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionStore, OS_LOG_TYPE_ERROR))
      __79__DNDSModeAssertionInvalidationPredicateRecord_recordForInvalidationPredicate___block_invoke_cold_1(v4, (uint64_t)v2);
    v3 = 0;
  }

  return v3;
}

- (id)object
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  DNDSModeAssertionDateInvalidationPredicate *v8;
  void *v9;

  -[DNDSModeAssertionInvalidationPredicateRecord predicateType](self, "predicateType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dnds_predicateTypeValue");

  switch(v4)
  {
    case 0:
      +[DNDSAnyModeAssertionInvalidationPredicate sharedInstance](DNDSAnyModeAssertionInvalidationPredicate, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    case 1:
      -[DNDSModeAssertionInvalidationPredicateRecord date](self, "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dnds_dateValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_11;
      v8 = -[DNDSModeAssertionDateInvalidationPredicate initWithDate:]([DNDSModeAssertionDateInvalidationPredicate alloc], "initWithDate:", v7);
      goto LABEL_10;
    case 2:
      -[DNDSModeAssertionInvalidationPredicateRecord clientIdentifiers](self, "clientIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "count"))
        goto LABEL_11;
      v8 = -[DNDSModeAssertionClientIdentifierInvalidationPredicate initWithClientIdentifiers:]([DNDSModeAssertionClientIdentifierInvalidationPredicate alloc], "initWithClientIdentifiers:", v7);
      goto LABEL_10;
    case 3:
      -[DNDSModeAssertionInvalidationPredicateRecord UUIDs](self, "UUIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bs_mapNoNulls:", &__block_literal_global_277);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "count"))
      {
        v8 = -[DNDSModeAssertionUUIDInvalidationPredicate initWithUUIDs:]([DNDSModeAssertionUUIDInvalidationPredicate alloc], "initWithUUIDs:", v7);
LABEL_10:
        v5 = v8;
      }
      else
      {
LABEL_11:
        v5 = 0;
      }

      return v5;
    default:
      v5 = 0;
      return v5;
  }
}

id __54__DNDSModeAssertionInvalidationPredicateRecord_object__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (NSString)predicateType
{
  return self->_predicateType;
}

- (void)setPredicateType:(id)a3
{
  objc_storeStrong((id *)&self->_predicateType, a3);
}

- (NSNumber)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSArray)clientIdentifiers
{
  return self->_clientIdentifiers;
}

- (void)setClientIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifiers, a3);
}

- (NSArray)UUIDs
{
  return self->_UUIDs;
}

- (void)setUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_UUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDs, 0);
  objc_storeStrong((id *)&self->_clientIdentifiers, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_predicateType, 0);
}

void __79__DNDSModeAssertionInvalidationPredicateRecord_recordForInvalidationPredicate___block_invoke_cold_1(void *a1, uint64_t a2)
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1CB895000, v3, OS_LOG_TYPE_ERROR, "Unexpected object (%@) found in invalidation predicate UUIDs: %@", (uint8_t *)&v6, 0x16u);

}

@end
