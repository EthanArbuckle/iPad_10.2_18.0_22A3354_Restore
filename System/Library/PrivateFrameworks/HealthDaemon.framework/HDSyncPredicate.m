@implementation HDSyncPredicate

- (HDSyncPredicate)initWithExcludedSyncProvenances:(id)a3 dateInterval:(id)a4 includedObjectTypes:(id)a5 defaultMaximumObjectAge:(id)a6 defaultMaximumTombstoneAge:(id)a7 maximumObjectAgeByType:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HDSyncPredicate *v20;
  uint64_t v21;
  NSSet *excludedSyncProvenances;
  uint64_t v23;
  NSDateInterval *dateInterval;
  uint64_t v25;
  NSSet *includedObjectTypes;
  uint64_t v27;
  NSNumber *defaultMaximumObjectAge;
  uint64_t v29;
  NSNumber *defaultMaximumTombstoneAge;
  uint64_t v31;
  NSDictionary *maximumObjectAgeByType;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HDSyncPredicate;
  v20 = -[HDSyncPredicate init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    excludedSyncProvenances = v20->_excludedSyncProvenances;
    v20->_excludedSyncProvenances = (NSSet *)v21;

    v23 = objc_msgSend(v15, "copy");
    dateInterval = v20->_dateInterval;
    v20->_dateInterval = (NSDateInterval *)v23;

    v25 = objc_msgSend(v16, "copy");
    includedObjectTypes = v20->_includedObjectTypes;
    v20->_includedObjectTypes = (NSSet *)v25;

    v27 = objc_msgSend(v17, "copy");
    defaultMaximumObjectAge = v20->_defaultMaximumObjectAge;
    v20->_defaultMaximumObjectAge = (NSNumber *)v27;

    v29 = objc_msgSend(v18, "copy");
    defaultMaximumTombstoneAge = v20->_defaultMaximumTombstoneAge;
    v20->_defaultMaximumTombstoneAge = (NSNumber *)v29;

    v31 = objc_msgSend(v19, "copy");
    maximumObjectAgeByType = v20->_maximumObjectAgeByType;
    v20->_maximumObjectAgeByType = (NSDictionary *)v31;

  }
  return v20;
}

