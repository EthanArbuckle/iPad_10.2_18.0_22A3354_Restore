@implementation DNDSModeAssertionRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  id v5;
  DNDSModeAssertionRecord *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionRecord);
    objc_msgSend(v5, "bs_safeStringForKey:", a4->var1.var0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionRecord setUUID:](v6, "setUUID:", v7);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var1.var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionRecord setStartDate:](v6, "setStartDate:", v8);

    objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var1.var2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionDetailsRecord recordForDictionary:keys:](DNDSModeAssertionDetailsRecord, "recordForDictionary:keys:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionRecord setDetails:](v6, "setDetails:", v10);

    objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var1.var3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[DNDSModeAssertionSourceRecord recordForDictionary:keys:](DNDSModeAssertionSourceRecord, "recordForDictionary:keys:", v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionRecord setSource:](v6, "setSource:", v12);

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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionRecord UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v8, a3->var1.var0);

  -[DNDSModeAssertionRecord startDate](self, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v9, a3->var1.var1);

  -[DNDSModeAssertionRecord details](self, "details");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithKeys:options:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v11, a3->var1.var2);

  -[DNDSModeAssertionRecord source](self, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithKeys:options:", a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v13, a3->var1.var3);

  if ((a4 & 1) != 0)
  {
    -[DNDSModeAssertionRecord startDate](self, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Local"), a3->var1.var1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v14, v15);

  }
  return v7;
}

+ (id)recordForAssertion:(id)a3
{
  id v3;
  DNDSModeAssertionRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DNDSModeAssertionRecord);
    objc_msgSend(v3, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionRecord setUUID:](v4, "setUUID:", v6);

    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dnds_numberWithDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionRecord setStartDate:](v4, "setStartDate:", v9);

    objc_msgSend(v3, "details");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionDetailsRecord recordForAssertionDetails:](DNDSModeAssertionDetailsRecord, "recordForAssertionDetails:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionRecord setDetails:](v4, "setDetails:", v11);

    objc_msgSend(v3, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[DNDSModeAssertionSourceRecord recordForAssertionSource:](DNDSModeAssertionSourceRecord, "recordForAssertionSource:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionRecord setSource:](v4, "setSource:", v13);

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

  -[DNDSModeAssertionRecord UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[DNDSModeAssertionRecord UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  }
  else
  {
    v6 = 0;
  }

  -[DNDSModeAssertionRecord startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dnds_dateValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionRecord details](self, "details");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "object");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionRecord source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "object");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v6 && v8 && v10 && v12)
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D5F8]), "initWithUUID:startDate:details:source:", v6, v8, v10, v12);

  return v13;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSNumber)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (DNDSModeAssertionDetailsRecord)details
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
