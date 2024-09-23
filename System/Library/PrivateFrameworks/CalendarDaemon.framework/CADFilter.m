@implementation CADFilter

- (BOOL)validate
{
  return 0;
}

- (BOOL)applicableToEntityType:(int)a3
{
  return 0;
}

- (id)extendWhereClause:(id)a3 usingOperation:(int64_t)a4 withValues:(id)a5 andTypes:(id)a6
{
  return a3;
}

- (CADFilter)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CADFilter;
  return -[CADFilter init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
