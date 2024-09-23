@implementation DNDSModeAssertionDetailsRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  id v5;
  DNDSModeAssertionDetailsRecord *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionDetailsRecord);
    objc_msgSend(v5, "bs_safeStringForKey:", a4->var2.var0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setIdentifier:](v6, "setIdentifier:", v7);

    objc_msgSend(v5, "bs_safeStringForKey:", a4->var2.var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setModeIdentifier:](v6, "setModeIdentifier:", v8);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var2.var2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setModeConfigurationModifiedDate:](v6, "setModeConfigurationModifiedDate:", v9);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var2.var3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setUserVisibleEndDate:](v6, "setUserVisibleEndDate:", v10);

    objc_msgSend(v5, "bs_safeDictionaryForKey:", a4->var2.var4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionLifetimeRecord recordForDictionary:keys:](DNDSModeAssertionLifetimeRecord, "recordForDictionary:keys:", v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setLifetime:](v6, "setLifetime:", v12);

    objc_msgSend(v5, "bs_safeStringForKey:", a4->var2.var5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSModeAssertionDetailsRecord setReason:](v6, "setReason:", v13);
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionDetailsRecord identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v8, a3->var2.var0);

  -[DNDSModeAssertionDetailsRecord modeIdentifier](self, "modeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v9, a3->var2.var1);

  -[DNDSModeAssertionDetailsRecord modeConfigurationModifiedDate](self, "modeConfigurationModifiedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, a3->var2.var2);

  -[DNDSModeAssertionDetailsRecord userVisibleEndDate](self, "userVisibleEndDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v11, a3->var2.var3);

  -[DNDSModeAssertionDetailsRecord lifetime](self, "lifetime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithKeys:options:", a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v13, a3->var2.var4);

  -[DNDSModeAssertionDetailsRecord reason](self, "reason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v14, a3->var2.var5);

  if ((a4 & 1) != 0)
  {
    -[DNDSModeAssertionDetailsRecord userVisibleEndDate](self, "userVisibleEndDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Local"), a3->var2.var3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v15, v16);

  }
  return v7;
}

+ (id)recordForAssertionDetails:(id)a3
{
  id v3;
  DNDSModeAssertionDetailsRecord *v4;
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
    v4 = objc_alloc_init(DNDSModeAssertionDetailsRecord);
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setIdentifier:](v4, "setIdentifier:", v5);

    objc_msgSend(v3, "modeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setModeIdentifier:](v4, "setModeIdentifier:", v6);

    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "modeConfigurationModifiedDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dnds_safeNumberWithDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setModeConfigurationModifiedDate:](v4, "setModeConfigurationModifiedDate:", v9);

    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "userVisibleEndDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dnds_safeNumberWithDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setUserVisibleEndDate:](v4, "setUserVisibleEndDate:", v12);

    objc_msgSend(v3, "lifetime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionLifetimeRecord recordForAssertionLifetime:](DNDSModeAssertionLifetimeRecord, "recordForAssertionLifetime:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setLifetime:](v4, "setLifetime:", v14);

    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = objc_msgSend(v3, "reason");

    objc_msgSend(v15, "dnds_stringForAssertionReason:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionDetailsRecord setReason:](v4, "setReason:", v17);

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
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[DNDSModeAssertionDetailsRecord identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionDetailsRecord modeIdentifier](self, "modeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionDetailsRecord lifetime](self, "lifetime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v3 && v4)
  {
    if (!v5 || v6)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
      objc_msgSend(v8, "setIdentifier:", v3);
      objc_msgSend(v8, "setModeIdentifier:", v4);
      -[DNDSModeAssertionDetailsRecord modeConfigurationModifiedDate](self, "modeConfigurationModifiedDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v8, "setModeConfigurationModifiedDate:", v12);
      -[DNDSModeAssertionDetailsRecord userVisibleEndDate](self, "userVisibleEndDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v8, "setUserVisibleEndDate:", v16);
      objc_msgSend(v8, "setLifetime:", v7);
      -[DNDSModeAssertionDetailsRecord reason](self, "reason");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setReason:", objc_msgSend(v17, "dnds_assertionReasonValue"));

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void)setModeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modeIdentifier, a3);
}

- (NSNumber)modeConfigurationModifiedDate
{
  return self->_modeConfigurationModifiedDate;
}

- (void)setModeConfigurationModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_modeConfigurationModifiedDate, a3);
}

- (NSNumber)userVisibleEndDate
{
  return self->_userVisibleEndDate;
}

- (void)setUserVisibleEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_userVisibleEndDate, a3);
}

- (DNDSModeAssertionLifetimeRecord)lifetime
{
  return self->_lifetime;
}

- (void)setLifetime:(id)a3
{
  objc_storeStrong((id *)&self->_lifetime, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_lifetime, 0);
  objc_storeStrong((id *)&self->_userVisibleEndDate, 0);
  objc_storeStrong((id *)&self->_modeConfigurationModifiedDate, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
