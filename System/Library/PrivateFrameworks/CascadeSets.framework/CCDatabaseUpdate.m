@implementation CCDatabaseUpdate

+ (id)builderWithTableName:(id)a3
{
  id v3;
  CCDatabaseUpdateBuilder *v4;

  v3 = a3;
  v4 = -[CCDatabaseUpdateBuilder initWithTableName:]([CCDatabaseUpdateBuilder alloc], "initWithTableName:", v3);

  return v4;
}

@end
