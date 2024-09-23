@implementation NSDate(MADProcessingStatus)

- (uint64_t)mad_nextAttemptDateForStatus:()MADProcessingStatus attempts:
{
  unint64_t v4;
  BOOL v5;
  unint64_t v6;

  v4 = a4 - 1;
  v5 = a3 == 7 || a3 == 2;
  v6 = 5;
  if (v5)
    v6 = 3;
  if (v4 >= v6)
    LOBYTE(v4) = v6;
  return objc_msgSend(a1, "dateByAddingTimeInterval:", (double)(unint64_t)(VCPBaseRetryIntervalSeconds() << (3 * v4)));
}

@end
