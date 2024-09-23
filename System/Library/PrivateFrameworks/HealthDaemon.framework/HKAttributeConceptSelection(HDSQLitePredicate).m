@implementation HKAttributeConceptSelection(HDSQLitePredicate)

- (id)predicateWithProfile:()HDSQLitePredicate
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  HDSimpleGraphDatabaseNodeEntityPredicateForAttributeType(objc_msgSend(a1, "type"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "operatorType");
  v4 = HDSQLiteComparisonTypeForPredicateOperator();
  HDSimpleGraphDatabaseNodeEntityPredicateForAttributeValue(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D29840];
  v10[0] = v2;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateMatchingAllPredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
