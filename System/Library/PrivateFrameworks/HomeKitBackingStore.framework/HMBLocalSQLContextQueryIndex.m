@implementation HMBLocalSQLContextQueryIndex

- (HMBLocalSQLContextQueryIndex)initWithColumns:(id)a3
{
  id v5;
  HMBLocalSQLContextQueryIndex *v6;
  HMBLocalSQLContextQueryIndex *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMBLocalSQLContextQueryIndex;
  v6 = -[HMBLocalSQLContextQueryIndex init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_columns, a3);

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMBLocalSQLContextQueryIndex columns](self, "columns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[%@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
