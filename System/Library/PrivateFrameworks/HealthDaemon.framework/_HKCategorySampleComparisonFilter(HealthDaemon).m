@implementation _HKCategorySampleComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "operatorType");
  v2 = HDSQLiteComparisonTypeForPredicateOperator();
  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDCategorySampleEntityPredicateForValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
