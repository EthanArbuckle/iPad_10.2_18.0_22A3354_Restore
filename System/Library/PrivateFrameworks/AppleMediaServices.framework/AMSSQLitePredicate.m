@implementation AMSSQLitePredicate

- (id)SQLForEntityClass:(Class)a3
{
  return 0;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  return 0;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();

  return v4 == v5;
}

@end
