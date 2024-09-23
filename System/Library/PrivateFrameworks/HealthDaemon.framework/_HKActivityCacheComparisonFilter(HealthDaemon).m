@implementation _HKActivityCacheComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "operatorType");
  v2 = HDSQLiteComparisonTypeForPredicateOperator();
  v3 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1, "cacheIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:value:comparisonType:", CFSTR("cache_index"), v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)filterIgnoringActivityCacheIndexFilter
{
  return objc_msgSend(MEMORY[0x1E0CB6F20], "trueFilter");
}

@end
