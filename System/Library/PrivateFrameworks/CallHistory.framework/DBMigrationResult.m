@implementation DBMigrationResult

- (DBMigrationResult)initWithErrorCode:(int64_t)a3 andDBVersion:(int64_t)a4
{
  DBMigrationResult *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DBMigrationResult;
  result = -[DBMigrationResult init](&v7, sel_init);
  if (result)
  {
    result->_errorCode = a3;
    result->_dbVersion = a4;
  }
  return result;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (int64_t)dbVersion
{
  return self->_dbVersion;
}

- (void)setDbVersion:(int64_t)a3
{
  self->_dbVersion = a3;
}

@end
