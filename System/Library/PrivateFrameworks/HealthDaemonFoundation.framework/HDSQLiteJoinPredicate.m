@implementation HDSQLiteJoinPredicate

+ (id)predicateWithJoinClauses:(id)a3
{
  id v3;
  HDSQLiteJoinPredicate *v4;
  uint64_t v5;
  NSSet *joinClauses;

  v3 = a3;
  v4 = objc_alloc_init(HDSQLiteJoinPredicate);
  v5 = objc_msgSend(v3, "copy");

  joinClauses = v4->_joinClauses;
  v4->_joinClauses = (NSSet *)v5;

  return v4;
}

- (NSSet)joinClauses
{
  return self->_joinClauses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinClauses, 0);
}

@end
