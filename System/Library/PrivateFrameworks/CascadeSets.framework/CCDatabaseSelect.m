@implementation CCDatabaseSelect

+ (id)builderWithTableName:(id)a3
{
  id v3;
  CCDatabaseSelectBuilder *v4;

  v3 = a3;
  v4 = -[CCDatabaseSelectBuilder initWithTableName:]([CCDatabaseSelectBuilder alloc], "initWithTableName:", v3);

  return v4;
}

- (void)addLimit:(unint64_t)a3 offset:(unint64_t)a4
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandGenerator addLimit:offset:forSelect:](CCSQLCommandGenerator, "addLimit:offset:forSelect:", v7, v6, self);

}

- (void)replaceOffset:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CCSQLCommandGenerator replaceOffset:forSelect:](CCSQLCommandGenerator, "replaceOffset:forSelect:", v4, self);

}

@end
