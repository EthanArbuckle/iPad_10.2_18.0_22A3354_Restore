@implementation CCDatabaseDelete

+ (id)builderWithTableName:(id)a3
{
  id v3;
  CCDatabaseDeleteBuilder *v4;

  v3 = a3;
  v4 = -[CCDatabaseCommandBuilder initWithTableName:]([CCDatabaseDeleteBuilder alloc], "initWithTableName:", v3);

  return v4;
}

@end
