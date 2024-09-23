@implementation NSCalendar(HDDeletedObjectEntityPredicates)

- (id)hd_predicateForDeletedObjectsCreatedBeforeDate:()HDDeletedObjectEntityPredicates minusDays:
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "hk_dateBySubtractingDays:fromDate:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDDeletedObjectPredicateForDeletionDate(3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hd_predicateForDeletedObjectsCreatedOnOrAfterDate:()HDDeletedObjectEntityPredicates minusDays:
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "hk_dateBySubtractingDays:fromDate:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDDeletedObjectPredicateForDeletionDate(6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