- (id)maximumObjectAgeForType:(id)a3
{
  void *defaultMaximumObjectAge;
  void *v5;
  id v6;

  -[NSDictionary objectForKeyedSubscript:](self->_maximumObjectAgeByType, "objectForKeyedSubscript:", a3);
  defaultMaximumObjectAge = (void *)objc_claimAutoreleasedReturnValue();
  v5 = defaultMaximumObjectAge;
  if (!defaultMaximumObjectAge)
    defaultMaximumObjectAge = self->_defaultMaximumObjectAge;
  v6 = defaultMaximumObjectAge;

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSSet hash](self->_excludedSyncProvenances, "hash");
  v4 = -[NSDateInterval hash](self->_dateInterval, "hash") ^ v3;
  v5 = -[NSSet hash](self->_includedObjectTypes, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_defaultMaximumObjectAge, "hash");
  v7 = -[NSNumber hash](self->_defaultMaximumTombstoneAge, "hash");
  return v6 ^ v7 ^ -[NSDictionary hash](self->_maximumObjectAgeByType, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSSet *excludedSyncProvenances;
  NSSet *v6;
  NSDateInterval *dateInterval;
  NSDateInterval *v8;
  NSSet *includedObjectTypes;
  NSSet *v10;
  NSNumber *defaultMaximumObjectAge;
  NSNumber *v12;
  NSNumber *defaultMaximumTombstoneAge;
  NSNumber *v14;
  NSDictionary *maximumObjectAgeByType;
  NSDictionary *v16;
  char v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_20;
  excludedSyncProvenances = self->_excludedSyncProvenances;
  v6 = (NSSet *)v4[1];
  if (excludedSyncProvenances != v6 && (!v6 || !-[NSSet isEqual:](excludedSyncProvenances, "isEqual:")))
    goto LABEL_20;
  dateInterval = self->_dateInterval;
  v8 = (NSDateInterval *)v4[2];
  if (dateInterval != v8 && (!v8 || !-[NSDateInterval isEqual:](dateInterval, "isEqual:")))
    goto LABEL_20;
  includedObjectTypes = self->_includedObjectTypes;
  v10 = (NSSet *)v4[3];
  if (includedObjectTypes != v10 && (!v10 || !-[NSSet isEqual:](includedObjectTypes, "isEqual:")))
    goto LABEL_20;
  defaultMaximumObjectAge = self->_defaultMaximumObjectAge;
  v12 = (NSNumber *)v4[4];
  if (defaultMaximumObjectAge != v12
    && (!v12 || !-[NSNumber isEqual:](defaultMaximumObjectAge, "isEqual:")))
  {
    goto LABEL_20;
  }
  defaultMaximumTombstoneAge = self->_defaultMaximumTombstoneAge;
  v14 = (NSNumber *)v4[5];
  if (defaultMaximumTombstoneAge != v14
    && (!v14 || !-[NSNumber isEqual:](defaultMaximumTombstoneAge, "isEqual:")))
  {
    goto LABEL_20;
  }
  maximumObjectAgeByType = self->_maximumObjectAgeByType;
  v16 = (NSDictionary *)v4[6];
  if (maximumObjectAgeByType == v16)
  {
    v17 = 1;
    goto LABEL_21;
  }
  if (v16)
    v17 = -[NSDictionary isEqual:](maximumObjectAgeByType, "isEqual:");
  else
LABEL_20:
    v17 = 0;
LABEL_21:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *excludedSyncProvenances;
  id v5;

  excludedSyncProvenances = self->_excludedSyncProvenances;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", excludedSyncProvenances, CFSTR("hdsp_esp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("hdsp_interval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_includedObjectTypes, CFSTR("hdsp_types"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultMaximumObjectAge, CFSTR("hdsp_oage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultMaximumTombstoneAge, CFSTR("hdsp_tage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximumObjectAgeByType, CFSTR("hdsp_ages"));

}

- (HDSyncPredicate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HDSyncPredicate *v16;
  HDSyncPredicate *v18;
  HDSyncPredicate *v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("hdsp_esp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v18 = [HDSyncPredicate alloc];
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hdsp_interval"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self;
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("hdsp_types"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hdsp_oage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hdsp_tage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "hk_typesForDictionaryMapping:to:", v13, objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("hdsp_ages"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HDSyncPredicate initWithExcludedSyncProvenances:dateInterval:includedObjectTypes:defaultMaximumObjectAge:defaultMaximumTombstoneAge:maximumObjectAgeByType:](v18, "initWithExcludedSyncProvenances:dateInterval:includedObjectTypes:defaultMaximumObjectAge:defaultMaximumTombstoneAge:maximumObjectAgeByType:", v6, v7, v9, v10, v11, v15);

    self = v19;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSSet)excludedSyncProvenances
{
  return self->_excludedSyncProvenances;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSSet)includedObjectTypes
{
  return self->_includedObjectTypes;
}

- (NSNumber)defaultMaximumObjectAge
{
  return self->_defaultMaximumObjectAge;
}

- (NSNumber)defaultMaximumTombstoneAge
{
  return self->_defaultMaximumTombstoneAge;
}

- (NSDictionary)maximumObjectAgeByType
{
  return self->_maximumObjectAgeByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumObjectAgeByType, 0);
  objc_storeStrong((id *)&self->_defaultMaximumTombstoneAge, 0);
  objc_storeStrong((id *)&self->_defaultMaximumObjectAge, 0);
  objc_storeStrong((id *)&self->_includedObjectTypes, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_excludedSyncProvenances, 0);
}

@end
