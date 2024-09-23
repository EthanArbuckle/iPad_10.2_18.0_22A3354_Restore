@implementation HDSleepScheduleEntityPredicateForWeekday

id __HDSleepScheduleEntityPredicateForWeekday_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D29838];
  _PropertyForWeekday(objc_msgSend(a2, "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithProperty:value:comparisonType:", v3, MEMORY[0x1E0C9AAA0], 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
