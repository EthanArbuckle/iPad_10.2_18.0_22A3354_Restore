@implementation _DPPrivacyBudgetRecord

- (_DPPrivacyBudgetRecord)init
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return -[_DPPrivacyBudgetRecord initWithKey:creationDate:lastUpdate:balance:cohortAggregateBalance:objectId:](self, "initWithKey:creationDate:lastUpdate:balance:cohortAggregateBalance:objectId:", CFSTR("com.apple.DifferentialPrivacy.default"), 0, 0, v5, v5, 0.0);
}

- (_DPPrivacyBudgetRecord)initWithKey:(id)a3 creationDate:(double)a4 lastUpdate:(double)a5 balance:(int64_t)a6 cohortAggregateBalance:(double)a7 objectId:(id)a8
{
  id v15;
  id v16;
  _DPPrivacyBudgetRecord *v17;
  _DPPrivacyBudgetRecord *v18;
  objc_super v20;

  v15 = a3;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)_DPPrivacyBudgetRecord;
  v17 = -[_DPPrivacyBudgetRecord init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_key, a3);
    v18->_creationDate = a4;
    v18->_lastUpdate = a5;
    v18->_balance = a6;
    v18->_cohortAggregateBalance = a7;
    v18->_submitted = 0;
    objc_storeStrong((id *)&v18->_objectId, a8);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPPrivacyBudgetRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  _DPPrivacyBudgetRecord *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cohortAggregateBalance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v17 = -[_DPPrivacyBudgetRecord initWithKey:creationDate:lastUpdate:balance:cohortAggregateBalance:objectId:](self, "initWithKey:creationDate:lastUpdate:balance:cohortAggregateBalance:objectId:", v5, v13, 0, v8, v11, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSManagedObjectID *objectId;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", self->_key, CFSTR("key"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("creationDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastUpdate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("lastUpdate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_balance);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("balance"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cohortAggregateBalance);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("cohortAggregateBalance"));

  objectId = self->_objectId;
  if (objectId)
    objc_msgSend(v9, "encodeObject:forKey:", objectId, CFSTR("objectId"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { key=%@ ; balance=%lld ; cohortAggregateBalance=%lf ;creationDate=%.16g ; lastUpdate=%.16g ; "),
    v5,
    self->_key,
    self->_balance,
    *(_QWORD *)&self->_cohortAggregateBalance,
    *(_QWORD *)&self->_creationDate,
    *(_QWORD *)&self->_lastUpdate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_objectId)
    objc_msgSend(v6, "appendFormat:", CFSTR("objectId=%@ }"), self->_objectId);
  else
    objc_msgSend(v6, "appendString:", CFSTR("objectId=(nil) }"));
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_DPPrivacyBudgetRecord key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPrivacyBudgetRecord creationDate](self, "creationDate");
  v7 = v6;
  -[_DPPrivacyBudgetRecord lastUpdate](self, "lastUpdate");
  v9 = v8;
  v10 = -[_DPPrivacyBudgetRecord balance](self, "balance");
  -[_DPPrivacyBudgetRecord cohortAggregateBalance](self, "cohortAggregateBalance");
  v12 = v11;
  -[_DPPrivacyBudgetRecord objectId](self, "objectId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithKey:creationDate:lastUpdate:balance:cohortAggregateBalance:objectId:", v5, v10, v13, v7, v9, v12);

  return v14;
}

- (BOOL)isEqualToPrivacyBudgetRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  int64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  char v26;
  void *v27;
  char v28;

  v4 = a3;
  if (v4)
  {
    -[_DPPrivacyBudgetRecord key](self, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    -[_DPPrivacyBudgetRecord creationDate](self, "creationDate");
    v9 = v8;
    objc_msgSend(v4, "creationDate");
    v11 = areEqualTimeIntervals(v9, v10);
    -[_DPPrivacyBudgetRecord lastUpdate](self, "lastUpdate");
    v13 = v12;
    objc_msgSend(v4, "lastUpdate");
    v15 = areEqualTimeIntervals(v13, v14);
    v16 = -[_DPPrivacyBudgetRecord balance](self, "balance");
    v17 = objc_msgSend(v4, "balance");
    -[_DPPrivacyBudgetRecord cohortAggregateBalance](self, "cohortAggregateBalance");
    v19 = v18;
    objc_msgSend(v4, "cohortAggregateBalance");
    v21 = vabdd_f64(v19, v20);
    -[_DPPrivacyBudgetRecord objectId](self, "objectId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[_DPPrivacyBudgetRecord objectId](self, "objectId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

    }
    else
    {
      objc_msgSend(v4, "objectId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v27 == 0;
    }
    v28 = v7 & v11 & v15;
    if (v16 != v17)
      v28 = 0;
    if (v21 >= 2.22044605e-16)
      v28 = 0;
    v26 = v28 & v25;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  _DPPrivacyBudgetRecord *v4;
  _DPPrivacyBudgetRecord *v5;
  BOOL v6;

  v4 = (_DPPrivacyBudgetRecord *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_DPPrivacyBudgetRecord isEqualToPrivacyBudgetRecord:](self, "isEqualToPrivacyBudgetRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  -[_DPPrivacyBudgetRecord key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_DPPrivacyBudgetRecord creationDate](self, "creationDate");
  v6 = v4 ^ (unint64_t)v5;
  -[_DPPrivacyBudgetRecord lastUpdate](self, "lastUpdate");
  v8 = v6 ^ (unint64_t)v7 ^ -[_DPPrivacyBudgetRecord balance](self, "balance");
  -[_DPPrivacyBudgetRecord objectId](self, "objectId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

+ (id)createRecordFromManagedObject:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v4, "copyFromManagedObject:", v3);

  if (v5)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

+ (id)entityName
{
  return CFSTR("PrivacyBudgetRecord");
}

- (id)entityName
{
  return (id)objc_msgSend((id)objc_opt_class(), "entityName");
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    -[_DPPrivacyBudgetRecord key](self, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKey:", v7);

    -[_DPPrivacyBudgetRecord creationDate](self, "creationDate");
    objc_msgSend(v6, "setCreationDate:");
    -[_DPPrivacyBudgetRecord lastUpdate](self, "lastUpdate");
    objc_msgSend(v6, "setLastUpdate:");
    objc_msgSend(v6, "setBalance:", -[_DPPrivacyBudgetRecord balance](self, "balance"));
    -[_DPPrivacyBudgetRecord cohortAggregateBalance](self, "cohortAggregateBalance");
    objc_msgSend(v6, "setCohortAggregateBalance:");
    -[_DPPrivacyBudgetRecord objectId](self, "objectId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      objc_msgSend(v6, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPPrivacyBudgetRecord setObjectId:](self, "setObjectId:", v10);

    }
  }

  return isKindOfClass & 1;
}

- (BOOL)copyFromManagedObject:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPPrivacyBudgetRecord setKey:](self, "setKey:", v7);

    objc_msgSend(v6, "creationDate");
    -[_DPPrivacyBudgetRecord setCreationDate:](self, "setCreationDate:");
    objc_msgSend(v6, "lastUpdate");
    -[_DPPrivacyBudgetRecord setLastUpdate:](self, "setLastUpdate:");
    -[_DPPrivacyBudgetRecord setBalance:](self, "setBalance:", objc_msgSend(v6, "balance"));
    objc_msgSend(v6, "cohortAggregateBalance");
    -[_DPPrivacyBudgetRecord setCohortAggregateBalance:](self, "setCohortAggregateBalance:");
    objc_msgSend(v6, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DPPrivacyBudgetRecord setObjectId:](self, "setObjectId:", v8);
  }

  return isKindOfClass & 1;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  self->_creationDate = a3;
}

- (double)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(double)a3
{
  self->_lastUpdate = a3;
}

- (int64_t)balance
{
  return self->_balance;
}

- (void)setBalance:(int64_t)a3
{
  self->_balance = a3;
}

- (double)cohortAggregateBalance
{
  return self->_cohortAggregateBalance;
}

- (void)setCohortAggregateBalance:(double)a3
{
  self->_cohortAggregateBalance = a3;
}

- (BOOL)submitted
{
  return self->_submitted;
}

- (void)setSubmitted:(BOOL)a3
{
  self->_submitted = a3;
}

- (NSManagedObjectID)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
  objc_storeStrong((id *)&self->_objectId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
