@implementation HMBLocalSQLContextQueryTable

- (HMBLocalSQLContextQueryTable)initWithColumnNames:(id)a3
{
  id v5;
  HMBLocalSQLContextQueryTable *v6;
  HMBLocalSQLContextQueryTable *v7;
  uint64_t v8;
  NSMutableDictionary *mutableIndexes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBLocalSQLContextQueryTable;
  v6 = -[HMBLocalSQLContextQueryTable init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_columnNames, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    mutableIndexes = v7->_mutableIndexes;
    v7->_mutableIndexes = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (NSDictionary)indexes
{
  void *v2;
  void *v3;

  -[HMBLocalSQLContextQueryTable mutableIndexes](self, "mutableIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMBLocalSQLContextQueryTable columnNames](self, "columnNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalSQLContextQueryTable mutableIndexes](self, "mutableIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, %@>"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)columnNames
{
  return self->_columnNames;
}

- (NSMutableDictionary)mutableIndexes
{
  return self->_mutableIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableIndexes, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
}

@end
