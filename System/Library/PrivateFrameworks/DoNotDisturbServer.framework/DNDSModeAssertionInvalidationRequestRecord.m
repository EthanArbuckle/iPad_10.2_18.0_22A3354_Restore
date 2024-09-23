@implementation DNDSModeAssertionInvalidationRequestRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  id v5;
  DNDSModeAssertionInvalidationRequestRecord *v6;
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

  if (a3)
  {
    v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionInvalidationRequestRecord);
    objc_msgSend(v5, "bs_safeStringForKey:", a4->var7.var0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setUUID:](v6, "setUUID:", v7);

    objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var7.var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationPredicateRecord recordForDictionary:keys:](DNDSModeAssertionInvalidationPredicateRecord, "recordForDictionary:keys:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setPredicate:](v6, "setPredicate:", v9);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var7.var2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setRequestDate:](v6, "setRequestDate:", v10);

    objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var7.var3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationDetailsRecord recordForDictionary:keys:](DNDSModeAssertionInvalidationDetailsRecord, "recordForDictionary:keys:", v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setDetails:](v6, "setDetails:", v12);

    objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var7.var4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionSourceRecord recordForDictionary:keys:](DNDSModeAssertionSourceRecord, "recordForDictionary:keys:", v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setSource:](v6, "setSource:", v14);

    objc_msgSend(v5, "bs_safeStringForKey:", a4->var7.var5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setReason:](v6, "setReason:", v15);

    objc_msgSend(v5, "bs_safeStringForKey:", a4->var7.var6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSModeAssertionInvalidationRequestRecord setReasonOverride:](v6, "setReasonOverride:", v16);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationRequestRecord UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v8, a3->var7.var0);

  -[DNDSModeAssertionInvalidationRequestRecord predicate](self, "predicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithKeys:options:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, a3->var7.var1);

  -[DNDSModeAssertionInvalidationRequestRecord requestDate](self, "requestDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v11, a3->var7.var2);

  -[DNDSModeAssertionInvalidationRequestRecord details](self, "details");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithKeys:options:", a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v13, a3->var7.var3);

  -[DNDSModeAssertionInvalidationRequestRecord source](self, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithKeys:options:", a3, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v15, a3->var7.var4);

  -[DNDSModeAssertionInvalidationRequestRecord reason](self, "reason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v16, a3->var7.var5);

  -[DNDSModeAssertionInvalidationRequestRecord reasonOverride](self, "reasonOverride");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v17, a3->var7.var6);

  if ((a4 & 1) != 0)
  {
    -[DNDSModeAssertionInvalidationRequestRecord requestDate](self, "requestDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Local"), a3->var7.var2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v18, v19);

  }
  return v7;
}

+ (id)recordForInvalidationRequest:(id)a3
{
  id v3;
  DNDSModeAssertionInvalidationRequestRecord *v4;
  void *v5;
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
  uint64_t v18;
  void *v19;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DNDSModeAssertionInvalidationRequestRecord);
    objc_msgSend(v3, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setUUID:](v4, "setUUID:", v6);

    objc_msgSend(v3, "predicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationPredicateRecord recordForInvalidationPredicate:](DNDSModeAssertionInvalidationPredicateRecord, "recordForInvalidationPredicate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setPredicate:](v4, "setPredicate:", v8);

    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "requestDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dnds_numberWithDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setRequestDate:](v4, "setRequestDate:", v11);

    objc_msgSend(v3, "details");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationDetailsRecord recordForInvalidationDetails:](DNDSModeAssertionInvalidationDetailsRecord, "recordForInvalidationDetails:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setDetails:](v4, "setDetails:", v13);

    objc_msgSend(v3, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionSourceRecord recordForAssertionSource:](DNDSModeAssertionSourceRecord, "recordForAssertionSource:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setSource:](v4, "setSource:", v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "dnds_stringForInvalidationReason:", objc_msgSend(v3, "reason"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setReason:](v4, "setReason:", v16);

    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = objc_msgSend(v3, "reasonOverride");

    objc_msgSend(v17, "dnds_stringForInvalidationReasonOverride:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequestRecord setReasonOverride:](v4, "setReasonOverride:", v19);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)object
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  DNDSModeAssertionInvalidationRequest *v18;
  BOOL v19;
  char v20;
  BOOL v21;
  char v22;
  BOOL v23;
  void *v25;

  -[DNDSModeAssertionInvalidationRequestRecord UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[DNDSModeAssertionInvalidationRequestRecord UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  }
  else
  {
    v6 = 0;
  }

  -[DNDSModeAssertionInvalidationRequestRecord predicate](self, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionInvalidationRequestRecord requestDate](self, "requestDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dnds_dateValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionInvalidationRequestRecord details](self, "details");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "object");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationRequestRecord source](self, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionInvalidationRequestRecord reason](self, "reason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "dnds_invalidationReasonValue");
  -[DNDSModeAssertionInvalidationRequestRecord reasonOverride](self, "reasonOverride");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "dnds_invalidationReasonOverrideValue");
  v18 = 0;
  if (v6 && v8 && v25)
  {
    v18 = 0;
    if (v16)
      v19 = v17 == 0;
    else
      v19 = 0;
    v20 = v19;
    if (v14)
      v21 = v15 == 0;
    else
      v21 = 0;
    v22 = v21;
    if (v11)
      v23 = 1;
    else
      v23 = v10 == 0;
    if (v23 && v13 && (v22 & 1) == 0 && (v20 & 1) == 0)
      v18 = -[DNDSModeAssertionInvalidationRequest initWithUUID:predicate:requestDate:details:source:reason:reasonOverride:]([DNDSModeAssertionInvalidationRequest alloc], "initWithUUID:predicate:requestDate:details:source:reason:reasonOverride:", v6, v8, v25, v11, v13, v15, v17);
  }

  return v18;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (DNDSModeAssertionInvalidationPredicateRecord)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (NSNumber)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestDate, a3);
}

- (DNDSModeAssertionInvalidationDetailsRecord)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (DNDSModeAssertionSourceRecord)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSString)reasonOverride
{
  return self->_reasonOverride;
}

- (void)setReasonOverride:(id)a3
{
  objc_storeStrong((id *)&self->_reasonOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonOverride, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
