@implementation BMBehaviorDatabaseMetadata

- (BMBehaviorDatabaseMetadata)initWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  BMBehaviorDatabaseMetadata *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BMBehaviorDatabaseMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("miningDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDD1508]);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventIntervalStart"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventIntervalEnd"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v7, "initWithStartDate:endDate:", v23, v22);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("minimumAbsoluteSupport"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v21, "unsignedIntegerValue");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("minimumConfidence"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("samplingInterval"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("itemTypeIdentifiers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("targetTypeIdentifiers"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfBaskets"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[BMBehaviorDatabaseMetadata initWithMiningDate:eventInterval:minimumAbsoluteSupport:minimumConfidence:samplingInterval:itemTypeIdentifiers:targetTypeIdentifiers:numberOfBaskets:](self, "initWithMiningDate:eventInterval:minimumAbsoluteSupport:minimumConfidence:samplingInterval:itemTypeIdentifiers:targetTypeIdentifiers:numberOfBaskets:", v6, v20, v8, v15, v16, objc_msgSend(v17, "unsignedIntegerValue"), v11, v14);

    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BMBehaviorDatabaseMetadata)initWithMiningDate:(id)a3 eventInterval:(id)a4 minimumAbsoluteSupport:(unint64_t)a5 minimumConfidence:(double)a6 samplingInterval:(double)a7 itemTypeIdentifiers:(id)a8 targetTypeIdentifiers:(id)a9 numberOfBaskets:(unint64_t)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  BMBehaviorDatabaseMetadata *v22;
  uint64_t v23;
  NSDate *miningDate;
  uint64_t v25;
  NSDateInterval *eventInterval;
  objc_super v28;

  v18 = a3;
  v19 = a4;
  v20 = a8;
  v21 = a9;
  v28.receiver = self;
  v28.super_class = (Class)BMBehaviorDatabaseMetadata;
  v22 = -[BMBehaviorDatabaseMetadata init](&v28, sel_init);
  if (v22)
  {
    if (v18)
    {
      v23 = objc_msgSend(v18, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    miningDate = v22->_miningDate;
    v22->_miningDate = (NSDate *)v23;

    v25 = objc_msgSend(v19, "copy");
    eventInterval = v22->_eventInterval;
    v22->_eventInterval = (NSDateInterval *)v25;

    v22->_minimumAbsoluteSupport = a5;
    v22->_minimumConfidence = a6;
    v22->_samplingInterval = a7;
    objc_storeStrong((id *)&v22->_itemTypeIdentifiers, a8);
    objc_storeStrong((id *)&v22->_targetTypeIdentifiers, a9);
    v22->_numberOfBaskets = a10;
  }

  return v22;
}

- (id)dictionaryRepresntation
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
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[9];
  _QWORD v20[9];
  const __CFString *v21;
  _QWORD v22[3];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v21 = CFSTR("BMBehaviorDatabaseMetadata");
  v19[0] = CFSTR("miningDate");
  -[BMBehaviorDatabaseMetadata miningDate](self, "miningDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v18;
  v19[1] = CFSTR("eventIntervalStart");
  -[BMBehaviorDatabaseMetadata eventInterval](self, "eventInterval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  v19[2] = CFSTR("eventIntervalEnd");
  -[BMBehaviorDatabaseMetadata eventInterval](self, "eventInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("minimumAbsoluteSupport");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BMBehaviorDatabaseMetadata minimumAbsoluteSupport](self, "minimumAbsoluteSupport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v5;
  v19[4] = CFSTR("minimumConfidence");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[BMBehaviorDatabaseMetadata minimumConfidence](self, "minimumConfidence");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v7;
  v19[5] = CFSTR("samplingInterval");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[BMBehaviorDatabaseMetadata samplingInterval](self, "samplingInterval");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v9;
  v19[6] = CFSTR("itemTypeIdentifiers");
  -[BMBehaviorDatabaseMetadata itemTypeIdentifiers](self, "itemTypeIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v10;
  v19[7] = CFSTR("targetTypeIdentifiers");
  -[BMBehaviorDatabaseMetadata targetTypeIdentifiers](self, "targetTypeIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v11;
  v19[8] = CFSTR("numberOfBaskets");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BMBehaviorDatabaseMetadata numberOfBaskets](self, "numberOfBaskets"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  double v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;

  -[BMBehaviorDatabaseMetadata miningDate](self, "miningDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BMBehaviorDatabaseMetadata eventInterval](self, "eventInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[BMBehaviorDatabaseMetadata minimumAbsoluteSupport](self, "minimumAbsoluteSupport");
  -[BMBehaviorDatabaseMetadata minimumConfidence](self, "minimumConfidence");
  v9 = v7 ^ (unint64_t)(v8 * 1000.0);
  -[BMBehaviorDatabaseMetadata samplingInterval](self, "samplingInterval");
  v11 = (unint64_t)(v10 * 1000.0);
  -[BMBehaviorDatabaseMetadata itemTypeIdentifiers](self, "itemTypeIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");
  -[BMBehaviorDatabaseMetadata targetTypeIdentifiers](self, "targetTypeIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  v16 = v13 ^ v15 ^ -[BMBehaviorDatabaseMetadata numberOfBaskets](self, "numberOfBaskets");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  BMBehaviorDatabaseMetadata *v4;
  BMBehaviorDatabaseMetadata *v5;
  BMBehaviorDatabaseMetadata *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (BMBehaviorDatabaseMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[BMBehaviorDatabaseMetadata dictionaryRepresntation](self, "dictionaryRepresntation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMBehaviorDatabaseMetadata dictionaryRepresntation](v6, "dictionaryRepresntation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  uint64_t v3;
  void *v4;
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
  void *v16;

  v16 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  -[BMBehaviorDatabaseMetadata miningDate](self, "miningDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBehaviorDatabaseMetadata eventInterval](self, "eventInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BMBehaviorDatabaseMetadata minimumAbsoluteSupport](self, "minimumAbsoluteSupport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[BMBehaviorDatabaseMetadata minimumConfidence](self, "minimumConfidence");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[BMBehaviorDatabaseMetadata samplingInterval](self, "samplingInterval");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBehaviorDatabaseMetadata itemTypeIdentifiers](self, "itemTypeIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBehaviorDatabaseMetadata targetTypeIdentifiers](self, "targetTypeIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BMBehaviorDatabaseMetadata numberOfBaskets](self, "numberOfBaskets"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ %p> miningDate: %@, eventInterval: %@, minimumAbsoluteSupport: %@, minimumConfidence: %@, samplingInterval: %@s, itemTypeIdentifiers: %@, targetTypeIdentifiers: %@, numberOfBaskets: %@"), v3, self, v4, v5, v6, v8, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSDate)miningDate
{
  return self->_miningDate;
}

- (NSDateInterval)eventInterval
{
  return self->_eventInterval;
}

- (unint64_t)minimumAbsoluteSupport
{
  return self->_minimumAbsoluteSupport;
}

- (double)minimumConfidence
{
  return self->_minimumConfidence;
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (NSArray)itemTypeIdentifiers
{
  return self->_itemTypeIdentifiers;
}

- (NSArray)targetTypeIdentifiers
{
  return self->_targetTypeIdentifiers;
}

- (unint64_t)numberOfBaskets
{
  return self->_numberOfBaskets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_eventInterval, 0);
  objc_storeStrong((id *)&self->_miningDate, 0);
}

@end
