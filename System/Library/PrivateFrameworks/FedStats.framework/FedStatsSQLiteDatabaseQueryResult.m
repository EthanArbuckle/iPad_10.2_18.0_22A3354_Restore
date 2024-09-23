@implementation FedStatsSQLiteDatabaseQueryResult

- (FedStatsSQLiteDatabaseQueryResult)initWithQueryStatement:(sqlite3_stmt *)a3
{
  FedStatsSQLiteDatabaseQueryResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FedStatsSQLiteDatabaseQueryResult;
  result = -[FedStatsSQLiteDatabaseQueryResult init](&v5, sel_init);
  if (result)
    result->_queryStatement = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  sqlite3_finalize(-[FedStatsSQLiteDatabaseQueryResult queryStatement](self, "queryStatement"));
  v3.receiver = self;
  v3.super_class = (Class)FedStatsSQLiteDatabaseQueryResult;
  -[FedStatsSQLiteDatabaseQueryResult dealloc](&v3, sel_dealloc);
}

- (id)next
{
  int v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (sqlite3_step(-[FedStatsSQLiteDatabaseQueryResult queryStatement](self, "queryStatement")) == 100)
  {
    v3 = sqlite3_column_count(-[FedStatsSQLiteDatabaseQueryResult queryStatement](self, "queryStatement"));
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 >= 1)
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = v6;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_name(-[FedStatsSQLiteDatabaseQueryResult queryStatement](self, "queryStatement"), v5));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = sqlite3_column_type(-[FedStatsSQLiteDatabaseQueryResult queryStatement](self, "queryStatement"), v5);
        if ((v8 - 3) < 2)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(-[FedStatsSQLiteDatabaseQueryResult queryStatement](self, "queryStatement"), v5));
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else if (v8 == 2)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", sqlite3_column_double(-[FedStatsSQLiteDatabaseQueryResult queryStatement](self, "queryStatement"), v5));
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v8 == 1)
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", sqlite3_column_int(-[FedStatsSQLiteDatabaseQueryResult queryStatement](self, "queryStatement"), v5));
          else
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        v10 = (void *)v9;
        objc_msgSend(v4, "setObject:forKey:", v9, v6);

        ++v5;
      }
      while (v3 != v5);

    }
    v11 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (sqlite3_stmt)queryStatement
{
  return self->_queryStatement;
}

- (void)setQueryStatement:(sqlite3_stmt *)a3
{
  self->_queryStatement = a3;
}

@end
