@implementation BLBookletMigrationInfo

- (BLBookletMigrationInfo)initWithStoreID:(int64_t)a3 migrationState:(int64_t)a4
{
  BLBookletMigrationInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLBookletMigrationInfo;
  result = -[BLBookletMigrationInfo init](&v7, sel_init);
  if (result)
  {
    result->_migrationState = a4;
    result->_storeID = a3;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p storeID=%lld; migrationState=%lld>"),
    v5,
    self,
    -[BLBookletMigrationInfo storeID](self, "storeID"),
    -[BLBookletMigrationInfo migrationState](self, "migrationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLBookletMigrationInfo)initWithCoder:(id)a3
{
  id v4;
  BLBookletMigrationInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLBookletMigrationInfo;
  v5 = -[BLBookletMigrationInfo init](&v11, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("migrationState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_migrationState = objc_msgSend(v7, "longLongValue");

    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_storeID = objc_msgSend(v9, "longLongValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[BLBookletMigrationInfo migrationState](self, "migrationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("migrationState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BLBookletMigrationInfo storeID](self, "storeID"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("storeID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  if (v4)
  {
    objc_msgSend(v4, "setMigrationState:", -[BLBookletMigrationInfo migrationState](self, "migrationState"));
    objc_msgSend(v4, "setStoreID:", -[BLBookletMigrationInfo storeID](self, "storeID"));
  }
  return v4;
}

- (int64_t)migrationState
{
  return self->_migrationState;
}

- (void)setMigrationState:(int64_t)a3
{
  self->_migrationState = a3;
}

- (int64_t)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(int64_t)a3
{
  self->_storeID = a3;
}

@end
