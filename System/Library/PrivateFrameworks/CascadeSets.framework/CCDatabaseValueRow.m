@implementation CCDatabaseValueRow

- (unint64_t)count
{
  return -[NSArray count](self->_databaseValueArray, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseValueArray, 0);
}

- (CCDatabaseValueRow)initWithDatabaseValueArray:(id)a3
{
  id v5;
  CCDatabaseValueRow *v6;
  CCDatabaseValueRow *v7;
  NSArray *databaseValueArray;
  CCDatabaseValueRow *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCDatabaseValueRow;
  v6 = -[CCDatabaseValueRow init](&v11, sel_init);
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_databaseValueArray, a3), (databaseValueArray = v7->_databaseValueArray) != 0)
    && -[NSArray count](databaseValueArray, "count"))
  {
    v9 = v7;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)numberValueAtColumnIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndex:](self->_databaseValueArray, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseValue_toNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)stringValueAtColumnIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndex:](self->_databaseValueArray, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseValue_toString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CCDatabaseValueRow)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  return -[NSArray description](self->_databaseValueArray, "description");
}

- (id)dataValueAtColumnIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndex:](self->_databaseValueArray, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseValue_toData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
