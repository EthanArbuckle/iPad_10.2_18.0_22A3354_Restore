@implementation HKIdentifierConceptSelection(HDSQLitePredicate)

- (id)predicateWithProfile:()HDSQLitePredicate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HDSimpleGraphDatabaseNodeEntityPredicateForIdentifier(objc_msgSend(v1, "rawIdentifier"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
