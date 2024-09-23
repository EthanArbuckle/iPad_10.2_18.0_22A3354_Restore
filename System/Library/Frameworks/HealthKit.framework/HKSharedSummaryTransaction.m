@implementation HKSharedSummaryTransaction

- (HKSharedSummaryTransaction)initWithUUID:(id)a3 sourceDeviceIdentifier:(id)a4 metadata:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKSharedSummaryTransaction *v12;
  HKSharedSummaryTransaction *v13;
  uint64_t v14;
  NSString *sourceDeviceIdentifier;
  uint64_t v16;
  NSDictionary *metadata;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKSharedSummaryTransaction;
  v12 = -[HKSharedSummaryTransaction init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_UUID, a3);
    v14 = objc_msgSend(v10, "copy");
    sourceDeviceIdentifier = v13->_sourceDeviceIdentifier;
    v13->_sourceDeviceIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    metadata = v13->_metadata;
    v13->_metadata = (NSDictionary *)v16;

  }
  return v13;
}

- (void)addMetadata:(id)a3
{
  NSDictionary *metadata;
  id v5;
  NSDictionary *v6;
  NSDictionary *v7;

  metadata = self->_metadata;
  v5 = a3;
  v6 = (NSDictionary *)-[NSDictionary mutableCopy](metadata, "mutableCopy");
  -[NSDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v5);

  v7 = self->_metadata;
  self->_metadata = v6;

}

- (void)_setSourceDeviceIdentifier:(id)a3
{
  NSString *v4;
  NSString *sourceDeviceIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sourceDeviceIdentifier = self->_sourceDeviceIdentifier;
  self->_sourceDeviceIdentifier = v4;

}

- (void)_setCreationDate:(id)a3
{
  NSDate *v4;
  NSDate *creationDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  creationDate = self->_creationDate;
  self->_creationDate = v4;

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p UUID=%@, source device=%@"), v5, self, self->_UUID, self->_sourceDeviceIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_creationDate)
  {
    if (description_onceToken != -1)
      dispatch_once(&description_onceToken, &__block_literal_global_110);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)description_formatter, "stringFromDate:", self->_creationDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR(" creation date=%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@%@>"), v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@>"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __41__HKSharedSummaryTransaction_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)description_formatter;
  description_formatter = (uint64_t)v0;

  return objc_msgSend((id)description_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_UUID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKSharedSummaryTransaction *v4;
  NSUUID *UUID;
  void *v6;
  char v7;

  v4 = (HKSharedSummaryTransaction *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      UUID = self->_UUID;
      -[HKSharedSummaryTransaction UUID](v4, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSUUID isEqual:](UUID, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceDeviceIdentifier, CFSTR("SourceDeviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));

}

- (HKSharedSummaryTransaction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HKSharedSummaryTransaction *v12;
  HKSharedSummaryTransaction *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceDeviceIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9, v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Metadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HKSharedSummaryTransaction initWithUUID:sourceDeviceIdentifier:metadata:](self, "initWithUUID:sourceDeviceIdentifier:metadata:", v5, v6, v11);
  v13 = v12;
  if (v12 && v7)
    -[HKSharedSummaryTransaction _setCreationDate:](v12, "_setCreationDate:", v7);

  return v13;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)sourceDeviceIdentifier
{
  return self->_sourceDeviceIdentifier;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_sourceDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
