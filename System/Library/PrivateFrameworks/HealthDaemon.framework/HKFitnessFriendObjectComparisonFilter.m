@implementation HKFitnessFriendObjectComparisonFilter

id __79___HKFitnessFriendObjectComparisonFilter_HealthDaemon___predicateForFriendUUID__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDFitnessFriendWorkoutEntityEntityPredicateForFriendUUID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
