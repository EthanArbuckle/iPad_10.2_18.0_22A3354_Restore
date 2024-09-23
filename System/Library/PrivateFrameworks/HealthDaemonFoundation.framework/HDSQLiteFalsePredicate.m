@implementation HDSQLiteFalsePredicate

- (id)SQLForEntityClass:(Class)a3
{
  return CFSTR("(1=0)");
}

@end
