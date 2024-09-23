@implementation CCDatabaseOnConflict

+ (CCDatabaseOnConflict)onConflictWithType:(int64_t)a3
{
  return -[CCDatabaseOnConflict initWithType:]([CCDatabaseOnConflict alloc], "initWithType:", a3);
}

- (CCDatabaseOnConflict)initWithType:(int64_t)a3
{
  CCDatabaseOnConflict *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCDatabaseOnConflict;
  result = -[CCDatabaseOnConflict init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (int64_t)type
{
  return self->_type;
}

@end
