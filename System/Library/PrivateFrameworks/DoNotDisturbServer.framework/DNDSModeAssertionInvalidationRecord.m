@implementation DNDSModeAssertionInvalidationRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  id v5;
  DNDSModeAssertionInvalidationRecord *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (a3)
  {
    v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionInvalidationRecord);
    objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var5.var0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionRecord recordForDictionary:keys:](DNDSModeAssertionRecord, "recordForDictionary:keys:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRecord setAssertion:](v6, "setAssertion:", v8);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var5.var1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRecord setInvalidationDate:](v6, "setInvalidationDate:", v9);

    objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var5.var2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationDetailsRecord recordForDictionary:keys:](DNDSModeAssertionInvalidationDetailsRecord, "recordForDictionary:keys:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRecord setDetails:](v6, "setDetails:", v11);

    objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var5.var3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionSourceRecord recordForDictionary:keys:](DNDSModeAssertionSourceRecord, "recordForDictionary:keys:", v12, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRecord setSource:](v6, "setSource:", v13);

    objc_msgSend(v5, "bs_safeStringForKey:", a4->var5.var4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRecord setReason:](v6, "setReason:", v14);

    objc_msgSend(v5, "bs_safeStringForKey:", a4->var5.var5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSModeAssertionInvalidationRecord setReasonOverride:](v6, "setReasonOverride:", v15);
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationRecord assertion](self, "assertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithKeys:options:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v9, a3->var5.var0);

  -[DNDSModeAssertionInvalidationRecord invalidationDate](self, "invalidationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, a3->var5.var1);

  -[DNDSModeAssertionInvalidationRecord details](self, "details");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithKeys:options:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v12, a3->var5.var2);

  -[DNDSModeAssertionInvalidationRecord source](self, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryWithKeys:options:", a3, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v14, a3->var5.var3);

  -[DNDSModeAssertionInvalidationRecord reason](self, "reason");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v15, a3->var5.var4);

  -[DNDSModeAssertionInvalidationRecord reasonOverride](self, "reasonOverride");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v16, a3->var5.var5);

  if ((a4 & 1) != 0)
  {
    -[DNDSModeAssertionInvalidationRecord invalidationDate](self, "invalidationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Local"), a3->var5.var1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v17, v18);

  }
  return v7;
}

+ (id)recordForInvalidation:(id)a3
{
  id v3;
  DNDSModeAssertionInvalidationRecord *v4;
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
  uint64_t v16;
  void *v17;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DNDSModeAssertionInvalidationRecord);
    objc_msgSend(v3, "assertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionRecord recordForAssertion:](DNDSModeAssertionRecord, "recordForAssertion:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRecord setAssertion:](v4, "setAssertion:", v6);

    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "invalidationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dnds_numberWithDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRecord setInvalidationDate:](v4, "setInvalidationDate:", v9);

    objc_msgSend(v3, "details");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationDetailsRecord recordForInvalidationDetails:](DNDSModeAssertionInvalidationDetailsRecord, "recordForInvalidationDetails:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRecord setDetails:](v4, "setDetails:", v11);

    objc_msgSend(v3, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionSourceRecord recordForAssertionSource:](DNDSModeAssertionSourceRecord, "recordForAssertionSource:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRecord setSource:](v4, "setSource:", v13);

    objc_msgSend(MEMORY[0x1E0CB3940], "dnds_stringForInvalidationReason:", objc_msgSend(v3, "reason"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRecord setReason:](v4, "setReason:", v14);

    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = objc_msgSend(v3, "reasonOverride");

    objc_msgSend(v15, "dnds_stringForInvalidationReasonOverride:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRecord setReasonOverride:](v4, "setReasonOverride:", v17);

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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  char v17;
  BOOL v18;
  char v19;
  BOOL v20;

  -[DNDSModeAssertionInvalidationRecord assertion](self, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionInvalidationRecord invalidationDate](self, "invalidationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dnds_dateValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionInvalidationRecord details](self, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationRecord source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "object");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionInvalidationRecord reason](self, "reason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "dnds_invalidationReasonValue");
  -[DNDSModeAssertionInvalidationRecord reasonOverride](self, "reasonOverride");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "dnds_invalidationReasonOverrideValue");
  v15 = 0;
  if (v4 && v6)
  {
    v15 = 0;
    if (v13)
      v16 = v14 == 0;
    else
      v16 = 0;
    v17 = v16;
    if (v11)
      v18 = v12 == 0;
    else
      v18 = 0;
    v19 = v18;
    if (v8)
      v20 = 1;
    else
      v20 = v7 == 0;
    if (v20 && v10 && (v19 & 1) == 0 && (v17 & 1) == 0)
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D628]), "initWithAssertion:invalidationDate:details:source:reason:reasonOverride:", v4, v6, v8, v10, v12, v14);
  }

  return v15;
}

- (DNDSModeAssertionRecord)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (NSNumber)invalidationDate
{
  return self->_invalidationDate;
}

- (void)setInvalidationDate:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationDate, a3);
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
  objc_storeStrong((id *)&self->_invalidationDate, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end
