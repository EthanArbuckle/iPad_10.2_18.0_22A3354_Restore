@implementation SGSqliteWriteTransaction

- (SGSqliteWriteTransaction)initWithHandle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SGSqliteWriteTransaction;
  return -[SGSqliteReadTransaction initWithHandle:](&v4, sel_initWithHandle_, a3);
}

@end
