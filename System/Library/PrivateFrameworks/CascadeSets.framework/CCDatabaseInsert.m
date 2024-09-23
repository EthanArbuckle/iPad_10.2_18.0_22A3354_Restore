@implementation CCDatabaseInsert

+ (id)builderWithTableName:(id)a3 columnNames:(id)a4
{
  id v5;
  id v6;
  CCDatabaseInsertBuilder *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CCDatabaseInsertBuilder initWithTableName:columnNames:]([CCDatabaseInsertBuilder alloc], "initWithTableName:columnNames:", v6, v5);

  return v7;
}

@end
