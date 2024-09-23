@implementation _HKActivitySummaryComparisonFilter(HealthDaemon)

- (uint64_t)predicateWithProfile:()HealthDaemon
{
  return objc_msgSend(MEMORY[0x1E0D29890], "truePredicate");
}

@end
