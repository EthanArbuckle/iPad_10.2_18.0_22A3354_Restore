@implementation NSSQLWhereIntermediate

- (NSSQLWhereIntermediate)initWithPredicate:(id)a3 inScope:(id)a4
{
  NSSQLWhereIntermediate *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSSQLWhereIntermediate;
  result = -[NSSQLIntermediate initWithScope:](&v6, sel_initWithScope_, a4);
  if (result)
    result->_predicate = (NSPredicate *)a3;
  return result;
}

@end
